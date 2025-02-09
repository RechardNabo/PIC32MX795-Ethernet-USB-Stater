#include <stddef.h>                     // Defines NULL
#include <string.h>
#include <stdbool.h>
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include "definitions.h"                // SYS function prototypes
#include "../../../../../../../../../Users/Mtlantla/Desktop/EmberCore/Dev_C/Processor.h"

PROCESSOR _PIC32MX_;
//##############################################################################


// Callback function implementation
void ADC_Callback(uintptr_t context)
{
    char msg[50];
    uint32_t result = ADC_ResultGet(ADC_RESULT_BUFFER_0);
    uint32_t result2 = ADC_ResultGet(ADC_RESULT_BUFFER_1);
    sprintf(msg,"ADC Value : %d %d", result,result2);
}
// Callback flag for transmission completion
volatile bool txComplete = false;

// Callback function for UART1 write
void UART1_WriteCallback(uintptr_t context)
{
    txComplete = true; // Set flag when data is transmitted
}

//##############################################################################



void ADC_CODE(void);
void UART1_Code(void);
void UART1_Config(int BaudRate);
void UART1_SendString(const char* str);




//##############################################################################
int main ( void ){

    SYS_Initialize ( NULL );
    CORETIMER_Start();
    _PIC32MX_.MEASURED_DATA._ADC_RESOLUTION_[0]= 0.0;
    _PIC32MX_.MEASURED_DATA._ADC_RESOLUTION_[1]= 0.0;
    
    ADC_CallbackRegister(ADC_Callback, (uintptr_t)NULL);
    ADC_InputSelect(ADC_MUX_A, ADC_INPUT_POSITIVE_AN0|  ADC_INPUT_POSITIVE_AN1, ADC_INPUT_NEGATIVE_VREFL);
    ADC_InputScanSelect(ADC_INPUT_SCAN_AN0 | ADC_INPUT_SCAN_AN1);
    ADC_Enable();
    UART1_Config(9600);
    
    while ( true ){
        ADC_CODE();
        UART1_SendString("UART1 Initialized\r\n");
        UART1_SendString("Baud Rate: 9600\r\n");
        UART1_SendString("Configuration: 8N1\r\n");
        UART1_SendString("Ready for communication!\r\n");
        CORETIMER_DelayMs(100);
        LED2_Toggle();
        
        switch(SWITCH1_Get()){
            case SWITCH1_STATE_PRESSED:
                LED1_Toggle();
                break;
            default:
                break;
        }
        switch(SWITCH3_Get()){
            case SWITCH3_STATE_PRESSED:
                LED3_Toggle();
                break;
            default:
                break;
        }
        SYS_Tasks ( );        
    }
    return ( EXIT_FAILURE );
}

//##############################################################################
void ADC_CODE(void){
    ADC_SamplingStart();
    ADC_ConversionStart();
    CORETIMER_DelayMs(10);
    while(!ADC_ResultIsReady());
    _PIC32MX_.MEASURED_DATA._ADC_RESOLUTION_[0] = ADC_ResultGet(ADC_RESULT_BUFFER_0);
    _PIC32MX_.MEASURED_DATA.INPUT_VOLTAGE[0] = _PIC32MX_.MEASURED_DATA._ADC_RESOLUTION_[0]*(3.3/1028.0);
    

    if(_PIC32MX_.MEASURED_DATA.INPUT_VOLTAGE[0] > 2.25){
        LED1_Toggle();
    }else{
        LED1_Off();
    }
    _PIC32MX_.MEASURED_DATA._ADC_RESOLUTION_[1] = ADC_ResultGet(ADC_RESULT_BUFFER_0);
    _PIC32MX_.MEASURED_DATA.INPUT_VOLTAGE[1] = _PIC32MX_.MEASURED_DATA._ADC_RESOLUTION_[1]*(3.3/1028.0);
    if(_PIC32MX_.MEASURED_DATA.INPUT_VOLTAGE[1] > 1.5){
    LED3_Toggle();
    }else{
       LED3_Off(); 
    }
}
//##############################################################################

void UART1_Config(int BaudRate){
    // Configure UART1 with custom settings
    UART_SERIAL_SETUP uartSetup = {
        .baudRate = BaudRate,    // Set baud rate to 115200
        .dataWidth = UART_DATA_8_BIT,
        .parity = UART_PARITY_NONE,
        .stopBits = UART_STOP_1_BIT
    };
    // Apply the UART settings
    if (!UART1_SerialSetup(&uartSetup, 0)){
        // Handle UART setup failure
        while (1);
    }
    UART1_WriteCallbackRegister(UART1_WriteCallback, 0);
}


// Function to send a string over UART1
void UART1_SendString(const char* str){
    size_t len = strlen(str);
    txComplete = false; // Reset the transmit flag
    UART1_Write((void*)str, len); // Transmit the string
    while (!txComplete); // Wait for transmission to complete
}
//##############################################################################