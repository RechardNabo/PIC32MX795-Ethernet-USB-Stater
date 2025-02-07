#define ANALOG_A0 (0) 
#define ANALOG_A1 (1) 
#define ANALOG_A2 (2) 
#define ANALOG_A3 (3) 
#define ANALOG_A4 (4) 
#define ANALOG_A5 (5) 
#define ANALOG_A6 (6) 
#define ANALOG_A7 (7) 
#define ANALOG_A8 (8) 
#define ANALOG_A9 (9) 
#define ANALOG_A10 (10) 
#define ANALOG_A11 (11) 
#define ANALOG_A12 (12) 
#define ANALOG_A13 (13) 
#define ANALOG_A14 (14) 
#define ANALOG_A15 (15)
// Single-Sample Mode Initialization with selectable analog input pin
void ADC_Init_SingleSample(int pin) {
    AD1PCFG = 0xFFFF;               // Set all pins to digital by default
    AD1CON1 = 0x0000;               // Clear ADC control register 1
    AD1CON1bits.FORM = 0;           // Integer format
    AD1CON1bits.SSRC = 0b111;       // Auto-conversion trigger
    AD1CON1bits.CLRASAM = 1;        // Stop conversion after first interrupt
    AD1CON1bits.ASAM = 0;           // Manual sampling
    AD1CON1bits.SIDL = 0;           // Continue module operation in Idle mode
    AD1CON2bits.VCFG = 0;           // AVdd and AVss as voltage reference
    AD1CON2bits.CSCNA = 0;          // No input scan
    AD1CON2bits.ALTS = 0;           // Use MUX A
    AD1CON2bits.BUFM = 0;           // 16-word buffer
    AD1CON2bits.SMPI = 0;           // Interrupt after every conversion
    AD1CON3bits.ADRC = 0;           // PBCLK as ADC clock source
    AD1CON3bits.SAMC = 16;          // Auto-sample time
    AD1CON3bits.ADCS = 1;           // ADC clock divider

    switch (pin) {
        case 0:
            TRISBbits.TRISB0 = 1;    // Set RB0 as input (AN0)
            AD1PCFGbits.PCFG0 = 0;   // Set AN0 as analog
            AD1CHSbits.CH0SA = 0;    // Select AN0 as positive input for MUX A
            break;
        case 1:
            TRISBbits.TRISB1 = 1;    // Set RB1 as input (AN1)
            AD1PCFGbits.PCFG1 = 0;   // Set AN1 as analog
            AD1CHSbits.CH0SA = 1;    // Select AN1 as positive input for MUX A
            break;
        case 2:
            TRISBbits.TRISB2 = 1;    // Set RB2 as input (AN2)
            AD1PCFGbits.PCFG2 = 0;   // Set AN2 as analog
            AD1CHSbits.CH0SA = 2;    // Select AN2 as positive input for MUX A
            break;
        case 3:
            TRISBbits.TRISB3 = 1;    // Set RB3 as input (AN3)
            AD1PCFGbits.PCFG3 = 0;   // Set AN3 as analog
            AD1CHSbits.CH0SA = 3;    // Select AN3 as positive input for MUX A
            break;
        case 4:
            TRISBbits.TRISB4 = 1;    // Set RB4 as input (AN4)
            AD1PCFGbits.PCFG4 = 0;   // Set AN4 as analog
            AD1CHSbits.CH0SA = 4;    // Select AN4 as positive input for MUX A
            break;
        case 5:
            TRISBbits.TRISB5 = 1;    // Set RB5 as input (AN5)
            AD1PCFGbits.PCFG5 = 0;   // Set AN5 as analog
            AD1CHSbits.CH0SA = 5;    // Select AN5 as positive input for MUX A
            break;
        case 6:
            TRISBbits.TRISB6 = 1;    // Set RB6 as input (AN6)
            AD1PCFGbits.PCFG6 = 0;   // Set AN6 as analog
            AD1CHSbits.CH0SA = 6;    // Select AN6 as positive input for MUX A
            break;
        case 7:
            TRISBbits.TRISB7 = 1;    // Set RB7 as input (AN7)
            AD1PCFGbits.PCFG7 = 0;   // Set AN7 as analog
            AD1CHSbits.CH0SA = 7;    // Select AN7 as positive input for MUX A
            break;
        case 8:
            TRISBbits.TRISB8 = 1;    // Set RB8 as input (AN8)
            AD1PCFGbits.PCFG8 = 0;   // Set AN8 as analog
            AD1CHSbits.CH0SA = 8;    // Select AN8 as positive input for MUX A
            break;
        case 9:
            TRISBbits.TRISB9 = 1;    // Set RB9 as input (AN9)
            AD1PCFGbits.PCFG9 = 0;   // Set AN9 as analog
            AD1CHSbits.CH0SA = 9;    // Select AN9 as positive input for MUX A
            break;
        case 10:
            TRISBbits.TRISB10 = 1;   // Set RB10 as input (AN10)
            AD1PCFGbits.PCFG10 = 0;  // Set AN10 as analog
            AD1CHSbits.CH0SA = 10;   // Select AN10 as positive input for MUX A
            break;
        case 11:
            TRISBbits.TRISB11 = 1;   // Set RB11 as input (AN11)
            AD1PCFGbits.PCFG11 = 0;  // Set AN11 as analog
            AD1CHSbits.CH0SA = 11;   // Select AN11 as positive input for MUX A
            break;
        case 12:
            TRISBbits.TRISB12 = 1;   // Set RB12 as input (AN12)
            AD1PCFGbits.PCFG12 = 0;  // Set AN12 as analog
            AD1CHSbits.CH0SA = 12;   // Select AN12 as positive input for MUX A
            break;
        case 13:
            TRISBbits.TRISB13 = 1;   // Set RB13 as input (AN13)
            AD1PCFGbits.PCFG13 = 0;  // Set AN13 as analog
            AD1CHSbits.CH0SA = 13;   // Select AN13 as positive input for MUX A
            break;
        case 14:
            TRISBbits.TRISB14 = 1;   // Set RB14 as input (AN14)
            AD1PCFGbits.PCFG14 = 0;  // Set AN14 as analog
            AD1CHSbits.CH0SA = 14;   // Select AN14 as positive input for MUX A
            break;
        case 15:
            TRISBbits.TRISB15 = 1;   // Set RB15 as input (AN15)
            AD1PCFGbits.PCFG15 = 0;  // Set AN15 as analog
            AD1CHSbits.CH0SA = 15;   // Select AN15 as positive input for MUX A
            break;
        default:
            return;                   // Invalid pin specified, return without configuring
    }
    AD1CON1bits.ON = 1;               // Enable ADC module
}

