/*******************************************************************************
  Web IoT Dashboard Module Header File

  File Name:
    dashboard.h

  Summary:
  Lightweight embedded HTTP dashboard for the PIC32 Ethernet Starter Kit.

  Description:
  Serves a single self-contained HTML page (no filesystem/MPFS required)
  showing live board status: uptime, IP address, link state, Ethernet
  frame counters, switch states, and current LED mode/speed. The page also
  has buttons to toggle all LEDs on/off and cycle the LED display mode,
  which POST back via simple GET query parameters.

  This module is independent of ethernet.c's TCP echo server — it opens
  its own TCP server socket on port 80 (standard HTTP).

  API:
    Dashboard_Initialize() : Call once after Ethernet_Initialize().
    Dashboard_Tasks()      : Call periodically from the main loop.
******************************************************************************/

#ifndef DASHBOARD_H
#define DASHBOARD_H

/* HTTP listen port for the dashboard */
#define DASHBOARD_PORT           80U

/* Initialize the dashboard module. Call once after Ethernet_Initialize(). */
void Dashboard_Initialize(void);

/* Call periodically from the main loop (every iteration, alongside
   Ethernet_Tasks()). Services the HTTP server socket. */
void Dashboard_Tasks(void);

#endif /* DASHBOARD_H */
