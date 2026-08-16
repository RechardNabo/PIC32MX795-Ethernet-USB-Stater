/*******************************************************************************
  Ethernet TCP/IP Module Header File

  File Name:
    ethernet.h

  Summary:
  Independent Ethernet TCP/IP module for PIC32 Ethernet Starter Kit.

  Description:
  This module manages the TCP/IP stack and a simple TCP echo server.
  It is completely independent of the LED, switch, and USB CDC console code.

  The module uses the USB CDC console (console.h) for debug output, so the
  user can see Ethernet status (IP address, link state, connections) on the
  COM port terminal.

  Static IP configuration (from configuration.h):
    IP:      192.168.100.10
    Mask:    255.255.255.0
    Gateway: 192.168.100.1

  A TCP echo server listens on port 7777. Connect with:
    telnet 192.168.100.10 7777
  or:
    nc 192.168.100.10 7777
  Type characters and they are echoed back.

  API:
    Ethernet_Initialize()  : Call once after SYS_Initialize() and Console_Initialize()
    Ethernet_Tasks()       : Call periodically from main loop (every iteration)
    Ethernet_IsLinkUp()    : True if Ethernet cable is connected and link is up
    Ethernet_GetIpString() : Fill buffer with dotted-decimal IP address string
 ******************************************************************************/

#ifndef ETHERNET_H
#define ETHERNET_H

#include <stdint.h>
#include <stdbool.h>
#include "definitions.h"

/* TCP echo server port */
#define ETH_ECHO_PORT           7777U

/* Initialize the Ethernet module.
   Call once after SYS_Initialize() and Console_Initialize().
   Opens the TCP echo server socket. */
void Ethernet_Initialize(void);

/* Call periodically from the main loop (every iteration).
   Calls TCPIP_STACK_Task() and services the TCP echo server. */
void Ethernet_Tasks(void);

/* Returns true if the Ethernet cable is connected and link is up. */
bool Ethernet_IsLinkUp(void);

/* Fill buf (min 16 bytes) with dotted-decimal IP address string.
   Returns pointer to buf. Returns "0.0.0.0" if no IP. */
const char *Ethernet_GetIpString(char *buf, uint32_t bufSize);

#endif /* ETHERNET_H */
