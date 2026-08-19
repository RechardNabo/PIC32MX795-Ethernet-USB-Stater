/*******************************************************************************
  Web IoT Dashboard Module Source File

  File Name:
    dashboard.c

  Summary:
  Lightweight embedded HTTP dashboard for the PIC32 Ethernet Starter Kit.

  Description:
  A small single-page app served over HTTP/1.0, with three routes:

    GET /            -> the SPA shell: left-hand tab nav (Overview, MCU
                         Resources, Console, Config) plus the CSS and JS
                         that drive it. Entirely a compile-time constant
                         string (flash/.rodata) — no RAM cost, and it
                         doesn't change at runtime, so there's no reason
                         to render it.
    GET /api/status  -> a small JSON object with everything that DOES
                         change at runtime: link/IP/uptime/frame counters,
                         switch/LED state, RAM/heap/stack/CPU estimates,
                         and a tail of the USB CDC console's recent output.
                         The page's JS polls this every ~1.5s and updates
                         the DOM in place — no full reloads.
    GET /cmd?cmd=... -> applies a LED control command (same "?cmd="
                         convention as before) and returns a tiny ack;
                         the page's JS re-polls /api/status right after.

  Sending is spread across multiple Dashboard_Tasks() calls: the TCP TX
  window can fill up before a whole segment is queued, so each segment
  tracks how much of itself has been queued so far and keeps retrying on
  subsequent calls until it's all been handed to the stack. Disconnecting
  before that point would silently drop the rest of the segment, which is
  what caused an earlier revision of this page to arrive truncated.

  RAM budget note: this target's RAM is already heavily committed to the
  TCP/IP stack, USB, and crypto buffers, leaving very little headroom for
  the C call stack. The SPA shell and the JSON's fixed scaffolding are
  therefore kept as flash-resident string literals wherever possible;
  only the actual dynamic values (a few hundred bytes at most) are ever
  rendered into a RAM buffer, and that buffer is reused (never held
  concurrently) across the JSON body and the console-tail copy.
******************************************************************************/

#include "dashboard.h"
#include "definitions.h"
#include "ethernet.h"
#include "console.h"
#include "main.h"
#include <stdio.h>
#include <string.h>

/* --------------------------------------------------------------------------
   Static content (flash/.rodata — no RAM cost)
   -------------------------------------------------------------------------- */

/* The whole single-page app: HTML + CSS + JS. Nothing in here changes at
   runtime, so it's sent byte-for-byte from flash; only /api/status
   carries live data. */
