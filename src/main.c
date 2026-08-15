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

    /* Running LED sequence: only one LED on at a time.
       Uses TMR3 polling (no ISR, no FreeRTOS scheduler needed). */
    while ( true )
    {
        LED1_On();  LED2_Off(); LED3_Off();
        TMR3_DelayMs(100);

        LED1_Off(); LED2_On();  LED3_Off();
        TMR3_DelayMs(100);

        LED1_Off(); LED2_Off(); LED3_On();
        TMR3_DelayMs(100);
    }

    /* Execution should not come here during normal operation */

    return ( EXIT_FAILURE );
}


/*******************************************************************************
 End of File
*/

