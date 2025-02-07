// PIC32MX795F512L Configuration Bit Settings

// DEVCFG3
#pragma config USERID = 0xFFFF          // User ID
#pragma config FSRSSEL = PRIORITY_7     // SRS Priority 7
#pragma config FMIIEN = ON              // MII Ethernet enabled
#pragma config FETHIO = ON              // Default Ethernet I/O
#pragma config FCANIO = OFF             // Alternate CAN I/O
#pragma config FUSBIDIO = ON            // USB ID pin controlled by USB module
#pragma config FVBUSONIO = ON           // USB VBUS ON pin controlled by USB module

// DEVCFG2
#pragma config FPLLIDIV = DIV_2         // PLL Input Divider (8 MHz / 2 = 4 MHz input to PLL)
#pragma config FPLLMUL = MUL_20         // PLL Multiplier (4 MHz * 20 = 80 MHz)
#pragma config UPLLIDIV = DIV_2         // USB PLL Input Divider (8 MHz / 2 = 4 MHz)
#pragma config UPLLEN = ON              // USB PLL Enable (Enabled)
#pragma config FPLLODIV = DIV_1         // PLL Output Divider (80 MHz)

 // DEVCFG1
#pragma config FNOSC = PRI              // Primary Oscillator
#pragma config FSOSCEN = OFF            // Secondary Oscillator Disabled
#pragma config IESO = OFF               // Internal/External Switch Over Disabled
#pragma config POSCMOD = HS             // High-Speed Oscillator mode
#pragma config OSCIOFNC = OFF           // CLKO Disabled
#pragma config FPBDIV = DIV_1           // Peripheral Clock Divisor (PBCLK = SYSCLK / 1)
#pragma config FCKSM = CSDCMD           // Clock Switching and Monitor Disabled
#pragma config WDTPS = PS1              // Watchdog Timer Postscaler (1:1)
#pragma config FWDTEN = OFF             // Watchdog Timer Disabled

// DEVCFG0
#pragma config DEBUG = OFF              // Debugger Disabled
#pragma config ICESEL = ICS_PGx2        // ICE/ICD Comm Channel Select
#pragma config PWP = OFF                // Program Flash Write Protect Disabled
#pragma config BWP = OFF                // Boot Flash Write Protect Disabled
#pragma config CP = OFF                 // Code Protect Disabled

#include <xc.h>
#include <stdint.h>
#include <stdbool.h>

// USB Descriptor Types
#define USB_DESCRIPTOR_TYPE_DEVICE        1
#define USB_DESCRIPTOR_TYPE_CONFIGURATION 2
#define USB_DESCRIPTOR_TYPE_STRING        3
#define USB_DESCRIPTOR_TYPE_INTERFACE     4
#define USB_DESCRIPTOR_TYPE_ENDPOINT      5
#define USB_DESCRIPTOR_TYPE_HID           0x21
#define USB_DESCRIPTOR_TYPE_HID_REPORT    0x22

// Endpoint Addresses
#define CDC_DATA_IN_EP    0x81 // Endpoint 1 IN
#define CDC_DATA_OUT_EP   0x01 // Endpoint 1 OUT
#define CDC_NOTIFICATION_EP 0x82 // Endpoint 2 IN

// USB States
typedef enum {
    USB_STATE_INIT,
    USB_STATE_DETACHED,
    USB_STATE_ATTACHED,
    USB_STATE_POWERED,
    USB_STATE_DEFAULT,
    USB_STATE_ADDRESS,
    USB_STATE_CONFIGURED,
    USB_STATE_SUSPENDED
} USB_State;

// USB Device Descriptor
const uint8_t device_descriptor[] = {
    18,                         // bLength
    USB_DESCRIPTOR_TYPE_DEVICE, // bDescriptorType
    0x00, 0x02,                 // bcdUSB 2.00
    0x02,                       // bDeviceClass (CDC)
    0x00,                       // bDeviceSubClass
    0x00,                       // bDeviceProtocol
    0x40,                       // bMaxPacketSize0
    0x6A, 0x0B,                 // idVendor (0x0B6A)
    0x46, 0x53,                 // idProduct (0x5346)
    0x00, 0x01,                 // bcdDevice 1.00
    1,                          // iManufacturer
    2,                          // iProduct
    3,                          // iSerialNumber
    1                           // bNumConfigurations
};

