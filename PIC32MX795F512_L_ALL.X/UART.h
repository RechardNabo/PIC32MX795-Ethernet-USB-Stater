#define MAX_STRING_LENGTH       (100)    // Maximum length of the received string
#define UART_BAUDRATE_9600      (9600)
#define UART_BAUDRATE_115200    (115200)
void UART1_Init(int baudRate);
void UART2_Init(int baudRate);
void UART3_Init(int baudRate);
void UART4_Init(int baudRate);
void UART5_Init(int baudRate);
void UART6_Init(int baudRate);

// UART Transmission Functions
void UART1_SendChar(char c);
void UART2_SendChar(char c);
void UART3_SendChar(char c);
void UART4_SendChar(char c);
void UART5_SendChar(char c);
void UART6_SendChar(char c);

void UART1_SendString(const char* str);
void UART2_SendString(const char* str);
void UART3_SendString(const char* str);
void UART4_SendString(const char* str);
void UART5_SendString(const char* str);
void UART6_SendString(const char* str);

// UART Reception Functions
char UART1_ReceiveChar(void);
char UART2_ReceiveChar(void);
char UART3_ReceiveChar(void);
char UART4_ReceiveChar(void);
char UART5_ReceiveChar(void);
char UART6_ReceiveChar(void);

void __ISR(_UART1_VECTOR, IPL7AUTO) UART1_3_5_ISR(void);
void __ISR(_UART2_VECTOR, IPL7AUTO) UART2_4_6_ISR(void);

volatile char receivedChar;      // Variable to store a received character
volatile char receivedString[MAX_STRING_LENGTH];  // Buffer for received string
volatile int stringIndex = 0;    // Index for received string
volatile int stringReady = 0;    // Flag indicating a string has been received
//==============================================================================
void UART1_Init(int baudRate) {
    // Calculate the U1BRG value
    U1BRG = (PBCLK / (16 * baudRate)) - 1;

    // Configure UART1 mode register
    U1MODE = 0;           // Clear mode register
    U1MODEbits.BRGH = 0;  // Standard Speed mode (16x baud clock)

    // Configure UART1 status and control register
    U1STA = 0;            // Clear status register
    U1STAbits.UTXEN = 1;  // Enable transmitter
    U1STAbits.URXEN = 1;  // Enable receiver

    // Enable UART1 interrupts
    IEC0bits.U1RXIE = 1;  // Enable UART1 receive interrupt
    IEC0bits.U1TXIE = 0;  // Disable UART1 transmit interrupt (enable only when needed)
    IPC6bits.U1IP = 2;    // Set UART1 interrupt priority
    IFS0bits.U1RXIF = 0;  // Clear the receive interrupt flag
    IFS0bits.U1TXIF = 0;  // Clear the transmit interrupt flag

    // Enable UART1 module
    U1MODEbits.ON = 1;

    // Enable multi-vector interrupts
    INTCONbits.MVEC = 1;
    INTCONSET = _INTCON_MVEC_MASK;
    __builtin_enable_interrupts();
}
//==============================================================================
void UART2_Init(int baudRate) {
    // Calculate the U1BRG value
    U2BRG = (PBCLK / (16 * baudRate)) - 1;

    // Configure UART1 mode register
    U2MODE = 0;           // Clear mode register
    U2MODEbits.BRGH = 0;  // Standard Speed mode (16x baud clock)

    // Configure UART1 status and control register
    U2STA = 0;            // Clear status register
    U2STAbits.UTXEN = 1;  // Enable transmitter
    U2STAbits.URXEN = 1;  // Enable receiver

    // Enable UART1 interrupts
    IEC1bits.U2RXIE = 1;  // Enable UART1 receive interrupt
    IEC1bits.U2TXIE = 0;  // Disable UART1 transmit interrupt (enable only when needed)
    IPC8bits.U2IP = 2;    // Set UART1 interrupt priority
    IFS1bits.U2RXIF = 0;  // Clear the receive interrupt flag
    IFS1bits.U2TXIF = 0;  // Clear the transmit interrupt flag

    // Enable UART1 module
    U2MODEbits.ON = 1;

    // Enable multi-vector interrupts
    INTCONbits.MVEC = 1;
    INTCONSET = _INTCON_MVEC_MASK;
    __builtin_enable_interrupts();
}

