
// Configuration Bits
#pragma config USERID = 0xFFFF          
#pragma config FSRSSEL = PRIORITY_7     
#pragma config FMIIEN = ON              
#pragma config FETHIO = ON              
#pragma config FCANIO = ON              
#pragma config FUSBIDIO = ON            
#pragma config FVBUSONIO = ON           
#pragma config FPLLIDIV = DIV_4         
#pragma config FPLLMUL = MUL_24         
#pragma config UPLLIDIV = DIV_12        
#pragma config UPLLEN = OFF             
#pragma config FPLLODIV = DIV_1         
#pragma config FNOSC = PRIPLL           
#pragma config FSOSCEN = ON             
#pragma config IESO = ON                
#pragma config POSCMOD = HS             
#pragma config OSCIOFNC = ON            
#pragma config FPBDIV = DIV_1           
#pragma config FCKSM = CSDCMD           
#pragma config WDTPS = PS1048576        
#pragma config FWDTEN = OFF             
#pragma config DEBUG = OFF              
#pragma config ICESEL = ICS_PGx2        
#pragma config PWP = OFF                
#pragma config BWP = OFF                
#pragma config CP = OFF
#include "CAN.h"
#include <xc.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/attribs.h>
#include <sys/kmem.h>
#include <stdint.h>
#include <stdbool.h>

// System Frequency Definitions
#define SYS_FREQ 48000000UL
#define PBCLK SYS_FREQ

// Delay Function
void delay_ms(unsigned int milliseconds) {
    while (milliseconds--) {
        unsigned int i;
        for (i = 0; i < (SYS_FREQ / 56072); i++) {
            asm volatile("nop");
        }
    }
}

// LED Pin Definition
#define LED_TRIS TRISDbits.TRISD0
#define LED_LAT  LATDbits.LATD0

// CAN Message Buffer Structure
typedef struct {
    unsigned SID:11;
    unsigned :21;
} txcmsgsid;

typedef struct {
    unsigned DLC:4;
    unsigned RB0:1;
    unsigned :3;
    unsigned RB1:1;
    unsigned RTR:1;
    unsigned EID:18;
    unsigned IDE:1;
    unsigned SRR:1;
    unsigned :2;
} txcmsgeid;

typedef struct {
    unsigned Byte0:8;
    unsigned Byte1:8;
    unsigned Byte2:8;
    unsigned Byte3:8;
} txcmsgdata0;

typedef struct {
    unsigned Byte4:8;
    unsigned Byte5:8;
    unsigned Byte6:8;
    unsigned Byte7:8;
} txcmsgdata1;

typedef union {
    struct {
        txcmsgsid CMSGSID;
        txcmsgeid CMSGEID;
        txcmsgdata0 CMSGDATA0;
        txcmsgdata1 CMSGDATA1;
    };
    uint32_t messageWord[4];
} CANTxMessageBuffer;

// Function to initialize CAN1
bool CAN1_Init() {
    // Place CAN1 in Configuration mode
    C1CONbits.REQOP = 4;
    while (C1CONbits.OPMOD != 4);

    // Check if Configuration mode was successfully entered
    if (C1CONbits.OPMOD != 4) {
        return false; // Error: Failed to enter Configuration mode
    }

    // Configure CAN1 baud rate (125 kbps)
    C1CFGbits.BRP = 23; // Baud rate prescaler
    C1CFGbits.PRSEG = 1; // Propagation Segment = 2 TQ
    C1CFGbits.SEG1PH = 4; // Phase Segment 1 = 5 TQ
    C1CFGbits.SEG2PH = 2; // Phase Segment 2 = 3 TQ
    C1CFGbits.SJW = 1; // Synchronization Jump Width = 2 TQ
    C1CFGbits.SAM = 1; // Sample 3 times

    // Configure FIFO1 for transmit operation
    C1FIFOCON1bits.FSIZE = 0; // FIFO size = 1 message buffer
    C1FIFOCON1bits.TXEN = 1; // Enable transmit FIFO

    // Place CAN1 in Loopback mode
    C1CONbits.REQOP = 2; // Request Loopback mode
    while (C1CONbits.OPMOD != 2); // Wait for mode change

    // Check if Loopback mode was successfully entered
    if (C1CONbits.OPMOD != 2) {
        return false; // Error: Failed to enter Loopback mode
    }

    return true; // Initialization successful
}

// Function to send a CAN message
bool CAN1_SendMessage(uint16_t sid, uint8_t *data, uint8_t dlc) {
    CANTxMessageBuffer *buffer;

    // Get the address of the message buffer
    buffer = (CANTxMessageBuffer *)(PA_TO_KVA1(C1FIFOUA1));

    // Clear the message buffer
    buffer->messageWord[0] = 0;
    buffer->messageWord[1] = 0;
    buffer->messageWord[2] = 0;
    buffer->messageWord[3] = 0;

    // Set the message SID
    buffer->CMSGSID.SID = sid;

    // Set the message DLC
    buffer->CMSGEID.DLC = dlc;

    // Copy data to the message buffer
    buffer->CMSGDATA0.Byte0 = data[0];
    buffer->CMSGDATA0.Byte1 = data[1];
    buffer->CMSGDATA0.Byte2 = data[2];
    buffer->CMSGDATA0.Byte3 = data[3];
    buffer->CMSGDATA1.Byte4 = data[4];
    buffer->CMSGDATA1.Byte5 = data[5];
    buffer->CMSGDATA1.Byte6 = data[6];
    buffer->CMSGDATA1.Byte7 = data[7];

    // Set the UINC bit to update the FIFO pointer
    C1FIFOCON1bits.UINC = 1;

    // Set the TXREQ bit to send the message
    C1FIFOCON1bits.TXREQ = 1;

    // Wait for the message to be transmitted
    while (C1FIFOINT1bits.TXNFULLIF == 0);

    // Clear the TXNFULLIF flag
    C1FIFOINT1bits.TXNFULLIF = 1;

    return true; // Transmission successful
}

// Function to blink LED
void blink_led(uint8_t count) {
    for (uint8_t i = 0; i < count; i++) {
        LED_LAT = 1;
        delay_ms(500);
        LED_LAT = 0;
        delay_ms(500);
    }
}

void main() {
    // Configure LED pin as output
    LED_TRIS = 0; // Set TRISD0 as output
    LED_LAT = 0;  // Initially turn off the LED

    // Initialize CAN1
    if (!CAN1_Init()) {
        blink_led(3); // Blink LED 3 times for initialization error
        while (1);
    } else {
        LED_LAT = 1; // Turn on LED to indicate successful initialization
    }

    // Define the message to send
    uint8_t message[] = "PIC32MX";

    while (1) {
        // Send the message via CAN1
        if (!CAN1_SendMessage(0x100, message, 7)) {
            blink_led(2); // Blink LED 2 times for transmission error
            while (1);
        }
        delay_ms(500); // Delay for 500 ms between transmissions
    }
}