/* CAN Standard Mode Communication Example */
// PIC32MX795F512L Configuration Bit Settings

#pragma config USERID = 0xFFFF          // Enter Hexadecimal value (Enter Hexadecimal value)
#pragma config FSRSSEL = PRIORITY_7     // SRS Select (SRS Priority 7)
#pragma config FMIIEN = ON              // Ethernet RMII/MII Enable (MII Enabled)
#pragma config FETHIO = ON              // Ethernet I/O Pin Select (Default Ethernet I/O)
#pragma config FCANIO = ON              // CAN I/O Pin Select (Default CAN I/O)
#pragma config FUSBIDIO = ON            // USB USID Selection (Controlled by the USB Module)
#pragma config FVBUSONIO = ON           // USB VBUS ON Selection (Controlled by USB Module)

// DEVCFG2
#pragma config FPLLIDIV = DIV_4         // PLL Input Divider (4x Divider)
#pragma config FPLLMUL = MUL_24         // PLL Multiplier (24x Multiplier)
#pragma config UPLLIDIV = DIV_12        // USB PLL Input Divider (12x Divider)
#pragma config UPLLEN = OFF             // USB PLL Enable (Disabled and Bypassed)
#pragma config FPLLODIV = DIV_1         // System PLL Output Clock Divider (PLL Divide by 1)

// DEVCFG1
#pragma config FNOSC = PRIPLL           // Oscillator Selection Bits (Primary Osc w/PLL (XT+,HS+,EC+PLL))
#pragma config FSOSCEN = ON             // Secondary Oscillator Enable (Enabled)
#pragma config IESO = ON                // Internal/External Switch Over (Enabled)
#pragma config POSCMOD = HS             // Primary Oscillator Configuration (HS osc mode)
#pragma config OSCIOFNC = ON            // CLKO Output Signal Active on the OSCO Pin (Enabled)
#pragma config FPBDIV = DIV_1           // Peripheral Clock Divisor (Pb_Clk is Sys_Clk/1)
#pragma config FCKSM = CSDCMD           // Clock Switching and Monitor Selection (Clock Switch Disable, FSCM Disabled)
#pragma config WDTPS = PS1048576        // Watchdog Timer Postscaler (1:1048576)
#pragma config FWDTEN = OFF             // Watchdog Timer Enable (WDT Disabled (SWDTEN Bit Controls))

// DEVCFG0
#pragma config DEBUG = OFF              // Background Debugger Enable (Debugger is disabled)
#pragma config ICESEL = ICS_PGx2        // ICE/ICD Comm Channel Select (ICE EMUC2/EMUD2 pins shared with PGC2/PGD2)
#pragma config PWP = OFF                // Program Flash Write Protect (Disable)
#pragma config BWP = OFF                // Boot Flash Write Protect bit (Protection Disabled)
#pragma config CP = OFF                 // Code Protect (Protection Disabled)
// Define crystal oscillator frequency
#define _XTAL_FREQ 8000000UL       // Define external crystal frequency as 8 MHz
#define SYS_FREQ 48000000UL        // System frequency = 8 MHz * 24 (PLL multiplier)

#define PBCLK SYS_FREQ       // Peripheral clock (configured as SYSCLK)
#define TRUE    (0x01)
#define F_BYTE  (int_fast8_t)



void delay_ms(unsigned int milliseconds) {
    while (milliseconds--) {
        unsigned int i;
        // Adjust the delay loop to match 1 ms delay
        for (i = 0; i < (SYS_FREQ / 56072); i++) {
            // Empty loop, just waste time for delay
        }
    }
}
#include <xc.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/attribs.h>
#include <sys/kmem.h>
#include <stdint.h>
#include <stdbool.h>

// CAN Pin Definitions
#define CAN1_TX_PIN TRISFbits.TRISF1
#define CAN1_RX_PIN TRISFbits.TRISF0

// Interrupt Vector and Priority
#define _CAN1_VECTOR 46
#define IPL4AUTO IPL4SOFT

// Global Variables
volatile bool transmissionComplete = false;
volatile bool messageReceived = false;

// CAN Message Buffer Structures
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

