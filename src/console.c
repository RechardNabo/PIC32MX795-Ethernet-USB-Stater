/*******************************************************************************
  USB CDC Console Source File

  File Name:
    console.c

  Summary:
    Independent USB CDC virtual serial port console for PIC32 Ethernet Starter Kit.

  Description:
    This module implements a USB CDC console that appears as a virtual COM port
    on the host PC. It is completely independent of the LED and switch code.

    Hardware connection:
      Connect a USB cable from J5 (micro-AB USB Device port) to a PC.
      The board enumerates as "Microchip Technology Inc." CDC virtual COM port.
      Open a terminal program (TeraTerm, PuTTY, etc.) on the COM port.

    State machine:
      INIT          -> Open USB device, set event handlers
      OPEN_DEVICE   -> Set CDC event handler, wait for configuration
      WAIT_CONFIG   -> USB host enumerates and configures the device
      READY         -> CDC is configured, read/write operations are active
      ERROR         -> USB device open failed, retry

    The USB device event handler tracks USB_DEVICE_EVENT_CONFIGURED to know
    when the host has set the device configuration. The CDC event handler
    tracks USB_DEVICE_CDC_EVENT_READ_COMPLETE and WRITE_COMPLETE for transfer
    completion.
 ******************************************************************************/

#include "console.h"

/* --------------------------------------------------------------------------
   Internal state
   -------------------------------------------------------------------------- */
static ConsoleState g_consoleState    = CONSOLE_STATE_INIT;
static USB_DEVICE_HANDLE g_usbHandle  = USB_DEVICE_HANDLE_INVALID;
static bool g_usbConfigured           = false;
static bool g_cdcEventHandlerSet      = false;
static bool g_dtrActive               = false;  /* Host COM port open */

/* USB CDC transfer handles */
static USB_DEVICE_CDC_TRANSFER_HANDLE g_writeHandle = USB_DEVICE_CDC_TRANSFER_HANDLE_INVALID;
static USB_DEVICE_CDC_TRANSFER_HANDLE g_readHandle  = USB_DEVICE_CDC_TRANSFER_HANDLE_INVALID;

/* Track pending transfers */
static bool g_writePending = false;
static bool g_readPending  = false;

/* Ring buffers for TX and RX */
static char  g_txBuffer[CONSOLE_TX_BUFFER_SIZE];
static uint32_t g_txHead = 0;   /* Next byte to send            */
static uint32_t g_txTail = 0;   /* Next byte to enqueue         */
static uint32_t g_txCount = 0;  /* Bytes in buffer              */

static char  g_rxBuffer[CONSOLE_RX_BUFFER_SIZE];
static uint32_t g_rxHead = 0;   /* Next byte to read out        */
static uint32_t g_rxTail = 0;   /* Next byte to store into      */
static uint32_t g_rxCount = 0;  /* Bytes in buffer              */

/* CDC read scratch buffer (USB reads into this, then we copy to ring) */
static char g_cdcReadBuf[64];

/* CDC line coding — the host queries this via GET_LINE_CODING and sets it
   via SET_LINE_CODING. CDC ignores baud rate (USB is always full-speed),
   but the host expects a valid response. Default: 115200 8N1. */
static USB_CDC_LINE_CODING g_lineCoding =
{
    115200,                                 /* dwDTERate (baud rate) */
    USB_CDC_LINE_CODING_STOP_1_BIT,         /* bCharFormat (1 stop bit) */
    USB_CDC_LINE_CODING_PARITY_NONE,        /* bParityType (no parity) */
    USB_CDC_LINE_CODING_DATA_8_BIT          /* bDataBits (8 data bits) */
};

/* --------------------------------------------------------------------------
   USB Device Event Handler
   --------------------------------------------------------------------------
   Called by the USB device layer when USB bus events occur.
   We track CONFIGURED/DECONFIGURED to know when the host has opened
   the virtual COM port.
   -------------------------------------------------------------------------- */
