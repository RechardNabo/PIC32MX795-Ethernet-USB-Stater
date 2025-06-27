#include "rf_transmitter.h"
#include <stdio.h>
#include <string.h>

// Static variables for configuration
static uint32_t rf_baudRate = RF_DEFAULT_BAUD_RATE;
static uint8_t rf_repeatCount = RF_DEFAULT_REPEAT;

// 4-to-6 bit encoding lookup table for improved DC balance
static const uint8_t RF_4to6BitTable[16] = {
    0x0D, 0x0E, 0x13, 0x15, 0x16, 0x19, 0x1A, 0x1C,
    0x23, 0x25, 0x26, 0x29, 0x2A, 0x2C, 0x32, 0x34
};

// Internal helper functions
static void RF_BitDelay(void)
{
    // Calculate delay based on baud rate
    // For a 2000 bps rate, we need 1/2000 = 0.0005 seconds = 500 microseconds per bit
    uint32_t delayTime = 1000000 / rf_baudRate; // in microseconds
    
    // Use core timer for accurate timing
    CORETIMER_DelayUs(delayTime);
}

// Initialize the RF transmitter
void RF_Init(void)
{
    // Set the RF transmitter pin as output
    TRISFbits.TRISF2 = 0;
    
    // Initialize the pin to LOW state
    RF_TRANSMITTER_PIN = RF_TRANSMITTER_PIN_VALUE_OFF;
}

// Send a single byte
void RF_SendByte(uint8_t byte)
{
    // Repeat transmission for reliability
    for (uint8_t repeat = 0; repeat < rf_repeatCount; repeat++) {
        // Send start bit (LOW for 3x bit period)
        RF_TRANSMITTER_PIN = RF_TRANSMITTER_PIN_VALUE_OFF;
        RF_BitDelay();
        RF_BitDelay();
        RF_BitDelay();
        
        // Send 8 bits, LSB first
        for (uint8_t i = 0; i < 8; i++) {
            // Check if current bit is 1 or 0
            if (byte & (1 << i)) {
                RF_TRANSMITTER_PIN = RF_TRANSMITTER_PIN_VALUE_ON;
            } else {
                RF_TRANSMITTER_PIN = RF_TRANSMITTER_PIN_VALUE_OFF;
            }
            
            // Hold for one bit period
            RF_BitDelay();
        }
        
        // Send stop bit (HIGH for 2x bit period)
        RF_TRANSMITTER_PIN = RF_TRANSMITTER_PIN_VALUE_ON;
        RF_BitDelay();
        RF_BitDelay();
        
        // Small delay between retransmissions
        RF_TRANSMITTER_PIN = RF_TRANSMITTER_PIN_VALUE_OFF;
        CORETIMER_DelayMs(5);
    }
}

// Send a packet of bytes (these are typically ASCII values for text data)
void RF_SendPacket(const uint8_t* data, uint8_t length)
{
    // Simple implementation - sending each byte with some delay between bytes
    for (uint8_t i = 0; i < length; i++) {
        // data[i] is already the ASCII value for text data
        RF_SendByte(data[i]);
        
        // Small delay between bytes
        CORETIMER_DelayMs(2);
    }
}

// Send a string message as ASCII
void RF_SendMessage(const char* message)
{
    // When sending a string message, we're already sending ASCII codes
    // Each character in a C string is already an ASCII value
    RF_SendPacket((const uint8_t*)message, strlen(message));
    
    // Debug: Print each ASCII value being sent
    printf("\nSending ASCII: ");
    for(size_t i = 0; i < strlen(message); i++) {
        printf("%02X ", (uint8_t)message[i]); // Print hex value of each ASCII character
    }
    printf("\n");
}

// Send a single ASCII character
void RF_SendASCIICharacter(char character)
{
    // Print debug info
    printf("Sending ASCII character: '%c' (0x%02X)\n", character, (uint8_t)character);
    
    // Send the ASCII value of this character
    RF_SendByte((uint8_t)character);
}

// Send a specific ASCII value by its hex/decimal value
void RF_SendASCIIHexValue(uint8_t asciiValue)
{
    // Get the character representation if it's printable
    char charRepresentation = (asciiValue >= 32 && asciiValue <= 126) ? (char)asciiValue : '.';
    
    // Print debug info
    printf("Sending ASCII value: 0x%02X (decimal %d, char '%c')\n", 
           asciiValue, asciiValue, charRepresentation);
    
    // Send the ASCII value
    RF_SendByte(asciiValue);
}

// Set the baud rate for transmission
void RF_SetBaudRate(uint32_t baudRate)
{
    if (baudRate > 0 && baudRate <= 10000) {  // Maximum 10Kbps as per module specs
        rf_baudRate = baudRate;
    }
}

// Set the repeat count for transmission reliability
void RF_SetRepeatCount(uint8_t count)
{
    if (count > 0 && count <= 10) {  // Reasonable limit
        rf_repeatCount = count;
    }
}

// Send preamble (36 alternating bits as specified in RadioHead)
void RF_SendPreamble(void)
{
    // Send 18 pairs of alternating 1-0 bits
    for (int i = 0; i < 18; i++) {
        RF_TRANSMITTER_PIN = RF_TRANSMITTER_PIN_VALUE_ON;
        RF_BitDelay();
        RF_TRANSMITTER_PIN = RF_TRANSMITTER_PIN_VALUE_OFF;
        RF_BitDelay();
    }
    
    printf("Sent RF preamble: 36 alternating bits\n");
}

