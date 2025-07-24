#ifndef CAN_HANDLER_H
#define CAN_HANDLER_H

#include <stdint.h>
#include <stdbool.h>
#include "../../../CAN_bus.h"

// CAN Message IDs
extern uint32_t architectureID;
extern uint32_t temperatureID;
extern uint32_t voltageID;
extern uint32_t currentID;
extern uint32_t powerID;

// Function prototypes
void CAN_InitializeIDs(void);
bool CAN_ProcessMessage(uint32_t messageID, uint8_t* message, uint8_t length);
void CAN_DetectArchitecture(uint8_t* archMessage, uint8_t* archLength);

#endif // CAN_HANDLER_H
