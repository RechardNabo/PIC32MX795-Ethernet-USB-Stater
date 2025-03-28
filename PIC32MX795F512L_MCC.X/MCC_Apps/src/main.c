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
#define CAN         (0x01)
#define ADC         (1+CAN)
// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************
void DetectArchitecture(uint8_t* archMessage, uint8_t* archLength);
int main ( void ){
    bool messageStatus = false;
    uint8_t archMessage[8];
    uint8_t archLength = 0;
    char MSG [8];
    int state = 1;
    uint_fast16_t ADC_RAW;
    /* Initialize all modules */
    SYS_Initialize ( NULL );
    /* Prepare the message to send with "PIC32MX" text */
    uint32_t messageID = 0x122;  // Set ID to 0x123 as requested
        /* Detect architecture */
    DetectArchitecture(archMessage, &archLength);
    CORETIMER_Start();
    ADC_Enable();
    while ( true ){
        switch(state){
            case CAN:
                messageStatus = CAN1_MessageTransmit(messageID, archLength, archMessage, 0, CAN_MSG_TX_DATA_FRAME);
                if(!messageStatus){
                    LED2_On();
                }
                CORETIMER_DelayMs(500);
                LED3_Toggle();
                state = ADC;
            break;
            
            case ADC:
                LED3_On();
                    
                    ADC_ConversionStart();
                    ADC_SamplingStart();
                    while(!ADC_ResultIsReady());
                    ADC_RAW = ADC_ResultGet(ADC_RESULT_BUFFER_0);
                    sprintf(MSG, "ADC:0x%x",ADC_RAW);
                    CORETIMER_DelayMs(100);
                    state = CAN;
                    LED3_Off();
                break;
        }
        SYS_Tasks();
    }
    /* Execution should not come here during normal operation */
    return ( EXIT_FAILURE );
}

void DetectArchitecture(uint8_t* archMessage, uint8_t* archLength) {
    #if defined(__PIC32MX__)
        *archLength = 7;
        archMessage[0] = 'P';
        archMessage[1] = 'I';
        archMessage[2] = 'C';
        archMessage[3] = '3';
        archMessage[4] = '2';
        archMessage[5] = 'M';
        archMessage[6] = 'X';
    #elif defined(__AVR__)
        *archLength = 3;
        archMessage[0] = 'A';
        archMessage[1] = 'V';
        archMessage[2] = 'R';
    #elif defined(__arm__)
        *archLength = 3;
        archMessage[0] = 'A';
        archMessage[1] = 'R';
        archMessage[2] = 'M';
    #elif defined(__xtensa__)
        *archLength = 6;
        archMessage[0] = 'X';
        archMessage[1] = 't';
        archMessage[2] = 'e';
        archMessage[3] = 'n';
        archMessage[4] = 's';
        archMessage[5] = 'a';
    #elif defined(__riscv)
        *archLength = 6;
        archMessage[0] = 'R';
        archMessage[1] = 'I';
        archMessage[2] = 'S';
        archMessage[3] = 'C';
        archMessage[4] = '-';
        archMessage[5] = 'V';
    #elif defined(__SAM3X8E__)
        *archLength = 6;
        archMessage[0] = 'S';
        archMessage[1] = 'A';
        archMessage[2] = 'M';
        archMessage[3] = '3';
        archMessage[4] = 'X';
        archMessage[5] = '8';
    #elif defined(ARDUINO_ARCH_STM32)
        *archLength = 5;
        archMessage[0] = 'S';
        archMessage[1] = 'T';
        archMessage[2] = 'M';
        archMessage[3] = '3';
        archMessage[4] = '2';
    #elif defined(ARDUINO_ARCH_MEGAAVR)
        *archLength = 7;
        archMessage[0] = 'M';
        archMessage[1] = 'e';
        archMessage[2] = 'g';
        archMessage[3] = 'a';
        archMessage[4] = 'A';
        archMessage[5] = 'V';
        archMessage[6] = 'R';
    #else
        *archLength = 7;
        archMessage[0] = 'U';
        archMessage[1] = 'n';
        archMessage[2] = 'k';
        archMessage[3] = 'n';
        archMessage[4] = 'o';
        archMessage[5] = 'w';
        archMessage[6] = 'n';
    #endif
}
/*******************************************************************************
 End of File
*/
