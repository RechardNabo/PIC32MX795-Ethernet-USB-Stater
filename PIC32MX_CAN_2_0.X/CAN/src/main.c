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

// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************
int main ( void ){
    uint32_t messageID = 0;
    uint8_t message[8];
    uint8_t messageLength = 0;
    bool messageStatus = false;
    
    /* Initialize all modules */
    SYS_Initialize ( NULL );
    /* Prepare the message to send with "PIC32MX" text */
    messageID = 0x123;  // Set ID to 0x123 as requested
    messageLength = 7;  // "PIC32MX" is 7 characters
    
    // Load the text "PIC32MX" into the message buffer
    message[0] = 'P';
    message[1] = 'I';
    message[2] = 'C';
    message[3] = '3';
    message[4] = '2';
    message[5] = 'M';
    message[6] = 'X';
    
    // Architecture detection message (max 8 bytes)
    uint8_t archMessage[8];
    uint8_t archLength = 0;
    
    #if defined(__AVR__)
        archLength = 3;
        archMessage[0] = 'A';
        archMessage[1] = 'V';
        archMessage[2] = 'R';
    #elif defined(__arm__)
        archLength = 3;
        archMessage[0] = 'A';
        archMessage[1] = 'R';
        archMessage[2] = 'M';
    #elif defined(__xtensa__)
        archLength = 6;
        archMessage[0] = 'X';
        archMessage[1] = 't';
        archMessage[2] = 'e';
        archMessage[3] = 'n';
        archMessage[4] = 's';
        archMessage[5] = 'a';
    #elif defined(__riscv)
        archLength = 6;
        archMessage[0] = 'R';
        archMessage[1] = 'I';
        archMessage[2] = 'S';
        archMessage[3] = 'C';
        archMessage[4] = '-';
        archMessage[5] = 'V';
    #elif defined(__SAM3X8E__)
        archLength = 6;
        archMessage[0] = 'S';
        archMessage[1] = 'A';
        archMessage[2] = 'M';
        archMessage[3] = '3';
        archMessage[4] = 'X';
        archMessage[5] = '8';
    #elif defined(ARDUINO_ARCH_STM32)
        archLength = 5;
        archMessage[0] = 'S';
        archMessage[1] = 'T';
        archMessage[2] = 'M';
        archMessage[3] = '3';
        archMessage[4] = '2';
    #elif defined(ARDUINO_ARCH_MEGAAVR)
        archLength = 7;
        archMessage[0] = 'M';
        archMessage[1] = 'e';
        archMessage[2] = 'g';
        archMessage[3] = 'a';
        archMessage[4] = 'A';
        archMessage[5] = 'V';
        archMessage[6] = 'R';
    #else
        archLength = 7;
        archMessage[0] = 'U';
        archMessage[1] = 'n';
        archMessage[2] = 'k';
        archMessage[3] = 'n';
        archMessage[4] = 'o';
        archMessage[5] = 'w';
        archMessage[6] = 'n';
    #endif
    
    CORETIMER_Start();
    while ( true )
    {
        // Send the "PIC32MX" message with ID 0x123 and check if successful
        messageStatus = CAN1_MessageTransmit(messageID, messageLength, message, 0, CAN_MSG_TX_DATA_FRAME);
        
        // Toggle LED1 if message was NOT sent successfully
        if (!messageStatus)
        {
            LED1_Toggle();
        }
        
        // Send architecture message with ID 0x124
        messageStatus = CAN1_MessageTransmit(0x124, archLength, archMessage, 0, CAN_MSG_TX_DATA_FRAME);
        
        // Use two 500ms delays to create a 1-second interval
        CORETIMER_DelayMs(500);
        LED3_Toggle();
        SYS_Tasks();
    }
    /* Execution should not come here during normal operation */
    return ( EXIT_FAILURE );
}
/*******************************************************************************
 End of File
*/