// Send the 12-bit start symbol (0xB38 = 0b101100111000)
void RF_SendStartSymbol(void)
{
    // Send the 12-bit start symbol (0xB38) bit by bit, MSB first
    uint16_t symbol = RF_START_SYMBOL;
    
    for (int i = 11; i >= 0; i--) {
        if (symbol & (1 << i)) {
            RF_TRANSMITTER_PIN = RF_TRANSMITTER_PIN_VALUE_ON;
        } else {
            RF_TRANSMITTER_PIN = RF_TRANSMITTER_PIN_VALUE_OFF;
        }
        RF_BitDelay();
    }
    
    printf("Sent RF start symbol: 0x%03X\n", RF_START_SYMBOL);
}

// Send a structured packet with protocol framing
void RF_SendStructuredPacket(const uint8_t* data, uint8_t length)
{
    // Ensure the length is within bounds
    if (length > RF_MAX_PAYLOAD_LEN) {
        length = RF_MAX_PAYLOAD_LEN;
    }
    
    // For each repetition
    for (uint8_t rep = 0; rep < rf_repeatCount; rep++) {
        // 1. Send preamble
        RF_SendPreamble();
        
        // 2. Send start symbol
        RF_SendStartSymbol();
        
        // 3. Send packet length (including CRC bytes)
        RF_SendByte(length + 2);  // +2 for CRC
        
        // 4. Send data with 4-to-6 bit encoding
        for (uint8_t i = 0; i < length; i++) {
            RF_Send4to6EncodedByte(data[i]);
        }
        
        // 5. Calculate and send CRC-16
        uint16_t crc = RF_CalculateCRC16(data, length);
        RF_Send4to6EncodedByte(crc & 0xFF);       // Low byte first
        RF_Send4to6EncodedByte((crc >> 8) & 0xFF); // High byte second
        
        // 6. Short delay between repetitions
        CORETIMER_DelayMs(5);
    }
}

// Send a 6-bit symbol directly (used by 4-to-6 bit encoding)
static void RF_SendSymbol(uint8_t symbol)
{
    // Send 6 bits, LSB first
    for (int i = 0; i < 6; i++) {
        if (symbol & (1 << i)) {
            RF_TRANSMITTER_PIN = RF_TRANSMITTER_PIN_VALUE_ON;
        } else {
            RF_TRANSMITTER_PIN = RF_TRANSMITTER_PIN_VALUE_OFF;
        }
        RF_BitDelay();
    }
}

// Send byte with 4-to-6 bit encoding for better DC balance
void RF_Send4to6EncodedByte(uint8_t byte)
{
    // Send high nibble encoded as 6 bits
    RF_SendSymbol(RF_4to6BitTable[(byte >> 4) & 0x0F]);
    
    // Send low nibble encoded as 6 bits
    RF_SendSymbol(RF_4to6BitTable[byte & 0x0F]);
}

// Calculate CRC-16 (CCITT variant)
uint16_t RF_CalculateCRC16(const uint8_t* data, uint8_t length)
{
    uint16_t crc = 0xFFFF; // Initial value
    
    for (uint8_t i = 0; i < length; i++) {
        crc ^= data[i];
        for (uint8_t j = 0; j < 8; j++) {
            if (crc & 0x0001) {
                crc >>= 1;
                crc ^= 0xA001; // Polynomial 0x8005 (reversed)
            } else {
                crc >>= 1;
            }
        }
    }
    
    return crc;
}

// Send packet with Manchester encoding for better reliability
// Manchester encoding: 0 -> 01, 1 -> 10
void RF_SendEncodedPacket(const uint8_t* data, uint8_t length)
{
    // Add a preamble for synchronization
    for (int i = 0; i < 4; i++) {
        RF_TRANSMITTER_PIN = RF_TRANSMITTER_PIN_VALUE_ON;
        RF_BitDelay();
        RF_TRANSMITTER_PIN = RF_TRANSMITTER_PIN_VALUE_OFF;
        RF_BitDelay();
    }
    
    // Send each byte with Manchester encoding
    for (uint8_t byte_idx = 0; byte_idx < length; byte_idx++) {
        uint8_t byte = data[byte_idx];
        
        // Send each bit with Manchester encoding
        for (int bit_idx = 0; bit_idx < 8; bit_idx++) {
            if (byte & (1 << bit_idx)) {
                // For '1', send 10
                RF_TRANSMITTER_PIN = RF_TRANSMITTER_PIN_VALUE_ON;
                RF_BitDelay();
                RF_TRANSMITTER_PIN = RF_TRANSMITTER_PIN_VALUE_OFF;
                RF_BitDelay();
            } else {
                // For '0', send 01
                RF_TRANSMITTER_PIN = RF_TRANSMITTER_PIN_VALUE_OFF;
                RF_BitDelay();
                RF_TRANSMITTER_PIN = RF_TRANSMITTER_PIN_VALUE_ON;
                RF_BitDelay();
            }
        }
        
        // Small delay between bytes
        CORETIMER_DelayMs(1);
    }
    
    // Send end marker
    RF_TRANSMITTER_PIN = RF_TRANSMITTER_PIN_VALUE_OFF;
    RF_BitDelay();
    RF_BitDelay();
}
