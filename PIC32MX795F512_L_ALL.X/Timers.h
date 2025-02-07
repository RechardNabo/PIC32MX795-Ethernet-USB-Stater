#define LED_3_PIN           (TRISDbits.TRISD2)
#define LED_3_CONTROLLER    (LATDbits.LATD2)
// Function prototypes
void INITIALIZE_TIMER_1(void);
void INITIALIZE_TIMER_2(void);
void INITIALIZE_TIMER_3(void);
void INITIALIZE_TIMER_4(void);
void INITIALIZE_TIMER_5(void);
void __ISR(_TIMER_1_VECTOR, IPL7AUTO) Timer1Handler(void); // ISR for Timer1
void __ISR(_TIMER_2_VECTOR, IPL7AUTO) Timer2Handler(void); // ISR for Timer1
void __ISR(_TIMER_3_VECTOR, IPL7AUTO) Timer3Handler(void); // ISR for Timer1
void __ISR(_TIMER_4_VECTOR, IPL7AUTO) Timer4Handler(void); // ISR for Timer1
void __ISR(_TIMER_5_VECTOR, IPL7AUTO) Timer5Handler(void); // ISR for Timer1




// Initialize Timer1 to generate a 1-second delay (adjust prescaler and period if needed)
void INITIALIZE_TIMER_1(void) {
    // Stop Timer1 and reset control register
    T1CONbits.TCKPS0 = 0;
    T1CONbits.TCKPS1 = 0;
    T1CONbits.TGATE = 0;
    T1CONbits.TWIP = 0;
    T1CONbits.TWDIS = 0;
    T1CONbits.SIDL = 0;
    T1CONbits.ON = 0;
    
    
    // Set prescaler to 256 (T1CKPS = 3 for 1:256)
    T1CONbits.TCKPS0 = 1;
    T1CONbits.TCKPS1 = 1;
    
    PR1 = 0xFFFF;              // Set period register for 1-second interrupt (PR1 = Fcy / (Prescaler * Frequency))
    TMR1 = 0;                 // Clear Timer1 counter
    
    T1CONbits.TSYNC = 0;
    IFS0bits.T1IF = 0;        // Clear Timer1 interrupt flag
    IEC0bits.T1IE = 1;        // Enable Timer1 interrupt
    IPC1bits.T1IP = 7;        // Set Timer1 priority to 7 (highest priority)
    IPC1bits.T1IS = 3;
    T1CONbits.TCS = 0;
    T1CONbits.TGATE = 0;
    T1CONbits.TSYNC = 0;
    T1CONbits.TON = 1;        // Start Timer1
    INTCONbits.MVEC = 1;
    __builtin_enable_interrupts();
}

void INITIALIZE_TIMER_2(void){
    T2CONbits.TCS = 0;
    T2CONbits.T32 = 0;
    T2CONbits.TCKPS0 = 0;
    T2CONbits.TCKPS1 = 0;
    T2CONbits.TCKPS2 = 0;
    T2CONbits.TGATE = 0;
    T2CONbits.SIDL = 0;
    T2CONbits.TON = 0;

    T2CONbits.TCKPS0 = 0;
    T2CONbits.TCKPS1 = 0;
    T2CONbits.TCKPS2 = 0;
    
    PR2 = 0xFFFF;
    TMR2 = 0;
    
    IFS0bits.T2IF = 0;        // Clear Timer1 interrupt flag
    IEC0bits.T2IE = 1;        // Enable Timer1 interrupt
    IPC2bits.T2IP = 7;        // Set Timer1 priority to 7 (highest priority)
    IPC2bits.T2IS = 3;
    T2CONbits.TCS = 0;
    T2CONbits.TGATE = 0;
    T2CONbits.T32 = 0;
    T2CONbits.SIDL = 0;
    T2CONbits.TON = 1;
    INTCONbits.MVEC = 1;
    __builtin_enable_interrupts();
}

