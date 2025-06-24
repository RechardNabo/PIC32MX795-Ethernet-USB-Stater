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
#include "can_handler.h"                // CAN communication functions
#include "modbus_rtu.h"                // Modbus RTU protocol
#include "rs485_handler.h"             // RS485 communication
#define CAN         (0x01)
#define UART        (CAN+0x01)
#define MODBUS      (UART+0x01)

// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************
// Function to control RS485 direction

int main ( void ){

    /* Initialize all modules */
    SYS_Initialize ( NULL );
    CORETIMER_Start();
    //ADC_Enable();
    
    // Configure UART2 for 9600 baud
    UART_SERIAL_SETUP serialSetup = {
        .baudRate = 9600,
        .dataWidth = UART_DATA_8_BIT,
        .parity = UART_PARITY_NONE,
        .stopBits = UART_STOP_1_BIT
    };
    bool setupStatus = UART2_SerialSetup(&serialSetup, CPU_CLOCK_FREQUENCY);
    if (!setupStatus) {
        printf("UART2 Serial Setup failed!\n");
        // You can continue as the initialize function already set up the UART
    }

    
    LED3_Off();
    LED2_Off();
    TRISFbits.TRISF12 = 0;      // Set RF12 as output
    
    int state = CAN;
    while ( true ){
        switch(state){
            case CAN:
                LED3_On();
                uint8_t canMsg[8] = {0};
                uint8_t length = 0;
                
                // First send architecture info
                CAN_DetectArchitecture(canMsg, &length);
                CAN_ProcessMessage(messageID, canMsg, length);
                
                // Then send application message
                memset(canMsg, 0, sizeof(canMsg));
                if(!CAN_ProcessMessage(messageID, canMsg, sizeof(canMsg))) {
                    LED2_On();
                }
                CORETIMER_DelayMs(500);
                state = UART;
                LED3_Off();
                CORETIMER_DelayMs(500);
            break;
            
            case UART:
                LED3_On();
                RS485_SendMessage(RS485_MESSAGE);
                CORETIMER_DelayMs(500);
                RS485_CheckForReceivedData();
                CORETIMER_DelayMs(500);
                LED3_Off();
                state = MODBUS;
                CORETIMER_DelayMs(500);
                break;
                
            case MODBUS:
                LED3_On();
                Modbus_Process();
                CORETIMER_DelayMs(500);
                LED3_Off();
                state = CAN;
                CORETIMER_DelayMs(500);
                break;
        }
        SYS_Tasks();
    }
    /* Execution should not come here during normal operation */
    return ( EXIT_FAILURE );
}
