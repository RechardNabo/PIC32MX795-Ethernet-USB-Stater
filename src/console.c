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

/* --------------------------------------------------------------------------
   USB Device Event Handler
   --------------------------------------------------------------------------
   Called by the USB device layer when USB bus events occur.
   We track CONFIGURED/DECONFIGURED to know when the host has opened
   the virtual COM port.
   -------------------------------------------------------------------------- */
static void Console_USBDeviceEventHandler(USB_DEVICE_EVENT event,
                                          USB_DEVICE_EVENT_DATA *eventData,
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
            g_writePending = false;
            g_readPending = false;
            g_writeHandle = USB_DEVICE_CDC_TRANSFER_HANDLE_INVALID;
            g_readHandle  = USB_DEVICE_CDC_TRANSFER_HANDLE_INVALID;
            break;

        case USB_DEVICE_EVENT_SUSPENDED:
        case USB_DEVICE_EVENT_RESUMED:
        case USB_DEVICE_EVENT_POWER_DETECTED:
        case USB_DEVICE_EVENT_POWER_REMOVED:
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

            if (writeData->transferHandle == g_writeHandle)
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

            if (readData->transferHandle == g_readHandle)
            {
                /* Copy received bytes into the RX ring buffer */
                uint32_t bytesRead = readData->size;
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
            /* Host opened the COM port (DTR/RTS set) — nothing to do */
            break;

        case USB_DEVICE_CDC_EVENT_GET_LINE_CODING:
        case USB_DEVICE_CDC_EVENT_SET_LINE_CODING:
        case USB_DEVICE_CDC_EVENT_SEND_BREAK:
        case USB_DEVICE_CDC_EVENT_CONTROL_TRANSFER_DATA_SENT:
        case USB_DEVICE_CDC_EVENT_CONTROL_TRANSFER_DATA_RECEIVED:
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
            /* Open the USB device layer */
            g_usbHandle = USB_DEVICE_Open(USB_DEVICE_INDEX_0);
            if (g_usbHandle != USB_DEVICE_HANDLE_INVALID)
            {
                /* Register USB device event handler */
                USB_DEVICE_EventHandlerSet(g_usbHandle,
                                           Console_USBDeviceEventHandler, 0);
                g_consoleState = CONSOLE_STATE_OPEN_DEVICE;
            }
            else
            {
                g_consoleState = CONSOLE_STATE_ERROR;
            }
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

                USB_DEVICE_CDC_TRANSFER_FLAGS flags;
                flags.value = 0;

                USB_DEVICE_CDC_RESULT result =
                    USB_DEVICE_CDC_Write(USB_DEVICE_CDC_INDEX_0,
                                         &g_writeHandle,
                                         txScratch,
                                         bytesToSend,
                                         flags);
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

bool Console_IsConnected(void)
{
    return (g_consoleState == CONSOLE_STATE_READY && g_usbConfigured);
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
