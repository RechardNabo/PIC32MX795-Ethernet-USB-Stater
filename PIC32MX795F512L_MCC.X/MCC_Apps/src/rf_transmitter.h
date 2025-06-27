#ifndef RF_TRANSMITTER_H
#define RF_TRANSMITTER_H

#include <stdint.h>
#include <stdbool.h>
#include "definitions.h"

// Configure RF transmitter pin
#define RF_TRANSMITTER_PIN                  LATFbits.LATF2
#define RF_TRANSMITTER_PIN_VALUE_ON        1
#define RF_TRANSMITTER_PIN_VALUE_OFF       0

// Default RF module configuration
#define RF_DEFAULT_BAUD_RATE  2000    // 2000 bps by default
#define RF_DEFAULT_REPEAT     5       // Repeat transmissions for reliability

// Protocol constants inspired by RadioHead ASK library
#define RF_PREAMBLE_LENGTH    36      // 36 alternating bits (18 bit pairs)
#define RF_START_SYMBOL       0xB38   // 12-bit start symbol
#define RF_MAX_PAYLOAD_LEN    64      // Maximum payload length

// Function prototypes
void RF_Init(void);
void RF_SendByte(uint8_t byte);

// Basic transmission functions
void RF_SendPacket(const uint8_t* data, uint8_t length);
void RF_SendMessage(const char* message);

// ASCII-specific functions
void RF_SendASCIICharacter(char character);  // Send a single ASCII character
void RF_SendASCIIHexValue(uint8_t asciiValue);  // Send a specific ASCII value by its hex/decimal value

// Advanced protocol features
void RF_SendPreamble(void);  // Send preamble bits
void RF_SendStartSymbol(void);  // Send start symbol
void RF_SendStructuredPacket(const uint8_t* data, uint8_t length);  // Send with protocol framing

// Encoding functions
void RF_Send4to6EncodedByte(uint8_t byte);  // Send byte with 4-to-6 bit encoding
void RF_SendEncodedPacket(const uint8_t* data, uint8_t length);  // Manchester encoding

// Error detection
uint16_t RF_CalculateCRC16(const uint8_t* data, uint8_t length);  // Calculate CRC-16

// Configuration functions
void RF_SetBaudRate(uint32_t baudRate);
void RF_SetRepeatCount(uint8_t count);

#endif /* RF_TRANSMITTER_H */