static void Console_USBDeviceEventHandler(USB_DEVICE_EVENT event,
                                          void *eventData,
                                          uintptr_t context)
{
    (void)context;
    (void)eventData;

    switch (event)
    {
        case USB_DEVICE_EVENT_CONFIGURED:
            g_usbConfigured = true;
            break;

        case USB_DEVICE_EVENT_DECONFIGURED:
            g_usbConfigured = false;
            g_dtrActive = false;
            g_writePending = false;
            g_readPending = false;
            g_writeHandle = USB_DEVICE_CDC_TRANSFER_HANDLE_INVALID;
            g_readHandle  = USB_DEVICE_CDC_TRANSFER_HANDLE_INVALID;
            break;

        case USB_DEVICE_EVENT_POWER_DETECTED:
            /* VBUS detected — attach the device to the USB bus by enabling
               the D+ pull-up resistor. Without this, the host never sees
               the device and enumeration never begins. */
            USB_DEVICE_Attach(g_usbHandle);
            break;

        case USB_DEVICE_EVENT_POWER_REMOVED:
            /* VBUS removed — detach from the bus */
            USB_DEVICE_Detach(g_usbHandle);
            g_usbConfigured = false;
            g_dtrActive = false;
            g_writePending = false;
            g_readPending = false;
            g_writeHandle = USB_DEVICE_CDC_TRANSFER_HANDLE_INVALID;
            g_readHandle  = USB_DEVICE_CDC_TRANSFER_HANDLE_INVALID;
            break;

        case USB_DEVICE_EVENT_SUSPENDED:
        case USB_DEVICE_EVENT_RESUMED:
        default:
            /* Not handled — bus events only */
            break;
    }
}

/* --------------------------------------------------------------------------
   CDC Event Handler
   --------------------------------------------------------------------------
   Called by the CDC function driver when CDC-specific events occur.
   We track READ_COMPLETE and WRITE_COMPLETE to manage transfers.
   -------------------------------------------------------------------------- */
static USB_DEVICE_CDC_EVENT_RESPONSE Console_CDCEventHandler(
    USB_DEVICE_CDC_INDEX instanceIndex,
    USB_DEVICE_CDC_EVENT event,
    void *eventData,
    uintptr_t context)
{
    (void)instanceIndex;
    (void)context;

    switch (event)
    {
        case USB_DEVICE_CDC_EVENT_WRITE_COMPLETE:
        {
            USB_DEVICE_CDC_EVENT_DATA_WRITE_COMPLETE *writeData =
                (USB_DEVICE_CDC_EVENT_DATA_WRITE_COMPLETE *)eventData;

            if (writeData->handle == g_writeHandle)
            {
                g_writePending = false;
                g_writeHandle = USB_DEVICE_CDC_TRANSFER_HANDLE_INVALID;
            }
            break;
        }

        case USB_DEVICE_CDC_EVENT_READ_COMPLETE:
        {
            USB_DEVICE_CDC_EVENT_DATA_READ_COMPLETE *readData =
                (USB_DEVICE_CDC_EVENT_DATA_READ_COMPLETE *)eventData;

            if (readData->handle == g_readHandle)
            {
                /* Copy received bytes into the RX ring buffer */
                uint32_t bytesRead = (uint32_t)readData->length;
                uint32_t i;
                for (i = 0; i < bytesRead; i++)
                {
                    if (g_rxCount < CONSOLE_RX_BUFFER_SIZE)
                    {
                        g_rxBuffer[g_rxTail] = g_cdcReadBuf[i];
                        g_rxTail = (g_rxTail + 1U) % CONSOLE_RX_BUFFER_SIZE;
                        g_rxCount++;
                    }
                }
                g_readPending = false;
                g_readHandle = USB_DEVICE_CDC_TRANSFER_HANDLE_INVALID;
            }
            break;
        }

        case USB_DEVICE_CDC_EVENT_SET_CONTROL_LINE_STATE:
            /* Host opened/closed the COM port (DTR/RTS changed).
               Must acknowledge the control transfer with STATUS OK,
               otherwise usbser.sys fails to start and no COM port symlink
               is created. */
            USB_DEVICE_ControlStatus(g_usbHandle,
                                     USB_DEVICE_CONTROL_STATUS_OK);
            /* Track DTR state — when DTR is active, the host has the
               COM port open. This lets us detect open/close events. */
            {
                USB_CDC_CONTROL_LINE_STATE *controlLineState =
                    (USB_CDC_CONTROL_LINE_STATE *)eventData;
                if (controlLineState != NULL)
                {
                    g_dtrActive = (controlLineState->dtr != 0U);
                }
            }
            break;

        case USB_DEVICE_CDC_EVENT_GET_LINE_CODING:
            /* Host wants to read the line coding (baud, parity, stop bits).
               Must send the line coding data back via ControlSend.
               If we don't respond, the control transfer hangs and
               usbser.sys fails to start. */
            USB_DEVICE_ControlSend(g_usbHandle,
                                   &g_lineCoding,
                                   sizeof(USB_CDC_LINE_CODING));
            break;

        case USB_DEVICE_CDC_EVENT_SET_LINE_CODING:
            /* Host wants to set the line coding. Must receive the data
               via ControlReceive, then acknowledge. If we don't respond,
               the control transfer hangs and usbser.sys fails to start. */
            USB_DEVICE_ControlReceive(g_usbHandle,
                                      &g_lineCoding,
                                      sizeof(USB_CDC_LINE_CODING));
            break;

        case USB_DEVICE_CDC_EVENT_SEND_BREAK:
            /* Host sent a break — acknowledge with OK */
            USB_DEVICE_ControlStatus(g_usbHandle,
                                     USB_DEVICE_CONTROL_STATUS_OK);
            break;

        case USB_DEVICE_CDC_EVENT_CONTROL_TRANSFER_DATA_RECEIVED:
            /* Data stage of a host-to-device control transfer is complete
               (e.g., SET_LINE_CODING). The device layer does NOT automatically
               send the status ZLP — the application must do it. Without this,
               the control transfer hangs and usbser.sys times out (60s). */
            USB_DEVICE_ControlStatus(g_usbHandle,
                                     USB_DEVICE_CONTROL_STATUS_OK);
            break;

        case USB_DEVICE_CDC_EVENT_CONTROL_TRANSFER_DATA_SENT:
        case USB_DEVICE_CDC_EVENT_CONTROL_TRANSFER_ABORTED:
        case USB_DEVICE_CDC_EVENT_SERIAL_STATE_NOTIFICATION_COMPLETE:
        default:
            /* Not handled */
            break;
    }

    return USB_DEVICE_CDC_EVENT_RESPONSE_NONE;
}

