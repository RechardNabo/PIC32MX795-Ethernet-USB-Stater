/*******************************************************************************
  Ethernet TCP/IP Module Source File

  File Name:
    ethernet.c

  Summary:
  Independent Ethernet TCP/IP module for PIC32 Ethernet Starter Kit.

  Description:
  This module manages the Harmony TCP/IP stack and a simple TCP echo server.
  It is completely independent of the LED, switch, and USB CDC console code.

  The module uses the USB CDC console (console.h) for debug output.

  State machine:
    INIT          -> Wait for TCPIP stack to be ready
    WAIT_STACK    -> TCPIP_STACK_Status() == SYS_STATUS_READY
    WAIT_LINK     -> Wait for Ethernet link up
    READY         -> Link is up, echo server is active
    REPORT        -> Print IP address to console when first ready

  The TCP echo server listens on port 7777. It accepts one connection at a
  time and echoes received data back to the client.
 ******************************************************************************/

#include "ethernet.h"
#include "console.h"
#include "definitions.h"
#include <stdio.h>
#include <string.h>

/* TCPIP_STACK_Init() is defined in initialization.c but not declared
   in any header. We declare it here so we can call it from the main
   loop (after pumping the MIIM driver task). */
extern SYS_MODULE_OBJ TCPIP_STACK_Init(void);

/* Debug: TCPIP init failure code from tcpip_manager.c */
extern int g_tcpipInitFailCode;
extern int g_tcpipBringUpFailCode;

/* MIIM driver tasks — needed for PHY communication.
   In the FreeRTOS config, _DRV_MIIM_Task calls this in a loop.
   We call it directly since we're bare-metal (no scheduler). */
static void MiimTasksPoll(void)
{
    DRV_MIIM_OBJECT_BASE_Default.miim_Tasks(sysObj.drvMiim_0);
}

/* --------------------------------------------------------------------------
   Internal state
   -------------------------------------------------------------------------- */
typedef enum
{
    ETH_STATE_INIT = 0,
    ETH_STATE_PUMP_MIIM,      /* Pump MIIM driver before TCPIP init */
    ETH_STATE_INIT_STACK,     /* Call TCPIP_STACK_Init() */
    ETH_STATE_WAIT_STACK,     /* Wait for stack to be ready */
    ETH_STATE_STACK_FAILED,
    ETH_STATE_WAIT_LINK,
    ETH_STATE_READY,
    ETH_STATE_REPORT
} EthState;

static EthState   g_ethState     = ETH_STATE_INIT;
static TCPIP_NET_HANDLE g_netH   = NULL;
static TCP_SOCKET g_echoSocket   = INVALID_SOCKET;
static bool       g_reported     = false;
static bool       g_errorReported = false;
static uint32_t   g_miimPumpCount = 0;

/* Buffer for IP address string */
static char g_ipBuf[16];

/* --------------------------------------------------------------------------
   Helper: convert IPv4 address (uint32_t in network byte order) to string
   -------------------------------------------------------------------------- */
static void IpToString(uint32_t ip, char *buf)
{
    /* Harmony stores IP as a uint32_t where the bytes are in host order.
       Extract each byte using the IPV4_ADDR union from Harmony. */
    IPV4_ADDR addr;
    addr.Val  = ip;
    (void)snprintf(buf, 16U, "%u.%u.%u.%u",
                   addr.v[0], addr.v[1], addr.v[2], addr.v[3]);
}

/* --------------------------------------------------------------------------
   Initialize the Ethernet module
   -------------------------------------------------------------------------- */
void Ethernet_Initialize(void)
{
    g_ethState   = ETH_STATE_INIT;
    g_netH       = NULL;
    g_echoSocket = INVALID_SOCKET;
    g_reported   = false;
    g_errorReported = false;
    g_miimPumpCount = 0;
}

/* --------------------------------------------------------------------------
   TCP Echo Server — service the echo socket
   -------------------------------------------------------------------------- */
