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

#endif /* MAIN_H */
