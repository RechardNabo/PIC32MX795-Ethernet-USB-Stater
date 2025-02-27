#define CAN1_TX_PIN TRISFbits.TRISF1
#define CAN1_RX_PIN TRISFbits.TRISF0

#define CAN2_TX_PIN TRISGbits.TRISG1
#define CAN2_RX_PIN TRISGbits.TRISG0


void CAN1_Initialize(){
    CAN1_RX_PIN = INPUT;
    CAN1_TX_PIN = OUTPUT;
    
    C1CONbits.ON = 0b0;
    C1CONbits.CANCAP = 0b0;
    C1CONbits.OPMOD = 0b000;
    C1CONbits.REQOP = 0b000;
    C1CONbits.ABAT = 0b0;
    C1CONbits.DNCNT = 0b0000;
    C1CONbits.SIDL = 0b0;
    
    C1CFGbits.BRP = 0b00000;
    C1CFGbits.SJW = 0b00;
    C1CFGbits.PRSEG = 0b000;
    C1CFGbits.SEG1PH = 0b000;
    C1CFGbits.SAM = 0b0;
    C1CFGbits.SEG2PHTS = 0b0;
    C1CFGbits.SEG2PH = 0b000;
    C1CFGbits.WAKFIL = 0b0;
    
    C1TMRbits.CANTSPRE = 0x00;
    C1TMRbits.CANTS = 0x00;
    
    C1RXM0bits.EID = 0;
    C1RXM0bits.MIDE = 0;
    C1RXM0bits.SID = 0;
    
    C1FLTCON0bits.FLTEN0 = 0;
    C1FLTCON0bits.FLTEN1 = 0;
    C1FLTCON0bits.FLTEN2 = 0;
    C1FLTCON0bits.FLTEN3 = 0;
    
    C1FLTCON1bits.FLTEN4 = 0;
    C1FLTCON1bits.FLTEN5 = 0;
    C1FLTCON1bits.FLTEN6 = 0;
    C1FLTCON1bits.FLTEN7 = 0;
    
    C1FLTCON2bits.FLTEN8 = 0;
    C1FLTCON2bits.FLTEN9 = 0;
    C1FLTCON2bits.FLTEN10 = 0;
    C1FLTCON2bits.FLTEN11 = 0;
    
    C1FLTCON3bits.FLTEN12 = 0;
    C1FLTCON3bits.FLTEN13 = 0;
    C1FLTCON3bits.FLTEN14 = 0;
    C1FLTCON3bits.FLTEN15 = 0;
    
    C1FLTCON4bits.FLTEN16 = 0;
    C1FLTCON4bits.FLTEN17 = 0;
    C1FLTCON4bits.FLTEN18 = 0;
    C1FLTCON4bits.FLTEN19 = 0;
    
    C1FLTCON5bits.FLTEN20 = 0;
    C1FLTCON5bits.FLTEN21 = 0;
    C1FLTCON5bits.FLTEN22 = 0;
    C1FLTCON5bits.FLTEN23 = 0;
    
    C1FLTCON6bits.FLTEN24 = 0;
    C1FLTCON6bits.FLTEN25 = 0;
    C1FLTCON6bits.FLTEN26 = 0;
    C1FLTCON6bits.FLTEN27 = 0;
    
    C1FLTCON7bits.FLTEN28 = 0;
    C1FLTCON7bits.FLTEN29 = 0;
    C1FLTCON7bits.FLTEN30 = 0;
    C1FLTCON7bits.FLTEN31 = 0;
    
    C1RXF0bits.EID = 0;
    C1RXF0bits.EXID = 0;
    C1RXF0bits.SID = 0;
    
    C1RXF10bits.EID = 0;
    C1RXF10bits.EXID = 0;
    C1RXF10bits.SID = 0;

    C1RXF11bits.EID = 0;
    C1RXF11bits.EXID = 0;
    C1RXF11bits.SID = 0;

    C1RXF12bits.EID = 0;
    C1RXF12bits.EXID = 0;
    C1RXF12bits.SID = 0;

    C1RXF13bits.EID = 0;
    C1RXF13bits.EXID = 0;
    C1RXF13bits.SID = 0;

    C1RXF14bits.EID = 0;
    C1RXF14bits.EXID = 0;
    C1RXF14bits.SID = 0;    
   
}

void CAN2_Initialize(){
    CAN2_RX_PIN = INPUT;
    CAN2_TX_PIN = OUTPUT;
    
    
}