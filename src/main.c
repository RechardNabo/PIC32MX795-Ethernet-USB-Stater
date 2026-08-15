/*******************************************************************************
  Main Source File

  Company:
    Microchip Technology Inc.

  File Name:
    main.c

  Summary:
    This file contains the "main" function for a project.

  Description:
    This file contains the "main" function for a project.  The
    "main" function calls the "SYS_Initialize" function to initialize the state
    machines of all modules in the system
 *******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include "definitions.h"                // SYS function prototypes

/* --------------------------------------------------------------------------
   LED Timer (TMR3) — Polling Mode
   --------------------------------------------------------------------------
   TMR3 is a 16-bit timer with a 1:1 prescaler at 80MHz PBCLK.
   Maximum 16-bit period (65535) gives ~819us, so 1ms does not fit directly.
   Instead, we set a 500us period and poll the interrupt flag (no ISR).

   Why polling instead of interrupts:
   The MCC-generated ISR wrappers in interrupts_a.S use FreeRTOS
   portSAVE_CONTEXT/portRESTORE_CONTEXT macros. These require the FreeRTOS
   scheduler to be running. Since main() runs a bare-metal loop without
   calling vTaskStartScheduler(), ISRs would crash. Polling the flag avoids
   this entirely.

   The period is computed at runtime from TMR3_FrequencyGet() — no hardcoding.
   -------------------------------------------------------------------------- */
#define TMR3_PERIOD_US              500U    /* 500us per timer period        */
#define TMR3_PERIODS_PER_MS         (1000U / TMR3_PERIOD_US)

static void TMR3_DelayMs(uint32_t delayMs)
{
    uint32_t totalPeriods = delayMs * TMR3_PERIODS_PER_MS;

    for (uint32_t i = 0; i < totalPeriods; i++)
    {
        /* Wait for TMR3 period-match flag (set by hardware, no ISR needed) */
        while (EVIC_SourceStatusGet(INT_SOURCE_TIMER_3) == false)
        {
            /* Poll the flag */
        }
        EVIC_SourceStatusClear(INT_SOURCE_TIMER_3);
    }
}

static void TMR3_Initialize_LED(void)
{
    uint32_t timerFreq = TMR3_FrequencyGet();
    uint16_t period    = (uint16_t)((timerFreq / 1000000U * TMR3_PERIOD_US) - 1U);

    /* Disable TMR3 interrupt — we poll the flag instead of using the ISR */
    TMR3_InterruptDisable();

    TMR3_PeriodSet(period);
    TMR3_Start();
}

/* --------------------------------------------------------------------------
   Switch Debouncing
   --------------------------------------------------------------------------
   The 3 user switches (SW1=RD6, SW2=RD7, SW3=RD13) are active-low.
   BSP provides: SWITCH1_Get(), SWITCH2_Get(), SWITCH3_Get()
     0 = pressed, 1 = released

   Debounce approach: sample every 10ms, require DEBOUNCE_COUNT consecutive
   readings matching the new state before accepting the press/release.
   This filters out mechanical bounce noise (typically 5-20ms).
   -------------------------------------------------------------------------- */
#define DEBOUNCE_SAMPLE_MS          10U     /* Sample switches every 10ms   */
#define DEBOUNCE_COUNT              3U      /* 3 consecutive reads = 30ms   */

typedef struct
{
    uint8_t  pin;            /* Current raw pin reading (0 or 1)            */
    uint8_t  stableState;    /* Last debounced state                        */
    uint8_t  counter;        /* Consecutive matching readings               */
} SwitchState;

static SwitchState g_switches[3];

static void Switches_Initialize(void)
{
    g_switches[0].stableState = SWITCH1_Get();
    g_switches[1].stableState = SWITCH2_Get();
    g_switches[2].stableState = SWITCH3_Get();

    for (uint8_t i = 0; i < 3; i++)
    {
        g_switches[i].pin     = g_switches[i].stableState;
        g_switches[i].counter = 0;
    }
}

/* Returns true if a new press was detected (falling edge: released→pressed).
   Updates the stable state for the given switch index (0=SW1, 1=SW2, 2=SW3). */
static bool Switch_Debounce(uint8_t index, uint8_t rawReading)
{
    SwitchState *sw = &g_switches[index];

    if (rawReading == sw->pin)
    {
        /* Same reading as last sample — increment counter */
        if (sw->counter < DEBOUNCE_COUNT)
        {
            sw->counter++;
        }
    }
    else
    {
        /* Different reading — reset and start new count */
        sw->pin     = rawReading;
        sw->counter = 1;
    }

    /* If we've accumulated enough consecutive readings, accept the new state */
    if (sw->counter >= DEBOUNCE_COUNT && sw->pin != sw->stableState)
    {
        uint8_t oldState   = sw->stableState;
        sw->stableState    = sw->pin;

        /* Return true only on press (falling edge: released→pressed) */
        return (oldState == SWITCH1_STATE_RELEASED &&
                sw->stableState == SWITCH1_STATE_PRESSED);
    }

    return false;
}