// USB Configuration Descriptor
const uint8_t configuration_descriptor[] = {
    // Configuration Descriptor
    9,                          // bLength
    USB_DESCRIPTOR_TYPE_CONFIGURATION, // bDescriptorType
    67, 0,                      // wTotalLength (67 bytes)
    2,                          // bNumInterfaces
    1,                          // bConfigurationValue
    0,                          // iConfiguration
    0xC0,                       // bmAttributes (Self-powered)
    50,                         // bMaxPower (100 mA)

    // CDC Interface Descriptor
    9,                          // bLength
    USB_DESCRIPTOR_TYPE_INTERFACE,// bDescriptorType
    0,                          // bInterfaceNumber
    0,                          // bAlternateSetting
    2,                          // bNumEndpoints
    0x02,                       // bInterfaceClass (CDC)
    0x02,                       // bInterfaceSubClass (Abstract Control Model)
    0x01,                       // bInterfaceProtocol (Common AT commands)
    0,                          // iInterface

    // CDC Header Functional Descriptor
    5,                          // bLength
    USB_DESCRIPTOR_TYPE_HID,    // bDescriptorType
    0x00,                       // bDescriptorSubtype (Header Functional Descriptor)
    0x10, 0x01,                 // bcdCDC 1.10

    // CDC ACM Functional Descriptor
    4,                          // bLength
    USB_DESCRIPTOR_TYPE_HID,    // bDescriptorType
    0x02,                       // bDescriptorSubtype (Abstract Control Management Functional Descriptor)
    0x02,                       // bmCapabilities

    // CDC Union Functional Descriptor
    5,                          // bLength
    USB_DESCRIPTOR_TYPE_HID,    // bDescriptorType
    0x06,                       // bDescriptorSubtype (Union Functional Descriptor)
    0,                          // bMasterInterface (CDC Control Interface)
    1,                          // bSlaveInterface0 (CDC Data Interface)

    // CDC Call Management Functional Descriptor
    5,                          // bLength
    USB_DESCRIPTOR_TYPE_HID,    // bDescriptorType
    0x01,                       // bDescriptorSubtype (Call Management Functional Descriptor)
    0x00,                       // bmCapabilities
    1,                          // bDataInterface

    // CDC Endpoint Descriptor (Notification)
    7,                          // bLength
    USB_DESCRIPTOR_TYPE_ENDPOINT,// bDescriptorType
    CDC_NOTIFICATION_EP,        // bEndpointAddress
    0x03,                       // bmAttributes (Interrupt)
    0x08, 0x00,                 // wMaxPacketSize
    10,                         // bInterval

    // CDC Data Interface Descriptor
    9,                          // bLength
    USB_DESCRIPTOR_TYPE_INTERFACE,// bDescriptorType
    1,                          // bInterfaceNumber
    0,                          // bAlternateSetting
    2,                          // bNumEndpoints
    0x0A,                       // bInterfaceClass (CDC Data)
    0x00,                       // bInterfaceSubClass
    0x00,                       // bInterfaceProtocol
    0,                          // iInterface

    // CDC Data Endpoint Descriptor (OUT)
    7,                          // bLength
    USB_DESCRIPTOR_TYPE_ENDPOINT,// bDescriptorType
    CDC_DATA_OUT_EP,            // bEndpointAddress
    0x02,                       // bmAttributes (Bulk)
    0x40, 0x00,                 // wMaxPacketSize (64 bytes)
    0,                          // bInterval

    // CDC Data Endpoint Descriptor (IN)
    7,                          // bLength
    USB_DESCRIPTOR_TYPE_ENDPOINT,// bDescriptorType
    CDC_DATA_IN_EP,             // bEndpointAddress
    0x02,                       // bmAttributes (Bulk)
    0x40, 0x00,                 // wMaxPacketSize (64 bytes)
    0                           // bInterval
};