//==============================================================================
void UART3_Init(int baudRate) {
    // Calculate the U1BRG value
    U3BRG = (PBCLK / (16 * baudRate)) - 1;

    // Configure UART1 mode register
    U3MODE = 0;           // Clear mode register
    U3MODEbits.BRGH = 0;  // Standard Speed mode (16x baud clock)

    // Configure UART1 status and control register
    U3STA = 0;            // Clear status register
    U3STAbits.UTXEN = 1;  // Enable transmitter
    U3STAbits.URXEN = 1;  // Enable receiver

    // Enable UART1 interrupts
    IEC1bits.U3RXIE = 1;  // Enable UART1 receive interrupt
    IEC1bits.U3TXIE = 0;  // Disable UART1 transmit interrupt (enable only when needed)
    IPC7bits.U3IP = 2;    // Set UART1 interrupt priority
    IFS1bits.U3RXIF = 0;  // Clear the receive interrupt flag
    IFS1bits.U3TXIF = 0;  // Clear the transmit interrupt flag

    // Enable UART1 module
    U3MODEbits.ON = 1;

    // Enable multi-vector interrupts
    INTCONbits.MVEC = 1;
    INTCONSET = _INTCON_MVEC_MASK;
    __builtin_enable_interrupts();
}

//==============================================================================
void UART4_Init(int baudRate) {
    // Calculate the U1BRG value
    U4BRG = (PBCLK / (16 * baudRate)) - 1;

    // Configure UART1 mode register
    U4MODE = 0;           // Clear mode register
    U4MODEbits.BRGH = 0;  // Standard Speed mode (16x baud clock)

    // Configure UART1 status and control register
    U4STA = 0;            // Clear status register
    U4STAbits.UTXEN = 1;  // Enable transmitter
    U4STAbits.URXEN = 1;  // Enable receiver

    // Enable UART1 interrupts
    IEC2bits.U4RXIE = 1;  // Enable UART1 receive interrupt
    IEC2bits.U4TXIE = 0;  // Disable UART1 transmit interrupt (enable only when needed)
    IPC12bits.U4IP = 2;    // Set UART1 interrupt priority
    IFS2bits.U4RXIF = 0;  // Clear the receive interrupt flag
    IFS2bits.U4TXIF = 0;  // Clear the transmit interrupt flag

    // Enable UART1 module
    U4MODEbits.ON = 1;

    // Enable multi-vector interrupts
    INTCONbits.MVEC = 1;
    INTCONSET = _INTCON_MVEC_MASK;
    __builtin_enable_interrupts();
}
//==============================================================================
void UART5_Init(int baudRate) {
    // Calculate the U1BRG value
    U5BRG = (PBCLK / (16 * baudRate)) - 1;

    // Configure UART1 mode register
    U5MODE = 0;           // Clear mode register
    U4MODEbits.BRGH = 0;  // Standard Speed mode (16x baud clock)

    // Configure UART1 status and control register
    U5STA = 0;            // Clear status register
    U5STAbits.UTXEN = 1;  // Enable transmitter
    U5STAbits.URXEN = 1;  // Enable receiver

    // Enable UART1 interrupts
    IEC2bits.U5RXIE = 1;  // Enable UART1 receive interrupt
    IEC2bits.U5TXIE = 0;  // Disable UART1 transmit interrupt (enable only when needed)
    IPC12bits.U5IP = 2;    // Set UART1 interrupt priority
    IFS2bits.U5RXIF = 0;  // Clear the receive interrupt flag
    IFS2bits.U5TXIF = 0;  // Clear the transmit interrupt flag

    // Enable UART1 module
    U5MODEbits.ON = 1;

    // Enable multi-vector interrupts
    INTCONbits.MVEC = 1;
    INTCONSET = _INTCON_MVEC_MASK;
    __builtin_enable_interrupts();
}

//==============================================================================
void UART6_Init(int baudRate) {
    // Calculate the U1BRG value
    U6BRG = (PBCLK / (16 * baudRate)) - 1;

    // Configure UART1 mode register
    U6MODE = 0;           // Clear mode register
    U6MODEbits.BRGH = 0;  // Standard Speed mode (16x baud clock)

    // Configure UART1 status and control register
    U6STA = 0;            // Clear status register
    U6STAbits.UTXEN = 1;  // Enable transmitter
    U6STAbits.URXEN = 1;  // Enable receiver

    // Enable UART1 interrupts
    IEC2bits.U6RXIE = 1;  // Enable UART1 receive interrupt
    IEC2bits.U6TXIE = 0;  // Disable UART1 transmit interrupt (enable only when needed)
    IPC12bits.U6IP = 2;    // Set UART1 interrupt priority
    IFS2bits.U6RXIF = 0;  // Clear the receive interrupt flag
    IFS2bits.U6TXIF = 0;  // Clear the transmit interrupt flag

    // Enable UART1 module
    U6MODEbits.ON = 1;

    // Enable multi-vector interrupts
    INTCONbits.MVEC = 1;
    INTCONSET = _INTCON_MVEC_MASK;
    __builtin_enable_interrupts();
}
//==============================================================================

