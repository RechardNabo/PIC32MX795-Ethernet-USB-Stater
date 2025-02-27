#include "Config.h"
#include "GPIO.h"
#include "Timers.h"
#include "UART.h"
#include "ADC.h"
#include "ECCP.h"
#include "PWM.h"
#include "RTC.h"
//#include "DMA.h"
#include "I2C.h"
//#include "SPI.h"
#include "CAN.h"


#define LED_1_PIN           (TRISDbits.TRISD0)
#define LED_1_CONTROLLER    (LATDbits.LATD0)

#define LED_2_PIN           (TRISDbits.TRISD1)
#define LED_2_CONTROLLER    (LATDbits.LATD1)

#define LED_3_PIN           (TRISDbits.TRISD2)
#define LED_3_CONTROLLER    (LATDbits.LATD2)

#define I2C_SLAVE_ADDR      (0x08)
#define PB_FREQ SYS_FREQ    // Peripheral bus frequency
#define SPI_BAUD_RATE 1000000 // SPI clock at 1 MHz
volatile bool spi_transfer_complete = false;
void SPI1_Init(void);
void SPI1_WriteString(const char *data);

volatile const char *spi_data_ptr = NULL; // Pointer to the data to send
volatile bool spi_transfer_active = false;

void __ISR(_SPI_1_VECTOR, IPL3AUTO) SPI1_Handler(void) {
    if (IFS0bits.SPI1TXIF) { // Transmit interrupt flag
        IFS0CLR = _IFS0_SPI1TXIF_MASK; // Clear the interrupt flag

        if (spi_data_ptr && *spi_data_ptr != '\0') {
            SPI1BUF = *spi_data_ptr++; // Transmit the next character
        } else {
            IEC0bits.SPI1TXIE = 0; // Disable the SPI1 TX interrupt
            spi_transfer_active = false; // Mark transfer as complete
        }
    }
}
void SPI1_Init(void) {
    // Configure SPI1 pins
    TRISDbits.TRISD10 = 0; // SCK1 (RD10) as output
    TRISDbits.TRISD0 = 0;  // SDO1 (RD0) as output
    TRISCbits.TRISC4 = 1;  // SDI1 (RC4) as input
    TRISDbits.TRISD9 = 0;  // SS1 (RD9) as output (optional for slave select)

    // Disable SPI1 to configure
    SPI1CONbits.ON = 0; // Disable SPI1 module
    IFS0CLR = _IFS0_SPI1TXIF_MASK; // Clear SPI1 interrupt flag
    IEC0CLR = _IEC0_SPI1TXIE_MASK; // Disable SPI1 interrupt
    IPC5CLR = _IPC5_SPI1IP_MASK | _IPC5_SPI1IS_MASK; // Clear priority and subpriority
    IPC5bits.SPI1IP = 3; // Set priority to 3

    // Configure SPI1 as master, 8-bit mode, SMP=1, CKE=1
    SPI1BRG = (PBCLK / (2 * SPI_BAUD_RATE)) - 1; // Set baud rate
    SPI1STATbits.SPIROV = 0;  // Clear overflow flag
    SPI1CONbits.MSTEN = 1;    // Master mode
    SPI1CONbits.CKE = 1;      // Output data changes on clock's falling edge
    SPI1CONbits.SMP = 1;      // Input data sampled at end of data output time
    SPI1CONbits.MODE32 = 0;   // 8-bit mode
    SPI1CONbits.MODE16 = 0;   // 8-bit mode

    // Enable SPI1 interrupt
    IEC0bits.SPI1TXIE = 1; // Enable SPI1 transmit interrupt
    INTCONbits.MVEC = 1;   // Enable multi-vector interrupts
    __builtin_enable_interrupts();

    // Enable SPI1 module
    SPI1CONbits.ON = 1;
}
void SPI1_WriteChar(char data) {
    spi_transfer_complete = false; // Reset transfer complete flag
    while (SPI1STATbits.SPITBF);   // Wait if transmit buffer is full
    SPI1BUF = data;                // Transmit data
    while (!spi_transfer_complete); // Wait for transfer to complete
}

void SPI1_WriteString(const char *data) {
    while (*data) {
        SPI1_WriteChar(*data++);   // Send each character
    }
}
int main(void) {
    //CONFIGURE_PIN_AS_OUTPUT(LED_1_PIN);
    char msg[50];
    ADC_Init_SingleSample(ANALOG_A15);
    UART1_Init(UART_BAUDRATE_115200);
    I2C2_Init();
    SPI1_Init();
    __builtin_enable_interrupts();     // Enable interrupts after setup
    
    while (TRUE) {
        I2C2_Write(I2C_SLAVE_ADDR, "Hello World I2C-2"); // Send "Hello World" to slave address 0x08
        sprintf(msg,"Hello World UART-1\r\n\n");
        UART1_SendString(msg);
        SPI1_WriteString("Hello World");
        //TOGGLE_PIN(LED_1_CONTROLLER);
        delay_ms(1000);
    }
}