static const char DASH_SHELL[] =
    "HTTP/1.0 200 OK\r\n"
    "Content-Type: text/html\r\n"
    "Connection: close\r\n"
    "\r\n"
    "<!DOCTYPE html><html><head><title>PIC32 IoT Dashboard</title>"
    "<meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">"
    "<style>"
    "*{box-sizing:border-box}"
    "body{background:#0f172a;color:#e2e8f0;font-family:Arial,sans-serif;margin:0}"
    "h1{margin:0 0 12px;font-size:20px}"
    ".app{display:flex;min-height:100vh}"
    "nav{width:150px;flex:none;background:#111827;padding:16px 0;display:flex;flex-direction:column;gap:2px}"
    "nav button{background:none;border:none;color:#94a3b8;text-align:left;padding:10px 16px;"
    "font-size:13px;cursor:pointer;border-left:3px solid transparent}"
    "nav button.active{color:#e2e8f0;background:#1e293b;border-left-color:#38bdf8}"
    "main{flex:1;padding:18px;min-width:0}"
    ".page{display:none}"
    ".page.active{display:block}"
    "p.sub{color:#94a3b8;font-size:12px;margin:0 0 14px}"
    ".g{display:grid;grid-template-columns:repeat(auto-fit,minmax(140px,1fr));gap:8px}"
    ".c{background:#1e293b;border-radius:8px;padding:10px 12px}"
    ".c b{display:block;font-size:10px;color:#94a3b8;text-transform:uppercase;"
    "letter-spacing:.05em;margin-bottom:5px}"
    ".v{font-size:18px;font-weight:700;word-break:break-word}"
    ".u{color:#22c55e}.d{color:#ef4444}"
    ".r{margin-top:16px}"
    ".r a{background:#38bdf8;color:#082f49;padding:8px 12px;border-radius:6px;"
    "text-decoration:none;font-weight:700;font-size:12px;margin-right:6px;cursor:pointer}"
    "pre#consoleBox{background:#000;color:#4ade80;padding:10px;border-radius:8px;"
    "height:340px;overflow-y:auto;font-size:12px;white-space:pre-wrap;word-break:break-all;margin:0}"
    "table.cfg{border-collapse:collapse;font-size:13px}"
    "table.cfg td{padding:4px 10px;border-bottom:1px solid #1e293b}"
    "table.cfg td:first-child{color:#94a3b8}"
    "</style></head><body>"
    "<div class=\"app\">"
    "<nav>"
    "<button class=\"tab active\" data-tab=\"overview\">Overview</button>"
    "<button class=\"tab\" data-tab=\"mcu\">MCU Resources</button>"
    "<button class=\"tab\" data-tab=\"console\">Console</button>"
    "<button class=\"tab\" data-tab=\"config\">Config</button>"
    "</nav>"
    "<main>"
    "<section id=\"overview\" class=\"page active\">"
    "<h1>PIC32 Ethernet Starter Kit</h1>"
    "<p class=\"sub\">Live board status \u2014 updates automatically</p>"
    "<div class=\"g\" id=\"overviewGrid\"></div>"
    "<div class=\"r\">"
    "<a onclick=\"cmd('toggle')\">Toggle LEDs</a>"
    "<a onclick=\"cmd('mode')\">Cycle Mode</a>"
    "<a onclick=\"cmd('speed')\">Cycle Speed</a>"
    "</div>"
    "</section>"
    "<section id=\"mcu\" class=\"page\">"
    "<h1>MCU Resources</h1>"
    "<p class=\"sub\">RAM/heap/stack are exact; CPU load is a self-calibrated estimate (no RTOS idle task on this build)</p>"
    "<div class=\"g\" id=\"mcuGrid\"></div>"
    "</section>"
    "<section id=\"console\" class=\"page\">"
    "<h1>USB CDC Console</h1>"
    "<p class=\"sub\">Live tail of what the USB CDC terminal has shown, independent of whether a terminal is attached</p>"
    "<pre id=\"consoleBox\"></pre>"
    "</section>"
    "<section id=\"config\" class=\"page\">"
    "<h1>MCC / Build Configuration</h1>"
    "<p class=\"sub\">Compile-time features \u2014 fixed for this firmware image</p>"
    "<table class=\"cfg\">"
    "<tr><td>MCU</td><td>PIC32MX795F512L @ 80 MHz (FPLLIDIV=2, FPLLMUL=20, FPLLODIV=1)</td></tr>"
    "<tr><td>Ethernet MAC</td><td>PIC32 internal ETHMAC, RMII (FMIIEN=0)</td></tr>"
    "<tr><td>Ethernet PHY</td><td>DP83848, Auto-MDIX enabled</td></tr>"
    "<tr><td>TCP/IP modules</td><td>IPv4, ICMP, ARP, TCP, UDP, DNS Client/Server, Announce, Berkeley API</td></tr>"
    "<tr><td>DHCP Client</td><td>Disabled (static IP)</td></tr>"
    "<tr><td>USB</td><td>Full-Speed Device, CDC-ACM virtual COM console</td></tr>"
    "<tr><td>Timers</td><td>TMR2 = SYS_TIME (1ms base), TMR3 = LED tick (polled, no IRQ)</td></tr>"
    "<tr><td>Filesystem</td><td>SYS_FS + FAT registered (no media mounted)</td></tr>"
    "<tr><td>Crypto</td><td>wolfCrypt WCCB initialized</td></tr>"
    "<tr><td>RTOS</td><td>FreeRTOS linked, scheduler NOT started \u2014 bare-metal cooperative main loop</td></tr>"
    "<tr><td>Switches</td><td>SW1/SW2/SW3 (RD6/RD7/RD13), software-debounced</td></tr>"
    "<tr><td>LEDs</td><td>LED1-3, 3 display modes, 4 speed steps</td></tr>"
    "</table>"
    "</section>"
    "</main>"
    "</div>"
    "<script>"
    "function showTab(name){"
    "document.querySelectorAll('.page').forEach(function(p){p.classList.remove('active');});"
    "document.querySelectorAll('.tab').forEach(function(t){t.classList.remove('active');});"
    "document.getElementById(name).classList.add('active');"
    "document.querySelector('[data-tab=\"'+name+'\"]').classList.add('active');"
    "}"
    "document.querySelectorAll('.tab').forEach(function(t){"
    "t.addEventListener('click',function(){showTab(t.dataset.tab);});"
    "});"
    "function cmd(c){fetch('/cmd?cmd='+c).then(poll);}"
    "function card(label,value,cls){"
    "return '<div class=\"c\"><b>'+label+'</b><span class=\"v'+(cls?(' '+cls):'')+'\">'+value+'</span></div>';"
    "}"
    "function poll(){"
    "fetch('/api/status').then(function(r){return r.json();}).then(function(d){"
    "document.getElementById('overviewGrid').innerHTML="
    "card('Link',d.link?'ONLINE':'OFFLINE',d.link?'u':'d')+"
    "card('IP Address',d.ip)+"
    "card('Uptime',d.uptime+'s')+"
    "card('RX / TX Frames',d.rx+'/'+d.tx)+"
    "card('Switches 1 2 3',(d.sw1?'P':'-')+' '+(d.sw2?'P':'-')+' '+(d.sw3?'P':'-'))+"
    "card('LED Mode',d.ledMode)+"
    "card('LED Speed',d.speed+'ms')+"
    "card('All LEDs',d.allLeds?'ON':'off');"
    "document.getElementById('mcuGrid').innerHTML="
    "card('RAM Used',d.ramPct+'% ('+d.ramUsed+' / '+d.ramTotal+' B)')+"
    "card('Heap Reserved',d.heapReserved+' B')+"
    "card('Flash Used',d.flashPct+'% ('+d.flashUsed+' / '+d.flashTotal+' B)')+"
    "card('Approx Stack Used',d.stackUsed+' B')+"
    "card('Main Loop Rate',d.loopRate+' /s')+"
    "card('Est. CPU Load',d.cpuLoad+'%');"
    "var box=document.getElementById('consoleBox');"
    "var atBottom=Math.abs(box.scrollHeight-box.scrollTop-box.clientHeight)<12;"
    "box.textContent=d.console;"
    "if(atBottom){box.scrollTop=box.scrollHeight;}"
    "}).catch(function(){});"
    "}"
    "poll();"
    "setInterval(poll,1500);"
    "</script>"
    "</body></html>";

