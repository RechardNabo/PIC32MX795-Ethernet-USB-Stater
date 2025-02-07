
// Function prototypes
void RTCC_Init(void);
void RTCC_SetTime(uint32_t time, uint32_t date);
void RTCC_ReadTime(uint32_t *time, uint32_t *date);
void RTCC_SetAlarm(uint32_t alarmTime, uint32_t alarmDate);
void __ISR(_RTCC_VECTOR, IPL3SOFT) RTCCInterruptHandler(void);

void RTCC_Init(void) {
    // Enable writing to RTCC registers
    SYSKEY = 0xAA996655;  // Unlock sequence part 1
    SYSKEY = 0x556699AA;  // Unlock sequence part 2
    RTCCONbits.RTCOE = 1;
    RTCCONbits.HALFSEC = 0;
    RTCCONbits.RTCSYNC = 1;
    RTCCONbits.RTCWREN = 1;  // Enable RTCC write access
    // Disable RTCC
    RTCCONbits.ON = 0;
    while (RTCCONbits.RTCSYNC);  // Wait for clock to turn off

    // Configure external 32.768 kHz oscillator
    RTCCONbits.RTSECSEL = 1;  // Use (Internal Oscillator)
    
    // Configure idle mode behavior
    RTCCONbits.SIDL = 0;  // Continue operation in idle mode

    // Enable RTCC
    RTCCONbits.ON = 1;
    while (!RTCCONbits.RTCSYNC);  // Wait for clock to turn on

    // Disable write access to RTCC registers
    RTCCONbits.RTCWREN = 0;

    // Configure interrupts
    IPC8bits.RTCCIP = 3;  // Set interrupt priority
    IPC8bits.RTCCIS = 1;  // Set interrupt subpriority
    IFS1bits.RTCCIF = 0;  // Clear RTCC interrupt flag
    IEC1bits.RTCCIE = 1;  // Enable RTCC interrupt
}

void RTCC_SetTime(uint32_t time, uint32_t date) {
    SYSKEY = 0xAA996655;  // Unlock sequence part 1
    SYSKEY = 0x556699AA;  // Unlock sequence part 2
    RTCCONbits.RTCWREN = 1;  // Enable RTCC write access

    // Disable RTCC
    RTCCONbits.ON = 0;
    while (RTCCONbits.RTCSYNC);  // Wait for clock to turn off

    // Set time and date
    RTCTIME = time;
    RTCDATE = date;

    // Enable RTCC
    RTCCONbits.ON = 1;
    while (!RTCCONbits.RTCSYNC);  // Wait for clock to turn on

    // Disable write access to RTCC registers
    RTCCONbits.RTCWREN = 0;
}

void RTCC_ReadTime(uint32_t *time, uint32_t *date) {
    // Read current time and date
    *time = RTCTIME;
    *date = RTCDATE;
}

void RTCC_SetAlarm(uint32_t alarmTime, uint32_t alarmDate) {
    // Disable interrupts during configuration
    IEC1bits.RTCCIE = 0;

    // Configure the alarm
    while (RTCALRMbits.ALRMSYNC);  // Wait for alarm sync bit to clear

    RTCALRMbits.ALRMEN = 0;  // Disable alarm
    ALRMTIME = alarmTime;    // Set alarm time
    ALRMDATE = alarmDate;    // Set alarm date

    RTCALRMbits.AMASK = 0b0110;  // Set alarm mask to trigger daily
    RTCALRMbits.ALRMEN = 1;      // Enable alarm

    // Re-enable interrupts
    IEC1bits.RTCCIE = 1;
}

void __ISR(_RTCC_VECTOR, IPL3SOFT) RTCCInterruptHandler(void) {
    // Handle alarm interrupt
    IFS1bits.RTCCIF = 0;  // Clear RTCC interrupt flag
    printf("Alarm Triggered!\n");
}