static void Ethernet_EchoService(void)
{
    /* If socket is invalid, try to open a server socket */
    if (g_echoSocket == INVALID_SOCKET)
    {
        g_echoSocket = TCPIP_TCP_ServerOpen(IP_ADDRESS_TYPE_IPV4,
                                            ETH_ECHO_PORT,
                                            NULL);
        return;
    }

    /* Check if the socket was reset (client disconnected) */
    if (TCPIP_TCP_WasReset(g_echoSocket))
    {
        /* Socket was reset — it returns to listen state automatically
           for server sockets. Just log it. */
        Console_Println("[ETH] TCP client disconnected");
        return;
    }

    /* Check if a client is connected */
    if (!TCPIP_TCP_IsConnected(g_echoSocket))
    {
        return;  /* No client connected — waiting for connection */
    }

    /* Read available data and echo it back */
    uint16_t rxReady = TCPIP_TCP_GetIsReady(g_echoSocket);
    if (rxReady > 0U)
    {
        uint16_t txReady = TCPIP_TCP_PutIsReady(g_echoSocket);
        uint16_t toRead  = (rxReady < txReady) ? rxReady : txReady;

        if (toRead > 0U)
        {
            uint8_t echoBuf[128];
            if (toRead > (uint16_t)sizeof(echoBuf))
            {
                toRead = (uint16_t)sizeof(echoBuf);
            }

            uint16_t bytesRead = TCPIP_TCP_ArrayGet(g_echoSocket,
                                                    echoBuf, toRead);
            if (bytesRead > 0U)
            {
                (void)TCPIP_TCP_ArrayPut(g_echoSocket,
                                         echoBuf, bytesRead);
                (void)TCPIP_TCP_Flush(g_echoSocket);
            }
        }
    }
}

/* --------------------------------------------------------------------------
   Main task — call every iteration from main loop
   -------------------------------------------------------------------------- */
