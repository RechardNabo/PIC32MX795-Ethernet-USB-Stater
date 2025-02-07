// Capture mode definitions
#define CAPTURE_FALLING_EDGE            0
#define CAPTURE_RISING_EDGE             1
#define CAPTURE_4TH_RISING_EDGE         2
#define CAPTURE_16TH_RISING_EDGE        3
#define CAPTURE_FALLING_RISING_EDGE     4

// Timer selection definitions
#define TIMER2_16BIT                    0
#define TIMER3_16BIT                    1
#define TIMER2_3_32BIT                  2

#define IC1_PIN_RD8                     0
#define IC2_PIN_RD9                     1
#define IC3_PIN_RD10                    2
#define IC4_PIN_RD11                    3
#define IC5_PIN_RD12                    4

#define INPUT                           1
#define OUTPUT                          0
void INITIALIZE_ECCP(char PIN, char TIMER, char EDGE) {
    switch(PIN){
        case IC1_PIN_RD8:
            TRISDbits.TRISD8 = 1;
            IC1CON = 0;            // Disable module and clear control register
            switch(TIMER){
                case TIMER2_16BIT:
                    INITIALIZE_TIMER_2();
                    IC1CONbits.ICTMR = 1;  // Use Timer2 as the time base
                    break;
                case TIMER3_16BIT:
                    INITIALIZE_TIMER_3();
                    IC1CONbits.ICTMR = 0;  // Use Timer3 as the time base
                    break;
                case TIMER2_3_32BIT:
                    break;
                default:
                    break;
            }
            switch(EDGE){
                case CAPTURE_FALLING_EDGE:
                    IC1CONbits.ICM = 0b010; // Capture on every falling edge
                    break;
                case CAPTURE_RISING_EDGE:
                    IC1CONbits.ICM = 0b011; // Capture on every rising edge
                    break;
                case CAPTURE_4TH_RISING_EDGE:
                    IC1CONbits.ICM = 0b100; // Capture on every 4th rising edge
                    break;
                case CAPTURE_16TH_RISING_EDGE:
                    IC1CONbits.ICM = 0b101; // Capture on every 16th rising edge
                    break;
                case CAPTURE_FALLING_RISING_EDGE:
                    IC1CONbits.ICM = 0b110; // Capture on every rising and falling
                    break;
                default:
                    IC1CONbits.ICM = 0b000; // Capture on every rising edge
                    break;
            }
            IC1CONbits.ON = 1;     // Enable Input Capture module
            // Clear status flags
            IC1CONbits.ICOV = 0;   // Clear overflow flag
            IC1CONbits.ICBNE = 0;  // Clear buffer not empty flag

            // Configure Interrupts for IC1
            IPC1bits.IC1IP = 7;    // Set interrupt priority to 7 (highest)
            IPC1bits.IC1IS = 3;    // Set interrupt subpriority to 3
            IFS0bits.IC1IF = 0;    // Clear interrupt flag
            IEC0bits.IC1IE = 1;    // Enable IC1 interrupt
            break;
            
            
        case IC2_PIN_RD9:
            TRISDbits.TRISD9 = 1;
            IC2CON = 0;            // Disable module and clear control register
            switch(TIMER){
                case TIMER2_16BIT:
                    INITIALIZE_TIMER_2();
                    IC2CONbits.ICTMR = 1;  // Use Timer2 as the time base
                    break;
                case TIMER3_16BIT:
                    INITIALIZE_TIMER_3();
                    IC2CONbits.ICTMR = 0;  // Use Timer3 as the time base
                    break;
                case TIMER2_3_32BIT:
                    break;
                default:
                    break;
            } 
            switch(EDGE){
                case CAPTURE_FALLING_EDGE:
                    IC2CONbits.ICM = 0b010; // Capture on every falling edge
                    break;
                case CAPTURE_RISING_EDGE:
                    IC2CONbits.ICM = 0b011; // Capture on every rising edge
                    break;
                case CAPTURE_4TH_RISING_EDGE:
                    IC2CONbits.ICM = 0b100; // Capture on every 4th rising edge
                    break;
                case CAPTURE_16TH_RISING_EDGE:
                    IC2CONbits.ICM = 0b101; // Capture on every 16th rising edge
                    break;
                case CAPTURE_FALLING_RISING_EDGE:
                    IC2CONbits.ICM = 0b110; // Capture on every rising and falling
                    break;
                default:
                    IC2CONbits.ICM = 0b000; // Capture on every rising edge
                    break;
            }
            IC2CONbits.ON = 1;     // Enable Input Capture module
            // Clear status flags
            IC2CONbits.ICOV = 0;   // Clear overflow flag
            IC2CONbits.ICBNE = 0;  // Clear buffer not empty flag

            // Configure Interrupts for IC1
            IPC2bits.IC2IP = 7;    // Set interrupt priority to 7 (highest)
            IPC2bits.IC2IS = 3;    // Set interrupt subpriority to 3
            IFS0bits.IC2IF = 0;    // Clear interrupt flag
            IEC0bits.IC2IE = 1;    // Enable IC1 interrupt
            break;
            
            
        case IC3_PIN_RD10:
            TRISDbits.TRISD10 = 1;
            IC3CON = 0;            // Disable module and clear control register
            switch(TIMER){
                case TIMER2_16BIT:
                    INITIALIZE_TIMER_2();
                    IC3CONbits.ICTMR = 1;  // Use Timer2 as the time base
                    break;
                case TIMER3_16BIT:
                    INITIALIZE_TIMER_3();
                    IC3CONbits.ICTMR = 0;  // Use Timer3 as the time base
                    break;
                case TIMER2_3_32BIT:
                    break;
                default:
                    break;
            } 
            switch(EDGE){
                case CAPTURE_FALLING_EDGE:
                    IC3CONbits.ICM = 0b010; // Capture on every falling edge
                    break;
                case CAPTURE_RISING_EDGE:
                    IC3CONbits.ICM = 0b011; // Capture on every rising edge
                    break;
                case CAPTURE_4TH_RISING_EDGE:
                    IC3CONbits.ICM = 0b100; // Capture on every 4th rising edge
                    break;
                case CAPTURE_16TH_RISING_EDGE:
                    IC3CONbits.ICM = 0b101; // Capture on every 16th rising edge
                    break;
                case CAPTURE_FALLING_RISING_EDGE:
                    IC3CONbits.ICM = 0b110; // Capture on every rising and falling
                    break;
                default:
                    IC3CONbits.ICM = 0b000; // Capture on every rising edge
                    break;
            }
            IC3CONbits.ON = 1;     // Enable Input Capture module
            // Clear status flags
            IC3CONbits.ICOV = 0;   // Clear overflow flag
            IC3CONbits.ICBNE = 0;  // Clear buffer not empty flag

            // Configure Interrupts for IC1
            IPC3bits.IC3IP = 7;    // Set interrupt priority to 7 (highest)
            IPC3bits.IC3IS = 3;    // Set interrupt subpriority to 3
            IFS0bits.IC3IF = 0;    // Clear interrupt flag
            IEC0bits.IC3IE = 1;    // Enable IC1 interrupt
            break;
            
            
        case IC4_PIN_RD11:
            TRISDbits.TRISD11 = 1;
            IC4CON = 0;            // Disable module and clear control register
            switch(TIMER){
                case TIMER2_16BIT:
                    INITIALIZE_TIMER_2();
                    IC4CONbits.ICTMR = 1;  // Use Timer2 as the time base
                    break;
                case TIMER3_16BIT:
                    INITIALIZE_TIMER_3();
                    IC4CONbits.ICTMR = 0;  // Use Timer3 as the time base
                    break;
                case TIMER2_3_32BIT:
                    break;
                default:
                    break;
            }
            switch(EDGE){
                case CAPTURE_FALLING_EDGE:
                    IC4CONbits.ICM = 0b010; // Capture on every falling edge
                    break;
                case CAPTURE_RISING_EDGE:
                    IC4CONbits.ICM = 0b011; // Capture on every rising edge
                    break;
                case CAPTURE_4TH_RISING_EDGE:
                    IC4CONbits.ICM = 0b100; // Capture on every 4th rising edge
                    break;
                case CAPTURE_16TH_RISING_EDGE:
                    IC4CONbits.ICM = 0b101; // Capture on every 16th rising edge
                    break;
                case CAPTURE_FALLING_RISING_EDGE:
                    IC4CONbits.ICM = 0b110; // Capture on every rising and falling
                    break;
                default:
                    IC4CONbits.ICM = 0b000; // Capture on every rising edge
                    break;
            }
            IC4CONbits.ON = 1;     // Enable Input Capture module
            // Clear status flags
            IC4CONbits.ICOV = 0;   // Clear overflow flag
            IC4CONbits.ICBNE = 0;  // Clear buffer not empty flag

            // Configure Interrupts for IC1
            IPC4bits.IC4IP = 7;    // Set interrupt priority to 7 (highest)
            IPC4bits.IC4IS = 3;    // Set interrupt subpriority to 3
            IFS0bits.IC4IF = 0;    // Clear interrupt flag
            IEC0bits.IC4IE = 1;    // Enable IC1 interrupt
            break;
            
            
        case IC5_PIN_RD12:
            TRISDbits.TRISD12 = 1;
            IC5CON = 0;            // Disable module and clear control register
            switch(TIMER){
                case TIMER2_16BIT:
                    INITIALIZE_TIMER_2();
                    IC5CONbits.ICTMR = 1;  // Use Timer2 as the time base
                    break;
                case TIMER3_16BIT:
                    INITIALIZE_TIMER_3();
                    IC5CONbits.ICTMR = 0;  // Use Timer3 as the time base
                    break;
                case TIMER2_3_32BIT:
                    break;
                default:
                    break;
            }
            switch(EDGE){
                case CAPTURE_FALLING_EDGE:
                    IC5CONbits.ICM = 0b010; // Capture on every falling edge
                    break;
                case CAPTURE_RISING_EDGE:
                    IC5CONbits.ICM = 0b011; // Capture on every rising edge
                    break;
                case CAPTURE_4TH_RISING_EDGE:
                    IC5CONbits.ICM = 0b100; // Capture on every 4th rising edge
                    break;
                case CAPTURE_16TH_RISING_EDGE:
                    IC5CONbits.ICM = 0b101; // Capture on every 16th rising edge
                    break;
                case CAPTURE_FALLING_RISING_EDGE:
                    IC5CONbits.ICM = 0b110; // Capture on every rising and falling
                    break;
                default:
                    IC5CONbits.ICM = 0b000; // Capture on every rising edge
                    break;
            }
            IC5CONbits.ON = 1;     // Enable Input Capture module
            // Clear status flags
            IC5CONbits.ICOV = 0;   // Clear overflow flag
            IC5CONbits.ICBNE = 0;  // Clear buffer not empty flag

            // Configure Interrupts for IC1
            IPC5bits.IC5IP = 7;    // Set interrupt priority to 7 (highest)
            IPC5bits.IC5IS = 3;    // Set interrupt subpriority to 3
            IFS0bits.IC5IF = 0;    // Clear interrupt flag
            IEC0bits.IC5IE = 1;    // Enable IC1 interrupt
            break;
        default:
            break;
    }

    // Enable multi-vector interrupts
    INTCONbits.MVEC = 1;   // Enable multi-vector interrupt mode
    __builtin_enable_interrupts();
}

