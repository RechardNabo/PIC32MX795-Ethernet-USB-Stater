

#define OC1_PIN         (0x01)
#define OC2_PIN         (0x02)
#define OC3_PIN         (0x03)
#define OC4_PIN         (0x04)
#define OC5_PIN         (0x05)

#define OCX_TIMER_2     (0x00)
#define OCX_TIMER_3     (0x01)

#define OCM_PWM_FAULT_ENABLED          1  // 111: PWM mode on OCx; Fault pin enabled
#define OCM_PWM_FAULT_DISABLED         2  // 110: PWM mode on OCx; Fault pin disabled
#define OCM_CONTINUOUS_PULSE           3  // 101: Initialize OCx pin low; generate continuous output pulses
#define OCM_SINGLE_PULSE               4  // 100: Initialize OCx pin low; generate single output pulse
#define OCM_TOGGLE                     5  // 011: Compare event toggles OCx pin
#define OCM_FORCE_LOW                  6  // 010: Initialize OCx pin high; compare event forces OCx pin low
#define OCM_FORCE_HIGH                 7  // 001: Initialize OCx pin low; compare event forces OCx pin high
#define OCM_DISABLED                   8  // 000: Output compare peripheral is disabled but continues to draw current
#define PWM_MIN_FREQ                   3
void INITIALIZE_PWM(int PIN, int TIMER, int MODE) {
    switch(PIN){
        case OC1_PIN:
            TRISDbits.TRISD0 = 0;
            // Configure OC1 for PWM mode
            OC1CON = 0x0;             // Disable OC1 and clear settings
            switch(MODE){
                case OCM_PWM_FAULT_ENABLED:
                    OC1CONbits.OCM = 0b111;   // PWM mode on OCx; Fault pin enabled
                    break;
                case OCM_PWM_FAULT_DISABLED:
                    OC1CONbits.OCM = 0b110;   // PWM mode on OCx; Fault pin disabled
                    break;
                case OCM_CONTINUOUS_PULSE:
                    OC1CONbits.OCM = 0b101;   // Initialize OCx pin low; generate continuous output pulses on OCx pin
                    break;
                case OCM_SINGLE_PULSE:
                    OC1CONbits.OCM = 0b100;   // Initialize OCx pin low; generate single output pulse on OCx pin
                    break;
                case OCM_TOGGLE:
                    OC1CONbits.OCM = 0b011;   // Compare event toggles OCx pin
                    break;
                case OCM_FORCE_LOW:
                    OC1CONbits.OCM = 0b010;   // Initialize OCx pin high; compare event forces OCx pin low
                    break;
                case OCM_FORCE_HIGH:
                    OC1CONbits.OCM = 0b001;   // Initialize OCx pin low; compare event forces OCx pin high
                    break;
                case OCM_DISABLED:
                    OC1CONbits.OCM = 0b000;   // Output compare peripheral is disabled but continues to draw current
                    break;
                default:
                    break;
            }
            switch(TIMER){
                case OCX_TIMER_2:
                    // Configure Timer2
                    OC1R = PR2 / 2;           // Initial duty cycle 50%
                    OC1RS = PR2 / 2;          // Secondary compare value
                    INITIALIZE_TIMER_2();
                    OC1CONbits.OCTSEL = 0;    // Use Timer2 as the time base
                    break;
                case OCX_TIMER_3:
                    // Configure Timer3
                    OC1R = PR3 / 2;           // Initial duty cycle 50%
                    OC1RS = PR3 / 2;          // Secondary compare value
                    INITIALIZE_TIMER_3();
                    OC1CONbits.OCTSEL = 1;    // Use Timer3 as the time base
                    break;
                default:
                    break;
            }
            // Configure interrupt for OC1
            IFS0bits.OC1IF = 0;
            IPC1bits.OC1IP = 7;
            IPC1bits.OC1IS = 3;
            IEC0bits.OC1IE = 1;
            OC1CONbits.OC32 = 0;
            OC1CONbits.OCSIDL = 0;
            OC1CONbits.ON = 1;
            break;
            
            
            
        case OC2_PIN:
            TRISDbits.TRISD1 = 0;
            // Configure OC2 for PWM mode
            OC2CON = 0x0;             // Disable OC2 and clear settings
            switch(MODE){
                case OCM_PWM_FAULT_ENABLED:
                    OC2CONbits.OCM = 0b111;   // PWM mode on OCx; Fault pin enabled
                    break;
                case OCM_PWM_FAULT_DISABLED:
                    OC2CONbits.OCM = 0b110;   // PWM mode on OCx; Fault pin disabled
                    break;
                case OCM_CONTINUOUS_PULSE:
                    OC2CONbits.OCM = 0b101;   // Initialize OCx pin low; generate continuous output pulses on OCx pin
                    break;
                case OCM_SINGLE_PULSE:
                    OC2CONbits.OCM = 0b100;   // Initialize OCx pin low; generate single output pulse on OCx pin
                    break;
                case OCM_TOGGLE:
                    OC2CONbits.OCM = 0b011;   // Compare event toggles OCx pin
                    break;
                case OCM_FORCE_LOW:
                    OC2CONbits.OCM = 0b010;   // Initialize OCx pin high; compare event forces OCx pin low
                    break;
                case OCM_FORCE_HIGH:
                    OC2CONbits.OCM = 0b001;   // Initialize OCx pin low; compare event forces OCx pin high
                    break;
                case OCM_DISABLED:
                    OC2CONbits.OCM = 0b000;   // Output compare peripheral is disabled but continues to draw current
                    break;
                default:
                    break;
            }
            switch(TIMER){
                case OCX_TIMER_2:
                    // Configure Timer2
                    OC2R = PR2 / 2;           // Initial duty cycle 50%
                    OC2RS = PR2 / 2;          // Secondary compare value
                    INITIALIZE_TIMER_2();
                    OC2CONbits.OCTSEL = 0;    // Use Timer2 as the time base
                    break;
                case OCX_TIMER_3:
                    // Configure Timer3
                    OC2R = PR3 / 2;           // Initial duty cycle 50%
                    OC2RS = PR3 / 2;          // Secondary compare value
                    INITIALIZE_TIMER_3();
                    OC2CONbits.OCTSEL = 1;    // Use Timer3 as the time base
                    break;
                default:
                    break;
            }
          // Configure interrupt for OC2
            IFS0bits.OC2IF = 0;
            IPC2bits.OC2IP = 7;
            IPC2bits.OC2IS = 3;
            IEC0bits.OC2IE = 1;
            OC2CONbits.OC32 = 0;
            OC2CONbits.OCSIDL = 0;
            OC2CONbits.ON = 1;
            break;
            
            
            
            
        case OC3_PIN:
            TRISDbits.TRISD2 = 0;
            // Configure OC3 for PWM mode
            OC3CON = 0x0;             // Disable OC3 and clear settings
            switch(MODE){
                case OCM_PWM_FAULT_ENABLED:
                    OC3CONbits.OCM = 0b111;   // PWM mode on OCx; Fault pin enabled
                    break;
                case OCM_PWM_FAULT_DISABLED:
                    OC3CONbits.OCM = 0b110;   // PWM mode on OCx; Fault pin disabled
                    break;
                case OCM_CONTINUOUS_PULSE:
                    OC3CONbits.OCM = 0b101;   // Initialize OCx pin low; generate continuous output pulses on OCx pin
                    break;
                case OCM_SINGLE_PULSE:
                    OC3CONbits.OCM = 0b100;   // Initialize OCx pin low; generate single output pulse on OCx pin
                    break;
                case OCM_TOGGLE:
                    OC3CONbits.OCM = 0b011;   // Compare event toggles OCx pin
                    break;
                case OCM_FORCE_LOW:
                    OC3CONbits.OCM = 0b010;   // Initialize OCx pin high; compare event forces OCx pin low
                    break;
                case OCM_FORCE_HIGH:
                    OC3CONbits.OCM = 0b001;   // Initialize OCx pin low; compare event forces OCx pin high
                    break;
                case OCM_DISABLED:
                    OC3CONbits.OCM = 0b000;   // Output compare peripheral is disabled but continues to draw current
                    break;
                default:
                    break;
            }
            switch(TIMER){
                case OCX_TIMER_2:
                    // Configure Timer2
                    OC3R = PR2 / 2;           // Initial duty cycle 50%
                    OC3RS = PR2 / 2;          // Secondary compare value
                    INITIALIZE_TIMER_2();
                    OC3CONbits.OCTSEL = 0;    // Use Timer2 as the time base
                    break;
                case OCX_TIMER_3:
                    // Configure Timer3
                    OC3R = PR3 / 2;           // Initial duty cycle 50%
                    OC3RS = PR3 / 2;          // Secondary compare value
                    INITIALIZE_TIMER_3();
                    OC3CONbits.OCTSEL = 1;    // Use Timer3 as the time base
                    break;
                default:
                    break;
            }
         // Configure interrupt for OC3
            IFS0bits.OC3IF = 0;
            IPC3bits.OC3IP = 7;
            IPC3bits.OC3IS = 3;
            IEC0bits.OC3IE = 1;
            OC3CONbits.OC32 = 0;
            OC3CONbits.OCSIDL = 0;
            OC3CONbits.ON = 1;
            break;
            
            
            
            
            
        case OC4_PIN:
            TRISDbits.TRISD3 = 0;
            // Configure OC4 for PWM mode
            OC4CON = 0x0;             // Disable OC4 and clear settings
            switch(MODE){
                case OCM_PWM_FAULT_ENABLED:
                    OC4CONbits.OCM = 0b111;   // PWM mode on OCx; Fault pin enabled
                    break;
                case OCM_PWM_FAULT_DISABLED:
                    OC4CONbits.OCM = 0b110;   // PWM mode on OCx; Fault pin disabled
                    break;
                case OCM_CONTINUOUS_PULSE:
                    OC4CONbits.OCM = 0b101;   // Initialize OCx pin low; generate continuous output pulses on OCx pin
                    break;
                case OCM_SINGLE_PULSE:
                    OC4CONbits.OCM = 0b100;   // Initialize OCx pin low; generate single output pulse on OCx pin
                    break;
                case OCM_TOGGLE:
                    OC4CONbits.OCM = 0b011;   // Compare event toggles OCx pin
                    break;
                case OCM_FORCE_LOW:
                    OC4CONbits.OCM = 0b010;   // Initialize OCx pin high; compare event forces OCx pin low
                    break;
                case OCM_FORCE_HIGH:
                    OC4CONbits.OCM = 0b001;   // Initialize OCx pin low; compare event forces OCx pin high
                    break;
                case OCM_DISABLED:
                    OC4CONbits.OCM = 0b000;   // Output compare peripheral is disabled but continues to draw current
                    break;
                default:
                    break;
            }
            switch(TIMER){
                case OCX_TIMER_2:
                    // Configure Timer2            
                    OC4R = PR2 / 2;           // Initial duty cycle 50%
                    OC4RS = PR2 / 2;          // Secondary compare value
                    INITIALIZE_TIMER_2();
                    OC4CONbits.OCTSEL = 0;    // Use Timer2 as the time base
                    break;
                case OCX_TIMER_3:
                    // Configure Timer3
                    OC4R = PR3 / 2;           // Initial duty cycle 50%
                    OC4RS = PR3 / 2;          // Secondary compare value
                    INITIALIZE_TIMER_3();
                    OC4CONbits.OCTSEL = 1;    // Use Timer3 as the time base
                    break;
                default:
                    break;
            }
            // Configure interrupt for OC4
            IFS0bits.OC4IF = 0;
            IPC4bits.OC4IP = 7;
            IPC4bits.OC4IS = 3;
            IEC0bits.OC4IE = 1;
            OC4CONbits.OC32 = 0;
            OC4CONbits.OCSIDL = 0;
            OC4CONbits.ON = 1;
            break;
            
            
            
            
        case OC5_PIN:
            TRISDbits.TRISD4 = 0;
            // Configure OC5 for PWM mode
            OC5CON = 0x0;             // Disable OC5 and clear settings
            switch(MODE){
                case OCM_PWM_FAULT_ENABLED:
                    OC5CONbits.OCM = 0b111;   // PWM mode on OCx; Fault pin enabled
                    break;
                case OCM_PWM_FAULT_DISABLED:
                    OC5CONbits.OCM = 0b110;   // PWM mode on OCx; Fault pin disabled
                    break;
                case OCM_CONTINUOUS_PULSE:
                    OC5CONbits.OCM = 0b101;   // Initialize OCx pin low; generate continuous output pulses on OCx pin
                    break;
                case OCM_SINGLE_PULSE:
                    OC5CONbits.OCM = 0b100;   // Initialize OCx pin low; generate single output pulse on OCx pin
                    break;
                case OCM_TOGGLE:
                    OC5CONbits.OCM = 0b011;   // Compare event toggles OCx pin
                    break;
                case OCM_FORCE_LOW:
                    OC5CONbits.OCM = 0b010;   // Initialize OCx pin high; compare event forces OCx pin low
                    break;
                case OCM_FORCE_HIGH:
                    OC5CONbits.OCM = 0b001;   // Initialize OCx pin low; compare event forces OCx pin high
                    break;
                case OCM_DISABLED:
                    OC5CONbits.OCM = 0b000;   // Output compare peripheral is disabled but continues to draw current
                    break;
                default:
                    break;
            }
            switch(TIMER){
                case OCX_TIMER_2:
                    // Configure Timer2
                    OC5R = PR2 / 2;           // Initial duty cycle 50%
                    OC5RS = PR2 / 2;          // Secondary compare value
                    INITIALIZE_TIMER_2();
                    OC5CONbits.OCTSEL = 0;    // Use Timer2 as the time base
                    break;
                case OCX_TIMER_3:
                    // Configure Timer3
                    OC5R = PR3 / 2;           // Initial duty cycle 50%
                    OC5RS = PR3 / 2;          // Secondary compare value
                    INITIALIZE_TIMER_3();
                    OC5CONbits.OCTSEL = 1;    // Use Timer3 as the time base
                    break;
                default:
                    break;
            }
            // Configure interrupt for OC5
            IFS0bits.OC5IF = 0;
            IPC5bits.OC5IP = 7;
            IPC5bits.OC5IS = 3;
            IEC0bits.OC5IE = 1;
            OC5CONbits.OC32 = 0;
            OC5CONbits.OCSIDL = 0;
            OC5CONbits.ON = 1;
            break;
        default:
            break;
    }
}

