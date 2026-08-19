/*******************************************************************************
  USB CDC Console Header File

  File Name:
    console.h

  Summary:
    Independent USB CDC virtual serial port console for PIC32 Ethernet Starter Kit.

  Description:
    Implements a USB CDC console that appears as a virtual COM port on the host PC.
    The user connects a USB cable from the board's J5 (micro-AB USB Device port)
    to their PC. The board enumerates as a CDC virtual COM port.

    This module is self-contained and does NOT depend on the LED or switch code
    in main.c. It provides:
      - Console_Initialize()  : Open USB device, register event handlers
      - Console_Tasks()       : State machine to manage USB CDC connection
      - Console_Print()       : Send a string to the host
      - Console_Println()     : Send a string + newline
      - Console_Read()        : Non-blocking read of received characters
      - Console_IsConnected() : Check if USB host has configured the device
 ******************************************************************************/

#ifndef CONSOLE_H
#define CONSOLE_H

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include "definitions.h"

/* Console buffer sizes */
#define CONSOLE_TX_BUFFER_SIZE   1024U
#define CONSOLE_RX_BUFFER_SIZE   128U

/* Size of the rolling mirror of the most recent console output, kept so
   the web dashboard can display a tail of what the USB CDC terminal has
   shown (boot log lines, echoed keystrokes, etc). Independent of
   CONSOLE_TX_BUFFER_SIZE — the TX ring is drained as bytes go out over
   USB, but the mirror keeps a fixed-size rolling window regardless.

   Kept small (rather than the ~512 bytes that would show a bit more
   scrollback) because this target's RAM leaves only ~1KB of headroom
   for the C call stack after the TCP/IP stack, USB, and crypto buffers —
   every byte here comes directly out of that headroom. Increase only
   after checking the linker's stack availability. */
#define CONSOLE_MIRROR_SIZE      224U

/* Console states */
typedef enum
{
    CONSOLE_STATE_INIT = 0,
    CONSOLE_STATE_OPEN_DEVICE,
    CONSOLE_STATE_WAIT_FOR_CONFIG,
    CONSOLE_STATE_READY,
    CONSOLE_STATE_ERROR
} ConsoleState;

/* Initialize the USB CDC console. Call once after SYS_Initialize(). */
void Console_Initialize(void);

/* Call periodically from the main loop. Manages USB CDC state machine. */
void Console_Tasks(void);

/* Returns true if the USB host has configured the CDC device AND has the
   COM port open (DTR active). Use this to gate console-only behavior
   (welcome banner, echo) that should only run while a terminal is open. */
bool Console_IsConnected(void);

/* Returns true as soon as USB enumeration/configuration completes, even if
   no terminal has opened the COM port yet (DTR not required). Ethernet and
   other modules that must keep running regardless of whether a terminal
   is attached should gate on this instead of Console_IsConnected(). */
bool Console_IsUsbReady(void);

/* Copies the most recent bytes of console output (oldest to newest) into
   dest, up to destSize bytes. Returns the number of bytes copied. Used by
   the web dashboard to mirror what has been printed to the USB CDC
   terminal (boot log, echoed input), independent of whether a terminal
   is actually attached. */
uint32_t Console_MirrorCopy(char *dest, uint32_t destSize);

/* Send a null-terminated string to the host. Returns bytes sent. */
uint32_t Console_Print(const char *str);

/* Send a string followed by CRLF. Returns bytes sent. */
uint32_t Console_Println(const char *str);

/* Non-blocking read: copies available received bytes into buf (max bufSize).
   Returns number of bytes copied. Call periodically to drain the RX buffer. */
uint32_t Console_Read(char *buf, uint32_t bufSize);

/* Returns true if at least one byte is available in the RX buffer. */
bool Console_HasData(void);

/* Get a single character from the RX buffer. Returns -1 if no data. */
int32_t Console_GetChar(void);

#endif /* CONSOLE_H */
