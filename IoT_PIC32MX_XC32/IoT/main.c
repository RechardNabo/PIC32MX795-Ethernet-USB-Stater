/* CAN Standard Mode Communication Example */
#include <xc.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/attribs.h>
#include <sys/kmem.h>
#include <stdint.h>
#include <stdbool.h>

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

// <editor-fold defaultstate="collapsed" desc="Initialization data">
#define THIS_IS_STACK_APPLICATION

#include "TCPIP.h"                  // Include all headers for any enabled TCPIP Stack functions
#include "MainDemo.h"
#include "NetworkConfig.h"          // Network configuration functions
#include <string.h>                 // For memcpy and memset
// Declare AppConfig structure and some other supporting stack variables
APP_CONFIG AppConfig;

// Private helper functions
static void InitAppConfig(void);
static void InitializeBoard(void);
void HeartBeat(void);
void SerialTask(void);
void CAN2Init(void);

// <editor-fold defaultstate="collapsed" desc="General exception Handler">
UINT32 excep_code;
UINT32 excep_addr;

void _general_exception_handler (unsigned cause, unsigned status)
{
    excep_code = (cause & 0x0000007C) >> 2;
    excep_addr = __builtin_mfc0(_CP0_EPC, _CP0_EPC_SELECT);
    
    if ((cause & 0x80000000) != 0)
       excep_addr += 4;

    while (1)
    {
        //EEPROMWriteData(EEPROMEnterBootloader,0xAA);
        Reset();
    }
}// </editor-fold>
// </editor-fold>

int main(void)
{        
    // Initialize application specific hardware
    InitializeBoard();
    
    while(1){  
        // Heartbeat tasks
        Heartbeat();
        // Essential Ethernet Tasks
        StackTask();
        // Ethernet Applications
        StackApplications();
        // Serial connection to PI
        SerialTask();
    }
    
    return 0;
}
