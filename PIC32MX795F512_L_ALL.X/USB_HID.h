#define HID_EP 1
#define HID_IN_SIZE 64
#define HID_OUT_SIZE 64

uint8_t hid_report_in[HID_IN_SIZE];
uint8_t hid_report_out[HID_OUT_SIZE];
volatile bool hid_out_ready = false;

void USBDeviceTasks(void) {
    // USB state machine handler
    if (U1OTGIRbits.IDIF) U1OTGIRbits.IDIF = 0; // Clear USB ID interrupt
    if (U1IRbits.URSTIF) U1IRbits.URSTIF = 0;   // Clear USB reset interrupt
    if (U1IRbits.TRNIF) {                       // Handle transaction complete
        uint8_t ep = U1EP1bits.EPSTALL;         // Check for stall on EP1
        if (!ep && hid_out_ready) {
            for (uint8_t i = 0; i < HID_OUT_SIZE; i++) {
                hid_report_in[i] = hid_report_out[i] + 1;
            }
            hid_out_ready = false;
            U1TXIE = 1; // Enable endpoint transmission
        }
        U1IRbits.TRNIF = 0;
    }
}

void __ISR(_USB_1_VECTOR, IPL4AUTO) USB_ISR(void) {
    USBDeviceTasks();
    IFS5bits.USB1IF = 0;
}

void HIDInit(void) {
    U1EP1 = 0x1D; // Enable IN/OUT on EP1
    U1CON = 0x8000; // Enable USB module
    U1IE = 0x4900;  // Enable Reset, Idle, Stall interrupts
    U1ADDR = 0;     // Set address to 0 for device initialization
    U1EP1bits.EPOUTEN = 1; // Enable OUT endpoint
    U1EP1bits.EPINEN = 1;  // Enable IN endpoint
}

void USBProcessControlRequest() {
    if (U1IRbits.TRNIF) {
        hid_out_ready = true;
        for (uint8_t i = 0; i < HID_OUT_SIZE; i++) {
            hid_report_out[i] = U1TXREG;
        }
    }
}