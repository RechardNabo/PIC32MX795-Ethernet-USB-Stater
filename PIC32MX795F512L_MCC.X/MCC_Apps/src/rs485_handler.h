#ifndef RS485_HANDLER_H
#define RS485_HANDLER_H

#include <stdint.h>
#include <stdbool.h>

// Function prototypes
void RS485_Init(void);
void RS485_SendMessage(const char* message);
void RS485_CheckForReceivedData(void);

// UART Callback functions
void UART_ReceiveCallback(uintptr_t context);
void UART_TransmitCallback(uintptr_t context);

extern const char RS485_MESSAGE[];  // Declaration for the RS485 message string

#endif // RS485_HANDLER_H