/* Static JSON response header (content-type differs from the shell's). */
static const char DASH_JSON_HEAD[] =
    "HTTP/1.0 200 OK\r\n"
    "Content-Type: application/json\r\n"
    "Connection: close\r\n"
    "\r\n";

/* Closes the JSON object opened by Dashboard_BuildJsonBody()'s trailing
   "console":" — the console value itself is streamed separately. */
static const char DASH_JSON_FOOT[] = "\"}";

/* Tiny static ack for /cmd — the page doesn't need HTML back, just
   something to resolve the fetch() promise before it re-polls status. */
static const char DASH_CMD_ACK[] =
    "HTTP/1.0 204 No Content\r\n"
    "Connection: close\r\n"
    "\r\n";

/* --------------------------------------------------------------------------
   Internal state
   -------------------------------------------------------------------------- */
static TCP_SOCKET g_dashSocket = INVALID_SOCKET;

typedef enum
{
    DASH_SEG_NONE = 0,
    DASH_SEG_SHELL,        /* GET /            -> DASH_SHELL (flash)        */
    DASH_SEG_JSON_HEAD,    /* GET /api/status  -> DASH_JSON_HEAD (flash)     */
    DASH_SEG_JSON_BODY,    /*                     dynamic fields (RAM)      */
    DASH_SEG_JSON_CONSOLE, /*                     escaped console tail      */
    DASH_SEG_JSON_FOOT,    /*                     DASH_JSON_FOOT (flash)    */
    DASH_SEG_CMD_ACK       /* GET /cmd?cmd=... -> DASH_CMD_ACK (flash)       */
} DashSegment;

