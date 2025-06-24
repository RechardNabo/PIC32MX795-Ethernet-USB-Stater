#ifndef CAN_HANDLER_H
#define CAN_HANDLER_H

#include <stdint.h>
#include <stdbool.h>

// CAN Message ID
extern uint32_t messageID;

// Function prototypes
bool CAN_ProcessMessage(uint32_t messageID, uint8_t* message, uint8_t length);
void CAN_DetectArchitecture(uint8_t* archMessage, uint8_t* archLength);

#endif // CAN_HANDLER_H
