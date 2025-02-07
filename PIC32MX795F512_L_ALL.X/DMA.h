// DMA buffer sizes
#define DMA_BUFFER_SIZE 256

// Define the ADC1 IRQ number if not already defined
#ifndef _ADC1_IRQ
#define _ADC1_IRQ 45
#endif

// DMA Buffers
volatile uint8_t dmaBufferADC[DMA_BUFFER_SIZE] __attribute__((aligned(4)));
volatile uint8_t dmaBufferUART[DMA_BUFFER_SIZE] __attribute__((aligned(4)));
volatile uint8_t dmaBufferSPI[DMA_BUFFER_SIZE] __attribute__((aligned(4)));

// Function prototypes
void System_Init(void);
void DMA_Init(void);
void DMA_ADC_Config(void);
void DMA_UART_Config(void);
void DMA_SPI_Config(void);
void __ISR(_DMA0_VECTOR, IPL5SOFT) DMA0_ISR(void);  // DMA0 ISR
void __ISR(_DMA1_VECTOR, IPL5SOFT) DMA1_ISR(void);  // DMA1 ISR
void __ISR(_DMA2_VECTOR, IPL5SOFT) DMA2_ISR(void);  // DMA2 ISR

// DMA Initialization
void DMA_Init(void) {
    // Enable the DMA module
    DMACONbits.ON = 1;

    // Clear all DMA channels
    DCH0CON = 0;
    DCH1CON = 0;
    DCH2CON = 0;

    // Clear DMA interrupt flags
    IFS1CLR = 0xFF;  // Clear all DMA interrupt flags
    IEC1CLR = 0xFF;  // Disable all DMA interrupts
}

// DMA Configuration for ADC
void DMA_ADC_Config(void) {
    // Configure DMA Channel 0 for ADC
    struct {
        unsigned CHEN:1;       // Channel enable
        unsigned CHAEN:1;      // Channel auto-enable
        unsigned CHPRI:2;      // Channel priority
    } DCH0CONbits;

    DCH0CONbits.CHEN = 0;       // Disable the channel during configuration
    DCH0CONbits.CHAEN = 0;      // Disable auto-enable
    DCH0CONbits.CHPRI = 3;      // Set priority (0 = highest, 3 = lowest)

    struct {
        unsigned CHSIRQ:8;     // Channel start IRQ
        unsigned SIRQEN:1;     // Start IRQ enable
    } DCH0ECONbits;

    DCH0ECONbits.CHSIRQ = _ADC1_IRQ;  // Trigger on ADC interrupt
    DCH0ECONbits.SIRQEN = 1;          // Enable start IRQ

    DCH0SSA = KVA_TO_PA(&ADC1BUF0);   // Source address (ADC buffer)
    DCH0DSA = KVA_TO_PA(dmaBufferADC); // Destination address (DMA buffer)
    DCH0SSIZ = 2;                     // Source size (2 bytes per ADC result)
    DCH0DSIZ = DMA_BUFFER_SIZE;       // Destination size
    DCH0CSIZ = 2;                     // Cell size (2 bytes per transfer)

    struct {
        unsigned CHBCIF:1;      // Block complete interrupt flag
        unsigned CHERIF:1;      // Channel error interrupt flag
    } DCH0INTbits;

    DCH0INTCLR = 0x00FF00FF;          // Clear all interrupt flags
    DCH0INTSET = 0x00090000;          // Enable Block Complete and Error interrupts

    IPC9CLR = 0x00001F;               // Clear DMA channel 0 priority and sub-priority
    IPC9SET = 0x000016;               // Set IPL 5, sub-priority 2
    IEC1SET = 0x00010000;             // Enable DMA channel 0 interrupt

    DCH0CONbits.CHEN = 1;             // Enable the channel
}

// DMA Configuration for UART
void DMA_UART_Config(void) {
    // Configure DMA Channel 1 for UART TX
    struct {
        unsigned CHEN:1;       // Channel enable
        unsigned CHAEN:1;      // Channel auto-enable
        unsigned CHPRI:2;      // Channel priority
    } DCH1CONbits;

    DCH1CONbits.CHEN = 0;       // Disable the channel during configuration
    DCH1CONbits.CHAEN = 0;      // Disable auto-enable
    DCH1CONbits.CHPRI = 2;      // Set priority

    struct {
        unsigned CHSIRQ:8;     // Channel start IRQ
        unsigned SIRQEN:1;     // Start IRQ enable
    } DCH1ECONbits;

    DCH1ECONbits.CHSIRQ = _UART1_TX_IRQ;  // Trigger on UART TX interrupt
    DCH1ECONbits.SIRQEN = 1;              // Enable start IRQ

    DCH1SSA = KVA_TO_PA(dmaBufferUART);   // Source address (DMA buffer)
    DCH1DSA = KVA_TO_PA(&U1TXREG);        // Destination address (UART TX register)
    DCH1SSIZ = DMA_BUFFER_SIZE;           // Source size
    DCH1DSIZ = 1;                         // Destination size (1 byte per transfer)
    DCH1CSIZ = 1;                         // Cell size (1 byte per transfer)

    struct {
        unsigned CHBCIF:1;      // Block complete interrupt flag
        unsigned CHERIF:1;      // Channel error interrupt flag
    } DCH1INTbits;

    DCH1INTCLR = 0x00FF00FF;              // Clear all interrupt flags
    DCH1INTSET = 0x00090000;              // Enable Block Complete and Error interrupts

    IPC9CLR = 0x001F00;                   // Clear DMA channel 1 priority and sub-priority
    IPC9SET = 0x001600;                   // Set IPL 5, sub-priority 2
    IEC1SET = 0x00020000;                 // Enable DMA channel 1 interrupt

    DCH1CONbits.CHEN = 1;                 // Enable the channel
}