static DashSegment  g_dashSeg     = DASH_SEG_NONE;

/* Generic flat-buffer segment cursor, used by every segment except
   DASH_SEG_JSON_CONSOLE (which streams with on-the-fly JSON escaping and
   so can't track progress as a simple byte count of the source). */
static const char  *g_dashSegData = NULL;
static size_t       g_dashSegLen  = 0U;
static size_t       g_dashSegSent = 0U;

/* Request buffer — only need the request line, headers are discarded. */
#define DASH_REQ_BUFFER_SIZE     64U

/* Scratch buffer shared (never concurrently) between:
     - rendering the dynamic JSON fields (DASH_SEG_JSON_BODY), and
     - holding the raw console-mirror copy just before streaming it out
       with escaping (DASH_SEG_JSON_CONSOLE).
   Worst case for the JSON fields is ~380 bytes (see dashboard.c commit
   history for the sizing math); sized with margin. Also comfortably
   covers a full CONSOLE_MIRROR_SIZE (512 byte) copy. */
#define DASH_SCRATCH_BUFFER_SIZE 640U
static char g_scratch[DASH_SCRATCH_BUFFER_SIZE];

/* Requested TX buffer size for the socket (default is only 512 bytes). */
#define DASH_TX_BUFFER_SIZE      1024U

/* Raw (unescaped) console tail + read cursor for DASH_SEG_JSON_CONSOLE. */
static size_t g_consoleRawLen = 0U;
static size_t g_consoleRawPos = 0U;

/* --------------------------------------------------------------------------
   Build the dynamic JSON fields (everything except the console tail) into
   g_scratch. Ends with the opening of the "console" string value so the
   escaped tail can be streamed directly after it. Returns the length.
   -------------------------------------------------------------------------- */
static size_t Dashboard_BuildJsonBody(void)
{
    char ipBuf[16];
    (void)Ethernet_GetIpString(ipBuf, sizeof(ipBuf));

    bool     linkUp    = Ethernet_IsLinkUp();
    uint32_t uptimeSec = Main_GetUptimeMs() / 1000U;

    uint32_t ramUsed    = Main_GetStaticRamUsedBytes();
    uint32_t ramTotal   = Main_GetRamTotalBytes();
    uint32_t ramPct     = (ramTotal > 0U) ? ((ramUsed * 100U) / ramTotal) : 0U;

    /* Flash usage isn't runtime-computable without a linker-exported
       "end of .text/.rodata" symbol (this linker script doesn't provide
       one) — reported as of the last build instead. Keep in sync with
       the map file if buffer sizes change meaningfully. */
    const uint32_t flashUsed  = 231176U;
    const uint32_t flashTotal = 532480U;
    uint32_t flashPct = (flashUsed * 100U) / flashTotal;

    #pragma GCC diagnostic push
    #pragma GCC diagnostic ignored "-Wformat-truncation"
    int len = snprintf(g_scratch, sizeof(g_scratch),
        "{\"link\":%d,\"ip\":\"%s\",\"uptime\":%lu,\"rx\":%u,\"tx\":%u,"
        "\"sw1\":%d,\"sw2\":%d,\"sw3\":%d,"
        "\"ledMode\":\"%s\",\"speed\":%lu,\"allLeds\":%d,"
        "\"ramUsed\":%lu,\"ramTotal\":%lu,\"ramPct\":%lu,\"heapReserved\":%lu,"
        "\"flashUsed\":%lu,\"flashTotal\":%lu,\"flashPct\":%lu,"
        "\"stackUsed\":%lu,\"loopRate\":%lu,\"cpuLoad\":%lu,"
        "\"console\":\"",
        linkUp ? 1 : 0,
        ipBuf,
        (unsigned long)uptimeSec,
        (unsigned)ETHFRMRXOK,
        (unsigned)ETHFRMTXOK,
        (SWITCH1_Get() == SWITCH1_STATE_PRESSED) ? 1 : 0,
        (SWITCH2_Get() == SWITCH1_STATE_PRESSED) ? 1 : 0,
        (SWITCH3_Get() == SWITCH1_STATE_PRESSED) ? 1 : 0,
        Main_GetLedModeName(),
        (unsigned long)Main_GetSpeedMs(),
        Main_GetAllLedsOn() ? 1 : 0,
        (unsigned long)ramUsed, (unsigned long)ramTotal, (unsigned long)ramPct,
        (unsigned long)Main_GetHeapReservedBytes(),
        (unsigned long)flashUsed, (unsigned long)flashTotal, (unsigned long)flashPct,
        (unsigned long)Main_GetApproxStackUsedBytes(),
        (unsigned long)Main_GetLoopRate(),
        (unsigned long)Main_GetCpuLoadPercent());
    #pragma GCC diagnostic pop

    if ((len < 0) || ((size_t)len >= sizeof(g_scratch)))
    {
        len = (int)sizeof(g_scratch) - 1;
    }

    return (size_t)len;
}