// USB String Descriptors
const uint8_t string_descriptor_0[] = {
    4,                          // bLength
    USB_DESCRIPTOR_TYPE_STRING, // bDescriptorType
    0x09, 0x04                  // wLANGID (English - United States)
};

const uint8_t string_descriptor_1[] = {
    12,                         // bLength
    USB_DESCRIPTOR_TYPE_STRING, // bDescriptorType
    'M', 0, 'y', 0, 'I', 0, 'n', 0, 's', 0, 't', 0
};

const uint8_t string_descriptor_2[] = {
    20,                         // bLength
    USB_DESCRIPTOR_TYPE_STRING, // bDescriptorType
    'P', 0, 'I', 0, 'C', 0, '3', 0, '2', 0, ' ', 0, 'C', 0, 'D', 0, 'C', 0
};

const uint8_t string_descriptor_3[] = {
    26,                         // bLength
    USB_DESCRIPTOR_TYPE_STRING, // bDescriptorType
    '1', 0, '2', 0, '3', 0, '4', 0, '5', 0, '6', 0, '7', 0, '8', 0, '9', 0, '0', 0
};

// USB Descriptor Pointer
const uint8_t* const usb_descriptors[] = {
    device_descriptor,
    configuration_descriptor,
    string_descriptor_0,
    string_descriptor_1,
    string_descriptor_2,
    string_descriptor_3
};

// USB State Variable
volatile USB_State usb_state = USB_STATE_INIT;

// USB Initialization Function
void USBInit(void) {
    // Set USB-related I/O pins
    TRISGbits.TRISG2 = 1;  // D+ as input
    TRISGbits.TRISG3 = 1;  // D- as input
    TRISFbits.TRISF3 = 1;  // USBID as input

    // Reset USB module
    U1CON = 0;
    U1CONbits.SIDL = 1;      // Stop module in Idle mode
    U1CONbits.ON = 1;        // Turn on USB module

    // Enable USB pull-up on D+
    U1OTGCONbits.USBEN = 1;
    U1OTGCONbits.OTGEN = 1;

    // Configure USB endpoints
    U1EP0 = 0x00; // Control endpoint
    U1EP1 = 0x00; // CDC Notification
    U1EP2 = 0x00; // CDC Data OUT
    U1EP3 = 0x00; // CDC Data IN

    // Enable USB interrupts
    IEC5bits.USB1IE = 1;     // Enable USB interrupt
    IPC18bits.USBIP = 4;     // Set USB interrupt priority
    IPC18bits.USBIS = 0;     // Set USB interrupt sub-priority
    IFS5bits.USB1IF = 0;     // Clear USB interrupt flag
}

// USB Descriptor Handling
uint8_t* GetDescriptor(uint8_t type, uint8_t index, uint16_t langid, uint16_t* length) {
    switch (type) {
        case USB_DESCRIPTOR_TYPE_DEVICE:
            *length = sizeof(device_descriptor);
            return (uint8_t*)device_descriptor;
        case USB_DESCRIPTOR_TYPE_CONFIGURATION:
            *length = sizeof(configuration_descriptor);
            return (uint8_t*)configuration_descriptor;
        case USB_DESCRIPTOR_TYPE_STRING:
            if (index < sizeof(usb_descriptors)/sizeof(usb_descriptors[0])) {
                *length = *(usb_descriptors[index]);
                return (uint8_t*)usb_descriptors[index];
            }
            break;
        default:
            break;
    }
    *length = 0;
    return NULL;
}