void __ISR(_INPUT_CAPTURE_1_VECTOR, IPL7AUTO) Input_1_CaptureISR(void) {
    // Clear the interrupt flag
    IFS0bits.IC1IF = 0;

    // Check and clear overflow condition
    if (IC1CONbits.ICOV) {
        IC1CONbits.ICOV = 0; // Clear overflow flag
    }

    // Check buffer not empty before reading
    if (IC1CONbits.ICBNE) {
        (void)IC1BUF; // Read the capture buffer to clear it
        LATDbits.LATD1 ^= 1; // Toggle LED on RD1
    }
}

void __ISR(_INPUT_CAPTURE_2_VECTOR, IPL7AUTO) Input_2_CaptureISR(void) {
    // Clear the interrupt flag
    IFS0bits.IC2IF = 0;

    // Check and clear overflow condition
    if (IC2CONbits.ICOV) {
        IC2CONbits.ICOV = 0; // Clear overflow flag
    }

    // Check buffer not empty before reading
    if (IC2CONbits.ICBNE) {
        (void)IC1BUF; // Read the capture buffer to clear it
        LATDbits.LATD1 ^= 1; // Toggle LED on RD1
    }
}

void __ISR(_INPUT_CAPTURE_3_VECTOR, IPL7AUTO) Input_3_CaptureISR(void) {
    // Clear the interrupt flag
    IFS0bits.IC3IF = 0;

    // Check and clear overflow condition
    if (IC3CONbits.ICOV) {
        IC3CONbits.ICOV = 0; // Clear overflow flag
    }

    // Check buffer not empty before reading
    if (IC3CONbits.ICBNE) {
        (void)IC1BUF; // Read the capture buffer to clear it
        LATDbits.LATD1 ^= 1; // Toggle LED on RD1
    }
}

void __ISR(_INPUT_CAPTURE_4_VECTOR, IPL7AUTO) Input_4_CaptureISR(void) {
    // Clear the interrupt flag
    IFS0bits.IC4IF = 0;

    // Check and clear overflow condition
    if (IC4CONbits.ICOV) {
        IC4CONbits.ICOV = 0; // Clear overflow flag
    }

    // Check buffer not empty before reading
    if (IC4CONbits.ICBNE) {
        (void)IC1BUF; // Read the capture buffer to clear it
        LATDbits.LATD1 ^= 1; // Toggle LED on RD1
    }
}

void __ISR(_INPUT_CAPTURE_5_VECTOR, IPL7AUTO) Input_5_CaptureISR(void) {
    // Clear the interrupt flag
    IFS0bits.IC5IF = 0;

    // Check and clear overflow condition
    if (IC5CONbits.ICOV) {
        IC5CONbits.ICOV = 0; // Clear overflow flag
    }

    // Check buffer not empty before reading
    if (IC5CONbits.ICBNE) {
        (void)IC1BUF; // Read the capture buffer to clear it
        LATDbits.LATD1 ^= 1; // Toggle LED on RD1
    }
}