/* --------------------------------------------------------------------------
   Apply a simple "?cmd=" action parsed from the request line, if present.
   -------------------------------------------------------------------------- */
static void Dashboard_ApplyCommand(const char *reqLine)
{
    if (strstr(reqLine, "cmd=toggle") != NULL)
    {
        Main_ToggleAllLeds();
    }
    else if (strstr(reqLine, "cmd=mode") != NULL)
    {
        Main_CycleLedMode();
    }
    else if (strstr(reqLine, "cmd=speed") != NULL)
    {
        Main_CycleSpeed();
    }
}

/* --------------------------------------------------------------------------
   Point the segment cursor at the start of the given flat-buffer segment.
   Does not handle DASH_SEG_JSON_CONSOLE — see Dashboard_StartConsoleSeg().
   -------------------------------------------------------------------------- */
static void Dashboard_StartSegment(DashSegment seg)
{
    g_dashSeg     = seg;
    g_dashSegSent = 0U;

    switch (seg)
    {
        case DASH_SEG_SHELL:
            g_dashSegData = DASH_SHELL;
            g_dashSegLen  = sizeof(DASH_SHELL) - 1U;
            break;

        case DASH_SEG_JSON_HEAD:
            g_dashSegData = DASH_JSON_HEAD;
            g_dashSegLen  = sizeof(DASH_JSON_HEAD) - 1U;
            break;

        case DASH_SEG_JSON_BODY:
            g_dashSegLen  = Dashboard_BuildJsonBody();
            g_dashSegData = g_scratch;
            break;

        case DASH_SEG_JSON_FOOT:
            g_dashSegData = DASH_JSON_FOOT;
            g_dashSegLen  = sizeof(DASH_JSON_FOOT) - 1U;
            break;

        case DASH_SEG_CMD_ACK:
            g_dashSegData = DASH_CMD_ACK;
            g_dashSegLen  = sizeof(DASH_CMD_ACK) - 1U;
            break;

        default:
            g_dashSegData = NULL;
            g_dashSegLen  = 0U;
            break;
    }
}

/* Copies the console mirror tail into g_scratch (safe: the JSON_BODY
   segment that also uses g_scratch has already been fully queued to the
   stack by the time this runs) and resets the escaped-streaming cursor. */
static void Dashboard_StartConsoleSeg(void)
{
    g_dashSeg       = DASH_SEG_JSON_CONSOLE;
    g_consoleRawLen = (size_t)Console_MirrorCopy(g_scratch, sizeof(g_scratch));
    g_consoleRawPos = 0U;
}

