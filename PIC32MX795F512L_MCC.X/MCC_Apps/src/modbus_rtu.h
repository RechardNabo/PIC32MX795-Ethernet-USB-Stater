#ifndef MODBUS_RTU_H
#define MODBUS_RTU_H

#include <stdint.h>
#include <stdbool.h>

// Modbus RTU constants
#define MODBUS_SLAVE_ADDRESS       0x03
#define MODBUS_SLAVE2_ADDRESS      0x05
#define MODBUS_BUFFER_SIZE         256
#define MODBUS_FUNCTION_READ_HOLDING_REGISTERS  0x03
#define MODBUS_FUNCTION_WRITE_SINGLE_REGISTER   0x06
#define MODBUS_FUNCTION_WRITE_MULTIPLE_REGISTERS 0x10

// Function prototypes
void Modbus_Init(void);
void Modbus_Process(void);
void Modbus_SetSlaveAddress(uint8_t address);
uint8_t Modbus_GetCurrentSlaveAddress(void);

#endif // MODBUS_RTU_H