void INITIALIZE_TIMER_3(void){
    T3CONbits.TCS = 0;
    T3CONbits.TCKPS0 = 0;
    T3CONbits.TCKPS1 = 0;
    T3CONbits.TCKPS2 = 0;
    T3CONbits.TGATE = 0;
    T3CONbits.SIDL = 0;
    T3CONbits.TON = 0;
    
    PR3 = 0xFFFF;
    TMR3 = 0x0000;
    
    IFS0bits.T3IF = 0;        // Clear Timer1 interrupt flag
    IEC0bits.T3IE = 1;        // Enable Timer1 interrupt
    IPC3bits.T3IP = 7;        // Set Timer1 priority to 7 (highest priority)
    IPC3bits.T3IS = 3;
    
    T3CONbits.TCS = 0;
    T3CONbits.TCKPS0 = 0;
    T3CONbits.TCKPS1 = 0;
    T3CONbits.TCKPS2 = 0;
    T3CONbits.TGATE = 0;
    T3CONbits.SIDL = 0;
    T3CONbits.TON = 1;
    INTCONbits.MVEC = 1;
    __builtin_enable_interrupts();
}

void INITIALIZE_TIMER_4(void){
    T4CONbits.TCS = 0;
    T4CONbits.T32 = 0;
    T4CONbits.TCKPS0 = 0;
    T4CONbits.TCKPS1 = 0;
    T4CONbits.TCKPS2 = 0;
    T4CONbits.TGATE = 0;
    T4CONbits.SIDL = 0;
    T4CONbits.TON = 0;
    
    PR4 = 0xFFFF;
    TMR4 = 0x00000000;
    
    IFS0bits.T4IF = 0;        // Clear Timer1 interrupt flag
    IEC0bits.T4IE = 1;        // Enable Timer1 interrupt
    IPC4bits.T4IP = 7;        // Set Timer1 priority to 7 (highest priority)
    
    T4CONbits.TCS = 0;
    T4CONbits.T32 = 0;
    T4CONbits.TCKPS0 = 0;
    T4CONbits.TCKPS1 = 0;
    T4CONbits.TCKPS2 = 0;
    T4CONbits.TGATE = 0;
    T4CONbits.SIDL = 0;
    T4CONbits.TON = 1;
    INTCONbits.MVEC = 1;
    __builtin_enable_interrupts();
}

void INITIALIZE_TIMER_5(void){
    T5CONbits.TCS = 0;
    T5CONbits.TCKPS0 = 0;
    T5CONbits.TCKPS1 = 0;
    T5CONbits.TCKPS2 = 0;
    T5CONbits.TGATE = 0;
    T5CONbits.SIDL = 0;
    T5CONbits.ON = 0;
    
    PR5 = 0xFFFFFFFF;
    TMR5 = 0x00000000;
    
    IFS0bits.T5IF = 0;        // Clear Timer1 interrupt flag
    IEC0bits.T5IE = 1;        // Enable Timer1 interrupt
    IPC5bits.T5IP = 7;        // Set Timer1 priority to 7 (highest priority)
    
    T5CONbits.TCS = 0;
    T5CONbits.TCKPS0 = 0;
    T5CONbits.TCKPS1 = 0;
    T5CONbits.TCKPS2 = 0;
    T5CONbits.TGATE = 0;
    T5CONbits.SIDL = 0;
    T5CONbits.ON = 1;
    INTCONbits.MVEC = 1;
    __builtin_enable_interrupts();
}

// Timer1 Interrupt Service Routine (ISR)
void __ISR(_TIMER_1_VECTOR, IPL7AUTO) Timer1Handler(void) {

    IFS0bits.T1IF = 0;                // Clear Timer1 interrupt flag
    TMR1 = 0;
}

void __ISR(_TIMER_2_VECTOR, IPL7AUTO) Timer2Handler(void) {

    IFS0bits.T2IF = 0;
    TMR2 = 0;
}
void __ISR(_TIMER_3_VECTOR, IPL7AUTO) Timer3Handler(void) {

    IFS0bits.T3IF = 0;
    TMR3 = 0;
}
void __ISR(_TIMER_4_VECTOR, IPL7AUTO) Timer4Handler(void) {

        IFS0bits.T4IF = 0;
        TMR4 = 0;
}
void __ISR(_TIMER_5_VECTOR, IPL7AUTO) Timer5Handler(void) {

    IFS0bits.T5IF = 0;
    TMR5 = 0;
}