void UpdateDutyCycle_OC1(int dutyCyclePercentage, int timer) {
    if (dutyCyclePercentage < 0 || dutyCyclePercentage > 100) {
        return; // Invalid percentage
    }
    if(timer == OCX_TIMER_2 ){
        OC1RS = (PR2 * dutyCyclePercentage) / 100;  // Update duty cycle
    }else{
        OC1RS = (PR3 * dutyCyclePercentage) / 100;  // Update duty cycle
        }
    
}

void UpdateDutyCycle_OC2(int dutyCyclePercentage, int timer) {
    if (dutyCyclePercentage < 0 || dutyCyclePercentage > 100) {
        return; // Invalid percentage
    }
    if(timer == OCX_TIMER_2){
        OC2RS = (PR2 * dutyCyclePercentage) / 100;  // Update duty cycle
    }else{
        OC2RS = (PR3 * dutyCyclePercentage) / 100;  // Update duty cycle
        }
    
}

void UpdateDutyCycle_OC3(int dutyCyclePercentage, int timer) {
    if (dutyCyclePercentage < 0 || dutyCyclePercentage > 100) {
        return; // Invalid percentage
    }
    if(timer  == OCX_TIMER_2 ){
        OC3RS = (PR2 * dutyCyclePercentage) / 100;  // Update duty cycle
    }else{
        OC3RS = (PR3 * dutyCyclePercentage) / 100;  // Update duty cycle
    }
    
}

