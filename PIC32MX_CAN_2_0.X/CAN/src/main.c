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
        
        // Use two 500ms delays to create a 1-second interval
        CORETIMER_DelayMs(500);
        CORETIMER_DelayMs(500);
        
        SYS_Tasks();
    }
    /* Execution should not come here during normal operation */
    return ( EXIT_FAILURE );
}
/*******************************************************************************
 End of File
*/