/* --------------------------------------------------------------------------
   Queue as much of the current flat-buffer segment as the TX window
   currently allows, advancing g_dashSegSent. Safe to call repeatedly
   across main loop iterations. Returns true once fully queued.
   -------------------------------------------------------------------------- */
static bool Dashboard_SendSegment(TCP_SOCKET s)
{
    while (g_dashSegSent < g_dashSegLen)
    {
        uint16_t txReady = TCPIP_TCP_PutIsReady(s);
        if (txReady == 0U)
        {
            break;  /* TX window full — resume on a later call */
        }
        size_t chunk = g_dashSegLen - g_dashSegSent;
        if (chunk > (size_t)txReady)
        {
            chunk = (size_t)txReady;
        }
        uint16_t written = TCPIP_TCP_ArrayPut(s, (const uint8_t *)&g_dashSegData[g_dashSegSent], (uint16_t)chunk);
        if (written == 0U)
        {
            break;
        }
        g_dashSegSent += written;
    }
    (void)TCPIP_TCP_Flush(s);

    return (g_dashSegSent >= g_dashSegLen);
}

/* --------------------------------------------------------------------------
   Stream the raw console tail (g_scratch[0..g_consoleRawLen)) out as a
   JSON string body, escaping as required, one source byte at a time so
   an escape pair is never split across TCP writes. Returns true once the
   whole raw tail has been consumed.
   -------------------------------------------------------------------------- */
static bool Dashboard_SendConsoleEscaped(TCP_SOCKET s)
{
    while (g_consoleRawPos < g_consoleRawLen)
    {
        char c = g_scratch[g_consoleRawPos];

        /* Control characters we don't bother escaping to \uXXXX — drop
           CR (LF alone is enough for the <pre> to show a line break) and
           anything else below 0x20 (rare: null bytes, stray control
           codes from a misbehaving terminal input). */
        if (c == '\r')
        {
            g_consoleRawPos++;
            continue;
        }
        if ((unsigned char)c < 0x20)
        {
            g_consoleRawPos++;
            continue;
        }

        char     escaped[2];
        uint16_t escLen;
        if ((c == '"') || (c == '\\'))
        {
            escaped[0] = '\\';
            escaped[1] = c;
            escLen     = 2U;
        }
        else if (c == '\n')
        {
            escaped[0] = '\\';
            escaped[1] = 'n';
            escLen     = 2U;
        }
        else
        {
            escaped[0] = c;
            escLen     = 1U;
        }

        uint16_t txReady = TCPIP_TCP_PutIsReady(s);
        if (txReady < escLen)
        {
            break;  /* not enough room for this (possibly 2-byte) escape — resume later */
        }
        uint16_t written = TCPIP_TCP_ArrayPut(s, (const uint8_t *)escaped, escLen);
        if (written < escLen)
        {
            break;  /* shouldn't happen given the txReady check, but be safe */
        }
        g_consoleRawPos++;
    }
    (void)TCPIP_TCP_Flush(s);

    return (g_consoleRawPos >= g_consoleRawLen);
}

/* --------------------------------------------------------------------------
   Initialize the dashboard module
   -------------------------------------------------------------------------- */
void Dashboard_Initialize(void)
{
    g_dashSocket = INVALID_SOCKET;
    g_dashSeg    = DASH_SEG_NONE;
}

/* --------------------------------------------------------------------------
   Main task — call every iteration from the main loop
   -------------------------------------------------------------------------- */
