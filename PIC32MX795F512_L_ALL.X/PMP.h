
void PMP_Init8BitMode(void);
void PMP_Init16BitMode(void);
void PMP_Write(uint16_t address, uint16_t data);
uint16_t PMP_Read(uint16_t address);
void __ISR(_PMP_VECTOR, IPL3SOFT) PMP_InterruptHandler(void);

volatile bool pmpTransferComplete = false;


void PMP_Init8BitMode(void) {
    IEC1CLR = _IEC1_PMPIE_MASK; // Disable PMP interrupts
    PMCON = 0x0000; // Stop and reset PMP
    PMMODE = 0x2A00; // Configure for 8-bit data width, auto-increment address
    PMMODESET = 0x0101; // Enable 1 wait cycle for setup and hold, 2 cycles for strobe
    PMCONSET = 0x8380; // Enable PMP, enable read/write strobes
    PMAEN = 0xFF00; // Enable address lines for A15 to A8

    // Configure interrupts
    IPC7CLR = 0x1F; // Clear priority and subpriority
    IPC7SET = (5 << 2) | (1 << 0); // Set priority=5, subpriority=1
    IFS1CLR = _IFS1_PMPIF_MASK; // Clear interrupt flag
    IEC1SET = _IEC1_PMPIE_MASK; // Enable PMP interrupt
}

void PMP_Init16BitMode(void) {
    IEC1CLR = _IEC1_PMPIE_MASK; // Disable PMP interrupts
    PMCON = 0x0000; // Stop and reset PMP
    PMMODE = 0x2A40; // Configure for 16-bit data width, auto-increment address
    PMMODESET = 0x0101; // Enable 1 wait cycle for setup and hold, 2 cycles for strobe
    PMCONSET = 0x8380; // Enable PMP, enable read/write strobes
    PMAEN = 0xFF00; // Enable address lines for A15 to A8

    // Configure interrupts
    IPC7CLR = 0x1F; // Clear priority and subpriority
    IPC7SET = (5 << 2) | (1 << 0); // Set priority=5, subpriority=1
    IFS1CLR = _IFS1_PMPIF_MASK; // Clear interrupt flag
    IEC1SET = _IEC1_PMPIE_MASK; // Enable PMP interrupt
}

void PMP_Write(uint16_t address, uint16_t data) {
    while (PMMODEbits.BUSY); // Wait for PMP to be idle
    PMADDR = address; // Set address
    PMDIN = data; // Write data
    while (!pmpTransferComplete); // Wait for completion
    pmpTransferComplete = false; // Reset flag
}

uint16_t PMP_Read(uint16_t address) {
    while (PMMODEbits.BUSY); // Wait for PMP to be idle
    PMADDR = address; // Set address
    uint16_t dummy = PMDIN; // Dummy read to trigger operation
    while (PMMODEbits.BUSY); // Wait for completion
    return PMDIN; // Read data
}

void __ISR(_PMP_VECTOR, IPL5SOFT) PMP_InterruptHandler(void) {
    if (IFS1bits.PMPIF) {
        IFS1CLR = _IFS1_PMPIF_MASK; // Clear interrupt flag
        pmpTransferComplete = true; // Signal transfer complete
    }
}