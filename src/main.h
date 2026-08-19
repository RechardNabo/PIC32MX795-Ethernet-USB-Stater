/*******************************************************************************
  Main Module Accessor Header File

  File Name:
    main.h

  Summary:
    Accessors exposing main.c's LED/uptime state to other modules (e.g. the
    web dashboard) without exposing the underlying static variables directly.
******************************************************************************/

#ifndef MAIN_H
#define MAIN_H

#include <stdint.h>
#include <stdbool.h>

/* Milliseconds since boot (from the TMR3 1ms tick). */
uint32_t Main_GetUptimeMs(void);

/* Human-readable name of the current LED display mode. */
const char *Main_GetLedModeName(void);

/* Current LED pattern update period, in milliseconds. */
uint32_t Main_GetSpeedMs(void);

/* True if the SW3 "all LEDs on" override is active. */
bool Main_GetAllLedsOn(void);

/* Toggle the "all LEDs on" override (same as pressing SW3). */
void Main_ToggleAllLeds(void);

/* Advance to the next LED display mode (same as pressing SW1). */
void Main_CycleLedMode(void);

/* Advance to the next LED speed setting (same as pressing SW2). */
void Main_CycleSpeed(void);

/* --------------------------------------------------------------------------
   Resource-monitoring accessors (for the web dashboard's "MCU Resources"
   tab). All are cheap, dependency-free reads of state already tracked in
   main.c's loop.
   -------------------------------------------------------------------------- */

/* Bytes of static RAM (.data + .bss) used, as of the last build's linker
   map. Not computed live: this build uses -fdata-sections, which places
   the linker script's "_end" symbol before most of the actual data, so
   it can't be used to compute this at runtime (see main.c). Keep this
   in sync with the map file's "Data Memory used" line if buffer sizes
   change meaningfully. */
uint32_t Main_GetStaticRamUsedBytes(void);

/* Total RAM size in bytes (fixed by the device: kseg1_data_mem). */
uint32_t Main_GetRamTotalBytes(void);

/* Configured heap reservation in bytes (fixed at link time). */
uint32_t Main_GetHeapReservedBytes(void);

/* Approximate stack bytes in use at the moment of the call, measured as
   the distance from the stack pointer recorded near the top of main()
   to the address of a local variable at the current call depth. This is
   a coarse snapshot (varies call to call), not a true high-water mark,
   but is cheap and useful as a rough "how deep are we" indicator. */
uint32_t Main_GetApproxStackUsedBytes(void);

/* Main loop iterations observed in the most recently completed 1-second
   window — a cheap proxy for how "busy" the cooperative main loop is. */
uint32_t Main_GetLoopRate(void);

/* Estimated CPU load percentage (0-100), self-calibrated at runtime as
   100 * (1 - currentLoopRate / highestObservedLoopRate). Since there is
   no RTOS/idle task, this is not a true OS-level CPU load figure — it is
   a proxy derived from how much the main loop rate drops from its own
   observed peak, which happens whenever polling functions (USB, TCP/IP,
   dashboard rendering) take longer per iteration. */
uint32_t Main_GetCpuLoadPercent(void);

/* --------------------------------------------------------------------------
   Switch hold-to-reset
   --------------------------------------------------------------------------
   SW1 (RD6), when held continuously for MAIN_RESET_HOLD_THRESHOLD_MS,
   triggers a board software reset. A visual warning (all LEDs
   fast-blink) starts at MAIN_RESET_WARN_MS to give the user a chance to
   release the switch before the reset fires. */

#define MAIN_RESET_HOLD_THRESHOLD_MS  5000U   /* 5 sec hold → reset       */
#define MAIN_RESET_WARN_MS            3000U   /* 3 sec → start LED warning */

/* Milliseconds SW1 has been held continuously (0 when released). */
uint32_t Main_GetResetSwitchHoldMs(void);

/* Threshold constant accessor (for the dashboard API). */
uint32_t Main_GetResetHoldThresholdMs(void);

/* Request a delayed board reset (used by the /api/reset endpoint).
   Sets a flag; the main loop performs the actual reset ~500ms later
   to give the TCP stack time to flush any pending HTTP response. */
void Main_RequestReset(void);

/* Perform an immediate software reset via the PIC32 RSWRST register.
   Does not return. */
void Main_TriggerReset(void);

#endif /* MAIN_H */
