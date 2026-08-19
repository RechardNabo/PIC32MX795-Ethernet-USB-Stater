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
#include "console.h"                    // USB CDC console (Project 3)
#include "ethernet.h"                   // Ethernet TCP/IP (Project 4)
#include "main.h"                       // Accessors for the web dashboard
#include "dashboard.h"                  // Web IoT dashboard (Project 5)

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
#define TMR3_PERIOD_US              1000U   /* 1ms per timer period          */
#define TMR3_PERIODS_PER_MS         (1000U / TMR3_PERIOD_US)

/* How long to hold off starting Ethernet_Tasks()/Dashboard_Tasks() after
   boot, giving USB enumeration an uncontested head start. See the call
   site in the main loop for why this is a fixed delay rather than a
   gate on USB actually finishing configuration. */
#define ETH_START_DELAY_MS         1000U

/* Track console connection state for welcome message */
static bool g_wasConnected = false;

/* --------------------------------------------------------------------------
   Resource monitoring (for the web dashboard's "MCU Resources" tab)
   --------------------------------------------------------------------------
   All of this is cheap: a linker-provided symbol for static RAM usage, a
   couple of counters for loop rate / self-calibrated CPU load estimate,
   and a stack-pointer snapshot. See main.h for accessor semantics. */

/* The linker script's "_end" symbol is NOT usable here: this build uses
   -fdata-sections, which places every global in its own named section
   (.bss.varname, .data.varname, ...) that gets laid out by a separate,
   XC32-internal rule positioned AFTER the script's "_end = .;" line —
   so _end ends up pointing only ~600 bytes into RAM while the actual
   statics (including a 64KB heap-adjacent buffer) are placed well after
   it. Confirmed by checking the .map file's symbol table directly.
   Static RAM usage is therefore reported as of the last build (see the
   linker map's "Data Memory used" line) rather than computed live —
   same approach as the flash-usage figure below. Keep in sync if
   buffer sizes change meaningfully. */
#define STATIC_RAM_USED_BYTES   80701U
#define RAM_TOTAL_BYTES         0x20000U    /* kseg1_data_mem length */

/* Must match the Makefile's --defsym=_min_heap_size=... (see
   nbproject/Makefile-default.mk); the linker doesn't expose this back to
   C code, so it's tracked here as a constant. */
#define HEAP_RESERVED_BYTES     49152U

/* Captured once, near the top of main(), before any deep call chains —
   used as the "top of stack" reference point for the approximate
   stack-usage snapshot. */
static const void *g_stackTop = NULL;

/* Loop-rate / self-calibrated CPU load tracking. There's no RTOS idle
   task to measure true CPU load against, so instead we track how the
   main loop's iteration rate droops from its own observed peak — see
   Main_GetCpuLoadPercent() in main.h for the caveat. */
static volatile uint32_t g_loopCounter  = 0;   /* iterations this window   */
static uint32_t          g_loopRate     = 0;   /* iterations/sec, last window */
static uint32_t          g_loopRateMax  = 1;   /* highest rate observed (>=1 to avoid /0) */

uint32_t Main_GetStaticRamUsedBytes(void)
{
    return STATIC_RAM_USED_BYTES;
}

uint32_t Main_GetRamTotalBytes(void)
{
    return RAM_TOTAL_BYTES;
}

uint32_t Main_GetHeapReservedBytes(void)
{
    return HEAP_RESERVED_BYTES;
}

uint32_t Main_GetApproxStackUsedBytes(void)
{
    /* MIPS stack grows downward, so "used" is top-of-stack minus the
       current (lower) address. Taking the address of a local variable
       here approximates the stack pointer at this call depth. */
    volatile int marker = 0;
    const void *current = (const void *)&marker;

    if ((g_stackTop == NULL) || (current >= g_stackTop))
    {
        return 0U;  /* not yet captured, or something's off — don't report garbage */
    }
    return (uint32_t)((const char *)g_stackTop - (const char *)current);
}