typedef union uCANTxMessageBuffer {
    struct {
        txcmsgsid CMSGSID;
        txcmsgeid CMSGEID;
        txcmsgdata0 CMSGDATA0;
        txcmsgdata1 CMSGDATA1;
    };
    int messageWord[4];
} CANTxMessageBuffer;

typedef struct {
    unsigned SID:11;
    unsigned FILHIT:5;
    unsigned CMSGTS:16;
} rxcmsgsid;

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
} rxcmsgeid;

typedef union uCANRxMessageBuffer {
    struct {
        rxcmsgsid CMSGSID;
        rxcmsgeid CMSGEID;
        txcmsgdata0 CMSGDATA0;
        txcmsgdata1 CMSGDATA1;
    };
    int messageWord[4];
} CANRxMessageBuffer;

// CAN FIFO Buffer
unsigned int CANFIFO[32];

// Function Prototypes
void CAN1_Initialize(void);
void CAN1_TransmitMessage(const char* message);
void ProcessReceivedMessage(CANRxMessageBuffer* message);
void __attribute__((vector(_CAN1_VECTOR), interrupt(IPL4AUTO), nomips16)) CAN1_InterruptHandler(void);

// CAN Initialization
void CAN1_Initialize(void) {
    // Configure CAN1 pins
    CAN1_TX_PIN = 0;    // Set RF1 as output for TX
    CAN1_RX_PIN = 1;    // Set RF0 as input for RX
    
    // Place CAN module in configuration mode
    C1CONbits.REQOP = 4;    // Request Configuration Mode (100)
    while(C1CONbits.OPMOD != 4) {
        printf("Waiting for Configuration Mode...\n");
    }
    printf("CAN Module in Configuration Mode.\n");
    
    // CAN Module Configuration
    C1CONbits.ON = 1;         // Enable CAN module
    C1CONbits.CANCAP = 1;     // Enable CAN message timestamp
    C1CONbits.SIDL = 0;       // Continue operation in IDLE mode
    
    // Configure CAN Timing
    C1CFGbits.BRP = 9;        // Baud Rate Prescaler
    C1CFGbits.SJW = 0;        // Synchronization Jump Width (1 TQ)
    C1CFGbits.PRSEG = 0;      // Propagation Time Segment (1 TQ)
    C1CFGbits.SEG1PH = 4;     // Phase Segment 1 (5 TQ)
    C1CFGbits.SEG2PH = 2;     // Phase Segment 2 (3 TQ)
    C1CFGbits.SAM = 1;        // Sample three times at sample point
    
    // Initialize CAN FIFO
    C1FIFOBA = KVA_TO_PA(CANFIFO);
    
    // Configure FIFO1 for transmission (4 message buffers)
    C1FIFOCON1bits.FSIZE = 3;    // 4 messages deep
    C1FIFOCON1SET = 0x80;        // Set TXEN bit (Transmit FIFO)
    
    // Configure FIFO0 for reception (8 message buffers)
    C1FIFOCON0bits.FSIZE = 7;    // 8 messages deep
    C1FIFOCON0bits.TXEN = 0;     // Set as receive FIFO
    
    // Configure Filter 0
    C1FLTCON0bits.FSEL0 = 0;     // Store messages in FIFO0
    C1FLTCON0bits.MSEL0 = 0;     // Use Mask 0
    C1RXF0bits.SID = 0x000;      // Accept all messages
    C1RXF0bits.EXID = 0;         // Only accept standard IDs
    C1RXM0bits.SID = 0x000;      // Mask all bits
    C1RXM0bits.MIDE = 1;         // Match only message types
    C1FLTCON0SET = 0x80;         // Enable Filter 0
    
    // Configure Interrupts
    IPC11bits.CAN1IP = 4;        // Priority Level 4
    IPC11bits.CAN1IS = 0;        // Sub-priority 0
    IFS1bits.CAN1IF = 0;         // Clear interrupt flag
    IEC1bits.CAN1IE = 1;         // Enable CAN1 interrupt
    
    // Place CAN module in normal mode
    C1CONbits.REQOP = 0;    // Request Normal Operation Mode (000)
    while(C1CONbits.OPMOD != 0) {
        printf("Waiting for Normal Mode...\n");
    }
    printf("CAN Module in Normal Mode.\n");
}

