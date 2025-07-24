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
#include "rf_transmitter.h"            // RF 433MHz transmitter
#define CAN         (0x01)
#define UART        (CAN+0x01)
#define MODBUS      (UART+0x01)
#define RF          (MODBUS+0x01)
#define DELAY       200
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
    
    // Initialize CAN extended IDs
    CAN_InitializeIDs();
    
    // Initialize RF transmitter
    RF_Init();
    
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
                if(!CAN_ProcessMessage(architectureID, canMsg, length)) {
                    LED2_On();
                }
                CORETIMER_DelayMs(DELAY/2);
                
                // Then send dummy temperature data
                memset(canMsg, 0, sizeof(canMsg));
                canMsg[0] = 25; // Example temperature value (25°C)
                canMsg[1] = 0;  // Temperature decimal part
                if(!CAN_ProcessMessage(temperatureID, canMsg, 2)) {
                    LED2_On();
                }
                CORETIMER_DelayMs(DELAY/2);
                
                // Send dummy voltage data
                memset(canMsg, 0, sizeof(canMsg));
                // Pack a 3.3V value: 3.3 * 1000 = 3300 (to preserve 3 decimal places)
                canMsg[0] = (3300 & 0xFF);       // LSB
                canMsg[1] = (3300 >> 8) & 0xFF;  // MSB
                if(!CAN_ProcessMessage(voltageID, canMsg, 2)) {
                    LED2_On();
                }
                CORETIMER_DelayMs(DELAY/2);
                
                // Send dummy current data
                memset(canMsg, 0, sizeof(canMsg));
                // Pack a 100mA value: 0.1 * 1000 = 100 (to preserve 3 decimal places)
                canMsg[0] = (100 & 0xFF);        // LSB
                canMsg[1] = (100 >> 8) & 0xFF;   // MSB
                if(!CAN_ProcessMessage(currentID, canMsg, 2)) {
                    LED2_On();
                }
                state = UART;
                LED3_Off();
                CORETIMER_DelayMs(DELAY);
            break;
            
            case UART:
                LED3_On();
                RS485_SendMessage(RS485_MESSAGE);
                CORETIMER_DelayMs(DELAY);
                RS485_CheckForReceivedData();
                CORETIMER_DelayMs(DELAY);
                LED3_Off();
                state = MODBUS;
                CORETIMER_DelayMs(DELAY);
                break;
                
            case MODBUS:
                LED3_On();
                Modbus_Process();
                CORETIMER_DelayMs(DELAY);
                LED3_Off();
                state = RF;
                CORETIMER_DelayMs(DELAY);
                break;
                
            case RF:
                LED3_On();
                LED2_On(); // Visual indicator for RF transmission
                
                // Message to send
                const char* message = "PIC32MX RF TEST";
                
                // First, demonstrate basic ASCII transmission (original method)
                printf("\nSending basic ASCII message...\n");
                RF_SendMessage(message);
                CORETIMER_DelayMs(500);
                
                // Then demonstrate enhanced protocol with framing
                printf("\nSending with protocol framing...\n");
                RF_SendStructuredPacket((const uint8_t*)message, strlen(message));
                CORETIMER_DelayMs(500);
                
                // Finally demonstrate Manchester encoding for noisy environments
                printf("\nSending with Manchester encoding...\n");
                RF_SendEncodedPacket((const uint8_t*)message, strlen(message));
                CORETIMER_DelayMs(500);
                
                // Turn off LEDs and move to next state
                LED3_Off();
                LED2_Off();
                state = CAN;
                CORETIMER_DelayMs(DELAY);
                break;
        }
        SYS_Tasks();
    }
    /* Execution should not come here during normal operation */
    return ( EXIT_FAILURE );
}