// DMA Configuration for SPI
void DMA_SPI_Config(void) {
    // Configure DMA Channel 2 for SPI TX
    struct {
        unsigned CHEN:1;       // Channel enable
        unsigned CHAEN:1;      // Channel auto-enable
        unsigned CHPRI:2;      // Channel priority
    } DCH2CONbits;

    DCH2CONbits.CHEN = 0;       // Disable the channel during configuration
    DCH2CONbits.CHAEN = 0;      // Disable auto-enable
    DCH2CONbits.CHPRI = 1;      // Set priority

    struct {
        unsigned CHSIRQ:8;     // Channel start IRQ
        unsigned SIRQEN:1;     // Start IRQ enable
    } DCH2ECONbits;

    DCH2ECONbits.CHSIRQ = _SPI1_TX_IRQ;  // Trigger on SPI TX interrupt
    DCH2ECONbits.SIRQEN = 1;             // Enable start IRQ

    DCH2SSA = KVA_TO_PA(dmaBufferSPI);   // Source address (DMA buffer)
    DCH2DSA = KVA_TO_PA(&SPI1BUF);       // Destination address (SPI buffer)
    DCH2SSIZ = DMA_BUFFER_SIZE;          // Source size
    DCH2DSIZ = 1;                        // Destination size (1 byte per transfer)
    DCH2CSIZ = 1;                        // Cell size (1 byte per transfer)

    struct {
        unsigned CHBCIF:1;      // Block complete interrupt flag
        unsigned CHERIF:1;      // Channel error interrupt flag
    } DCH2INTbits;

    DCH2INTCLR = 0x00FF00FF;             // Clear all interrupt flags
    DCH2INTSET = 0x00090000;             // Enable Block Complete and Error interrupts

    IPC9CLR = 0x1F0000;                  // Clear DMA channel 2 priority and sub-priority
    IPC9SET = 0x160000;                  // Set IPL 5, sub-priority 2
    IEC1SET = 0x00040000;                // Enable DMA channel 2 interrupt

    DCH2CONbits.CHEN = 1;                // Enable the channel
}

// DMA Interrupt Service Routine for Channel 0 (ADC)
void __ISR(_DMA0_VECTOR, IPL5SOFT) DMA0_ISR(void) {
    if (DCH0INTbits.CHBCIF) {
        // Block transfer complete
        DCH0INTCLR = 0x00000008;  // Clear Block Complete flag
    }
    if (DCH0INTbits.CHERIF) {
        // Address error
        DCH0INTCLR = 0x00000001;  // Clear Error flag
    }
    IFS1CLR = 0x00010000;  // Clear DMA0 interrupt flag
}

// DMA Interrupt Service Routine for Channel 1 (UART)
void __ISR(_DMA1_VECTOR, IPL5SOFT) DMA1_ISR(void) {
    if (DCH1INTbits.CHBCIF) {
        // Block transfer complete
        DCH1INTCLR = 0x00000008;  // Clear Block Complete flag
    }
    if (DCH1INTbits.CHERIF) {
        // Address error
        DCH1INTCLR = 0x00000001;  // Clear Error flag
    }
    IFS1CLR = 0x00020000;  // Clear DMA1 interrupt flag
}

// DMA Interrupt Service Routine for Channel 2 (SPI)
void __ISR(_DMA2_VECTOR, IPL5SOFT) DMA2_ISR(void) {
    if (DCH2INTbits.CHBCIF) {
        // Block transfer complete
        DCH2INTCLR = 0x00000008;  // Clear Block Complete flag
    }
    if (DCH2INTbits.CHERIF) {
        // Address error
        DCH2INTCLR = 0x00000001;  // Clear Error flag
    }
    IFS1CLR = 0x00040000;  // Clear DMA2 interrupt flag
}