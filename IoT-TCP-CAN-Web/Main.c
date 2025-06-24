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
}

// <editor-fold defaultstate="collapsed" desc="Board Initialize">
static void InitializeBoard(void)
{
    // Enable optimal performance
    SYSTEMConfigPerformance(GetSystemClock());
    // Enable multi-vectored interrupts
    INTEnableSystemMultiVectoredInt();
    // Use 1:1 CPU Core:Peripheral clocks
    mOSCSetPBDIV(OSC_PB_DIV_1);
    // enable the cache for max performance
    CheKseg0CacheOn();
    // enable instruction prefetch
    mCheConfigure(CHECON | 0x30);
    // disable RAM wait states
    mBMXDisableDRMWaitState();
    // Disable JTAG
    DDPCONbits.JTAGEN = 0;
    // Make all the pins into the right state
    AD1PCFG = 0xFFFF;
    PMAEN=0;
  
    //Status LED
    LEDStatus=1;
    TrisLEDStatus=0;
    // Enter boot loader Button
    EnterBootTris=1;
    // Input tris
    Input1Tris=1;
    Input2Tris=1;
    
    // Initialize system timer
    TickInit();
    
    // Initialize file system for web pages
    MPFSInit();
    
    // Initialize network configuration with hardcoded values
    InitAppConfig();
    
    // Initialize TCP/IP stack
    StackInit();
    
    // Clear all the bits
    PIConnection.Bits.All=0;
    
    //Status LED for indication of completed initilization
    LEDStatus=0;
}
// <editor-fold defaultstate="collapsed" desc="Ethernet Configs and App init">
static void InitAppConfig(void){
    InitNetworkConfig(&AppConfig);
}
// </editor-fold>
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Heatbeat status LED and 500mS timer">
void Heartbeat (void)
{
    static DWORD t = 0;
    
    if(TickGet() - t >= TICK_SECOND/2ul)
    {
        // Toggle the LED
        LEDStatus ^= 1; 
        
        // Refresh the timer
        t = TickGet();
    }
}

// </editor-fold>
