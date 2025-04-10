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
#define UART         (1+CAN)

// Define RS485 direction control pin
#define RS485_DIR_PIN              LATFbits.LATF12  // Use RF12 for direction control
#define RS485_TX_PIN_VALUE         1                // HIGH for transmit
#define RS485_RX_PIN_VALUE         0                // LOW for receive

// Message to send
#define RS485_MESSAGE "PIC32MX MAX485"

// Buffer to receive data
#define RECEIVE_BUFFER_SIZE 64
static uint8_t receiveBuffer[RECEIVE_BUFFER_SIZE];
static bool receiveCompleteFlag = false;
static bool transmitCompleteFlag = false;

// Callback functions
static void UART_ReceiveCallback(uintptr_t context);
static void UART_TransmitCallback(uintptr_t context);
// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************
// Function to control RS485 direction
static void RS485_SetDirection(bool transmit)
{
    if (transmit) {
        RS485_DIR_PIN = RS485_TX_PIN_VALUE;  // Set high for transmit
    } else {
        RS485_DIR_PIN = RS485_RX_PIN_VALUE;  // Set low for receive
    }
}

// Function to send message over UART2/RS485
static void RS485_SendMessage(const char* message)
{
    // Set direction to transmit
    RS485_SetDirection(true);
    
    // Small delay to ensure direction is set
    CORETIMER_DelayMs(20);
    
    // Reset the flag
    transmitCompleteFlag = false;
    
    // Send the message
    UART2_Write((void*)message, strlen(message));
    
    // Wait for transmission to complete
    while (!UART2_TransmitComplete());
    
    // Small delay to ensure message is fully sent
    CORETIMER_DelayMs(50);
    
    // Set direction back to receive
    RS485_SetDirection(false);
}

// Function to check for received data
static void RS485_CheckForReceivedData(void)
{
    // Set direction to receive
    RS485_SetDirection(false);
    
    // Reset flag
    receiveCompleteFlag = false;
    
    // Start a read operation
    UART2_Read(receiveBuffer, RECEIVE_BUFFER_SIZE);
    
    // Wait briefly for any data (non-blocking approach)
    CORETIMER_DelayMs(100);
    
    // Check if we received anything
    if (receiveCompleteFlag) {
        // Process received data
        printf("Data received: %s\n", receiveBuffer);
        
        // Here you could check for specific message patterns
        if (strstr((char*)receiveBuffer, "ESP32") != NULL) {
            printf("Detected ESP32 message!\n");
        } else if (strstr((char*)receiveBuffer, "Raspberry") != NULL) {
            printf("Detected Raspberry Pi message!\n");
        }
    }
}

// UART RX callback function
static void UART_ReceiveCallback(uintptr_t context)
{
    receiveCompleteFlag = true;
}

// UART TX callback function
static void UART_TransmitCallback(uintptr_t context)
{
    transmitCompleteFlag = true;
}
void DetectArchitecture(uint8_t* archMessage, uint8_t* archLength);
int main ( void ){
    bool messageStatus = false;
    uint8_t archMessage[8];
    uint8_t archLength = 0;
    //char MSG [8];
    int state = 1;
    //uint_fast16_t ADC_RAW;
    /* Initialize all modules */
    SYS_Initialize ( NULL );
    /* Prepare the message to send with "PIC32MX" text */
    uint32_t messageID = 0x122;  // Set ID to 0x123 as requested
        /* Detect architecture */
    DetectArchitecture(archMessage, &archLength);
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
    // Register callbacks
    UART2_ReadCallbackRegister(UART_ReceiveCallback, 0);
    UART2_WriteCallbackRegister(UART_TransmitCallback, 0);
    LED3_On();
    TRISFbits.TRISF12 = 0;      // Set RF12 as output
    while ( true ){
        switch(state){
            case 1:
            LED3_On();
            messageStatus = CAN1_MessageTransmit(messageID, archLength, archMessage, 0, CAN_MSG_TX_DATA_FRAME);
            if(!messageStatus){
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
                state = 1;
                CORETIMER_DelayMs(500);
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
