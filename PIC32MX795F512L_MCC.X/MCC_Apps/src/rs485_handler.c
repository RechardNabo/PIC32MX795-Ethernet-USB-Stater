#include "rs485_handler.h"
#include "definitions.h"
#include <string.h>
#include <stdio.h>

// Define RS485 direction control pin
#define RS485_DIR_PIN              LATFbits.LATF12  // Use RF12 for direction control
#define RS485_TX_PIN_VALUE         1                // HIGH for transmit
#define RS485_RX_PIN_VALUE         0                // LOW for receive

// Message to send
const char RS485_MESSAGE[] = "PIC32MX MAX485";

// Buffer to receive data
#define RECEIVE_BUFFER_SIZE 64
static uint8_t receiveBuffer[RECEIVE_BUFFER_SIZE];
static bool receiveCompleteFlag = false;
static bool transmitCompleteFlag = false;

// Static function declaration
static void RS485_SetDirection(bool transmit);

// Function implementations
void RS485_Init(void)
{
    // Set direction pin as output
    TRISFbits.TRISF12 = 0;
    
    // Set initial direction to receive
    RS485_SetDirection(false);
    
    // Reset flags
    receiveCompleteFlag = false;
    transmitCompleteFlag = false;
    
    // Register UART callbacks
    UART2_ReadCallbackRegister(UART_ReceiveCallback, 0);
    UART2_WriteCallbackRegister(UART_TransmitCallback, 0);
}

void RS485_SendMessage(const char* message)
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

void RS485_CheckForReceivedData(void)
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
void UART_ReceiveCallback(uintptr_t context)
{
    // Handle received data here
    // You may want to add your receive buffer handling logic
    receiveCompleteFlag = true;
}

// UART TX callback function
void UART_TransmitCallback(uintptr_t context)
{
    // Handle transmit complete events here
    transmitCompleteFlag = true;
}

// Function to control RS485 direction
static void RS485_SetDirection(bool transmit)
{
    if (transmit) {
        RS485_DIR_PIN = RS485_TX_PIN_VALUE;  // Set high for transmit
    } else {
        RS485_DIR_PIN = RS485_RX_PIN_VALUE;  // Set low for receive
    }
}