void Dashboard_Tasks(void)
{
    if (g_dashSocket == INVALID_SOCKET)
    {
        g_dashSocket = TCPIP_TCP_ServerOpen(IP_ADDRESS_TYPE_IPV4, DASHBOARD_PORT, NULL);
        if (g_dashSocket != INVALID_SOCKET)
        {
            uint16_t txSize = DASH_TX_BUFFER_SIZE;
            (void)TCPIP_TCP_OptionsSet(g_dashSocket, TCP_OPTION_TX_BUFF, &txSize);
        }
        return;
    }

    /* Self-clearing reset semaphore; nothing to do, socket returns to
       listening state automatically for server sockets. */
    (void)TCPIP_TCP_WasReset(g_dashSocket);

    if (!TCPIP_TCP_IsConnected(g_dashSocket))
    {
        /* Connection gone (client closed, reset, or we haven't accepted
           one yet) — clear any in-progress send state so a stale
           in-flight send doesn't bleed into the next connection. */
        g_dashSeg = DASH_SEG_NONE;
        return;
    }

    /* If we're mid-response to the current connection, keep queuing
       whatever fits in the TX window this iteration, then move on to the
       next segment once the current one is fully queued. Don't
       disconnect until the final segment is done — disconnecting early
       is what silently truncated responses before. */
    if (g_dashSeg != DASH_SEG_NONE)
    {
        bool segDone;
        if (g_dashSeg == DASH_SEG_JSON_CONSOLE)
        {
            segDone = Dashboard_SendConsoleEscaped(g_dashSocket);
        }
        else
        {
            segDone = Dashboard_SendSegment(g_dashSocket);
        }

        if (segDone)
        {
            switch (g_dashSeg)
            {
                case DASH_SEG_JSON_HEAD:
                    Dashboard_StartSegment(DASH_SEG_JSON_BODY);
                    break;

                case DASH_SEG_JSON_BODY:
                    Dashboard_StartConsoleSeg();
                    break;

                case DASH_SEG_JSON_CONSOLE:
                    Dashboard_StartSegment(DASH_SEG_JSON_FOOT);
                    break;

                case DASH_SEG_SHELL:
                case DASH_SEG_JSON_FOOT:
                case DASH_SEG_CMD_ACK:
                default:
                    g_dashSeg = DASH_SEG_NONE;
                    (void)TCPIP_TCP_Disconnect(g_dashSocket);
                    break;
            }
        }
        return;
    }

    uint16_t rxReady = TCPIP_TCP_GetIsReady(g_dashSocket);
    if (rxReady == 0U)
    {
        return;  /* connected, but the request hasn't arrived yet */
    }

    static char reqBuf[DASH_REQ_BUFFER_SIZE];
    uint16_t toRead = rxReady;
    if (toRead > (uint16_t)(sizeof(reqBuf) - 1U))
    {
        toRead = (uint16_t)(sizeof(reqBuf) - 1U);
    }
    uint16_t n = TCPIP_TCP_ArrayGet(g_dashSocket, (uint8_t *)reqBuf, toRead);
    reqBuf[n] = '\0';

    /* Discard any remaining buffered bytes (request headers/body we don't need) */
    uint16_t remaining = TCPIP_TCP_GetIsReady(g_dashSocket);
    while (remaining > 0U)
    {
        uint8_t discard[64];
        uint16_t chunk = remaining;
        if (chunk > (uint16_t)sizeof(discard))
        {
            chunk = (uint16_t)sizeof(discard);
        }
        (void)TCPIP_TCP_ArrayGet(g_dashSocket, discard, chunk);
        remaining = TCPIP_TCP_GetIsReady(g_dashSocket);
    }

    /* Route on the request line. Order matters: check the specific
       routes before falling back to the SPA shell for everything else
       (including plain "GET / HTTP/1.1"). */
    if (strstr(reqBuf, "/api/status") != NULL)
    {
        Dashboard_StartSegment(DASH_SEG_JSON_HEAD);
    }
    else if (strstr(reqBuf, "cmd=") != NULL)
    {
        Dashboard_ApplyCommand(reqBuf);
        Dashboard_StartSegment(DASH_SEG_CMD_ACK);
    }
    else
    {
        Dashboard_StartSegment(DASH_SEG_SHELL);
    }
    /* The g_dashSeg branch above takes over from the next call (or
       immediately, if Dashboard_Tasks() is invoked again this same
       iteration) to queue the segment and whatever follows it. */
}
