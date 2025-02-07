#define I2C_BAUD_RATE       100000UL
#define I2C_TIMEOUT 1000
//====================================[]========================================
void I2C1_Init(void) {
    I2C1CON = 0;                       // Reset I2C1 control register
    I2C1BRG = (SYS_FREQ / (2 * I2C_BAUD_RATE)) - 2; // Set Baud Rate Generator
    I2C1CONbits.ON = 1;                // Enable I2C module
    IFS0bits.I2C1MIF = 0;              // Clear master interrupt flag
    IEC0bits.I2C1MIE = 1;              // Enable master interrupt
    IPC6bits.I2C1IP = 2;               // Set interrupt priority
    IPC6bits.I2C1IS = 0;               // Set interrupt sub-priority
}

void I2C1_WaitForIdle(void) {
    uint32_t timeout = I2C_TIMEOUT;
    while ((I2C1CON & 0x1F) || I2C1STATbits.TRSTAT) { // Check control and transmit status
        if (--timeout == 0) {
            // Handle timeout if necessary
            return;
        }
    }
}

void I2C1_Start(void) {
    I2C1CONbits.SEN = 1;               // Initiate Start condition
    I2C1_WaitForIdle();
}

void I2C1_Stop(void) {
    I2C1CONbits.PEN = 1;               // Initiate Stop condition
    I2C1_WaitForIdle();
}

void I2C1_WriteByte(uint8_t data) {
    I2C1TRN = data;                    // Load data into transmit register
    I2C1_WaitForIdle();
    if (I2C1STATbits.ACKSTAT) {
        // Handle NACK if necessary
    }
}

void I2C1_Write(uint8_t slave_address, const char *data) {
    I2C1_Start();                      // Start I2C communication
    I2C1_WriteByte((slave_address << 1)); // Send slave address with write bit
    while (*data) {
        I2C1_WriteByte(*data++);       // Send each byte of data
    }
    I2C1_Stop();                       // End I2C communication
}

void __ISR(_I2C_1_VECTOR, IPL2AUTO) I2C1_InterruptHandler(void) {
    if (IFS0bits.I2C1MIF) {            // Check master interrupt flag
        // Handle I2C master interrupt
        IFS0bits.I2C1MIF = 0;         // Clear master interrupt flag
    }
}
//====================================[]========================================
void I2C2_Init(void) {
    I2C2CON = 0;                       // Reset I2C2 control register
    I2C2BRG = (SYS_FREQ / (2 * I2C_BAUD_RATE)) - 2; // Set Baud Rate Generator
    I2C2CONbits.ON = 1;                // Enable I2C module
    IFS1bits.I2C2MIF = 0;              // Clear master interrupt flag
    IEC1bits.I2C2MIE = 1;              // Enable master interrupt
    IPC8bits.I2C2IP = 2;               // Set interrupt priority
    IPC8bits.I2C2IS = 0;               // Set interrupt sub-priority
}

void I2C2_WaitForIdle(void) {
    uint32_t timeout = I2C_TIMEOUT;
    while ((I2C2CON & 0x1F) || I2C2STATbits.TRSTAT) { // Check control and transmit status
        if (--timeout == 0) {
            // Handle timeout if necessary
            return;
        }
    }
}

void I2C2_Start(void) {
    I2C2CONbits.SEN = 1;               // Initiate Start condition
    I2C2_WaitForIdle();
}

void I2C2_Stop(void) {
    I2C2CONbits.PEN = 1;               // Initiate Stop condition
    I2C2_WaitForIdle();
}

void I2C2_WriteByte(uint8_t data) {
    I2C2TRN = data;                    // Load data into transmit register
    I2C2_WaitForIdle();
    if (I2C2STATbits.ACKSTAT) {
        // Handle NACK if necessary
    }
}

void I2C2_Write(uint8_t slave_address, const char *data) {
    I2C2_Start();                      // Start I2C communication
    I2C2_WriteByte((slave_address << 1)); // Send slave address with write bit
    while (*data) {
        I2C2_WriteByte(*data++);       // Send each byte of data
    }
    I2C2_Stop();                       // End I2C communication
}

void __ISR(_I2C_2_VECTOR, IPL2AUTO) I2C2_InterruptHandler(void) {
    if (IFS1bits.I2C2MIF) {            // Check master interrupt flag
        // Handle I2C master interrupt
        IFS1bits.I2C2MIF = 0;         // Clear master interrupt flag
    }
}
//====================================[]========================================
void I2C3_Init(void) {
    I2C3CON = 0;                       // Reset I2C3 control register
    I2C3BRG = (SYS_FREQ / (2 * I2C_BAUD_RATE)) - 2; // Set Baud Rate Generator
    I2C3CONbits.ON = 1;                // Enable I2C module
}