void Ethernet_Tasks(void)
{
    /* The MIIM driver task must be called before the TCPIP stack task,
       because the TCPIP stack depends on the MIIM driver for PHY
       communication. Normally this is a FreeRTOS task, but since we
       don't run the scheduler, we must call it here. */
    DRV_MIIM_OBJECT_BASE_Default.miim_Tasks(sysObj.drvMiim_0);

    switch (g_ethState)
    {
        case ETH_STATE_INIT:
        {
            /* Wait for SYS_TMR to be running before doing anything.
               The PHY setup uses SYS_TMR for timeouts, so if the timer
               isn't running, the PHY init will fail immediately. */
            Console_Println("[ETH] Waiting for SYS_TMR...");
            g_miimPumpCount = 0;
            g_ethState = ETH_STATE_PUMP_MIIM;
            break;
        }

        case ETH_STATE_PUMP_MIIM:
        {
            /* Wait for SYS_TMR tick to start incrementing, and pump
               the MIIM driver task to get it ready. */
            MiimTasksPoll();
            g_miimPumpCount++;

            /* Wait until SYS_TMR is running (tick > 100 = ~100ms) */
            if (SYS_TMR_TickCountGet() > 100U)
            {
                Console_Println("[ETH] SYS_TMR running, initializing stack...");
                g_ethState = ETH_STATE_INIT_STACK;
            }
            else if (g_miimPumpCount > 1000000U)
            {
                /* Timeout — SYS_TMR never started */
                Console_Println("[ETH] SYS_TMR never started!");
                g_ethState = ETH_STATE_STACK_FAILED;
            }
            break;
        }

        case ETH_STATE_INIT_STACK:
        {
            /* Now call TCPIP_STACK_Init() — the MIIM driver will handle
               ETH peripheral enable and MIIM clock configuration when
               the PHY driver opens and sets up the MIIM client. */
            Console_Println("[ETH] Initializing TCP/IP stack...");

            /* Test malloc before calling TCPIP_STACK_Init() */
            void *testPtr = malloc(39250);
            if (testPtr == NULL)
            {
                Console_Println("[ETH] malloc(39250) FAILED — heap too small");
                g_ethState = ETH_STATE_STACK_FAILED;
                break;
            }
            Console_Println("[ETH] malloc(39250) OK");
            free(testPtr);

            sysObj.tcpip = TCPIP_STACK_Init();
            if (sysObj.tcpip == SYS_MODULE_OBJ_INVALID)
            {
                if (!g_errorReported)
                {
                    g_errorReported = true;
                    char failBuf[64];
                    (void)snprintf(failBuf, sizeof(failBuf),
                                   "[ETH] Init failed at step %d, sub %d",
                                   g_tcpipInitFailCode, g_tcpipBringUpFailCode);
                    Console_Println(failBuf);
                    Console_Println("[ETH] TCPIP_STACK_Init() returned INVALID");
                }
                g_ethState = ETH_STATE_STACK_FAILED;
            }
            else
            {
                Console_Println("[ETH] TCPIP_STACK_Init() OK, waiting for ready...");
                g_ethState = ETH_STATE_WAIT_STACK;
            }
            break;
        }

        case ETH_STATE_WAIT_STACK:
        {
            /* Call MIIM tasks and TCPIP_STACK_Task() to continue initialization */
            MiimTasksPoll();
            TCPIP_STACK_Task(sysObj.tcpip);

            SYS_STATUS status = TCPIP_STACK_Status(sysObj.tcpip);

            /* Debug: print status periodically */
            static uint32_t waitTick = 0;
            if (waitTick == 0)
            {
                char dbgBuf[64];
                (void)snprintf(dbgBuf, sizeof(dbgBuf),
                               "[ETH] status=%d tick=%lu",
                               (int)status,
                               (unsigned long)SYS_TMR_TickCountGet());
                Console_Println(dbgBuf);
                waitTick = 200000;
            }
            else
            {
                waitTick--;
            }

            if (status == SYS_STATUS_READY)
            {
                static int readyDbg = 0;
                g_netH = TCPIP_STACK_NetHandleGet("eth0");
                if (g_netH != NULL)
                {
                    g_ethState = ETH_STATE_WAIT_LINK;
                    Console_Println("[ETH] TCP/IP stack ready");
                }
                else if (readyDbg < 3)
                {
                    Console_Println("[ETH] NetHandleGet(\"eth0\") returned NULL!");
                    readyDbg++;
                }
            }
            else if (status == SYS_STATUS_ERROR)
            {
                if (!g_errorReported)
                {
                    g_errorReported = true;
                    Console_Println("[ETH] TCP/IP stack init FAILED");
                    Console_Println("[ETH] Ethernet not available");
                }
                g_ethState = ETH_STATE_STACK_FAILED;
            }
            break;
        }

        case ETH_STATE_STACK_FAILED:
        {
            /* Stack failed to initialize. Stay here. */
            break;
        }

        case ETH_STATE_WAIT_LINK:
        {
            /* Keep the stack running */
            MiimTasksPoll();
            TCPIP_STACK_Task(sysObj.tcpip);

            /* Wait for the Ethernet link to come up */
            if (TCPIP_STACK_NetIsLinked(g_netH))
            {
                g_ethState = ETH_STATE_READY;
                Console_Println("[ETH] Link UP");
            }
            break;
        }

        case ETH_STATE_READY:
        {
            /* Keep the stack running */
            MiimTasksPoll();
            TCPIP_STACK_Task(sysObj.tcpip);

            /* Check if link went down */
            if (!TCPIP_STACK_NetIsLinked(g_netH))
            {
                g_ethState = ETH_STATE_WAIT_LINK;
                g_reported = false;
                Console_Println("[ETH] Link DOWN");
                break;
            }

            /* Report IP address once when first ready */
            if (!g_reported)
            {
                g_reported = true;
                g_ethState = ETH_STATE_REPORT;
            }

            /* Service the echo server */
            Ethernet_EchoService();
            break;
        }

        case ETH_STATE_REPORT:
        {
            /* Keep the stack running */
            MiimTasksPoll();
            TCPIP_STACK_Task(sysObj.tcpip);

            /* Print the IP address to the console */
            uint32_t ip = TCPIP_STACK_NetAddress(g_netH);
            if (ip != 0U)
            {
                IpToString(ip, g_ipBuf);
                Console_Print("[ETH] IP Address: ");
                Console_Println(g_ipBuf);
                Console_Print("[ETH] Echo server on port ");
                /* Print port number */

                /* Debug: print ETH registers */
                {
                    char dbgBuf[64];
                    (void)snprintf(dbgBuf, sizeof(dbgBuf),
                                   "[ETH] FRMRXOK=%u FRMTXOK=%u",
                                   (unsigned)ETHFRMRXOK,
                                   (unsigned)ETHFRMTXOK);
                    Console_Println(dbgBuf);
                    (void)snprintf(dbgBuf, sizeof(dbgBuf),
                                   "[ETH] DEVCFG3=0x%08x FMIIEN=%u FETHIO=%u",
                                   (unsigned)DEVCFG3,
                                   (unsigned)((DEVCFG3 >> 24) & 1U),
                                   (unsigned)((DEVCFG3 >> 25) & 1U));
                    Console_Println(dbgBuf);
                }
                char portBuf[8];
                (void)snprintf(portBuf, sizeof(portBuf), "%u", ETH_ECHO_PORT);
                Console_Println(portBuf);
                Console_Println("[ETH] Connect: telnet <ip> <port>");
            }
            g_ethState = ETH_STATE_READY;
            break;
        }

        default:
            g_ethState = ETH_STATE_INIT;
            break;
    }
}

/* --------------------------------------------------------------------------
   Query functions
   -------------------------------------------------------------------------- */
bool Ethernet_IsLinkUp(void)
{
    if (g_netH != NULL)
    {
        return TCPIP_STACK_NetIsLinked(g_netH);
    }
    return false;
}

const char *Ethernet_GetIpString(char *buf, uint32_t bufSize)
{
    if ((buf == NULL) || (bufSize < 16U))
    {
        return "";
    }

    if (g_netH != NULL)
    {
        uint32_t ip = TCPIP_STACK_NetAddress(g_netH);
        IpToString(ip, buf);
    }
    else
    {
        (void)snprintf(buf, bufSize, "0.0.0.0");
    }
    return buf;
}
