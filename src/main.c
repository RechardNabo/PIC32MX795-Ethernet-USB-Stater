#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include "definitions.h"                // SYS function prototypes
#include "../../../../../../Desktop/Firmware_Architecture/Processor.h"

PROCESSOR _PIC32MX_;
void ADC_Callback(uintptr_t context);

// Callback function implementation
void ADC_Callback(uintptr_t context)
{
    char msg[50];
    uint32_t result = ADC_ResultGet(ADC_RESULT_BUFFER_0);
    sprintf(msg,"ADC Value : %d", result);
}
int main ( void ){

    SYS_Initialize ( NULL );
    CORETIMER_Start();
    ADC_CallbackRegister(ADC_Callback, (uintptr_t)NULL);
    ADC_InputSelect(ADC_MUX_A, ADC_INPUT_POSITIVE_AN0, ADC_INPUT_NEGATIVE_VREFL);
    ADC_InputScanSelect(ADC_INPUT_SCAN_AN0 | ADC_INPUT_SCAN_AN1);
    ADC_Enable();
    while ( true ){

        ADC_SamplingStart();
        ADC_ConversionStart();
        //while(!ADC_ResultIsReady());
        //uint32_t result = ADC_ResultGet(ADC_RESULT_BUFFER_0);
        
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