/* --------------------------------------------------------------------------
   Ring buffer helpers
   -------------------------------------------------------------------------- */
static void Console_TxEnqueue(const char *data, uint32_t len)
{
    uint32_t i;
    for (i = 0; i < len; i++)
    {
        if (g_txCount < CONSOLE_TX_BUFFER_SIZE)
        {
            g_txBuffer[g_txTail] = data[i];
            g_txTail = (g_txTail + 1U) % CONSOLE_TX_BUFFER_SIZE;
            g_txCount++;
        }
    }
}

/* --------------------------------------------------------------------------
   Public API
   -------------------------------------------------------------------------- */
void Console_Initialize(void)
{
    g_consoleState    = CONSOLE_STATE_INIT;
    g_usbConfigured   = false;
    g_cdcEventHandlerSet = false;
    g_dtrActive       = false;
    g_writePending    = false;
    g_readPending     = false;
    g_writeHandle     = USB_DEVICE_CDC_TRANSFER_HANDLE_INVALID;
    g_readHandle      = USB_DEVICE_CDC_TRANSFER_HANDLE_INVALID;
    g_txHead = 0;
    g_txTail = 0;
    g_txCount = 0;
    g_rxHead = 0;
    g_rxTail = 0;
    g_rxCount = 0;
}

void Console_Tasks(void)
{
    switch (g_consoleState)
    {
        case CONSOLE_STATE_INIT:
        {
            /* Open the USB device layer.
               This may fail on the first few calls because the USB device
               layer needs USB_DEVICE_Tasks() to be called multiple times
               before it transitions from OPENING_USBCD to READY state.
               Just keep retrying until it succeeds. */
            g_usbHandle = USB_DEVICE_Open(USB_DEVICE_INDEX_0,
                                          DRV_IO_INTENT_READWRITE);
            if (g_usbHandle != USB_DEVICE_HANDLE_INVALID)
            {
                /* Register USB device event handler.
                   This also enables the USB interrupt source via
                   DRV_USBFS_ClientEventCallBackSet(). */
                USB_DEVICE_EventHandlerSet(g_usbHandle,
                                           Console_USBDeviceEventHandler, 0);

                /* Attach to the USB bus (enable D+ pull-up).
                   The POWER_DETECTED event handler also calls this, but
                   VBUS may already be present before we register the handler,
                   so we call it here too to avoid missing the attach window. */
                USB_DEVICE_Attach(g_usbHandle);

                g_consoleState = CONSOLE_STATE_OPEN_DEVICE;
            }
            /* else: stay in INIT and retry on next Console_Tasks() call */
            break;
        }

        case CONSOLE_STATE_OPEN_DEVICE:
        {
            /* Register CDC event handler (only once) */
            if (!g_cdcEventHandlerSet)
            {
                USB_DEVICE_CDC_RESULT result =
                    USB_DEVICE_CDC_EventHandlerSet(USB_DEVICE_CDC_INDEX_0,
                                                   Console_CDCEventHandler, 0);
                if (result == USB_DEVICE_CDC_RESULT_OK)
                {
                    g_cdcEventHandlerSet = true;
                    g_consoleState = CONSOLE_STATE_WAIT_FOR_CONFIG;
                }
            }
            break;
        }

        case CONSOLE_STATE_WAIT_FOR_CONFIG:
        {
            /* Wait for the USB host to configure the device */
            if (g_usbConfigured)
            {
                g_consoleState = CONSOLE_STATE_READY;
            }
            break;
        }

        case CONSOLE_STATE_READY:
        {
            /* Check if still configured */
            if (!g_usbConfigured)
            {
                g_consoleState = CONSOLE_STATE_WAIT_FOR_CONFIG;
                break;
            }

            /* --- Start a read if none is pending --- */
            if (!g_readPending)
            {
                USB_DEVICE_CDC_RESULT result =
                    USB_DEVICE_CDC_Read(USB_DEVICE_CDC_INDEX_0,
                                        &g_readHandle,
                                        g_cdcReadBuf,
                                        sizeof(g_cdcReadBuf));
                if (result == USB_DEVICE_CDC_RESULT_OK)
                {
                    g_readPending = true;
                }
            }

            /* --- Send pending TX data if a write is not in progress --- */
            if (!g_writePending && g_txCount > 0)
            {
                /* Determine how many bytes we can send in one transfer */
                uint32_t bytesToSend = g_txCount;
                if (bytesToSend > 64U)
                {
                    bytesToSend = 64U;
                }

                /* Copy from ring buffer to a linear scratch area */
                static char txScratch[64];
                uint32_t i;
                for (i = 0; i < bytesToSend; i++)
                {
                    txScratch[i] = g_txBuffer[g_txHead];
                    g_txHead = (g_txHead + 1U) % CONSOLE_TX_BUFFER_SIZE;
                    g_txCount--;
                }

                USB_DEVICE_CDC_RESULT result =
                    USB_DEVICE_CDC_Write(USB_DEVICE_CDC_INDEX_0,
                                         &g_writeHandle,
                                         txScratch,
                                         bytesToSend,
                                         USB_DEVICE_CDC_TRANSFER_FLAGS_DATA_COMPLETE);
                if (result == USB_DEVICE_CDC_RESULT_OK)
                {
                    g_writePending = true;
                }
                else
                {
                    /* Write failed — put bytes back into the ring buffer */
                    for (i = 0; i < bytesToSend; i++)
                    {
                        if (g_txCount < CONSOLE_TX_BUFFER_SIZE)
                        {
                            /* Put back at head position (reverse order) */
                            g_txHead = (g_txHead + CONSOLE_TX_BUFFER_SIZE - 1U)
                                       % CONSOLE_TX_BUFFER_SIZE;
                            g_txBuffer[g_txHead] = txScratch[i];
                            g_txCount++;
                        }
                    }
                }
            }
            break;
        }

        case CONSOLE_STATE_ERROR:
        {
            /* Retry: go back to INIT after a brief delay (handled by caller) */
            g_consoleState = CONSOLE_STATE_INIT;
            break;
        }

        default:
            g_consoleState = CONSOLE_STATE_INIT;
            break;
    }
}

