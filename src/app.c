/*******************************************************************************
  MPLAB Harmony Application Source File

  Company:
    Microchip Technology Inc.

  File Name:
    app.c

  Summary:
    This file contains the source code for the MPLAB Harmony application.

  Description:
    This file contains the source code for the MPLAB Harmony application.  It
    implements the logic of the application's state machine and it may call
    API routines of other MPLAB Harmony modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
 *******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include "app.h"

/* Blink interval in milliseconds (converted to FreeRTOS ticks at runtime) */
#define APP_BLINK_INTERVAL_MS   (500U)

/* Simple busy-wait delay that does NOT depend on FreeRTOS tick.
   Used as a diagnostic to determine if APP_Tasks is running at all.
   At 80MHz PBCLK, each loop iteration is ~3 instructions ≈ 3 cycles.
   500ms ≈ 40,000,000 cycles ≈ 13,333,333 iterations. */
static void APP_BusyWaitMs(uint32_t ms)
{
    volatile uint32_t count;
    /* 80MHz CPU, ~26667 iterations per ms (3 cycles per iteration) */
    const uint32_t itersPerMs = 26667U;
    while (ms > 0U)
    {
        count = itersPerMs;
        while (count > 0U)
        {
            count--;
        }
        ms--;
    }
}

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the APP_Initialize function.

    Application strings and buffers are be defined outside this structure.
*/

APP_DATA appData;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary callback functions.
*/

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************


/* TODO:  Add any necessary local functions.
*/


// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_Initialize ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    appData.state = APP_STATE_INIT;

    /* Start with LED1 active */
    appData.activeLed = 0U;
}


/******************************************************************************
  Function:
    void APP_Tasks ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Tasks ( void )
{
    /* Check the application's current state. */
    switch ( appData.state )
    {
        /* Application's initial state. */
        case APP_STATE_INIT:
        {
            /* Turn all LEDs off, then light the first one */
            LED1_Off();
            LED2_Off();
            LED3_Off();
            LED1_On();
            appData.activeLed = 0U;

            appData.state = APP_STATE_LED_BLINK_WAIT;
            break;
        }

        case APP_STATE_LED_BLINK_WAIT:
        {
            /* DIAGNOSTIC: Using busy-wait instead of vTaskDelay to determine
               if the FreeRTOS tick interrupt is the problem. If LEDs blink
               with this but not with vTaskDelay, the tick ISR isn't firing. */
            APP_BusyWaitMs(APP_BLINK_INTERVAL_MS);

            /* Turn off the currently active LED */
            switch (appData.activeLed)
            {
                case 0U: LED1_Off(); break;
                case 1U: LED2_Off(); break;
                case 2U: LED3_Off(); break;
                default: /* should not happen */ break;
            }

            /* Advance to the next LED (wrap around after LED3) */
            appData.activeLed = (appData.activeLed + 1U) % 3U;

            /* Turn on the new active LED */
            switch (appData.activeLed)
            {
                case 0U: LED1_On(); break;
                case 1U: LED2_On(); break;
                case 2U: LED3_On(); break;
                default: /* should not happen */ break;
            }
            break;
        }

        case APP_STATE_SERVICE_TASKS:
        {
            /* Idle state */
            break;
        }

        /* The default state should never be executed. */
        default:
        {
            /* TODO: Handle error in application's state machine. */
            break;
        }
    }
}


/*******************************************************************************
 End of File
 */