/* --------------------------------------------------------------------------
   LED Modes
   --------------------------------------------------------------------------
   SW1 cycles through 4 LED display modes.
   SW2 cycles through 4 speed settings.
   SW3 toggles all LEDs on/off (override).
   -------------------------------------------------------------------------- */
typedef enum
{
    LED_MODE_RUNNING,       /* One LED at a time, left to right             */
    LED_MODE_ALTERNATE,     /* LED1+LED3 alternate with LED2               */
    LED_MODE_ALL_BLINK,     /* All 3 LEDs blink together                   */
    LED_MODE_COUNT          /* Number of modes                             */
} LedMode;

#define SPEED_COUNT                4U
static const uint32_t g_speedTable[SPEED_COUNT] = { 400U, 200U, 100U, 50U };

static LedMode   g_ledMode    = LED_MODE_RUNNING;
static uint8_t   g_speedIndex = 2;       /* Default: 100ms                 */
static bool      g_allLedsOn  = false;   /* SW3 override: all on          */

static void LEDs_AllOff(void)
{
    LED1_Off();
    LED2_Off();
    LED3_Off();
}

static void LEDs_AllOn(void)
{
    LED1_On();
    LED2_On();
    LED3_On();
}

/* Display the running LED pattern at the given step (0, 1, or 2) */
static void LEDs_RunningPattern(uint8_t step)
{
    LEDs_AllOff();
    switch (step % 3)
    {
        case 0: LED1_On(); break;
        case 1: LED2_On(); break;
        case 2: LED3_On(); break;
        default: break;
    }
}

/* Display the alternate pattern at the given step (0 or 1) */
static void LEDs_AlternatePattern(uint8_t step)
{
    LEDs_AllOff();
    if (step % 2 == 0)
    {
        LED1_On();
        LED3_On();
    }
    else
    {
        LED2_On();
    }
}

/* Display the all-blink pattern at the given step (0 or 1) */
static void LEDs_AllBlinkPattern(uint8_t step)
{
    if (step % 2 == 0)
    {
        LEDs_AllOn();
    }
    else
    {
        LEDs_AllOff();
    }
}


// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************

int main ( void )
{
    /* Start with interrupts disabled before configuring any modules */
    (void)__builtin_disable_interrupts();

    /* The PLL is configured by #pragma config fuses (FNOSC=PRIPLL, FPLLMUL=MUL_20)
       and locks automatically on reset. */

    /* SYS_Initialize handles all module initialization: CLK, GPIO, BSP,
       UART1, TMR2 (SYS_TIME), TMR3, DMAC, MIIM, SYS_TIME, SYS_CONSOLE,
       USB, TCPIP, CRYPT, SYS_FS, APP, EVIC, and enables global interrupts. */
    SYS_Initialize(NULL);

    /* Configure TMR3 for LED timing (500us period, poll flag for 1ms) */
    TMR3_Initialize_LED();

    /* Initialize switch debouncing state */
    Switches_Initialize();

    uint32_t speedMs   = g_speedTable[g_speedIndex];
    uint8_t  step      = 0;
    uint32_t timeAccum = 0;

    /* Main loop: debounce switches every 10ms, update LED pattern at speedMs */
    while ( true )
    {
        /* --- Switch debouncing (polled every DEBOUNCE_SAMPLE_MS) --- */
        if (Switch_Debounce(0, SWITCH1_Get()))
        {
            /* SW1 pressed: cycle to next LED mode */
            g_ledMode = (LedMode)((g_ledMode + 1) % LED_MODE_COUNT);
            g_allLedsOn = false;  /* Clear override when changing mode */
            step = 0;
        }

        if (Switch_Debounce(1, SWITCH2_Get()))
        {
            /* SW2 pressed: cycle to next speed */
            g_speedIndex = (g_speedIndex + 1) % SPEED_COUNT;
            speedMs = g_speedTable[g_speedIndex];
            timeAccum = 0;
        }

        if (Switch_Debounce(2, SWITCH3_Get()))
        {
            /* SW3 pressed: toggle all-LEDs-on override */
            g_allLedsOn = !g_allLedsOn;
            if (g_allLedsOn)
            {
                LEDs_AllOn();
            }
            else
            {
                LEDs_AllOff();
            }
        }

        /* --- LED pattern update (every speedMs) --- */
        if (timeAccum >= speedMs)
        {
            timeAccum = 0;

            if (!g_allLedsOn)
            {
                switch (g_ledMode)
                {
                    case LED_MODE_RUNNING:
                        LEDs_RunningPattern(step);
                        break;

                    case LED_MODE_ALTERNATE:
                        LEDs_AlternatePattern(step);
                        break;

                    case LED_MODE_ALL_BLINK:
                        LEDs_AllBlinkPattern(step);
                        break;

                    default:
                        LEDs_AllOff();
                        break;
                }
                step++;
            }
        }

        /* Wait one debounce sample period, then accumulate */
        TMR3_DelayMs(DEBOUNCE_SAMPLE_MS);
        timeAccum += DEBOUNCE_SAMPLE_MS;
    }

    /* Execution should not come here during normal operation */

    return ( EXIT_FAILURE );
}


/*******************************************************************************
 End of File
*/