bool Console_IsUsbReady(void)
{
    /* True as soon as USB enumeration/configuration completes, regardless
       of whether a terminal has the COM port open (DTR). Modules that must
       keep running independent of a terminal (e.g. Ethernet) should use
       this instead of Console_IsConnected(). */
    return (g_consoleState == CONSOLE_STATE_READY && g_usbConfigured);
}

bool Console_IsConnected(void)
{
    /* True when USB is configured AND the host has the COM port open
       (DTR active). This lets us detect when the host actually opens
       and closes the terminal, so we can re-send welcome messages. */
    return (g_consoleState == CONSOLE_STATE_READY && g_usbConfigured && g_dtrActive);
}

uint32_t Console_Print(const char *str)
{
    if (str == NULL)
    {
        return 0;
    }

    uint32_t len = 0;
    while (str[len] != '\0')
    {
        len++;
    }

    Console_TxEnqueue(str, len);
    return len;
}

uint32_t Console_Println(const char *str)
{
    uint32_t sent = Console_Print(str);
    Console_TxEnqueue("\r\n", 2);
    return sent + 2;
}

uint32_t Console_Read(char *buf, uint32_t bufSize)
{
    uint32_t copied = 0;
    while (copied < bufSize && g_rxCount > 0)
    {
        buf[copied] = g_rxBuffer[g_rxHead];
        g_rxHead = (g_rxHead + 1U) % CONSOLE_RX_BUFFER_SIZE;
        g_rxCount--;
        copied++;
    }
    return copied;
}

bool Console_HasData(void)
{
    return (g_rxCount > 0);
}

int32_t Console_GetChar(void)
{
    if (g_rxCount == 0)
    {
        return -1;
    }

    char ch = g_rxBuffer[g_rxHead];
    g_rxHead = (g_rxHead + 1U) % CONSOLE_RX_BUFFER_SIZE;
    g_rxCount--;
    return (int32_t)(uint8_t)ch;
}