// USB Control Transfer Handling
void HandleSetupPacket(void) {
    uint8_t bmRequestType = U1EP0BUF[1];
    uint8_t bRequest = U1EP0BUF[2];
    uint16_t wValue = U1EP0BUF[3] | (U1EP0BUF[4] << 8);
    uint16_t wIndex = U1EP0BUF[5] | (U1EP0BUF[6] << 8);
    uint16_t wLength = U1EP0BUF[7] | (U1EP0BUF[8] << 8);

    if ((bmRequestType & 0x60) == 0x00) { // Standard Request
        switch (bRequest) {
            case 0x06: // GET_DESCRIPTOR
                {
                    uint8_t descriptor_type = (wValue >> 8) & 0xFF;
                    uint8_t descriptor_index = wValue & 0xFF;
                    uint16_t desc_length;
                    uint8_t* descriptor = GetDescriptor(descriptor_type, descriptor_index, wIndex, &desc_length);
                    if (descriptor != NULL) {
                        if (desc_length > wLength) desc_length = wLength;
                        memcpy((void*)U1EP0FIFO, descriptor, desc_length);
                        U1EP0BC = desc_length;
                    } else {
                        // Stall on error
                        U1EP0CONbits.STALL = 1;
                    }
                }
                break;
            case 0x09: // SET_CONFIGURATION
                {
                    uint8_t configuration = wValue & 0xFF;
                    if (configuration == 1) {
                        usb_state = USB_STATE_CONFIGURED;
                        // Enable endpoints
                        U1EP1 = CDC_NOTIFICATION_EP | 0x10; // IN endpoint
                        U1EP2 = CDC_DATA_OUT_EP | 0x00;     // OUT endpoint
                        U1EP3 = CDC_DATA_IN_EP | 0x10;      // IN endpoint
                    }
                    // Acknowledge
                    U1EP0CONbits.TOGD = 1;
                }
                break;
            default:
                // Stall for unsupported requests
                U1EP0CONbits.STALL = 1;
                break;
        }
    } else if ((bmRequestType & 0x60) == 0x20) { // Class-specific Request
        // Handle CDC-specific requests here
    } else {
        // Stall for unsupported request types
        U1EP0CONbits.STALL = 1;
    }
}

// USB Data Transfer Handling
void USBTransfer(void) {
    if (U1IRbits.TRNIF) {
        // Handle transfer complete
        uint8_t ep = U1EP0CONbits.EPHSHK;
        U1IRbits.TRNIF = 0;
    }

    if (U1IRbits.IDIF) {
        // Handle ID interrupt (Cable connection)
        U1OTGIRbits.IDIF = 0;
    }

    if (U1IRbits.URSTIF) {
        // Handle USB Reset
        U1IRbits.URSTIF = 0;
        usb_state = USB_STATE_DEFAULT;
    }

    if (U1IRbits.SOFIF) {
        // Handle Start Of Frame
        U1IRbits.SOFIF = 0;
    }
}

// USB Interrupt Service Routine
void __ISR(_USB_VECTOR, IPL4AUTO) USB_ISR(void) {
    USBTransfer();
    IFS5bits.USB1IF = 0;
}

// CDC Data IN Endpoint Handler
void CDC_Data_IN(void) {
    // Send data to host
    if (usb_state == USB_STATE_CONFIGURED) {
        // Example: Echo received data
        // Implement your CDC data IN handling here
    }
}

// CDC Data OUT Endpoint Handler
void CDC_Data_OUT(void) {
    if (usb_state == USB_STATE_CONFIGURED) {
        // Read data from host
        uint8_t received_data[64];
        uint16_t received_length = U1EP2BC; // Bytes received
        memcpy(received_data, (void*)U1EP2FIFO, received_length);

        // Process received data
        // Example: Echo back the received data
        memcpy((void*)U1EP3FIFO, received_data, received_length);
        U1EP3BC = received_length; // Prepare IN endpoint to send data back
    }
}

// Main Function
int main(void) {
    // Disable interrupts during setup
    __builtin_disable_interrupts();

    // Initialize USB
    USBInit();

    // Enable multi-vector interrupts
    INTCONbits.MVEC = 1;
    __builtin_enable_interrupts();

    while (1) {
        if (usb_state == USB_STATE_CONFIGURED) {
            // Handle CDC Data IN and OUT
            if (U1EP1bits.EPINEN) {
                CDC_Data_IN();
            }
            if (U1EP2bits.EPOUTEN) {
                CDC_Data_OUT();
            }
        }
    }

    return 0;
}