// Function to send a single character over UART
void UART1_SendChar(char c) {
    while (U1STAbits.UTXBF);  // Wait if the transmit buffer is full
    U1TXREG = c;              // Write the character to the transmit register
}
void UART2_SendChar(char c) {
    while (U2STAbits.UTXBF);  // Wait if the transmit buffer is full
    U2TXREG = c;              // Write the character to the transmit register
}
void UART3_SendChar(char c) {
    while (U3STAbits.UTXBF);  // Wait if the transmit buffer is full
    U3TXREG = c;              // Write the character to the transmit register
}
void UART4_SendChar(char c) {
    while (U4STAbits.UTXBF);  // Wait if the transmit buffer is full
    U4TXREG = c;              // Write the character to the transmit register
}
void UART5_SendChar(char c) {
    while (U5STAbits.UTXBF);  // Wait if the transmit buffer is full
    U5TXREG = c;              // Write the character to the transmit register
}
void UART6_SendChar(char c) {
    while (U6STAbits.UTXBF);  // Wait if the transmit buffer is full
    U6TXREG = c;              // Write the character to the transmit register
}
//==============================================================================
// Function to receive a single character from UART1
char UART1_ReceiveChar(void) {
    while (!U1STAbits.URXDA);  // Wait until data is available in the receive buffer
    return U1RXREG;            // Read and return the character from the receive register
}

char UART2_ReceiveChar(void) {
    while (!U2STAbits.URXDA);  // Wait until data is available in the receive buffer
    return U2RXREG;            // Read and return the character from the receive register
}

char UART3_ReceiveChar(void) {
    while (!U3STAbits.URXDA);  // Wait until data is available in the receive buffer
    return U3RXREG;            // Read and return the character from the receive register
}

char UART4_ReceiveChar(void) {
    while (!U4STAbits.URXDA);  // Wait until data is available in the receive buffer
    return U4RXREG;            // Read and return the character from the receive register
}

char UART5_ReceiveChar(void) {
    while (!U5STAbits.URXDA);  // Wait until data is available in the receive buffer
    return U5RXREG;            // Read and return the character from the receive register
}

char UART6_ReceiveChar(void) {
    while (!U6STAbits.URXDA);  // Wait until data is available in the receive buffer
    return U6RXREG;            // Read and return the character from the receive register
}

//==============================================================================
void UART1_SendString(const char* str) {
    while (*str != '\0') {     // Loop until the null terminator is reached
        UART1_SendChar(*str); // Send each character
        str++;                 // Move to the next character
    }
}

void UART2_SendString(const char* str) {
    while (*str != '\0') {     // Loop until the null terminator is reached
        UART2_SendChar(*str); // Send each character
        str++;                 // Move to the next character
    }
}

void UART3_SendString(const char* str) {
    while (*str != '\0') {     // Loop until the null terminator is reached
        UART3_SendChar(*str); // Send each character
        str++;                 // Move to the next character
    }
}

void UART4_SendString(const char* str) {
    while (*str != '\0') {     // Loop until the null terminator is reached
        UART4_SendChar(*str); // Send each character
        str++;                 // Move to the next character
    }
}

void UART5_SendString(const char* str) {
    while (*str != '\0') {     // Loop until the null terminator is reached
        UART5_SendChar(*str); // Send each character
        str++;                 // Move to the next character
    }
}

void UART6_SendString(const char* str) {
    while (*str != '\0') {     // Loop until the null terminator is reached
        UART6_SendChar(*str); // Send each character
        str++;                 // Move to the next character
    }
}
//==============================================================================

