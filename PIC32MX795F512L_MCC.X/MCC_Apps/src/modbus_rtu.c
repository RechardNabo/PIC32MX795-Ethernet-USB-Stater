#include "modbus_rtu.h"
#include "definitions.h"

// Private variables
static uint16_t modbusRegisters[32];  // Holding registers
static bool modbusReceiveCompleteFlag = false;
static bool modbusTransmitCompleteFlag = false;
static uint16_t modbusRxCount = 0;
static uint16_t modbusTxCount = 0;
static uint8_t currentModbusAddress = MODBUS_SLAVE_ADDRESS;
static uint8_t modbusRxBuffer[MODBUS_BUFFER_SIZE];
static uint8_t modbusTxBuffer[MODBUS_BUFFER_SIZE];

// Private function declarations
static uint16_t Modbus_CRC16(uint8_t *puchMsg, uint16_t usDataLen);
static bool Modbus_ValidateMessage(uint8_t *buffer, uint16_t length);
static void Modbus_HandleRequest(void);
static void Modbus_SendResponse(uint8_t *buffer, uint16_t length);
static void RS485_SetDirection(bool transmit);

// Function implementations
void Modbus_Init(void)
{
    // Initialize holding registers with test values
    for (int i = 0; i < 32; i++) {
        modbusRegisters[i] = i + 100;
    }
    
    // Set direction to receive initially
    RS485_SetDirection(false);
    
    // Reset flags
    modbusReceiveCompleteFlag = false;
    modbusTransmitCompleteFlag = false;
}

void Modbus_Process(void)
{
    // Set direction to receive
    RS485_SetDirection(false);
    
    // Reset flag
    modbusReceiveCompleteFlag = false;
    modbusRxCount = 0;
    
    // Start a read operation
    UART2_Read(modbusRxBuffer, MODBUS_BUFFER_SIZE);
    
    // Wait briefly for any data (non-blocking approach)
    CORETIMER_DelayMs(200);  // Longer timeout for Modbus
    
    // Check if we received anything
    if (modbusReceiveCompleteFlag) {
        // Get received byte count
        modbusRxCount = UART2_ReadCountGet();
        
        // Validate and process the message if it's for us
        if (Modbus_ValidateMessage(modbusRxBuffer, modbusRxCount)) {
            // Process the Modbus request
            Modbus_HandleRequest();
        }
    }
}

void Modbus_SetSlaveAddress(uint8_t address)
{
    currentModbusAddress = address;
}

uint8_t Modbus_GetCurrentSlaveAddress(void)
{
    return currentModbusAddress;
}

static void RS485_SetDirection(bool transmit)
{
    if (transmit) {
        LATFbits.LATF12 = 1;  // Set high for transmit
    } else {
        LATFbits.LATF12 = 0;  // Set low for receive
    }
}

static uint16_t Modbus_CRC16(uint8_t *puchMsg, uint16_t usDataLen)
{
    uint16_t usCrc = 0xFFFF;
    
    for (uint16_t i = 0; i < usDataLen; i++) {
        usCrc ^= (uint16_t)puchMsg[i];
        
        for (uint16_t j = 0; j < 8; j++) {
            if (usCrc & 0x0001) {
                usCrc = (usCrc >> 1) ^ 0xA001;
            } else {
                usCrc = usCrc >> 1;
            }
        }
    }
    
    return usCrc;
}

static bool Modbus_ValidateMessage(uint8_t *buffer, uint16_t length)
{
    // Check minimum length
    if (length < 4) {
        return false;
    }
    
    // Check if this message is for us
    if (buffer[0] != currentModbusAddress) {
        return false;
    }
    
    // Check CRC
    uint16_t receivedCRC = buffer[length-2] | (buffer[length-1] << 8);
    uint16_t calculatedCRC = Modbus_CRC16(buffer, length-2);
    
    return (receivedCRC == calculatedCRC);
}