uint32_t Main_GetLoopRate(void)
{
    return g_loopRate;
}

uint32_t Main_GetCpuLoadPercent(void)
{
    if (g_loopRate >= g_loopRateMax)
    {
        return 0U;  /* at or above peak rate observed so far -> ~0% extra load */
    }
    uint32_t load = 100U - ((g_loopRate * 100U) / g_loopRateMax);
    return (load > 100U) ? 100U : load;
}

/* --------------------------------------------------------------------------
   Console Service — processes welcome banner and echo.
   Called every main loop iteration for immediate response.
   -------------------------------------------------------------------------- */
static void Console_Service(void)
{
    /* Print welcome message when host first connects */
    if (Console_IsConnected() && !g_wasConnected)
    {
        g_wasConnected = true;
        Console_Println("");
        Console_Println("============================================");
        Console_Println("  PIC32 Ethernet Starter Kit - USB CDC Console");
        Console_Println("============================================");
        Console_Println("");
        Console_Println("Console is ready. Type characters to echo.");
        Console_Println("");
    }
    if (!Console_IsConnected())
    {
        g_wasConnected = false;
    }

    /* Echo received characters back to the host */
    if (Console_HasData())
    {
        char rxChar;
        while (Console_Read(&rxChar, 1) > 0)
        {
            char echoBuf[2] = { rxChar, '\0' };
            Console_Print(echoBuf);
            if (rxChar == '\r')
            {
                Console_Print("\n");
            }
        }
    }
}

/* TMR3 is a free-running 1ms tick counter. The main loop polls it
   non-blocking — if 1ms hasn't elapsed, we just loop again and poll USB.
   This gives maximum USB polling frequency with no blocking delays.

   TMR3 is 16-bit. At 80MHz PBCLK with 1:1 prescaler, 1ms = 80000 counts
   which overflows 16 bits (max 65535). So we use 1:8 prescaler (TCKPS=1),
   giving 10MHz, and 1ms = 10000 counts which fits. */
static volatile uint32_t g_msTick = 0;
#define TMR3_PRESCALER              8U
#define TMR3_EFFECTIVE_FREQ         (80000000U / TMR3_PRESCALER)

static void TMR3_Initialize_LED(void)
{
    /* Stop timer */
    TMR3_Stop();

    /* Set 1:8 prescaler (TCKPS = 001, bits 4-5 in T3CON for PIC32MX) */
    T3CONCLR = 0x30;        /* Clear TCKPS bits 4-5 */
    T3CONSET = 0x10;        /* Set TCKPS = 01 (1:8 prescaler) */

    /* 1ms period at 10MHz = 10000 counts */
    uint16_t period = (uint16_t)((TMR3_EFFECTIVE_FREQ / 1000000U * TMR3_PERIOD_US) - 1U);
    TMR3_PeriodSet(period);

    /* Clear counter */
    TMR3_CounterGet();  /* read to ensure any pending sync */

    /* Disable TMR3 interrupt — we poll the flag instead of using the ISR */
    TMR3_InterruptDisable();

    TMR3_Start();
}

/* Returns true if at least 1ms has elapsed since the last call.
   Clears the flag and increments the ms tick counter. */