void UpdateDutyCycle_OC4(int dutyCyclePercentage, int timer) {
    if (dutyCyclePercentage < 0 || dutyCyclePercentage > 100) {
        return; // Invalid percentage
    }
    if(timer == OCX_TIMER_2){
        OC4RS = (PR2 * dutyCyclePercentage) / 100;  // Update duty cycle
    }else{
        OC4RS = (PR3 * dutyCyclePercentage) / 100;  // Update duty cycle
        }
    
}

void UpdateDutyCycle_OC5(int dutyCyclePercentage, int timer) {
    if (dutyCyclePercentage < 0 || dutyCyclePercentage > 100) {
        return; // Invalid percentage
    }
    if(timer == OCX_TIMER_2){
        OC5RS = (PR2 * dutyCyclePercentage) / 100;  // Update duty cycle
    }else{
        OC5RS = (PR3 * dutyCyclePercentage) / 100;  // Update duty cycle
    }
    
}
// Function to adjust PWM frequency
void AdjustPWMFrequency(int timer, int frequencyHz) {
    if (frequencyHz <= 0) {
        return; // Invalid frequency
    }

    int prescalers[] = {1, 2, 4, 8, 16, 32, 64, 256}; // Available prescalers
    int prescalerIndex = 0;
    int prValue = 0;

    // Find the appropriate prescaler
    for (prescalerIndex = 0; prescalerIndex < 8; prescalerIndex++) {
        prValue = (PBCLK / (frequencyHz * prescalers[prescalerIndex])) - 1;
        if (prValue <= 0xFFFF) {
            break; // Prescaler found
        }
    }

    if (prValue > 0xFFFF) {
        return; // Frequency too low for the given PBCLK
    }

    if (timer == OCX_TIMER_2) {
        T2CONbits.TON = 0;               // Disable Timer2
        T2CONbits.TCKPS = prescalerIndex; // Set prescaler
        PR2 = prValue;                   // Set period value
        TMR2 = 0;                        // Reset Timer2 count
        T2CONbits.TON = 1;               // Enable Timer2
    } else if (timer == OCX_TIMER_3) {
        T3CONbits.TON = 0;               // Disable Timer3
        T3CONbits.TCKPS = prescalerIndex; // Set prescaler
        PR3 = prValue;                   // Set period value
        TMR3 = 0;                        // Reset Timer3 count
        T3CONbits.TON = 1;               // Enable Timer3
    }
}


// Output Compare 1 ISR
void __ISR(_OUTPUT_COMPARE_1_VECTOR, IPL7AUTO) OC1Handler(void) {
    
    IFS0bits.OC1IF = 0;
    // Add custom ISR code here if needed
}
void __ISR(_OUTPUT_COMPARE_2_VECTOR, IPL7AUTO) OC2Handler(void) {
    IFS0bits.OC2IF = 0;
    // Add custom ISR code here if needed
}
void __ISR(_OUTPUT_COMPARE_3_VECTOR, IPL7AUTO) OC3Handler(void) {
    IFS0bits.OC3IF = 0;
    // Add custom ISR code here if needed
}
void __ISR(_OUTPUT_COMPARE_4_VECTOR, IPL7AUTO) OC4Handler(void) {
    IFS0bits.OC4IF = 0;
    // Add custom ISR code here if needed
}
void __ISR(_OUTPUT_COMPARE_5_VECTOR, IPL7AUTO) OC5Handler(void) {
    IFS0bits.OC5IF = 0;
    // Add custom ISR code here if needed
}