static void Modbus_HandleRequest(void)
{
    uint8_t function = modbusRxBuffer[1];
    uint16_t startAddress = 0, quantity = 0, value = 0;
    uint8_t byteCount = 0;
    
    modbusTxBuffer[0] = currentModbusAddress;  // Slave Address
    modbusTxBuffer[1] = function;              // Function code
    
    switch (function) {
        case MODBUS_FUNCTION_READ_HOLDING_REGISTERS:
            // Parse request
            startAddress = (modbusRxBuffer[2] << 8) | modbusRxBuffer[3];
            quantity = (modbusRxBuffer[4] << 8) | modbusRxBuffer[5];
            
            // Check if within valid range
            if (startAddress + quantity <= 32) {
                // Format response
                modbusTxBuffer[2] = quantity * 2;  // Byte count
                
                // Copy register values
                for (int i = 0; i < quantity; i++) {
                    modbusTxBuffer[3 + i*2] = (modbusRegisters[startAddress + i] >> 8) & 0xFF;
                    modbusTxBuffer[4 + i*2] = modbusRegisters[startAddress + i] & 0xFF;
                }
                
                // Calculate CRC
                uint16_t crc = Modbus_CRC16(modbusTxBuffer, 3 + quantity*2);
                modbusTxBuffer[3 + quantity*2] = crc & 0xFF;
                modbusTxBuffer[4 + quantity*2] = (crc >> 8) & 0xFF;
                
                // Set response length
                modbusTxCount = 5 + quantity*2;
            } else {
                // Error response - illegal data address
                modbusTxBuffer[1] |= 0x80;
                modbusTxBuffer[2] = 0x02;
                
                // Calculate CRC
                uint16_t crc = Modbus_CRC16(modbusTxBuffer, 3);
                modbusTxBuffer[3] = crc & 0xFF;
                modbusTxBuffer[4] = (crc >> 8) & 0xFF;
                
                // Set response length
                modbusTxCount = 5;
            }
            break;

        case MODBUS_FUNCTION_WRITE_SINGLE_REGISTER:
            // Parse request
            startAddress = (modbusRxBuffer[2] << 8) | modbusRxBuffer[3];
            value = (modbusRxBuffer[4] << 8) | modbusRxBuffer[5];
            
            // Check if address is valid
            if (startAddress < 32) {
                // Write the value to register
                modbusRegisters[startAddress] = value;
                
                // Format response (echo the request for this function)
                for (int i = 0; i < 6; i++) {
                    modbusTxBuffer[i] = modbusRxBuffer[i];
                }
                
                // Calculate CRC
                uint16_t crc = Modbus_CRC16(modbusTxBuffer, 6);
                modbusTxBuffer[6] = crc & 0xFF;
                modbusTxBuffer[7] = (crc >> 8) & 0xFF;
                
                // Set response length
                modbusTxCount = 8;
            } else {
                // Error response - illegal data address or value
                modbusTxBuffer[1] |= 0x80;  // Set MSB for error
                modbusTxBuffer[2] = 0x02;   // Illegal data address
                
                // Calculate CRC
                uint16_t crc = Modbus_CRC16(modbusTxBuffer, 3);
                modbusTxBuffer[3] = crc & 0xFF;
                modbusTxBuffer[4] = (crc >> 8) & 0xFF;
                
                // Set response length
                modbusTxCount = 5;
            }
            break;
            
        case MODBUS_FUNCTION_WRITE_MULTIPLE_REGISTERS:
            // Parse request
            startAddress = (modbusRxBuffer[2] << 8) | modbusRxBuffer[3];
            quantity = (modbusRxBuffer[4] << 8) | modbusRxBuffer[5];
            byteCount = modbusRxBuffer[6];
            
            // Check if address and quantity are valid
            if ((startAddress + quantity <= 32) && (byteCount == quantity * 2)) {
                // Write values to registers
                for (int i = 0; i < quantity; i++) {
                    modbusRegisters[startAddress + i] = (modbusRxBuffer[7 + i*2] << 8) | modbusRxBuffer[8 + i*2];
                }
                
                // Format response
                for (int i = 0; i < 6; i++) {
                    modbusTxBuffer[i] = modbusRxBuffer[i];
                }
                
                // Calculate CRC
                uint16_t crc = Modbus_CRC16(modbusTxBuffer, 6);
                modbusTxBuffer[6] = crc & 0xFF;
                modbusTxBuffer[7] = (crc >> 8) & 0xFF;
                
                // Set response length
                modbusTxCount = 8;
            } else {
                // Error response
                modbusTxBuffer[1] |= 0x80;  // Set MSB for error
                modbusTxBuffer[2] = 0x02;   // Illegal data address or count
                
                // Calculate CRC
                uint16_t crc = Modbus_CRC16(modbusTxBuffer, 3);
                modbusTxBuffer[3] = crc & 0xFF;
                modbusTxBuffer[4] = (crc >> 8) & 0xFF;
                
                // Set response length
                modbusTxCount = 5;
            }
            break;
                
        default:
            // Unsupported function code
            modbusTxBuffer[1] |= 0x80;  // Set MSB for error
            modbusTxBuffer[2] = 0x01;   // Illegal function
            
            // Calculate CRC
            uint16_t crc = Modbus_CRC16(modbusTxBuffer, 3);
            modbusTxBuffer[3] = crc & 0xFF;
            modbusTxBuffer[4] = (crc >> 8) & 0xFF;
            
            // Set response length
            modbusTxCount = 5;
            break;
    }
    
    // Send the response
    Modbus_SendResponse(modbusTxBuffer, modbusTxCount);
}

static void Modbus_SendResponse(uint8_t *buffer, uint16_t length)
{
    // Set direction to transmit
    RS485_SetDirection(true);
    
    // Small delay to ensure direction is set
    CORETIMER_DelayMs(10);
    
    // Reset flag
    modbusTransmitCompleteFlag = false;
    
    // Send the response
    UART2_Write(buffer, length);
    
    // Wait for transmission to complete
    while (!UART2_TransmitComplete());
    
    // Small delay to ensure message is fully sent
    CORETIMER_DelayMs(10);
    
    // Set direction back to receive
    RS485_SetDirection(false);
}
