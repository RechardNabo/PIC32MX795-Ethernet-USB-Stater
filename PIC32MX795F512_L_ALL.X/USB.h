
// Initialize USB in Standard Host mode
void SystemInit(void) {
    SYSKEY = 0xAA996655;
    SYSKEY = 0x556699AA;
    OSCCONbits.PBDIV = 0;
    SYSKEY = 0x33333333;
}

void USBStandardHostInitialize(void) {
    U1CONbits.HOSTEN = 1;
    U1PWRCbits.USBPWR = 1;
    U1IEbits.ATTACHIE = 1;
    U1IEbits.TRNIE = 1;
    U1IEbits.URSTIE = 1;
}

void USBStandardHostTasks(void) {
    if (U1IRbits.URSTIF) {
        U1IRbits.URSTIF = 1;
        U1ADDR = 0x00;
        U1EP0bits.EPSTALL = 0;
        U1EP0bits.EPHSHK = 1;
        U1EP0bits.EPCONDIS = 0;
    }

    if (U1IRbits.ATTACHIF) {
        U1IRbits.ATTACHIF = 1;
        U1ADDR = 0x01;
        U1TOKbits.PID = 0b0001;
    }

    if (U1IRbits.TRNIF) {
        U1IRbits.TRNIF = 1;
    }
}

void USBHandleDangling(void) {
    if (U1OTGSTATbits.SESVD == 0) {
        U1CONbits.HOSTEN = 0;
        U1PWRCbits.USBPWR = 0;
    }
}

//===================================[Embedded host]============================

// Initialize USB in Embedded Host mode
void USBEmbeddedHostInitialize(void) {
    U1CONbits.HOSTEN = 1;              // Enable host mode
    U1PWRCbits.USBPWR = 1;             // Power on USB module
}

// Handle USB tasks and interaction for Embedded Host
void USBEmbeddedHostTasks(void) {
    // Check if a device is connected
    if (U1OTGSTATbits.SESVD) {
        // Device session is valid
        if (U1IRbits.IDLEIF) {
            U1IRbits.IDLEIF = 1;         // Clear the ID interrupt flag
            // Additional code to handle device connection
        }

        // Check for USB device attach event
        if (U1IRbits.ATTACHIF) {
            U1IRbits.ATTACHIF = 1;     // Clear the attach interrupt flag
            // Additional code to initialize communication with the attached device
        }

        // Process USB transactions and data exchange
        if (U1IRbits.TRNIF) {
            U1IRbits.TRNIF = 1;        // Clear transaction interrupt flag
            // Additional code to process USB transactions
        }

        // Check for detach event
        if (U1IRbits.DETACHIF) {
            U1IRbits.DETACHIF = 1;     // Clear detach interrupt flag
            // Additional code to handle device detachment
        }
    }
}
//======================================[USB device]============================
// Initialize USB in Device mode
void USBDeviceInitialize(void) {
    U1CONbits.HOSTEN = 0;
    U1ADDRbits.DEVADDR = 0x00;
    U1PWRCbits.USBPWR = 1;
    U1IEbits.TRNIE = 1;
}

// Handle USB device tasks
void USBDeviceTasks(void) {
    if (U1IRbits.URSTIF) {
        U1IRbits.URSTIF = 1;
        U1EP0bits.EPTXEN = 1;
        U1ADDRbits.DEVADDR = 0x00;
    }

    if (U1IRbits.IDLEIF) {
        U1IRbits.IDLEIF = 1;
    }

    if (U1IRbits.STALLIF) {
        U1IRbits.STALLIF = 1;
    }
}

// Handle communication as a USB device
void USBDeviceCommunicate(void) {
    if (U1IRbits.TRNIF) {
        U1IRbits.TRNIF = 1;
        // Communication code for data exchange
    }
}

//============================[OTG Dual Role]===================================


// Initialize USB in OTG Dual Role mode
void USB_OTG_Initialize(void) {
    U1OTGCONbits.VBUSCHG = 1;
    U1OTGIRbits.SESVDIF = 1;
    U1OTGCONbits.OTGEN = 1;
}

// OTG tasks for determining and switching roles
void USB_OTG_HostTasks(void);
void USB_OTG_DeviceTasks(void);
void USB_OTG_Tasks(void) {
    if (U1OTGIRbits.SESVDIF) {
        U1OTGIRbits.SESVDIF = 1;
        U1CONbits.HOSTEN = 0;
        U1ADDRbits.DEVADDR = 0x00;
        USB_OTG_DeviceTasks();
    } else if (U1OTGIRbits.VBUSVDIF) {
        U1OTGIRbits.VBUSVDIF = 1;
        U1CONbits.HOSTEN = 1;
        USB_OTG_HostTasks();
    }
}
/*
// Handle USB OTG Device tasks
void USB_OTG_DeviceTasks(void) {
    if (U1IRbits.URSTIF) {
        U1IRbits.URSTIF = 1;
        U1EP0bits.EPTXEN = 1;
        U1ADDRbits.DEVADDR = 0x00;
    }

    if (U1IRbits.IDLEIF) {
        U1IRbits.IDLEIF = 1;
    }

    if (U1IRbits.STALLIF) {
        U1IRbits.STALLIF = 1;
    }
}

// Handle USB OTG Host tasks
void USB_OTG_HostTasks(void) {
    if (U1IRbits.SOFIF) {
        U1IRbits.SOFIF = 1;
        // Host-specific handling code
    }

    if (U1IRbits.URSTIF) {
        U1IRbits.URSTIF = 1;
    }
}

// Handle USB OTG communication
void USB_OTG_Communicate(void) {
    if (U1IRbits.TRNIF) {
        U1IRbits.TRNIF = 1;
        // Communication code for data exchange
    }
}
*/
//==================================[data echange and host spec handling]======
// Host-specific handling code
void USB_OTG_HostTasks(void) {
    if (U1IRbits.SOFIF) {
        U1IRbits.SOFIF = 1;

        // Setup transaction
        U1ADDR = 0x01;                   // Set target device address
        U1TOKbits.PPBI = 0;              // Set PID token type
        U1TOKbits.TOK = 0b0001;          // Setup token

        // Send data packet
        U1EP0bits.EPHSHK = 1;            // Enable handshaking
        U1CONbits.PKTDIS = 0;            // Packet processing enable
        U1EP0bits.EPCONDIS = 0;          // Endpoint control disable

        // Process response from the device
        if (U1STATbits.PPBI == 1) {
            // Prepare for the next transaction
            U1TOKbits.PPBI = 0;
        }
    }

    if (U1IRbits.URSTIF) {
        U1IRbits.URSTIF = 1;
        U1CONbits.HOSTEN = 1;            // Enable Host mode
    }
}

// Communication code for data exchange
void USB_OTG_Communicate(void) {
    if (U1IRbits.TRNIF) {
        U1IRbits.TRNIF = 1;

        // Data transmission
        U1EP0bits.EPTXEN = 1;           // Enable OUT transfer on endpoint 0
        U1TXREG = 0xAA;                  // Send data (example byte)
        U1CONbits.PKTDIS = 0;            // Packet processing enable
        while (!U1IRbits.SOFIF);         // Wait for data to be sent
        U1IRbits.SOFIF = 1;              // Clear transaction complete flag

        // Data reception
        U1EP0bits.EPTXEN = 1;            // Enable IN transfer on endpoint 0
        while (!U1IRbits.SOFIF);         // Wait for data to be received
        uint8_t receivedData = U1RXREG;  // Read received data
        U1IRbits.SOFIF = 1;              // Clear transaction complete flag
    }
}
