/*******************************************************************************
  Web IoT Dashboard Module Source File

  File Name:
    dashboard.c

  Summary:
  Lightweight embedded HTTP dashboard for the PIC32 Ethernet Starter Kit.

  Description:
  Implements a minimal single-request HTTP/1.0 server: on each connection it
  reads the request line (ignoring headers), optionally applies a simple
  "?cmd=" action, then serves one self-contained HTML page built at runtime
  (no filesystem/MPFS dependency). The socket is then disconnected so the
  listening socket can accept the next request, matching how a browser
  issues one connection per page load/refresh.

  The page is sent as three segments instead of one giant buffer:
    HEAD - static HTTP header + <head>/<style>/<body> opening (string
           literal, lives in flash/.rodata, costs no RAM)
    BODY - the live status cards (IP, uptime, frame counters, etc.),
           the only part that actually needs to be rendered at runtime,
           built into a small RAM buffer
    FOOT - static closing markup + control buttons (also a flash literal)

  This keeps the RAM buffer small (this target's RAM is already heavily
  committed to the TCP/IP stack, USB, and crypto buffers) while still
  being able to serve a full page: earlier revisions tried to render the
  entire page into one buffer, which either needed a buffer bigger than
  the linker's available headroom, or silently truncated the page when
  the buffer was shrunk to fit.

  Sending itself is spread across multiple Dashboard_Tasks() calls: the
  TCP TX window can fill up before a whole segment is queued, so each
  segment tracks how much of itself has been queued so far and keeps
  retrying on subsequent calls until it's all been handed to the stack.
  Disconnecting before that point would silently drop the rest of the
  segment, which is what caused the page to arrive truncated in the
  browser previously.
******************************************************************************/

#include "dashboard.h"
#include "definitions.h"
#include "ethernet.h"
#include "main.h"
#include <stdio.h>
#include <string.h>

/* --------------------------------------------------------------------------
   Static page segments (flash/.rodata — no RAM cost)
   -------------------------------------------------------------------------- */
static const char DASH_HEAD[] =
    "HTTP/1.0 200 OK\r\n"
    "Content-Type: text/html\r\n"
    "Connection: close\r\n"
    "\r\n"
    "<!DOCTYPE html><html><head><title>PIC32 IoT Dashboard</title>"
    "<meta http-equiv=\"refresh\" content=\"3\">"
    "<meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">"
    "<style>"
    "body{background:#0f172a;color:#e2e8f0;font-family:Arial,sans-serif;margin:0;padding:18px}"
    "h1{margin:0;font-size:21px}"
    "p{color:#94a3b8;font-size:12px;margin:4px 0 14px}"
    ".g{display:grid;grid-template-columns:repeat(auto-fit,minmax(130px,1fr));gap:8px}"
    ".c{background:#1e293b;border-radius:8px;padding:10px 12px}"
    ".c b{display:block;font-size:10px;color:#94a3b8;"
    "text-transform:uppercase;letter-spacing:.05em;margin-bottom:5px}"
    ".v{font-size:19px;font-weight:700}"
    ".u{color:#22c55e}.d{color:#ef4444}"
    ".r{margin-top:16px}"
    ".r a{background:#38bdf8;color:#082f49;padding:8px 12px;border-radius:6px;"
    "text-decoration:none;font-weight:700;font-size:12px;margin-right:6px}"
    "</style></head><body>"
    "<h1>PIC32 Ethernet Starter Kit</h1>"
    "<p>IoT Dashboard - auto-refreshes every 3s</p>"
    "<div class=\"g\">";

static const char DASH_FOOT[] =
    "</div>"
    "<div class=\"r\">"
    "<a href=\"/?cmd=toggle\">Toggle LEDs</a>"
    "<a href=\"/?cmd=mode\">Cycle Mode</a>"
    "<a href=\"/?cmd=speed\">Cycle Speed</a>"
    "<a href=\"/\">Refresh</a>"
    "</div>"
    "</body></html>";

/* --------------------------------------------------------------------------
   Internal state
   -------------------------------------------------------------------------- */
static TCP_SOCKET g_dashSocket = INVALID_SOCKET;

typedef enum
{
    DASH_SEG_NONE = 0,  /* not currently sending anything            */
    DASH_SEG_HEAD,      /* sending DASH_HEAD                         */
    DASH_SEG_BODY,      /* sending the rendered g_respBuf            */
    DASH_SEG_FOOT       /* sending DASH_FOOT                         */
} DashSegment;

static DashSegment  g_dashSeg     = DASH_SEG_NONE;
static const char  *g_dashSegData = NULL;
static size_t       g_dashSegLen  = 0U;
static size_t       g_dashSegSent = 0U;

/* Request buffer — only need the request line, headers are discarded. */
#define DASH_REQ_BUFFER_SIZE     64U