// Multi-Channel Mode Initialization
void ADC_Init_MultiChannel() {
    AD1PCFG = 0x00FF;               // Set AN0 to AN7 as analog inputs
    AD1CON1 = 0x0000;               // Clear ADC control register 1
    AD1CON1bits.FORM = 0;           // Integer format
    AD1CON1bits.SSRC = 0b111;       // Auto-conversion trigger
    AD1CON1bits.CLRASAM = 1;        // Stop conversion after first interrupt
    AD1CON1bits.ASAM = 0;           // Manual sampling
    AD1CON1bits.SIDL = 0;           // Continue module operation in Idle mode
    AD1CON2bits.VCFG = 0;           // AVdd and AVss as voltage reference
    AD1CON2bits.CSCNA = 1;          // Enable input scan mode
    AD1CON2bits.ALTS = 0;           // Use MUX A
    AD1CON2bits.BUFM = 0;           // 16-word buffer
    AD1CON2bits.SMPI = 7;           // Interrupt after 8 conversions
    AD1CSSL = 0x00FF;               // Select AN0 to AN7 for scanning
    AD1CON3bits.ADRC = 0;           // PBCLK as ADC clock source
    AD1CON3bits.SAMC = 16;          // Auto-sample time
    AD1CON3bits.ADCS = 1;           // ADC clock divider
    AD1CON1bits.ON = 1;             // Enable ADC module
}

// Function to read from a specified ADC channel in Single-Sample Mode
int ADC_Read_SingleSample(int channel) {
    int digitalValue;

    AD1CHSbits.CH0SA = channel;     // Select input channel
    AD1CON1bits.SAMP = 1;           // Start sampling
    delay_ms(10);                 // Sample for at least 10us
    AD1CON1bits.SAMP = 0;           // Start conversion
    while (!AD1CON1bits.DONE);      // Wait for conversion to complete

    digitalValue = ADC1BUF0 + channel * 16; // Read the corresponding ADC buffer
    AD1CON1bits.DONE = 0;           // Clear the DONE bit

    return digitalValue;            // Return the 10-bit ADC result
}

// Function to read all channels in Multi-Channel Mode and store them in an array
void ADC_Read_MultiChannel(int *results) {
    AD1CON1bits.SAMP = 1;           // Start sampling
    delay_ms(10);                 // Sample for at least 10us
    AD1CON1bits.SAMP = 0;           // Start conversion
    while (!AD1CON1bits.DONE);      // Wait for conversion to complete

    results[0] = ADC1BUF0;          // AN0
    results[1] = ADC1BUF1;          // AN1
    results[2] = ADC1BUF2;          // AN2
    results[3] = ADC1BUF3;          // AN3
    results[4] = ADC1BUF4;          // AN4
    results[5] = ADC1BUF5;          // AN5
    results[6] = ADC1BUF6;          // AN6
    results[7] = ADC1BUF7;          // AN7

    AD1CON1bits.DONE = 0;           // Clear the DONE bit
}

float VOLTAGE(float VREF,int channel ){
    float voltage = 0.0;
    voltage = ADC_Read_SingleSample(channel)*(VREF/1023.0);
    return (voltage);
}
