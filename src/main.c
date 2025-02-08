#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include "definitions.h"                // SYS function prototypes
#include "../../../../../../../../../Users/Mtlantla/Desktop/EmberCore/Dev_C/Processor.h"

PROCESSOR _PIC32MX_;
void ADC_Callback(uintptr_t context);

// Callback function implementation
void ADC_Callback(uintptr_t context)
{
    char msg[50];
    uint32_t result = ADC_ResultGet(ADC_RESULT_BUFFER_0);
    uint32_t result2 = ADC_ResultGet(ADC_RESULT_BUFFER_1);
    sprintf(msg,"ADC Value : %d %d", result,result2);
}
void ADC_CODE(void);
int main ( void ){

    SYS_Initialize ( NULL );
    CORETIMER_Start();
    _PIC32MX_.MEASURED_DATA.ADC_RESOLUTION[0]= 0.0;
    
    ADC_CallbackRegister(ADC_Callback, (uintptr_t)NULL);
    ADC_InputSelect(ADC_MUX_A, ADC_INPUT_POSITIVE_AN0|  ADC_INPUT_POSITIVE_AN1, ADC_INPUT_NEGATIVE_VREFL);
    ADC_InputScanSelect(ADC_INPUT_SCAN_AN0 | ADC_INPUT_SCAN_AN1);
    ADC_Enable();
    
    while ( true ){
        ADC_CODE();
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


void ADC_CODE(void){
    ADC_SamplingStart();
    ADC_ConversionStart();
    CORETIMER_DelayMs(10);
    while(!ADC_ResultIsReady());
    _PIC32MX_.MEASURED_DATA.ADC_RESOLUTION[0] = ADC_ResultGet(ADC_RESULT_BUFFER_0);
    _PIC32MX_.MEASURED_DATA.INPUT_VOLTAGE[0] = _PIC32MX_.MEASURED_DATA.ADC_RESOLUTION[0]*(3.3/1028.0);
    

    if(_PIC32MX_.MEASURED_DATA.INPUT_VOLTAGE[0] > 2.25){
        LED1_Toggle();
    }else{
        LED1_Off();
    }
    _PIC32MX_.MEASURED_DATA.ADC_RESOLUTION[1] = ADC_ResultGet(ADC_RESULT_BUFFER_0);
    _PIC32MX_.MEASURED_DATA.INPUT_VOLTAGE[1] = _PIC32MX_.MEASURED_DATA.ADC_RESOLUTION[1]*(3.3/1028.0);
    if(_PIC32MX_.MEASURED_DATA.INPUT_VOLTAGE[1] > 1.5){
    LED3_Toggle();
    }else{
       LED3_Off(); 
    }
}