/* Response buffer — only holds the rendered status-card body (the only
   part of the page that's actually dynamic). Worst case: every field at
   its longest possible value (10-digit counters, "OFFLINE", full IPv4,
   "Alternate" LED mode, etc.) is ~565 bytes; sized with margin. */
#define DASH_RESP_BUFFER_SIZE    640U
static char g_respBuf[DASH_RESP_BUFFER_SIZE];

/* Requested TX buffer size for the socket (default is only 512 bytes). */
#define DASH_TX_BUFFER_SIZE      1024U

/* --------------------------------------------------------------------------
   Build the dynamic status-card section into g_respBuf.
   Returns the length written.
   -------------------------------------------------------------------------- */
static size_t Dashboard_BuildBody(void)
{
    char ipBuf[16];
    (void)Ethernet_GetIpString(ipBuf, sizeof(ipBuf));

    bool     linkUp    = Ethernet_IsLinkUp();
    uint32_t uptimeMs  = Main_GetUptimeMs();
    uint32_t uptimeSec = uptimeMs / 1000U;

    #pragma GCC diagnostic push
    #pragma GCC diagnostic ignored "-Wformat-truncation"
    int len = snprintf(g_respBuf, sizeof(g_respBuf),
        "<div class=\"c\"><b>Link</b><span class=\"v %s\">%s</span></div>"
        "<div class=\"c\"><b>IP Address</b><span class=\"v\">%s</span></div>"
        "<div class=\"c\"><b>Uptime</b><span class=\"v\">%lus</span></div>"
        "<div class=\"c\"><b>RX / TX Frames</b><span class=\"v\">%u/%u</span></div>"
        "<div class=\"c\"><b>Switches 1 2 3</b><span class=\"v\">%s %s %s</span></div>"
        "<div class=\"c\"><b>LED Mode</b><span class=\"v\">%s</span></div>"
        "<div class=\"c\"><b>LED Speed</b><span class=\"v\">%lums</span></div>"
        "<div class=\"c\"><b>All LEDs</b><span class=\"v\">%s</span></div>",
        linkUp ? "u" : "d", linkUp ? "ONLINE" : "OFFLINE",
        ipBuf,
        (unsigned long)uptimeSec,
        (unsigned)ETHFRMRXOK,
        (unsigned)ETHFRMTXOK,
        (SWITCH1_Get() == SWITCH1_STATE_PRESSED) ? "P" : "-",
        (SWITCH2_Get() == SWITCH1_STATE_PRESSED) ? "P" : "-",
        (SWITCH3_Get() == SWITCH1_STATE_PRESSED) ? "P" : "-",
        Main_GetLedModeName(),
        (unsigned long)Main_GetSpeedMs(),
        Main_GetAllLedsOn() ? "ON" : "off");
    #pragma GCC diagnostic pop

    if ((len < 0) || ((size_t)len >= sizeof(g_respBuf)))
    {
        len = (int)sizeof(g_respBuf) - 1;
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
   Point the segment cursor at the start of the given segment. For
   DASH_SEG_BODY this renders the current status into g_respBuf.
   -------------------------------------------------------------------------- */
static void Dashboard_StartSegment(DashSegment seg)
{
    g_dashSeg     = seg;
    g_dashSegSent = 0U;

    switch (seg)
    {
        case DASH_SEG_HEAD:
            g_dashSegData = DASH_HEAD;
            g_dashSegLen  = sizeof(DASH_HEAD) - 1U;
            break;

        case DASH_SEG_BODY:
            g_dashSegLen  = Dashboard_BuildBody();
            g_dashSegData = g_respBuf;
            break;

        case DASH_SEG_FOOT:
            g_dashSegData = DASH_FOOT;
            g_dashSegLen  = sizeof(DASH_FOOT) - 1U;
            break;

        default:
            g_dashSegData = NULL;
            g_dashSegLen  = 0U;
            break;
    }
}

/* --------------------------------------------------------------------------
   Queue as much of the current segment as the TX window currently allows,
   advancing g_dashSegSent. Safe to call repeatedly across main loop
   iterations. Returns true once the whole segment has been queued.
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
       is what silently truncated the page before. */
    if (g_dashSeg != DASH_SEG_NONE)
    {
        if (Dashboard_SendSegment(g_dashSocket))
        {
            switch (g_dashSeg)
            {
                case DASH_SEG_HEAD:
                    Dashboard_StartSegment(DASH_SEG_BODY);
                    break;

                case DASH_SEG_BODY:
                    Dashboard_StartSegment(DASH_SEG_FOOT);
                    break;

                case DASH_SEG_FOOT:
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

    Dashboard_ApplyCommand(reqBuf);

    /* Kick off the head segment; the g_dashSeg branch above takes over
       from the next call (or immediately, if called again this same
       iteration) to queue it and the segments that follow. */
    Dashboard_StartSegment(DASH_SEG_HEAD);
}