void I2C3_WaitForIdle(void) {
    uint32_t timeout = I2C_TIMEOUT;
    while ((I2C3CON & 0x1F) || I2C3STATbits.TRSTAT) { // Check control and transmit status
        if (--timeout == 0) {
            // Handle timeout if necessary
            return;
        }
    }
}

void I2C3_Start(void) {
    I2C3CONbits.SEN = 1;               // Initiate Start condition
    I2C3_WaitForIdle();
}

void I2C3_Stop(void) {
    I2C3CONbits.PEN = 1;               // Initiate Stop condition
    I2C3_WaitForIdle();
}

void I2C3_WriteByte(uint8_t data) {
    I2C3TRN = data;                    // Load data into transmit register
    I2C3_WaitForIdle();
    if (I2C3STATbits.ACKSTAT) {
        // Handle NACK if necessary
    }
}

void I2C3_Write(uint8_t slave_address, const char *data) {
    I2C3_Start();                      // Start I2C communication
    I2C3_WriteByte((slave_address << 1)); // Send slave address with write bit
    while (*data) {
        I2C3_WriteByte(*data++);       // Send each byte of data
    }
    I2C3_Stop();                       // End I2C communication
}

//====================================[]========================================
void I2C4_Init(void) {
    I2C4CON = 0;                       // Reset I2C4 control register
    I2C4BRG = (SYS_FREQ / (2 * I2C_BAUD_RATE)) - 2; // Set Baud Rate Generator
    I2C4CONbits.ON = 1;                // Enable I2C module
}

void I2C4_WaitForIdle(void) {
    uint32_t timeout = I2C_TIMEOUT;
    while ((I2C4CON & 0x1F) || I2C4STATbits.TRSTAT) { // Check control and transmit status
        if (--timeout == 0) {
            // Handle timeout if necessary
            return;
        }
    }
}

void I2C4_Start(void) {
    I2C4CONbits.SEN = 1;               // Initiate Start condition
    I2C4_WaitForIdle();
}

void I2C4_Stop(void) {
    I2C4CONbits.PEN = 1;               // Initiate Stop condition
    I2C4_WaitForIdle();
}

void I2C4_WriteByte(uint8_t data) {
    I2C4TRN = data;                    // Load data into transmit register
    I2C4_WaitForIdle();
    if (I2C4STATbits.ACKSTAT) {
        // Handle NACK if necessary
    }
}

void I2C4_Write(uint8_t slave_address, const char *data) {
    I2C4_Start();                      // Start I2C communication
    I2C4_WriteByte((slave_address << 1)); // Send slave address with write bit
    while (*data) {
        I2C4_WriteByte(*data++);       // Send each byte of data
    }
    I2C4_Stop();                       // End I2C communication
}
//======================================[]======================================
void I2C5_Init(void) {
    I2C5CON = 0;                       // Reset I2C5 control register
    I2C5BRG = (SYS_FREQ / (2 * I2C_BAUD_RATE)) - 2; // Set Baud Rate Generator
    I2C5CONbits.ON = 1;                // Enable I2C module
}

void I2C5_WaitForIdle(void) {
    uint32_t timeout = I2C_TIMEOUT;
    while ((I2C5CON & 0x1F) || I2C5STATbits.TRSTAT) { // Check control and transmit status
        if (--timeout == 0) {
            // Handle timeout if necessary
            return;
        }
    }
}

void I2C5_Start(void) {
    I2C5CONbits.SEN = 1;               // Initiate Start condition
    I2C5_WaitForIdle();
}

void I2C5_Stop(void) {
    I2C5CONbits.PEN = 1;               // Initiate Stop condition
    I2C5_WaitForIdle();
}

void I2C5_WriteByte(uint8_t data) {
    I2C5TRN = data;                    // Load data into transmit register
    I2C5_WaitForIdle();
    if (I2C5STATbits.ACKSTAT) {
        // Handle NACK if necessary
    }
}

void I2C5_Write(uint8_t slave_address, const char *data) {
    I2C5_Start();                      // Start I2C communication
    I2C5_WriteByte((slave_address << 1)); // Send slave address with write bit
    while (*data) {
        I2C5_WriteByte(*data++);       // Send each byte of data
    }
    I2C5_Stop();                       // End I2C communication
}
