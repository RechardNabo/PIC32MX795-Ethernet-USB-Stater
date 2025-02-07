#include <xc.h>
#include <sys/attribs.h>

volatile char spiReceivedData;  // Variable to store received data

// Function Prototypes
void SPI1_Init(void);
void SPI1_Write(char data);
void SPI1_WriteString(const char *data);
void __ISR(_SPI_1_VECTOR, IPL3SOFT) SPI1_Handler(void);

void SPI1_Init(void) {
    // Step 1: Disable SPI1 interrupts during initialization
    IEC0bits.SPI1RXIE = 0;  // Disable SPI1 RX interrupt
    IEC0bits.SPI1TXIE = 0;  // Disable SPI1 TX interrupt
    IEC0bits.SPI1EIE = 0;   // Disable SPI1 Error interrupt

    // Step 2: Reset SPI1 configuration
    SPI1CONbits.ON = 0;     // Disable SPI1 module
    SPI1BUF;                // Clear the receive buffer to avoid overflow
    IFS0bits.SPI1RXIF = 0;  // Clear the RX interrupt flag
    IFS0bits.SPI1TXIF = 0;  // Clear the TX interrupt flag
    IFS0bits.SPI1EIF = 0;   // Clear the Error interrupt flag

    // Step 3: Set priority and subpriority for SPI1 interrupts
    IPC5bits.SPI1IP = 3;    // Set interrupt priority to 3
    IPC5bits.SPI1IS = 1;    // Set interrupt subpriority to 1

    // Step 4: Configure SPI1
    SPI1CONbits.MSTEN = 1;    // Enable Master mode
    SPI1CONbits.MODE16 = 0;   // 8-bit mode
    SPI1CONbits.MODE32 = 0;   // 8-bit mode
    SPI1CONbits.CKE = 1;      // Serial output data changes on the transition from active to idle clock state
    SPI1CONbits.CKP = 0;      // Idle state for clock is low; active state is high
    SPI1CONbits.SMP = 1;      // Input data sampled at the end of data output time
    SPI1STATbits.SPIROV = 0;  // Clear overflow flag
    SPI1BRG = (PBCLK / (2 * PBCLK)) - 1;  // Set baud rate to 1 MHz (PBCLK assumed)

    // Step 5: Enable interrupts for SPI1
    IEC0bits.SPI1RXIE = 1;  // Enable SPI1 RX interrupt
    IEC0bits.SPI1TXIE = 1;  // Enable SPI1 TX interrupt
    IEC0bits.SPI1EIE = 1;   // Enable SPI1 Error interrupt

    // Step 6: Enable SPI1
    SPI1CONbits.ON = 1;     // Turn on SPI1
}

void SPI1_Write(char data) {
    while (SPI1STATbits.SPITBF);  // Wait if the transmit buffer is full
    SPI1BUF = data;               // Write data to buffer
}

void SPI1_WriteString(const char *data) {
    while (*data) {
        SPI1_Write(*data++);      // Write each character
    }
}

void __ISR(_SPI_1_VECTOR, IPL3SOFT) SPI1_Handler(void) {
    if (IFS0bits.SPI1RXIF) {  // SPI1 Receive Buffer Full Interrupt
        spiReceivedData = SPI1BUF;  // Read the received data
        IFS0bits.SPI1RXIF = 0;      // Clear the RX interrupt flag
    }
    if (IFS0bits.SPI1TXIF) {  // SPI1 Transmit Buffer Empty Interrupt
        IFS0bits.SPI1TXIF = 0;      // Clear the TX interrupt flag
    }
    if (IFS0bits.SPI1EIF) {  // SPI1 Error Interrupt
        SPI1STATbits.SPIROV = 0;    // Clear overflow flag
        IFS0bits.SPI1EIF = 0;       // Clear the Error interrupt flag
    }
}
