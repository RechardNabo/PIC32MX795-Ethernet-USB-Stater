/* CAN Standard Mode Communication Example */
#include <xc.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/attribs.h>
#include <sys/kmem.h>
#include <stdint.h>
#include <stdbool.h>
#include <plib.h>

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

// Pin Definitions
#define LED_PIN         BIT_0           // RD0 for LED
#define CAN1_TX_PIN     TRISFbits.TRISF1
#define CAN1_RX_PIN     TRISFbits.TRISF0

// Function prototypes
void initialize(void);
void delay_ms(unsigned int ms);

int main(void){
    // Initialize the system
    initialize();
    
    // Main loop
    while(1) {
        // Toggle LED
        mPORTDToggleBits(LED_PIN);
        
        // Delay
        delay_ms(1000);
    }
    
    return 0;
}

// Initialize the system
void initialize(void) {
    // Configure the device for maximum performance
    // Note: Since we're using the internal RC oscillator (FRCDIV),
    // the actual system frequency will be based on that and not our FOSC define
    SYSTEMConfigPerformance(SYS_FREQ);
    
    // Enable multi-vectored interrupts
    INTConfigureSystem(INT_SYSTEM_CONFIG_MULT_VECTOR);
    INTEnableInterrupts();
    
    // Configure LED pin as digital output
    mPORTDSetPinsDigitalOut(LED_PIN);
    
    // Turn LED off initially
    mPORTDClearBits(LED_PIN);
    
    // Disable JTAG to free up pins (if needed)
    DDPCONbits.JTAGEN = 0;
}