// CAN Transmission
void CAN1_TransmitMessage(const char* message) {
    CANTxMessageBuffer *transmitMessage;
    
    // Check if FIFO is not full
    if(C1FIFOINT1bits.TXNFULLIF) {
        // Get pointer to next transmit buffer
        transmitMessage = (CANTxMessageBuffer *)(PA_TO_KVA1(C1FIFOUA1));
        
        // Clear message buffer
        transmitMessage->messageWord[0] = 0;
        transmitMessage->messageWord[1] = 0;
        transmitMessage->messageWord[2] = 0;
        transmitMessage->messageWord[3] = 0;
        
        // Configure message
        transmitMessage->CMSGSID.SID = 0x123;
        transmitMessage->CMSGEID.IDE = 0;    // Standard frame
        transmitMessage->CMSGEID.RTR = 0;    // Not RTR
        transmitMessage->CMSGEID.DLC = 8;    // Max 8 bytes as per CAN spec
        
        // Copy data (maximum 8 bytes as per CAN specification)
        for(int i = 0; i < 8 && message[i] != '\0'; i++) {
            if(i < 4) {
                *((char*)&transmitMessage->CMSGDATA0 + i) = message[i];
            } else {
                *((char*)&transmitMessage->CMSGDATA1 + (i-4)) = message[i];
            }
        }
        
        // Set UINC bit to update buffer pointer
        C1FIFOCON1SET = 0x2000;
        
        // Set TXREQ bit to transmit
        C1FIFOCON1SET = 0x0008;
        
        // Reset transmission status
        transmissionComplete = false;
    }
}

// Process Received Message
void ProcessReceivedMessage(CANRxMessageBuffer* message) {
    if(message->CMSGEID.IDE == 0) {  // Standard frame
        // Process the received message
        char data[12];  // Buffer for received data (11 bytes + null terminator)
        int dlc = message->CMSGEID.DLC;
        
        // Extract data bytes
        for(int i = 0; i < dlc && i < 11; i++) {
            if(i < 4) {
                data[i] = *((char*)&message->CMSGDATA0 + i);
            } else {
                data[i] = *((char*)&message->CMSGDATA1 + (i-4));
            }
        }
        data[dlc] = '\0';  // Null terminate the string
        
        // Handle the received data here
        messageReceived = true;
    }
}

// CAN Interrupt Handler
void __attribute__((vector(_CAN1_VECTOR), interrupt(IPL4AUTO), nomips16)) CAN1_InterruptHandler(void) {
    if(C1INTbits.RBIF) {  // Receive buffer interrupt
        CANRxMessageBuffer *receiveMessage;
        PORTDbits.RD1 ^=1;
        
        // Get received message
        receiveMessage = (CANRxMessageBuffer *)(PA_TO_KVA1(C1FIFOUA0));
        
        // Process received message
        ProcessReceivedMessage(receiveMessage);
        
        // Update FIFO pointer
        C1FIFOCON0SET = 0x2000;
        
        // Clear interrupt flag
        C1INTbits.RBIF = 0;
    }
    
    // Check for transmit interrupt
    if(C1FIFOINT1bits.TXEMPTYIF) {
        // FIFO is empty - transmission complete
        transmissionComplete = true;
        
        // Optional: Clear the transmit interrupt flag
        C1FIFOINT1bits.TXEMPTYIF = 0;
    }
    
    // Clear the interrupt flag
    IFS1bits.CAN1IF = 0;
}

// Main Function
int main(void) {
    TRISDbits.TRISD0 = 0;
    TRISDbits.TRISD1 = 0;
    PORTDbits.RD0 =0;
    
    // Initialize CAN1
    CAN1_Initialize();
    
    // Main loop
    while(1) {
        CAN1_TransmitMessage("Hello World");
        if(messageReceived) {
            messageReceived = false;
        }
        PORTDbits.RD0 ^=1;
        delay_ms(500);
    }
    return 0;
}