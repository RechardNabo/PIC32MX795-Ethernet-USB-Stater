#include "can_handler.h"
#include "definitions.h"

// Define source and destination node IDs
#define PIC32_NODE_ID           0x10    // This PIC32 node ID
#define BROADCAST_DEST         0xFF    // Broadcast to all nodes

// Create extended CAN IDs for different message types
uint32_t architectureID = 0;
uint32_t temperatureID = 0;
uint32_t voltageID = 0;
uint32_t currentID = 0;
uint32_t powerID = 0;

// Initialize the CAN IDs in a function to be called at startup
void CAN_InitializeIDs(void) {
    // Architecture ID message - high priority (5)
    architectureID = MAKE_EXTENDED_CAN_ID(PRIORITY_COMMAND, PIC32_NODE_ID, EXT_DEST_BROADCAST, MSG_ARCHITECTURE_ID);
    
    // Sensor data messages - normal priority (8)
    temperatureID = MAKE_EXTENDED_CAN_ID(PRIORITY_SENSOR_DATA, PIC32_NODE_ID, EXT_DEST_BROADCAST, MSG_TEMP_AMBIENT);
    voltageID = MAKE_EXTENDED_CAN_ID(PRIORITY_SENSOR_DATA, PIC32_NODE_ID, EXT_DEST_BROADCAST, MSG_ELECTRICAL_DC_VOLTAGE);
    currentID = MAKE_EXTENDED_CAN_ID(PRIORITY_SENSOR_DATA, PIC32_NODE_ID, EXT_DEST_BROADCAST, MSG_ELECTRICAL_DC_CURRENT);
    powerID = MAKE_EXTENDED_CAN_ID(PRIORITY_SENSOR_DATA, PIC32_NODE_ID, EXT_DEST_BROADCAST, MSG_ELECTRICAL_ACTIVE_POWER);
}
bool CAN_ProcessMessage(uint32_t messageID, uint8_t* message, uint8_t length)
{
    bool messageStatus = CAN1_MessageTransmit(messageID, length, message, 0, CAN_MSG_TX_DATA_FRAME);
    if(!messageStatus) {
        LED2_On();
    }
    return messageStatus;
}

void CAN_DetectArchitecture(uint8_t* archMessage, uint8_t* archLength)
{
    #if defined(__PIC32MX__)
        *archLength = 7;
        archMessage[0] = 'P';
        archMessage[1] = 'I';
        archMessage[2] = 'C';
        archMessage[3] = '3';
        archMessage[4] = '2';
        archMessage[5] = 'M';
        archMessage[6] = 'X';
    #elif defined(__PIC32MZ__)
        *archLength = 7;
        archMessage[0] = 'P';
        archMessage[1] = 'I';
        archMessage[2] = 'C';
        archMessage[3] = '3';
        archMessage[4] = '2';
        archMessage[5] = 'M';
        archMessage[6] = 'Z';
    #elif defined(__PIC32MK__)
        *archLength = 7;
        archMessage[0] = 'P';
        archMessage[1] = 'I';
        archMessage[2] = 'C';
        archMessage[3] = '3';
        archMessage[4] = '2';
        archMessage[5] = 'M';
        archMessage[6] = 'K';
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