static bool TMR3_MsTick(void)
{
    if (EVIC_SourceStatusGet(INT_SOURCE_TIMER_3))
    {
        EVIC_SourceStatusClear(INT_SOURCE_TIMER_3);
        g_msTick++;
        return true;
    }
    return false;
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

static void LEDs_AllOff(void);
static void LEDs_AllOn(void);

/* --------------------------------------------------------------------------
   Accessors for other modules (e.g. the web dashboard) to read/control
   LED state without exposing the static variables directly.
   -------------------------------------------------------------------------- */
uint32_t Main_GetUptimeMs(void)
{
    return g_msTick;
}

const char *Main_GetLedModeName(void)
{
    switch (g_ledMode)
    {
        case LED_MODE_RUNNING:   return "Running";
        case LED_MODE_ALTERNATE: return "Alternate";
        case LED_MODE_ALL_BLINK: return "All Blink";
        default:                 return "Unknown";
    }
}

uint32_t Main_GetSpeedMs(void)
{
    return g_speedTable[g_speedIndex];
}

bool Main_GetAllLedsOn(void)
{
    return g_allLedsOn;
}

void Main_ToggleAllLeds(void)
{
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

void Main_CycleLedMode(void)
{
    g_ledMode   = (LedMode)((g_ledMode + 1) % LED_MODE_COUNT);
    g_allLedsOn = false;
}

void Main_CycleSpeed(void)
{
    g_speedIndex = (uint8_t)((g_speedIndex + 1U) % SPEED_COUNT);
}

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

    /* Fix CPU status register: clear BEV (Boot Exception Vectors) and
       set IPL=0 so all priority-level interrupts can fire.
       The FreeRTOS port code leaves IPL=3 and BEV=1 after initialization,
       which blocks TMR2 (pri 1), USB (pri 2), and ETH (pri 3) interrupts
       and uses ROM exception vectors instead of our custom ISRs. */
    {
        uint32_t cp0_status = _CP0_GET_STATUS();
        cp0_status &= ~(_CP0_STATUS_BEV_MASK | _CP0_STATUS_IPL_MASK);
        _CP0_SET_STATUS(cp0_status);
        __builtin_enable_interrupts();
    }

    /* Configure TMR3 for 1ms tick (non-blocking) */
    TMR3_Initialize_LED();

    /* Initialize switch debouncing state */
    Switches_Initialize();

    /* Initialize USB CDC console (Project 3 — independent of LEDs/switches) */
    Console_Initialize();

    /* Initialize Ethernet TCP/IP module (Project 4 — uses console for debug) */
    Ethernet_Initialize();

    /* Initialize the web IoT dashboard (Project 5 — depends on Ethernet) */
    Dashboard_Initialize();

    uint32_t speedMs   = g_speedTable[g_speedIndex];
    uint8_t  step      = 0;
    uint32_t timeAccum = 0;
    uint32_t lastTick  = 0;
    uint32_t loopRateAccum = 0;  /* ms elapsed toward the next 1s loop-rate sample */

    /* Reference point for Main_GetApproxStackUsedBytes() — captured here,
       close to the top of main(), so it represents "stack depth with
       nothing but main() on it" as the zero point. */
    volatile int stackTopMarker = 0;
    g_stackTop = (const void *)&stackTopMarker;

    /* Main loop — non-blocking.
       USB and Ethernet are polled every iteration at maximum speed.
       Switch debouncing and LED updates only run when 1ms ticks accumulate. */
    while ( true )
    {
        /* --- Workaround: clear IPL every iteration ---
           The bare-metal ISR wrappers clear IPL on return, but something
           (likely the ETH or DMA ISR) still sets IPL=3 occasionally.
           Clearing it here ensures interrupts keep firing. */
        {
            uint32_t cp0_status = _CP0_GET_STATUS();
            if ((cp0_status & 0x1C00U) != 0U)
            {
                cp0_status &= ~0x1C00U;
                _CP0_SET_STATUS(cp0_status);
            }
        }

        /* --- USB polling (every iteration, maximum speed) --- */
        DRV_USBFS_Tasks(sysObj.drvUSBFSObject);
        USB_DEVICE_Tasks(sysObj.usbDevObject0);
        Console_Tasks();
        Console_Service();

        /* --- Ethernet TCP/IP ---
           Held off for the first ETH_START_DELAY_MS after boot so USB
           enumeration gets a completely uncontested head start (the
           original motivation for gating this at all: TCPIP_STACK_Task()
           can otherwise starve USB polling while the host is enumerating
           the device). A fixed delay is used instead of gating on USB
           actually finishing enumeration/configuration — Ethernet has no
           functional dependency on USB, and gating on USB state made
           networking hang indefinitely on hosts where the USB CDC driver
           fails to fully configure (observed as Windows Device Manager
           Code 10 on the USB Serial port after some reflashes), even
           though the board and network side were otherwise fine. */
        if (g_msTick >= ETH_START_DELAY_MS)
        {
            Ethernet_Tasks();
            Dashboard_Tasks();
        }

        /* --- Loop-rate sampling (for the dashboard's CPU load estimate) --- */
        g_loopCounter++;

        /* --- 1ms tick (non-blocking) --- */
        if (TMR3_MsTick())
        {
            uint32_t elapsed = g_msTick - lastTick;
            lastTick = g_msTick;
            timeAccum += elapsed;

            /* Loop-rate sample — every 1000ms, snapshot how many main loop
               iterations happened, reset the counter, and track the
               highest rate seen so far (used as the CPU-load baseline). */
            loopRateAccum += elapsed;
            if (loopRateAccum >= 1000U)
            {
                loopRateAccum = 0U;
                g_loopRate    = g_loopCounter;
                g_loopCounter = 0U;
                if (g_loopRate > g_loopRateMax)
                {
                    g_loopRateMax = g_loopRate;
                }
            }

            /* Switch debouncing — sample every DEBOUNCE_SAMPLE_MS */
            static uint32_t debounceAccum = 0;
            debounceAccum += elapsed;
            if (debounceAccum >= DEBOUNCE_SAMPLE_MS)
            {
                debounceAccum = 0;

                if (Switch_Debounce(0, SWITCH1_Get()))
                {
                    g_ledMode = (LedMode)((g_ledMode + 1) % LED_MODE_COUNT);
                    g_allLedsOn = false;
                    step = 0;

                    if (Console_IsConnected())
                    {
                        Console_Print("LED mode changed: ");
                        switch (g_ledMode)
                        {
                            case LED_MODE_RUNNING:  Console_Println("Running"); break;
                            case LED_MODE_ALTERNATE: Console_Println("Alternate"); break;
                            case LED_MODE_ALL_BLINK: Console_Println("All Blink"); break;
                            default: break;
                        }
                    }
                }

                if (Switch_Debounce(1, SWITCH2_Get()))
                {
                    g_speedIndex = (g_speedIndex + 1) % SPEED_COUNT;
                    speedMs = g_speedTable[g_speedIndex];
                    timeAccum = 0;

                    if (Console_IsConnected())
                    {
                        Console_Print("Speed changed: ");
                        char numBuf[16];
                        uint32_t val = speedMs;
                        int idx = 0;
                        if (val == 0)
                        {
                            numBuf[idx++] = '0';
                        }
                        else
                        {
                            char tmp[16];
                            int tmpIdx = 0;
                            while (val > 0 && tmpIdx < 15)
                            {
                                tmp[tmpIdx++] = '0' + (val % 10);
                                val /= 10;
                            }
                            while (tmpIdx > 0)
                            {
                                numBuf[idx++] = tmp[--tmpIdx];
                            }
                        }
                        numBuf[idx] = '\0';
                        Console_Print(numBuf);
                        Console_Println("ms");
                    }
                }

                if (Switch_Debounce(2, SWITCH3_Get()))
                {
                    g_allLedsOn = !g_allLedsOn;
                    if (g_allLedsOn)
                    {
                        LEDs_AllOn();
                    }
                    else
                    {
                        LEDs_AllOff();
                    }

                    if (Console_IsConnected())
                    {
                        Console_Println(g_allLedsOn ? "All LEDs ON" : "All LEDs OFF");
                    }
                }
            }

            /* LED pattern update (every speedMs).
               Re-read from g_speedIndex each time (rather than relying on the
               cached local speedMs) so external changes, e.g. from the web
               dashboard's Main_CycleSpeed(), take effect immediately. */
            speedMs = g_speedTable[g_speedIndex];
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
        }
    }

    /* Execution should not come here during normal operation */

    return ( EXIT_FAILURE );
}


/*******************************************************************************
 End of File
*/