// UART1 Interrupt Service Routine
void __ISR(_UART1_VECTOR, IPL7AUTO) UART1_3_5_ISR(void) {
    // Receive interrupt
    if (IFS0bits.U1RXIF) {
        receivedChar = U1RXREG;  // Read the received character
        if (receivedChar == '\n') {  // Check if it's a newline character
            receivedString[stringIndex] = '\0';  // Null-terminate the string
            stringReady = 1;         // Set flag indicating a complete string has been received
            stringIndex = 0;         // Reset index for next string
        } else if (stringIndex < MAX_STRING_LENGTH - 1) {
            receivedString[stringIndex++] = receivedChar;  // Store the character in the buffer
        }
        IFS0bits.U1RXIF = 0;  // Clear the receive interrupt flag
    }

    // Transmit interrupt (not used in this example, but can be enabled if needed)
    if (IFS0bits.U1TXIF) {
        // Code for handling transmission can go here
        IFS0bits.U1TXIF = 0;  // Clear the transmit interrupt flag
    }
    
        // Receive interrupt
    if (IFS1bits.U3RXIF) {
        receivedChar = U3RXREG;  // Read the received character
        if (receivedChar == '\n') {  // Check if it's a newline character
            receivedString[stringIndex] = '\0';  // Null-terminate the string
            stringReady = 1;         // Set flag indicating a complete string has been received
            stringIndex = 0;         // Reset index for next string
        } else if (stringIndex < MAX_STRING_LENGTH - 1) {
            receivedString[stringIndex++] = receivedChar;  // Store the character in the buffer
        }
        IFS1bits.U3RXIF = 0;  // Clear the receive interrupt flag
    }

    // Transmit interrupt (not used in this example, but can be enabled if needed)
    if (IFS1bits.U3TXIF) {
        // Code for handling transmission can go here
        IFS1bits.U3TXIF = 0;  // Clear the transmit interrupt flag
    }
        // Receive interrupt
    if (IFS2bits.U5RXIF) {
        receivedChar = U5RXREG;  // Read the received character
        if (receivedChar == '\n') {  // Check if it's a newline character
            receivedString[stringIndex] = '\0';  // Null-terminate the string
            stringReady = 1;         // Set flag indicating a complete string has been received
            stringIndex = 0;         // Reset index for next string
        } else if (stringIndex < MAX_STRING_LENGTH - 1) {
            receivedString[stringIndex++] = receivedChar;  // Store the character in the buffer
        }
        IFS2bits.U5RXIF = 0;  // Clear the receive interrupt flag
    }

    // Transmit interrupt (not used in this example, but can be enabled if needed)
    if (IFS2bits.U5TXIF) {
        // Code for handling transmission can go here
        IFS2bits.U5TXIF = 0;  // Clear the transmit interrupt flag
    }
}

void __ISR(_UART2_VECTOR, IPL7AUTO) UART2_4_6_ISR(void) {
    // Receive interrupt
    if (IFS1bits.U2RXIF) {
        receivedChar = U2RXREG;  // Read the received character
        if (receivedChar == '\n') {  // Check if it's a newline character
            receivedString[stringIndex] = '\0';  // Null-terminate the string
            stringReady = 1;         // Set flag indicating a complete string has been received
            stringIndex = 0;         // Reset index for next string
        } else if (stringIndex < MAX_STRING_LENGTH - 1) {
            receivedString[stringIndex++] = receivedChar;  // Store the character in the buffer
        }
        IFS1bits.U2RXIF = 0;  // Clear the receive interrupt flag
    }

    // Transmit interrupt (not used in this example, but can be enabled if needed)
    if (IFS1bits.U2TXIF) {
        // Code for handling transmission can go here
        IFS1bits.U2TXIF = 0;  // Clear the transmit interrupt flag
    }
        // Receive interrupt
    if (IFS2bits.U4RXIF) {
        receivedChar = U4RXREG;  // Read the received character
        if (receivedChar == '\n') {  // Check if it's a newline character
            receivedString[stringIndex] = '\0';  // Null-terminate the string
            stringReady = 1;         // Set flag indicating a complete string has been received
            stringIndex = 0;         // Reset index for next string
        } else if (stringIndex < MAX_STRING_LENGTH - 1) {
            receivedString[stringIndex++] = receivedChar;  // Store the character in the buffer
        }
        IFS2bits.U4RXIF = 0;  // Clear the receive interrupt flag
    }

    // Transmit interrupt (not used in this example, but can be enabled if needed)
    if (IFS2bits.U4TXIF) {
        // Code for handling transmission can go here
        IFS2bits.U4TXIF = 0;  // Clear the transmit interrupt flag
    }
        // Receive interrupt
    if (IFS2bits.U6RXIF) {
        receivedChar = U6RXREG;  // Read the received character
        if (receivedChar == '\n') {  // Check if it's a newline character
            receivedString[stringIndex] = '\0';  // Null-terminate the string
            stringReady = 1;         // Set flag indicating a complete string has been received
            stringIndex = 0;         // Reset index for next string
        } else if (stringIndex < MAX_STRING_LENGTH - 1) {
            receivedString[stringIndex++] = receivedChar;  // Store the character in the buffer
        }
        IFS2bits.U6RXIF = 0;  // Clear the receive interrupt flag
    }

    // Transmit interrupt (not used in this example, but can be enabled if needed)
    if (IFS2bits.U6TXIF) {
        // Code for handling transmission can go here
        IFS2bits.U6TXIF = 0;  // Clear the transmit interrupt flag
    }
}
