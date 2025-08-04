/*******************************************************************************
  Main Source File
  Company:
    Microchip Technology Inc.
  File Name:
    main.c
  Summary:
    This file contains the "main" function for a project.
  Description:
    This file contains the "main" function for a project.  The
    "main" function calls the "SYS_Initialize" function to initialize the state
    machines of all modules in the system
 *******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************
#include <stddef.h>                     // Defines NULL
#include <stdbool.h>                    // Defines true
#include <stdlib.h>                     // Defines EXIT_FAILURE
#include "definitions.h"                // SYS function prototypes
#include "can_handler.h"                // CAN communication functions
#include "modbus_rtu.h"                // Modbus RTU protocol
#include "rs485_handler.h"             // RS485 communication
#include "rf_transmitter.h"            // RF 433MHz transmitter
#define CAN         (0x01)
#define UART        (CAN+0x01)
#define MODBUS      (UART+0x01)
#define RF          (MODBUS+0x01)
#define READ_MIC    (RF+0x01)
#define READ_TEMP   (READ_MIC+0x01)
#define READ_VIB1   (READ_TEMP+0x01)
#define READ_VIB2   (READ_VIB1+0x01)
#define DELAY       (200)

// Include device configuration
#include <xc.h>

// Sensor Pin Definitions
// Microphone (Analog Input)
#define MICROPHONE_TRIS  TRISFbits.TRISF2
#define MICROPHONE_ANALOG AD1PCFGbits.PCFG2  // AN2/RF2 (assuming RF2 is AN2)
#define MICROPHONE_AN_CHANNEL 2              // AN2/RF2

// Temperature Sensor (Analog Input)
#define TEMP_SENSOR_TRIS  TRISDbits.TRISD15
#define TEMP_SENSOR_ANALOG  AD1PCFGbits.PCFG6  // AN6/RD15
#define TEMP_AN_CHANNEL  6                     // AN6

// Vibration Sensor 1 (Digital Input)
#define VIBRATION_1_TRIS  TRISFbits.TRISF8
#define VIBRATION_1_PORT  PORTFbits.RF8

// Vibration Sensor 2 (Digital Input)
#define VIBRATION_2_TRIS  TRISAbits.TRISA9
#define VIBRATION_2_PORT  PORTAbits.RA9
// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************
// Function to control RS485 direction
void Sensor_Initialize(void) {
    // Configure Microphone (Analog Input)
    MICROPHONE_TRIS = 1;         // Set as input
    MICROPHONE_ANALOG = 0;       // 0 = Analog, 1 = Digital
    
    // Configure Temperature Sensor (Analog Input)
    TEMP_SENSOR_TRIS = 1;        // Set as input
    TEMP_SENSOR_ANALOG = 0;      // 0 = Analog, 1 = Digital
    
    // Configure Vibration Sensors (Digital Inputs)
    VIBRATION_1_TRIS = 1;        // Set as input
    VIBRATION_2_TRIS = 1;        // Set as input
    
    // Configure digital inputs (disable analog on these pins)
    AD1PCFGbits.PCFG8 = 1;       // Disable analog on RF8 (VIB1)
    AD1PCFGbits.PCFG9 = 1;       // Disable analog on RA9 (VIB2)
    
    // Initialize and enable ADC
    ADC_Initialize();
    AD1CON1bits.ON = 1;          // Turn on the ADC module
    AD1CHS = MICROPHONE_AN_CHANNEL << 16;  // Select initial channel
    AD1CON1bits.SAMP = 1;        // Start sampling
}

int main ( void ){

    /* Initialize all modules */
    SYS_Initialize ( NULL );
    CORETIMER_Start();
    //ADC_Enable();
    
    // Initialize CAN extended IDs
    CAN_InitializeIDs();
    
    // Initialize RF transmitter
    RF_Init();
    
    // Configure UART2 for 9600 baud
    UART_SERIAL_SETUP serialSetup = {
        .baudRate = 9600,
        .dataWidth = UART_DATA_8_BIT,
        .parity = UART_PARITY_NONE,
        .stopBits = UART_STOP_1_BIT
    };
    bool setupStatus = UART2_SerialSetup(&serialSetup, CPU_CLOCK_FREQUENCY);
    if (!setupStatus) {
        printf("UART2 Serial Setup failed!\n");
        // You can continue as the initialize function already set up the UART
    }

    
    LED3_Off();
    LED2_Off();
    TRISFbits.TRISF12 = 0;      // Set RF12 as output
    
    int state = CAN;
    while ( true ){
        switch(state){
            case CAN:
                LED3_On();
                uint8_t canMsg[8] = {0};
                uint8_t length = 0;
                
                // First send architecture info
                CAN_DetectArchitecture(canMsg, &length);
                if(!CAN_ProcessMessage(architectureID, canMsg, length)) {
                    LED2_On();
                }
                CORETIMER_DelayMs(DELAY/2);
                
                // Send temperature/humidity data (8 bytes as expected by RPi)
                memset(canMsg, 0, sizeof(canMsg));
                // Temperature: 25.5°C as float (4 bytes) + Humidity: 60.0% as float (4 bytes)
                float temperature = 25.5f;
                float humidity = 60.0f;
                memcpy(&canMsg[0], &temperature, 4);  // Temperature (bytes 0-3)
                memcpy(&canMsg[4], &humidity, 4);     // Humidity (bytes 4-7)
                if(!CAN_ProcessMessage(temperatureID, canMsg, 8)) {
                    LED2_On();
                }
                CORETIMER_DelayMs(DELAY/2);
                
                // Send voltage data (8 bytes - 3 voltage readings)
                memset(canMsg, 0, sizeof(canMsg));
                // Pack voltage values as 16-bit integers (mV): R1=3300mV, R2=1650mV, R3=5000mV
                uint16_t voltage_r1 = 3300;  // 3.3V in mV
                uint16_t voltage_r2 = 1650;  // 1.65V in mV  
                uint16_t voltage_r3 = 5000;  // 5.0V in mV
                canMsg[0] = voltage_r1 & 0xFF;        // R1 LSB
                canMsg[1] = (voltage_r1 >> 8) & 0xFF; // R1 MSB
                canMsg[2] = voltage_r2 & 0xFF;        // R2 LSB
                canMsg[3] = (voltage_r2 >> 8) & 0xFF; // R2 MSB
                canMsg[4] = voltage_r3 & 0xFF;        // R3 LSB
                canMsg[5] = (voltage_r3 >> 8) & 0xFF; // R3 MSB
                canMsg[6] = 0x00;  // Reserved
                canMsg[7] = 0x00;  // Reserved
                if(!CAN_ProcessMessage(voltageID, canMsg, 8)) {
                    LED2_On();
                }
                CORETIMER_DelayMs(DELAY/2);
                
                // Send current data (4 bytes minimum as expected by RPi)
                memset(canMsg, 0, sizeof(canMsg));
                // Pack current as float (4 bytes): 0.1A = 100mA
                float current = 0.1f;  // 100mA
                memcpy(&canMsg[0], &current, 4);  // Current (bytes 0-3)
                canMsg[4] = 0x00;  // Reserved
                canMsg[5] = 0x00;  // Reserved
                canMsg[6] = 0x00;  // Reserved
                canMsg[7] = 0x00;  // Reserved
                if(!CAN_ProcessMessage(currentID, canMsg, 8)) {
                    LED2_On();
                }
                CORETIMER_DelayMs(DELAY/2);
                
                // Send power data (8 bytes - 3 power readings)
                memset(canMsg, 0, sizeof(canMsg));
                // Pack power values as floats: P = V * I
                float power_r1 = 0.33f;  // 3.3V * 0.1A = 0.33W
                float power_r2 = 0.165f; // 1.65V * 0.1A = 0.165W
                memcpy(&canMsg[0], &power_r1, 4);  // Power R1 (bytes 0-3)
                memcpy(&canMsg[4], &power_r2, 4);  // Power R2 (bytes 4-7)
                if(!CAN_ProcessMessage(powerID, canMsg, 8)) {
                    LED2_On();
                }
                
                // Transition to sensor reading states for actual sensor data
                state = READ_MIC;
                LED3_Off();
                CORETIMER_DelayMs(DELAY);
            break;
            
            case UART:
                LED3_On();
                RS485_SendMessage(RS485_MESSAGE);
                CORETIMER_DelayMs(DELAY);
                RS485_CheckForReceivedData();
                CORETIMER_DelayMs(DELAY);
                LED3_Off();
                state = MODBUS;
                CORETIMER_DelayMs(DELAY);
                break;
                
            case MODBUS:
                LED3_On();
                Modbus_Process();
                CORETIMER_DelayMs(DELAY);
                LED3_Off();
                state = RF;
                CORETIMER_DelayMs(DELAY);
                break;
                
            case RF:
                LED3_On();
                LED2_On(); // Visual indicator for RF transmission
                
                // Message to send
                const char* message = "PIC32MX RF TEST";
                
                // First, demonstrate basic ASCII transmission (original method)
                printf("\nSending basic ASCII message...\n");
                RF_SendMessage(message);
                CORETIMER_DelayMs(500);
                
                // Then demonstrate enhanced protocol with framing
                printf("\nSending with protocol framing...\n");
                RF_SendStructuredPacket((const uint8_t*)message, strlen(message));
                CORETIMER_DelayMs(500);
                
                // Finally demonstrate Manchester encoding for noisy environments
                printf("\nSending with Manchester encoding...\n");
                RF_SendEncodedPacket((const uint8_t*)message, strlen(message));
                CORETIMER_DelayMs(500);
                
                // Turn off LEDs and move to next state
                LED3_Off();
                LED2_Off();
                state = READ_MIC;
                CORETIMER_DelayMs(DELAY);
                break;
                
            case READ_MIC: {
                LED3_On();
                // Configure and read microphone (analog value)
                AD1CHS = MICROPHONE_AN_CHANNEL << 16;  // Select microphone channel
                AD1CON1bits.SAMP = 1;                  // Start sampling
                while(!AD1CON1bits.DONE);              // Wait for conversion to complete
                uint16_t micValue = ADC1BUF0 & 0x0FFF; // 12-bit result from buffer 0
                
                // Send microphone data via CAN (8 bytes)
                uint8_t micData[8] = {0};
                micData[0] = micValue & 0xFF;         // LSB
                micData[1] = (micValue >> 8) & 0xFF;  // MSB
                // Add timestamp or additional sensor info in remaining bytes
                micData[2] = 0x4D; // 'M' for Microphone identifier
                micData[3] = 0x49; // 'I'
                micData[4] = 0x43; // 'C'
                micData[5] = 0x00; // Reserved
                micData[6] = 0x00; // Reserved
                micData[7] = 0x00; // Reserved
                if(!CAN_ProcessMessage(microphoneID, micData, 8)) {
                    LED2_On();  // Indicate error if send fails
                }
                
                LED3_Off();
                state = READ_TEMP;
                CORETIMER_DelayMs(DELAY/2);
                break;
            }
                
            case READ_TEMP: {
                LED3_On();
                // Configure and read temperature sensor (analog value)
                AD1CHS = TEMP_AN_CHANNEL << 16;       // Select temperature channel
                AD1CON1bits.SAMP = 1;                  // Start sampling
                while(!AD1CON1bits.DONE);              // Wait for conversion to complete
                uint16_t tempRaw = ADC1BUF0 & 0x0FFF;  // 12-bit result from buffer 0
                
                // Convert raw ADC to temperature (example conversion, adjust as needed)
                float temperature = (tempRaw * 3.3f / 4096.0f - 0.5f) * 100.0f;
                float humidity = 50.0f + (tempRaw % 100) * 0.5f; // Simulated humidity based on temp reading
                
                // Send temperature/humidity data via CAN (8 bytes as expected by RPi)
                uint8_t tempData[8] = {0};
                memcpy(&tempData[0], &temperature, 4);  // Temperature (bytes 0-3)
                memcpy(&tempData[4], &humidity, 4);     // Humidity (bytes 4-7)
                if(!CAN_ProcessMessage(temperatureID, tempData, 8)) {
                    LED2_On();  // Indicate error if send fails
                }
                
                LED3_Off();
                state = READ_VIB1;
                CORETIMER_DelayMs(DELAY/2);
                break;
            }
                
            case READ_VIB1: {
                LED3_On();
                // Read vibration sensor 1 (digital input)
                uint8_t vib1State = VIBRATION_1_PORT;
                
                // Send vibration 1 state via CAN (8 bytes for consistency)
                uint8_t vib1Data[8] = {0};
                vib1Data[0] = vib1State ? 0x01 : 0x00;
                vib1Data[1] = 0x56; // 'V' for Vibration identifier
                vib1Data[2] = 0x49; // 'I'
                vib1Data[3] = 0x42; // 'B'
                vib1Data[4] = 0x31; // '1' for sensor 1
                vib1Data[5] = 0x00; // Reserved
                vib1Data[6] = 0x00; // Reserved
                vib1Data[7] = 0x00; // Reserved
                if(!CAN_ProcessMessage(vibrationIDs.vibration1ID, vib1Data, 8)) {
                    LED2_On();  // Indicate error if send fails
                }
                
                LED3_Off();
                state = READ_VIB2;
                CORETIMER_DelayMs(DELAY/2);
                break;
            }
                
            case READ_VIB2: {
                LED3_On();
                // Read vibration sensor 2 (digital input)
                uint8_t vib2State = VIBRATION_2_PORT;
                
                // Send vibration 2 state via CAN (8 bytes for consistency)
                uint8_t vib2Data[8] = {0};
                vib2Data[0] = vib2State ? 0x01 : 0x00;
                vib2Data[1] = 0x56; // 'V' for Vibration identifier
                vib2Data[2] = 0x49; // 'I'
                vib2Data[3] = 0x42; // 'B'
                vib2Data[4] = 0x32; // '2' for sensor 2
                vib2Data[5] = 0x00; // Reserved
                vib2Data[6] = 0x00; // Reserved
                vib2Data[7] = 0x00; // Reserved
                if(!CAN_ProcessMessage(vibrationIDs.vibration2ID, vib2Data, 8)) {
                    LED2_On();  // Indicate error if send fails
                }
                
                LED3_Off();
                state = CAN;  // Return to main CAN state for continuous operation
                CORETIMER_DelayMs(DELAY/2);
                break;
            }
        }
        SYS_Tasks();
    }
    /* Execution should not come here during normal operation */
    return ( EXIT_FAILURE );
}
