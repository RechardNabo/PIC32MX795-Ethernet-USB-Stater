# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"




# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\xc.h" 1 3
# 39 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\xc.h" 3
       
# 418 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\xc.h" 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\proc\\pic32mx\\p32mx795f512l.h" 1 3
# 39 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\proc\\pic32mx\\p32mx795f512l.h" 3
       





# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\stdint.h" 1 3 4
# 20 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\stdint.h" 3 4
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 1 3 4







# 7 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 3 4
typedef double _Double;
# 126 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 3 4
typedef unsigned int uintptr_t;
# 160 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 3 4
typedef int intptr_t;
# 185 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 3 4
typedef signed char int8_t;
# 199 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 3 4
typedef short int int16_t;
# 213 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 3 4
typedef int int32_t;
# 227 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 3 4
typedef long long int int64_t;
# 241 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 3 4
typedef long long int intmax_t;
# 255 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 3 4
typedef unsigned char uint8_t;
# 269 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 3 4
typedef short unsigned int uint16_t;
# 283 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 3 4
typedef unsigned int uint32_t;
# 297 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 3 4
typedef long long unsigned int uint64_t;
# 321 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 3 4
typedef long long unsigned int uintmax_t;
# 21 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\stdint.h" 2 3 4


typedef int int_fast8_t;





typedef long long int int_fast64_t;





typedef signed char int_least8_t;





typedef short int int_least16_t;





typedef int int_least32_t;





typedef long long int int_least64_t;





typedef unsigned int uint_fast8_t;





typedef long long unsigned int uint_fast64_t;





typedef unsigned char uint_least8_t;





typedef short unsigned int uint_least16_t;





typedef unsigned int uint_least32_t;





typedef long long unsigned int uint_least64_t;
# 331 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\stdint.h" 3 4
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\stdint.h" 1 3 4

typedef int int_fast16_t;





typedef int int_fast32_t;





typedef unsigned int uint_fast16_t;





typedef unsigned int uint_fast32_t;
# 332 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\stdint.h" 2 3 4
# 46 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\proc\\pic32mx\\p32mx795f512l.h" 2 3






extern volatile uint32_t WDTCON __attribute__((section("sfrs"), address(0xBF800000)));
typedef union {
  struct {
    uint32_t WDTCLR:1;
    uint32_t :1;
    uint32_t SWDTPS:5;
    uint32_t :8;
    uint32_t ON:1;
  };
  struct {
    uint32_t :2;
    uint32_t SWDTPS0:1;
    uint32_t SWDTPS1:1;
    uint32_t SWDTPS2:1;
    uint32_t SWDTPS3:1;
    uint32_t SWDTPS4:1;
  };
  struct {
    uint32_t :2;
    uint32_t WDTPSTA:5;
  };
  struct {
    uint32_t :2;
    uint32_t WDTPS:5;
  };
  struct {
    uint32_t w:32;
  };
} __WDTCONbits_t;
extern volatile __WDTCONbits_t WDTCONbits __asm__ ("WDTCON") __attribute__((section("sfrs"), address(0xBF800000)));
extern volatile uint32_t WDTCONCLR __attribute__((section("sfrs"),address(0xBF800004)));
extern volatile uint32_t WDTCONSET __attribute__((section("sfrs"),address(0xBF800008)));
extern volatile uint32_t WDTCONINV __attribute__((section("sfrs"),address(0xBF80000C)));

extern volatile uint32_t RTCCON __attribute__((section("sfrs"), address(0xBF800200)));
typedef union {
  struct {
    uint32_t RTCOE:1;
    uint32_t HALFSEC:1;
    uint32_t RTCSYNC:1;
    uint32_t RTCWREN:1;
    uint32_t :2;
    uint32_t RTCCLKON:1;
    uint32_t RTSECSEL:1;
    uint32_t :5;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
    uint32_t CAL:10;
  };
  struct {
    uint32_t w:32;
  };
} __RTCCONbits_t;
extern volatile __RTCCONbits_t RTCCONbits __asm__ ("RTCCON") __attribute__((section("sfrs"), address(0xBF800200)));
extern volatile uint32_t RTCCONCLR __attribute__((section("sfrs"),address(0xBF800204)));
extern volatile uint32_t RTCCONSET __attribute__((section("sfrs"),address(0xBF800208)));
extern volatile uint32_t RTCCONINV __attribute__((section("sfrs"),address(0xBF80020C)));

extern volatile uint32_t RTCALRM __attribute__((section("sfrs"), address(0xBF800210)));
typedef union {
  struct {
    uint32_t ARPT:8;
    uint32_t AMASK:4;
    uint32_t ALRMSYNC:1;
    uint32_t PIV:1;
    uint32_t CHIME:1;
    uint32_t ALRMEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __RTCALRMbits_t;
extern volatile __RTCALRMbits_t RTCALRMbits __asm__ ("RTCALRM") __attribute__((section("sfrs"), address(0xBF800210)));
extern volatile uint32_t RTCALRMCLR __attribute__((section("sfrs"),address(0xBF800214)));
extern volatile uint32_t RTCALRMSET __attribute__((section("sfrs"),address(0xBF800218)));
extern volatile uint32_t RTCALRMINV __attribute__((section("sfrs"),address(0xBF80021C)));

extern volatile uint32_t RTCTIME __attribute__((section("sfrs"), address(0xBF800220)));
typedef union {
  struct {
    uint32_t :8;
    uint32_t SEC01:4;
    uint32_t SEC10:4;
    uint32_t MIN01:4;
    uint32_t MIN10:4;
    uint32_t HR01:4;
    uint32_t HR10:4;
  };
  struct {
    uint32_t w:32;
  };
} __RTCTIMEbits_t;
extern volatile __RTCTIMEbits_t RTCTIMEbits __asm__ ("RTCTIME") __attribute__((section("sfrs"), address(0xBF800220)));
extern volatile uint32_t RTCTIMECLR __attribute__((section("sfrs"),address(0xBF800224)));
extern volatile uint32_t RTCTIMESET __attribute__((section("sfrs"),address(0xBF800228)));
extern volatile uint32_t RTCTIMEINV __attribute__((section("sfrs"),address(0xBF80022C)));

extern volatile uint32_t RTCDATE __attribute__((section("sfrs"), address(0xBF800230)));
typedef union {
  struct {
    uint32_t WDAY01:4;
    uint32_t :4;
    uint32_t DAY01:4;
    uint32_t DAY10:4;
    uint32_t MONTH01:4;
    uint32_t MONTH10:4;
    uint32_t YEAR01:4;
    uint32_t YEAR10:4;
  };
  struct {
    uint32_t w:32;
  };
} __RTCDATEbits_t;
extern volatile __RTCDATEbits_t RTCDATEbits __asm__ ("RTCDATE") __attribute__((section("sfrs"), address(0xBF800230)));
extern volatile uint32_t RTCDATECLR __attribute__((section("sfrs"),address(0xBF800234)));
extern volatile uint32_t RTCDATESET __attribute__((section("sfrs"),address(0xBF800238)));
extern volatile uint32_t RTCDATEINV __attribute__((section("sfrs"),address(0xBF80023C)));

extern volatile uint32_t ALRMTIME __attribute__((section("sfrs"), address(0xBF800240)));
typedef union {
  struct {
    uint32_t :8;
    uint32_t SEC01:4;
    uint32_t SEC10:4;
    uint32_t MIN01:4;
    uint32_t MIN10:4;
    uint32_t HR01:4;
    uint32_t HR10:4;
  };
  struct {
    uint32_t w:32;
  };
} __ALRMTIMEbits_t;
extern volatile __ALRMTIMEbits_t ALRMTIMEbits __asm__ ("ALRMTIME") __attribute__((section("sfrs"), address(0xBF800240)));
extern volatile uint32_t ALRMTIMECLR __attribute__((section("sfrs"),address(0xBF800244)));
extern volatile uint32_t ALRMTIMESET __attribute__((section("sfrs"),address(0xBF800248)));
extern volatile uint32_t ALRMTIMEINV __attribute__((section("sfrs"),address(0xBF80024C)));

extern volatile uint32_t ALRMDATE __attribute__((section("sfrs"), address(0xBF800250)));
typedef union {
  struct {
    uint32_t WDAY01:4;
    uint32_t :4;
    uint32_t DAY01:4;
    uint32_t DAY10:4;
    uint32_t MONTH01:4;
    uint32_t MONTH10:4;
  };
  struct {
    uint32_t w:32;
  };
} __ALRMDATEbits_t;
extern volatile __ALRMDATEbits_t ALRMDATEbits __asm__ ("ALRMDATE") __attribute__((section("sfrs"), address(0xBF800250)));
extern volatile uint32_t ALRMDATECLR __attribute__((section("sfrs"),address(0xBF800254)));
extern volatile uint32_t ALRMDATESET __attribute__((section("sfrs"),address(0xBF800258)));
extern volatile uint32_t ALRMDATEINV __attribute__((section("sfrs"),address(0xBF80025C)));

extern volatile uint32_t T1CON __attribute__((section("sfrs"), address(0xBF800600)));
typedef union {
  struct {
    uint32_t :1;
    uint32_t TCS:1;
    uint32_t TSYNC:1;
    uint32_t :1;
    uint32_t TCKPS:2;
    uint32_t :1;
    uint32_t TGATE:1;
    uint32_t :3;
    uint32_t TWIP:1;
    uint32_t TWDIS:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :4;
    uint32_t TCKPS0:1;
    uint32_t TCKPS1:1;
  };
  struct {
    uint32_t :13;
    uint32_t TSIDL:1;
    uint32_t :1;
    uint32_t TON:1;
  };
  struct {
    uint32_t w:32;
  };
} __T1CONbits_t;
extern volatile __T1CONbits_t T1CONbits __asm__ ("T1CON") __attribute__((section("sfrs"), address(0xBF800600)));
extern volatile uint32_t T1CONCLR __attribute__((section("sfrs"),address(0xBF800604)));
extern volatile uint32_t T1CONSET __attribute__((section("sfrs"),address(0xBF800608)));
extern volatile uint32_t T1CONINV __attribute__((section("sfrs"),address(0xBF80060C)));

extern volatile uint32_t TMR1 __attribute__((section("sfrs"), address(0xBF800610)));
extern volatile uint32_t TMR1CLR __attribute__((section("sfrs"),address(0xBF800614)));
extern volatile uint32_t TMR1SET __attribute__((section("sfrs"),address(0xBF800618)));
extern volatile uint32_t TMR1INV __attribute__((section("sfrs"),address(0xBF80061C)));

extern volatile uint32_t PR1 __attribute__((section("sfrs"), address(0xBF800620)));
extern volatile uint32_t PR1CLR __attribute__((section("sfrs"),address(0xBF800624)));
extern volatile uint32_t PR1SET __attribute__((section("sfrs"),address(0xBF800628)));
extern volatile uint32_t PR1INV __attribute__((section("sfrs"),address(0xBF80062C)));

extern volatile uint32_t T2CON __attribute__((section("sfrs"), address(0xBF800800)));
typedef union {
  struct {
    uint32_t :1;
    uint32_t TCS:1;
    uint32_t :1;
    uint32_t T32:1;
    uint32_t TCKPS:3;
    uint32_t TGATE:1;
    uint32_t :5;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :4;
    uint32_t TCKPS0:1;
    uint32_t TCKPS1:1;
    uint32_t TCKPS2:1;
  };
  struct {
    uint32_t :13;
    uint32_t TSIDL:1;
    uint32_t :1;
    uint32_t TON:1;
  };
  struct {
    uint32_t w:32;
  };
} __T2CONbits_t;
extern volatile __T2CONbits_t T2CONbits __asm__ ("T2CON") __attribute__((section("sfrs"), address(0xBF800800)));
extern volatile uint32_t T2CONCLR __attribute__((section("sfrs"),address(0xBF800804)));
extern volatile uint32_t T2CONSET __attribute__((section("sfrs"),address(0xBF800808)));
extern volatile uint32_t T2CONINV __attribute__((section("sfrs"),address(0xBF80080C)));

extern volatile uint32_t TMR2 __attribute__((section("sfrs"), address(0xBF800810)));
extern volatile uint32_t TMR2CLR __attribute__((section("sfrs"),address(0xBF800814)));
extern volatile uint32_t TMR2SET __attribute__((section("sfrs"),address(0xBF800818)));
extern volatile uint32_t TMR2INV __attribute__((section("sfrs"),address(0xBF80081C)));

extern volatile uint32_t PR2 __attribute__((section("sfrs"), address(0xBF800820)));
extern volatile uint32_t PR2CLR __attribute__((section("sfrs"),address(0xBF800824)));
extern volatile uint32_t PR2SET __attribute__((section("sfrs"),address(0xBF800828)));
extern volatile uint32_t PR2INV __attribute__((section("sfrs"),address(0xBF80082C)));

extern volatile uint32_t T3CON __attribute__((section("sfrs"), address(0xBF800A00)));
typedef union {
  struct {
    uint32_t :1;
    uint32_t TCS:1;
    uint32_t :2;
    uint32_t TCKPS:3;
    uint32_t TGATE:1;
    uint32_t :5;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :4;
    uint32_t TCKPS0:1;
    uint32_t TCKPS1:1;
    uint32_t TCKPS2:1;
  };
  struct {
    uint32_t :13;
    uint32_t TSIDL:1;
    uint32_t :1;
    uint32_t TON:1;
  };
  struct {
    uint32_t w:32;
  };
} __T3CONbits_t;
extern volatile __T3CONbits_t T3CONbits __asm__ ("T3CON") __attribute__((section("sfrs"), address(0xBF800A00)));
extern volatile uint32_t T3CONCLR __attribute__((section("sfrs"),address(0xBF800A04)));
extern volatile uint32_t T3CONSET __attribute__((section("sfrs"),address(0xBF800A08)));
extern volatile uint32_t T3CONINV __attribute__((section("sfrs"),address(0xBF800A0C)));

extern volatile uint32_t TMR3 __attribute__((section("sfrs"), address(0xBF800A10)));
extern volatile uint32_t TMR3CLR __attribute__((section("sfrs"),address(0xBF800A14)));
extern volatile uint32_t TMR3SET __attribute__((section("sfrs"),address(0xBF800A18)));
extern volatile uint32_t TMR3INV __attribute__((section("sfrs"),address(0xBF800A1C)));

extern volatile uint32_t PR3 __attribute__((section("sfrs"), address(0xBF800A20)));
extern volatile uint32_t PR3CLR __attribute__((section("sfrs"),address(0xBF800A24)));
extern volatile uint32_t PR3SET __attribute__((section("sfrs"),address(0xBF800A28)));
extern volatile uint32_t PR3INV __attribute__((section("sfrs"),address(0xBF800A2C)));

extern volatile uint32_t T4CON __attribute__((section("sfrs"), address(0xBF800C00)));
typedef union {
  struct {
    uint32_t :1;
    uint32_t TCS:1;
    uint32_t :1;
    uint32_t T32:1;
    uint32_t TCKPS:3;
    uint32_t TGATE:1;
    uint32_t :5;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :4;
    uint32_t TCKPS0:1;
    uint32_t TCKPS1:1;
    uint32_t TCKPS2:1;
  };
  struct {
    uint32_t :13;
    uint32_t TSIDL:1;
    uint32_t :1;
    uint32_t TON:1;
  };
  struct {
    uint32_t w:32;
  };
} __T4CONbits_t;
extern volatile __T4CONbits_t T4CONbits __asm__ ("T4CON") __attribute__((section("sfrs"), address(0xBF800C00)));
extern volatile uint32_t T4CONCLR __attribute__((section("sfrs"),address(0xBF800C04)));
extern volatile uint32_t T4CONSET __attribute__((section("sfrs"),address(0xBF800C08)));
extern volatile uint32_t T4CONINV __attribute__((section("sfrs"),address(0xBF800C0C)));

extern volatile uint32_t TMR4 __attribute__((section("sfrs"), address(0xBF800C10)));
extern volatile uint32_t TMR4CLR __attribute__((section("sfrs"),address(0xBF800C14)));
extern volatile uint32_t TMR4SET __attribute__((section("sfrs"),address(0xBF800C18)));
extern volatile uint32_t TMR4INV __attribute__((section("sfrs"),address(0xBF800C1C)));

extern volatile uint32_t PR4 __attribute__((section("sfrs"), address(0xBF800C20)));
extern volatile uint32_t PR4CLR __attribute__((section("sfrs"),address(0xBF800C24)));
extern volatile uint32_t PR4SET __attribute__((section("sfrs"),address(0xBF800C28)));
extern volatile uint32_t PR4INV __attribute__((section("sfrs"),address(0xBF800C2C)));

extern volatile uint32_t T5CON __attribute__((section("sfrs"), address(0xBF800E00)));
typedef union {
  struct {
    uint32_t :1;
    uint32_t TCS:1;
    uint32_t :2;
    uint32_t TCKPS:3;
    uint32_t TGATE:1;
    uint32_t :5;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :4;
    uint32_t TCKPS0:1;
    uint32_t TCKPS1:1;
    uint32_t TCKPS2:1;
  };
  struct {
    uint32_t :13;
    uint32_t TSIDL:1;
    uint32_t :1;
    uint32_t TON:1;
  };
  struct {
    uint32_t w:32;
  };
} __T5CONbits_t;
extern volatile __T5CONbits_t T5CONbits __asm__ ("T5CON") __attribute__((section("sfrs"), address(0xBF800E00)));
extern volatile uint32_t T5CONCLR __attribute__((section("sfrs"),address(0xBF800E04)));
extern volatile uint32_t T5CONSET __attribute__((section("sfrs"),address(0xBF800E08)));
extern volatile uint32_t T5CONINV __attribute__((section("sfrs"),address(0xBF800E0C)));

extern volatile uint32_t TMR5 __attribute__((section("sfrs"), address(0xBF800E10)));
extern volatile uint32_t TMR5CLR __attribute__((section("sfrs"),address(0xBF800E14)));
extern volatile uint32_t TMR5SET __attribute__((section("sfrs"),address(0xBF800E18)));
extern volatile uint32_t TMR5INV __attribute__((section("sfrs"),address(0xBF800E1C)));

extern volatile uint32_t PR5 __attribute__((section("sfrs"), address(0xBF800E20)));
extern volatile uint32_t PR5CLR __attribute__((section("sfrs"),address(0xBF800E24)));
extern volatile uint32_t PR5SET __attribute__((section("sfrs"),address(0xBF800E28)));
extern volatile uint32_t PR5INV __attribute__((section("sfrs"),address(0xBF800E2C)));

extern volatile uint32_t IC1CON __attribute__((section("sfrs"), address(0xBF802000)));
typedef union {
  struct {
    uint32_t ICM:3;
    uint32_t ICBNE:1;
    uint32_t ICOV:1;
    uint32_t ICI:2;
    uint32_t ICTMR:1;
    uint32_t C32:1;
    uint32_t FEDGE:1;
    uint32_t :3;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t ICM0:1;
    uint32_t ICM1:1;
    uint32_t ICM2:1;
    uint32_t :2;
    uint32_t ICI0:1;
    uint32_t ICI1:1;
  };
  struct {
    uint32_t :13;
    uint32_t ICSIDL:1;
  };
  struct {
    uint32_t w:32;
  };
} __IC1CONbits_t;
extern volatile __IC1CONbits_t IC1CONbits __asm__ ("IC1CON") __attribute__((section("sfrs"), address(0xBF802000)));
extern volatile uint32_t IC1CONCLR __attribute__((section("sfrs"),address(0xBF802004)));
extern volatile uint32_t IC1CONSET __attribute__((section("sfrs"),address(0xBF802008)));
extern volatile uint32_t IC1CONINV __attribute__((section("sfrs"),address(0xBF80200C)));

extern volatile uint32_t IC1BUF __attribute__((section("sfrs"), address(0xBF802010)));

extern volatile uint32_t IC2CON __attribute__((section("sfrs"), address(0xBF802200)));
typedef union {
  struct {
    uint32_t ICM:3;
    uint32_t ICBNE:1;
    uint32_t ICOV:1;
    uint32_t ICI:2;
    uint32_t ICTMR:1;
    uint32_t C32:1;
    uint32_t FEDGE:1;
    uint32_t :3;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t ICM0:1;
    uint32_t ICM1:1;
    uint32_t ICM2:1;
    uint32_t :2;
    uint32_t ICI0:1;
    uint32_t ICI1:1;
  };
  struct {
    uint32_t :13;
    uint32_t ICSIDL:1;
  };
  struct {
    uint32_t w:32;
  };
} __IC2CONbits_t;
extern volatile __IC2CONbits_t IC2CONbits __asm__ ("IC2CON") __attribute__((section("sfrs"), address(0xBF802200)));
extern volatile uint32_t IC2CONCLR __attribute__((section("sfrs"),address(0xBF802204)));
extern volatile uint32_t IC2CONSET __attribute__((section("sfrs"),address(0xBF802208)));
extern volatile uint32_t IC2CONINV __attribute__((section("sfrs"),address(0xBF80220C)));

extern volatile uint32_t IC2BUF __attribute__((section("sfrs"), address(0xBF802210)));

extern volatile uint32_t IC3CON __attribute__((section("sfrs"), address(0xBF802400)));
typedef union {
  struct {
    uint32_t ICM:3;
    uint32_t ICBNE:1;
    uint32_t ICOV:1;
    uint32_t ICI:2;
    uint32_t ICTMR:1;
    uint32_t C32:1;
    uint32_t FEDGE:1;
    uint32_t :3;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t ICM0:1;
    uint32_t ICM1:1;
    uint32_t ICM2:1;
    uint32_t :2;
    uint32_t ICI0:1;
    uint32_t ICI1:1;
  };
  struct {
    uint32_t :13;
    uint32_t ICSIDL:1;
  };
  struct {
    uint32_t w:32;
  };
} __IC3CONbits_t;
extern volatile __IC3CONbits_t IC3CONbits __asm__ ("IC3CON") __attribute__((section("sfrs"), address(0xBF802400)));
extern volatile uint32_t IC3CONCLR __attribute__((section("sfrs"),address(0xBF802404)));
extern volatile uint32_t IC3CONSET __attribute__((section("sfrs"),address(0xBF802408)));
extern volatile uint32_t IC3CONINV __attribute__((section("sfrs"),address(0xBF80240C)));

extern volatile uint32_t IC3BUF __attribute__((section("sfrs"), address(0xBF802410)));

extern volatile uint32_t IC4CON __attribute__((section("sfrs"), address(0xBF802600)));
typedef union {
  struct {
    uint32_t ICM:3;
    uint32_t ICBNE:1;
    uint32_t ICOV:1;
    uint32_t ICI:2;
    uint32_t ICTMR:1;
    uint32_t C32:1;
    uint32_t FEDGE:1;
    uint32_t :3;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t ICM0:1;
    uint32_t ICM1:1;
    uint32_t ICM2:1;
    uint32_t :2;
    uint32_t ICI0:1;
    uint32_t ICI1:1;
  };
  struct {
    uint32_t :13;
    uint32_t ICSIDL:1;
  };
  struct {
    uint32_t w:32;
  };
} __IC4CONbits_t;
extern volatile __IC4CONbits_t IC4CONbits __asm__ ("IC4CON") __attribute__((section("sfrs"), address(0xBF802600)));
extern volatile uint32_t IC4CONCLR __attribute__((section("sfrs"),address(0xBF802604)));
extern volatile uint32_t IC4CONSET __attribute__((section("sfrs"),address(0xBF802608)));
extern volatile uint32_t IC4CONINV __attribute__((section("sfrs"),address(0xBF80260C)));

extern volatile uint32_t IC4BUF __attribute__((section("sfrs"), address(0xBF802610)));

extern volatile uint32_t IC5CON __attribute__((section("sfrs"), address(0xBF802800)));
typedef union {
  struct {
    uint32_t ICM:3;
    uint32_t ICBNE:1;
    uint32_t ICOV:1;
    uint32_t ICI:2;
    uint32_t ICTMR:1;
    uint32_t C32:1;
    uint32_t FEDGE:1;
    uint32_t :3;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t ICM0:1;
    uint32_t ICM1:1;
    uint32_t ICM2:1;
    uint32_t :2;
    uint32_t ICI0:1;
    uint32_t ICI1:1;
  };
  struct {
    uint32_t :13;
    uint32_t ICSIDL:1;
  };
  struct {
    uint32_t w:32;
  };
} __IC5CONbits_t;
extern volatile __IC5CONbits_t IC5CONbits __asm__ ("IC5CON") __attribute__((section("sfrs"), address(0xBF802800)));
extern volatile uint32_t IC5CONCLR __attribute__((section("sfrs"),address(0xBF802804)));
extern volatile uint32_t IC5CONSET __attribute__((section("sfrs"),address(0xBF802808)));
extern volatile uint32_t IC5CONINV __attribute__((section("sfrs"),address(0xBF80280C)));

extern volatile uint32_t IC5BUF __attribute__((section("sfrs"), address(0xBF802810)));

extern volatile uint32_t OC1CON __attribute__((section("sfrs"), address(0xBF803000)));
typedef union {
  struct {
    uint32_t OCM:3;
    uint32_t OCTSEL:1;
    uint32_t OCFLT:1;
    uint32_t OC32:1;
    uint32_t :7;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t OCM0:1;
    uint32_t OCM1:1;
    uint32_t OCM2:1;
  };
  struct {
    uint32_t :13;
    uint32_t OCSIDL:1;
  };
  struct {
    uint32_t w:32;
  };
} __OC1CONbits_t;
extern volatile __OC1CONbits_t OC1CONbits __asm__ ("OC1CON") __attribute__((section("sfrs"), address(0xBF803000)));
extern volatile uint32_t OC1CONCLR __attribute__((section("sfrs"),address(0xBF803004)));
extern volatile uint32_t OC1CONSET __attribute__((section("sfrs"),address(0xBF803008)));
extern volatile uint32_t OC1CONINV __attribute__((section("sfrs"),address(0xBF80300C)));

extern volatile uint32_t OC1R __attribute__((section("sfrs"), address(0xBF803010)));
extern volatile uint32_t OC1RCLR __attribute__((section("sfrs"),address(0xBF803014)));
extern volatile uint32_t OC1RSET __attribute__((section("sfrs"),address(0xBF803018)));
extern volatile uint32_t OC1RINV __attribute__((section("sfrs"),address(0xBF80301C)));

extern volatile uint32_t OC1RS __attribute__((section("sfrs"), address(0xBF803020)));
extern volatile uint32_t OC1RSCLR __attribute__((section("sfrs"),address(0xBF803024)));
extern volatile uint32_t OC1RSSET __attribute__((section("sfrs"),address(0xBF803028)));
extern volatile uint32_t OC1RSINV __attribute__((section("sfrs"),address(0xBF80302C)));

extern volatile uint32_t OC2CON __attribute__((section("sfrs"), address(0xBF803200)));
typedef union {
  struct {
    uint32_t OCM:3;
    uint32_t OCTSEL:1;
    uint32_t OCFLT:1;
    uint32_t OC32:1;
    uint32_t :7;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t OCM0:1;
    uint32_t OCM1:1;
    uint32_t OCM2:1;
  };
  struct {
    uint32_t :13;
    uint32_t OCSIDL:1;
  };
  struct {
    uint32_t w:32;
  };
} __OC2CONbits_t;
extern volatile __OC2CONbits_t OC2CONbits __asm__ ("OC2CON") __attribute__((section("sfrs"), address(0xBF803200)));
extern volatile uint32_t OC2CONCLR __attribute__((section("sfrs"),address(0xBF803204)));
extern volatile uint32_t OC2CONSET __attribute__((section("sfrs"),address(0xBF803208)));
extern volatile uint32_t OC2CONINV __attribute__((section("sfrs"),address(0xBF80320C)));

extern volatile uint32_t OC2R __attribute__((section("sfrs"), address(0xBF803210)));
extern volatile uint32_t OC2RCLR __attribute__((section("sfrs"),address(0xBF803214)));
extern volatile uint32_t OC2RSET __attribute__((section("sfrs"),address(0xBF803218)));
extern volatile uint32_t OC2RINV __attribute__((section("sfrs"),address(0xBF80321C)));

extern volatile uint32_t OC2RS __attribute__((section("sfrs"), address(0xBF803220)));
extern volatile uint32_t OC2RSCLR __attribute__((section("sfrs"),address(0xBF803224)));
extern volatile uint32_t OC2RSSET __attribute__((section("sfrs"),address(0xBF803228)));
extern volatile uint32_t OC2RSINV __attribute__((section("sfrs"),address(0xBF80322C)));

extern volatile uint32_t OC3CON __attribute__((section("sfrs"), address(0xBF803400)));
typedef union {
  struct {
    uint32_t OCM:3;
    uint32_t OCTSEL:1;
    uint32_t OCFLT:1;
    uint32_t OC32:1;
    uint32_t :7;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t OCM0:1;
    uint32_t OCM1:1;
    uint32_t OCM2:1;
  };
  struct {
    uint32_t :13;
    uint32_t OCSIDL:1;
  };
  struct {
    uint32_t w:32;
  };
} __OC3CONbits_t;
extern volatile __OC3CONbits_t OC3CONbits __asm__ ("OC3CON") __attribute__((section("sfrs"), address(0xBF803400)));
extern volatile uint32_t OC3CONCLR __attribute__((section("sfrs"),address(0xBF803404)));
extern volatile uint32_t OC3CONSET __attribute__((section("sfrs"),address(0xBF803408)));
extern volatile uint32_t OC3CONINV __attribute__((section("sfrs"),address(0xBF80340C)));

extern volatile uint32_t OC3R __attribute__((section("sfrs"), address(0xBF803410)));
extern volatile uint32_t OC3RCLR __attribute__((section("sfrs"),address(0xBF803414)));
extern volatile uint32_t OC3RSET __attribute__((section("sfrs"),address(0xBF803418)));
extern volatile uint32_t OC3RINV __attribute__((section("sfrs"),address(0xBF80341C)));

extern volatile uint32_t OC3RS __attribute__((section("sfrs"), address(0xBF803420)));
extern volatile uint32_t OC3RSCLR __attribute__((section("sfrs"),address(0xBF803424)));
extern volatile uint32_t OC3RSSET __attribute__((section("sfrs"),address(0xBF803428)));
extern volatile uint32_t OC3RSINV __attribute__((section("sfrs"),address(0xBF80342C)));

extern volatile uint32_t OC4CON __attribute__((section("sfrs"), address(0xBF803600)));
typedef union {
  struct {
    uint32_t OCM:3;
    uint32_t OCTSEL:1;
    uint32_t OCFLT:1;
    uint32_t OC32:1;
    uint32_t :7;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t OCM0:1;
    uint32_t OCM1:1;
    uint32_t OCM2:1;
  };
  struct {
    uint32_t :13;
    uint32_t OCSIDL:1;
  };
  struct {
    uint32_t w:32;
  };
} __OC4CONbits_t;
extern volatile __OC4CONbits_t OC4CONbits __asm__ ("OC4CON") __attribute__((section("sfrs"), address(0xBF803600)));
extern volatile uint32_t OC4CONCLR __attribute__((section("sfrs"),address(0xBF803604)));
extern volatile uint32_t OC4CONSET __attribute__((section("sfrs"),address(0xBF803608)));
extern volatile uint32_t OC4CONINV __attribute__((section("sfrs"),address(0xBF80360C)));

extern volatile uint32_t OC4R __attribute__((section("sfrs"), address(0xBF803610)));
extern volatile uint32_t OC4RCLR __attribute__((section("sfrs"),address(0xBF803614)));
extern volatile uint32_t OC4RSET __attribute__((section("sfrs"),address(0xBF803618)));
extern volatile uint32_t OC4RINV __attribute__((section("sfrs"),address(0xBF80361C)));

extern volatile uint32_t OC4RS __attribute__((section("sfrs"), address(0xBF803620)));
extern volatile uint32_t OC4RSCLR __attribute__((section("sfrs"),address(0xBF803624)));
extern volatile uint32_t OC4RSSET __attribute__((section("sfrs"),address(0xBF803628)));
extern volatile uint32_t OC4RSINV __attribute__((section("sfrs"),address(0xBF80362C)));

extern volatile uint32_t OC5CON __attribute__((section("sfrs"), address(0xBF803800)));
typedef union {
  struct {
    uint32_t OCM:3;
    uint32_t OCTSEL:1;
    uint32_t OCFLT:1;
    uint32_t OC32:1;
    uint32_t :7;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t OCM0:1;
    uint32_t OCM1:1;
    uint32_t OCM2:1;
  };
  struct {
    uint32_t :13;
    uint32_t OCSIDL:1;
  };
  struct {
    uint32_t w:32;
  };
} __OC5CONbits_t;
extern volatile __OC5CONbits_t OC5CONbits __asm__ ("OC5CON") __attribute__((section("sfrs"), address(0xBF803800)));
extern volatile uint32_t OC5CONCLR __attribute__((section("sfrs"),address(0xBF803804)));
extern volatile uint32_t OC5CONSET __attribute__((section("sfrs"),address(0xBF803808)));
extern volatile uint32_t OC5CONINV __attribute__((section("sfrs"),address(0xBF80380C)));

extern volatile uint32_t OC5R __attribute__((section("sfrs"), address(0xBF803810)));
extern volatile uint32_t OC5RCLR __attribute__((section("sfrs"),address(0xBF803814)));
extern volatile uint32_t OC5RSET __attribute__((section("sfrs"),address(0xBF803818)));
extern volatile uint32_t OC5RINV __attribute__((section("sfrs"),address(0xBF80381C)));

extern volatile uint32_t OC5RS __attribute__((section("sfrs"), address(0xBF803820)));
extern volatile uint32_t OC5RSCLR __attribute__((section("sfrs"),address(0xBF803824)));
extern volatile uint32_t OC5RSSET __attribute__((section("sfrs"),address(0xBF803828)));
extern volatile uint32_t OC5RSINV __attribute__((section("sfrs"),address(0xBF80382C)));

extern volatile uint32_t I2C1ACON __attribute__((section("sfrs"), address(0xBF805000)));
typedef union {
  struct {
    uint32_t SEN:1;
    uint32_t RSEN:1;
    uint32_t PEN:1;
    uint32_t RCEN:1;
    uint32_t ACKEN:1;
    uint32_t ACKDT:1;
    uint32_t STREN:1;
    uint32_t GCEN:1;
    uint32_t SMEN:1;
    uint32_t DISSLW:1;
    uint32_t A10M:1;
    uint32_t STRICT:1;
    uint32_t SCLREL:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :11;
    uint32_t IPMIEN:1;
    uint32_t :1;
    uint32_t I2CSIDL:1;
    uint32_t :1;
    uint32_t I2CEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __I2C1ACONbits_t;
extern volatile __I2C1ACONbits_t I2C1ACONbits __asm__ ("I2C1ACON") __attribute__((section("sfrs"), address(0xBF805000)));

extern volatile uint32_t I2C3CON __attribute__((section("sfrs"), address(0xBF805000)));
typedef union {
  struct {
    uint32_t SEN:1;
    uint32_t RSEN:1;
    uint32_t PEN:1;
    uint32_t RCEN:1;
    uint32_t ACKEN:1;
    uint32_t ACKDT:1;
    uint32_t STREN:1;
    uint32_t GCEN:1;
    uint32_t SMEN:1;
    uint32_t DISSLW:1;
    uint32_t A10M:1;
    uint32_t STRICT:1;
    uint32_t SCLREL:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :11;
    uint32_t IPMIEN:1;
    uint32_t :1;
    uint32_t I2CSIDL:1;
    uint32_t :1;
    uint32_t I2CEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __I2C3CONbits_t;
extern volatile __I2C3CONbits_t I2C3CONbits __asm__ ("I2C3CON") __attribute__((section("sfrs"), address(0xBF805000)));
extern volatile uint32_t I2C1ACONCLR __attribute__((section("sfrs"),address(0xBF805004)));
extern volatile uint32_t I2C3CONCLR __attribute__((section("sfrs"),address(0xBF805004)));
extern volatile uint32_t I2C1ACONSET __attribute__((section("sfrs"),address(0xBF805008)));
extern volatile uint32_t I2C3CONSET __attribute__((section("sfrs"),address(0xBF805008)));
extern volatile uint32_t I2C1ACONINV __attribute__((section("sfrs"),address(0xBF80500C)));
extern volatile uint32_t I2C3CONINV __attribute__((section("sfrs"),address(0xBF80500C)));

extern volatile uint32_t I2C1ASTAT __attribute__((section("sfrs"), address(0xBF805010)));
typedef union {
  struct {
    uint32_t TBF:1;
    uint32_t RBF:1;
    uint32_t R_W:1;
    uint32_t S:1;
    uint32_t P:1;
    uint32_t D_A:1;
    uint32_t I2COV:1;
    uint32_t IWCOL:1;
    uint32_t ADD10:1;
    uint32_t GCSTAT:1;
    uint32_t BCL:1;
    uint32_t :3;
    uint32_t TRSTAT:1;
    uint32_t ACKSTAT:1;
  };
  struct {
    uint32_t :6;
    uint32_t I2CPOV:1;
  };
  struct {
    uint32_t w:32;
  };
} __I2C1ASTATbits_t;
extern volatile __I2C1ASTATbits_t I2C1ASTATbits __asm__ ("I2C1ASTAT") __attribute__((section("sfrs"), address(0xBF805010)));

extern volatile uint32_t I2C3STAT __attribute__((section("sfrs"), address(0xBF805010)));
typedef union {
  struct {
    uint32_t TBF:1;
    uint32_t RBF:1;
    uint32_t R_W:1;
    uint32_t S:1;
    uint32_t P:1;
    uint32_t D_A:1;
    uint32_t I2COV:1;
    uint32_t IWCOL:1;
    uint32_t ADD10:1;
    uint32_t GCSTAT:1;
    uint32_t BCL:1;
    uint32_t :3;
    uint32_t TRSTAT:1;
    uint32_t ACKSTAT:1;
  };
  struct {
    uint32_t :6;
    uint32_t I2CPOV:1;
  };
  struct {
    uint32_t w:32;
  };
} __I2C3STATbits_t;
extern volatile __I2C3STATbits_t I2C3STATbits __asm__ ("I2C3STAT") __attribute__((section("sfrs"), address(0xBF805010)));
extern volatile uint32_t I2C1ASTATCLR __attribute__((section("sfrs"),address(0xBF805014)));
extern volatile uint32_t I2C3STATCLR __attribute__((section("sfrs"),address(0xBF805014)));
extern volatile uint32_t I2C1ASTATSET __attribute__((section("sfrs"),address(0xBF805018)));
extern volatile uint32_t I2C3STATSET __attribute__((section("sfrs"),address(0xBF805018)));
extern volatile uint32_t I2C1ASTATINV __attribute__((section("sfrs"),address(0xBF80501C)));
extern volatile uint32_t I2C3STATINV __attribute__((section("sfrs"),address(0xBF80501C)));

extern volatile uint32_t I2C1AADD __attribute__((section("sfrs"), address(0xBF805020)));

extern volatile uint32_t I2C3ADD __attribute__((section("sfrs"), address(0xBF805020)));
extern volatile uint32_t I2C1AADDCLR __attribute__((section("sfrs"),address(0xBF805024)));
extern volatile uint32_t I2C3ADDCLR __attribute__((section("sfrs"),address(0xBF805024)));
extern volatile uint32_t I2C1AADDSET __attribute__((section("sfrs"),address(0xBF805028)));
extern volatile uint32_t I2C3ADDSET __attribute__((section("sfrs"),address(0xBF805028)));
extern volatile uint32_t I2C1AADDINV __attribute__((section("sfrs"),address(0xBF80502C)));
extern volatile uint32_t I2C3ADDINV __attribute__((section("sfrs"),address(0xBF80502C)));

extern volatile uint32_t I2C1AMSK __attribute__((section("sfrs"), address(0xBF805030)));

extern volatile uint32_t I2C3MSK __attribute__((section("sfrs"), address(0xBF805030)));
extern volatile uint32_t I2C1AMSKCLR __attribute__((section("sfrs"),address(0xBF805034)));
extern volatile uint32_t I2C3MSKCLR __attribute__((section("sfrs"),address(0xBF805034)));
extern volatile uint32_t I2C1AMSKSET __attribute__((section("sfrs"),address(0xBF805038)));
extern volatile uint32_t I2C3MSKSET __attribute__((section("sfrs"),address(0xBF805038)));
extern volatile uint32_t I2C1AMSKINV __attribute__((section("sfrs"),address(0xBF80503C)));
extern volatile uint32_t I2C3MSKINV __attribute__((section("sfrs"),address(0xBF80503C)));

extern volatile uint32_t I2C1ABRG __attribute__((section("sfrs"), address(0xBF805040)));

extern volatile uint32_t I2C3BRG __attribute__((section("sfrs"), address(0xBF805040)));
extern volatile uint32_t I2C1ABRGCLR __attribute__((section("sfrs"),address(0xBF805044)));
extern volatile uint32_t I2C3BRGCLR __attribute__((section("sfrs"),address(0xBF805044)));
extern volatile uint32_t I2C1ABRGSET __attribute__((section("sfrs"),address(0xBF805048)));
extern volatile uint32_t I2C3BRGSET __attribute__((section("sfrs"),address(0xBF805048)));
extern volatile uint32_t I2C1ABRGINV __attribute__((section("sfrs"),address(0xBF80504C)));
extern volatile uint32_t I2C3BRGINV __attribute__((section("sfrs"),address(0xBF80504C)));

extern volatile uint32_t I2C1ATRN __attribute__((section("sfrs"), address(0xBF805050)));

extern volatile uint32_t I2C3TRN __attribute__((section("sfrs"), address(0xBF805050)));
extern volatile uint32_t I2C1ATRNCLR __attribute__((section("sfrs"),address(0xBF805054)));
extern volatile uint32_t I2C3TRNCLR __attribute__((section("sfrs"),address(0xBF805054)));
extern volatile uint32_t I2C1ATRNSET __attribute__((section("sfrs"),address(0xBF805058)));
extern volatile uint32_t I2C3TRNSET __attribute__((section("sfrs"),address(0xBF805058)));
extern volatile uint32_t I2C1ATRNINV __attribute__((section("sfrs"),address(0xBF80505C)));
extern volatile uint32_t I2C3TRNINV __attribute__((section("sfrs"),address(0xBF80505C)));

extern volatile uint32_t I2C1ARCV __attribute__((section("sfrs"), address(0xBF805060)));

extern volatile uint32_t I2C3RCV __attribute__((section("sfrs"), address(0xBF805060)));

extern volatile uint32_t I2C2ACON __attribute__((section("sfrs"), address(0xBF805100)));
typedef union {
  struct {
    uint32_t SEN:1;
    uint32_t RSEN:1;
    uint32_t PEN:1;
    uint32_t RCEN:1;
    uint32_t ACKEN:1;
    uint32_t ACKDT:1;
    uint32_t STREN:1;
    uint32_t GCEN:1;
    uint32_t SMEN:1;
    uint32_t DISSLW:1;
    uint32_t A10M:1;
    uint32_t STRICT:1;
    uint32_t SCLREL:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :11;
    uint32_t IPMIEN:1;
    uint32_t :1;
    uint32_t I2CSIDL:1;
    uint32_t :1;
    uint32_t I2CEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __I2C2ACONbits_t;
extern volatile __I2C2ACONbits_t I2C2ACONbits __asm__ ("I2C2ACON") __attribute__((section("sfrs"), address(0xBF805100)));

extern volatile uint32_t I2C4CON __attribute__((section("sfrs"), address(0xBF805100)));
typedef union {
  struct {
    uint32_t SEN:1;
    uint32_t RSEN:1;
    uint32_t PEN:1;
    uint32_t RCEN:1;
    uint32_t ACKEN:1;
    uint32_t ACKDT:1;
    uint32_t STREN:1;
    uint32_t GCEN:1;
    uint32_t SMEN:1;
    uint32_t DISSLW:1;
    uint32_t A10M:1;
    uint32_t STRICT:1;
    uint32_t SCLREL:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :11;
    uint32_t IPMIEN:1;
    uint32_t :1;
    uint32_t I2CSIDL:1;
    uint32_t :1;
    uint32_t I2CEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __I2C4CONbits_t;
extern volatile __I2C4CONbits_t I2C4CONbits __asm__ ("I2C4CON") __attribute__((section("sfrs"), address(0xBF805100)));
extern volatile uint32_t I2C2ACONCLR __attribute__((section("sfrs"),address(0xBF805104)));
extern volatile uint32_t I2C4CONCLR __attribute__((section("sfrs"),address(0xBF805104)));
extern volatile uint32_t I2C2ACONSET __attribute__((section("sfrs"),address(0xBF805108)));
extern volatile uint32_t I2C4CONSET __attribute__((section("sfrs"),address(0xBF805108)));
extern volatile uint32_t I2C2ACONINV __attribute__((section("sfrs"),address(0xBF80510C)));
extern volatile uint32_t I2C4CONINV __attribute__((section("sfrs"),address(0xBF80510C)));

extern volatile uint32_t I2C2ASTAT __attribute__((section("sfrs"), address(0xBF805110)));
typedef union {
  struct {
    uint32_t TBF:1;
    uint32_t RBF:1;
    uint32_t R_W:1;
    uint32_t S:1;
    uint32_t P:1;
    uint32_t D_A:1;
    uint32_t I2COV:1;
    uint32_t IWCOL:1;
    uint32_t ADD10:1;
    uint32_t GCSTAT:1;
    uint32_t BCL:1;
    uint32_t :3;
    uint32_t TRSTAT:1;
    uint32_t ACKSTAT:1;
  };
  struct {
    uint32_t :6;
    uint32_t I2CPOV:1;
  };
  struct {
    uint32_t w:32;
  };
} __I2C2ASTATbits_t;
extern volatile __I2C2ASTATbits_t I2C2ASTATbits __asm__ ("I2C2ASTAT") __attribute__((section("sfrs"), address(0xBF805110)));

extern volatile uint32_t I2C4STAT __attribute__((section("sfrs"), address(0xBF805110)));
typedef union {
  struct {
    uint32_t TBF:1;
    uint32_t RBF:1;
    uint32_t R_W:1;
    uint32_t S:1;
    uint32_t P:1;
    uint32_t D_A:1;
    uint32_t I2COV:1;
    uint32_t IWCOL:1;
    uint32_t ADD10:1;
    uint32_t GCSTAT:1;
    uint32_t BCL:1;
    uint32_t :3;
    uint32_t TRSTAT:1;
    uint32_t ACKSTAT:1;
  };
  struct {
    uint32_t :6;
    uint32_t I2CPOV:1;
  };
  struct {
    uint32_t w:32;
  };
} __I2C4STATbits_t;
extern volatile __I2C4STATbits_t I2C4STATbits __asm__ ("I2C4STAT") __attribute__((section("sfrs"), address(0xBF805110)));
extern volatile uint32_t I2C2ASTATCLR __attribute__((section("sfrs"),address(0xBF805114)));
extern volatile uint32_t I2C4STATCLR __attribute__((section("sfrs"),address(0xBF805114)));
extern volatile uint32_t I2C2ASTATSET __attribute__((section("sfrs"),address(0xBF805118)));
extern volatile uint32_t I2C4STATSET __attribute__((section("sfrs"),address(0xBF805118)));
extern volatile uint32_t I2C2ASTATINV __attribute__((section("sfrs"),address(0xBF80511C)));
extern volatile uint32_t I2C4STATINV __attribute__((section("sfrs"),address(0xBF80511C)));

extern volatile uint32_t I2C2AADD __attribute__((section("sfrs"), address(0xBF805120)));

extern volatile uint32_t I2C4ADD __attribute__((section("sfrs"), address(0xBF805120)));
extern volatile uint32_t I2C2AADDCLR __attribute__((section("sfrs"),address(0xBF805124)));
extern volatile uint32_t I2C4ADDCLR __attribute__((section("sfrs"),address(0xBF805124)));
extern volatile uint32_t I2C2AADDSET __attribute__((section("sfrs"),address(0xBF805128)));
extern volatile uint32_t I2C4ADDSET __attribute__((section("sfrs"),address(0xBF805128)));
extern volatile uint32_t I2C2AADDINV __attribute__((section("sfrs"),address(0xBF80512C)));
extern volatile uint32_t I2C4ADDINV __attribute__((section("sfrs"),address(0xBF80512C)));

extern volatile uint32_t I2C2AMSK __attribute__((section("sfrs"), address(0xBF805130)));

extern volatile uint32_t I2C4MSK __attribute__((section("sfrs"), address(0xBF805130)));
extern volatile uint32_t I2C2AMSKCLR __attribute__((section("sfrs"),address(0xBF805134)));
extern volatile uint32_t I2C4MSKCLR __attribute__((section("sfrs"),address(0xBF805134)));
extern volatile uint32_t I2C2AMSKSET __attribute__((section("sfrs"),address(0xBF805138)));
extern volatile uint32_t I2C4MSKSET __attribute__((section("sfrs"),address(0xBF805138)));
extern volatile uint32_t I2C2AMSKINV __attribute__((section("sfrs"),address(0xBF80513C)));
extern volatile uint32_t I2C4MSKINV __attribute__((section("sfrs"),address(0xBF80513C)));

extern volatile uint32_t I2C2ABRG __attribute__((section("sfrs"), address(0xBF805140)));

extern volatile uint32_t I2C4BRG __attribute__((section("sfrs"), address(0xBF805140)));
extern volatile uint32_t I2C2ABRGCLR __attribute__((section("sfrs"),address(0xBF805144)));
extern volatile uint32_t I2C4BRGCLR __attribute__((section("sfrs"),address(0xBF805144)));
extern volatile uint32_t I2C2ABRGSET __attribute__((section("sfrs"),address(0xBF805148)));
extern volatile uint32_t I2C4BRGSET __attribute__((section("sfrs"),address(0xBF805148)));
extern volatile uint32_t I2C2ABRGINV __attribute__((section("sfrs"),address(0xBF80514C)));
extern volatile uint32_t I2C4BRGINV __attribute__((section("sfrs"),address(0xBF80514C)));

extern volatile uint32_t I2C2ATRN __attribute__((section("sfrs"), address(0xBF805150)));

extern volatile uint32_t I2C4TRN __attribute__((section("sfrs"), address(0xBF805150)));
extern volatile uint32_t I2C2ATRNCLR __attribute__((section("sfrs"),address(0xBF805154)));
extern volatile uint32_t I2C4TRNCLR __attribute__((section("sfrs"),address(0xBF805154)));
extern volatile uint32_t I2C2ATRNSET __attribute__((section("sfrs"),address(0xBF805158)));
extern volatile uint32_t I2C4TRNSET __attribute__((section("sfrs"),address(0xBF805158)));
extern volatile uint32_t I2C2ATRNINV __attribute__((section("sfrs"),address(0xBF80515C)));
extern volatile uint32_t I2C4TRNINV __attribute__((section("sfrs"),address(0xBF80515C)));

extern volatile uint32_t I2C2ARCV __attribute__((section("sfrs"), address(0xBF805160)));

extern volatile uint32_t I2C4RCV __attribute__((section("sfrs"), address(0xBF805160)));

extern volatile uint32_t I2C3ACON __attribute__((section("sfrs"), address(0xBF805200)));
typedef union {
  struct {
    uint32_t SEN:1;
    uint32_t RSEN:1;
    uint32_t PEN:1;
    uint32_t RCEN:1;
    uint32_t ACKEN:1;
    uint32_t ACKDT:1;
    uint32_t STREN:1;
    uint32_t GCEN:1;
    uint32_t SMEN:1;
    uint32_t DISSLW:1;
    uint32_t A10M:1;
    uint32_t STRICT:1;
    uint32_t SCLREL:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :11;
    uint32_t IPMIEN:1;
    uint32_t :1;
    uint32_t I2CSIDL:1;
    uint32_t :1;
    uint32_t I2CEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __I2C3ACONbits_t;
extern volatile __I2C3ACONbits_t I2C3ACONbits __asm__ ("I2C3ACON") __attribute__((section("sfrs"), address(0xBF805200)));

extern volatile uint32_t I2C5CON __attribute__((section("sfrs"), address(0xBF805200)));
typedef union {
  struct {
    uint32_t SEN:1;
    uint32_t RSEN:1;
    uint32_t PEN:1;
    uint32_t RCEN:1;
    uint32_t ACKEN:1;
    uint32_t ACKDT:1;
    uint32_t STREN:1;
    uint32_t GCEN:1;
    uint32_t SMEN:1;
    uint32_t DISSLW:1;
    uint32_t A10M:1;
    uint32_t STRICT:1;
    uint32_t SCLREL:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :11;
    uint32_t IPMIEN:1;
    uint32_t :1;
    uint32_t I2CSIDL:1;
    uint32_t :1;
    uint32_t I2CEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __I2C5CONbits_t;
extern volatile __I2C5CONbits_t I2C5CONbits __asm__ ("I2C5CON") __attribute__((section("sfrs"), address(0xBF805200)));
extern volatile uint32_t I2C3ACONCLR __attribute__((section("sfrs"),address(0xBF805204)));
extern volatile uint32_t I2C5CONCLR __attribute__((section("sfrs"),address(0xBF805204)));
extern volatile uint32_t I2C3ACONSET __attribute__((section("sfrs"),address(0xBF805208)));
extern volatile uint32_t I2C5CONSET __attribute__((section("sfrs"),address(0xBF805208)));
extern volatile uint32_t I2C3ACONINV __attribute__((section("sfrs"),address(0xBF80520C)));
extern volatile uint32_t I2C5CONINV __attribute__((section("sfrs"),address(0xBF80520C)));

extern volatile uint32_t I2C3ASTAT __attribute__((section("sfrs"), address(0xBF805210)));
typedef union {
  struct {
    uint32_t TBF:1;
    uint32_t RBF:1;
    uint32_t R_W:1;
    uint32_t S:1;
    uint32_t P:1;
    uint32_t D_A:1;
    uint32_t I2COV:1;
    uint32_t IWCOL:1;
    uint32_t ADD10:1;
    uint32_t GCSTAT:1;
    uint32_t BCL:1;
    uint32_t :3;
    uint32_t TRSTAT:1;
    uint32_t ACKSTAT:1;
  };
  struct {
    uint32_t :6;
    uint32_t I2CPOV:1;
  };
  struct {
    uint32_t w:32;
  };
} __I2C3ASTATbits_t;
extern volatile __I2C3ASTATbits_t I2C3ASTATbits __asm__ ("I2C3ASTAT") __attribute__((section("sfrs"), address(0xBF805210)));

extern volatile uint32_t I2C5STAT __attribute__((section("sfrs"), address(0xBF805210)));
typedef union {
  struct {
    uint32_t TBF:1;
    uint32_t RBF:1;
    uint32_t R_W:1;
    uint32_t S:1;
    uint32_t P:1;
    uint32_t D_A:1;
    uint32_t I2COV:1;
    uint32_t IWCOL:1;
    uint32_t ADD10:1;
    uint32_t GCSTAT:1;
    uint32_t BCL:1;
    uint32_t :3;
    uint32_t TRSTAT:1;
    uint32_t ACKSTAT:1;
  };
  struct {
    uint32_t :6;
    uint32_t I2CPOV:1;
  };
  struct {
    uint32_t w:32;
  };
} __I2C5STATbits_t;
extern volatile __I2C5STATbits_t I2C5STATbits __asm__ ("I2C5STAT") __attribute__((section("sfrs"), address(0xBF805210)));
extern volatile uint32_t I2C3ASTATCLR __attribute__((section("sfrs"),address(0xBF805214)));
extern volatile uint32_t I2C5STATCLR __attribute__((section("sfrs"),address(0xBF805214)));
extern volatile uint32_t I2C3ASTATSET __attribute__((section("sfrs"),address(0xBF805218)));
extern volatile uint32_t I2C5STATSET __attribute__((section("sfrs"),address(0xBF805218)));
extern volatile uint32_t I2C3ASTATINV __attribute__((section("sfrs"),address(0xBF80521C)));
extern volatile uint32_t I2C5STATINV __attribute__((section("sfrs"),address(0xBF80521C)));

extern volatile uint32_t I2C3AADD __attribute__((section("sfrs"), address(0xBF805220)));

extern volatile uint32_t I2C5ADD __attribute__((section("sfrs"), address(0xBF805220)));
extern volatile uint32_t I2C3AADDCLR __attribute__((section("sfrs"),address(0xBF805224)));
extern volatile uint32_t I2C5ADDCLR __attribute__((section("sfrs"),address(0xBF805224)));
extern volatile uint32_t I2C3AADDSET __attribute__((section("sfrs"),address(0xBF805228)));
extern volatile uint32_t I2C5ADDSET __attribute__((section("sfrs"),address(0xBF805228)));
extern volatile uint32_t I2C3AADDINV __attribute__((section("sfrs"),address(0xBF80522C)));
extern volatile uint32_t I2C5ADDINV __attribute__((section("sfrs"),address(0xBF80522C)));

extern volatile uint32_t I2C3AMSK __attribute__((section("sfrs"), address(0xBF805230)));

extern volatile uint32_t I2C5MSK __attribute__((section("sfrs"), address(0xBF805230)));
extern volatile uint32_t I2C3AMSKCLR __attribute__((section("sfrs"),address(0xBF805234)));
extern volatile uint32_t I2C5MSKCLR __attribute__((section("sfrs"),address(0xBF805234)));
extern volatile uint32_t I2C3AMSKSET __attribute__((section("sfrs"),address(0xBF805238)));
extern volatile uint32_t I2C5MSKSET __attribute__((section("sfrs"),address(0xBF805238)));
extern volatile uint32_t I2C3AMSKINV __attribute__((section("sfrs"),address(0xBF80523C)));
extern volatile uint32_t I2C5MSKINV __attribute__((section("sfrs"),address(0xBF80523C)));

extern volatile uint32_t I2C3ABRG __attribute__((section("sfrs"), address(0xBF805240)));

extern volatile uint32_t I2C5BRG __attribute__((section("sfrs"), address(0xBF805240)));
extern volatile uint32_t I2C3ABRGCLR __attribute__((section("sfrs"),address(0xBF805244)));
extern volatile uint32_t I2C5BRGCLR __attribute__((section("sfrs"),address(0xBF805244)));
extern volatile uint32_t I2C3ABRGSET __attribute__((section("sfrs"),address(0xBF805248)));
extern volatile uint32_t I2C5BRGSET __attribute__((section("sfrs"),address(0xBF805248)));
extern volatile uint32_t I2C3ABRGINV __attribute__((section("sfrs"),address(0xBF80524C)));
extern volatile uint32_t I2C5BRGINV __attribute__((section("sfrs"),address(0xBF80524C)));

extern volatile uint32_t I2C3ATRN __attribute__((section("sfrs"), address(0xBF805250)));

extern volatile uint32_t I2C5TRN __attribute__((section("sfrs"), address(0xBF805250)));
extern volatile uint32_t I2C3ATRNCLR __attribute__((section("sfrs"),address(0xBF805254)));
extern volatile uint32_t I2C5TRNCLR __attribute__((section("sfrs"),address(0xBF805254)));
extern volatile uint32_t I2C3ATRNSET __attribute__((section("sfrs"),address(0xBF805258)));
extern volatile uint32_t I2C5TRNSET __attribute__((section("sfrs"),address(0xBF805258)));
extern volatile uint32_t I2C3ATRNINV __attribute__((section("sfrs"),address(0xBF80525C)));
extern volatile uint32_t I2C5TRNINV __attribute__((section("sfrs"),address(0xBF80525C)));

extern volatile uint32_t I2C3ARCV __attribute__((section("sfrs"), address(0xBF805260)));

extern volatile uint32_t I2C5RCV __attribute__((section("sfrs"), address(0xBF805260)));

extern volatile uint32_t I2C1CON __attribute__((section("sfrs"), address(0xBF805300)));
typedef union {
  struct {
    uint32_t SEN:1;
    uint32_t RSEN:1;
    uint32_t PEN:1;
    uint32_t RCEN:1;
    uint32_t ACKEN:1;
    uint32_t ACKDT:1;
    uint32_t STREN:1;
    uint32_t GCEN:1;
    uint32_t SMEN:1;
    uint32_t DISSLW:1;
    uint32_t A10M:1;
    uint32_t STRICT:1;
    uint32_t SCLREL:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :11;
    uint32_t IPMIEN:1;
    uint32_t :1;
    uint32_t I2CSIDL:1;
    uint32_t :1;
    uint32_t I2CEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __I2C1CONbits_t;
extern volatile __I2C1CONbits_t I2C1CONbits __asm__ ("I2C1CON") __attribute__((section("sfrs"), address(0xBF805300)));
extern volatile uint32_t I2C1CONCLR __attribute__((section("sfrs"),address(0xBF805304)));
extern volatile uint32_t I2C1CONSET __attribute__((section("sfrs"),address(0xBF805308)));
extern volatile uint32_t I2C1CONINV __attribute__((section("sfrs"),address(0xBF80530C)));

extern volatile uint32_t I2C1STAT __attribute__((section("sfrs"), address(0xBF805310)));
typedef union {
  struct {
    uint32_t TBF:1;
    uint32_t RBF:1;
    uint32_t R_W:1;
    uint32_t S:1;
    uint32_t P:1;
    uint32_t D_A:1;
    uint32_t I2COV:1;
    uint32_t IWCOL:1;
    uint32_t ADD10:1;
    uint32_t GCSTAT:1;
    uint32_t BCL:1;
    uint32_t :3;
    uint32_t TRSTAT:1;
    uint32_t ACKSTAT:1;
  };
  struct {
    uint32_t :6;
    uint32_t I2CPOV:1;
  };
  struct {
    uint32_t w:32;
  };
} __I2C1STATbits_t;
extern volatile __I2C1STATbits_t I2C1STATbits __asm__ ("I2C1STAT") __attribute__((section("sfrs"), address(0xBF805310)));
extern volatile uint32_t I2C1STATCLR __attribute__((section("sfrs"),address(0xBF805314)));
extern volatile uint32_t I2C1STATSET __attribute__((section("sfrs"),address(0xBF805318)));
extern volatile uint32_t I2C1STATINV __attribute__((section("sfrs"),address(0xBF80531C)));

extern volatile uint32_t I2C1ADD __attribute__((section("sfrs"), address(0xBF805320)));
extern volatile uint32_t I2C1ADDCLR __attribute__((section("sfrs"),address(0xBF805324)));
extern volatile uint32_t I2C1ADDSET __attribute__((section("sfrs"),address(0xBF805328)));
extern volatile uint32_t I2C1ADDINV __attribute__((section("sfrs"),address(0xBF80532C)));

extern volatile uint32_t I2C1MSK __attribute__((section("sfrs"), address(0xBF805330)));
extern volatile uint32_t I2C1MSKCLR __attribute__((section("sfrs"),address(0xBF805334)));
extern volatile uint32_t I2C1MSKSET __attribute__((section("sfrs"),address(0xBF805338)));
extern volatile uint32_t I2C1MSKINV __attribute__((section("sfrs"),address(0xBF80533C)));

extern volatile uint32_t I2C1BRG __attribute__((section("sfrs"), address(0xBF805340)));
extern volatile uint32_t I2C1BRGCLR __attribute__((section("sfrs"),address(0xBF805344)));
extern volatile uint32_t I2C1BRGSET __attribute__((section("sfrs"),address(0xBF805348)));
extern volatile uint32_t I2C1BRGINV __attribute__((section("sfrs"),address(0xBF80534C)));

extern volatile uint32_t I2C1TRN __attribute__((section("sfrs"), address(0xBF805350)));
extern volatile uint32_t I2C1TRNCLR __attribute__((section("sfrs"),address(0xBF805354)));
extern volatile uint32_t I2C1TRNSET __attribute__((section("sfrs"),address(0xBF805358)));
extern volatile uint32_t I2C1TRNINV __attribute__((section("sfrs"),address(0xBF80535C)));

extern volatile uint32_t I2C1RCV __attribute__((section("sfrs"), address(0xBF805360)));

extern volatile uint32_t I2C2CON __attribute__((section("sfrs"), address(0xBF805400)));
typedef union {
  struct {
    uint32_t SEN:1;
    uint32_t RSEN:1;
    uint32_t PEN:1;
    uint32_t RCEN:1;
    uint32_t ACKEN:1;
    uint32_t ACKDT:1;
    uint32_t STREN:1;
    uint32_t GCEN:1;
    uint32_t SMEN:1;
    uint32_t DISSLW:1;
    uint32_t A10M:1;
    uint32_t STRICT:1;
    uint32_t SCLREL:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :11;
    uint32_t IPMIEN:1;
    uint32_t :1;
    uint32_t I2CSIDL:1;
    uint32_t :1;
    uint32_t I2CEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __I2C2CONbits_t;
extern volatile __I2C2CONbits_t I2C2CONbits __asm__ ("I2C2CON") __attribute__((section("sfrs"), address(0xBF805400)));
extern volatile uint32_t I2C2CONCLR __attribute__((section("sfrs"),address(0xBF805404)));
extern volatile uint32_t I2C2CONSET __attribute__((section("sfrs"),address(0xBF805408)));
extern volatile uint32_t I2C2CONINV __attribute__((section("sfrs"),address(0xBF80540C)));

extern volatile uint32_t I2C2STAT __attribute__((section("sfrs"), address(0xBF805410)));
typedef union {
  struct {
    uint32_t TBF:1;
    uint32_t RBF:1;
    uint32_t R_W:1;
    uint32_t S:1;
    uint32_t P:1;
    uint32_t D_A:1;
    uint32_t I2COV:1;
    uint32_t IWCOL:1;
    uint32_t ADD10:1;
    uint32_t GCSTAT:1;
    uint32_t BCL:1;
    uint32_t :3;
    uint32_t TRSTAT:1;
    uint32_t ACKSTAT:1;
  };
  struct {
    uint32_t :6;
    uint32_t I2CPOV:1;
  };
  struct {
    uint32_t w:32;
  };
} __I2C2STATbits_t;
extern volatile __I2C2STATbits_t I2C2STATbits __asm__ ("I2C2STAT") __attribute__((section("sfrs"), address(0xBF805410)));
extern volatile uint32_t I2C2STATCLR __attribute__((section("sfrs"),address(0xBF805414)));
extern volatile uint32_t I2C2STATSET __attribute__((section("sfrs"),address(0xBF805418)));
extern volatile uint32_t I2C2STATINV __attribute__((section("sfrs"),address(0xBF80541C)));

extern volatile uint32_t I2C2ADD __attribute__((section("sfrs"), address(0xBF805420)));
extern volatile uint32_t I2C2ADDCLR __attribute__((section("sfrs"),address(0xBF805424)));
extern volatile uint32_t I2C2ADDSET __attribute__((section("sfrs"),address(0xBF805428)));
extern volatile uint32_t I2C2ADDINV __attribute__((section("sfrs"),address(0xBF80542C)));

extern volatile uint32_t I2C2MSK __attribute__((section("sfrs"), address(0xBF805430)));
extern volatile uint32_t I2C2MSKCLR __attribute__((section("sfrs"),address(0xBF805434)));
extern volatile uint32_t I2C2MSKSET __attribute__((section("sfrs"),address(0xBF805438)));
extern volatile uint32_t I2C2MSKINV __attribute__((section("sfrs"),address(0xBF80543C)));

extern volatile uint32_t I2C2BRG __attribute__((section("sfrs"), address(0xBF805440)));
extern volatile uint32_t I2C2BRGCLR __attribute__((section("sfrs"),address(0xBF805444)));
extern volatile uint32_t I2C2BRGSET __attribute__((section("sfrs"),address(0xBF805448)));
extern volatile uint32_t I2C2BRGINV __attribute__((section("sfrs"),address(0xBF80544C)));

extern volatile uint32_t I2C2TRN __attribute__((section("sfrs"), address(0xBF805450)));
extern volatile uint32_t I2C2TRNCLR __attribute__((section("sfrs"),address(0xBF805454)));
extern volatile uint32_t I2C2TRNSET __attribute__((section("sfrs"),address(0xBF805458)));
extern volatile uint32_t I2C2TRNINV __attribute__((section("sfrs"),address(0xBF80545C)));

extern volatile uint32_t I2C2RCV __attribute__((section("sfrs"), address(0xBF805460)));

extern volatile uint32_t SPI1ACON __attribute__((section("sfrs"), address(0xBF805800)));
typedef union {
  struct {
    uint32_t SRXISEL:2;
    uint32_t STXISEL:2;
    uint32_t :1;
    uint32_t MSTEN:1;
    uint32_t CKP:1;
    uint32_t SSEN:1;
    uint32_t CKE:1;
    uint32_t SMP:1;
    uint32_t MODE16:1;
    uint32_t MODE32:1;
    uint32_t DISSDO:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
    uint32_t ENHBUF:1;
    uint32_t SPIFE:1;
    uint32_t :6;
    uint32_t FRMCNT:3;
    uint32_t FRMSYPW:1;
    uint32_t MSSEN:1;
    uint32_t FRMPOL:1;
    uint32_t FRMSYNC:1;
    uint32_t FRMEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __SPI1ACONbits_t;
extern volatile __SPI1ACONbits_t SPI1ACONbits __asm__ ("SPI1ACON") __attribute__((section("sfrs"), address(0xBF805800)));

extern volatile uint32_t SPI3CON __attribute__((section("sfrs"), address(0xBF805800)));
typedef union {
  struct {
    uint32_t SRXISEL:2;
    uint32_t STXISEL:2;
    uint32_t :1;
    uint32_t MSTEN:1;
    uint32_t CKP:1;
    uint32_t SSEN:1;
    uint32_t CKE:1;
    uint32_t SMP:1;
    uint32_t MODE16:1;
    uint32_t MODE32:1;
    uint32_t DISSDO:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
    uint32_t ENHBUF:1;
    uint32_t SPIFE:1;
    uint32_t :6;
    uint32_t FRMCNT:3;
    uint32_t FRMSYPW:1;
    uint32_t MSSEN:1;
    uint32_t FRMPOL:1;
    uint32_t FRMSYNC:1;
    uint32_t FRMEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __SPI3CONbits_t;
extern volatile __SPI3CONbits_t SPI3CONbits __asm__ ("SPI3CON") __attribute__((section("sfrs"), address(0xBF805800)));
extern volatile uint32_t SPI1ACONCLR __attribute__((section("sfrs"),address(0xBF805804)));
extern volatile uint32_t SPI3CONCLR __attribute__((section("sfrs"),address(0xBF805804)));
extern volatile uint32_t SPI1ACONSET __attribute__((section("sfrs"),address(0xBF805808)));
extern volatile uint32_t SPI3CONSET __attribute__((section("sfrs"),address(0xBF805808)));
extern volatile uint32_t SPI1ACONINV __attribute__((section("sfrs"),address(0xBF80580C)));
extern volatile uint32_t SPI3CONINV __attribute__((section("sfrs"),address(0xBF80580C)));

extern volatile uint32_t SPI1ASTAT __attribute__((section("sfrs"), address(0xBF805810)));
typedef union {
  struct {
    uint32_t SPIRBF:1;
    uint32_t SPITBF:1;
    uint32_t :1;
    uint32_t SPITBE:1;
    uint32_t :1;
    uint32_t SPIRBE:1;
    uint32_t SPIROV:1;
    uint32_t SRMT:1;
    uint32_t SPITUR:1;
    uint32_t :2;
    uint32_t SPIBUSY:1;
    uint32_t :4;
    uint32_t TXBUFELM:5;
    uint32_t :3;
    uint32_t RXBUFELM:5;
  };
  struct {
    uint32_t w:32;
  };
} __SPI1ASTATbits_t;
extern volatile __SPI1ASTATbits_t SPI1ASTATbits __asm__ ("SPI1ASTAT") __attribute__((section("sfrs"), address(0xBF805810)));

extern volatile uint32_t SPI3STAT __attribute__((section("sfrs"), address(0xBF805810)));
typedef union {
  struct {
    uint32_t SPIRBF:1;
    uint32_t SPITBF:1;
    uint32_t :1;
    uint32_t SPITBE:1;
    uint32_t :1;
    uint32_t SPIRBE:1;
    uint32_t SPIROV:1;
    uint32_t SRMT:1;
    uint32_t SPITUR:1;
    uint32_t :2;
    uint32_t SPIBUSY:1;
    uint32_t :4;
    uint32_t TXBUFELM:5;
    uint32_t :3;
    uint32_t RXBUFELM:5;
  };
  struct {
    uint32_t w:32;
  };
} __SPI3STATbits_t;
extern volatile __SPI3STATbits_t SPI3STATbits __asm__ ("SPI3STAT") __attribute__((section("sfrs"), address(0xBF805810)));
extern volatile uint32_t SPI1ASTATCLR __attribute__((section("sfrs"),address(0xBF805814)));
extern volatile uint32_t SPI3STATCLR __attribute__((section("sfrs"),address(0xBF805814)));
extern volatile uint32_t SPI1ASTATSET __attribute__((section("sfrs"),address(0xBF805818)));
extern volatile uint32_t SPI3STATSET __attribute__((section("sfrs"),address(0xBF805818)));
extern volatile uint32_t SPI1ASTATINV __attribute__((section("sfrs"),address(0xBF80581C)));
extern volatile uint32_t SPI3STATINV __attribute__((section("sfrs"),address(0xBF80581C)));

extern volatile uint32_t SPI1ABUF __attribute__((section("sfrs"), address(0xBF805820)));

extern volatile uint32_t SPI3BUF __attribute__((section("sfrs"), address(0xBF805820)));

extern volatile uint32_t SPI1ABRG __attribute__((section("sfrs"), address(0xBF805830)));

extern volatile uint32_t SPI3BRG __attribute__((section("sfrs"), address(0xBF805830)));
extern volatile uint32_t SPI1ABRGCLR __attribute__((section("sfrs"),address(0xBF805834)));
extern volatile uint32_t SPI3BRGCLR __attribute__((section("sfrs"),address(0xBF805834)));
extern volatile uint32_t SPI1ABRGSET __attribute__((section("sfrs"),address(0xBF805838)));
extern volatile uint32_t SPI3BRGSET __attribute__((section("sfrs"),address(0xBF805838)));
extern volatile uint32_t SPI1ABRGINV __attribute__((section("sfrs"),address(0xBF80583C)));
extern volatile uint32_t SPI3BRGINV __attribute__((section("sfrs"),address(0xBF80583C)));

extern volatile uint32_t SPI2ACON __attribute__((section("sfrs"), address(0xBF805A00)));
typedef union {
  struct {
    uint32_t SRXISEL:2;
    uint32_t STXISEL:2;
    uint32_t :1;
    uint32_t MSTEN:1;
    uint32_t CKP:1;
    uint32_t SSEN:1;
    uint32_t CKE:1;
    uint32_t SMP:1;
    uint32_t MODE16:1;
    uint32_t MODE32:1;
    uint32_t DISSDO:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
    uint32_t ENHBUF:1;
    uint32_t SPIFE:1;
    uint32_t :6;
    uint32_t FRMCNT:3;
    uint32_t FRMSYPW:1;
    uint32_t MSSEN:1;
    uint32_t FRMPOL:1;
    uint32_t FRMSYNC:1;
    uint32_t FRMEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __SPI2ACONbits_t;
extern volatile __SPI2ACONbits_t SPI2ACONbits __asm__ ("SPI2ACON") __attribute__((section("sfrs"), address(0xBF805A00)));

extern volatile uint32_t SPI2CON __attribute__((section("sfrs"), address(0xBF805A00)));
typedef union {
  struct {
    uint32_t SRXISEL:2;
    uint32_t STXISEL:2;
    uint32_t :1;
    uint32_t MSTEN:1;
    uint32_t CKP:1;
    uint32_t SSEN:1;
    uint32_t CKE:1;
    uint32_t SMP:1;
    uint32_t MODE16:1;
    uint32_t MODE32:1;
    uint32_t DISSDO:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
    uint32_t ENHBUF:1;
    uint32_t SPIFE:1;
    uint32_t :6;
    uint32_t FRMCNT:3;
    uint32_t FRMSYPW:1;
    uint32_t MSSEN:1;
    uint32_t FRMPOL:1;
    uint32_t FRMSYNC:1;
    uint32_t FRMEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __SPI2CONbits_t;
extern volatile __SPI2CONbits_t SPI2CONbits __asm__ ("SPI2CON") __attribute__((section("sfrs"), address(0xBF805A00)));
extern volatile uint32_t SPI2ACONCLR __attribute__((section("sfrs"),address(0xBF805A04)));
extern volatile uint32_t SPI2CONCLR __attribute__((section("sfrs"),address(0xBF805A04)));
extern volatile uint32_t SPI2ACONSET __attribute__((section("sfrs"),address(0xBF805A08)));
extern volatile uint32_t SPI2CONSET __attribute__((section("sfrs"),address(0xBF805A08)));
extern volatile uint32_t SPI2ACONINV __attribute__((section("sfrs"),address(0xBF805A0C)));
extern volatile uint32_t SPI2CONINV __attribute__((section("sfrs"),address(0xBF805A0C)));

extern volatile uint32_t SPI2ASTAT __attribute__((section("sfrs"), address(0xBF805A10)));
typedef union {
  struct {
    uint32_t SPIRBF:1;
    uint32_t SPITBF:1;
    uint32_t :1;
    uint32_t SPITBE:1;
    uint32_t :1;
    uint32_t SPIRBE:1;
    uint32_t SPIROV:1;
    uint32_t SRMT:1;
    uint32_t SPITUR:1;
    uint32_t :2;
    uint32_t SPIBUSY:1;
    uint32_t :4;
    uint32_t TXBUFELM:5;
    uint32_t :3;
    uint32_t RXBUFELM:5;
  };
  struct {
    uint32_t w:32;
  };
} __SPI2ASTATbits_t;
extern volatile __SPI2ASTATbits_t SPI2ASTATbits __asm__ ("SPI2ASTAT") __attribute__((section("sfrs"), address(0xBF805A10)));

extern volatile uint32_t SPI2STAT __attribute__((section("sfrs"), address(0xBF805A10)));
typedef union {
  struct {
    uint32_t SPIRBF:1;
    uint32_t SPITBF:1;
    uint32_t :1;
    uint32_t SPITBE:1;
    uint32_t :1;
    uint32_t SPIRBE:1;
    uint32_t SPIROV:1;
    uint32_t SRMT:1;
    uint32_t SPITUR:1;
    uint32_t :2;
    uint32_t SPIBUSY:1;
    uint32_t :4;
    uint32_t TXBUFELM:5;
    uint32_t :3;
    uint32_t RXBUFELM:5;
  };
  struct {
    uint32_t w:32;
  };
} __SPI2STATbits_t;
extern volatile __SPI2STATbits_t SPI2STATbits __asm__ ("SPI2STAT") __attribute__((section("sfrs"), address(0xBF805A10)));
extern volatile uint32_t SPI2ASTATCLR __attribute__((section("sfrs"),address(0xBF805A14)));
extern volatile uint32_t SPI2STATCLR __attribute__((section("sfrs"),address(0xBF805A14)));
extern volatile uint32_t SPI2ASTATSET __attribute__((section("sfrs"),address(0xBF805A18)));
extern volatile uint32_t SPI2STATSET __attribute__((section("sfrs"),address(0xBF805A18)));
extern volatile uint32_t SPI2ASTATINV __attribute__((section("sfrs"),address(0xBF805A1C)));
extern volatile uint32_t SPI2STATINV __attribute__((section("sfrs"),address(0xBF805A1C)));

extern volatile uint32_t SPI2ABUF __attribute__((section("sfrs"), address(0xBF805A20)));

extern volatile uint32_t SPI2BUF __attribute__((section("sfrs"), address(0xBF805A20)));

extern volatile uint32_t SPI2ABRG __attribute__((section("sfrs"), address(0xBF805A30)));

extern volatile uint32_t SPI2BRG __attribute__((section("sfrs"), address(0xBF805A30)));
extern volatile uint32_t SPI2ABRGCLR __attribute__((section("sfrs"),address(0xBF805A34)));
extern volatile uint32_t SPI2BRGCLR __attribute__((section("sfrs"),address(0xBF805A34)));
extern volatile uint32_t SPI2ABRGSET __attribute__((section("sfrs"),address(0xBF805A38)));
extern volatile uint32_t SPI2BRGSET __attribute__((section("sfrs"),address(0xBF805A38)));
extern volatile uint32_t SPI2ABRGINV __attribute__((section("sfrs"),address(0xBF805A3C)));
extern volatile uint32_t SPI2BRGINV __attribute__((section("sfrs"),address(0xBF805A3C)));

extern volatile uint32_t SPI3ACON __attribute__((section("sfrs"), address(0xBF805C00)));
typedef union {
  struct {
    uint32_t SRXISEL:2;
    uint32_t STXISEL:2;
    uint32_t :1;
    uint32_t MSTEN:1;
    uint32_t CKP:1;
    uint32_t SSEN:1;
    uint32_t CKE:1;
    uint32_t SMP:1;
    uint32_t MODE16:1;
    uint32_t MODE32:1;
    uint32_t DISSDO:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
    uint32_t ENHBUF:1;
    uint32_t SPIFE:1;
    uint32_t :6;
    uint32_t FRMCNT:3;
    uint32_t FRMSYPW:1;
    uint32_t MSSEN:1;
    uint32_t FRMPOL:1;
    uint32_t FRMSYNC:1;
    uint32_t FRMEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __SPI3ACONbits_t;
extern volatile __SPI3ACONbits_t SPI3ACONbits __asm__ ("SPI3ACON") __attribute__((section("sfrs"), address(0xBF805C00)));

extern volatile uint32_t SPI4CON __attribute__((section("sfrs"), address(0xBF805C00)));
typedef union {
  struct {
    uint32_t SRXISEL:2;
    uint32_t STXISEL:2;
    uint32_t :1;
    uint32_t MSTEN:1;
    uint32_t CKP:1;
    uint32_t SSEN:1;
    uint32_t CKE:1;
    uint32_t SMP:1;
    uint32_t MODE16:1;
    uint32_t MODE32:1;
    uint32_t DISSDO:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
    uint32_t ENHBUF:1;
    uint32_t SPIFE:1;
    uint32_t :6;
    uint32_t FRMCNT:3;
    uint32_t FRMSYPW:1;
    uint32_t MSSEN:1;
    uint32_t FRMPOL:1;
    uint32_t FRMSYNC:1;
    uint32_t FRMEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __SPI4CONbits_t;
extern volatile __SPI4CONbits_t SPI4CONbits __asm__ ("SPI4CON") __attribute__((section("sfrs"), address(0xBF805C00)));
extern volatile uint32_t SPI3ACONCLR __attribute__((section("sfrs"),address(0xBF805C04)));
extern volatile uint32_t SPI4CONCLR __attribute__((section("sfrs"),address(0xBF805C04)));
extern volatile uint32_t SPI3ACONSET __attribute__((section("sfrs"),address(0xBF805C08)));
extern volatile uint32_t SPI4CONSET __attribute__((section("sfrs"),address(0xBF805C08)));
extern volatile uint32_t SPI3ACONINV __attribute__((section("sfrs"),address(0xBF805C0C)));
extern volatile uint32_t SPI4CONINV __attribute__((section("sfrs"),address(0xBF805C0C)));

extern volatile uint32_t SPI3ASTAT __attribute__((section("sfrs"), address(0xBF805C10)));
typedef union {
  struct {
    uint32_t SPIRBF:1;
    uint32_t SPITBF:1;
    uint32_t :1;
    uint32_t SPITBE:1;
    uint32_t :1;
    uint32_t SPIRBE:1;
    uint32_t SPIROV:1;
    uint32_t SRMT:1;
    uint32_t SPITUR:1;
    uint32_t :2;
    uint32_t SPIBUSY:1;
    uint32_t :4;
    uint32_t TXBUFELM:5;
    uint32_t :3;
    uint32_t RXBUFELM:5;
  };
  struct {
    uint32_t w:32;
  };
} __SPI3ASTATbits_t;
extern volatile __SPI3ASTATbits_t SPI3ASTATbits __asm__ ("SPI3ASTAT") __attribute__((section("sfrs"), address(0xBF805C10)));

extern volatile uint32_t SPI4STAT __attribute__((section("sfrs"), address(0xBF805C10)));
typedef union {
  struct {
    uint32_t SPIRBF:1;
    uint32_t SPITBF:1;
    uint32_t :1;
    uint32_t SPITBE:1;
    uint32_t :1;
    uint32_t SPIRBE:1;
    uint32_t SPIROV:1;
    uint32_t SRMT:1;
    uint32_t SPITUR:1;
    uint32_t :2;
    uint32_t SPIBUSY:1;
    uint32_t :4;
    uint32_t TXBUFELM:5;
    uint32_t :3;
    uint32_t RXBUFELM:5;
  };
  struct {
    uint32_t w:32;
  };
} __SPI4STATbits_t;
extern volatile __SPI4STATbits_t SPI4STATbits __asm__ ("SPI4STAT") __attribute__((section("sfrs"), address(0xBF805C10)));
extern volatile uint32_t SPI3ASTATCLR __attribute__((section("sfrs"),address(0xBF805C14)));
extern volatile uint32_t SPI4STATCLR __attribute__((section("sfrs"),address(0xBF805C14)));
extern volatile uint32_t SPI3ASTATSET __attribute__((section("sfrs"),address(0xBF805C18)));
extern volatile uint32_t SPI4STATSET __attribute__((section("sfrs"),address(0xBF805C18)));
extern volatile uint32_t SPI3ASTATINV __attribute__((section("sfrs"),address(0xBF805C1C)));
extern volatile uint32_t SPI4STATINV __attribute__((section("sfrs"),address(0xBF805C1C)));

extern volatile uint32_t SPI3ABUF __attribute__((section("sfrs"), address(0xBF805C20)));

extern volatile uint32_t SPI4BUF __attribute__((section("sfrs"), address(0xBF805C20)));

extern volatile uint32_t SPI3ABRG __attribute__((section("sfrs"), address(0xBF805C30)));

extern volatile uint32_t SPI4BRG __attribute__((section("sfrs"), address(0xBF805C30)));
extern volatile uint32_t SPI3ABRGCLR __attribute__((section("sfrs"),address(0xBF805C34)));
extern volatile uint32_t SPI4BRGCLR __attribute__((section("sfrs"),address(0xBF805C34)));
extern volatile uint32_t SPI3ABRGSET __attribute__((section("sfrs"),address(0xBF805C38)));
extern volatile uint32_t SPI4BRGSET __attribute__((section("sfrs"),address(0xBF805C38)));
extern volatile uint32_t SPI3ABRGINV __attribute__((section("sfrs"),address(0xBF805C3C)));
extern volatile uint32_t SPI4BRGINV __attribute__((section("sfrs"),address(0xBF805C3C)));

extern volatile uint32_t SPI1CON __attribute__((section("sfrs"), address(0xBF805E00)));
typedef union {
  struct {
    uint32_t SRXISEL:2;
    uint32_t STXISEL:2;
    uint32_t :1;
    uint32_t MSTEN:1;
    uint32_t CKP:1;
    uint32_t SSEN:1;
    uint32_t CKE:1;
    uint32_t SMP:1;
    uint32_t MODE16:1;
    uint32_t MODE32:1;
    uint32_t DISSDO:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
    uint32_t ENHBUF:1;
    uint32_t SPIFE:1;
    uint32_t :6;
    uint32_t FRMCNT:3;
    uint32_t FRMSYPW:1;
    uint32_t MSSEN:1;
    uint32_t FRMPOL:1;
    uint32_t FRMSYNC:1;
    uint32_t FRMEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __SPI1CONbits_t;
extern volatile __SPI1CONbits_t SPI1CONbits __asm__ ("SPI1CON") __attribute__((section("sfrs"), address(0xBF805E00)));
extern volatile uint32_t SPI1CONCLR __attribute__((section("sfrs"),address(0xBF805E04)));
extern volatile uint32_t SPI1CONSET __attribute__((section("sfrs"),address(0xBF805E08)));
extern volatile uint32_t SPI1CONINV __attribute__((section("sfrs"),address(0xBF805E0C)));

extern volatile uint32_t SPI1STAT __attribute__((section("sfrs"), address(0xBF805E10)));
typedef union {
  struct {
    uint32_t SPIRBF:1;
    uint32_t SPITBF:1;
    uint32_t :1;
    uint32_t SPITBE:1;
    uint32_t :1;
    uint32_t SPIRBE:1;
    uint32_t SPIROV:1;
    uint32_t SRMT:1;
    uint32_t SPITUR:1;
    uint32_t :2;
    uint32_t SPIBUSY:1;
    uint32_t :4;
    uint32_t TXBUFELM:5;
    uint32_t :3;
    uint32_t RXBUFELM:5;
  };
  struct {
    uint32_t w:32;
  };
} __SPI1STATbits_t;
extern volatile __SPI1STATbits_t SPI1STATbits __asm__ ("SPI1STAT") __attribute__((section("sfrs"), address(0xBF805E10)));
extern volatile uint32_t SPI1STATCLR __attribute__((section("sfrs"),address(0xBF805E14)));
extern volatile uint32_t SPI1STATSET __attribute__((section("sfrs"),address(0xBF805E18)));
extern volatile uint32_t SPI1STATINV __attribute__((section("sfrs"),address(0xBF805E1C)));

extern volatile uint32_t SPI1BUF __attribute__((section("sfrs"), address(0xBF805E20)));

extern volatile uint32_t SPI1BRG __attribute__((section("sfrs"), address(0xBF805E30)));
extern volatile uint32_t SPI1BRGCLR __attribute__((section("sfrs"),address(0xBF805E34)));
extern volatile uint32_t SPI1BRGSET __attribute__((section("sfrs"),address(0xBF805E38)));
extern volatile uint32_t SPI1BRGINV __attribute__((section("sfrs"),address(0xBF805E3C)));

extern volatile uint32_t U1AMODE __attribute__((section("sfrs"), address(0xBF806000)));
typedef union {
  struct {
    uint32_t STSEL:1;
    uint32_t PDSEL:2;
    uint32_t BRGH:1;
    uint32_t RXINV:1;
    uint32_t ABAUD:1;
    uint32_t LPBACK:1;
    uint32_t WAKE:1;
    uint32_t UEN:2;
    uint32_t :1;
    uint32_t RTSMD:1;
    uint32_t IREN:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :1;
    uint32_t PDSEL0:1;
    uint32_t PDSEL1:1;
    uint32_t :5;
    uint32_t UEN0:1;
    uint32_t UEN1:1;
  };
  struct {
    uint32_t :13;
    uint32_t USIDL:1;
    uint32_t :1;
    uint32_t UARTEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __U1AMODEbits_t;
extern volatile __U1AMODEbits_t U1AMODEbits __asm__ ("U1AMODE") __attribute__((section("sfrs"), address(0xBF806000)));

extern volatile uint32_t U1MODE __attribute__((section("sfrs"), address(0xBF806000)));
typedef union {
  struct {
    uint32_t STSEL:1;
    uint32_t PDSEL:2;
    uint32_t BRGH:1;
    uint32_t RXINV:1;
    uint32_t ABAUD:1;
    uint32_t LPBACK:1;
    uint32_t WAKE:1;
    uint32_t UEN:2;
    uint32_t :1;
    uint32_t RTSMD:1;
    uint32_t IREN:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :1;
    uint32_t PDSEL0:1;
    uint32_t PDSEL1:1;
    uint32_t :5;
    uint32_t UEN0:1;
    uint32_t UEN1:1;
  };
  struct {
    uint32_t :13;
    uint32_t USIDL:1;
    uint32_t :1;
    uint32_t UARTEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __U1MODEbits_t;
extern volatile __U1MODEbits_t U1MODEbits __asm__ ("U1MODE") __attribute__((section("sfrs"), address(0xBF806000)));
extern volatile uint32_t U1AMODECLR __attribute__((section("sfrs"),address(0xBF806004)));
extern volatile uint32_t U1MODECLR __attribute__((section("sfrs"),address(0xBF806004)));
extern volatile uint32_t U1AMODESET __attribute__((section("sfrs"),address(0xBF806008)));
extern volatile uint32_t U1MODESET __attribute__((section("sfrs"),address(0xBF806008)));
extern volatile uint32_t U1AMODEINV __attribute__((section("sfrs"),address(0xBF80600C)));
extern volatile uint32_t U1MODEINV __attribute__((section("sfrs"),address(0xBF80600C)));

extern volatile uint32_t U1ASTA __attribute__((section("sfrs"), address(0xBF806010)));
typedef union {
  struct {
    uint32_t URXDA:1;
    uint32_t OERR:1;
    uint32_t FERR:1;
    uint32_t PERR:1;
    uint32_t RIDLE:1;
    uint32_t ADDEN:1;
    uint32_t URXISEL:2;
    uint32_t TRMT:1;
    uint32_t UTXBF:1;
    uint32_t UTXEN:1;
    uint32_t UTXBRK:1;
    uint32_t URXEN:1;
    uint32_t UTXINV:1;
    uint32_t UTXISEL:2;
    uint32_t ADDR:8;
    uint32_t ADM_EN:1;
  };
  struct {
    uint32_t :6;
    uint32_t URXISEL0:1;
    uint32_t URXISEL1:1;
    uint32_t :6;
    uint32_t UTXISEL0:1;
    uint32_t UTXISEL1:1;
  };
  struct {
    uint32_t :14;
    uint32_t UTXSEL:2;
  };
  struct {
    uint32_t w:32;
  };
} __U1ASTAbits_t;
extern volatile __U1ASTAbits_t U1ASTAbits __asm__ ("U1ASTA") __attribute__((section("sfrs"), address(0xBF806010)));

extern volatile uint32_t U1STA __attribute__((section("sfrs"), address(0xBF806010)));
typedef union {
  struct {
    uint32_t URXDA:1;
    uint32_t OERR:1;
    uint32_t FERR:1;
    uint32_t PERR:1;
    uint32_t RIDLE:1;
    uint32_t ADDEN:1;
    uint32_t URXISEL:2;
    uint32_t TRMT:1;
    uint32_t UTXBF:1;
    uint32_t UTXEN:1;
    uint32_t UTXBRK:1;
    uint32_t URXEN:1;
    uint32_t UTXINV:1;
    uint32_t UTXISEL:2;
    uint32_t ADDR:8;
    uint32_t ADM_EN:1;
  };
  struct {
    uint32_t :6;
    uint32_t URXISEL0:1;
    uint32_t URXISEL1:1;
    uint32_t :6;
    uint32_t UTXISEL0:1;
    uint32_t UTXISEL1:1;
  };
  struct {
    uint32_t :14;
    uint32_t UTXSEL:2;
  };
  struct {
    uint32_t w:32;
  };
} __U1STAbits_t;
extern volatile __U1STAbits_t U1STAbits __asm__ ("U1STA") __attribute__((section("sfrs"), address(0xBF806010)));
extern volatile uint32_t U1ASTACLR __attribute__((section("sfrs"),address(0xBF806014)));
extern volatile uint32_t U1STACLR __attribute__((section("sfrs"),address(0xBF806014)));
extern volatile uint32_t U1ASTASET __attribute__((section("sfrs"),address(0xBF806018)));
extern volatile uint32_t U1STASET __attribute__((section("sfrs"),address(0xBF806018)));
extern volatile uint32_t U1ASTAINV __attribute__((section("sfrs"),address(0xBF80601C)));
extern volatile uint32_t U1STAINV __attribute__((section("sfrs"),address(0xBF80601C)));

extern volatile uint32_t U1ATXREG __attribute__((section("sfrs"), address(0xBF806020)));

extern volatile uint32_t U1TXREG __attribute__((section("sfrs"), address(0xBF806020)));

extern volatile uint32_t U1ARXREG __attribute__((section("sfrs"), address(0xBF806030)));

extern volatile uint32_t U1RXREG __attribute__((section("sfrs"), address(0xBF806030)));

extern volatile uint32_t U1ABRG __attribute__((section("sfrs"), address(0xBF806040)));

extern volatile uint32_t U1BRG __attribute__((section("sfrs"), address(0xBF806040)));
extern volatile uint32_t U1ABRGCLR __attribute__((section("sfrs"),address(0xBF806044)));
extern volatile uint32_t U1BRGCLR __attribute__((section("sfrs"),address(0xBF806044)));
extern volatile uint32_t U1ABRGSET __attribute__((section("sfrs"),address(0xBF806048)));
extern volatile uint32_t U1BRGSET __attribute__((section("sfrs"),address(0xBF806048)));
extern volatile uint32_t U1ABRGINV __attribute__((section("sfrs"),address(0xBF80604C)));
extern volatile uint32_t U1BRGINV __attribute__((section("sfrs"),address(0xBF80604C)));

extern volatile uint32_t U1BMODE __attribute__((section("sfrs"), address(0xBF806200)));
typedef union {
  struct {
    uint32_t STSEL:1;
    uint32_t PDSEL:2;
    uint32_t BRGH:1;
    uint32_t RXINV:1;
    uint32_t ABAUD:1;
    uint32_t LPBACK:1;
    uint32_t WAKE:1;
    uint32_t :4;
    uint32_t IREN:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :1;
    uint32_t PDSEL0:1;
    uint32_t PDSEL1:1;
  };
  struct {
    uint32_t :13;
    uint32_t USIDL:1;
    uint32_t :1;
    uint32_t UARTEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __U1BMODEbits_t;
extern volatile __U1BMODEbits_t U1BMODEbits __asm__ ("U1BMODE") __attribute__((section("sfrs"), address(0xBF806200)));

extern volatile uint32_t U4MODE __attribute__((section("sfrs"), address(0xBF806200)));
typedef union {
  struct {
    uint32_t STSEL:1;
    uint32_t PDSEL:2;
    uint32_t BRGH:1;
    uint32_t RXINV:1;
    uint32_t ABAUD:1;
    uint32_t LPBACK:1;
    uint32_t WAKE:1;
    uint32_t :4;
    uint32_t IREN:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :1;
    uint32_t PDSEL0:1;
    uint32_t PDSEL1:1;
  };
  struct {
    uint32_t :13;
    uint32_t USIDL:1;
    uint32_t :1;
    uint32_t UARTEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __U4MODEbits_t;
extern volatile __U4MODEbits_t U4MODEbits __asm__ ("U4MODE") __attribute__((section("sfrs"), address(0xBF806200)));
extern volatile uint32_t U1BMODECLR __attribute__((section("sfrs"),address(0xBF806204)));
extern volatile uint32_t U4MODECLR __attribute__((section("sfrs"),address(0xBF806204)));
extern volatile uint32_t U1BMODESET __attribute__((section("sfrs"),address(0xBF806208)));
extern volatile uint32_t U4MODESET __attribute__((section("sfrs"),address(0xBF806208)));
extern volatile uint32_t U1BMODEINV __attribute__((section("sfrs"),address(0xBF80620C)));
extern volatile uint32_t U4MODEINV __attribute__((section("sfrs"),address(0xBF80620C)));

extern volatile uint32_t U1BSTA __attribute__((section("sfrs"), address(0xBF806210)));
typedef union {
  struct {
    uint32_t URXDA:1;
    uint32_t OERR:1;
    uint32_t FERR:1;
    uint32_t PERR:1;
    uint32_t RIDLE:1;
    uint32_t ADDEN:1;
    uint32_t URXISEL:2;
    uint32_t TRMT:1;
    uint32_t UTXBF:1;
    uint32_t UTXEN:1;
    uint32_t UTXBRK:1;
    uint32_t URXEN:1;
    uint32_t UTXINV:1;
    uint32_t UTXISEL:2;
    uint32_t ADDR:8;
    uint32_t ADM_EN:1;
  };
  struct {
    uint32_t :6;
    uint32_t URXISEL0:1;
    uint32_t URXISEL1:1;
    uint32_t :6;
    uint32_t UTXISEL0:1;
    uint32_t UTXISEL1:1;
  };
  struct {
    uint32_t :14;
    uint32_t UTXSEL:2;
  };
  struct {
    uint32_t w:32;
  };
} __U1BSTAbits_t;
extern volatile __U1BSTAbits_t U1BSTAbits __asm__ ("U1BSTA") __attribute__((section("sfrs"), address(0xBF806210)));

extern volatile uint32_t U4STA __attribute__((section("sfrs"), address(0xBF806210)));
typedef union {
  struct {
    uint32_t URXDA:1;
    uint32_t OERR:1;
    uint32_t FERR:1;
    uint32_t PERR:1;
    uint32_t RIDLE:1;
    uint32_t ADDEN:1;
    uint32_t URXISEL:2;
    uint32_t TRMT:1;
    uint32_t UTXBF:1;
    uint32_t UTXEN:1;
    uint32_t UTXBRK:1;
    uint32_t URXEN:1;
    uint32_t UTXINV:1;
    uint32_t UTXISEL:2;
    uint32_t ADDR:8;
    uint32_t ADM_EN:1;
  };
  struct {
    uint32_t :6;
    uint32_t URXISEL0:1;
    uint32_t URXISEL1:1;
    uint32_t :6;
    uint32_t UTXISEL0:1;
    uint32_t UTXISEL1:1;
  };
  struct {
    uint32_t :14;
    uint32_t UTXSEL:2;
  };
  struct {
    uint32_t w:32;
  };
} __U4STAbits_t;
extern volatile __U4STAbits_t U4STAbits __asm__ ("U4STA") __attribute__((section("sfrs"), address(0xBF806210)));
extern volatile uint32_t U1BSTACLR __attribute__((section("sfrs"),address(0xBF806214)));
extern volatile uint32_t U4STACLR __attribute__((section("sfrs"),address(0xBF806214)));
extern volatile uint32_t U1BSTASET __attribute__((section("sfrs"),address(0xBF806218)));
extern volatile uint32_t U4STASET __attribute__((section("sfrs"),address(0xBF806218)));
extern volatile uint32_t U1BSTAINV __attribute__((section("sfrs"),address(0xBF80621C)));
extern volatile uint32_t U4STAINV __attribute__((section("sfrs"),address(0xBF80621C)));

extern volatile uint32_t U1BTXREG __attribute__((section("sfrs"), address(0xBF806220)));

extern volatile uint32_t U4TXREG __attribute__((section("sfrs"), address(0xBF806220)));

extern volatile uint32_t U1BRXREG __attribute__((section("sfrs"), address(0xBF806230)));

extern volatile uint32_t U4RXREG __attribute__((section("sfrs"), address(0xBF806230)));

extern volatile uint32_t U1BBRG __attribute__((section("sfrs"), address(0xBF806240)));

extern volatile uint32_t U4BRG __attribute__((section("sfrs"), address(0xBF806240)));
extern volatile uint32_t U1BBRGCLR __attribute__((section("sfrs"),address(0xBF806244)));
extern volatile uint32_t U4BRGCLR __attribute__((section("sfrs"),address(0xBF806244)));
extern volatile uint32_t U1BBRGSET __attribute__((section("sfrs"),address(0xBF806248)));
extern volatile uint32_t U4BRGSET __attribute__((section("sfrs"),address(0xBF806248)));
extern volatile uint32_t U1BBRGINV __attribute__((section("sfrs"),address(0xBF80624C)));
extern volatile uint32_t U4BRGINV __attribute__((section("sfrs"),address(0xBF80624C)));

extern volatile uint32_t U2AMODE __attribute__((section("sfrs"), address(0xBF806400)));
typedef union {
  struct {
    uint32_t STSEL:1;
    uint32_t PDSEL:2;
    uint32_t BRGH:1;
    uint32_t RXINV:1;
    uint32_t ABAUD:1;
    uint32_t LPBACK:1;
    uint32_t WAKE:1;
    uint32_t UEN:2;
    uint32_t :1;
    uint32_t RTSMD:1;
    uint32_t IREN:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :1;
    uint32_t PDSEL0:1;
    uint32_t PDSEL1:1;
    uint32_t :5;
    uint32_t UEN0:1;
    uint32_t UEN1:1;
  };
  struct {
    uint32_t :13;
    uint32_t USIDL:1;
    uint32_t :1;
    uint32_t UARTEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __U2AMODEbits_t;
extern volatile __U2AMODEbits_t U2AMODEbits __asm__ ("U2AMODE") __attribute__((section("sfrs"), address(0xBF806400)));

extern volatile uint32_t U3MODE __attribute__((section("sfrs"), address(0xBF806400)));
typedef union {
  struct {
    uint32_t STSEL:1;
    uint32_t PDSEL:2;
    uint32_t BRGH:1;
    uint32_t RXINV:1;
    uint32_t ABAUD:1;
    uint32_t LPBACK:1;
    uint32_t WAKE:1;
    uint32_t UEN:2;
    uint32_t :1;
    uint32_t RTSMD:1;
    uint32_t IREN:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :1;
    uint32_t PDSEL0:1;
    uint32_t PDSEL1:1;
    uint32_t :5;
    uint32_t UEN0:1;
    uint32_t UEN1:1;
  };
  struct {
    uint32_t :13;
    uint32_t USIDL:1;
    uint32_t :1;
    uint32_t UARTEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __U3MODEbits_t;
extern volatile __U3MODEbits_t U3MODEbits __asm__ ("U3MODE") __attribute__((section("sfrs"), address(0xBF806400)));
extern volatile uint32_t U2AMODECLR __attribute__((section("sfrs"),address(0xBF806404)));
extern volatile uint32_t U3MODECLR __attribute__((section("sfrs"),address(0xBF806404)));
extern volatile uint32_t U2AMODESET __attribute__((section("sfrs"),address(0xBF806408)));
extern volatile uint32_t U3MODESET __attribute__((section("sfrs"),address(0xBF806408)));
extern volatile uint32_t U2AMODEINV __attribute__((section("sfrs"),address(0xBF80640C)));
extern volatile uint32_t U3MODEINV __attribute__((section("sfrs"),address(0xBF80640C)));

extern volatile uint32_t U2ASTA __attribute__((section("sfrs"), address(0xBF806410)));
typedef union {
  struct {
    uint32_t URXDA:1;
    uint32_t OERR:1;
    uint32_t FERR:1;
    uint32_t PERR:1;
    uint32_t RIDLE:1;
    uint32_t ADDEN:1;
    uint32_t URXISEL:2;
    uint32_t TRMT:1;
    uint32_t UTXBF:1;
    uint32_t UTXEN:1;
    uint32_t UTXBRK:1;
    uint32_t URXEN:1;
    uint32_t UTXINV:1;
    uint32_t UTXISEL:2;
    uint32_t ADDR:8;
    uint32_t ADM_EN:1;
  };
  struct {
    uint32_t :6;
    uint32_t URXISEL0:1;
    uint32_t URXISEL1:1;
    uint32_t :6;
    uint32_t UTXISEL0:1;
    uint32_t UTXISEL1:1;
  };
  struct {
    uint32_t :14;
    uint32_t UTXSEL:2;
  };
  struct {
    uint32_t w:32;
  };
} __U2ASTAbits_t;
extern volatile __U2ASTAbits_t U2ASTAbits __asm__ ("U2ASTA") __attribute__((section("sfrs"), address(0xBF806410)));

extern volatile uint32_t U3STA __attribute__((section("sfrs"), address(0xBF806410)));
typedef union {
  struct {
    uint32_t URXDA:1;
    uint32_t OERR:1;
    uint32_t FERR:1;
    uint32_t PERR:1;
    uint32_t RIDLE:1;
    uint32_t ADDEN:1;
    uint32_t URXISEL:2;
    uint32_t TRMT:1;
    uint32_t UTXBF:1;
    uint32_t UTXEN:1;
    uint32_t UTXBRK:1;
    uint32_t URXEN:1;
    uint32_t UTXINV:1;
    uint32_t UTXISEL:2;
    uint32_t ADDR:8;
    uint32_t ADM_EN:1;
  };
  struct {
    uint32_t :6;
    uint32_t URXISEL0:1;
    uint32_t URXISEL1:1;
    uint32_t :6;
    uint32_t UTXISEL0:1;
    uint32_t UTXISEL1:1;
  };
  struct {
    uint32_t :14;
    uint32_t UTXSEL:2;
  };
  struct {
    uint32_t w:32;
  };
} __U3STAbits_t;
extern volatile __U3STAbits_t U3STAbits __asm__ ("U3STA") __attribute__((section("sfrs"), address(0xBF806410)));
extern volatile uint32_t U2ASTACLR __attribute__((section("sfrs"),address(0xBF806414)));
extern volatile uint32_t U3STACLR __attribute__((section("sfrs"),address(0xBF806414)));
extern volatile uint32_t U2ASTASET __attribute__((section("sfrs"),address(0xBF806418)));
extern volatile uint32_t U3STASET __attribute__((section("sfrs"),address(0xBF806418)));
extern volatile uint32_t U2ASTAINV __attribute__((section("sfrs"),address(0xBF80641C)));
extern volatile uint32_t U3STAINV __attribute__((section("sfrs"),address(0xBF80641C)));

extern volatile uint32_t U2ATXREG __attribute__((section("sfrs"), address(0xBF806420)));

extern volatile uint32_t U3TXREG __attribute__((section("sfrs"), address(0xBF806420)));

extern volatile uint32_t U2ARXREG __attribute__((section("sfrs"), address(0xBF806430)));

extern volatile uint32_t U3RXREG __attribute__((section("sfrs"), address(0xBF806430)));

extern volatile uint32_t U2ABRG __attribute__((section("sfrs"), address(0xBF806440)));

extern volatile uint32_t U3BRG __attribute__((section("sfrs"), address(0xBF806440)));
extern volatile uint32_t U2ABRGCLR __attribute__((section("sfrs"),address(0xBF806444)));
extern volatile uint32_t U3BRGCLR __attribute__((section("sfrs"),address(0xBF806444)));
extern volatile uint32_t U2ABRGSET __attribute__((section("sfrs"),address(0xBF806448)));
extern volatile uint32_t U3BRGSET __attribute__((section("sfrs"),address(0xBF806448)));
extern volatile uint32_t U2ABRGINV __attribute__((section("sfrs"),address(0xBF80644C)));
extern volatile uint32_t U3BRGINV __attribute__((section("sfrs"),address(0xBF80644C)));

extern volatile uint32_t U2BMODE __attribute__((section("sfrs"), address(0xBF806600)));
typedef union {
  struct {
    uint32_t STSEL:1;
    uint32_t PDSEL:2;
    uint32_t BRGH:1;
    uint32_t RXINV:1;
    uint32_t ABAUD:1;
    uint32_t LPBACK:1;
    uint32_t WAKE:1;
    uint32_t :4;
    uint32_t IREN:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :1;
    uint32_t PDSEL0:1;
    uint32_t PDSEL1:1;
  };
  struct {
    uint32_t :13;
    uint32_t USIDL:1;
    uint32_t :1;
    uint32_t UARTEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __U2BMODEbits_t;
extern volatile __U2BMODEbits_t U2BMODEbits __asm__ ("U2BMODE") __attribute__((section("sfrs"), address(0xBF806600)));

extern volatile uint32_t U6MODE __attribute__((section("sfrs"), address(0xBF806600)));
typedef union {
  struct {
    uint32_t STSEL:1;
    uint32_t PDSEL:2;
    uint32_t BRGH:1;
    uint32_t RXINV:1;
    uint32_t ABAUD:1;
    uint32_t LPBACK:1;
    uint32_t WAKE:1;
    uint32_t :4;
    uint32_t IREN:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :1;
    uint32_t PDSEL0:1;
    uint32_t PDSEL1:1;
  };
  struct {
    uint32_t :13;
    uint32_t USIDL:1;
    uint32_t :1;
    uint32_t UARTEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __U6MODEbits_t;
extern volatile __U6MODEbits_t U6MODEbits __asm__ ("U6MODE") __attribute__((section("sfrs"), address(0xBF806600)));
extern volatile uint32_t U2BMODECLR __attribute__((section("sfrs"),address(0xBF806604)));
extern volatile uint32_t U6MODECLR __attribute__((section("sfrs"),address(0xBF806604)));
extern volatile uint32_t U2BMODESET __attribute__((section("sfrs"),address(0xBF806608)));
extern volatile uint32_t U6MODESET __attribute__((section("sfrs"),address(0xBF806608)));
extern volatile uint32_t U2BMODEINV __attribute__((section("sfrs"),address(0xBF80660C)));
extern volatile uint32_t U6MODEINV __attribute__((section("sfrs"),address(0xBF80660C)));

extern volatile uint32_t U2BSTA __attribute__((section("sfrs"), address(0xBF806610)));
typedef union {
  struct {
    uint32_t URXDA:1;
    uint32_t OERR:1;
    uint32_t FERR:1;
    uint32_t PERR:1;
    uint32_t RIDLE:1;
    uint32_t ADDEN:1;
    uint32_t URXISEL:2;
    uint32_t TRMT:1;
    uint32_t UTXBF:1;
    uint32_t UTXEN:1;
    uint32_t UTXBRK:1;
    uint32_t URXEN:1;
    uint32_t UTXINV:1;
    uint32_t UTXISEL:2;
    uint32_t ADDR:8;
    uint32_t ADM_EN:1;
  };
  struct {
    uint32_t :6;
    uint32_t URXISEL0:1;
    uint32_t URXISEL1:1;
    uint32_t :6;
    uint32_t UTXISEL0:1;
    uint32_t UTXISEL1:1;
  };
  struct {
    uint32_t :14;
    uint32_t UTXSEL:2;
  };
  struct {
    uint32_t w:32;
  };
} __U2BSTAbits_t;
extern volatile __U2BSTAbits_t U2BSTAbits __asm__ ("U2BSTA") __attribute__((section("sfrs"), address(0xBF806610)));

extern volatile uint32_t U6STA __attribute__((section("sfrs"), address(0xBF806610)));
typedef union {
  struct {
    uint32_t URXDA:1;
    uint32_t OERR:1;
    uint32_t FERR:1;
    uint32_t PERR:1;
    uint32_t RIDLE:1;
    uint32_t ADDEN:1;
    uint32_t URXISEL:2;
    uint32_t TRMT:1;
    uint32_t UTXBF:1;
    uint32_t UTXEN:1;
    uint32_t UTXBRK:1;
    uint32_t URXEN:1;
    uint32_t UTXINV:1;
    uint32_t UTXISEL:2;
    uint32_t ADDR:8;
    uint32_t ADM_EN:1;
  };
  struct {
    uint32_t :6;
    uint32_t URXISEL0:1;
    uint32_t URXISEL1:1;
    uint32_t :6;
    uint32_t UTXISEL0:1;
    uint32_t UTXISEL1:1;
  };
  struct {
    uint32_t :14;
    uint32_t UTXSEL:2;
  };
  struct {
    uint32_t w:32;
  };
} __U6STAbits_t;
extern volatile __U6STAbits_t U6STAbits __asm__ ("U6STA") __attribute__((section("sfrs"), address(0xBF806610)));
extern volatile uint32_t U2BSTACLR __attribute__((section("sfrs"),address(0xBF806614)));
extern volatile uint32_t U6STACLR __attribute__((section("sfrs"),address(0xBF806614)));
extern volatile uint32_t U2BSTASET __attribute__((section("sfrs"),address(0xBF806618)));
extern volatile uint32_t U6STASET __attribute__((section("sfrs"),address(0xBF806618)));
extern volatile uint32_t U2BSTAINV __attribute__((section("sfrs"),address(0xBF80661C)));
extern volatile uint32_t U6STAINV __attribute__((section("sfrs"),address(0xBF80661C)));

extern volatile uint32_t U2BTXREG __attribute__((section("sfrs"), address(0xBF806620)));

extern volatile uint32_t U6TXREG __attribute__((section("sfrs"), address(0xBF806620)));

extern volatile uint32_t U2BRXREG __attribute__((section("sfrs"), address(0xBF806630)));

extern volatile uint32_t U6RXREG __attribute__((section("sfrs"), address(0xBF806630)));

extern volatile uint32_t U2BBRG __attribute__((section("sfrs"), address(0xBF806640)));

extern volatile uint32_t U6BRG __attribute__((section("sfrs"), address(0xBF806640)));
extern volatile uint32_t U2BBRGCLR __attribute__((section("sfrs"),address(0xBF806644)));
extern volatile uint32_t U6BRGCLR __attribute__((section("sfrs"),address(0xBF806644)));
extern volatile uint32_t U2BBRGSET __attribute__((section("sfrs"),address(0xBF806648)));
extern volatile uint32_t U6BRGSET __attribute__((section("sfrs"),address(0xBF806648)));
extern volatile uint32_t U2BBRGINV __attribute__((section("sfrs"),address(0xBF80664C)));
extern volatile uint32_t U6BRGINV __attribute__((section("sfrs"),address(0xBF80664C)));

extern volatile uint32_t U2MODE __attribute__((section("sfrs"), address(0xBF806800)));
typedef union {
  struct {
    uint32_t STSEL:1;
    uint32_t PDSEL:2;
    uint32_t BRGH:1;
    uint32_t RXINV:1;
    uint32_t ABAUD:1;
    uint32_t LPBACK:1;
    uint32_t WAKE:1;
    uint32_t UEN:2;
    uint32_t :1;
    uint32_t RTSMD:1;
    uint32_t IREN:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :1;
    uint32_t PDSEL0:1;
    uint32_t PDSEL1:1;
    uint32_t :5;
    uint32_t UEN0:1;
    uint32_t UEN1:1;
  };
  struct {
    uint32_t :13;
    uint32_t USIDL:1;
    uint32_t :1;
    uint32_t UARTEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __U2MODEbits_t;
extern volatile __U2MODEbits_t U2MODEbits __asm__ ("U2MODE") __attribute__((section("sfrs"), address(0xBF806800)));

extern volatile uint32_t U3AMODE __attribute__((section("sfrs"), address(0xBF806800)));
typedef union {
  struct {
    uint32_t STSEL:1;
    uint32_t PDSEL:2;
    uint32_t BRGH:1;
    uint32_t RXINV:1;
    uint32_t ABAUD:1;
    uint32_t LPBACK:1;
    uint32_t WAKE:1;
    uint32_t UEN:2;
    uint32_t :1;
    uint32_t RTSMD:1;
    uint32_t IREN:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :1;
    uint32_t PDSEL0:1;
    uint32_t PDSEL1:1;
    uint32_t :5;
    uint32_t UEN0:1;
    uint32_t UEN1:1;
  };
  struct {
    uint32_t :13;
    uint32_t USIDL:1;
    uint32_t :1;
    uint32_t UARTEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __U3AMODEbits_t;
extern volatile __U3AMODEbits_t U3AMODEbits __asm__ ("U3AMODE") __attribute__((section("sfrs"), address(0xBF806800)));
extern volatile uint32_t U2MODECLR __attribute__((section("sfrs"),address(0xBF806804)));
extern volatile uint32_t U3AMODECLR __attribute__((section("sfrs"),address(0xBF806804)));
extern volatile uint32_t U2MODESET __attribute__((section("sfrs"),address(0xBF806808)));
extern volatile uint32_t U3AMODESET __attribute__((section("sfrs"),address(0xBF806808)));
extern volatile uint32_t U2MODEINV __attribute__((section("sfrs"),address(0xBF80680C)));
extern volatile uint32_t U3AMODEINV __attribute__((section("sfrs"),address(0xBF80680C)));

extern volatile uint32_t U2STA __attribute__((section("sfrs"), address(0xBF806810)));
typedef union {
  struct {
    uint32_t URXDA:1;
    uint32_t OERR:1;
    uint32_t FERR:1;
    uint32_t PERR:1;
    uint32_t RIDLE:1;
    uint32_t ADDEN:1;
    uint32_t URXISEL:2;
    uint32_t TRMT:1;
    uint32_t UTXBF:1;
    uint32_t UTXEN:1;
    uint32_t UTXBRK:1;
    uint32_t URXEN:1;
    uint32_t UTXINV:1;
    uint32_t UTXISEL:2;
    uint32_t ADDR:8;
    uint32_t ADM_EN:1;
  };
  struct {
    uint32_t :6;
    uint32_t URXISEL0:1;
    uint32_t URXISEL1:1;
    uint32_t :6;
    uint32_t UTXISEL0:1;
    uint32_t UTXISEL1:1;
  };
  struct {
    uint32_t :14;
    uint32_t UTXSEL:2;
  };
  struct {
    uint32_t w:32;
  };
} __U2STAbits_t;
extern volatile __U2STAbits_t U2STAbits __asm__ ("U2STA") __attribute__((section("sfrs"), address(0xBF806810)));

extern volatile uint32_t U3ASTA __attribute__((section("sfrs"), address(0xBF806810)));
typedef union {
  struct {
    uint32_t URXDA:1;
    uint32_t OERR:1;
    uint32_t FERR:1;
    uint32_t PERR:1;
    uint32_t RIDLE:1;
    uint32_t ADDEN:1;
    uint32_t URXISEL:2;
    uint32_t TRMT:1;
    uint32_t UTXBF:1;
    uint32_t UTXEN:1;
    uint32_t UTXBRK:1;
    uint32_t URXEN:1;
    uint32_t UTXINV:1;
    uint32_t UTXISEL:2;
    uint32_t ADDR:8;
    uint32_t ADM_EN:1;
  };
  struct {
    uint32_t :6;
    uint32_t URXISEL0:1;
    uint32_t URXISEL1:1;
    uint32_t :6;
    uint32_t UTXISEL0:1;
    uint32_t UTXISEL1:1;
  };
  struct {
    uint32_t :14;
    uint32_t UTXSEL:2;
  };
  struct {
    uint32_t w:32;
  };
} __U3ASTAbits_t;
extern volatile __U3ASTAbits_t U3ASTAbits __asm__ ("U3ASTA") __attribute__((section("sfrs"), address(0xBF806810)));
extern volatile uint32_t U2STACLR __attribute__((section("sfrs"),address(0xBF806814)));
extern volatile uint32_t U3ASTACLR __attribute__((section("sfrs"),address(0xBF806814)));
extern volatile uint32_t U2STASET __attribute__((section("sfrs"),address(0xBF806818)));
extern volatile uint32_t U3ASTASET __attribute__((section("sfrs"),address(0xBF806818)));
extern volatile uint32_t U2STAINV __attribute__((section("sfrs"),address(0xBF80681C)));
extern volatile uint32_t U3ASTAINV __attribute__((section("sfrs"),address(0xBF80681C)));

extern volatile uint32_t U2TXREG __attribute__((section("sfrs"), address(0xBF806820)));

extern volatile uint32_t U3ATXREG __attribute__((section("sfrs"), address(0xBF806820)));

extern volatile uint32_t U2RXREG __attribute__((section("sfrs"), address(0xBF806830)));

extern volatile uint32_t U3ARXREG __attribute__((section("sfrs"), address(0xBF806830)));

extern volatile uint32_t U2BRG __attribute__((section("sfrs"), address(0xBF806840)));

extern volatile uint32_t U3ABRG __attribute__((section("sfrs"), address(0xBF806840)));
extern volatile uint32_t U2BRGCLR __attribute__((section("sfrs"),address(0xBF806844)));
extern volatile uint32_t U3ABRGCLR __attribute__((section("sfrs"),address(0xBF806844)));
extern volatile uint32_t U2BRGSET __attribute__((section("sfrs"),address(0xBF806848)));
extern volatile uint32_t U3ABRGSET __attribute__((section("sfrs"),address(0xBF806848)));
extern volatile uint32_t U2BRGINV __attribute__((section("sfrs"),address(0xBF80684C)));
extern volatile uint32_t U3ABRGINV __attribute__((section("sfrs"),address(0xBF80684C)));

extern volatile uint32_t U3BMODE __attribute__((section("sfrs"), address(0xBF806A00)));
typedef union {
  struct {
    uint32_t STSEL:1;
    uint32_t PDSEL:2;
    uint32_t BRGH:1;
    uint32_t RXINV:1;
    uint32_t ABAUD:1;
    uint32_t LPBACK:1;
    uint32_t WAKE:1;
    uint32_t :4;
    uint32_t IREN:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :1;
    uint32_t PDSEL0:1;
    uint32_t PDSEL1:1;
  };
  struct {
    uint32_t :13;
    uint32_t USIDL:1;
    uint32_t :1;
    uint32_t UARTEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __U3BMODEbits_t;
extern volatile __U3BMODEbits_t U3BMODEbits __asm__ ("U3BMODE") __attribute__((section("sfrs"), address(0xBF806A00)));

extern volatile uint32_t U5MODE __attribute__((section("sfrs"), address(0xBF806A00)));
typedef union {
  struct {
    uint32_t STSEL:1;
    uint32_t PDSEL:2;
    uint32_t BRGH:1;
    uint32_t RXINV:1;
    uint32_t ABAUD:1;
    uint32_t LPBACK:1;
    uint32_t WAKE:1;
    uint32_t :4;
    uint32_t IREN:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :1;
    uint32_t PDSEL0:1;
    uint32_t PDSEL1:1;
  };
  struct {
    uint32_t :13;
    uint32_t USIDL:1;
    uint32_t :1;
    uint32_t UARTEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __U5MODEbits_t;
extern volatile __U5MODEbits_t U5MODEbits __asm__ ("U5MODE") __attribute__((section("sfrs"), address(0xBF806A00)));
extern volatile uint32_t U3BMODECLR __attribute__((section("sfrs"),address(0xBF806A04)));
extern volatile uint32_t U5MODECLR __attribute__((section("sfrs"),address(0xBF806A04)));
extern volatile uint32_t U3BMODESET __attribute__((section("sfrs"),address(0xBF806A08)));
extern volatile uint32_t U5MODESET __attribute__((section("sfrs"),address(0xBF806A08)));
extern volatile uint32_t U3BMODEINV __attribute__((section("sfrs"),address(0xBF806A0C)));
extern volatile uint32_t U5MODEINV __attribute__((section("sfrs"),address(0xBF806A0C)));

extern volatile uint32_t U3BSTA __attribute__((section("sfrs"), address(0xBF806A10)));
typedef union {
  struct {
    uint32_t URXDA:1;
    uint32_t OERR:1;
    uint32_t FERR:1;
    uint32_t PERR:1;
    uint32_t RIDLE:1;
    uint32_t ADDEN:1;
    uint32_t URXISEL:2;
    uint32_t TRMT:1;
    uint32_t UTXBF:1;
    uint32_t UTXEN:1;
    uint32_t UTXBRK:1;
    uint32_t URXEN:1;
    uint32_t UTXINV:1;
    uint32_t UTXISEL:2;
    uint32_t ADDR:8;
    uint32_t ADM_EN:1;
  };
  struct {
    uint32_t :6;
    uint32_t URXISEL0:1;
    uint32_t URXISEL1:1;
    uint32_t :6;
    uint32_t UTXISEL0:1;
    uint32_t UTXISEL1:1;
  };
  struct {
    uint32_t :14;
    uint32_t UTXSEL:2;
  };
  struct {
    uint32_t w:32;
  };
} __U3BSTAbits_t;
extern volatile __U3BSTAbits_t U3BSTAbits __asm__ ("U3BSTA") __attribute__((section("sfrs"), address(0xBF806A10)));

extern volatile uint32_t U5STA __attribute__((section("sfrs"), address(0xBF806A10)));
typedef union {
  struct {
    uint32_t URXDA:1;
    uint32_t OERR:1;
    uint32_t FERR:1;
    uint32_t PERR:1;
    uint32_t RIDLE:1;
    uint32_t ADDEN:1;
    uint32_t URXISEL:2;
    uint32_t TRMT:1;
    uint32_t UTXBF:1;
    uint32_t UTXEN:1;
    uint32_t UTXBRK:1;
    uint32_t URXEN:1;
    uint32_t UTXINV:1;
    uint32_t UTXISEL:2;
    uint32_t ADDR:8;
    uint32_t ADM_EN:1;
  };
  struct {
    uint32_t :6;
    uint32_t URXISEL0:1;
    uint32_t URXISEL1:1;
    uint32_t :6;
    uint32_t UTXISEL0:1;
    uint32_t UTXISEL1:1;
  };
  struct {
    uint32_t :14;
    uint32_t UTXSEL:2;
  };
  struct {
    uint32_t w:32;
  };
} __U5STAbits_t;
extern volatile __U5STAbits_t U5STAbits __asm__ ("U5STA") __attribute__((section("sfrs"), address(0xBF806A10)));
extern volatile uint32_t U3BSTACLR __attribute__((section("sfrs"),address(0xBF806A14)));
extern volatile uint32_t U5STACLR __attribute__((section("sfrs"),address(0xBF806A14)));
extern volatile uint32_t U3BSTASET __attribute__((section("sfrs"),address(0xBF806A18)));
extern volatile uint32_t U5STASET __attribute__((section("sfrs"),address(0xBF806A18)));
extern volatile uint32_t U3BSTAINV __attribute__((section("sfrs"),address(0xBF806A1C)));
extern volatile uint32_t U5STAINV __attribute__((section("sfrs"),address(0xBF806A1C)));

extern volatile uint32_t U3BTXREG __attribute__((section("sfrs"), address(0xBF806A20)));

extern volatile uint32_t U5TXREG __attribute__((section("sfrs"), address(0xBF806A20)));

extern volatile uint32_t U3BRXREG __attribute__((section("sfrs"), address(0xBF806A30)));

extern volatile uint32_t U5RXREG __attribute__((section("sfrs"), address(0xBF806A30)));

extern volatile uint32_t U3BBRG __attribute__((section("sfrs"), address(0xBF806A40)));

extern volatile uint32_t U5BRG __attribute__((section("sfrs"), address(0xBF806A40)));
extern volatile uint32_t U3BBRGCLR __attribute__((section("sfrs"),address(0xBF806A44)));
extern volatile uint32_t U5BRGCLR __attribute__((section("sfrs"),address(0xBF806A44)));
extern volatile uint32_t U3BBRGSET __attribute__((section("sfrs"),address(0xBF806A48)));
extern volatile uint32_t U5BRGSET __attribute__((section("sfrs"),address(0xBF806A48)));
extern volatile uint32_t U3BBRGINV __attribute__((section("sfrs"),address(0xBF806A4C)));
extern volatile uint32_t U5BRGINV __attribute__((section("sfrs"),address(0xBF806A4C)));

extern volatile uint32_t PMCON __attribute__((section("sfrs"), address(0xBF807000)));
typedef union {
  struct {
    uint32_t RDSP:1;
    uint32_t WRSP:1;
    uint32_t :1;
    uint32_t CS1P:1;
    uint32_t CS2P:1;
    uint32_t ALP:1;
    uint32_t CSF:2;
    uint32_t PTRDEN:1;
    uint32_t PTWREN:1;
    uint32_t PMPTTL:1;
    uint32_t ADRMUX:2;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :6;
    uint32_t CSF0:1;
    uint32_t CSF1:1;
    uint32_t :3;
    uint32_t ADRMUX0:1;
    uint32_t ADRMUX1:1;
  };
  struct {
    uint32_t :13;
    uint32_t PSIDL:1;
    uint32_t :1;
    uint32_t PMPEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __PMCONbits_t;
extern volatile __PMCONbits_t PMCONbits __asm__ ("PMCON") __attribute__((section("sfrs"), address(0xBF807000)));
extern volatile uint32_t PMCONCLR __attribute__((section("sfrs"),address(0xBF807004)));
extern volatile uint32_t PMCONSET __attribute__((section("sfrs"),address(0xBF807008)));
extern volatile uint32_t PMCONINV __attribute__((section("sfrs"),address(0xBF80700C)));

extern volatile uint32_t PMMODE __attribute__((section("sfrs"), address(0xBF807010)));
typedef union {
  struct {
    uint32_t WAITE:2;
    uint32_t WAITM:4;
    uint32_t WAITB:2;
    uint32_t MODE:2;
    uint32_t MODE16:1;
    uint32_t INCM:2;
    uint32_t IRQM:2;
    uint32_t BUSY:1;
  };
  struct {
    uint32_t WAITE0:1;
    uint32_t WAITE1:1;
    uint32_t WAITM0:1;
    uint32_t WAITM1:1;
    uint32_t WAITM2:1;
    uint32_t WAITM3:1;
    uint32_t WAITB0:1;
    uint32_t WAITB1:1;
    uint32_t MODE0:1;
    uint32_t MODE1:1;
    uint32_t :1;
    uint32_t INCM0:1;
    uint32_t INCM1:1;
    uint32_t IRQM0:1;
    uint32_t IRQM1:1;
  };
  struct {
    uint32_t w:32;
  };
} __PMMODEbits_t;
extern volatile __PMMODEbits_t PMMODEbits __asm__ ("PMMODE") __attribute__((section("sfrs"), address(0xBF807010)));
extern volatile uint32_t PMMODECLR __attribute__((section("sfrs"),address(0xBF807014)));
extern volatile uint32_t PMMODESET __attribute__((section("sfrs"),address(0xBF807018)));
extern volatile uint32_t PMMODEINV __attribute__((section("sfrs"),address(0xBF80701C)));

extern volatile uint32_t PMADDR __attribute__((section("sfrs"), address(0xBF807020)));
typedef union {
  struct {
    uint32_t ADDR:14;
    uint32_t CS:2;
  };
  struct {
    uint32_t PADDR:14;
  };
  struct {
    uint32_t :14;
    uint32_t CS1:1;
    uint32_t CS2:1;
  };
  struct {
    uint32_t w:32;
  };
} __PMADDRbits_t;
extern volatile __PMADDRbits_t PMADDRbits __asm__ ("PMADDR") __attribute__((section("sfrs"), address(0xBF807020)));
extern volatile uint32_t PMADDRCLR __attribute__((section("sfrs"),address(0xBF807024)));
extern volatile uint32_t PMADDRSET __attribute__((section("sfrs"),address(0xBF807028)));
extern volatile uint32_t PMADDRINV __attribute__((section("sfrs"),address(0xBF80702C)));

extern volatile uint32_t PMDOUT __attribute__((section("sfrs"), address(0xBF807030)));
typedef union {
  struct {
    uint32_t DATAOUT:32;
  };
  struct {
    uint32_t w:32;
  };
} __PMDOUTbits_t;
extern volatile __PMDOUTbits_t PMDOUTbits __asm__ ("PMDOUT") __attribute__((section("sfrs"), address(0xBF807030)));
extern volatile uint32_t PMDOUTCLR __attribute__((section("sfrs"),address(0xBF807034)));
extern volatile uint32_t PMDOUTSET __attribute__((section("sfrs"),address(0xBF807038)));
extern volatile uint32_t PMDOUTINV __attribute__((section("sfrs"),address(0xBF80703C)));

extern volatile uint32_t PMDIN __attribute__((section("sfrs"), address(0xBF807040)));
typedef union {
  struct {
    uint32_t DATAIN:32;
  };
  struct {
    uint32_t w:32;
  };
} __PMDINbits_t;
extern volatile __PMDINbits_t PMDINbits __asm__ ("PMDIN") __attribute__((section("sfrs"), address(0xBF807040)));
extern volatile uint32_t PMDINCLR __attribute__((section("sfrs"),address(0xBF807044)));
extern volatile uint32_t PMDINSET __attribute__((section("sfrs"),address(0xBF807048)));
extern volatile uint32_t PMDININV __attribute__((section("sfrs"),address(0xBF80704C)));

extern volatile uint32_t PMAEN __attribute__((section("sfrs"), address(0xBF807050)));
typedef union {
  struct {
    uint32_t PTEN:16;
  };
  struct {
    uint32_t PTEN0:1;
    uint32_t PTEN1:1;
    uint32_t PTEN2:1;
    uint32_t PTEN3:1;
    uint32_t PTEN4:1;
    uint32_t PTEN5:1;
    uint32_t PTEN6:1;
    uint32_t PTEN7:1;
    uint32_t PTEN8:1;
    uint32_t PTEN9:1;
    uint32_t PTEN10:1;
    uint32_t PTEN11:1;
    uint32_t PTEN12:1;
    uint32_t PTEN13:1;
    uint32_t PTEN14:1;
    uint32_t PTEN15:1;
  };
  struct {
    uint32_t w:32;
  };
} __PMAENbits_t;
extern volatile __PMAENbits_t PMAENbits __asm__ ("PMAEN") __attribute__((section("sfrs"), address(0xBF807050)));
extern volatile uint32_t PMAENCLR __attribute__((section("sfrs"),address(0xBF807054)));
extern volatile uint32_t PMAENSET __attribute__((section("sfrs"),address(0xBF807058)));
extern volatile uint32_t PMAENINV __attribute__((section("sfrs"),address(0xBF80705C)));

extern volatile uint32_t PMSTAT __attribute__((section("sfrs"), address(0xBF807060)));
typedef union {
  struct {
    uint32_t OB0E:1;
    uint32_t OB1E:1;
    uint32_t OB2E:1;
    uint32_t OB3E:1;
    uint32_t :2;
    uint32_t OBUF:1;
    uint32_t OBE:1;
    uint32_t IB0F:1;
    uint32_t IB1F:1;
    uint32_t IB2F:1;
    uint32_t IB3F:1;
    uint32_t :2;
    uint32_t IBOV:1;
    uint32_t IBF:1;
  };
  struct {
    uint32_t w:32;
  };
} __PMSTATbits_t;
extern volatile __PMSTATbits_t PMSTATbits __asm__ ("PMSTAT") __attribute__((section("sfrs"), address(0xBF807060)));
extern volatile uint32_t PMSTATCLR __attribute__((section("sfrs"),address(0xBF807064)));
extern volatile uint32_t PMSTATSET __attribute__((section("sfrs"),address(0xBF807068)));
extern volatile uint32_t PMSTATINV __attribute__((section("sfrs"),address(0xBF80706C)));

extern volatile uint32_t AD1CON1 __attribute__((section("sfrs"), address(0xBF809000)));
typedef union {
  struct {
    uint32_t DONE:1;
    uint32_t SAMP:1;
    uint32_t ASAM:1;
    uint32_t :1;
    uint32_t CLRASAM:1;
    uint32_t SSRC:3;
    uint32_t FORM:3;
    uint32_t :2;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t :5;
    uint32_t SSRC0:1;
    uint32_t SSRC1:1;
    uint32_t SSRC2:1;
    uint32_t FORM0:1;
    uint32_t FORM1:1;
    uint32_t FORM2:1;
  };
  struct {
    uint32_t :13;
    uint32_t ADSIDL:1;
    uint32_t :1;
    uint32_t ADON:1;
  };
  struct {
    uint32_t w:32;
  };
} __AD1CON1bits_t;
extern volatile __AD1CON1bits_t AD1CON1bits __asm__ ("AD1CON1") __attribute__((section("sfrs"), address(0xBF809000)));
extern volatile uint32_t AD1CON1CLR __attribute__((section("sfrs"),address(0xBF809004)));
extern volatile uint32_t AD1CON1SET __attribute__((section("sfrs"),address(0xBF809008)));
extern volatile uint32_t AD1CON1INV __attribute__((section("sfrs"),address(0xBF80900C)));

extern volatile uint32_t AD1CON2 __attribute__((section("sfrs"), address(0xBF809010)));
typedef union {
  struct {
    uint32_t ALTS:1;
    uint32_t BUFM:1;
    uint32_t SMPI:4;
    uint32_t :1;
    uint32_t BUFS:1;
    uint32_t :2;
    uint32_t CSCNA:1;
    uint32_t :1;
    uint32_t OFFCAL:1;
    uint32_t VCFG:3;
  };
  struct {
    uint32_t :2;
    uint32_t SMPI0:1;
    uint32_t SMPI1:1;
    uint32_t SMPI2:1;
    uint32_t SMPI3:1;
    uint32_t :7;
    uint32_t VCFG0:1;
    uint32_t VCFG1:1;
    uint32_t VCFG2:1;
  };
  struct {
    uint32_t w:32;
  };
} __AD1CON2bits_t;
extern volatile __AD1CON2bits_t AD1CON2bits __asm__ ("AD1CON2") __attribute__((section("sfrs"), address(0xBF809010)));
extern volatile uint32_t AD1CON2CLR __attribute__((section("sfrs"),address(0xBF809014)));
extern volatile uint32_t AD1CON2SET __attribute__((section("sfrs"),address(0xBF809018)));
extern volatile uint32_t AD1CON2INV __attribute__((section("sfrs"),address(0xBF80901C)));

extern volatile uint32_t AD1CON3 __attribute__((section("sfrs"), address(0xBF809020)));
typedef union {
  struct {
    uint32_t ADCS:8;
    uint32_t SAMC:5;
    uint32_t :2;
    uint32_t ADRC:1;
  };
  struct {
    uint32_t ADCS0:1;
    uint32_t ADCS1:1;
    uint32_t ADCS2:1;
    uint32_t ADCS3:1;
    uint32_t ADCS4:1;
    uint32_t ADCS5:1;
    uint32_t ADCS6:1;
    uint32_t ADCS7:1;
    uint32_t SAMC0:1;
    uint32_t SAMC1:1;
    uint32_t SAMC2:1;
    uint32_t SAMC3:1;
    uint32_t SAMC4:1;
  };
  struct {
    uint32_t w:32;
  };
} __AD1CON3bits_t;
extern volatile __AD1CON3bits_t AD1CON3bits __asm__ ("AD1CON3") __attribute__((section("sfrs"), address(0xBF809020)));
extern volatile uint32_t AD1CON3CLR __attribute__((section("sfrs"),address(0xBF809024)));
extern volatile uint32_t AD1CON3SET __attribute__((section("sfrs"),address(0xBF809028)));
extern volatile uint32_t AD1CON3INV __attribute__((section("sfrs"),address(0xBF80902C)));

extern volatile uint32_t AD1CHS __attribute__((section("sfrs"), address(0xBF809040)));
typedef union {
  struct {
    uint32_t :16;
    uint32_t CH0SA:4;
    uint32_t :3;
    uint32_t CH0NA:1;
    uint32_t CH0SB:4;
    uint32_t :3;
    uint32_t CH0NB:1;
  };
  struct {
    uint32_t :16;
    uint32_t CH0SA0:1;
    uint32_t CH0SA1:1;
    uint32_t CH0SA2:1;
    uint32_t CH0SA3:1;
    uint32_t :4;
    uint32_t CH0SB0:1;
    uint32_t CH0SB1:1;
    uint32_t CH0SB2:1;
    uint32_t CH0SB3:1;
  };
  struct {
    uint32_t w:32;
  };
} __AD1CHSbits_t;
extern volatile __AD1CHSbits_t AD1CHSbits __asm__ ("AD1CHS") __attribute__((section("sfrs"), address(0xBF809040)));
extern volatile uint32_t AD1CHSCLR __attribute__((section("sfrs"),address(0xBF809044)));
extern volatile uint32_t AD1CHSSET __attribute__((section("sfrs"),address(0xBF809048)));
extern volatile uint32_t AD1CHSINV __attribute__((section("sfrs"),address(0xBF80904C)));

extern volatile uint32_t AD1CSSL __attribute__((section("sfrs"), address(0xBF809050)));
typedef union {
  struct {
    uint32_t CSSL:16;
  };
  struct {
    uint32_t CSSL0:1;
    uint32_t CSSL1:1;
    uint32_t CSSL2:1;
    uint32_t CSSL3:1;
    uint32_t CSSL4:1;
    uint32_t CSSL5:1;
    uint32_t CSSL6:1;
    uint32_t CSSL7:1;
    uint32_t CSSL8:1;
    uint32_t CSSL9:1;
    uint32_t CSSL10:1;
    uint32_t CSSL11:1;
    uint32_t CSSL12:1;
    uint32_t CSSL13:1;
    uint32_t CSSL14:1;
    uint32_t CSSL15:1;
  };
  struct {
    uint32_t w:32;
  };
} __AD1CSSLbits_t;
extern volatile __AD1CSSLbits_t AD1CSSLbits __asm__ ("AD1CSSL") __attribute__((section("sfrs"), address(0xBF809050)));
extern volatile uint32_t AD1CSSLCLR __attribute__((section("sfrs"),address(0xBF809054)));
extern volatile uint32_t AD1CSSLSET __attribute__((section("sfrs"),address(0xBF809058)));
extern volatile uint32_t AD1CSSLINV __attribute__((section("sfrs"),address(0xBF80905C)));

extern volatile uint32_t AD1PCFG __attribute__((section("sfrs"), address(0xBF809060)));
typedef union {
  struct {
    uint32_t PCFG:16;
  };
  struct {
    uint32_t PCFG0:1;
    uint32_t PCFG1:1;
    uint32_t PCFG2:1;
    uint32_t PCFG3:1;
    uint32_t PCFG4:1;
    uint32_t PCFG5:1;
    uint32_t PCFG6:1;
    uint32_t PCFG7:1;
    uint32_t PCFG8:1;
    uint32_t PCFG9:1;
    uint32_t PCFG10:1;
    uint32_t PCFG11:1;
    uint32_t PCFG12:1;
    uint32_t PCFG13:1;
    uint32_t PCFG14:1;
    uint32_t PCFG15:1;
  };
  struct {
    uint32_t w:32;
  };
} __AD1PCFGbits_t;
extern volatile __AD1PCFGbits_t AD1PCFGbits __asm__ ("AD1PCFG") __attribute__((section("sfrs"), address(0xBF809060)));
extern volatile uint32_t AD1PCFGCLR __attribute__((section("sfrs"),address(0xBF809064)));
extern volatile uint32_t AD1PCFGSET __attribute__((section("sfrs"),address(0xBF809068)));
extern volatile uint32_t AD1PCFGINV __attribute__((section("sfrs"),address(0xBF80906C)));

extern volatile uint32_t ADC1BUF0 __attribute__((section("sfrs"), address(0xBF809070)));

extern volatile uint32_t ADC1BUF1 __attribute__((section("sfrs"), address(0xBF809080)));

extern volatile uint32_t ADC1BUF2 __attribute__((section("sfrs"), address(0xBF809090)));

extern volatile uint32_t ADC1BUF3 __attribute__((section("sfrs"), address(0xBF8090A0)));

extern volatile uint32_t ADC1BUF4 __attribute__((section("sfrs"), address(0xBF8090B0)));

extern volatile uint32_t ADC1BUF5 __attribute__((section("sfrs"), address(0xBF8090C0)));

extern volatile uint32_t ADC1BUF6 __attribute__((section("sfrs"), address(0xBF8090D0)));

extern volatile uint32_t ADC1BUF7 __attribute__((section("sfrs"), address(0xBF8090E0)));

extern volatile uint32_t ADC1BUF8 __attribute__((section("sfrs"), address(0xBF8090F0)));

extern volatile uint32_t ADC1BUF9 __attribute__((section("sfrs"), address(0xBF809100)));

extern volatile uint32_t ADC1BUFA __attribute__((section("sfrs"), address(0xBF809110)));

extern volatile uint32_t ADC1BUFB __attribute__((section("sfrs"), address(0xBF809120)));

extern volatile uint32_t ADC1BUFC __attribute__((section("sfrs"), address(0xBF809130)));

extern volatile uint32_t ADC1BUFD __attribute__((section("sfrs"), address(0xBF809140)));

extern volatile uint32_t ADC1BUFE __attribute__((section("sfrs"), address(0xBF809150)));

extern volatile uint32_t ADC1BUFF __attribute__((section("sfrs"), address(0xBF809160)));

extern volatile uint32_t CVRCON __attribute__((section("sfrs"), address(0xBF809800)));
typedef union {
  struct {
    uint32_t CVR:4;
    uint32_t CVRSS:1;
    uint32_t CVRR:1;
    uint32_t CVROE:1;
    uint32_t :8;
    uint32_t ON:1;
  };
  struct {
    uint32_t CVR0:1;
    uint32_t CVR1:1;
    uint32_t CVR2:1;
    uint32_t CVR3:1;
  };
  struct {
    uint32_t w:32;
  };
} __CVRCONbits_t;
extern volatile __CVRCONbits_t CVRCONbits __asm__ ("CVRCON") __attribute__((section("sfrs"), address(0xBF809800)));
extern volatile uint32_t CVRCONCLR __attribute__((section("sfrs"),address(0xBF809804)));
extern volatile uint32_t CVRCONSET __attribute__((section("sfrs"),address(0xBF809808)));
extern volatile uint32_t CVRCONINV __attribute__((section("sfrs"),address(0xBF80980C)));

extern volatile uint32_t CM1CON __attribute__((section("sfrs"), address(0xBF80A000)));
typedef union {
  struct {
    uint32_t CCH:2;
    uint32_t :2;
    uint32_t CREF:1;
    uint32_t :1;
    uint32_t EVPOL:2;
    uint32_t COUT:1;
    uint32_t :4;
    uint32_t CPOL:1;
    uint32_t COE:1;
    uint32_t ON:1;
  };
  struct {
    uint32_t CCH0:1;
    uint32_t CCH1:1;
    uint32_t :4;
    uint32_t EVPOL0:1;
    uint32_t EVPOL1:1;
  };
  struct {
    uint32_t w:32;
  };
} __CM1CONbits_t;
extern volatile __CM1CONbits_t CM1CONbits __asm__ ("CM1CON") __attribute__((section("sfrs"), address(0xBF80A000)));
extern volatile uint32_t CM1CONCLR __attribute__((section("sfrs"),address(0xBF80A004)));
extern volatile uint32_t CM1CONSET __attribute__((section("sfrs"),address(0xBF80A008)));
extern volatile uint32_t CM1CONINV __attribute__((section("sfrs"),address(0xBF80A00C)));

extern volatile uint32_t CM2CON __attribute__((section("sfrs"), address(0xBF80A010)));
typedef union {
  struct {
    uint32_t CCH:2;
    uint32_t :2;
    uint32_t CREF:1;
    uint32_t :1;
    uint32_t EVPOL:2;
    uint32_t COUT:1;
    uint32_t :4;
    uint32_t CPOL:1;
    uint32_t COE:1;
    uint32_t ON:1;
  };
  struct {
    uint32_t CCH0:1;
    uint32_t CCH1:1;
    uint32_t :4;
    uint32_t EVPOL0:1;
    uint32_t EVPOL1:1;
  };
  struct {
    uint32_t w:32;
  };
} __CM2CONbits_t;
extern volatile __CM2CONbits_t CM2CONbits __asm__ ("CM2CON") __attribute__((section("sfrs"), address(0xBF80A010)));
extern volatile uint32_t CM2CONCLR __attribute__((section("sfrs"),address(0xBF80A014)));
extern volatile uint32_t CM2CONSET __attribute__((section("sfrs"),address(0xBF80A018)));
extern volatile uint32_t CM2CONINV __attribute__((section("sfrs"),address(0xBF80A01C)));

extern volatile uint32_t CMSTAT __attribute__((section("sfrs"), address(0xBF80A060)));
typedef union {
  struct {
    uint32_t C1OUT:1;
    uint32_t C2OUT:1;
    uint32_t :11;
    uint32_t SIDL:1;
  };
  struct {
    uint32_t w:32;
  };
} __CMSTATbits_t;
extern volatile __CMSTATbits_t CMSTATbits __asm__ ("CMSTAT") __attribute__((section("sfrs"), address(0xBF80A060)));
extern volatile uint32_t CMSTATCLR __attribute__((section("sfrs"),address(0xBF80A064)));
extern volatile uint32_t CMSTATSET __attribute__((section("sfrs"),address(0xBF80A068)));
extern volatile uint32_t CMSTATINV __attribute__((section("sfrs"),address(0xBF80A06C)));

extern volatile uint32_t OSCCON __attribute__((section("sfrs"), address(0xBF80F000)));
typedef union {
  struct {
    uint32_t OSWEN:1;
    uint32_t SOSCEN:1;
    uint32_t UFRCEN:1;
    uint32_t CF:1;
    uint32_t SLPEN:1;
    uint32_t SLOCK:1;
    uint32_t ULOCK:1;
    uint32_t CLKLOCK:1;
    uint32_t NOSC:3;
    uint32_t :1;
    uint32_t COSC:3;
    uint32_t :1;
    uint32_t PLLMULT:3;
    uint32_t PBDIV:2;
    uint32_t :1;
    uint32_t SOSCRDY:1;
    uint32_t :1;
    uint32_t FRCDIV:3;
    uint32_t PLLODIV:3;
  };
  struct {
    uint32_t :8;
    uint32_t NOSC0:1;
    uint32_t NOSC1:1;
    uint32_t NOSC2:1;
    uint32_t :1;
    uint32_t COSC0:1;
    uint32_t COSC1:1;
    uint32_t COSC2:1;
    uint32_t :1;
    uint32_t PLLMULT0:1;
    uint32_t PLLMULT1:1;
    uint32_t PLLMULT2:1;
    uint32_t PBDIV0:1;
    uint32_t PBDIV1:1;
    uint32_t :3;
    uint32_t FRCDIV0:1;
    uint32_t FRCDIV1:1;
    uint32_t FRCDIV2:1;
    uint32_t PLLODIV0:1;
    uint32_t PLLODIV1:1;
    uint32_t PLLODIV2:1;
  };
  struct {
    uint32_t w:32;
  };
} __OSCCONbits_t;
extern volatile __OSCCONbits_t OSCCONbits __asm__ ("OSCCON") __attribute__((section("sfrs"), address(0xBF80F000)));
extern volatile uint32_t OSCCONCLR __attribute__((section("sfrs"),address(0xBF80F004)));
extern volatile uint32_t OSCCONSET __attribute__((section("sfrs"),address(0xBF80F008)));
extern volatile uint32_t OSCCONINV __attribute__((section("sfrs"),address(0xBF80F00C)));

extern volatile uint32_t OSCTUN __attribute__((section("sfrs"), address(0xBF80F010)));
typedef union {
  struct {
    uint32_t TUN:6;
  };
  struct {
    uint32_t TUN0:1;
    uint32_t TUN1:1;
    uint32_t TUN2:1;
    uint32_t TUN3:1;
    uint32_t TUN4:1;
    uint32_t TUN5:1;
  };
  struct {
    uint32_t w:32;
  };
} __OSCTUNbits_t;
extern volatile __OSCTUNbits_t OSCTUNbits __asm__ ("OSCTUN") __attribute__((section("sfrs"), address(0xBF80F010)));
extern volatile uint32_t OSCTUNCLR __attribute__((section("sfrs"),address(0xBF80F014)));
extern volatile uint32_t OSCTUNSET __attribute__((section("sfrs"),address(0xBF80F018)));
extern volatile uint32_t OSCTUNINV __attribute__((section("sfrs"),address(0xBF80F01C)));

extern volatile uint32_t DDPCON __attribute__((section("sfrs"), address(0xBF80F200)));
typedef struct {
  uint32_t TDOEN:1;
  uint32_t :1;
  uint32_t TROEN:1;
  uint32_t JTAGEN:1;
} __DDPCONbits_t;
extern volatile __DDPCONbits_t DDPCONbits __asm__ ("DDPCON") __attribute__((section("sfrs"), address(0xBF80F200)));

extern volatile uint32_t DEVID __attribute__((section("sfrs"), address(0xBF80F220)));
typedef struct {
  uint32_t DEVID:28;
  uint32_t VER:4;
} __DEVIDbits_t;
extern volatile __DEVIDbits_t DEVIDbits __asm__ ("DEVID") __attribute__((section("sfrs"), address(0xBF80F220)));

extern volatile uint32_t SYSKEY __attribute__((section("sfrs"), address(0xBF80F230)));
extern volatile uint32_t SYSKEYCLR __attribute__((section("sfrs"),address(0xBF80F234)));
extern volatile uint32_t SYSKEYSET __attribute__((section("sfrs"),address(0xBF80F238)));
extern volatile uint32_t SYSKEYINV __attribute__((section("sfrs"),address(0xBF80F23C)));

extern volatile uint32_t NVMCON __attribute__((section("sfrs"), address(0xBF80F400)));
typedef union {
  struct {
    uint32_t NVMOP:4;
    uint32_t :7;
    uint32_t LVDSTAT:1;
    uint32_t LVDERR:1;
    uint32_t WRERR:1;
    uint32_t WREN:1;
    uint32_t WR:1;
  };
  struct {
    uint32_t NVMOP0:1;
    uint32_t NVMOP1:1;
    uint32_t NVMOP2:1;
    uint32_t NVMOP3:1;
  };
  struct {
    uint32_t PROGOP:4;
  };
  struct {
    uint32_t PROGOP0:1;
    uint32_t PROGOP1:1;
    uint32_t PROGOP2:1;
    uint32_t PROGOP3:1;
  };
  struct {
    uint32_t w:32;
  };
} __NVMCONbits_t;
extern volatile __NVMCONbits_t NVMCONbits __asm__ ("NVMCON") __attribute__((section("sfrs"), address(0xBF80F400)));
extern volatile uint32_t NVMCONCLR __attribute__((section("sfrs"),address(0xBF80F404)));
extern volatile uint32_t NVMCONSET __attribute__((section("sfrs"),address(0xBF80F408)));
extern volatile uint32_t NVMCONINV __attribute__((section("sfrs"),address(0xBF80F40C)));

extern volatile uint32_t NVMKEY __attribute__((section("sfrs"), address(0xBF80F410)));

extern volatile uint32_t NVMADDR __attribute__((section("sfrs"), address(0xBF80F420)));
extern volatile uint32_t NVMADDRCLR __attribute__((section("sfrs"),address(0xBF80F424)));
extern volatile uint32_t NVMADDRSET __attribute__((section("sfrs"),address(0xBF80F428)));
extern volatile uint32_t NVMADDRINV __attribute__((section("sfrs"),address(0xBF80F42C)));

extern volatile uint32_t NVMDATA __attribute__((section("sfrs"), address(0xBF80F430)));

extern volatile uint32_t NVMSRCADDR __attribute__((section("sfrs"), address(0xBF80F440)));

extern volatile uint32_t RCON __attribute__((section("sfrs"), address(0xBF80F600)));
typedef union {
  struct {
    uint32_t POR:1;
    uint32_t BOR:1;
    uint32_t IDLE:1;
    uint32_t SLEEP:1;
    uint32_t WDTO:1;
    uint32_t :1;
    uint32_t SWR:1;
    uint32_t EXTR:1;
    uint32_t VREGS:1;
    uint32_t CMR:1;
  };
  struct {
    uint32_t w:32;
  };
} __RCONbits_t;
extern volatile __RCONbits_t RCONbits __asm__ ("RCON") __attribute__((section("sfrs"), address(0xBF80F600)));
extern volatile uint32_t RCONCLR __attribute__((section("sfrs"),address(0xBF80F604)));
extern volatile uint32_t RCONSET __attribute__((section("sfrs"),address(0xBF80F608)));
extern volatile uint32_t RCONINV __attribute__((section("sfrs"),address(0xBF80F60C)));

extern volatile uint32_t RSWRST __attribute__((section("sfrs"), address(0xBF80F610)));
typedef union {
  struct {
    uint32_t SWRST:1;
  };
  struct {
    uint32_t w:32;
  };
} __RSWRSTbits_t;
extern volatile __RSWRSTbits_t RSWRSTbits __asm__ ("RSWRST") __attribute__((section("sfrs"), address(0xBF80F610)));
extern volatile uint32_t RSWRSTCLR __attribute__((section("sfrs"),address(0xBF80F614)));
extern volatile uint32_t RSWRSTSET __attribute__((section("sfrs"),address(0xBF80F618)));
extern volatile uint32_t RSWRSTINV __attribute__((section("sfrs"),address(0xBF80F61C)));

extern volatile uint32_t _DDPSTAT __attribute__((section("sfrs"), address(0xBF880140)));
typedef struct {
  uint32_t :1;
  uint32_t APIFUL:1;
  uint32_t APOFUL:1;
  uint32_t STRFUL:1;
  uint32_t :5;
  uint32_t APIOV:1;
  uint32_t APOOV:1;
  uint32_t :5;
  uint32_t STOV:16;
} ___DDPSTATbits_t;
extern volatile ___DDPSTATbits_t _DDPSTATbits __asm__ ("_DDPSTAT") __attribute__((section("sfrs"), address(0xBF880140)));

extern volatile uint32_t _STRO __attribute__((section("sfrs"), address(0xBF880170)));
extern volatile uint32_t _STROCLR __attribute__((section("sfrs"),address(0xBF880174)));
extern volatile uint32_t _STROSET __attribute__((section("sfrs"),address(0xBF880178)));
extern volatile uint32_t _STROINV __attribute__((section("sfrs"),address(0xBF88017C)));

extern volatile uint32_t _APPO __attribute__((section("sfrs"), address(0xBF880180)));
extern volatile uint32_t _APPOCLR __attribute__((section("sfrs"),address(0xBF880184)));
extern volatile uint32_t _APPOSET __attribute__((section("sfrs"),address(0xBF880188)));
extern volatile uint32_t _APPOINV __attribute__((section("sfrs"),address(0xBF88018C)));

extern volatile uint32_t _APPI __attribute__((section("sfrs"), address(0xBF880190)));

extern volatile uint32_t INTCON __attribute__((section("sfrs"), address(0xBF881000)));
typedef union {
  struct {
    uint32_t INT0EP:1;
    uint32_t INT1EP:1;
    uint32_t INT2EP:1;
    uint32_t INT3EP:1;
    uint32_t INT4EP:1;
    uint32_t :3;
    uint32_t TPC:3;
    uint32_t :1;
    uint32_t MVEC:1;
    uint32_t :1;
    uint32_t FRZ:1;
    uint32_t :1;
    uint32_t SS0:1;
  };
  struct {
    uint32_t w:32;
  };
} __INTCONbits_t;
extern volatile __INTCONbits_t INTCONbits __asm__ ("INTCON") __attribute__((section("sfrs"), address(0xBF881000)));
extern volatile uint32_t INTCONCLR __attribute__((section("sfrs"),address(0xBF881004)));
extern volatile uint32_t INTCONSET __attribute__((section("sfrs"),address(0xBF881008)));
extern volatile uint32_t INTCONINV __attribute__((section("sfrs"),address(0xBF88100C)));

extern volatile uint32_t INTSTAT __attribute__((section("sfrs"), address(0xBF881010)));
typedef struct {
  uint32_t VEC:6;
  uint32_t :2;
  uint32_t SRIPL:3;
} __INTSTATbits_t;
extern volatile __INTSTATbits_t INTSTATbits __asm__ ("INTSTAT") __attribute__((section("sfrs"), address(0xBF881010)));

extern volatile uint32_t IPTMR __attribute__((section("sfrs"), address(0xBF881020)));
extern volatile uint32_t IPTMRCLR __attribute__((section("sfrs"),address(0xBF881024)));
extern volatile uint32_t IPTMRSET __attribute__((section("sfrs"),address(0xBF881028)));
extern volatile uint32_t IPTMRINV __attribute__((section("sfrs"),address(0xBF88102C)));

extern volatile uint32_t IFS0 __attribute__((section("sfrs"), address(0xBF881030)));
typedef union {
  struct {
    uint32_t CTIF:1;
    uint32_t CS0IF:1;
    uint32_t CS1IF:1;
    uint32_t INT0IF:1;
    uint32_t T1IF:1;
    uint32_t IC1IF:1;
    uint32_t OC1IF:1;
    uint32_t INT1IF:1;
    uint32_t T2IF:1;
    uint32_t IC2IF:1;
    uint32_t OC2IF:1;
    uint32_t INT2IF:1;
    uint32_t T3IF:1;
    uint32_t IC3IF:1;
    uint32_t OC3IF:1;
    uint32_t INT3IF:1;
    uint32_t T4IF:1;
    uint32_t IC4IF:1;
    uint32_t OC4IF:1;
    uint32_t INT4IF:1;
    uint32_t T5IF:1;
    uint32_t IC5IF:1;
    uint32_t OC5IF:1;
    uint32_t SPI1EIF:1;
    uint32_t SPI1RXIF:1;
    uint32_t SPI1TXIF:1;
    uint32_t U1EIF:1;
    uint32_t U1RXIF:1;
    uint32_t U1TXIF:1;
    uint32_t I2C1BIF:1;
    uint32_t I2C1SIF:1;
    uint32_t I2C1MIF:1;
  };
  struct {
    uint32_t :26;
    uint32_t U1AEIF:1;
    uint32_t U1ARXIF:1;
    uint32_t U1ATXIF:1;
  };
  struct {
    uint32_t :26;
    uint32_t SPI3EIF:1;
    uint32_t SPI3RXIF:1;
    uint32_t SPI3TXIF:1;
  };
  struct {
    uint32_t :26;
    uint32_t SPI1AEIF:1;
    uint32_t SPI1ARXIF:1;
    uint32_t SPI1ATXIF:1;
  };
  struct {
    uint32_t :26;
    uint32_t I2C3BIF:1;
    uint32_t I2C3SIF:1;
    uint32_t I2C3MIF:1;
  };
  struct {
    uint32_t :26;
    uint32_t I2C1ABIF:1;
    uint32_t I2C1ASIF:1;
    uint32_t I2C1AMIF:1;
  };
  struct {
    uint32_t w:32;
  };
} __IFS0bits_t;
extern volatile __IFS0bits_t IFS0bits __asm__ ("IFS0") __attribute__((section("sfrs"), address(0xBF881030)));
extern volatile uint32_t IFS0CLR __attribute__((section("sfrs"),address(0xBF881034)));
extern volatile uint32_t IFS0SET __attribute__((section("sfrs"),address(0xBF881038)));
extern volatile uint32_t IFS0INV __attribute__((section("sfrs"),address(0xBF88103C)));

extern volatile uint32_t IFS1 __attribute__((section("sfrs"), address(0xBF881040)));
typedef union {
  struct {
    uint32_t CNIF:1;
    uint32_t AD1IF:1;
    uint32_t PMPIF:1;
    uint32_t CMP1IF:1;
    uint32_t CMP2IF:1;
    uint32_t U3EIF:1;
    uint32_t U3RXIF:1;
    uint32_t U3TXIF:1;
    uint32_t U2EIF:1;
    uint32_t U2RXIF:1;
    uint32_t U2TXIF:1;
    uint32_t I2C2BIF:1;
    uint32_t I2C2SIF:1;
    uint32_t I2C2MIF:1;
    uint32_t FSCMIF:1;
    uint32_t RTCCIF:1;
    uint32_t DMA0IF:1;
    uint32_t DMA1IF:1;
    uint32_t DMA2IF:1;
    uint32_t DMA3IF:1;
    uint32_t DMA4IF:1;
    uint32_t DMA5IF:1;
    uint32_t DMA6IF:1;
    uint32_t DMA7IF:1;
    uint32_t FCEIF:1;
    uint32_t USBIF:1;
    uint32_t CAN1IF:1;
    uint32_t CAN2IF:1;
    uint32_t ETHIF:1;
    uint32_t IC1EIF:1;
    uint32_t IC2EIF:1;
    uint32_t IC3EIF:1;
  };
  struct {
    uint32_t :5;
    uint32_t U2AEIF:1;
    uint32_t U2ARXIF:1;
    uint32_t U2ATXIF:1;
    uint32_t U3AEIF:1;
    uint32_t U3ARXIF:1;
    uint32_t U3ATXIF:1;
  };
  struct {
    uint32_t :5;
    uint32_t SPI2EIF:1;
    uint32_t SPI2RXIF:1;
    uint32_t SPI2TXIF:1;
    uint32_t SPI4EIF:1;
    uint32_t SPI4RXIF:1;
    uint32_t SPI4TXIF:1;
  };
  struct {
    uint32_t :5;
    uint32_t SPI2AEIF:1;
    uint32_t SPI2ARXIF:1;
    uint32_t SPI2ATXIF:1;
    uint32_t SPI3AEIF:1;
    uint32_t SPI3ARXIF:1;
    uint32_t SPI3ATXIF:1;
  };
  struct {
    uint32_t :5;
    uint32_t I2C4BIF:1;
    uint32_t I2C4SIF:1;
    uint32_t I2C4MIF:1;
    uint32_t I2C5BIF:1;
    uint32_t I2C5SIF:1;
    uint32_t I2C5MIF:1;
  };
  struct {
    uint32_t :5;
    uint32_t I2C2ABIF:1;
    uint32_t I2C2ASIF:1;
    uint32_t I2C2AMIF:1;
    uint32_t I2C3ABIF:1;
    uint32_t I2C3ASIF:1;
    uint32_t I2C3AMIF:1;
  };
  struct {
    uint32_t w:32;
  };
} __IFS1bits_t;
extern volatile __IFS1bits_t IFS1bits __asm__ ("IFS1") __attribute__((section("sfrs"), address(0xBF881040)));
extern volatile uint32_t IFS1CLR __attribute__((section("sfrs"),address(0xBF881044)));
extern volatile uint32_t IFS1SET __attribute__((section("sfrs"),address(0xBF881048)));
extern volatile uint32_t IFS1INV __attribute__((section("sfrs"),address(0xBF88104C)));

extern volatile uint32_t IFS2 __attribute__((section("sfrs"), address(0xBF881050)));
typedef union {
  struct {
    uint32_t IC4EIF:1;
    uint32_t IC5EIF:1;
    uint32_t PMPEIF:1;
    uint32_t U1BEIF:1;
    uint32_t U1BRXIF:1;
    uint32_t U1BTXIF:1;
    uint32_t U2BEIF:1;
    uint32_t U2BRXIF:1;
    uint32_t U2BTXIF:1;
    uint32_t U3BEIF:1;
    uint32_t U3BRXIF:1;
    uint32_t U3BTXIF:1;
  };
  struct {
    uint32_t :3;
    uint32_t U4EIF:1;
    uint32_t U4RXIF:1;
    uint32_t U4TXIF:1;
    uint32_t U6EIF:1;
    uint32_t U6RXIF:1;
    uint32_t U6TXIF:1;
    uint32_t U5EIF:1;
    uint32_t U5RXIF:1;
    uint32_t U5TXIF:1;
  };
  struct {
    uint32_t w:32;
  };
} __IFS2bits_t;
extern volatile __IFS2bits_t IFS2bits __asm__ ("IFS2") __attribute__((section("sfrs"), address(0xBF881050)));
extern volatile uint32_t IFS2CLR __attribute__((section("sfrs"),address(0xBF881054)));
extern volatile uint32_t IFS2SET __attribute__((section("sfrs"),address(0xBF881058)));
extern volatile uint32_t IFS2INV __attribute__((section("sfrs"),address(0xBF88105C)));

extern volatile uint32_t IEC0 __attribute__((section("sfrs"), address(0xBF881060)));
typedef union {
  struct {
    uint32_t CTIE:1;
    uint32_t CS0IE:1;
    uint32_t CS1IE:1;
    uint32_t INT0IE:1;
    uint32_t T1IE:1;
    uint32_t IC1IE:1;
    uint32_t OC1IE:1;
    uint32_t INT1IE:1;
    uint32_t T2IE:1;
    uint32_t IC2IE:1;
    uint32_t OC2IE:1;
    uint32_t INT2IE:1;
    uint32_t T3IE:1;
    uint32_t IC3IE:1;
    uint32_t OC3IE:1;
    uint32_t INT3IE:1;
    uint32_t T4IE:1;
    uint32_t IC4IE:1;
    uint32_t OC4IE:1;
    uint32_t INT4IE:1;
    uint32_t T5IE:1;
    uint32_t IC5IE:1;
    uint32_t OC5IE:1;
    uint32_t SPI1EIE:1;
    uint32_t SPI1RXIE:1;
    uint32_t SPI1TXIE:1;
    uint32_t U1EIE:1;
    uint32_t U1RXIE:1;
    uint32_t U1TXIE:1;
    uint32_t I2C1BIE:1;
    uint32_t I2C1SIE:1;
    uint32_t I2C1MIE:1;
  };
  struct {
    uint32_t :26;
    uint32_t U1AEIE:1;
    uint32_t U1ARXIE:1;
    uint32_t U1ATXIE:1;
  };
  struct {
    uint32_t :26;
    uint32_t SPI3EIE:1;
    uint32_t SPI3RXIE:1;
    uint32_t SPI3TXIE:1;
  };
  struct {
    uint32_t :26;
    uint32_t SPI1AEIE:1;
    uint32_t SPI1ARXIE:1;
    uint32_t SPI1ATXIE:1;
  };
  struct {
    uint32_t :26;
    uint32_t I2C3BIE:1;
    uint32_t I2C3SIE:1;
    uint32_t I2C3MIE:1;
  };
  struct {
    uint32_t :26;
    uint32_t I2C1ABIE:1;
    uint32_t I2C1ASIE:1;
    uint32_t I2C1AMIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __IEC0bits_t;
extern volatile __IEC0bits_t IEC0bits __asm__ ("IEC0") __attribute__((section("sfrs"), address(0xBF881060)));
extern volatile uint32_t IEC0CLR __attribute__((section("sfrs"),address(0xBF881064)));
extern volatile uint32_t IEC0SET __attribute__((section("sfrs"),address(0xBF881068)));
extern volatile uint32_t IEC0INV __attribute__((section("sfrs"),address(0xBF88106C)));

extern volatile uint32_t IEC1 __attribute__((section("sfrs"), address(0xBF881070)));
typedef union {
  struct {
    uint32_t CNIE:1;
    uint32_t AD1IE:1;
    uint32_t PMPIE:1;
    uint32_t CMP1IE:1;
    uint32_t CMP2IE:1;
    uint32_t U3EIE:1;
    uint32_t U3RXIE:1;
    uint32_t U3TXIE:1;
    uint32_t U2EIE:1;
    uint32_t U2RXIE:1;
    uint32_t U2TXIE:1;
    uint32_t I2C2BIE:1;
    uint32_t I2C2SIE:1;
    uint32_t I2C2MIE:1;
    uint32_t FSCMIE:1;
    uint32_t RTCCIE:1;
    uint32_t DMA0IE:1;
    uint32_t DMA1IE:1;
    uint32_t DMA2IE:1;
    uint32_t DMA3IE:1;
    uint32_t DMA4IE:1;
    uint32_t DMA5IE:1;
    uint32_t DMA6IE:1;
    uint32_t DMA7IE:1;
    uint32_t FCEIE:1;
    uint32_t USBIE:1;
    uint32_t CAN1IE:1;
    uint32_t CAN2IE:1;
    uint32_t ETHIE:1;
    uint32_t IC1EIE:1;
    uint32_t IC2EIE:1;
    uint32_t IC3EIE:1;
  };
  struct {
    uint32_t :5;
    uint32_t U2AEIE:1;
    uint32_t U2ARXIE:1;
    uint32_t U2ATXIE:1;
    uint32_t U3AEIE:1;
    uint32_t U3ARXIE:1;
    uint32_t U3ATXIE:1;
  };
  struct {
    uint32_t :5;
    uint32_t SPI2EIE:1;
    uint32_t SPI2RXIE:1;
    uint32_t SPI2TXIE:1;
    uint32_t SPI4EIE:1;
    uint32_t SPI4RXIE:1;
    uint32_t SPI4TXIE:1;
  };
  struct {
    uint32_t :5;
    uint32_t SPI2AEIE:1;
    uint32_t SPI2ARXIE:1;
    uint32_t SPI2ATXIE:1;
    uint32_t SPI3AEIE:1;
    uint32_t SPI3ARXIE:1;
    uint32_t SPI3ATXIE:1;
  };
  struct {
    uint32_t :5;
    uint32_t I2C4BIE:1;
    uint32_t I2C4SIE:1;
    uint32_t I2C4MIE:1;
    uint32_t I2C5BIE:1;
    uint32_t I2C5SIE:1;
    uint32_t I2C5MIE:1;
  };
  struct {
    uint32_t :5;
    uint32_t I2C2ABIE:1;
    uint32_t I2C2ASIE:1;
    uint32_t I2C2AMIE:1;
    uint32_t I2C3ABIE:1;
    uint32_t I2C3ASIE:1;
    uint32_t I2C3AMIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __IEC1bits_t;
extern volatile __IEC1bits_t IEC1bits __asm__ ("IEC1") __attribute__((section("sfrs"), address(0xBF881070)));
extern volatile uint32_t IEC1CLR __attribute__((section("sfrs"),address(0xBF881074)));
extern volatile uint32_t IEC1SET __attribute__((section("sfrs"),address(0xBF881078)));
extern volatile uint32_t IEC1INV __attribute__((section("sfrs"),address(0xBF88107C)));

extern volatile uint32_t IEC2 __attribute__((section("sfrs"), address(0xBF881080)));
typedef union {
  struct {
    uint32_t IC4EIE:1;
    uint32_t IC5EIE:1;
    uint32_t PMPEIE:1;
    uint32_t U1BEIE:1;
    uint32_t U1BRXIE:1;
    uint32_t U1BTXIE:1;
    uint32_t U2BEIE:1;
    uint32_t U2BRXIE:1;
    uint32_t U2BTXIE:1;
    uint32_t U3BEIE:1;
    uint32_t U3BRXIE:1;
    uint32_t U3BTXIE:1;
  };
  struct {
    uint32_t :3;
    uint32_t U4EIE:1;
    uint32_t U4RXIE:1;
    uint32_t U4TXIE:1;
    uint32_t U6EIE:1;
    uint32_t U6RXIE:1;
    uint32_t U6TXIE:1;
    uint32_t U5EIE:1;
    uint32_t U5RXIE:1;
    uint32_t U5TXIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __IEC2bits_t;
extern volatile __IEC2bits_t IEC2bits __asm__ ("IEC2") __attribute__((section("sfrs"), address(0xBF881080)));
extern volatile uint32_t IEC2CLR __attribute__((section("sfrs"),address(0xBF881084)));
extern volatile uint32_t IEC2SET __attribute__((section("sfrs"),address(0xBF881088)));
extern volatile uint32_t IEC2INV __attribute__((section("sfrs"),address(0xBF88108C)));

extern volatile uint32_t IPC0 __attribute__((section("sfrs"), address(0xBF881090)));
typedef union {
  struct {
    uint32_t CTIS:2;
    uint32_t CTIP:3;
    uint32_t :3;
    uint32_t CS0IS:2;
    uint32_t CS0IP:3;
    uint32_t :3;
    uint32_t CS1IS:2;
    uint32_t CS1IP:3;
    uint32_t :3;
    uint32_t INT0IS:2;
    uint32_t INT0IP:3;
  };
  struct {
    uint32_t w:32;
  };
} __IPC0bits_t;
extern volatile __IPC0bits_t IPC0bits __asm__ ("IPC0") __attribute__((section("sfrs"), address(0xBF881090)));
extern volatile uint32_t IPC0CLR __attribute__((section("sfrs"),address(0xBF881094)));
extern volatile uint32_t IPC0SET __attribute__((section("sfrs"),address(0xBF881098)));
extern volatile uint32_t IPC0INV __attribute__((section("sfrs"),address(0xBF88109C)));

extern volatile uint32_t IPC1 __attribute__((section("sfrs"), address(0xBF8810A0)));
typedef union {
  struct {
    uint32_t T1IS:2;
    uint32_t T1IP:3;
    uint32_t :3;
    uint32_t IC1IS:2;
    uint32_t IC1IP:3;
    uint32_t :3;
    uint32_t OC1IS:2;
    uint32_t OC1IP:3;
    uint32_t :3;
    uint32_t INT1IS:2;
    uint32_t INT1IP:3;
  };
  struct {
    uint32_t w:32;
  };
} __IPC1bits_t;
extern volatile __IPC1bits_t IPC1bits __asm__ ("IPC1") __attribute__((section("sfrs"), address(0xBF8810A0)));
extern volatile uint32_t IPC1CLR __attribute__((section("sfrs"),address(0xBF8810A4)));
extern volatile uint32_t IPC1SET __attribute__((section("sfrs"),address(0xBF8810A8)));
extern volatile uint32_t IPC1INV __attribute__((section("sfrs"),address(0xBF8810AC)));

extern volatile uint32_t IPC2 __attribute__((section("sfrs"), address(0xBF8810B0)));
typedef union {
  struct {
    uint32_t T2IS:2;
    uint32_t T2IP:3;
    uint32_t :3;
    uint32_t IC2IS:2;
    uint32_t IC2IP:3;
    uint32_t :3;
    uint32_t OC2IS:2;
    uint32_t OC2IP:3;
    uint32_t :3;
    uint32_t INT2IS:2;
    uint32_t INT2IP:3;
  };
  struct {
    uint32_t w:32;
  };
} __IPC2bits_t;
extern volatile __IPC2bits_t IPC2bits __asm__ ("IPC2") __attribute__((section("sfrs"), address(0xBF8810B0)));
extern volatile uint32_t IPC2CLR __attribute__((section("sfrs"),address(0xBF8810B4)));
extern volatile uint32_t IPC2SET __attribute__((section("sfrs"),address(0xBF8810B8)));
extern volatile uint32_t IPC2INV __attribute__((section("sfrs"),address(0xBF8810BC)));

extern volatile uint32_t IPC3 __attribute__((section("sfrs"), address(0xBF8810C0)));
typedef union {
  struct {
    uint32_t T3IS:2;
    uint32_t T3IP:3;
    uint32_t :3;
    uint32_t IC3IS:2;
    uint32_t IC3IP:3;
    uint32_t :3;
    uint32_t OC3IS:2;
    uint32_t OC3IP:3;
    uint32_t :3;
    uint32_t INT3IS:2;
    uint32_t INT3IP:3;
  };
  struct {
    uint32_t w:32;
  };
} __IPC3bits_t;
extern volatile __IPC3bits_t IPC3bits __asm__ ("IPC3") __attribute__((section("sfrs"), address(0xBF8810C0)));
extern volatile uint32_t IPC3CLR __attribute__((section("sfrs"),address(0xBF8810C4)));
extern volatile uint32_t IPC3SET __attribute__((section("sfrs"),address(0xBF8810C8)));
extern volatile uint32_t IPC3INV __attribute__((section("sfrs"),address(0xBF8810CC)));

extern volatile uint32_t IPC4 __attribute__((section("sfrs"), address(0xBF8810D0)));
typedef union {
  struct {
    uint32_t T4IS:2;
    uint32_t T4IP:3;
    uint32_t :3;
    uint32_t IC4IS:2;
    uint32_t IC4IP:3;
    uint32_t :3;
    uint32_t OC4IS:2;
    uint32_t OC4IP:3;
    uint32_t :3;
    uint32_t INT4IS:2;
    uint32_t INT4IP:3;
  };
  struct {
    uint32_t w:32;
  };
} __IPC4bits_t;
extern volatile __IPC4bits_t IPC4bits __asm__ ("IPC4") __attribute__((section("sfrs"), address(0xBF8810D0)));
extern volatile uint32_t IPC4CLR __attribute__((section("sfrs"),address(0xBF8810D4)));
extern volatile uint32_t IPC4SET __attribute__((section("sfrs"),address(0xBF8810D8)));
extern volatile uint32_t IPC4INV __attribute__((section("sfrs"),address(0xBF8810DC)));

extern volatile uint32_t IPC5 __attribute__((section("sfrs"), address(0xBF8810E0)));
typedef union {
  struct {
    uint32_t T5IS:2;
    uint32_t T5IP:3;
    uint32_t :3;
    uint32_t IC5IS:2;
    uint32_t IC5IP:3;
    uint32_t :3;
    uint32_t OC5IS:2;
    uint32_t OC5IP:3;
    uint32_t :3;
    uint32_t SPI1IS:2;
    uint32_t SPI1IP:3;
  };
  struct {
    uint32_t w:32;
  };
} __IPC5bits_t;
extern volatile __IPC5bits_t IPC5bits __asm__ ("IPC5") __attribute__((section("sfrs"), address(0xBF8810E0)));
extern volatile uint32_t IPC5CLR __attribute__((section("sfrs"),address(0xBF8810E4)));
extern volatile uint32_t IPC5SET __attribute__((section("sfrs"),address(0xBF8810E8)));
extern volatile uint32_t IPC5INV __attribute__((section("sfrs"),address(0xBF8810EC)));

extern volatile uint32_t IPC6 __attribute__((section("sfrs"), address(0xBF8810F0)));
typedef union {
  struct {
    uint32_t U1IS:2;
    uint32_t U1IP:3;
    uint32_t :3;
    uint32_t I2C1IS:2;
    uint32_t I2C1IP:3;
    uint32_t :3;
    uint32_t CNIS:2;
    uint32_t CNIP:3;
    uint32_t :3;
    uint32_t AD1IS:2;
    uint32_t AD1IP:3;
  };
  struct {
    uint32_t U1AIS:2;
    uint32_t U1AIP:3;
  };
  struct {
    uint32_t SPI3IS:2;
    uint32_t SPI3IP:3;
  };
  struct {
    uint32_t SPI1AIS:2;
    uint32_t SPI1AIP:3;
  };
  struct {
    uint32_t I2C3IS:2;
    uint32_t I2C3IP:3;
  };
  struct {
    uint32_t I2C1AIS:2;
    uint32_t I2C1AIP:3;
  };
  struct {
    uint32_t w:32;
  };
} __IPC6bits_t;
extern volatile __IPC6bits_t IPC6bits __asm__ ("IPC6") __attribute__((section("sfrs"), address(0xBF8810F0)));
extern volatile uint32_t IPC6CLR __attribute__((section("sfrs"),address(0xBF8810F4)));
extern volatile uint32_t IPC6SET __attribute__((section("sfrs"),address(0xBF8810F8)));
extern volatile uint32_t IPC6INV __attribute__((section("sfrs"),address(0xBF8810FC)));

extern volatile uint32_t IPC7 __attribute__((section("sfrs"), address(0xBF881100)));
typedef union {
  struct {
    uint32_t PMPIS:2;
    uint32_t PMPIP:3;
    uint32_t :3;
    uint32_t CMP1IS:2;
    uint32_t CMP1IP:3;
    uint32_t :3;
    uint32_t CMP2IS:2;
    uint32_t CMP2IP:3;
    uint32_t :3;
    uint32_t U3IS:2;
    uint32_t U3IP:3;
  };
  struct {
    uint32_t :24;
    uint32_t U2AIS:2;
    uint32_t U2AIP:3;
  };
  struct {
    uint32_t :24;
    uint32_t SPI2IS:2;
    uint32_t SPI2IP:3;
  };
  struct {
    uint32_t :24;
    uint32_t SPI2AIS:2;
    uint32_t SPI2AIP:3;
  };
  struct {
    uint32_t :24;
    uint32_t I2C4IS:2;
    uint32_t I2C4IP:3;
  };
  struct {
    uint32_t :24;
    uint32_t I2C2AIS:2;
    uint32_t I2C2AIP:3;
  };
  struct {
    uint32_t w:32;
  };
} __IPC7bits_t;
extern volatile __IPC7bits_t IPC7bits __asm__ ("IPC7") __attribute__((section("sfrs"), address(0xBF881100)));
extern volatile uint32_t IPC7CLR __attribute__((section("sfrs"),address(0xBF881104)));
extern volatile uint32_t IPC7SET __attribute__((section("sfrs"),address(0xBF881108)));
extern volatile uint32_t IPC7INV __attribute__((section("sfrs"),address(0xBF88110C)));

extern volatile uint32_t IPC8 __attribute__((section("sfrs"), address(0xBF881110)));
typedef union {
  struct {
    uint32_t U2IS:2;
    uint32_t U2IP:3;
    uint32_t :3;
    uint32_t I2C2IS:2;
    uint32_t I2C2IP:3;
    uint32_t :3;
    uint32_t FSCMIS:2;
    uint32_t FSCMIP:3;
    uint32_t :3;
    uint32_t RTCCIS:2;
    uint32_t RTCCIP:3;
  };
  struct {
    uint32_t U3AIS:2;
    uint32_t U3AIP:3;
  };
  struct {
    uint32_t SPI4IS:2;
    uint32_t SPI4IP:3;
  };
  struct {
    uint32_t SPI3AIS:2;
    uint32_t SPI3AIP:3;
  };
  struct {
    uint32_t I2C5IS:2;
    uint32_t I2C5IP:3;
  };
  struct {
    uint32_t I2C3AIS:2;
    uint32_t I2C3AIP:3;
  };
  struct {
    uint32_t w:32;
  };
} __IPC8bits_t;
extern volatile __IPC8bits_t IPC8bits __asm__ ("IPC8") __attribute__((section("sfrs"), address(0xBF881110)));
extern volatile uint32_t IPC8CLR __attribute__((section("sfrs"),address(0xBF881114)));
extern volatile uint32_t IPC8SET __attribute__((section("sfrs"),address(0xBF881118)));
extern volatile uint32_t IPC8INV __attribute__((section("sfrs"),address(0xBF88111C)));

extern volatile uint32_t IPC9 __attribute__((section("sfrs"), address(0xBF881120)));
typedef union {
  struct {
    uint32_t DMA0IS:2;
    uint32_t DMA0IP:3;
    uint32_t :3;
    uint32_t DMA1IS:2;
    uint32_t DMA1IP:3;
    uint32_t :3;
    uint32_t DMA2IS:2;
    uint32_t DMA2IP:3;
    uint32_t :3;
    uint32_t DMA3IS:2;
    uint32_t DMA3IP:3;
  };
  struct {
    uint32_t w:32;
  };
} __IPC9bits_t;
extern volatile __IPC9bits_t IPC9bits __asm__ ("IPC9") __attribute__((section("sfrs"), address(0xBF881120)));
extern volatile uint32_t IPC9CLR __attribute__((section("sfrs"),address(0xBF881124)));
extern volatile uint32_t IPC9SET __attribute__((section("sfrs"),address(0xBF881128)));
extern volatile uint32_t IPC9INV __attribute__((section("sfrs"),address(0xBF88112C)));

extern volatile uint32_t IPC10 __attribute__((section("sfrs"), address(0xBF881130)));
typedef union {
  struct {
    uint32_t DMA4IS:2;
    uint32_t DMA4IP:3;
    uint32_t :3;
    uint32_t DMA5IS:2;
    uint32_t DMA5IP:3;
    uint32_t :3;
    uint32_t DMA6IS:2;
    uint32_t DMA6IP:3;
    uint32_t :3;
    uint32_t DMA7IS:2;
    uint32_t DMA7IP:3;
  };
  struct {
    uint32_t w:32;
  };
} __IPC10bits_t;
extern volatile __IPC10bits_t IPC10bits __asm__ ("IPC10") __attribute__((section("sfrs"), address(0xBF881130)));
extern volatile uint32_t IPC10CLR __attribute__((section("sfrs"),address(0xBF881134)));
extern volatile uint32_t IPC10SET __attribute__((section("sfrs"),address(0xBF881138)));
extern volatile uint32_t IPC10INV __attribute__((section("sfrs"),address(0xBF88113C)));

extern volatile uint32_t IPC11 __attribute__((section("sfrs"), address(0xBF881140)));
typedef union {
  struct {
    uint32_t FCEIS:2;
    uint32_t FCEIP:3;
    uint32_t :3;
    uint32_t USBIS:2;
    uint32_t USBIP:3;
    uint32_t :3;
    uint32_t CAN1IS:2;
    uint32_t CAN1IP:3;
    uint32_t :3;
    uint32_t CAN2IS:2;
    uint32_t CAN2IP:3;
  };
  struct {
    uint32_t w:32;
  };
} __IPC11bits_t;
extern volatile __IPC11bits_t IPC11bits __asm__ ("IPC11") __attribute__((section("sfrs"), address(0xBF881140)));
extern volatile uint32_t IPC11CLR __attribute__((section("sfrs"),address(0xBF881144)));
extern volatile uint32_t IPC11SET __attribute__((section("sfrs"),address(0xBF881148)));
extern volatile uint32_t IPC11INV __attribute__((section("sfrs"),address(0xBF88114C)));

extern volatile uint32_t IPC12 __attribute__((section("sfrs"), address(0xBF881150)));
typedef union {
  struct {
    uint32_t ETHIS:2;
    uint32_t ETHIP:3;
    uint32_t :3;
    uint32_t U4IS:2;
    uint32_t U4IP:3;
    uint32_t :3;
    uint32_t U6IS:2;
    uint32_t U6IP:3;
    uint32_t :3;
    uint32_t U5IS:2;
    uint32_t U5IP:3;
  };
  struct {
    uint32_t :8;
    uint32_t U1BIS:2;
    uint32_t U1BIP:3;
    uint32_t :3;
    uint32_t U2BIS:2;
    uint32_t U2BIP:3;
    uint32_t :3;
    uint32_t U3BIS:2;
    uint32_t U3BIP:3;
  };
  struct {
    uint32_t w:32;
  };
} __IPC12bits_t;
extern volatile __IPC12bits_t IPC12bits __asm__ ("IPC12") __attribute__((section("sfrs"), address(0xBF881150)));
extern volatile uint32_t IPC12CLR __attribute__((section("sfrs"),address(0xBF881154)));
extern volatile uint32_t IPC12SET __attribute__((section("sfrs"),address(0xBF881158)));
extern volatile uint32_t IPC12INV __attribute__((section("sfrs"),address(0xBF88115C)));

extern volatile uint32_t BMXCON __attribute__((section("sfrs"), address(0xBF882000)));
typedef union {
  struct {
    uint32_t BMXARB:3;
    uint32_t :3;
    uint32_t BMXWSDRM:1;
    uint32_t :9;
    uint32_t BMXERRIS:1;
    uint32_t BMXERRDS:1;
    uint32_t BMXERRDMA:1;
    uint32_t BMXERRICD:1;
    uint32_t BMXERRIXI:1;
    uint32_t :5;
    uint32_t BMXCHEDMA:1;
  };
  struct {
    uint32_t w:32;
  };
} __BMXCONbits_t;
extern volatile __BMXCONbits_t BMXCONbits __asm__ ("BMXCON") __attribute__((section("sfrs"), address(0xBF882000)));
extern volatile uint32_t BMXCONCLR __attribute__((section("sfrs"),address(0xBF882004)));
extern volatile uint32_t BMXCONSET __attribute__((section("sfrs"),address(0xBF882008)));
extern volatile uint32_t BMXCONINV __attribute__((section("sfrs"),address(0xBF88200C)));

extern volatile uint32_t BMXDKPBA __attribute__((section("sfrs"), address(0xBF882010)));
extern volatile uint32_t BMXDKPBACLR __attribute__((section("sfrs"),address(0xBF882014)));
extern volatile uint32_t BMXDKPBASET __attribute__((section("sfrs"),address(0xBF882018)));
extern volatile uint32_t BMXDKPBAINV __attribute__((section("sfrs"),address(0xBF88201C)));

extern volatile uint32_t BMXDUDBA __attribute__((section("sfrs"), address(0xBF882020)));
extern volatile uint32_t BMXDUDBACLR __attribute__((section("sfrs"),address(0xBF882024)));
extern volatile uint32_t BMXDUDBASET __attribute__((section("sfrs"),address(0xBF882028)));
extern volatile uint32_t BMXDUDBAINV __attribute__((section("sfrs"),address(0xBF88202C)));

extern volatile uint32_t BMXDUPBA __attribute__((section("sfrs"), address(0xBF882030)));
extern volatile uint32_t BMXDUPBACLR __attribute__((section("sfrs"),address(0xBF882034)));
extern volatile uint32_t BMXDUPBASET __attribute__((section("sfrs"),address(0xBF882038)));
extern volatile uint32_t BMXDUPBAINV __attribute__((section("sfrs"),address(0xBF88203C)));

extern volatile uint32_t BMXDRMSZ __attribute__((section("sfrs"), address(0xBF882040)));

extern volatile uint32_t BMXPUPBA __attribute__((section("sfrs"), address(0xBF882050)));
extern volatile uint32_t BMXPUPBACLR __attribute__((section("sfrs"),address(0xBF882054)));
extern volatile uint32_t BMXPUPBASET __attribute__((section("sfrs"),address(0xBF882058)));
extern volatile uint32_t BMXPUPBAINV __attribute__((section("sfrs"),address(0xBF88205C)));

extern volatile uint32_t BMXPFMSZ __attribute__((section("sfrs"), address(0xBF882060)));

extern volatile uint32_t BMXBOOTSZ __attribute__((section("sfrs"), address(0xBF882070)));

extern volatile uint32_t DMACON __attribute__((section("sfrs"), address(0xBF883000)));
typedef union {
  struct {
    uint32_t :11;
    uint32_t DMABUSY:1;
    uint32_t SUSPEND:1;
    uint32_t :2;
    uint32_t ON:1;
  };
  struct {
    uint32_t w:32;
  };
} __DMACONbits_t;
extern volatile __DMACONbits_t DMACONbits __asm__ ("DMACON") __attribute__((section("sfrs"), address(0xBF883000)));
extern volatile uint32_t DMACONCLR __attribute__((section("sfrs"),address(0xBF883004)));
extern volatile uint32_t DMACONSET __attribute__((section("sfrs"),address(0xBF883008)));
extern volatile uint32_t DMACONINV __attribute__((section("sfrs"),address(0xBF88300C)));

extern volatile uint32_t DMASTAT __attribute__((section("sfrs"), address(0xBF883010)));
typedef union {
  struct {
    uint32_t DMACH:3;
    uint32_t RDWR:1;
  };
  struct {
    uint32_t w:32;
  };
} __DMASTATbits_t;
extern volatile __DMASTATbits_t DMASTATbits __asm__ ("DMASTAT") __attribute__((section("sfrs"), address(0xBF883010)));
extern volatile uint32_t DMASTATCLR __attribute__((section("sfrs"),address(0xBF883014)));
extern volatile uint32_t DMASTATSET __attribute__((section("sfrs"),address(0xBF883018)));
extern volatile uint32_t DMASTATINV __attribute__((section("sfrs"),address(0xBF88301C)));

extern volatile uint32_t DMAADDR __attribute__((section("sfrs"), address(0xBF883020)));
extern volatile uint32_t DMAADDRCLR __attribute__((section("sfrs"),address(0xBF883024)));
extern volatile uint32_t DMAADDRSET __attribute__((section("sfrs"),address(0xBF883028)));
extern volatile uint32_t DMAADDRINV __attribute__((section("sfrs"),address(0xBF88302C)));

extern volatile uint32_t DCRCCON __attribute__((section("sfrs"), address(0xBF883030)));
typedef union {
  struct {
    uint32_t CRCCH:3;
    uint32_t :2;
    uint32_t CRCTYP:1;
    uint32_t CRCAPP:1;
    uint32_t CRCEN:1;
    uint32_t PLEN:5;
    uint32_t :11;
    uint32_t BITO:1;
    uint32_t :2;
    uint32_t WBO:1;
    uint32_t BYTO:2;
  };
  struct {
    uint32_t w:32;
  };
} __DCRCCONbits_t;
extern volatile __DCRCCONbits_t DCRCCONbits __asm__ ("DCRCCON") __attribute__((section("sfrs"), address(0xBF883030)));
extern volatile uint32_t DCRCCONCLR __attribute__((section("sfrs"),address(0xBF883034)));
extern volatile uint32_t DCRCCONSET __attribute__((section("sfrs"),address(0xBF883038)));
extern volatile uint32_t DCRCCONINV __attribute__((section("sfrs"),address(0xBF88303C)));

extern volatile uint32_t DCRCDATA __attribute__((section("sfrs"), address(0xBF883040)));
extern volatile uint32_t DCRCDATACLR __attribute__((section("sfrs"),address(0xBF883044)));
extern volatile uint32_t DCRCDATASET __attribute__((section("sfrs"),address(0xBF883048)));
extern volatile uint32_t DCRCDATAINV __attribute__((section("sfrs"),address(0xBF88304C)));

extern volatile uint32_t DCRCXOR __attribute__((section("sfrs"), address(0xBF883050)));
extern volatile uint32_t DCRCXORCLR __attribute__((section("sfrs"),address(0xBF883054)));
extern volatile uint32_t DCRCXORSET __attribute__((section("sfrs"),address(0xBF883058)));
extern volatile uint32_t DCRCXORINV __attribute__((section("sfrs"),address(0xBF88305C)));

extern volatile uint32_t DCH0CON __attribute__((section("sfrs"), address(0xBF883060)));
typedef union {
  struct {
    uint32_t CHPRI:2;
    uint32_t CHEDET:1;
    uint32_t :1;
    uint32_t CHAEN:1;
    uint32_t CHCHN:1;
    uint32_t CHAED:1;
    uint32_t CHEN:1;
    uint32_t CHCHNS:1;
    uint32_t :6;
    uint32_t CHBUSY:1;
  };
  struct {
    uint32_t w:32;
  };
} __DCH0CONbits_t;
extern volatile __DCH0CONbits_t DCH0CONbits __asm__ ("DCH0CON") __attribute__((section("sfrs"), address(0xBF883060)));
extern volatile uint32_t DCH0CONCLR __attribute__((section("sfrs"),address(0xBF883064)));
extern volatile uint32_t DCH0CONSET __attribute__((section("sfrs"),address(0xBF883068)));
extern volatile uint32_t DCH0CONINV __attribute__((section("sfrs"),address(0xBF88306C)));

extern volatile uint32_t DCH0ECON __attribute__((section("sfrs"), address(0xBF883070)));
typedef union {
  struct {
    uint32_t :3;
    uint32_t AIRQEN:1;
    uint32_t SIRQEN:1;
    uint32_t PATEN:1;
    uint32_t CABORT:1;
    uint32_t CFORCE:1;
    uint32_t CHSIRQ:8;
    uint32_t CHAIRQ:8;
  };
  struct {
    uint32_t w:32;
  };
} __DCH0ECONbits_t;
extern volatile __DCH0ECONbits_t DCH0ECONbits __asm__ ("DCH0ECON") __attribute__((section("sfrs"), address(0xBF883070)));
extern volatile uint32_t DCH0ECONCLR __attribute__((section("sfrs"),address(0xBF883074)));
extern volatile uint32_t DCH0ECONSET __attribute__((section("sfrs"),address(0xBF883078)));
extern volatile uint32_t DCH0ECONINV __attribute__((section("sfrs"),address(0xBF88307C)));

extern volatile uint32_t DCH0INT __attribute__((section("sfrs"), address(0xBF883080)));
typedef union {
  struct {
    uint32_t CHERIF:1;
    uint32_t CHTAIF:1;
    uint32_t CHCCIF:1;
    uint32_t CHBCIF:1;
    uint32_t CHDHIF:1;
    uint32_t CHDDIF:1;
    uint32_t CHSHIF:1;
    uint32_t CHSDIF:1;
    uint32_t :8;
    uint32_t CHERIE:1;
    uint32_t CHTAIE:1;
    uint32_t CHCCIE:1;
    uint32_t CHBCIE:1;
    uint32_t CHDHIE:1;
    uint32_t CHDDIE:1;
    uint32_t CHSHIE:1;
    uint32_t CHSDIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __DCH0INTbits_t;
extern volatile __DCH0INTbits_t DCH0INTbits __asm__ ("DCH0INT") __attribute__((section("sfrs"), address(0xBF883080)));
extern volatile uint32_t DCH0INTCLR __attribute__((section("sfrs"),address(0xBF883084)));
extern volatile uint32_t DCH0INTSET __attribute__((section("sfrs"),address(0xBF883088)));
extern volatile uint32_t DCH0INTINV __attribute__((section("sfrs"),address(0xBF88308C)));

extern volatile uint32_t DCH0SSA __attribute__((section("sfrs"), address(0xBF883090)));
typedef struct {
  uint32_t CHSSA:32;
} __DCH0SSAbits_t;
extern volatile __DCH0SSAbits_t DCH0SSAbits __asm__ ("DCH0SSA") __attribute__((section("sfrs"), address(0xBF883090)));
extern volatile uint32_t DCH0SSACLR __attribute__((section("sfrs"),address(0xBF883094)));
extern volatile uint32_t DCH0SSASET __attribute__((section("sfrs"),address(0xBF883098)));
extern volatile uint32_t DCH0SSAINV __attribute__((section("sfrs"),address(0xBF88309C)));

extern volatile uint32_t DCH0DSA __attribute__((section("sfrs"), address(0xBF8830A0)));
typedef struct {
  uint32_t CHDSA:32;
} __DCH0DSAbits_t;
extern volatile __DCH0DSAbits_t DCH0DSAbits __asm__ ("DCH0DSA") __attribute__((section("sfrs"), address(0xBF8830A0)));
extern volatile uint32_t DCH0DSACLR __attribute__((section("sfrs"),address(0xBF8830A4)));
extern volatile uint32_t DCH0DSASET __attribute__((section("sfrs"),address(0xBF8830A8)));
extern volatile uint32_t DCH0DSAINV __attribute__((section("sfrs"),address(0xBF8830AC)));

extern volatile uint32_t DCH0SSIZ __attribute__((section("sfrs"), address(0xBF8830B0)));
extern volatile uint32_t DCH0SSIZCLR __attribute__((section("sfrs"),address(0xBF8830B4)));
extern volatile uint32_t DCH0SSIZSET __attribute__((section("sfrs"),address(0xBF8830B8)));
extern volatile uint32_t DCH0SSIZINV __attribute__((section("sfrs"),address(0xBF8830BC)));

extern volatile uint32_t DCH0DSIZ __attribute__((section("sfrs"), address(0xBF8830C0)));
extern volatile uint32_t DCH0DSIZCLR __attribute__((section("sfrs"),address(0xBF8830C4)));
extern volatile uint32_t DCH0DSIZSET __attribute__((section("sfrs"),address(0xBF8830C8)));
extern volatile uint32_t DCH0DSIZINV __attribute__((section("sfrs"),address(0xBF8830CC)));

extern volatile uint32_t DCH0SPTR __attribute__((section("sfrs"), address(0xBF8830D0)));
extern volatile uint32_t DCH0SPTRCLR __attribute__((section("sfrs"),address(0xBF8830D4)));
extern volatile uint32_t DCH0SPTRSET __attribute__((section("sfrs"),address(0xBF8830D8)));
extern volatile uint32_t DCH0SPTRINV __attribute__((section("sfrs"),address(0xBF8830DC)));

extern volatile uint32_t DCH0DPTR __attribute__((section("sfrs"), address(0xBF8830E0)));
extern volatile uint32_t DCH0DPTRCLR __attribute__((section("sfrs"),address(0xBF8830E4)));
extern volatile uint32_t DCH0DPTRSET __attribute__((section("sfrs"),address(0xBF8830E8)));
extern volatile uint32_t DCH0DPTRINV __attribute__((section("sfrs"),address(0xBF8830EC)));

extern volatile uint32_t DCH0CSIZ __attribute__((section("sfrs"), address(0xBF8830F0)));
extern volatile uint32_t DCH0CSIZCLR __attribute__((section("sfrs"),address(0xBF8830F4)));
extern volatile uint32_t DCH0CSIZSET __attribute__((section("sfrs"),address(0xBF8830F8)));
extern volatile uint32_t DCH0CSIZINV __attribute__((section("sfrs"),address(0xBF8830FC)));

extern volatile uint32_t DCH0CPTR __attribute__((section("sfrs"), address(0xBF883100)));
extern volatile uint32_t DCH0CPTRCLR __attribute__((section("sfrs"),address(0xBF883104)));
extern volatile uint32_t DCH0CPTRSET __attribute__((section("sfrs"),address(0xBF883108)));
extern volatile uint32_t DCH0CPTRINV __attribute__((section("sfrs"),address(0xBF88310C)));

extern volatile uint32_t DCH0DAT __attribute__((section("sfrs"), address(0xBF883110)));
extern volatile uint32_t DCH0DATCLR __attribute__((section("sfrs"),address(0xBF883114)));
extern volatile uint32_t DCH0DATSET __attribute__((section("sfrs"),address(0xBF883118)));
extern volatile uint32_t DCH0DATINV __attribute__((section("sfrs"),address(0xBF88311C)));

extern volatile uint32_t DCH1CON __attribute__((section("sfrs"), address(0xBF883120)));
typedef union {
  struct {
    uint32_t CHPRI:2;
    uint32_t CHEDET:1;
    uint32_t :1;
    uint32_t CHAEN:1;
    uint32_t CHCHN:1;
    uint32_t CHAED:1;
    uint32_t CHEN:1;
    uint32_t CHCHNS:1;
    uint32_t :6;
    uint32_t CHBUSY:1;
  };
  struct {
    uint32_t w:32;
  };
} __DCH1CONbits_t;
extern volatile __DCH1CONbits_t DCH1CONbits __asm__ ("DCH1CON") __attribute__((section("sfrs"), address(0xBF883120)));
extern volatile uint32_t DCH1CONCLR __attribute__((section("sfrs"),address(0xBF883124)));
extern volatile uint32_t DCH1CONSET __attribute__((section("sfrs"),address(0xBF883128)));
extern volatile uint32_t DCH1CONINV __attribute__((section("sfrs"),address(0xBF88312C)));

extern volatile uint32_t DCH1ECON __attribute__((section("sfrs"), address(0xBF883130)));
typedef union {
  struct {
    uint32_t :3;
    uint32_t AIRQEN:1;
    uint32_t SIRQEN:1;
    uint32_t PATEN:1;
    uint32_t CABORT:1;
    uint32_t CFORCE:1;
    uint32_t CHSIRQ:8;
    uint32_t CHAIRQ:8;
  };
  struct {
    uint32_t w:32;
  };
} __DCH1ECONbits_t;
extern volatile __DCH1ECONbits_t DCH1ECONbits __asm__ ("DCH1ECON") __attribute__((section("sfrs"), address(0xBF883130)));
extern volatile uint32_t DCH1ECONCLR __attribute__((section("sfrs"),address(0xBF883134)));
extern volatile uint32_t DCH1ECONSET __attribute__((section("sfrs"),address(0xBF883138)));
extern volatile uint32_t DCH1ECONINV __attribute__((section("sfrs"),address(0xBF88313C)));

extern volatile uint32_t DCH1INT __attribute__((section("sfrs"), address(0xBF883140)));
typedef union {
  struct {
    uint32_t CHERIF:1;
    uint32_t CHTAIF:1;
    uint32_t CHCCIF:1;
    uint32_t CHBCIF:1;
    uint32_t CHDHIF:1;
    uint32_t CHDDIF:1;
    uint32_t CHSHIF:1;
    uint32_t CHSDIF:1;
    uint32_t :8;
    uint32_t CHERIE:1;
    uint32_t CHTAIE:1;
    uint32_t CHCCIE:1;
    uint32_t CHBCIE:1;
    uint32_t CHDHIE:1;
    uint32_t CHDDIE:1;
    uint32_t CHSHIE:1;
    uint32_t CHSDIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __DCH1INTbits_t;
extern volatile __DCH1INTbits_t DCH1INTbits __asm__ ("DCH1INT") __attribute__((section("sfrs"), address(0xBF883140)));
extern volatile uint32_t DCH1INTCLR __attribute__((section("sfrs"),address(0xBF883144)));
extern volatile uint32_t DCH1INTSET __attribute__((section("sfrs"),address(0xBF883148)));
extern volatile uint32_t DCH1INTINV __attribute__((section("sfrs"),address(0xBF88314C)));

extern volatile uint32_t DCH1SSA __attribute__((section("sfrs"), address(0xBF883150)));
typedef struct {
  uint32_t CHSSA:32;
} __DCH1SSAbits_t;
extern volatile __DCH1SSAbits_t DCH1SSAbits __asm__ ("DCH1SSA") __attribute__((section("sfrs"), address(0xBF883150)));
extern volatile uint32_t DCH1SSACLR __attribute__((section("sfrs"),address(0xBF883154)));
extern volatile uint32_t DCH1SSASET __attribute__((section("sfrs"),address(0xBF883158)));
extern volatile uint32_t DCH1SSAINV __attribute__((section("sfrs"),address(0xBF88315C)));

extern volatile uint32_t DCH1DSA __attribute__((section("sfrs"), address(0xBF883160)));
typedef struct {
  uint32_t CHDSA:32;
} __DCH1DSAbits_t;
extern volatile __DCH1DSAbits_t DCH1DSAbits __asm__ ("DCH1DSA") __attribute__((section("sfrs"), address(0xBF883160)));
extern volatile uint32_t DCH1DSACLR __attribute__((section("sfrs"),address(0xBF883164)));
extern volatile uint32_t DCH1DSASET __attribute__((section("sfrs"),address(0xBF883168)));
extern volatile uint32_t DCH1DSAINV __attribute__((section("sfrs"),address(0xBF88316C)));

extern volatile uint32_t DCH1SSIZ __attribute__((section("sfrs"), address(0xBF883170)));
extern volatile uint32_t DCH1SSIZCLR __attribute__((section("sfrs"),address(0xBF883174)));
extern volatile uint32_t DCH1SSIZSET __attribute__((section("sfrs"),address(0xBF883178)));
extern volatile uint32_t DCH1SSIZINV __attribute__((section("sfrs"),address(0xBF88317C)));

extern volatile uint32_t DCH1DSIZ __attribute__((section("sfrs"), address(0xBF883180)));
extern volatile uint32_t DCH1DSIZCLR __attribute__((section("sfrs"),address(0xBF883184)));
extern volatile uint32_t DCH1DSIZSET __attribute__((section("sfrs"),address(0xBF883188)));
extern volatile uint32_t DCH1DSIZINV __attribute__((section("sfrs"),address(0xBF88318C)));

extern volatile uint32_t DCH1SPTR __attribute__((section("sfrs"), address(0xBF883190)));
extern volatile uint32_t DCH1SPTRCLR __attribute__((section("sfrs"),address(0xBF883194)));
extern volatile uint32_t DCH1SPTRSET __attribute__((section("sfrs"),address(0xBF883198)));
extern volatile uint32_t DCH1SPTRINV __attribute__((section("sfrs"),address(0xBF88319C)));

extern volatile uint32_t DCH1DPTR __attribute__((section("sfrs"), address(0xBF8831A0)));
extern volatile uint32_t DCH1DPTRCLR __attribute__((section("sfrs"),address(0xBF8831A4)));
extern volatile uint32_t DCH1DPTRSET __attribute__((section("sfrs"),address(0xBF8831A8)));
extern volatile uint32_t DCH1DPTRINV __attribute__((section("sfrs"),address(0xBF8831AC)));

extern volatile uint32_t DCH1CSIZ __attribute__((section("sfrs"), address(0xBF8831B0)));
extern volatile uint32_t DCH1CSIZCLR __attribute__((section("sfrs"),address(0xBF8831B4)));
extern volatile uint32_t DCH1CSIZSET __attribute__((section("sfrs"),address(0xBF8831B8)));
extern volatile uint32_t DCH1CSIZINV __attribute__((section("sfrs"),address(0xBF8831BC)));

extern volatile uint32_t DCH1CPTR __attribute__((section("sfrs"), address(0xBF8831C0)));
extern volatile uint32_t DCH1CPTRCLR __attribute__((section("sfrs"),address(0xBF8831C4)));
extern volatile uint32_t DCH1CPTRSET __attribute__((section("sfrs"),address(0xBF8831C8)));
extern volatile uint32_t DCH1CPTRINV __attribute__((section("sfrs"),address(0xBF8831CC)));

extern volatile uint32_t DCH1DAT __attribute__((section("sfrs"), address(0xBF8831D0)));
extern volatile uint32_t DCH1DATCLR __attribute__((section("sfrs"),address(0xBF8831D4)));
extern volatile uint32_t DCH1DATSET __attribute__((section("sfrs"),address(0xBF8831D8)));
extern volatile uint32_t DCH1DATINV __attribute__((section("sfrs"),address(0xBF8831DC)));

extern volatile uint32_t DCH2CON __attribute__((section("sfrs"), address(0xBF8831E0)));
typedef union {
  struct {
    uint32_t CHPRI:2;
    uint32_t CHEDET:1;
    uint32_t :1;
    uint32_t CHAEN:1;
    uint32_t CHCHN:1;
    uint32_t CHAED:1;
    uint32_t CHEN:1;
    uint32_t CHCHNS:1;
    uint32_t :6;
    uint32_t CHBUSY:1;
  };
  struct {
    uint32_t w:32;
  };
} __DCH2CONbits_t;
extern volatile __DCH2CONbits_t DCH2CONbits __asm__ ("DCH2CON") __attribute__((section("sfrs"), address(0xBF8831E0)));
extern volatile uint32_t DCH2CONCLR __attribute__((section("sfrs"),address(0xBF8831E4)));
extern volatile uint32_t DCH2CONSET __attribute__((section("sfrs"),address(0xBF8831E8)));
extern volatile uint32_t DCH2CONINV __attribute__((section("sfrs"),address(0xBF8831EC)));

extern volatile uint32_t DCH2ECON __attribute__((section("sfrs"), address(0xBF8831F0)));
typedef union {
  struct {
    uint32_t :3;
    uint32_t AIRQEN:1;
    uint32_t SIRQEN:1;
    uint32_t PATEN:1;
    uint32_t CABORT:1;
    uint32_t CFORCE:1;
    uint32_t CHSIRQ:8;
    uint32_t CHAIRQ:8;
  };
  struct {
    uint32_t w:32;
  };
} __DCH2ECONbits_t;
extern volatile __DCH2ECONbits_t DCH2ECONbits __asm__ ("DCH2ECON") __attribute__((section("sfrs"), address(0xBF8831F0)));
extern volatile uint32_t DCH2ECONCLR __attribute__((section("sfrs"),address(0xBF8831F4)));
extern volatile uint32_t DCH2ECONSET __attribute__((section("sfrs"),address(0xBF8831F8)));
extern volatile uint32_t DCH2ECONINV __attribute__((section("sfrs"),address(0xBF8831FC)));

extern volatile uint32_t DCH2INT __attribute__((section("sfrs"), address(0xBF883200)));
typedef union {
  struct {
    uint32_t CHERIF:1;
    uint32_t CHTAIF:1;
    uint32_t CHCCIF:1;
    uint32_t CHBCIF:1;
    uint32_t CHDHIF:1;
    uint32_t CHDDIF:1;
    uint32_t CHSHIF:1;
    uint32_t CHSDIF:1;
    uint32_t :8;
    uint32_t CHERIE:1;
    uint32_t CHTAIE:1;
    uint32_t CHCCIE:1;
    uint32_t CHBCIE:1;
    uint32_t CHDHIE:1;
    uint32_t CHDDIE:1;
    uint32_t CHSHIE:1;
    uint32_t CHSDIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __DCH2INTbits_t;
extern volatile __DCH2INTbits_t DCH2INTbits __asm__ ("DCH2INT") __attribute__((section("sfrs"), address(0xBF883200)));
extern volatile uint32_t DCH2INTCLR __attribute__((section("sfrs"),address(0xBF883204)));
extern volatile uint32_t DCH2INTSET __attribute__((section("sfrs"),address(0xBF883208)));
extern volatile uint32_t DCH2INTINV __attribute__((section("sfrs"),address(0xBF88320C)));

extern volatile uint32_t DCH2SSA __attribute__((section("sfrs"), address(0xBF883210)));
typedef struct {
  uint32_t CHSSA:32;
} __DCH2SSAbits_t;
extern volatile __DCH2SSAbits_t DCH2SSAbits __asm__ ("DCH2SSA") __attribute__((section("sfrs"), address(0xBF883210)));
extern volatile uint32_t DCH2SSACLR __attribute__((section("sfrs"),address(0xBF883214)));
extern volatile uint32_t DCH2SSASET __attribute__((section("sfrs"),address(0xBF883218)));
extern volatile uint32_t DCH2SSAINV __attribute__((section("sfrs"),address(0xBF88321C)));

extern volatile uint32_t DCH2DSA __attribute__((section("sfrs"), address(0xBF883220)));
typedef struct {
  uint32_t CHDSA:32;
} __DCH2DSAbits_t;
extern volatile __DCH2DSAbits_t DCH2DSAbits __asm__ ("DCH2DSA") __attribute__((section("sfrs"), address(0xBF883220)));
extern volatile uint32_t DCH2DSACLR __attribute__((section("sfrs"),address(0xBF883224)));
extern volatile uint32_t DCH2DSASET __attribute__((section("sfrs"),address(0xBF883228)));
extern volatile uint32_t DCH2DSAINV __attribute__((section("sfrs"),address(0xBF88322C)));

extern volatile uint32_t DCH2SSIZ __attribute__((section("sfrs"), address(0xBF883230)));
extern volatile uint32_t DCH2SSIZCLR __attribute__((section("sfrs"),address(0xBF883234)));
extern volatile uint32_t DCH2SSIZSET __attribute__((section("sfrs"),address(0xBF883238)));
extern volatile uint32_t DCH2SSIZINV __attribute__((section("sfrs"),address(0xBF88323C)));

extern volatile uint32_t DCH2DSIZ __attribute__((section("sfrs"), address(0xBF883240)));
extern volatile uint32_t DCH2DSIZCLR __attribute__((section("sfrs"),address(0xBF883244)));
extern volatile uint32_t DCH2DSIZSET __attribute__((section("sfrs"),address(0xBF883248)));
extern volatile uint32_t DCH2DSIZINV __attribute__((section("sfrs"),address(0xBF88324C)));

extern volatile uint32_t DCH2SPTR __attribute__((section("sfrs"), address(0xBF883250)));
extern volatile uint32_t DCH2SPTRCLR __attribute__((section("sfrs"),address(0xBF883254)));
extern volatile uint32_t DCH2SPTRSET __attribute__((section("sfrs"),address(0xBF883258)));
extern volatile uint32_t DCH2SPTRINV __attribute__((section("sfrs"),address(0xBF88325C)));

extern volatile uint32_t DCH2DPTR __attribute__((section("sfrs"), address(0xBF883260)));
extern volatile uint32_t DCH2DPTRCLR __attribute__((section("sfrs"),address(0xBF883264)));
extern volatile uint32_t DCH2DPTRSET __attribute__((section("sfrs"),address(0xBF883268)));
extern volatile uint32_t DCH2DPTRINV __attribute__((section("sfrs"),address(0xBF88326C)));

extern volatile uint32_t DCH2CSIZ __attribute__((section("sfrs"), address(0xBF883270)));
extern volatile uint32_t DCH2CSIZCLR __attribute__((section("sfrs"),address(0xBF883274)));
extern volatile uint32_t DCH2CSIZSET __attribute__((section("sfrs"),address(0xBF883278)));
extern volatile uint32_t DCH2CSIZINV __attribute__((section("sfrs"),address(0xBF88327C)));

extern volatile uint32_t DCH2CPTR __attribute__((section("sfrs"), address(0xBF883280)));
extern volatile uint32_t DCH2CPTRCLR __attribute__((section("sfrs"),address(0xBF883284)));
extern volatile uint32_t DCH2CPTRSET __attribute__((section("sfrs"),address(0xBF883288)));
extern volatile uint32_t DCH2CPTRINV __attribute__((section("sfrs"),address(0xBF88328C)));

extern volatile uint32_t DCH2DAT __attribute__((section("sfrs"), address(0xBF883290)));
extern volatile uint32_t DCH2DATCLR __attribute__((section("sfrs"),address(0xBF883294)));
extern volatile uint32_t DCH2DATSET __attribute__((section("sfrs"),address(0xBF883298)));
extern volatile uint32_t DCH2DATINV __attribute__((section("sfrs"),address(0xBF88329C)));

extern volatile uint32_t DCH3CON __attribute__((section("sfrs"), address(0xBF8832A0)));
typedef union {
  struct {
    uint32_t CHPRI:2;
    uint32_t CHEDET:1;
    uint32_t :1;
    uint32_t CHAEN:1;
    uint32_t CHCHN:1;
    uint32_t CHAED:1;
    uint32_t CHEN:1;
    uint32_t CHCHNS:1;
    uint32_t :6;
    uint32_t CHBUSY:1;
  };
  struct {
    uint32_t w:32;
  };
} __DCH3CONbits_t;
extern volatile __DCH3CONbits_t DCH3CONbits __asm__ ("DCH3CON") __attribute__((section("sfrs"), address(0xBF8832A0)));
extern volatile uint32_t DCH3CONCLR __attribute__((section("sfrs"),address(0xBF8832A4)));
extern volatile uint32_t DCH3CONSET __attribute__((section("sfrs"),address(0xBF8832A8)));
extern volatile uint32_t DCH3CONINV __attribute__((section("sfrs"),address(0xBF8832AC)));

extern volatile uint32_t DCH3ECON __attribute__((section("sfrs"), address(0xBF8832B0)));
typedef union {
  struct {
    uint32_t :3;
    uint32_t AIRQEN:1;
    uint32_t SIRQEN:1;
    uint32_t PATEN:1;
    uint32_t CABORT:1;
    uint32_t CFORCE:1;
    uint32_t CHSIRQ:8;
    uint32_t CHAIRQ:8;
  };
  struct {
    uint32_t w:32;
  };
} __DCH3ECONbits_t;
extern volatile __DCH3ECONbits_t DCH3ECONbits __asm__ ("DCH3ECON") __attribute__((section("sfrs"), address(0xBF8832B0)));
extern volatile uint32_t DCH3ECONCLR __attribute__((section("sfrs"),address(0xBF8832B4)));
extern volatile uint32_t DCH3ECONSET __attribute__((section("sfrs"),address(0xBF8832B8)));
extern volatile uint32_t DCH3ECONINV __attribute__((section("sfrs"),address(0xBF8832BC)));

extern volatile uint32_t DCH3INT __attribute__((section("sfrs"), address(0xBF8832C0)));
typedef union {
  struct {
    uint32_t CHERIF:1;
    uint32_t CHTAIF:1;
    uint32_t CHCCIF:1;
    uint32_t CHBCIF:1;
    uint32_t CHDHIF:1;
    uint32_t CHDDIF:1;
    uint32_t CHSHIF:1;
    uint32_t CHSDIF:1;
    uint32_t :8;
    uint32_t CHERIE:1;
    uint32_t CHTAIE:1;
    uint32_t CHCCIE:1;
    uint32_t CHBCIE:1;
    uint32_t CHDHIE:1;
    uint32_t CHDDIE:1;
    uint32_t CHSHIE:1;
    uint32_t CHSDIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __DCH3INTbits_t;
extern volatile __DCH3INTbits_t DCH3INTbits __asm__ ("DCH3INT") __attribute__((section("sfrs"), address(0xBF8832C0)));
extern volatile uint32_t DCH3INTCLR __attribute__((section("sfrs"),address(0xBF8832C4)));
extern volatile uint32_t DCH3INTSET __attribute__((section("sfrs"),address(0xBF8832C8)));
extern volatile uint32_t DCH3INTINV __attribute__((section("sfrs"),address(0xBF8832CC)));

extern volatile uint32_t DCH3SSA __attribute__((section("sfrs"), address(0xBF8832D0)));
typedef struct {
  uint32_t CHSSA:32;
} __DCH3SSAbits_t;
extern volatile __DCH3SSAbits_t DCH3SSAbits __asm__ ("DCH3SSA") __attribute__((section("sfrs"), address(0xBF8832D0)));
extern volatile uint32_t DCH3SSACLR __attribute__((section("sfrs"),address(0xBF8832D4)));
extern volatile uint32_t DCH3SSASET __attribute__((section("sfrs"),address(0xBF8832D8)));
extern volatile uint32_t DCH3SSAINV __attribute__((section("sfrs"),address(0xBF8832DC)));

extern volatile uint32_t DCH3DSA __attribute__((section("sfrs"), address(0xBF8832E0)));
typedef struct {
  uint32_t CHDSA:32;
} __DCH3DSAbits_t;
extern volatile __DCH3DSAbits_t DCH3DSAbits __asm__ ("DCH3DSA") __attribute__((section("sfrs"), address(0xBF8832E0)));
extern volatile uint32_t DCH3DSACLR __attribute__((section("sfrs"),address(0xBF8832E4)));
extern volatile uint32_t DCH3DSASET __attribute__((section("sfrs"),address(0xBF8832E8)));
extern volatile uint32_t DCH3DSAINV __attribute__((section("sfrs"),address(0xBF8832EC)));

extern volatile uint32_t DCH3SSIZ __attribute__((section("sfrs"), address(0xBF8832F0)));
extern volatile uint32_t DCH3SSIZCLR __attribute__((section("sfrs"),address(0xBF8832F4)));
extern volatile uint32_t DCH3SSIZSET __attribute__((section("sfrs"),address(0xBF8832F8)));
extern volatile uint32_t DCH3SSIZINV __attribute__((section("sfrs"),address(0xBF8832FC)));

extern volatile uint32_t DCH3DSIZ __attribute__((section("sfrs"), address(0xBF883300)));
extern volatile uint32_t DCH3DSIZCLR __attribute__((section("sfrs"),address(0xBF883304)));
extern volatile uint32_t DCH3DSIZSET __attribute__((section("sfrs"),address(0xBF883308)));
extern volatile uint32_t DCH3DSIZINV __attribute__((section("sfrs"),address(0xBF88330C)));

extern volatile uint32_t DCH3SPTR __attribute__((section("sfrs"), address(0xBF883310)));
extern volatile uint32_t DCH3SPTRCLR __attribute__((section("sfrs"),address(0xBF883314)));
extern volatile uint32_t DCH3SPTRSET __attribute__((section("sfrs"),address(0xBF883318)));
extern volatile uint32_t DCH3SPTRINV __attribute__((section("sfrs"),address(0xBF88331C)));

extern volatile uint32_t DCH3DPTR __attribute__((section("sfrs"), address(0xBF883320)));
extern volatile uint32_t DCH3DPTRCLR __attribute__((section("sfrs"),address(0xBF883324)));
extern volatile uint32_t DCH3DPTRSET __attribute__((section("sfrs"),address(0xBF883328)));
extern volatile uint32_t DCH3DPTRINV __attribute__((section("sfrs"),address(0xBF88332C)));

extern volatile uint32_t DCH3CSIZ __attribute__((section("sfrs"), address(0xBF883330)));
extern volatile uint32_t DCH3CSIZCLR __attribute__((section("sfrs"),address(0xBF883334)));
extern volatile uint32_t DCH3CSIZSET __attribute__((section("sfrs"),address(0xBF883338)));
extern volatile uint32_t DCH3CSIZINV __attribute__((section("sfrs"),address(0xBF88333C)));

extern volatile uint32_t DCH3CPTR __attribute__((section("sfrs"), address(0xBF883340)));
extern volatile uint32_t DCH3CPTRCLR __attribute__((section("sfrs"),address(0xBF883344)));
extern volatile uint32_t DCH3CPTRSET __attribute__((section("sfrs"),address(0xBF883348)));
extern volatile uint32_t DCH3CPTRINV __attribute__((section("sfrs"),address(0xBF88334C)));

extern volatile uint32_t DCH3DAT __attribute__((section("sfrs"), address(0xBF883350)));
extern volatile uint32_t DCH3DATCLR __attribute__((section("sfrs"),address(0xBF883354)));
extern volatile uint32_t DCH3DATSET __attribute__((section("sfrs"),address(0xBF883358)));
extern volatile uint32_t DCH3DATINV __attribute__((section("sfrs"),address(0xBF88335C)));

extern volatile uint32_t DCH4CON __attribute__((section("sfrs"), address(0xBF883360)));
typedef union {
  struct {
    uint32_t CHPRI:2;
    uint32_t CHEDET:1;
    uint32_t :1;
    uint32_t CHAEN:1;
    uint32_t CHCHN:1;
    uint32_t CHAED:1;
    uint32_t CHEN:1;
    uint32_t CHCHNS:1;
    uint32_t :6;
    uint32_t CHBUSY:1;
  };
  struct {
    uint32_t w:32;
  };
} __DCH4CONbits_t;
extern volatile __DCH4CONbits_t DCH4CONbits __asm__ ("DCH4CON") __attribute__((section("sfrs"), address(0xBF883360)));
extern volatile uint32_t DCH4CONCLR __attribute__((section("sfrs"),address(0xBF883364)));
extern volatile uint32_t DCH4CONSET __attribute__((section("sfrs"),address(0xBF883368)));
extern volatile uint32_t DCH4CONINV __attribute__((section("sfrs"),address(0xBF88336C)));

extern volatile uint32_t DCH4ECON __attribute__((section("sfrs"), address(0xBF883370)));
typedef union {
  struct {
    uint32_t :3;
    uint32_t AIRQEN:1;
    uint32_t SIRQEN:1;
    uint32_t PATEN:1;
    uint32_t CABORT:1;
    uint32_t CFORCE:1;
    uint32_t CHSIRQ:8;
    uint32_t CHAIRQ:8;
  };
  struct {
    uint32_t w:32;
  };
} __DCH4ECONbits_t;
extern volatile __DCH4ECONbits_t DCH4ECONbits __asm__ ("DCH4ECON") __attribute__((section("sfrs"), address(0xBF883370)));
extern volatile uint32_t DCH4ECONCLR __attribute__((section("sfrs"),address(0xBF883374)));
extern volatile uint32_t DCH4ECONSET __attribute__((section("sfrs"),address(0xBF883378)));
extern volatile uint32_t DCH4ECONINV __attribute__((section("sfrs"),address(0xBF88337C)));

extern volatile uint32_t DCH4INT __attribute__((section("sfrs"), address(0xBF883380)));
typedef union {
  struct {
    uint32_t CHERIF:1;
    uint32_t CHTAIF:1;
    uint32_t CHCCIF:1;
    uint32_t CHBCIF:1;
    uint32_t CHDHIF:1;
    uint32_t CHDDIF:1;
    uint32_t CHSHIF:1;
    uint32_t CHSDIF:1;
    uint32_t :8;
    uint32_t CHERIE:1;
    uint32_t CHTAIE:1;
    uint32_t CHCCIE:1;
    uint32_t CHBCIE:1;
    uint32_t CHDHIE:1;
    uint32_t CHDDIE:1;
    uint32_t CHSHIE:1;
    uint32_t CHSDIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __DCH4INTbits_t;
extern volatile __DCH4INTbits_t DCH4INTbits __asm__ ("DCH4INT") __attribute__((section("sfrs"), address(0xBF883380)));
extern volatile uint32_t DCH4INTCLR __attribute__((section("sfrs"),address(0xBF883384)));
extern volatile uint32_t DCH4INTSET __attribute__((section("sfrs"),address(0xBF883388)));
extern volatile uint32_t DCH4INTINV __attribute__((section("sfrs"),address(0xBF88338C)));

extern volatile uint32_t DCH4SSA __attribute__((section("sfrs"), address(0xBF883390)));
typedef struct {
  uint32_t CHSSA:32;
} __DCH4SSAbits_t;
extern volatile __DCH4SSAbits_t DCH4SSAbits __asm__ ("DCH4SSA") __attribute__((section("sfrs"), address(0xBF883390)));
extern volatile uint32_t DCH4SSACLR __attribute__((section("sfrs"),address(0xBF883394)));
extern volatile uint32_t DCH4SSASET __attribute__((section("sfrs"),address(0xBF883398)));
extern volatile uint32_t DCH4SSAINV __attribute__((section("sfrs"),address(0xBF88339C)));

extern volatile uint32_t DCH4DSA __attribute__((section("sfrs"), address(0xBF8833A0)));
typedef struct {
  uint32_t CHDSA:32;
} __DCH4DSAbits_t;
extern volatile __DCH4DSAbits_t DCH4DSAbits __asm__ ("DCH4DSA") __attribute__((section("sfrs"), address(0xBF8833A0)));
extern volatile uint32_t DCH4DSACLR __attribute__((section("sfrs"),address(0xBF8833A4)));
extern volatile uint32_t DCH4DSASET __attribute__((section("sfrs"),address(0xBF8833A8)));
extern volatile uint32_t DCH4DSAINV __attribute__((section("sfrs"),address(0xBF8833AC)));

extern volatile uint32_t DCH4SSIZ __attribute__((section("sfrs"), address(0xBF8833B0)));
extern volatile uint32_t DCH4SSIZCLR __attribute__((section("sfrs"),address(0xBF8833B4)));
extern volatile uint32_t DCH4SSIZSET __attribute__((section("sfrs"),address(0xBF8833B8)));
extern volatile uint32_t DCH4SSIZINV __attribute__((section("sfrs"),address(0xBF8833BC)));

extern volatile uint32_t DCH4DSIZ __attribute__((section("sfrs"), address(0xBF8833C0)));
extern volatile uint32_t DCH4DSIZCLR __attribute__((section("sfrs"),address(0xBF8833C4)));
extern volatile uint32_t DCH4DSIZSET __attribute__((section("sfrs"),address(0xBF8833C8)));
extern volatile uint32_t DCH4DSIZINV __attribute__((section("sfrs"),address(0xBF8833CC)));

extern volatile uint32_t DCH4SPTR __attribute__((section("sfrs"), address(0xBF8833D0)));
extern volatile uint32_t DCH4SPTRCLR __attribute__((section("sfrs"),address(0xBF8833D4)));
extern volatile uint32_t DCH4SPTRSET __attribute__((section("sfrs"),address(0xBF8833D8)));
extern volatile uint32_t DCH4SPTRINV __attribute__((section("sfrs"),address(0xBF8833DC)));

extern volatile uint32_t DCH4DPTR __attribute__((section("sfrs"), address(0xBF8833E0)));
extern volatile uint32_t DCH4DPTRCLR __attribute__((section("sfrs"),address(0xBF8833E4)));
extern volatile uint32_t DCH4DPTRSET __attribute__((section("sfrs"),address(0xBF8833E8)));
extern volatile uint32_t DCH4DPTRINV __attribute__((section("sfrs"),address(0xBF8833EC)));

extern volatile uint32_t DCH4CSIZ __attribute__((section("sfrs"), address(0xBF8833F0)));
extern volatile uint32_t DCH4CSIZCLR __attribute__((section("sfrs"),address(0xBF8833F4)));
extern volatile uint32_t DCH4CSIZSET __attribute__((section("sfrs"),address(0xBF8833F8)));
extern volatile uint32_t DCH4CSIZINV __attribute__((section("sfrs"),address(0xBF8833FC)));

extern volatile uint32_t DCH4CPTR __attribute__((section("sfrs"), address(0xBF883400)));
extern volatile uint32_t DCH4CPTRCLR __attribute__((section("sfrs"),address(0xBF883404)));
extern volatile uint32_t DCH4CPTRSET __attribute__((section("sfrs"),address(0xBF883408)));
extern volatile uint32_t DCH4CPTRINV __attribute__((section("sfrs"),address(0xBF88340C)));

extern volatile uint32_t DCH4DAT __attribute__((section("sfrs"), address(0xBF883410)));
extern volatile uint32_t DCH4DATCLR __attribute__((section("sfrs"),address(0xBF883414)));
extern volatile uint32_t DCH4DATSET __attribute__((section("sfrs"),address(0xBF883418)));
extern volatile uint32_t DCH4DATINV __attribute__((section("sfrs"),address(0xBF88341C)));

extern volatile uint32_t DCH5CON __attribute__((section("sfrs"), address(0xBF883420)));
typedef union {
  struct {
    uint32_t CHPRI:2;
    uint32_t CHEDET:1;
    uint32_t :1;
    uint32_t CHAEN:1;
    uint32_t CHCHN:1;
    uint32_t CHAED:1;
    uint32_t CHEN:1;
    uint32_t CHCHNS:1;
    uint32_t :6;
    uint32_t CHBUSY:1;
  };
  struct {
    uint32_t w:32;
  };
} __DCH5CONbits_t;
extern volatile __DCH5CONbits_t DCH5CONbits __asm__ ("DCH5CON") __attribute__((section("sfrs"), address(0xBF883420)));
extern volatile uint32_t DCH5CONCLR __attribute__((section("sfrs"),address(0xBF883424)));
extern volatile uint32_t DCH5CONSET __attribute__((section("sfrs"),address(0xBF883428)));
extern volatile uint32_t DCH5CONINV __attribute__((section("sfrs"),address(0xBF88342C)));

extern volatile uint32_t DCH5ECON __attribute__((section("sfrs"), address(0xBF883430)));
typedef union {
  struct {
    uint32_t :3;
    uint32_t AIRQEN:1;
    uint32_t SIRQEN:1;
    uint32_t PATEN:1;
    uint32_t CABORT:1;
    uint32_t CFORCE:1;
    uint32_t CHSIRQ:8;
    uint32_t CHAIRQ:8;
  };
  struct {
    uint32_t w:32;
  };
} __DCH5ECONbits_t;
extern volatile __DCH5ECONbits_t DCH5ECONbits __asm__ ("DCH5ECON") __attribute__((section("sfrs"), address(0xBF883430)));
extern volatile uint32_t DCH5ECONCLR __attribute__((section("sfrs"),address(0xBF883434)));
extern volatile uint32_t DCH5ECONSET __attribute__((section("sfrs"),address(0xBF883438)));
extern volatile uint32_t DCH5ECONINV __attribute__((section("sfrs"),address(0xBF88343C)));

extern volatile uint32_t DCH5INT __attribute__((section("sfrs"), address(0xBF883440)));
typedef union {
  struct {
    uint32_t CHERIF:1;
    uint32_t CHTAIF:1;
    uint32_t CHCCIF:1;
    uint32_t CHBCIF:1;
    uint32_t CHDHIF:1;
    uint32_t CHDDIF:1;
    uint32_t CHSHIF:1;
    uint32_t CHSDIF:1;
    uint32_t :8;
    uint32_t CHERIE:1;
    uint32_t CHTAIE:1;
    uint32_t CHCCIE:1;
    uint32_t CHBCIE:1;
    uint32_t CHDHIE:1;
    uint32_t CHDDIE:1;
    uint32_t CHSHIE:1;
    uint32_t CHSDIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __DCH5INTbits_t;
extern volatile __DCH5INTbits_t DCH5INTbits __asm__ ("DCH5INT") __attribute__((section("sfrs"), address(0xBF883440)));
extern volatile uint32_t DCH5INTCLR __attribute__((section("sfrs"),address(0xBF883444)));
extern volatile uint32_t DCH5INTSET __attribute__((section("sfrs"),address(0xBF883448)));
extern volatile uint32_t DCH5INTINV __attribute__((section("sfrs"),address(0xBF88344C)));

extern volatile uint32_t DCH5SSA __attribute__((section("sfrs"), address(0xBF883450)));
typedef struct {
  uint32_t CHSSA:32;
} __DCH5SSAbits_t;
extern volatile __DCH5SSAbits_t DCH5SSAbits __asm__ ("DCH5SSA") __attribute__((section("sfrs"), address(0xBF883450)));
extern volatile uint32_t DCH5SSACLR __attribute__((section("sfrs"),address(0xBF883454)));
extern volatile uint32_t DCH5SSASET __attribute__((section("sfrs"),address(0xBF883458)));
extern volatile uint32_t DCH5SSAINV __attribute__((section("sfrs"),address(0xBF88345C)));

extern volatile uint32_t DCH5DSA __attribute__((section("sfrs"), address(0xBF883460)));
typedef struct {
  uint32_t CHDSA:32;
} __DCH5DSAbits_t;
extern volatile __DCH5DSAbits_t DCH5DSAbits __asm__ ("DCH5DSA") __attribute__((section("sfrs"), address(0xBF883460)));
extern volatile uint32_t DCH5DSACLR __attribute__((section("sfrs"),address(0xBF883464)));
extern volatile uint32_t DCH5DSASET __attribute__((section("sfrs"),address(0xBF883468)));
extern volatile uint32_t DCH5DSAINV __attribute__((section("sfrs"),address(0xBF88346C)));

extern volatile uint32_t DCH5SSIZ __attribute__((section("sfrs"), address(0xBF883470)));
extern volatile uint32_t DCH5SSIZCLR __attribute__((section("sfrs"),address(0xBF883474)));
extern volatile uint32_t DCH5SSIZSET __attribute__((section("sfrs"),address(0xBF883478)));
extern volatile uint32_t DCH5SSIZINV __attribute__((section("sfrs"),address(0xBF88347C)));

extern volatile uint32_t DCH5DSIZ __attribute__((section("sfrs"), address(0xBF883480)));
extern volatile uint32_t DCH5DSIZCLR __attribute__((section("sfrs"),address(0xBF883484)));
extern volatile uint32_t DCH5DSIZSET __attribute__((section("sfrs"),address(0xBF883488)));
extern volatile uint32_t DCH5DSIZINV __attribute__((section("sfrs"),address(0xBF88348C)));

extern volatile uint32_t DCH5SPTR __attribute__((section("sfrs"), address(0xBF883490)));
extern volatile uint32_t DCH5SPTRCLR __attribute__((section("sfrs"),address(0xBF883494)));
extern volatile uint32_t DCH5SPTRSET __attribute__((section("sfrs"),address(0xBF883498)));
extern volatile uint32_t DCH5SPTRINV __attribute__((section("sfrs"),address(0xBF88349C)));

extern volatile uint32_t DCH5DPTR __attribute__((section("sfrs"), address(0xBF8834A0)));
extern volatile uint32_t DCH5DPTRCLR __attribute__((section("sfrs"),address(0xBF8834A4)));
extern volatile uint32_t DCH5DPTRSET __attribute__((section("sfrs"),address(0xBF8834A8)));
extern volatile uint32_t DCH5DPTRINV __attribute__((section("sfrs"),address(0xBF8834AC)));

extern volatile uint32_t DCH5CSIZ __attribute__((section("sfrs"), address(0xBF8834B0)));
extern volatile uint32_t DCH5CSIZCLR __attribute__((section("sfrs"),address(0xBF8834B4)));
extern volatile uint32_t DCH5CSIZSET __attribute__((section("sfrs"),address(0xBF8834B8)));
extern volatile uint32_t DCH5CSIZINV __attribute__((section("sfrs"),address(0xBF8834BC)));

extern volatile uint32_t DCH5CPTR __attribute__((section("sfrs"), address(0xBF8834C0)));
extern volatile uint32_t DCH5CPTRCLR __attribute__((section("sfrs"),address(0xBF8834C4)));
extern volatile uint32_t DCH5CPTRSET __attribute__((section("sfrs"),address(0xBF8834C8)));
extern volatile uint32_t DCH5CPTRINV __attribute__((section("sfrs"),address(0xBF8834CC)));

extern volatile uint32_t DCH5DAT __attribute__((section("sfrs"), address(0xBF8834D0)));
extern volatile uint32_t DCH5DATCLR __attribute__((section("sfrs"),address(0xBF8834D4)));
extern volatile uint32_t DCH5DATSET __attribute__((section("sfrs"),address(0xBF8834D8)));
extern volatile uint32_t DCH5DATINV __attribute__((section("sfrs"),address(0xBF8834DC)));

extern volatile uint32_t DCH6CON __attribute__((section("sfrs"), address(0xBF8834E0)));
typedef union {
  struct {
    uint32_t CHPRI:2;
    uint32_t CHEDET:1;
    uint32_t :1;
    uint32_t CHAEN:1;
    uint32_t CHCHN:1;
    uint32_t CHAED:1;
    uint32_t CHEN:1;
    uint32_t CHCHNS:1;
    uint32_t :6;
    uint32_t CHBUSY:1;
  };
  struct {
    uint32_t w:32;
  };
} __DCH6CONbits_t;
extern volatile __DCH6CONbits_t DCH6CONbits __asm__ ("DCH6CON") __attribute__((section("sfrs"), address(0xBF8834E0)));
extern volatile uint32_t DCH6CONCLR __attribute__((section("sfrs"),address(0xBF8834E4)));
extern volatile uint32_t DCH6CONSET __attribute__((section("sfrs"),address(0xBF8834E8)));
extern volatile uint32_t DCH6CONINV __attribute__((section("sfrs"),address(0xBF8834EC)));

extern volatile uint32_t DCH6ECON __attribute__((section("sfrs"), address(0xBF8834F0)));
typedef union {
  struct {
    uint32_t :3;
    uint32_t AIRQEN:1;
    uint32_t SIRQEN:1;
    uint32_t PATEN:1;
    uint32_t CABORT:1;
    uint32_t CFORCE:1;
    uint32_t CHSIRQ:8;
    uint32_t CHAIRQ:8;
  };
  struct {
    uint32_t w:32;
  };
} __DCH6ECONbits_t;
extern volatile __DCH6ECONbits_t DCH6ECONbits __asm__ ("DCH6ECON") __attribute__((section("sfrs"), address(0xBF8834F0)));
extern volatile uint32_t DCH6ECONCLR __attribute__((section("sfrs"),address(0xBF8834F4)));
extern volatile uint32_t DCH6ECONSET __attribute__((section("sfrs"),address(0xBF8834F8)));
extern volatile uint32_t DCH6ECONINV __attribute__((section("sfrs"),address(0xBF8834FC)));

extern volatile uint32_t DCH6INT __attribute__((section("sfrs"), address(0xBF883500)));
typedef union {
  struct {
    uint32_t CHERIF:1;
    uint32_t CHTAIF:1;
    uint32_t CHCCIF:1;
    uint32_t CHBCIF:1;
    uint32_t CHDHIF:1;
    uint32_t CHDDIF:1;
    uint32_t CHSHIF:1;
    uint32_t CHSDIF:1;
    uint32_t :8;
    uint32_t CHERIE:1;
    uint32_t CHTAIE:1;
    uint32_t CHCCIE:1;
    uint32_t CHBCIE:1;
    uint32_t CHDHIE:1;
    uint32_t CHDDIE:1;
    uint32_t CHSHIE:1;
    uint32_t CHSDIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __DCH6INTbits_t;
extern volatile __DCH6INTbits_t DCH6INTbits __asm__ ("DCH6INT") __attribute__((section("sfrs"), address(0xBF883500)));
extern volatile uint32_t DCH6INTCLR __attribute__((section("sfrs"),address(0xBF883504)));
extern volatile uint32_t DCH6INTSET __attribute__((section("sfrs"),address(0xBF883508)));
extern volatile uint32_t DCH6INTINV __attribute__((section("sfrs"),address(0xBF88350C)));

extern volatile uint32_t DCH6SSA __attribute__((section("sfrs"), address(0xBF883510)));
typedef struct {
  uint32_t CHSSA:32;
} __DCH6SSAbits_t;
extern volatile __DCH6SSAbits_t DCH6SSAbits __asm__ ("DCH6SSA") __attribute__((section("sfrs"), address(0xBF883510)));
extern volatile uint32_t DCH6SSACLR __attribute__((section("sfrs"),address(0xBF883514)));
extern volatile uint32_t DCH6SSASET __attribute__((section("sfrs"),address(0xBF883518)));
extern volatile uint32_t DCH6SSAINV __attribute__((section("sfrs"),address(0xBF88351C)));

extern volatile uint32_t DCH6DSA __attribute__((section("sfrs"), address(0xBF883520)));
typedef struct {
  uint32_t CHDSA:32;
} __DCH6DSAbits_t;
extern volatile __DCH6DSAbits_t DCH6DSAbits __asm__ ("DCH6DSA") __attribute__((section("sfrs"), address(0xBF883520)));
extern volatile uint32_t DCH6DSACLR __attribute__((section("sfrs"),address(0xBF883524)));
extern volatile uint32_t DCH6DSASET __attribute__((section("sfrs"),address(0xBF883528)));
extern volatile uint32_t DCH6DSAINV __attribute__((section("sfrs"),address(0xBF88352C)));

extern volatile uint32_t DCH6SSIZ __attribute__((section("sfrs"), address(0xBF883530)));
extern volatile uint32_t DCH6SSIZCLR __attribute__((section("sfrs"),address(0xBF883534)));
extern volatile uint32_t DCH6SSIZSET __attribute__((section("sfrs"),address(0xBF883538)));
extern volatile uint32_t DCH6SSIZINV __attribute__((section("sfrs"),address(0xBF88353C)));

extern volatile uint32_t DCH6DSIZ __attribute__((section("sfrs"), address(0xBF883540)));
extern volatile uint32_t DCH6DSIZCLR __attribute__((section("sfrs"),address(0xBF883544)));
extern volatile uint32_t DCH6DSIZSET __attribute__((section("sfrs"),address(0xBF883548)));
extern volatile uint32_t DCH6DSIZINV __attribute__((section("sfrs"),address(0xBF88354C)));

extern volatile uint32_t DCH6SPTR __attribute__((section("sfrs"), address(0xBF883550)));
extern volatile uint32_t DCH6SPTRCLR __attribute__((section("sfrs"),address(0xBF883554)));
extern volatile uint32_t DCH6SPTRSET __attribute__((section("sfrs"),address(0xBF883558)));
extern volatile uint32_t DCH6SPTRINV __attribute__((section("sfrs"),address(0xBF88355C)));

extern volatile uint32_t DCH6DPTR __attribute__((section("sfrs"), address(0xBF883560)));
extern volatile uint32_t DCH6DPTRCLR __attribute__((section("sfrs"),address(0xBF883564)));
extern volatile uint32_t DCH6DPTRSET __attribute__((section("sfrs"),address(0xBF883568)));
extern volatile uint32_t DCH6DPTRINV __attribute__((section("sfrs"),address(0xBF88356C)));

extern volatile uint32_t DCH6CSIZ __attribute__((section("sfrs"), address(0xBF883570)));
extern volatile uint32_t DCH6CSIZCLR __attribute__((section("sfrs"),address(0xBF883574)));
extern volatile uint32_t DCH6CSIZSET __attribute__((section("sfrs"),address(0xBF883578)));
extern volatile uint32_t DCH6CSIZINV __attribute__((section("sfrs"),address(0xBF88357C)));

extern volatile uint32_t DCH6CPTR __attribute__((section("sfrs"), address(0xBF883580)));
extern volatile uint32_t DCH6CPTRCLR __attribute__((section("sfrs"),address(0xBF883584)));
extern volatile uint32_t DCH6CPTRSET __attribute__((section("sfrs"),address(0xBF883588)));
extern volatile uint32_t DCH6CPTRINV __attribute__((section("sfrs"),address(0xBF88358C)));

extern volatile uint32_t DCH6DAT __attribute__((section("sfrs"), address(0xBF883590)));
extern volatile uint32_t DCH6DATCLR __attribute__((section("sfrs"),address(0xBF883594)));
extern volatile uint32_t DCH6DATSET __attribute__((section("sfrs"),address(0xBF883598)));
extern volatile uint32_t DCH6DATINV __attribute__((section("sfrs"),address(0xBF88359C)));

extern volatile uint32_t DCH7CON __attribute__((section("sfrs"), address(0xBF8835A0)));
typedef union {
  struct {
    uint32_t CHPRI:2;
    uint32_t CHEDET:1;
    uint32_t :1;
    uint32_t CHAEN:1;
    uint32_t CHCHN:1;
    uint32_t CHAED:1;
    uint32_t CHEN:1;
    uint32_t CHCHNS:1;
    uint32_t :6;
    uint32_t CHBUSY:1;
  };
  struct {
    uint32_t w:32;
  };
} __DCH7CONbits_t;
extern volatile __DCH7CONbits_t DCH7CONbits __asm__ ("DCH7CON") __attribute__((section("sfrs"), address(0xBF8835A0)));
extern volatile uint32_t DCH7CONCLR __attribute__((section("sfrs"),address(0xBF8835A4)));
extern volatile uint32_t DCH7CONSET __attribute__((section("sfrs"),address(0xBF8835A8)));
extern volatile uint32_t DCH7CONINV __attribute__((section("sfrs"),address(0xBF8835AC)));

extern volatile uint32_t DCH7ECON __attribute__((section("sfrs"), address(0xBF8835B0)));
typedef union {
  struct {
    uint32_t :3;
    uint32_t AIRQEN:1;
    uint32_t SIRQEN:1;
    uint32_t PATEN:1;
    uint32_t CABORT:1;
    uint32_t CFORCE:1;
    uint32_t CHSIRQ:8;
    uint32_t CHAIRQ:8;
  };
  struct {
    uint32_t w:32;
  };
} __DCH7ECONbits_t;
extern volatile __DCH7ECONbits_t DCH7ECONbits __asm__ ("DCH7ECON") __attribute__((section("sfrs"), address(0xBF8835B0)));
extern volatile uint32_t DCH7ECONCLR __attribute__((section("sfrs"),address(0xBF8835B4)));
extern volatile uint32_t DCH7ECONSET __attribute__((section("sfrs"),address(0xBF8835B8)));
extern volatile uint32_t DCH7ECONINV __attribute__((section("sfrs"),address(0xBF8835BC)));

extern volatile uint32_t DCH7INT __attribute__((section("sfrs"), address(0xBF8835C0)));
typedef union {
  struct {
    uint32_t CHERIF:1;
    uint32_t CHTAIF:1;
    uint32_t CHCCIF:1;
    uint32_t CHBCIF:1;
    uint32_t CHDHIF:1;
    uint32_t CHDDIF:1;
    uint32_t CHSHIF:1;
    uint32_t CHSDIF:1;
    uint32_t :8;
    uint32_t CHERIE:1;
    uint32_t CHTAIE:1;
    uint32_t CHCCIE:1;
    uint32_t CHBCIE:1;
    uint32_t CHDHIE:1;
    uint32_t CHDDIE:1;
    uint32_t CHSHIE:1;
    uint32_t CHSDIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __DCH7INTbits_t;
extern volatile __DCH7INTbits_t DCH7INTbits __asm__ ("DCH7INT") __attribute__((section("sfrs"), address(0xBF8835C0)));
extern volatile uint32_t DCH7INTCLR __attribute__((section("sfrs"),address(0xBF8835C4)));
extern volatile uint32_t DCH7INTSET __attribute__((section("sfrs"),address(0xBF8835C8)));
extern volatile uint32_t DCH7INTINV __attribute__((section("sfrs"),address(0xBF8835CC)));

extern volatile uint32_t DCH7SSA __attribute__((section("sfrs"), address(0xBF8835D0)));
typedef struct {
  uint32_t CHSSA:32;
} __DCH7SSAbits_t;
extern volatile __DCH7SSAbits_t DCH7SSAbits __asm__ ("DCH7SSA") __attribute__((section("sfrs"), address(0xBF8835D0)));
extern volatile uint32_t DCH7SSACLR __attribute__((section("sfrs"),address(0xBF8835D4)));
extern volatile uint32_t DCH7SSASET __attribute__((section("sfrs"),address(0xBF8835D8)));
extern volatile uint32_t DCH7SSAINV __attribute__((section("sfrs"),address(0xBF8835DC)));

extern volatile uint32_t DCH7DSA __attribute__((section("sfrs"), address(0xBF8835E0)));
typedef struct {
  uint32_t CHDSA:32;
} __DCH7DSAbits_t;
extern volatile __DCH7DSAbits_t DCH7DSAbits __asm__ ("DCH7DSA") __attribute__((section("sfrs"), address(0xBF8835E0)));
extern volatile uint32_t DCH7DSACLR __attribute__((section("sfrs"),address(0xBF8835E4)));
extern volatile uint32_t DCH7DSASET __attribute__((section("sfrs"),address(0xBF8835E8)));
extern volatile uint32_t DCH7DSAINV __attribute__((section("sfrs"),address(0xBF8835EC)));

extern volatile uint32_t DCH7SSIZ __attribute__((section("sfrs"), address(0xBF8835F0)));
extern volatile uint32_t DCH7SSIZCLR __attribute__((section("sfrs"),address(0xBF8835F4)));
extern volatile uint32_t DCH7SSIZSET __attribute__((section("sfrs"),address(0xBF8835F8)));
extern volatile uint32_t DCH7SSIZINV __attribute__((section("sfrs"),address(0xBF8835FC)));

extern volatile uint32_t DCH7DSIZ __attribute__((section("sfrs"), address(0xBF883600)));
extern volatile uint32_t DCH7DSIZCLR __attribute__((section("sfrs"),address(0xBF883604)));
extern volatile uint32_t DCH7DSIZSET __attribute__((section("sfrs"),address(0xBF883608)));
extern volatile uint32_t DCH7DSIZINV __attribute__((section("sfrs"),address(0xBF88360C)));

extern volatile uint32_t DCH7SPTR __attribute__((section("sfrs"), address(0xBF883610)));
extern volatile uint32_t DCH7SPTRCLR __attribute__((section("sfrs"),address(0xBF883614)));
extern volatile uint32_t DCH7SPTRSET __attribute__((section("sfrs"),address(0xBF883618)));
extern volatile uint32_t DCH7SPTRINV __attribute__((section("sfrs"),address(0xBF88361C)));

extern volatile uint32_t DCH7DPTR __attribute__((section("sfrs"), address(0xBF883620)));
extern volatile uint32_t DCH7DPTRCLR __attribute__((section("sfrs"),address(0xBF883624)));
extern volatile uint32_t DCH7DPTRSET __attribute__((section("sfrs"),address(0xBF883628)));
extern volatile uint32_t DCH7DPTRINV __attribute__((section("sfrs"),address(0xBF88362C)));

extern volatile uint32_t DCH7CSIZ __attribute__((section("sfrs"), address(0xBF883630)));
extern volatile uint32_t DCH7CSIZCLR __attribute__((section("sfrs"),address(0xBF883634)));
extern volatile uint32_t DCH7CSIZSET __attribute__((section("sfrs"),address(0xBF883638)));
extern volatile uint32_t DCH7CSIZINV __attribute__((section("sfrs"),address(0xBF88363C)));

extern volatile uint32_t DCH7CPTR __attribute__((section("sfrs"), address(0xBF883640)));
extern volatile uint32_t DCH7CPTRCLR __attribute__((section("sfrs"),address(0xBF883644)));
extern volatile uint32_t DCH7CPTRSET __attribute__((section("sfrs"),address(0xBF883648)));
extern volatile uint32_t DCH7CPTRINV __attribute__((section("sfrs"),address(0xBF88364C)));

extern volatile uint32_t DCH7DAT __attribute__((section("sfrs"), address(0xBF883650)));
extern volatile uint32_t DCH7DATCLR __attribute__((section("sfrs"),address(0xBF883654)));
extern volatile uint32_t DCH7DATSET __attribute__((section("sfrs"),address(0xBF883658)));
extern volatile uint32_t DCH7DATINV __attribute__((section("sfrs"),address(0xBF88365C)));

extern volatile uint32_t CHECON __attribute__((section("sfrs"), address(0xBF884000)));
typedef union {
  struct {
    uint32_t PFMWS:3;
    uint32_t :1;
    uint32_t PREFEN:2;
    uint32_t :2;
    uint32_t DCSZ:2;
    uint32_t :6;
    uint32_t CHECOH:1;
  };
  struct {
    uint32_t w:32;
  };
} __CHECONbits_t;
extern volatile __CHECONbits_t CHECONbits __asm__ ("CHECON") __attribute__((section("sfrs"), address(0xBF884000)));
extern volatile uint32_t CHECONCLR __attribute__((section("sfrs"),address(0xBF884004)));
extern volatile uint32_t CHECONSET __attribute__((section("sfrs"),address(0xBF884008)));
extern volatile uint32_t CHECONINV __attribute__((section("sfrs"),address(0xBF88400C)));

extern volatile uint32_t CHEACC __attribute__((section("sfrs"), address(0xBF884010)));
typedef struct {
  uint32_t CHEIDX:4;
  uint32_t :27;
  uint32_t CHEWEN:1;
} __CHEACCbits_t;
extern volatile __CHEACCbits_t CHEACCbits __asm__ ("CHEACC") __attribute__((section("sfrs"), address(0xBF884010)));
extern volatile uint32_t CHEACCCLR __attribute__((section("sfrs"),address(0xBF884014)));
extern volatile uint32_t CHEACCSET __attribute__((section("sfrs"),address(0xBF884018)));
extern volatile uint32_t CHEACCINV __attribute__((section("sfrs"),address(0xBF88401C)));

extern volatile uint32_t CHETAG __attribute__((section("sfrs"), address(0xBF884020)));
typedef union {
  struct {
    uint32_t :1;
    uint32_t LTYPE:1;
    uint32_t LLOCK:1;
    uint32_t LVALID:1;
    uint32_t LTAG:20;
    uint32_t :7;
    uint32_t LTAGBOOT:1;
  };
  struct {
    uint32_t w:32;
  };
} __CHETAGbits_t;
extern volatile __CHETAGbits_t CHETAGbits __asm__ ("CHETAG") __attribute__((section("sfrs"), address(0xBF884020)));
extern volatile uint32_t CHETAGCLR __attribute__((section("sfrs"),address(0xBF884024)));
extern volatile uint32_t CHETAGSET __attribute__((section("sfrs"),address(0xBF884028)));
extern volatile uint32_t CHETAGINV __attribute__((section("sfrs"),address(0xBF88402C)));

extern volatile uint32_t CHEMSK __attribute__((section("sfrs"), address(0xBF884030)));
typedef struct {
  uint32_t :5;
  uint32_t LMASK:11;
} __CHEMSKbits_t;
extern volatile __CHEMSKbits_t CHEMSKbits __asm__ ("CHEMSK") __attribute__((section("sfrs"), address(0xBF884030)));
extern volatile uint32_t CHEMSKCLR __attribute__((section("sfrs"),address(0xBF884034)));
extern volatile uint32_t CHEMSKSET __attribute__((section("sfrs"),address(0xBF884038)));
extern volatile uint32_t CHEMSKINV __attribute__((section("sfrs"),address(0xBF88403C)));

extern volatile uint32_t CHEW0 __attribute__((section("sfrs"), address(0xBF884040)));
typedef struct {
  uint32_t CHEW0:32;
} __CHEW0bits_t;
extern volatile __CHEW0bits_t CHEW0bits __asm__ ("CHEW0") __attribute__((section("sfrs"), address(0xBF884040)));

extern volatile uint32_t CHEW1 __attribute__((section("sfrs"), address(0xBF884050)));
typedef struct {
  uint32_t CHEW1:32;
} __CHEW1bits_t;
extern volatile __CHEW1bits_t CHEW1bits __asm__ ("CHEW1") __attribute__((section("sfrs"), address(0xBF884050)));

extern volatile uint32_t CHEW2 __attribute__((section("sfrs"), address(0xBF884060)));
typedef struct {
  uint32_t CHEW2:32;
} __CHEW2bits_t;
extern volatile __CHEW2bits_t CHEW2bits __asm__ ("CHEW2") __attribute__((section("sfrs"), address(0xBF884060)));

extern volatile uint32_t CHEW3 __attribute__((section("sfrs"), address(0xBF884070)));
typedef struct {
  uint32_t CHEW3:32;
} __CHEW3bits_t;
extern volatile __CHEW3bits_t CHEW3bits __asm__ ("CHEW3") __attribute__((section("sfrs"), address(0xBF884070)));

extern volatile uint32_t CHELRU __attribute__((section("sfrs"), address(0xBF884080)));
typedef struct {
  uint32_t CHELRU:25;
} __CHELRUbits_t;
extern volatile __CHELRUbits_t CHELRUbits __asm__ ("CHELRU") __attribute__((section("sfrs"), address(0xBF884080)));

extern volatile uint32_t CHEHIT __attribute__((section("sfrs"), address(0xBF884090)));
typedef struct {
  uint32_t CHEHIT:32;
} __CHEHITbits_t;
extern volatile __CHEHITbits_t CHEHITbits __asm__ ("CHEHIT") __attribute__((section("sfrs"), address(0xBF884090)));

extern volatile uint32_t CHEMIS __attribute__((section("sfrs"), address(0xBF8840A0)));
typedef struct {
  uint32_t CHEMIS:32;
} __CHEMISbits_t;
extern volatile __CHEMISbits_t CHEMISbits __asm__ ("CHEMIS") __attribute__((section("sfrs"), address(0xBF8840A0)));

extern volatile uint32_t CHEPFABT __attribute__((section("sfrs"), address(0xBF8840C0)));
typedef struct {
  uint32_t CHEPFABT:32;
} __CHEPFABTbits_t;
extern volatile __CHEPFABTbits_t CHEPFABTbits __asm__ ("CHEPFABT") __attribute__((section("sfrs"), address(0xBF8840C0)));

extern volatile uint32_t U1OTGIR __attribute__((section("sfrs"), address(0xBF885040)));
typedef struct {
  uint32_t VBUSVDIF:1;
  uint32_t :1;
  uint32_t SESENDIF:1;
  uint32_t SESVDIF:1;
  uint32_t ACTVIF:1;
  uint32_t LSTATEIF:1;
  uint32_t T1MSECIF:1;
  uint32_t IDIF:1;
} __U1OTGIRbits_t;
extern volatile __U1OTGIRbits_t U1OTGIRbits __asm__ ("U1OTGIR") __attribute__((section("sfrs"), address(0xBF885040)));
extern volatile uint32_t U1OTGIRCLR __attribute__((section("sfrs"),address(0xBF885044)));

extern volatile uint32_t U1OTGIE __attribute__((section("sfrs"), address(0xBF885050)));
typedef struct {
  uint32_t VBUSVDIE:1;
  uint32_t :1;
  uint32_t SESENDIE:1;
  uint32_t SESVDIE:1;
  uint32_t ACTVIE:1;
  uint32_t LSTATEIE:1;
  uint32_t T1MSECIE:1;
  uint32_t IDIE:1;
} __U1OTGIEbits_t;
extern volatile __U1OTGIEbits_t U1OTGIEbits __asm__ ("U1OTGIE") __attribute__((section("sfrs"), address(0xBF885050)));
extern volatile uint32_t U1OTGIECLR __attribute__((section("sfrs"),address(0xBF885054)));
extern volatile uint32_t U1OTGIESET __attribute__((section("sfrs"),address(0xBF885058)));
extern volatile uint32_t U1OTGIEINV __attribute__((section("sfrs"),address(0xBF88505C)));

extern volatile uint32_t U1OTGSTAT __attribute__((section("sfrs"), address(0xBF885060)));
typedef struct {
  uint32_t VBUSVD:1;
  uint32_t :1;
  uint32_t SESEND:1;
  uint32_t SESVD:1;
  uint32_t :1;
  uint32_t LSTATE:1;
  uint32_t :1;
  uint32_t ID:1;
} __U1OTGSTATbits_t;
extern volatile __U1OTGSTATbits_t U1OTGSTATbits __asm__ ("U1OTGSTAT") __attribute__((section("sfrs"), address(0xBF885060)));

extern volatile uint32_t U1OTGCON __attribute__((section("sfrs"), address(0xBF885070)));
typedef struct {
  uint32_t VBUSDIS:1;
  uint32_t VBUSCHG:1;
  uint32_t OTGEN:1;
  uint32_t VBUSON:1;
  uint32_t DMPULDWN:1;
  uint32_t DPPULDWN:1;
  uint32_t DMPULUP:1;
  uint32_t DPPULUP:1;
} __U1OTGCONbits_t;
extern volatile __U1OTGCONbits_t U1OTGCONbits __asm__ ("U1OTGCON") __attribute__((section("sfrs"), address(0xBF885070)));
extern volatile uint32_t U1OTGCONCLR __attribute__((section("sfrs"),address(0xBF885074)));
extern volatile uint32_t U1OTGCONSET __attribute__((section("sfrs"),address(0xBF885078)));
extern volatile uint32_t U1OTGCONINV __attribute__((section("sfrs"),address(0xBF88507C)));

extern volatile uint32_t U1PWRC __attribute__((section("sfrs"), address(0xBF885080)));
typedef struct {
  uint32_t USBPWR:1;
  uint32_t USUSPEND:1;
  uint32_t :1;
  uint32_t USBBUSY:1;
  uint32_t USLPGRD:1;
  uint32_t :2;
  uint32_t UACTPND:1;
} __U1PWRCbits_t;
extern volatile __U1PWRCbits_t U1PWRCbits __asm__ ("U1PWRC") __attribute__((section("sfrs"), address(0xBF885080)));
extern volatile uint32_t U1PWRCCLR __attribute__((section("sfrs"),address(0xBF885084)));
extern volatile uint32_t U1PWRCSET __attribute__((section("sfrs"),address(0xBF885088)));
extern volatile uint32_t U1PWRCINV __attribute__((section("sfrs"),address(0xBF88508C)));

extern volatile uint32_t U1IR __attribute__((section("sfrs"), address(0xBF885200)));
typedef union {
  struct {
    uint32_t URSTIF_DETACHIF:1;
    uint32_t UERRIF:1;
    uint32_t SOFIF:1;
    uint32_t TRNIF:1;
    uint32_t IDLEIF:1;
    uint32_t RESUMEIF:1;
    uint32_t ATTACHIF:1;
    uint32_t STALLIF:1;
  };
  struct {
    uint32_t DETACHIF:1;
  };
  struct {
    uint32_t URSTIF:1;
  };
} __U1IRbits_t;
extern volatile __U1IRbits_t U1IRbits __asm__ ("U1IR") __attribute__((section("sfrs"), address(0xBF885200)));
extern volatile uint32_t U1IRCLR __attribute__((section("sfrs"),address(0xBF885204)));

extern volatile uint32_t U1IE __attribute__((section("sfrs"), address(0xBF885210)));
typedef union {
  struct {
    uint32_t URSTIE_DETACHIE:1;
    uint32_t UERRIE:1;
    uint32_t SOFIE:1;
    uint32_t TRNIE:1;
    uint32_t IDLEIE:1;
    uint32_t RESUMEIE:1;
    uint32_t ATTACHIE:1;
    uint32_t STALLIE:1;
  };
  struct {
    uint32_t DETACHIE:1;
  };
  struct {
    uint32_t URSTIE:1;
  };
} __U1IEbits_t;
extern volatile __U1IEbits_t U1IEbits __asm__ ("U1IE") __attribute__((section("sfrs"), address(0xBF885210)));
extern volatile uint32_t U1IECLR __attribute__((section("sfrs"),address(0xBF885214)));
extern volatile uint32_t U1IESET __attribute__((section("sfrs"),address(0xBF885218)));
extern volatile uint32_t U1IEINV __attribute__((section("sfrs"),address(0xBF88521C)));

extern volatile uint32_t U1EIR __attribute__((section("sfrs"), address(0xBF885220)));
typedef union {
  struct {
    uint32_t PIDEF:1;
    uint32_t CRC5EF_EOFEF:1;
    uint32_t CRC16EF:1;
    uint32_t DFN8EF:1;
    uint32_t BTOEF:1;
    uint32_t DMAEF:1;
    uint32_t BMXEF:1;
    uint32_t BTSEF:1;
  };
  struct {
    uint32_t :1;
    uint32_t CRC5EF:1;
  };
  struct {
    uint32_t :1;
    uint32_t EOFEF:1;
  };
} __U1EIRbits_t;
extern volatile __U1EIRbits_t U1EIRbits __asm__ ("U1EIR") __attribute__((section("sfrs"), address(0xBF885220)));
extern volatile uint32_t U1EIRCLR __attribute__((section("sfrs"),address(0xBF885224)));

extern volatile uint32_t U1EIE __attribute__((section("sfrs"), address(0xBF885230)));
typedef union {
  struct {
    uint32_t PIDEE:1;
    uint32_t CRC5EE_EOFEE:1;
    uint32_t CRC16EE:1;
    uint32_t DFN8EE:1;
    uint32_t BTOEE:1;
    uint32_t DMAEE:1;
    uint32_t BMXEE:1;
    uint32_t BTSEE:1;
  };
  struct {
    uint32_t :1;
    uint32_t CRC5EE:1;
  };
  struct {
    uint32_t :1;
    uint32_t EOFEE:1;
  };
} __U1EIEbits_t;
extern volatile __U1EIEbits_t U1EIEbits __asm__ ("U1EIE") __attribute__((section("sfrs"), address(0xBF885230)));
extern volatile uint32_t U1EIECLR __attribute__((section("sfrs"),address(0xBF885234)));
extern volatile uint32_t U1EIESET __attribute__((section("sfrs"),address(0xBF885238)));
extern volatile uint32_t U1EIEINV __attribute__((section("sfrs"),address(0xBF88523C)));

extern volatile uint32_t U1STAT __attribute__((section("sfrs"), address(0xBF885240)));
typedef union {
  struct {
    uint32_t :2;
    uint32_t PPBI:1;
    uint32_t DIR:1;
    uint32_t ENDPT:4;
  };
  struct {
    uint32_t :4;
    uint32_t ENDPT0:1;
    uint32_t ENDPT1:1;
    uint32_t ENDPT2:1;
    uint32_t ENDPT3:1;
  };
} __U1STATbits_t;
extern volatile __U1STATbits_t U1STATbits __asm__ ("U1STAT") __attribute__((section("sfrs"), address(0xBF885240)));

extern volatile uint32_t U1CON __attribute__((section("sfrs"), address(0xBF885250)));
typedef union {
  struct {
    uint32_t USBEN_SOFEN:1;
    uint32_t PPBRST:1;
    uint32_t RESUME:1;
    uint32_t HOSTEN:1;
    uint32_t USBRST:1;
    uint32_t PKTDIS_TOKBUSY:1;
    uint32_t SE0:1;
    uint32_t JSTATE:1;
  };
  struct {
    uint32_t USBEN:1;
  };
  struct {
    uint32_t SOFEN:1;
    uint32_t :4;
    uint32_t PKTDIS:1;
  };
  struct {
    uint32_t :5;
    uint32_t TOKBUSY:1;
  };
} __U1CONbits_t;
extern volatile __U1CONbits_t U1CONbits __asm__ ("U1CON") __attribute__((section("sfrs"), address(0xBF885250)));
extern volatile uint32_t U1CONCLR __attribute__((section("sfrs"),address(0xBF885254)));
extern volatile uint32_t U1CONSET __attribute__((section("sfrs"),address(0xBF885258)));
extern volatile uint32_t U1CONINV __attribute__((section("sfrs"),address(0xBF88525C)));

extern volatile uint32_t U1ADDR __attribute__((section("sfrs"), address(0xBF885260)));
typedef union {
  struct {
    uint32_t DEVADDR:7;
    uint32_t LSPDEN:1;
  };
  struct {
    uint32_t DEVADDR0:1;
    uint32_t DEVADDR1:1;
    uint32_t DEVADDR2:1;
    uint32_t DEVADDR3:1;
    uint32_t DEVADDR4:1;
    uint32_t DEVADDR5:1;
    uint32_t DEVADDR6:1;
  };
} __U1ADDRbits_t;
extern volatile __U1ADDRbits_t U1ADDRbits __asm__ ("U1ADDR") __attribute__((section("sfrs"), address(0xBF885260)));
extern volatile uint32_t U1ADDRCLR __attribute__((section("sfrs"),address(0xBF885264)));
extern volatile uint32_t U1ADDRSET __attribute__((section("sfrs"),address(0xBF885268)));
extern volatile uint32_t U1ADDRINV __attribute__((section("sfrs"),address(0xBF88526C)));

extern volatile uint32_t U1BDTP1 __attribute__((section("sfrs"), address(0xBF885270)));
typedef struct {
  uint32_t :1;
  uint32_t BDTPTRL:7;
} __U1BDTP1bits_t;
extern volatile __U1BDTP1bits_t U1BDTP1bits __asm__ ("U1BDTP1") __attribute__((section("sfrs"), address(0xBF885270)));
extern volatile uint32_t U1BDTP1CLR __attribute__((section("sfrs"),address(0xBF885274)));
extern volatile uint32_t U1BDTP1SET __attribute__((section("sfrs"),address(0xBF885278)));
extern volatile uint32_t U1BDTP1INV __attribute__((section("sfrs"),address(0xBF88527C)));

extern volatile uint32_t U1FRML __attribute__((section("sfrs"), address(0xBF885280)));
typedef union {
  struct {
    uint32_t FRML:8;
  };
  struct {
    uint32_t FRM0:1;
    uint32_t FRM1:1;
    uint32_t FRM2:1;
    uint32_t FRM3:1;
    uint32_t FRM4:1;
    uint32_t FRM5:1;
    uint32_t FRM6:1;
    uint32_t FRM7:1;
  };
} __U1FRMLbits_t;
extern volatile __U1FRMLbits_t U1FRMLbits __asm__ ("U1FRML") __attribute__((section("sfrs"), address(0xBF885280)));

extern volatile uint32_t U1FRMH __attribute__((section("sfrs"), address(0xBF885290)));
typedef union {
  struct {
    uint32_t FRMH:3;
  };
  struct {
    uint32_t FRM8:1;
    uint32_t FRM9:1;
    uint32_t FRM10:1;
  };
} __U1FRMHbits_t;
extern volatile __U1FRMHbits_t U1FRMHbits __asm__ ("U1FRMH") __attribute__((section("sfrs"), address(0xBF885290)));

extern volatile uint32_t U1TOK __attribute__((section("sfrs"), address(0xBF8852A0)));
typedef union {
  struct {
    uint32_t EP:4;
    uint32_t PID:4;
  };
  struct {
    uint32_t EP0:1;
  };
  struct {
    uint32_t :1;
    uint32_t EP1:1;
    uint32_t EP2:1;
    uint32_t EP3:1;
    uint32_t PID0:1;
  };
  struct {
    uint32_t :5;
    uint32_t PID1:1;
    uint32_t PID2:1;
    uint32_t PID3:1;
  };
} __U1TOKbits_t;
extern volatile __U1TOKbits_t U1TOKbits __asm__ ("U1TOK") __attribute__((section("sfrs"), address(0xBF8852A0)));
extern volatile uint32_t U1TOKCLR __attribute__((section("sfrs"),address(0xBF8852A4)));
extern volatile uint32_t U1TOKSET __attribute__((section("sfrs"),address(0xBF8852A8)));
extern volatile uint32_t U1TOKINV __attribute__((section("sfrs"),address(0xBF8852AC)));

extern volatile uint32_t U1SOF __attribute__((section("sfrs"), address(0xBF8852B0)));
typedef struct {
  uint32_t CNT:8;
} __U1SOFbits_t;
extern volatile __U1SOFbits_t U1SOFbits __asm__ ("U1SOF") __attribute__((section("sfrs"), address(0xBF8852B0)));
extern volatile uint32_t U1SOFCLR __attribute__((section("sfrs"),address(0xBF8852B4)));
extern volatile uint32_t U1SOFSET __attribute__((section("sfrs"),address(0xBF8852B8)));
extern volatile uint32_t U1SOFINV __attribute__((section("sfrs"),address(0xBF8852BC)));

extern volatile uint32_t U1BDTP2 __attribute__((section("sfrs"), address(0xBF8852C0)));
typedef struct {
  uint32_t BDTPTRH:8;
} __U1BDTP2bits_t;
extern volatile __U1BDTP2bits_t U1BDTP2bits __asm__ ("U1BDTP2") __attribute__((section("sfrs"), address(0xBF8852C0)));
extern volatile uint32_t U1BDTP2CLR __attribute__((section("sfrs"),address(0xBF8852C4)));
extern volatile uint32_t U1BDTP2SET __attribute__((section("sfrs"),address(0xBF8852C8)));
extern volatile uint32_t U1BDTP2INV __attribute__((section("sfrs"),address(0xBF8852CC)));

extern volatile uint32_t U1BDTP3 __attribute__((section("sfrs"), address(0xBF8852D0)));
typedef struct {
  uint32_t BDTPTRU:8;
} __U1BDTP3bits_t;
extern volatile __U1BDTP3bits_t U1BDTP3bits __asm__ ("U1BDTP3") __attribute__((section("sfrs"), address(0xBF8852D0)));
extern volatile uint32_t U1BDTP3CLR __attribute__((section("sfrs"),address(0xBF8852D4)));
extern volatile uint32_t U1BDTP3SET __attribute__((section("sfrs"),address(0xBF8852D8)));
extern volatile uint32_t U1BDTP3INV __attribute__((section("sfrs"),address(0xBF8852DC)));

extern volatile uint32_t U1CNFG1 __attribute__((section("sfrs"), address(0xBF8852E0)));
typedef struct {
  uint32_t UASUSPND:1;
  uint32_t :3;
  uint32_t USBSIDL:1;
  uint32_t :1;
  uint32_t UOEMON:1;
  uint32_t UTEYE:1;
} __U1CNFG1bits_t;
extern volatile __U1CNFG1bits_t U1CNFG1bits __asm__ ("U1CNFG1") __attribute__((section("sfrs"), address(0xBF8852E0)));
extern volatile uint32_t U1CNFG1CLR __attribute__((section("sfrs"),address(0xBF8852E4)));
extern volatile uint32_t U1CNFG1SET __attribute__((section("sfrs"),address(0xBF8852E8)));
extern volatile uint32_t U1CNFG1INV __attribute__((section("sfrs"),address(0xBF8852EC)));

extern volatile uint32_t U1EP0 __attribute__((section("sfrs"), address(0xBF885300)));
typedef struct {
  uint32_t EPHSHK:1;
  uint32_t EPSTALL:1;
  uint32_t EPTXEN:1;
  uint32_t EPRXEN:1;
  uint32_t EPCONDIS:1;
  uint32_t :1;
  uint32_t RETRYDIS:1;
  uint32_t LSPD:1;
} __U1EP0bits_t;
extern volatile __U1EP0bits_t U1EP0bits __asm__ ("U1EP0") __attribute__((section("sfrs"), address(0xBF885300)));
extern volatile uint32_t U1EP0CLR __attribute__((section("sfrs"),address(0xBF885304)));
extern volatile uint32_t U1EP0SET __attribute__((section("sfrs"),address(0xBF885308)));
extern volatile uint32_t U1EP0INV __attribute__((section("sfrs"),address(0xBF88530C)));

extern volatile uint32_t U1EP1 __attribute__((section("sfrs"), address(0xBF885310)));
typedef struct {
  uint32_t EPHSHK:1;
  uint32_t EPSTALL:1;
  uint32_t EPTXEN:1;
  uint32_t EPRXEN:1;
  uint32_t EPCONDIS:1;
} __U1EP1bits_t;
extern volatile __U1EP1bits_t U1EP1bits __asm__ ("U1EP1") __attribute__((section("sfrs"), address(0xBF885310)));
extern volatile uint32_t U1EP1CLR __attribute__((section("sfrs"),address(0xBF885314)));
extern volatile uint32_t U1EP1SET __attribute__((section("sfrs"),address(0xBF885318)));
extern volatile uint32_t U1EP1INV __attribute__((section("sfrs"),address(0xBF88531C)));

extern volatile uint32_t U1EP2 __attribute__((section("sfrs"), address(0xBF885320)));
typedef struct {
  uint32_t EPHSHK:1;
  uint32_t EPSTALL:1;
  uint32_t EPTXEN:1;
  uint32_t EPRXEN:1;
  uint32_t EPCONDIS:1;
} __U1EP2bits_t;
extern volatile __U1EP2bits_t U1EP2bits __asm__ ("U1EP2") __attribute__((section("sfrs"), address(0xBF885320)));
extern volatile uint32_t U1EP2CLR __attribute__((section("sfrs"),address(0xBF885324)));
extern volatile uint32_t U1EP2SET __attribute__((section("sfrs"),address(0xBF885328)));
extern volatile uint32_t U1EP2INV __attribute__((section("sfrs"),address(0xBF88532C)));

extern volatile uint32_t U1EP3 __attribute__((section("sfrs"), address(0xBF885330)));
typedef struct {
  uint32_t EPHSHK:1;
  uint32_t EPSTALL:1;
  uint32_t EPTXEN:1;
  uint32_t EPRXEN:1;
  uint32_t EPCONDIS:1;
} __U1EP3bits_t;
extern volatile __U1EP3bits_t U1EP3bits __asm__ ("U1EP3") __attribute__((section("sfrs"), address(0xBF885330)));
extern volatile uint32_t U1EP3CLR __attribute__((section("sfrs"),address(0xBF885334)));
extern volatile uint32_t U1EP3SET __attribute__((section("sfrs"),address(0xBF885338)));
extern volatile uint32_t U1EP3INV __attribute__((section("sfrs"),address(0xBF88533C)));

extern volatile uint32_t U1EP4 __attribute__((section("sfrs"), address(0xBF885340)));
typedef struct {
  uint32_t EPHSHK:1;
  uint32_t EPSTALL:1;
  uint32_t EPTXEN:1;
  uint32_t EPRXEN:1;
  uint32_t EPCONDIS:1;
} __U1EP4bits_t;
extern volatile __U1EP4bits_t U1EP4bits __asm__ ("U1EP4") __attribute__((section("sfrs"), address(0xBF885340)));
extern volatile uint32_t U1EP4CLR __attribute__((section("sfrs"),address(0xBF885344)));
extern volatile uint32_t U1EP4SET __attribute__((section("sfrs"),address(0xBF885348)));
extern volatile uint32_t U1EP4INV __attribute__((section("sfrs"),address(0xBF88534C)));

extern volatile uint32_t U1EP5 __attribute__((section("sfrs"), address(0xBF885350)));
typedef struct {
  uint32_t EPHSHK:1;
  uint32_t EPSTALL:1;
  uint32_t EPTXEN:1;
  uint32_t EPRXEN:1;
  uint32_t EPCONDIS:1;
} __U1EP5bits_t;
extern volatile __U1EP5bits_t U1EP5bits __asm__ ("U1EP5") __attribute__((section("sfrs"), address(0xBF885350)));
extern volatile uint32_t U1EP5CLR __attribute__((section("sfrs"),address(0xBF885354)));
extern volatile uint32_t U1EP5SET __attribute__((section("sfrs"),address(0xBF885358)));
extern volatile uint32_t U1EP5INV __attribute__((section("sfrs"),address(0xBF88535C)));

extern volatile uint32_t U1EP6 __attribute__((section("sfrs"), address(0xBF885360)));
typedef struct {
  uint32_t EPHSHK:1;
  uint32_t EPSTALL:1;
  uint32_t EPTXEN:1;
  uint32_t EPRXEN:1;
  uint32_t EPCONDIS:1;
} __U1EP6bits_t;
extern volatile __U1EP6bits_t U1EP6bits __asm__ ("U1EP6") __attribute__((section("sfrs"), address(0xBF885360)));
extern volatile uint32_t U1EP6CLR __attribute__((section("sfrs"),address(0xBF885364)));
extern volatile uint32_t U1EP6SET __attribute__((section("sfrs"),address(0xBF885368)));
extern volatile uint32_t U1EP6INV __attribute__((section("sfrs"),address(0xBF88536C)));

extern volatile uint32_t U1EP7 __attribute__((section("sfrs"), address(0xBF885370)));
typedef struct {
  uint32_t EPHSHK:1;
  uint32_t EPSTALL:1;
  uint32_t EPTXEN:1;
  uint32_t EPRXEN:1;
  uint32_t EPCONDIS:1;
} __U1EP7bits_t;
extern volatile __U1EP7bits_t U1EP7bits __asm__ ("U1EP7") __attribute__((section("sfrs"), address(0xBF885370)));
extern volatile uint32_t U1EP7CLR __attribute__((section("sfrs"),address(0xBF885374)));
extern volatile uint32_t U1EP7SET __attribute__((section("sfrs"),address(0xBF885378)));
extern volatile uint32_t U1EP7INV __attribute__((section("sfrs"),address(0xBF88537C)));

extern volatile uint32_t U1EP8 __attribute__((section("sfrs"), address(0xBF885380)));
typedef struct {
  uint32_t EPHSHK:1;
  uint32_t EPSTALL:1;
  uint32_t EPTXEN:1;
  uint32_t EPRXEN:1;
  uint32_t EPCONDIS:1;
} __U1EP8bits_t;
extern volatile __U1EP8bits_t U1EP8bits __asm__ ("U1EP8") __attribute__((section("sfrs"), address(0xBF885380)));
extern volatile uint32_t U1EP8CLR __attribute__((section("sfrs"),address(0xBF885384)));
extern volatile uint32_t U1EP8SET __attribute__((section("sfrs"),address(0xBF885388)));
extern volatile uint32_t U1EP8INV __attribute__((section("sfrs"),address(0xBF88538C)));

extern volatile uint32_t U1EP9 __attribute__((section("sfrs"), address(0xBF885390)));
typedef struct {
  uint32_t EPHSHK:1;
  uint32_t EPSTALL:1;
  uint32_t EPTXEN:1;
  uint32_t EPRXEN:1;
  uint32_t EPCONDIS:1;
} __U1EP9bits_t;
extern volatile __U1EP9bits_t U1EP9bits __asm__ ("U1EP9") __attribute__((section("sfrs"), address(0xBF885390)));
extern volatile uint32_t U1EP9CLR __attribute__((section("sfrs"),address(0xBF885394)));
extern volatile uint32_t U1EP9SET __attribute__((section("sfrs"),address(0xBF885398)));
extern volatile uint32_t U1EP9INV __attribute__((section("sfrs"),address(0xBF88539C)));

extern volatile uint32_t U1EP10 __attribute__((section("sfrs"), address(0xBF8853A0)));
typedef struct {
  uint32_t EPHSHK:1;
  uint32_t EPSTALL:1;
  uint32_t EPTXEN:1;
  uint32_t EPRXEN:1;
  uint32_t EPCONDIS:1;
} __U1EP10bits_t;
extern volatile __U1EP10bits_t U1EP10bits __asm__ ("U1EP10") __attribute__((section("sfrs"), address(0xBF8853A0)));
extern volatile uint32_t U1EP10CLR __attribute__((section("sfrs"),address(0xBF8853A4)));
extern volatile uint32_t U1EP10SET __attribute__((section("sfrs"),address(0xBF8853A8)));
extern volatile uint32_t U1EP10INV __attribute__((section("sfrs"),address(0xBF8853AC)));

extern volatile uint32_t U1EP11 __attribute__((section("sfrs"), address(0xBF8853B0)));
typedef struct {
  uint32_t EPHSHK:1;
  uint32_t EPSTALL:1;
  uint32_t EPTXEN:1;
  uint32_t EPRXEN:1;
  uint32_t EPCONDIS:1;
} __U1EP11bits_t;
extern volatile __U1EP11bits_t U1EP11bits __asm__ ("U1EP11") __attribute__((section("sfrs"), address(0xBF8853B0)));
extern volatile uint32_t U1EP11CLR __attribute__((section("sfrs"),address(0xBF8853B4)));
extern volatile uint32_t U1EP11SET __attribute__((section("sfrs"),address(0xBF8853B8)));
extern volatile uint32_t U1EP11INV __attribute__((section("sfrs"),address(0xBF8853BC)));

extern volatile uint32_t U1EP12 __attribute__((section("sfrs"), address(0xBF8853C0)));
typedef struct {
  uint32_t EPHSHK:1;
  uint32_t EPSTALL:1;
  uint32_t EPTXEN:1;
  uint32_t EPRXEN:1;
  uint32_t EPCONDIS:1;
} __U1EP12bits_t;
extern volatile __U1EP12bits_t U1EP12bits __asm__ ("U1EP12") __attribute__((section("sfrs"), address(0xBF8853C0)));
extern volatile uint32_t U1EP12CLR __attribute__((section("sfrs"),address(0xBF8853C4)));
extern volatile uint32_t U1EP12SET __attribute__((section("sfrs"),address(0xBF8853C8)));
extern volatile uint32_t U1EP12INV __attribute__((section("sfrs"),address(0xBF8853CC)));

extern volatile uint32_t U1EP13 __attribute__((section("sfrs"), address(0xBF8853D0)));
typedef struct {
  uint32_t EPHSHK:1;
  uint32_t EPSTALL:1;
  uint32_t EPTXEN:1;
  uint32_t EPRXEN:1;
  uint32_t EPCONDIS:1;
} __U1EP13bits_t;
extern volatile __U1EP13bits_t U1EP13bits __asm__ ("U1EP13") __attribute__((section("sfrs"), address(0xBF8853D0)));
extern volatile uint32_t U1EP13CLR __attribute__((section("sfrs"),address(0xBF8853D4)));
extern volatile uint32_t U1EP13SET __attribute__((section("sfrs"),address(0xBF8853D8)));
extern volatile uint32_t U1EP13INV __attribute__((section("sfrs"),address(0xBF8853DC)));

extern volatile uint32_t U1EP14 __attribute__((section("sfrs"), address(0xBF8853E0)));
typedef struct {
  uint32_t EPHSHK:1;
  uint32_t EPSTALL:1;
  uint32_t EPTXEN:1;
  uint32_t EPRXEN:1;
  uint32_t EPCONDIS:1;
} __U1EP14bits_t;
extern volatile __U1EP14bits_t U1EP14bits __asm__ ("U1EP14") __attribute__((section("sfrs"), address(0xBF8853E0)));
extern volatile uint32_t U1EP14CLR __attribute__((section("sfrs"),address(0xBF8853E4)));
extern volatile uint32_t U1EP14SET __attribute__((section("sfrs"),address(0xBF8853E8)));
extern volatile uint32_t U1EP14INV __attribute__((section("sfrs"),address(0xBF8853EC)));

extern volatile uint32_t U1EP15 __attribute__((section("sfrs"), address(0xBF8853F0)));
typedef struct {
  uint32_t EPHSHK:1;
  uint32_t EPSTALL:1;
  uint32_t EPTXEN:1;
  uint32_t EPRXEN:1;
  uint32_t EPCONDIS:1;
} __U1EP15bits_t;
extern volatile __U1EP15bits_t U1EP15bits __asm__ ("U1EP15") __attribute__((section("sfrs"), address(0xBF8853F0)));
extern volatile uint32_t U1EP15CLR __attribute__((section("sfrs"),address(0xBF8853F4)));
extern volatile uint32_t U1EP15SET __attribute__((section("sfrs"),address(0xBF8853F8)));
extern volatile uint32_t U1EP15INV __attribute__((section("sfrs"),address(0xBF8853FC)));

extern volatile uint32_t TRISA __attribute__((section("sfrs"), address(0xBF886000)));
typedef union {
  struct {
    uint32_t TRISA0:1;
    uint32_t TRISA1:1;
    uint32_t TRISA2:1;
    uint32_t TRISA3:1;
    uint32_t TRISA4:1;
    uint32_t TRISA5:1;
    uint32_t TRISA6:1;
    uint32_t TRISA7:1;
    uint32_t :1;
    uint32_t TRISA9:1;
    uint32_t TRISA10:1;
    uint32_t :3;
    uint32_t TRISA14:1;
    uint32_t TRISA15:1;
  };
  struct {
    uint32_t w:32;
  };
} __TRISAbits_t;
extern volatile __TRISAbits_t TRISAbits __asm__ ("TRISA") __attribute__((section("sfrs"), address(0xBF886000)));
extern volatile uint32_t TRISACLR __attribute__((section("sfrs"),address(0xBF886004)));
extern volatile uint32_t TRISASET __attribute__((section("sfrs"),address(0xBF886008)));
extern volatile uint32_t TRISAINV __attribute__((section("sfrs"),address(0xBF88600C)));

extern volatile uint32_t PORTA __attribute__((section("sfrs"), address(0xBF886010)));
typedef union {
  struct {
    uint32_t RA0:1;
    uint32_t RA1:1;
    uint32_t RA2:1;
    uint32_t RA3:1;
    uint32_t RA4:1;
    uint32_t RA5:1;
    uint32_t RA6:1;
    uint32_t RA7:1;
    uint32_t :1;
    uint32_t RA9:1;
    uint32_t RA10:1;
    uint32_t :3;
    uint32_t RA14:1;
    uint32_t RA15:1;
  };
  struct {
    uint32_t w:32;
  };
} __PORTAbits_t;
extern volatile __PORTAbits_t PORTAbits __asm__ ("PORTA") __attribute__((section("sfrs"), address(0xBF886010)));
extern volatile uint32_t PORTACLR __attribute__((section("sfrs"),address(0xBF886014)));
extern volatile uint32_t PORTASET __attribute__((section("sfrs"),address(0xBF886018)));
extern volatile uint32_t PORTAINV __attribute__((section("sfrs"),address(0xBF88601C)));

extern volatile uint32_t LATA __attribute__((section("sfrs"), address(0xBF886020)));
typedef union {
  struct {
    uint32_t LATA0:1;
    uint32_t LATA1:1;
    uint32_t LATA2:1;
    uint32_t LATA3:1;
    uint32_t LATA4:1;
    uint32_t LATA5:1;
    uint32_t LATA6:1;
    uint32_t LATA7:1;
    uint32_t :1;
    uint32_t LATA9:1;
    uint32_t LATA10:1;
    uint32_t :3;
    uint32_t LATA14:1;
    uint32_t LATA15:1;
  };
  struct {
    uint32_t w:32;
  };
} __LATAbits_t;
extern volatile __LATAbits_t LATAbits __asm__ ("LATA") __attribute__((section("sfrs"), address(0xBF886020)));
extern volatile uint32_t LATACLR __attribute__((section("sfrs"),address(0xBF886024)));
extern volatile uint32_t LATASET __attribute__((section("sfrs"),address(0xBF886028)));
extern volatile uint32_t LATAINV __attribute__((section("sfrs"),address(0xBF88602C)));

extern volatile uint32_t ODCA __attribute__((section("sfrs"), address(0xBF886030)));
typedef union {
  struct {
    uint32_t ODCA0:1;
    uint32_t ODCA1:1;
    uint32_t ODCA2:1;
    uint32_t ODCA3:1;
    uint32_t ODCA4:1;
    uint32_t ODCA5:1;
    uint32_t ODCA6:1;
    uint32_t ODCA7:1;
    uint32_t :1;
    uint32_t ODCA9:1;
    uint32_t ODCA10:1;
    uint32_t :3;
    uint32_t ODCA14:1;
    uint32_t ODCA15:1;
  };
  struct {
    uint32_t w:32;
  };
} __ODCAbits_t;
extern volatile __ODCAbits_t ODCAbits __asm__ ("ODCA") __attribute__((section("sfrs"), address(0xBF886030)));
extern volatile uint32_t ODCACLR __attribute__((section("sfrs"),address(0xBF886034)));
extern volatile uint32_t ODCASET __attribute__((section("sfrs"),address(0xBF886038)));
extern volatile uint32_t ODCAINV __attribute__((section("sfrs"),address(0xBF88603C)));

extern volatile uint32_t TRISB __attribute__((section("sfrs"), address(0xBF886040)));
typedef union {
  struct {
    uint32_t TRISB0:1;
    uint32_t TRISB1:1;
    uint32_t TRISB2:1;
    uint32_t TRISB3:1;
    uint32_t TRISB4:1;
    uint32_t TRISB5:1;
    uint32_t TRISB6:1;
    uint32_t TRISB7:1;
    uint32_t TRISB8:1;
    uint32_t TRISB9:1;
    uint32_t TRISB10:1;
    uint32_t TRISB11:1;
    uint32_t TRISB12:1;
    uint32_t TRISB13:1;
    uint32_t TRISB14:1;
    uint32_t TRISB15:1;
  };
  struct {
    uint32_t w:32;
  };
} __TRISBbits_t;
extern volatile __TRISBbits_t TRISBbits __asm__ ("TRISB") __attribute__((section("sfrs"), address(0xBF886040)));
extern volatile uint32_t TRISBCLR __attribute__((section("sfrs"),address(0xBF886044)));
extern volatile uint32_t TRISBSET __attribute__((section("sfrs"),address(0xBF886048)));
extern volatile uint32_t TRISBINV __attribute__((section("sfrs"),address(0xBF88604C)));

extern volatile uint32_t PORTB __attribute__((section("sfrs"), address(0xBF886050)));
typedef union {
  struct {
    uint32_t RB0:1;
    uint32_t RB1:1;
    uint32_t RB2:1;
    uint32_t RB3:1;
    uint32_t RB4:1;
    uint32_t RB5:1;
    uint32_t RB6:1;
    uint32_t RB7:1;
    uint32_t RB8:1;
    uint32_t RB9:1;
    uint32_t RB10:1;
    uint32_t RB11:1;
    uint32_t RB12:1;
    uint32_t RB13:1;
    uint32_t RB14:1;
    uint32_t RB15:1;
  };
  struct {
    uint32_t w:32;
  };
} __PORTBbits_t;
extern volatile __PORTBbits_t PORTBbits __asm__ ("PORTB") __attribute__((section("sfrs"), address(0xBF886050)));
extern volatile uint32_t PORTBCLR __attribute__((section("sfrs"),address(0xBF886054)));
extern volatile uint32_t PORTBSET __attribute__((section("sfrs"),address(0xBF886058)));
extern volatile uint32_t PORTBINV __attribute__((section("sfrs"),address(0xBF88605C)));

extern volatile uint32_t LATB __attribute__((section("sfrs"), address(0xBF886060)));
typedef union {
  struct {
    uint32_t LATB0:1;
    uint32_t LATB1:1;
    uint32_t LATB2:1;
    uint32_t LATB3:1;
    uint32_t LATB4:1;
    uint32_t LATB5:1;
    uint32_t LATB6:1;
    uint32_t LATB7:1;
    uint32_t LATB8:1;
    uint32_t LATB9:1;
    uint32_t LATB10:1;
    uint32_t LATB11:1;
    uint32_t LATB12:1;
    uint32_t LATB13:1;
    uint32_t LATB14:1;
    uint32_t LATB15:1;
  };
  struct {
    uint32_t w:32;
  };
} __LATBbits_t;
extern volatile __LATBbits_t LATBbits __asm__ ("LATB") __attribute__((section("sfrs"), address(0xBF886060)));
extern volatile uint32_t LATBCLR __attribute__((section("sfrs"),address(0xBF886064)));
extern volatile uint32_t LATBSET __attribute__((section("sfrs"),address(0xBF886068)));
extern volatile uint32_t LATBINV __attribute__((section("sfrs"),address(0xBF88606C)));

extern volatile uint32_t ODCB __attribute__((section("sfrs"), address(0xBF886070)));
typedef union {
  struct {
    uint32_t ODCB0:1;
    uint32_t ODCB1:1;
    uint32_t ODCB2:1;
    uint32_t ODCB3:1;
    uint32_t ODCB4:1;
    uint32_t ODCB5:1;
    uint32_t ODCB6:1;
    uint32_t ODCB7:1;
    uint32_t ODCB8:1;
    uint32_t ODCB9:1;
    uint32_t ODCB10:1;
    uint32_t ODCB11:1;
    uint32_t ODCB12:1;
    uint32_t ODCB13:1;
    uint32_t ODCB14:1;
    uint32_t ODCB15:1;
  };
  struct {
    uint32_t w:32;
  };
} __ODCBbits_t;
extern volatile __ODCBbits_t ODCBbits __asm__ ("ODCB") __attribute__((section("sfrs"), address(0xBF886070)));
extern volatile uint32_t ODCBCLR __attribute__((section("sfrs"),address(0xBF886074)));
extern volatile uint32_t ODCBSET __attribute__((section("sfrs"),address(0xBF886078)));
extern volatile uint32_t ODCBINV __attribute__((section("sfrs"),address(0xBF88607C)));

extern volatile uint32_t TRISC __attribute__((section("sfrs"), address(0xBF886080)));
typedef union {
  struct {
    uint32_t :1;
    uint32_t TRISC1:1;
    uint32_t TRISC2:1;
    uint32_t TRISC3:1;
    uint32_t TRISC4:1;
    uint32_t :7;
    uint32_t TRISC12:1;
    uint32_t TRISC13:1;
    uint32_t TRISC14:1;
    uint32_t TRISC15:1;
  };
  struct {
    uint32_t w:32;
  };
} __TRISCbits_t;
extern volatile __TRISCbits_t TRISCbits __asm__ ("TRISC") __attribute__((section("sfrs"), address(0xBF886080)));
extern volatile uint32_t TRISCCLR __attribute__((section("sfrs"),address(0xBF886084)));
extern volatile uint32_t TRISCSET __attribute__((section("sfrs"),address(0xBF886088)));
extern volatile uint32_t TRISCINV __attribute__((section("sfrs"),address(0xBF88608C)));

extern volatile uint32_t PORTC __attribute__((section("sfrs"), address(0xBF886090)));
typedef union {
  struct {
    uint32_t :1;
    uint32_t RC1:1;
    uint32_t RC2:1;
    uint32_t RC3:1;
    uint32_t RC4:1;
    uint32_t :7;
    uint32_t RC12:1;
    uint32_t RC13:1;
    uint32_t RC14:1;
    uint32_t RC15:1;
  };
  struct {
    uint32_t w:32;
  };
} __PORTCbits_t;
extern volatile __PORTCbits_t PORTCbits __asm__ ("PORTC") __attribute__((section("sfrs"), address(0xBF886090)));
extern volatile uint32_t PORTCCLR __attribute__((section("sfrs"),address(0xBF886094)));
extern volatile uint32_t PORTCSET __attribute__((section("sfrs"),address(0xBF886098)));
extern volatile uint32_t PORTCINV __attribute__((section("sfrs"),address(0xBF88609C)));

extern volatile uint32_t LATC __attribute__((section("sfrs"), address(0xBF8860A0)));
typedef union {
  struct {
    uint32_t :1;
    uint32_t LATC1:1;
    uint32_t LATC2:1;
    uint32_t LATC3:1;
    uint32_t LATC4:1;
    uint32_t :7;
    uint32_t LATC12:1;
    uint32_t LATC13:1;
    uint32_t LATC14:1;
    uint32_t LATC15:1;
  };
  struct {
    uint32_t w:32;
  };
} __LATCbits_t;
extern volatile __LATCbits_t LATCbits __asm__ ("LATC") __attribute__((section("sfrs"), address(0xBF8860A0)));
extern volatile uint32_t LATCCLR __attribute__((section("sfrs"),address(0xBF8860A4)));
extern volatile uint32_t LATCSET __attribute__((section("sfrs"),address(0xBF8860A8)));
extern volatile uint32_t LATCINV __attribute__((section("sfrs"),address(0xBF8860AC)));

extern volatile uint32_t ODCC __attribute__((section("sfrs"), address(0xBF8860B0)));
typedef union {
  struct {
    uint32_t :1;
    uint32_t ODCC1:1;
    uint32_t ODCC2:1;
    uint32_t ODCC3:1;
    uint32_t ODCC4:1;
    uint32_t :7;
    uint32_t ODCC12:1;
    uint32_t ODCC13:1;
    uint32_t ODCC14:1;
    uint32_t ODCC15:1;
  };
  struct {
    uint32_t w:32;
  };
} __ODCCbits_t;
extern volatile __ODCCbits_t ODCCbits __asm__ ("ODCC") __attribute__((section("sfrs"), address(0xBF8860B0)));
extern volatile uint32_t ODCCCLR __attribute__((section("sfrs"),address(0xBF8860B4)));
extern volatile uint32_t ODCCSET __attribute__((section("sfrs"),address(0xBF8860B8)));
extern volatile uint32_t ODCCINV __attribute__((section("sfrs"),address(0xBF8860BC)));

extern volatile uint32_t TRISD __attribute__((section("sfrs"), address(0xBF8860C0)));
typedef union {
  struct {
    uint32_t TRISD0:1;
    uint32_t TRISD1:1;
    uint32_t TRISD2:1;
    uint32_t TRISD3:1;
    uint32_t TRISD4:1;
    uint32_t TRISD5:1;
    uint32_t TRISD6:1;
    uint32_t TRISD7:1;
    uint32_t TRISD8:1;
    uint32_t TRISD9:1;
    uint32_t TRISD10:1;
    uint32_t TRISD11:1;
    uint32_t TRISD12:1;
    uint32_t TRISD13:1;
    uint32_t TRISD14:1;
    uint32_t TRISD15:1;
  };
  struct {
    uint32_t w:32;
  };
} __TRISDbits_t;
extern volatile __TRISDbits_t TRISDbits __asm__ ("TRISD") __attribute__((section("sfrs"), address(0xBF8860C0)));
extern volatile uint32_t TRISDCLR __attribute__((section("sfrs"),address(0xBF8860C4)));
extern volatile uint32_t TRISDSET __attribute__((section("sfrs"),address(0xBF8860C8)));
extern volatile uint32_t TRISDINV __attribute__((section("sfrs"),address(0xBF8860CC)));

extern volatile uint32_t PORTD __attribute__((section("sfrs"), address(0xBF8860D0)));
typedef union {
  struct {
    uint32_t RD0:1;
    uint32_t RD1:1;
    uint32_t RD2:1;
    uint32_t RD3:1;
    uint32_t RD4:1;
    uint32_t RD5:1;
    uint32_t RD6:1;
    uint32_t RD7:1;
    uint32_t RD8:1;
    uint32_t RD9:1;
    uint32_t RD10:1;
    uint32_t RD11:1;
    uint32_t RD12:1;
    uint32_t RD13:1;
    uint32_t RD14:1;
    uint32_t RD15:1;
  };
  struct {
    uint32_t w:32;
  };
} __PORTDbits_t;
extern volatile __PORTDbits_t PORTDbits __asm__ ("PORTD") __attribute__((section("sfrs"), address(0xBF8860D0)));
extern volatile uint32_t PORTDCLR __attribute__((section("sfrs"),address(0xBF8860D4)));
extern volatile uint32_t PORTDSET __attribute__((section("sfrs"),address(0xBF8860D8)));
extern volatile uint32_t PORTDINV __attribute__((section("sfrs"),address(0xBF8860DC)));

extern volatile uint32_t LATD __attribute__((section("sfrs"), address(0xBF8860E0)));
typedef union {
  struct {
    uint32_t LATD0:1;
    uint32_t LATD1:1;
    uint32_t LATD2:1;
    uint32_t LATD3:1;
    uint32_t LATD4:1;
    uint32_t LATD5:1;
    uint32_t LATD6:1;
    uint32_t LATD7:1;
    uint32_t LATD8:1;
    uint32_t LATD9:1;
    uint32_t LATD10:1;
    uint32_t LATD11:1;
    uint32_t LATD12:1;
    uint32_t LATD13:1;
    uint32_t LATD14:1;
    uint32_t LATD15:1;
  };
  struct {
    uint32_t w:32;
  };
} __LATDbits_t;
extern volatile __LATDbits_t LATDbits __asm__ ("LATD") __attribute__((section("sfrs"), address(0xBF8860E0)));
extern volatile uint32_t LATDCLR __attribute__((section("sfrs"),address(0xBF8860E4)));
extern volatile uint32_t LATDSET __attribute__((section("sfrs"),address(0xBF8860E8)));
extern volatile uint32_t LATDINV __attribute__((section("sfrs"),address(0xBF8860EC)));

extern volatile uint32_t ODCD __attribute__((section("sfrs"), address(0xBF8860F0)));
typedef union {
  struct {
    uint32_t ODCD0:1;
    uint32_t ODCD1:1;
    uint32_t ODCD2:1;
    uint32_t ODCD3:1;
    uint32_t ODCD4:1;
    uint32_t ODCD5:1;
    uint32_t ODCD6:1;
    uint32_t ODCD7:1;
    uint32_t ODCD8:1;
    uint32_t ODCD9:1;
    uint32_t ODCD10:1;
    uint32_t ODCD11:1;
    uint32_t ODCD12:1;
    uint32_t ODCD13:1;
    uint32_t ODCD14:1;
    uint32_t ODCD15:1;
  };
  struct {
    uint32_t w:32;
  };
} __ODCDbits_t;
extern volatile __ODCDbits_t ODCDbits __asm__ ("ODCD") __attribute__((section("sfrs"), address(0xBF8860F0)));
extern volatile uint32_t ODCDCLR __attribute__((section("sfrs"),address(0xBF8860F4)));
extern volatile uint32_t ODCDSET __attribute__((section("sfrs"),address(0xBF8860F8)));
extern volatile uint32_t ODCDINV __attribute__((section("sfrs"),address(0xBF8860FC)));

extern volatile uint32_t TRISE __attribute__((section("sfrs"), address(0xBF886100)));
typedef union {
  struct {
    uint32_t TRISE0:1;
    uint32_t TRISE1:1;
    uint32_t TRISE2:1;
    uint32_t TRISE3:1;
    uint32_t TRISE4:1;
    uint32_t TRISE5:1;
    uint32_t TRISE6:1;
    uint32_t TRISE7:1;
    uint32_t TRISE8:1;
    uint32_t TRISE9:1;
  };
  struct {
    uint32_t w:32;
  };
} __TRISEbits_t;
extern volatile __TRISEbits_t TRISEbits __asm__ ("TRISE") __attribute__((section("sfrs"), address(0xBF886100)));
extern volatile uint32_t TRISECLR __attribute__((section("sfrs"),address(0xBF886104)));
extern volatile uint32_t TRISESET __attribute__((section("sfrs"),address(0xBF886108)));
extern volatile uint32_t TRISEINV __attribute__((section("sfrs"),address(0xBF88610C)));

extern volatile uint32_t PORTE __attribute__((section("sfrs"), address(0xBF886110)));
typedef union {
  struct {
    uint32_t RE0:1;
    uint32_t RE1:1;
    uint32_t RE2:1;
    uint32_t RE3:1;
    uint32_t RE4:1;
    uint32_t RE5:1;
    uint32_t RE6:1;
    uint32_t RE7:1;
    uint32_t RE8:1;
    uint32_t RE9:1;
  };
  struct {
    uint32_t w:32;
  };
} __PORTEbits_t;
extern volatile __PORTEbits_t PORTEbits __asm__ ("PORTE") __attribute__((section("sfrs"), address(0xBF886110)));
extern volatile uint32_t PORTECLR __attribute__((section("sfrs"),address(0xBF886114)));
extern volatile uint32_t PORTESET __attribute__((section("sfrs"),address(0xBF886118)));
extern volatile uint32_t PORTEINV __attribute__((section("sfrs"),address(0xBF88611C)));

extern volatile uint32_t LATE __attribute__((section("sfrs"), address(0xBF886120)));
typedef union {
  struct {
    uint32_t LATE0:1;
    uint32_t LATE1:1;
    uint32_t LATE2:1;
    uint32_t LATE3:1;
    uint32_t LATE4:1;
    uint32_t LATE5:1;
    uint32_t LATE6:1;
    uint32_t LATE7:1;
    uint32_t LATE8:1;
    uint32_t LATE9:1;
  };
  struct {
    uint32_t w:32;
  };
} __LATEbits_t;
extern volatile __LATEbits_t LATEbits __asm__ ("LATE") __attribute__((section("sfrs"), address(0xBF886120)));
extern volatile uint32_t LATECLR __attribute__((section("sfrs"),address(0xBF886124)));
extern volatile uint32_t LATESET __attribute__((section("sfrs"),address(0xBF886128)));
extern volatile uint32_t LATEINV __attribute__((section("sfrs"),address(0xBF88612C)));

extern volatile uint32_t ODCE __attribute__((section("sfrs"), address(0xBF886130)));
typedef union {
  struct {
    uint32_t ODCE0:1;
    uint32_t ODCE1:1;
    uint32_t ODCE2:1;
    uint32_t ODCE3:1;
    uint32_t ODCE4:1;
    uint32_t ODCE5:1;
    uint32_t ODCE6:1;
    uint32_t ODCE7:1;
    uint32_t ODCE8:1;
    uint32_t ODCE9:1;
  };
  struct {
    uint32_t w:32;
  };
} __ODCEbits_t;
extern volatile __ODCEbits_t ODCEbits __asm__ ("ODCE") __attribute__((section("sfrs"), address(0xBF886130)));
extern volatile uint32_t ODCECLR __attribute__((section("sfrs"),address(0xBF886134)));
extern volatile uint32_t ODCESET __attribute__((section("sfrs"),address(0xBF886138)));
extern volatile uint32_t ODCEINV __attribute__((section("sfrs"),address(0xBF88613C)));

extern volatile uint32_t TRISF __attribute__((section("sfrs"), address(0xBF886140)));
typedef union {
  struct {
    uint32_t TRISF0:1;
    uint32_t TRISF1:1;
    uint32_t TRISF2:1;
    uint32_t TRISF3:1;
    uint32_t TRISF4:1;
    uint32_t TRISF5:1;
    uint32_t :2;
    uint32_t TRISF8:1;
    uint32_t :3;
    uint32_t TRISF12:1;
    uint32_t TRISF13:1;
  };
  struct {
    uint32_t w:32;
  };
} __TRISFbits_t;
extern volatile __TRISFbits_t TRISFbits __asm__ ("TRISF") __attribute__((section("sfrs"), address(0xBF886140)));
extern volatile uint32_t TRISFCLR __attribute__((section("sfrs"),address(0xBF886144)));
extern volatile uint32_t TRISFSET __attribute__((section("sfrs"),address(0xBF886148)));
extern volatile uint32_t TRISFINV __attribute__((section("sfrs"),address(0xBF88614C)));

extern volatile uint32_t PORTF __attribute__((section("sfrs"), address(0xBF886150)));
typedef union {
  struct {
    uint32_t RF0:1;
    uint32_t RF1:1;
    uint32_t RF2:1;
    uint32_t RF3:1;
    uint32_t RF4:1;
    uint32_t RF5:1;
    uint32_t :2;
    uint32_t RF8:1;
    uint32_t :3;
    uint32_t RF12:1;
    uint32_t RF13:1;
  };
  struct {
    uint32_t w:32;
  };
} __PORTFbits_t;
extern volatile __PORTFbits_t PORTFbits __asm__ ("PORTF") __attribute__((section("sfrs"), address(0xBF886150)));
extern volatile uint32_t PORTFCLR __attribute__((section("sfrs"),address(0xBF886154)));
extern volatile uint32_t PORTFSET __attribute__((section("sfrs"),address(0xBF886158)));
extern volatile uint32_t PORTFINV __attribute__((section("sfrs"),address(0xBF88615C)));

extern volatile uint32_t LATF __attribute__((section("sfrs"), address(0xBF886160)));
typedef union {
  struct {
    uint32_t LATF0:1;
    uint32_t LATF1:1;
    uint32_t LATF2:1;
    uint32_t LATF3:1;
    uint32_t LATF4:1;
    uint32_t LATF5:1;
    uint32_t :2;
    uint32_t LATF8:1;
    uint32_t :3;
    uint32_t LATF12:1;
    uint32_t LATF13:1;
  };
  struct {
    uint32_t w:32;
  };
} __LATFbits_t;
extern volatile __LATFbits_t LATFbits __asm__ ("LATF") __attribute__((section("sfrs"), address(0xBF886160)));
extern volatile uint32_t LATFCLR __attribute__((section("sfrs"),address(0xBF886164)));
extern volatile uint32_t LATFSET __attribute__((section("sfrs"),address(0xBF886168)));
extern volatile uint32_t LATFINV __attribute__((section("sfrs"),address(0xBF88616C)));

extern volatile uint32_t ODCF __attribute__((section("sfrs"), address(0xBF886170)));
typedef union {
  struct {
    uint32_t ODCF0:1;
    uint32_t ODCF1:1;
    uint32_t ODCF2:1;
    uint32_t ODCF3:1;
    uint32_t ODCF4:1;
    uint32_t ODCF5:1;
    uint32_t :2;
    uint32_t ODCF8:1;
    uint32_t :3;
    uint32_t ODCF12:1;
    uint32_t ODCF13:1;
  };
  struct {
    uint32_t w:32;
  };
} __ODCFbits_t;
extern volatile __ODCFbits_t ODCFbits __asm__ ("ODCF") __attribute__((section("sfrs"), address(0xBF886170)));
extern volatile uint32_t ODCFCLR __attribute__((section("sfrs"),address(0xBF886174)));
extern volatile uint32_t ODCFSET __attribute__((section("sfrs"),address(0xBF886178)));
extern volatile uint32_t ODCFINV __attribute__((section("sfrs"),address(0xBF88617C)));

extern volatile uint32_t TRISG __attribute__((section("sfrs"), address(0xBF886180)));
typedef union {
  struct {
    uint32_t TRISG0:1;
    uint32_t TRISG1:1;
    uint32_t TRISG2:1;
    uint32_t TRISG3:1;
    uint32_t :2;
    uint32_t TRISG6:1;
    uint32_t TRISG7:1;
    uint32_t TRISG8:1;
    uint32_t TRISG9:1;
    uint32_t :2;
    uint32_t TRISG12:1;
    uint32_t TRISG13:1;
    uint32_t TRISG14:1;
    uint32_t TRISG15:1;
  };
  struct {
    uint32_t w:32;
  };
} __TRISGbits_t;
extern volatile __TRISGbits_t TRISGbits __asm__ ("TRISG") __attribute__((section("sfrs"), address(0xBF886180)));
extern volatile uint32_t TRISGCLR __attribute__((section("sfrs"),address(0xBF886184)));
extern volatile uint32_t TRISGSET __attribute__((section("sfrs"),address(0xBF886188)));
extern volatile uint32_t TRISGINV __attribute__((section("sfrs"),address(0xBF88618C)));

extern volatile uint32_t PORTG __attribute__((section("sfrs"), address(0xBF886190)));
typedef union {
  struct {
    uint32_t RG0:1;
    uint32_t RG1:1;
    uint32_t RG2:1;
    uint32_t RG3:1;
    uint32_t :2;
    uint32_t RG6:1;
    uint32_t RG7:1;
    uint32_t RG8:1;
    uint32_t RG9:1;
    uint32_t :2;
    uint32_t RG12:1;
    uint32_t RG13:1;
    uint32_t RG14:1;
    uint32_t RG15:1;
  };
  struct {
    uint32_t w:32;
  };
} __PORTGbits_t;
extern volatile __PORTGbits_t PORTGbits __asm__ ("PORTG") __attribute__((section("sfrs"), address(0xBF886190)));
extern volatile uint32_t PORTGCLR __attribute__((section("sfrs"),address(0xBF886194)));
extern volatile uint32_t PORTGSET __attribute__((section("sfrs"),address(0xBF886198)));
extern volatile uint32_t PORTGINV __attribute__((section("sfrs"),address(0xBF88619C)));

extern volatile uint32_t LATG __attribute__((section("sfrs"), address(0xBF8861A0)));
typedef union {
  struct {
    uint32_t LATG0:1;
    uint32_t LATG1:1;
    uint32_t LATG2:1;
    uint32_t LATG3:1;
    uint32_t :2;
    uint32_t LATG6:1;
    uint32_t LATG7:1;
    uint32_t LATG8:1;
    uint32_t LATG9:1;
    uint32_t :2;
    uint32_t LATG12:1;
    uint32_t LATG13:1;
    uint32_t LATG14:1;
    uint32_t LATG15:1;
  };
  struct {
    uint32_t w:32;
  };
} __LATGbits_t;
extern volatile __LATGbits_t LATGbits __asm__ ("LATG") __attribute__((section("sfrs"), address(0xBF8861A0)));
extern volatile uint32_t LATGCLR __attribute__((section("sfrs"),address(0xBF8861A4)));
extern volatile uint32_t LATGSET __attribute__((section("sfrs"),address(0xBF8861A8)));
extern volatile uint32_t LATGINV __attribute__((section("sfrs"),address(0xBF8861AC)));

extern volatile uint32_t ODCG __attribute__((section("sfrs"), address(0xBF8861B0)));
typedef union {
  struct {
    uint32_t ODCG0:1;
    uint32_t ODCG1:1;
    uint32_t ODCG2:1;
    uint32_t ODCG3:1;
    uint32_t :2;
    uint32_t ODCG6:1;
    uint32_t ODCG7:1;
    uint32_t ODCG8:1;
    uint32_t ODCG9:1;
    uint32_t :2;
    uint32_t ODCG12:1;
    uint32_t ODCG13:1;
    uint32_t ODCG14:1;
    uint32_t ODCG15:1;
  };
  struct {
    uint32_t w:32;
  };
} __ODCGbits_t;
extern volatile __ODCGbits_t ODCGbits __asm__ ("ODCG") __attribute__((section("sfrs"), address(0xBF8861B0)));
extern volatile uint32_t ODCGCLR __attribute__((section("sfrs"),address(0xBF8861B4)));
extern volatile uint32_t ODCGSET __attribute__((section("sfrs"),address(0xBF8861B8)));
extern volatile uint32_t ODCGINV __attribute__((section("sfrs"),address(0xBF8861BC)));

extern volatile uint32_t CNCON __attribute__((section("sfrs"), address(0xBF8861C0)));
typedef union {
  struct {
    uint32_t :13;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
  };
  struct {
    uint32_t w:32;
  };
} __CNCONbits_t;
extern volatile __CNCONbits_t CNCONbits __asm__ ("CNCON") __attribute__((section("sfrs"), address(0xBF8861C0)));
extern volatile uint32_t CNCONCLR __attribute__((section("sfrs"),address(0xBF8861C4)));
extern volatile uint32_t CNCONSET __attribute__((section("sfrs"),address(0xBF8861C8)));
extern volatile uint32_t CNCONINV __attribute__((section("sfrs"),address(0xBF8861CC)));

extern volatile uint32_t CNEN __attribute__((section("sfrs"), address(0xBF8861D0)));
typedef union {
  struct {
    uint32_t CNEN0:1;
    uint32_t CNEN1:1;
    uint32_t CNEN2:1;
    uint32_t CNEN3:1;
    uint32_t CNEN4:1;
    uint32_t CNEN5:1;
    uint32_t CNEN6:1;
    uint32_t CNEN7:1;
    uint32_t CNEN8:1;
    uint32_t CNEN9:1;
    uint32_t CNEN10:1;
    uint32_t CNEN11:1;
    uint32_t CNEN12:1;
    uint32_t CNEN13:1;
    uint32_t CNEN14:1;
    uint32_t CNEN15:1;
    uint32_t CNEN16:1;
    uint32_t CNEN17:1;
    uint32_t CNEN18:1;
    uint32_t CNEN19:1;
    uint32_t CNEN20:1;
    uint32_t CNEN21:1;
  };
  struct {
    uint32_t w:32;
  };
} __CNENbits_t;
extern volatile __CNENbits_t CNENbits __asm__ ("CNEN") __attribute__((section("sfrs"), address(0xBF8861D0)));
extern volatile uint32_t CNENCLR __attribute__((section("sfrs"),address(0xBF8861D4)));
extern volatile uint32_t CNENSET __attribute__((section("sfrs"),address(0xBF8861D8)));
extern volatile uint32_t CNENINV __attribute__((section("sfrs"),address(0xBF8861DC)));

extern volatile uint32_t CNPUE __attribute__((section("sfrs"), address(0xBF8861E0)));
typedef union {
  struct {
    uint32_t CNPUE0:1;
    uint32_t CNPUE1:1;
    uint32_t CNPUE2:1;
    uint32_t CNPUE3:1;
    uint32_t CNPUE4:1;
    uint32_t CNPUE5:1;
    uint32_t CNPUE6:1;
    uint32_t CNPUE7:1;
    uint32_t CNPUE8:1;
    uint32_t CNPUE9:1;
    uint32_t CNPUE10:1;
    uint32_t CNPUE11:1;
    uint32_t CNPUE12:1;
    uint32_t CNPUE13:1;
    uint32_t CNPUE14:1;
    uint32_t CNPUE15:1;
    uint32_t CNPUE16:1;
    uint32_t CNPUE17:1;
    uint32_t CNPUE18:1;
    uint32_t CNPUE19:1;
    uint32_t CNPUE20:1;
    uint32_t CNPUE21:1;
  };
  struct {
    uint32_t w:32;
  };
} __CNPUEbits_t;
extern volatile __CNPUEbits_t CNPUEbits __asm__ ("CNPUE") __attribute__((section("sfrs"), address(0xBF8861E0)));
extern volatile uint32_t CNPUECLR __attribute__((section("sfrs"),address(0xBF8861E4)));
extern volatile uint32_t CNPUESET __attribute__((section("sfrs"),address(0xBF8861E8)));
extern volatile uint32_t CNPUEINV __attribute__((section("sfrs"),address(0xBF8861EC)));

extern volatile uint32_t ETHCON1 __attribute__((section("sfrs"), address(0xBF889000)));
typedef union {
  struct {
    uint32_t BUFCDEC:1;
    uint32_t :3;
    uint32_t MANFC:1;
    uint32_t :2;
    uint32_t AUTOFC:1;
    uint32_t RXEN:1;
    uint32_t TXRTS:1;
    uint32_t :3;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
    uint32_t PTV:16;
  };
  struct {
    uint32_t w:32;
  };
} __ETHCON1bits_t;
extern volatile __ETHCON1bits_t ETHCON1bits __asm__ ("ETHCON1") __attribute__((section("sfrs"), address(0xBF889000)));
extern volatile uint32_t ETHCON1CLR __attribute__((section("sfrs"),address(0xBF889004)));
extern volatile uint32_t ETHCON1SET __attribute__((section("sfrs"),address(0xBF889008)));
extern volatile uint32_t ETHCON1INV __attribute__((section("sfrs"),address(0xBF88900C)));

extern volatile uint32_t ETHCON2 __attribute__((section("sfrs"), address(0xBF889010)));
typedef union {
  struct {
    uint32_t :4;
    uint32_t RXBUF_SZ:7;
  };
  struct {
    uint32_t w:32;
  };
} __ETHCON2bits_t;
extern volatile __ETHCON2bits_t ETHCON2bits __asm__ ("ETHCON2") __attribute__((section("sfrs"), address(0xBF889010)));
extern volatile uint32_t ETHCON2CLR __attribute__((section("sfrs"),address(0xBF889014)));
extern volatile uint32_t ETHCON2SET __attribute__((section("sfrs"),address(0xBF889018)));
extern volatile uint32_t ETHCON2INV __attribute__((section("sfrs"),address(0xBF88901C)));

extern volatile uint32_t ETHTXST __attribute__((section("sfrs"), address(0xBF889020)));
typedef union {
  struct {
    uint32_t :2;
    uint32_t TXSTADDR:30;
  };
  struct {
    uint32_t w:32;
  };
} __ETHTXSTbits_t;
extern volatile __ETHTXSTbits_t ETHTXSTbits __asm__ ("ETHTXST") __attribute__((section("sfrs"), address(0xBF889020)));
extern volatile uint32_t ETHTXSTCLR __attribute__((section("sfrs"),address(0xBF889024)));
extern volatile uint32_t ETHTXSTSET __attribute__((section("sfrs"),address(0xBF889028)));
extern volatile uint32_t ETHTXSTINV __attribute__((section("sfrs"),address(0xBF88902C)));

extern volatile uint32_t ETHRXST __attribute__((section("sfrs"), address(0xBF889030)));
typedef union {
  struct {
    uint32_t :2;
    uint32_t RXSTADDR:30;
  };
  struct {
    uint32_t w:32;
  };
} __ETHRXSTbits_t;
extern volatile __ETHRXSTbits_t ETHRXSTbits __asm__ ("ETHRXST") __attribute__((section("sfrs"), address(0xBF889030)));
extern volatile uint32_t ETHRXSTCLR __attribute__((section("sfrs"),address(0xBF889034)));
extern volatile uint32_t ETHRXSTSET __attribute__((section("sfrs"),address(0xBF889038)));
extern volatile uint32_t ETHRXSTINV __attribute__((section("sfrs"),address(0xBF88903C)));

extern volatile uint32_t ETHHT0 __attribute__((section("sfrs"), address(0xBF889040)));
typedef union {
  struct {
    uint32_t w:32;
  };
  struct {
    uint32_t HTLOWER:32;
  };
} __ETHHT0bits_t;
extern volatile __ETHHT0bits_t ETHHT0bits __asm__ ("ETHHT0") __attribute__((section("sfrs"), address(0xBF889040)));
extern volatile uint32_t ETHHT0CLR __attribute__((section("sfrs"),address(0xBF889044)));
extern volatile uint32_t ETHHT0SET __attribute__((section("sfrs"),address(0xBF889048)));
extern volatile uint32_t ETHHT0INV __attribute__((section("sfrs"),address(0xBF88904C)));

extern volatile uint32_t ETHHT1 __attribute__((section("sfrs"), address(0xBF889050)));
typedef union {
  struct {
    uint32_t w:32;
  };
  struct {
    uint32_t HTUPPER:32;
  };
} __ETHHT1bits_t;
extern volatile __ETHHT1bits_t ETHHT1bits __asm__ ("ETHHT1") __attribute__((section("sfrs"), address(0xBF889050)));
extern volatile uint32_t ETHHT1CLR __attribute__((section("sfrs"),address(0xBF889054)));
extern volatile uint32_t ETHHT1SET __attribute__((section("sfrs"),address(0xBF889058)));
extern volatile uint32_t ETHHT1INV __attribute__((section("sfrs"),address(0xBF88905C)));

extern volatile uint32_t ETHPMM0 __attribute__((section("sfrs"), address(0xBF889060)));
typedef union {
  struct {
    uint32_t w:32;
  };
  struct {
    uint32_t PMMLOWER:32;
  };
} __ETHPMM0bits_t;
extern volatile __ETHPMM0bits_t ETHPMM0bits __asm__ ("ETHPMM0") __attribute__((section("sfrs"), address(0xBF889060)));
extern volatile uint32_t ETHPMM0CLR __attribute__((section("sfrs"),address(0xBF889064)));
extern volatile uint32_t ETHPMM0SET __attribute__((section("sfrs"),address(0xBF889068)));
extern volatile uint32_t ETHPMM0INV __attribute__((section("sfrs"),address(0xBF88906C)));

extern volatile uint32_t ETHPMM1 __attribute__((section("sfrs"), address(0xBF889070)));
typedef union {
  struct {
    uint32_t w:32;
  };
  struct {
    uint32_t PMMUPPER:32;
  };
} __ETHPMM1bits_t;
extern volatile __ETHPMM1bits_t ETHPMM1bits __asm__ ("ETHPMM1") __attribute__((section("sfrs"), address(0xBF889070)));
extern volatile uint32_t ETHPMM1CLR __attribute__((section("sfrs"),address(0xBF889074)));
extern volatile uint32_t ETHPMM1SET __attribute__((section("sfrs"),address(0xBF889078)));
extern volatile uint32_t ETHPMM1INV __attribute__((section("sfrs"),address(0xBF88907C)));

extern volatile uint32_t ETHPMCS __attribute__((section("sfrs"), address(0xBF889080)));
typedef union {
  struct {
    uint32_t PMCS:16;
  };
  struct {
    uint32_t w:32;
  };
} __ETHPMCSbits_t;
extern volatile __ETHPMCSbits_t ETHPMCSbits __asm__ ("ETHPMCS") __attribute__((section("sfrs"), address(0xBF889080)));
extern volatile uint32_t ETHPMCSCLR __attribute__((section("sfrs"),address(0xBF889084)));
extern volatile uint32_t ETHPMCSSET __attribute__((section("sfrs"),address(0xBF889088)));
extern volatile uint32_t ETHPMCSINV __attribute__((section("sfrs"),address(0xBF88908C)));

extern volatile uint32_t ETHPMO __attribute__((section("sfrs"), address(0xBF889090)));
typedef union {
  struct {
    uint32_t PMO:16;
  };
  struct {
    uint32_t w:32;
  };
} __ETHPMObits_t;
extern volatile __ETHPMObits_t ETHPMObits __asm__ ("ETHPMO") __attribute__((section("sfrs"), address(0xBF889090)));
extern volatile uint32_t ETHPMOCLR __attribute__((section("sfrs"),address(0xBF889094)));
extern volatile uint32_t ETHPMOSET __attribute__((section("sfrs"),address(0xBF889098)));
extern volatile uint32_t ETHPMOINV __attribute__((section("sfrs"),address(0xBF88909C)));

extern volatile uint32_t ETHRXFC __attribute__((section("sfrs"), address(0xBF8890A0)));
typedef union {
  struct {
    uint32_t BCEN:1;
    uint32_t MCEN:1;
    uint32_t NOTMEEN:1;
    uint32_t UCEN:1;
    uint32_t RUNTEN:1;
    uint32_t RUNTERREN:1;
    uint32_t CRCOKEN:1;
    uint32_t CRCERREN:1;
    uint32_t PMMODE:4;
    uint32_t NOTPM:1;
    uint32_t :1;
    uint32_t MPEN:1;
    uint32_t HTEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __ETHRXFCbits_t;
extern volatile __ETHRXFCbits_t ETHRXFCbits __asm__ ("ETHRXFC") __attribute__((section("sfrs"), address(0xBF8890A0)));
extern volatile uint32_t ETHRXFCCLR __attribute__((section("sfrs"),address(0xBF8890A4)));
extern volatile uint32_t ETHRXFCSET __attribute__((section("sfrs"),address(0xBF8890A8)));
extern volatile uint32_t ETHRXFCINV __attribute__((section("sfrs"),address(0xBF8890AC)));

extern volatile uint32_t ETHRXWM __attribute__((section("sfrs"), address(0xBF8890B0)));
typedef union {
  struct {
    uint32_t RXEWM:8;
    uint32_t :8;
    uint32_t RXFWM:8;
  };
  struct {
    uint32_t w:32;
  };
} __ETHRXWMbits_t;
extern volatile __ETHRXWMbits_t ETHRXWMbits __asm__ ("ETHRXWM") __attribute__((section("sfrs"), address(0xBF8890B0)));
extern volatile uint32_t ETHRXWMCLR __attribute__((section("sfrs"),address(0xBF8890B4)));
extern volatile uint32_t ETHRXWMSET __attribute__((section("sfrs"),address(0xBF8890B8)));
extern volatile uint32_t ETHRXWMINV __attribute__((section("sfrs"),address(0xBF8890BC)));

extern volatile uint32_t ETHIEN __attribute__((section("sfrs"), address(0xBF8890C0)));
typedef union {
  struct {
    uint32_t RXOVFLWIE:1;
    uint32_t RXBUFNAIE:1;
    uint32_t TXABORTIE:1;
    uint32_t TXDONEIE:1;
    uint32_t :1;
    uint32_t RXACTIE:1;
    uint32_t PKTPENDIE:1;
    uint32_t RXDONEIE:1;
    uint32_t FWMARKIE:1;
    uint32_t EWMARKIE:1;
    uint32_t :3;
    uint32_t RXBUSEIE:1;
    uint32_t TXBUSEIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __ETHIENbits_t;
extern volatile __ETHIENbits_t ETHIENbits __asm__ ("ETHIEN") __attribute__((section("sfrs"), address(0xBF8890C0)));
extern volatile uint32_t ETHIENCLR __attribute__((section("sfrs"),address(0xBF8890C4)));
extern volatile uint32_t ETHIENSET __attribute__((section("sfrs"),address(0xBF8890C8)));
extern volatile uint32_t ETHIENINV __attribute__((section("sfrs"),address(0xBF8890CC)));

extern volatile uint32_t ETHIRQ __attribute__((section("sfrs"), address(0xBF8890D0)));
typedef union {
  struct {
    uint32_t RXOVFLW:1;
    uint32_t RXBUFNA:1;
    uint32_t TXABORT:1;
    uint32_t TXDONE:1;
    uint32_t :1;
    uint32_t RXACT:1;
    uint32_t PKTPEND:1;
    uint32_t RXDONE:1;
    uint32_t FWMARK:1;
    uint32_t EWMARK:1;
    uint32_t :3;
    uint32_t RXBUSE:1;
    uint32_t TXBUSE:1;
  };
  struct {
    uint32_t w:32;
  };
} __ETHIRQbits_t;
extern volatile __ETHIRQbits_t ETHIRQbits __asm__ ("ETHIRQ") __attribute__((section("sfrs"), address(0xBF8890D0)));
extern volatile uint32_t ETHIRQCLR __attribute__((section("sfrs"),address(0xBF8890D4)));
extern volatile uint32_t ETHIRQSET __attribute__((section("sfrs"),address(0xBF8890D8)));
extern volatile uint32_t ETHIRQINV __attribute__((section("sfrs"),address(0xBF8890DC)));

extern volatile uint32_t ETHSTAT __attribute__((section("sfrs"), address(0xBF8890E0)));
typedef union {
  struct {
    uint32_t :5;
    uint32_t RXBUSY:1;
    uint32_t TXBUSY:1;
    uint32_t BUSY:1;
    uint32_t :8;
    uint32_t BUFCNT:8;
  };
  struct {
    uint32_t :7;
    uint32_t ETHBUSY:1;
  };
  struct {
    uint32_t w:32;
  };
} __ETHSTATbits_t;
extern volatile __ETHSTATbits_t ETHSTATbits __asm__ ("ETHSTAT") __attribute__((section("sfrs"), address(0xBF8890E0)));
extern volatile uint32_t ETHSTATCLR __attribute__((section("sfrs"),address(0xBF8890E4)));
extern volatile uint32_t ETHSTATSET __attribute__((section("sfrs"),address(0xBF8890E8)));
extern volatile uint32_t ETHSTATINV __attribute__((section("sfrs"),address(0xBF8890EC)));

extern volatile uint32_t ETHRXOVFLOW __attribute__((section("sfrs"), address(0xBF889100)));
typedef union {
  struct {
    uint32_t RXOVFLWCNT:16;
  };
  struct {
    uint32_t w:32;
  };
} __ETHRXOVFLOWbits_t;
extern volatile __ETHRXOVFLOWbits_t ETHRXOVFLOWbits __asm__ ("ETHRXOVFLOW") __attribute__((section("sfrs"), address(0xBF889100)));
extern volatile uint32_t ETHRXOVFLOWCLR __attribute__((section("sfrs"),address(0xBF889104)));
extern volatile uint32_t ETHRXOVFLOWSET __attribute__((section("sfrs"),address(0xBF889108)));
extern volatile uint32_t ETHRXOVFLOWINV __attribute__((section("sfrs"),address(0xBF88910C)));

extern volatile uint32_t ETHFRMTXOK __attribute__((section("sfrs"), address(0xBF889110)));
typedef union {
  struct {
    uint32_t FRMTXOKCNT:16;
  };
  struct {
    uint32_t w:32;
  };
} __ETHFRMTXOKbits_t;
extern volatile __ETHFRMTXOKbits_t ETHFRMTXOKbits __asm__ ("ETHFRMTXOK") __attribute__((section("sfrs"), address(0xBF889110)));
extern volatile uint32_t ETHFRMTXOKCLR __attribute__((section("sfrs"),address(0xBF889114)));
extern volatile uint32_t ETHFRMTXOKSET __attribute__((section("sfrs"),address(0xBF889118)));
extern volatile uint32_t ETHFRMTXOKINV __attribute__((section("sfrs"),address(0xBF88911C)));

extern volatile uint32_t ETHSCOLFRM __attribute__((section("sfrs"), address(0xBF889120)));
typedef union {
  struct {
    uint32_t SCOLFRMCNT:16;
  };
  struct {
    uint32_t w:32;
  };
} __ETHSCOLFRMbits_t;
extern volatile __ETHSCOLFRMbits_t ETHSCOLFRMbits __asm__ ("ETHSCOLFRM") __attribute__((section("sfrs"), address(0xBF889120)));
extern volatile uint32_t ETHSCOLFRMCLR __attribute__((section("sfrs"),address(0xBF889124)));
extern volatile uint32_t ETHSCOLFRMSET __attribute__((section("sfrs"),address(0xBF889128)));
extern volatile uint32_t ETHSCOLFRMINV __attribute__((section("sfrs"),address(0xBF88912C)));

extern volatile uint32_t ETHMCOLFRM __attribute__((section("sfrs"), address(0xBF889130)));
typedef union {
  struct {
    uint32_t MCOLFRMCNT:16;
  };
  struct {
    uint32_t MCOLFRM_CNT:16;
  };
  struct {
    uint32_t w:32;
  };
} __ETHMCOLFRMbits_t;
extern volatile __ETHMCOLFRMbits_t ETHMCOLFRMbits __asm__ ("ETHMCOLFRM") __attribute__((section("sfrs"), address(0xBF889130)));
extern volatile uint32_t ETHMCOLFRMCLR __attribute__((section("sfrs"),address(0xBF889134)));
extern volatile uint32_t ETHMCOLFRMSET __attribute__((section("sfrs"),address(0xBF889138)));
extern volatile uint32_t ETHMCOLFRMINV __attribute__((section("sfrs"),address(0xBF88913C)));

extern volatile uint32_t ETHFRMRXOK __attribute__((section("sfrs"), address(0xBF889140)));
typedef union {
  struct {
    uint32_t FRMRXOKCNT:16;
  };
  struct {
    uint32_t w:32;
  };
} __ETHFRMRXOKbits_t;
extern volatile __ETHFRMRXOKbits_t ETHFRMRXOKbits __asm__ ("ETHFRMRXOK") __attribute__((section("sfrs"), address(0xBF889140)));
extern volatile uint32_t ETHFRMRXOKCLR __attribute__((section("sfrs"),address(0xBF889144)));
extern volatile uint32_t ETHFRMRXOKSET __attribute__((section("sfrs"),address(0xBF889148)));
extern volatile uint32_t ETHFRMRXOKINV __attribute__((section("sfrs"),address(0xBF88914C)));

extern volatile uint32_t ETHFCSERR __attribute__((section("sfrs"), address(0xBF889150)));
typedef union {
  struct {
    uint32_t FCSERRCNT:16;
  };
  struct {
    uint32_t w:32;
  };
} __ETHFCSERRbits_t;
extern volatile __ETHFCSERRbits_t ETHFCSERRbits __asm__ ("ETHFCSERR") __attribute__((section("sfrs"), address(0xBF889150)));
extern volatile uint32_t ETHFCSERRCLR __attribute__((section("sfrs"),address(0xBF889154)));
extern volatile uint32_t ETHFCSERRSET __attribute__((section("sfrs"),address(0xBF889158)));
extern volatile uint32_t ETHFCSERRINV __attribute__((section("sfrs"),address(0xBF88915C)));

extern volatile uint32_t ETHALGNERR __attribute__((section("sfrs"), address(0xBF889160)));
typedef union {
  struct {
    uint32_t ALGNERRCNT:16;
  };
  struct {
    uint32_t w:32;
  };
} __ETHALGNERRbits_t;
extern volatile __ETHALGNERRbits_t ETHALGNERRbits __asm__ ("ETHALGNERR") __attribute__((section("sfrs"), address(0xBF889160)));
extern volatile uint32_t ETHALGNERRCLR __attribute__((section("sfrs"),address(0xBF889164)));
extern volatile uint32_t ETHALGNERRSET __attribute__((section("sfrs"),address(0xBF889168)));
extern volatile uint32_t ETHALGNERRINV __attribute__((section("sfrs"),address(0xBF88916C)));

extern volatile uint32_t EMAC1CFG1 __attribute__((section("sfrs"), address(0xBF889200)));
typedef union {
  struct {
    uint32_t RXENABLE:1;
    uint32_t PASSALL:1;
    uint32_t RXPAUSE:1;
    uint32_t TXPAUSE:1;
    uint32_t LOOPBACK:1;
    uint32_t :3;
    uint32_t RESETTFUN:1;
    uint32_t RESETTMCS:1;
    uint32_t RESETRFUN:1;
    uint32_t RESETRMCS:1;
    uint32_t :2;
    uint32_t SIMRESET:1;
    uint32_t SOFTRESET:1;
  };
  struct {
    uint32_t w:32;
  };
} __EMAC1CFG1bits_t;
extern volatile __EMAC1CFG1bits_t EMAC1CFG1bits __asm__ ("EMAC1CFG1") __attribute__((section("sfrs"), address(0xBF889200)));

extern volatile uint32_t EMACxCFG1 __attribute__((section("sfrs"), address(0xBF889200)));
typedef union {
  struct {
    uint32_t RXENABLE:1;
    uint32_t PASSALL:1;
    uint32_t RXPAUSE:1;
    uint32_t TXPAUSE:1;
    uint32_t LOOPBACK:1;
    uint32_t :3;
    uint32_t RESETTFUN:1;
    uint32_t RESETTMCS:1;
    uint32_t RESETRFUN:1;
    uint32_t RESETRMCS:1;
    uint32_t :2;
    uint32_t SIMRESET:1;
    uint32_t SOFTRESET:1;
  };
  struct {
    uint32_t w:32;
  };
} __EMACxCFG1bits_t;
extern volatile __EMACxCFG1bits_t EMACxCFG1bits __asm__ ("EMACxCFG1") __attribute__((section("sfrs"), address(0xBF889200)));
extern volatile uint32_t EMAC1CFG1CLR __attribute__((section("sfrs"),address(0xBF889204)));
extern volatile uint32_t EMACxCFG1CLR __attribute__((section("sfrs"),address(0xBF889204)));
extern volatile uint32_t EMAC1CFG1SET __attribute__((section("sfrs"),address(0xBF889208)));
extern volatile uint32_t EMACxCFG1SET __attribute__((section("sfrs"),address(0xBF889208)));
extern volatile uint32_t EMAC1CFG1INV __attribute__((section("sfrs"),address(0xBF88920C)));
extern volatile uint32_t EMACxCFG1INV __attribute__((section("sfrs"),address(0xBF88920C)));

extern volatile uint32_t EMAC1CFG2 __attribute__((section("sfrs"), address(0xBF889210)));
typedef union {
  struct {
    uint32_t FULLDPLX:1;
    uint32_t LENGTHCK:1;
    uint32_t HUGEFRM:1;
    uint32_t DELAYCRC:1;
    uint32_t CRCENABLE:1;
    uint32_t PADENABLE:1;
    uint32_t VLANPAD:1;
    uint32_t AUTOPAD:1;
    uint32_t PUREPRE:1;
    uint32_t LONGPRE:1;
    uint32_t :2;
    uint32_t NOBKOFF:1;
    uint32_t BPNOBKOFF:1;
    uint32_t EXCESSDFR:1;
  };
  struct {
    uint32_t w:32;
  };
} __EMAC1CFG2bits_t;
extern volatile __EMAC1CFG2bits_t EMAC1CFG2bits __asm__ ("EMAC1CFG2") __attribute__((section("sfrs"), address(0xBF889210)));

extern volatile uint32_t EMACxCFG2 __attribute__((section("sfrs"), address(0xBF889210)));
typedef union {
  struct {
    uint32_t FULLDPLX:1;
    uint32_t LENGTHCK:1;
    uint32_t HUGEFRM:1;
    uint32_t DELAYCRC:1;
    uint32_t CRCENABLE:1;
    uint32_t PADENABLE:1;
    uint32_t VLANPAD:1;
    uint32_t AUTOPAD:1;
    uint32_t PUREPRE:1;
    uint32_t LONGPRE:1;
    uint32_t :2;
    uint32_t NOBKOFF:1;
    uint32_t BPNOBKOFF:1;
    uint32_t EXCESSDFR:1;
  };
  struct {
    uint32_t w:32;
  };
} __EMACxCFG2bits_t;
extern volatile __EMACxCFG2bits_t EMACxCFG2bits __asm__ ("EMACxCFG2") __attribute__((section("sfrs"), address(0xBF889210)));
extern volatile uint32_t EMAC1CFG2CLR __attribute__((section("sfrs"),address(0xBF889214)));
extern volatile uint32_t EMACxCFG2CLR __attribute__((section("sfrs"),address(0xBF889214)));
extern volatile uint32_t EMAC1CFG2SET __attribute__((section("sfrs"),address(0xBF889218)));
extern volatile uint32_t EMACxCFG2SET __attribute__((section("sfrs"),address(0xBF889218)));
extern volatile uint32_t EMAC1CFG2INV __attribute__((section("sfrs"),address(0xBF88921C)));
extern volatile uint32_t EMACxCFG2INV __attribute__((section("sfrs"),address(0xBF88921C)));

extern volatile uint32_t EMAC1IPGT __attribute__((section("sfrs"), address(0xBF889220)));
typedef union {
  struct {
    uint32_t B2BIPKTGP:7;
  };
  struct {
    uint32_t w:32;
  };
} __EMAC1IPGTbits_t;
extern volatile __EMAC1IPGTbits_t EMAC1IPGTbits __asm__ ("EMAC1IPGT") __attribute__((section("sfrs"), address(0xBF889220)));

extern volatile uint32_t EMACxIPGT __attribute__((section("sfrs"), address(0xBF889220)));
typedef union {
  struct {
    uint32_t B2BIPKTGP:7;
  };
  struct {
    uint32_t w:32;
  };
} __EMACxIPGTbits_t;
extern volatile __EMACxIPGTbits_t EMACxIPGTbits __asm__ ("EMACxIPGT") __attribute__((section("sfrs"), address(0xBF889220)));
extern volatile uint32_t EMAC1IPGTCLR __attribute__((section("sfrs"),address(0xBF889224)));
extern volatile uint32_t EMACxIPGTCLR __attribute__((section("sfrs"),address(0xBF889224)));
extern volatile uint32_t EMAC1IPGTSET __attribute__((section("sfrs"),address(0xBF889228)));
extern volatile uint32_t EMACxIPGTSET __attribute__((section("sfrs"),address(0xBF889228)));
extern volatile uint32_t EMAC1IPGTINV __attribute__((section("sfrs"),address(0xBF88922C)));
extern volatile uint32_t EMACxIPGTINV __attribute__((section("sfrs"),address(0xBF88922C)));

extern volatile uint32_t EMAC1IPGR __attribute__((section("sfrs"), address(0xBF889230)));
typedef union {
  struct {
    uint32_t NB2BIPKTGP2:7;
    uint32_t :1;
    uint32_t NB2BIPKTGP1:7;
  };
  struct {
    uint32_t w:32;
  };
} __EMAC1IPGRbits_t;
extern volatile __EMAC1IPGRbits_t EMAC1IPGRbits __asm__ ("EMAC1IPGR") __attribute__((section("sfrs"), address(0xBF889230)));

extern volatile uint32_t EMACxIPGR __attribute__((section("sfrs"), address(0xBF889230)));
typedef union {
  struct {
    uint32_t NB2BIPKTGP2:7;
    uint32_t :1;
    uint32_t NB2BIPKTGP1:7;
  };
  struct {
    uint32_t w:32;
  };
} __EMACxIPGRbits_t;
extern volatile __EMACxIPGRbits_t EMACxIPGRbits __asm__ ("EMACxIPGR") __attribute__((section("sfrs"), address(0xBF889230)));
extern volatile uint32_t EMAC1IPGRCLR __attribute__((section("sfrs"),address(0xBF889234)));
extern volatile uint32_t EMACxIPGRCLR __attribute__((section("sfrs"),address(0xBF889234)));
extern volatile uint32_t EMAC1IPGRSET __attribute__((section("sfrs"),address(0xBF889238)));
extern volatile uint32_t EMACxIPGRSET __attribute__((section("sfrs"),address(0xBF889238)));
extern volatile uint32_t EMAC1IPGRINV __attribute__((section("sfrs"),address(0xBF88923C)));
extern volatile uint32_t EMACxIPGRINV __attribute__((section("sfrs"),address(0xBF88923C)));

extern volatile uint32_t EMAC1CLRT __attribute__((section("sfrs"), address(0xBF889240)));
typedef union {
  struct {
    uint32_t RETX:4;
    uint32_t :4;
    uint32_t CWINDOW:6;
  };
  struct {
    uint32_t w:32;
  };
} __EMAC1CLRTbits_t;
extern volatile __EMAC1CLRTbits_t EMAC1CLRTbits __asm__ ("EMAC1CLRT") __attribute__((section("sfrs"), address(0xBF889240)));

extern volatile uint32_t EMACxCLRT __attribute__((section("sfrs"), address(0xBF889240)));
typedef union {
  struct {
    uint32_t RETX:4;
    uint32_t :4;
    uint32_t CWINDOW:6;
  };
  struct {
    uint32_t w:32;
  };
} __EMACxCLRTbits_t;
extern volatile __EMACxCLRTbits_t EMACxCLRTbits __asm__ ("EMACxCLRT") __attribute__((section("sfrs"), address(0xBF889240)));
extern volatile uint32_t EMAC1CLRTCLR __attribute__((section("sfrs"),address(0xBF889244)));
extern volatile uint32_t EMACxCLRTCLR __attribute__((section("sfrs"),address(0xBF889244)));
extern volatile uint32_t EMAC1CLRTSET __attribute__((section("sfrs"),address(0xBF889248)));
extern volatile uint32_t EMACxCLRTSET __attribute__((section("sfrs"),address(0xBF889248)));
extern volatile uint32_t EMAC1CLRTINV __attribute__((section("sfrs"),address(0xBF88924C)));
extern volatile uint32_t EMACxCLRTINV __attribute__((section("sfrs"),address(0xBF88924C)));

extern volatile uint32_t EMAC1MAXF __attribute__((section("sfrs"), address(0xBF889250)));
typedef union {
  struct {
    uint32_t MACMAXF:16;
  };
  struct {
    uint32_t w:32;
  };
} __EMAC1MAXFbits_t;
extern volatile __EMAC1MAXFbits_t EMAC1MAXFbits __asm__ ("EMAC1MAXF") __attribute__((section("sfrs"), address(0xBF889250)));

extern volatile uint32_t EMACxMAXF __attribute__((section("sfrs"), address(0xBF889250)));
typedef union {
  struct {
    uint32_t MACMAXF:16;
  };
  struct {
    uint32_t w:32;
  };
} __EMACxMAXFbits_t;
extern volatile __EMACxMAXFbits_t EMACxMAXFbits __asm__ ("EMACxMAXF") __attribute__((section("sfrs"), address(0xBF889250)));
extern volatile uint32_t EMAC1MAXFCLR __attribute__((section("sfrs"),address(0xBF889254)));
extern volatile uint32_t EMACxMAXFCLR __attribute__((section("sfrs"),address(0xBF889254)));
extern volatile uint32_t EMAC1MAXFSET __attribute__((section("sfrs"),address(0xBF889258)));
extern volatile uint32_t EMACxMAXFSET __attribute__((section("sfrs"),address(0xBF889258)));
extern volatile uint32_t EMAC1MAXFINV __attribute__((section("sfrs"),address(0xBF88925C)));
extern volatile uint32_t EMACxMAXFINV __attribute__((section("sfrs"),address(0xBF88925C)));

extern volatile uint32_t EMAC1SUPP __attribute__((section("sfrs"), address(0xBF889260)));
typedef union {
  struct {
    uint32_t :8;
    uint32_t SPEEDRMII:1;
    uint32_t :2;
    uint32_t RESETRMII:1;
  };
  struct {
    uint32_t w:32;
  };
} __EMAC1SUPPbits_t;
extern volatile __EMAC1SUPPbits_t EMAC1SUPPbits __asm__ ("EMAC1SUPP") __attribute__((section("sfrs"), address(0xBF889260)));

extern volatile uint32_t EMACxSUPP __attribute__((section("sfrs"), address(0xBF889260)));
typedef union {
  struct {
    uint32_t :8;
    uint32_t SPEEDRMII:1;
    uint32_t :2;
    uint32_t RESETRMII:1;
  };
  struct {
    uint32_t w:32;
  };
} __EMACxSUPPbits_t;
extern volatile __EMACxSUPPbits_t EMACxSUPPbits __asm__ ("EMACxSUPP") __attribute__((section("sfrs"), address(0xBF889260)));
extern volatile uint32_t EMAC1SUPPCLR __attribute__((section("sfrs"),address(0xBF889264)));
extern volatile uint32_t EMACxSUPPCLR __attribute__((section("sfrs"),address(0xBF889264)));
extern volatile uint32_t EMAC1SUPPSET __attribute__((section("sfrs"),address(0xBF889268)));
extern volatile uint32_t EMACxSUPPSET __attribute__((section("sfrs"),address(0xBF889268)));
extern volatile uint32_t EMAC1SUPPINV __attribute__((section("sfrs"),address(0xBF88926C)));
extern volatile uint32_t EMACxSUPPINV __attribute__((section("sfrs"),address(0xBF88926C)));

extern volatile uint32_t EMAC1TEST __attribute__((section("sfrs"), address(0xBF889270)));
typedef union {
  struct {
    uint32_t SHRTQNTA:1;
    uint32_t TESTPAUSE:1;
    uint32_t TESTBP:1;
  };
  struct {
    uint32_t w:32;
  };
} __EMAC1TESTbits_t;
extern volatile __EMAC1TESTbits_t EMAC1TESTbits __asm__ ("EMAC1TEST") __attribute__((section("sfrs"), address(0xBF889270)));

extern volatile uint32_t EMACxTEST __attribute__((section("sfrs"), address(0xBF889270)));
typedef union {
  struct {
    uint32_t SHRTQNTA:1;
    uint32_t TESTPAUSE:1;
    uint32_t TESTBP:1;
  };
  struct {
    uint32_t w:32;
  };
} __EMACxTESTbits_t;
extern volatile __EMACxTESTbits_t EMACxTESTbits __asm__ ("EMACxTEST") __attribute__((section("sfrs"), address(0xBF889270)));
extern volatile uint32_t EMAC1TESTCLR __attribute__((section("sfrs"),address(0xBF889274)));
extern volatile uint32_t EMACxTESTCLR __attribute__((section("sfrs"),address(0xBF889274)));
extern volatile uint32_t EMAC1TESTSET __attribute__((section("sfrs"),address(0xBF889278)));
extern volatile uint32_t EMACxTESTSET __attribute__((section("sfrs"),address(0xBF889278)));
extern volatile uint32_t EMAC1TESTINV __attribute__((section("sfrs"),address(0xBF88927C)));
extern volatile uint32_t EMACxTESTINV __attribute__((section("sfrs"),address(0xBF88927C)));

extern volatile uint32_t EMAC1MCFG __attribute__((section("sfrs"), address(0xBF889280)));
typedef union {
  struct {
    uint32_t SCANINC:1;
    uint32_t NOPRE:1;
    uint32_t CLKSEL:4;
    uint32_t :9;
    uint32_t RESETMGMT:1;
  };
  struct {
    uint32_t w:32;
  };
} __EMAC1MCFGbits_t;
extern volatile __EMAC1MCFGbits_t EMAC1MCFGbits __asm__ ("EMAC1MCFG") __attribute__((section("sfrs"), address(0xBF889280)));

extern volatile uint32_t EMACxMCFG __attribute__((section("sfrs"), address(0xBF889280)));
typedef union {
  struct {
    uint32_t SCANINC:1;
    uint32_t NOPRE:1;
    uint32_t CLKSEL:4;
    uint32_t :9;
    uint32_t RESETMGMT:1;
  };
  struct {
    uint32_t w:32;
  };
} __EMACxMCFGbits_t;
extern volatile __EMACxMCFGbits_t EMACxMCFGbits __asm__ ("EMACxMCFG") __attribute__((section("sfrs"), address(0xBF889280)));
extern volatile uint32_t EMAC1MCFGCLR __attribute__((section("sfrs"),address(0xBF889284)));
extern volatile uint32_t EMACxMCFGCLR __attribute__((section("sfrs"),address(0xBF889284)));
extern volatile uint32_t EMAC1MCFGSET __attribute__((section("sfrs"),address(0xBF889288)));
extern volatile uint32_t EMACxMCFGSET __attribute__((section("sfrs"),address(0xBF889288)));
extern volatile uint32_t EMAC1MCFGINV __attribute__((section("sfrs"),address(0xBF88928C)));
extern volatile uint32_t EMACxMCFGINV __attribute__((section("sfrs"),address(0xBF88928C)));

extern volatile uint32_t EMAC1MCMD __attribute__((section("sfrs"), address(0xBF889290)));
typedef union {
  struct {
    uint32_t READ:1;
    uint32_t SCAN:1;
  };
  struct {
    uint32_t w:32;
  };
} __EMAC1MCMDbits_t;
extern volatile __EMAC1MCMDbits_t EMAC1MCMDbits __asm__ ("EMAC1MCMD") __attribute__((section("sfrs"), address(0xBF889290)));

extern volatile uint32_t EMACxMCMD __attribute__((section("sfrs"), address(0xBF889290)));
typedef union {
  struct {
    uint32_t READ:1;
    uint32_t SCAN:1;
  };
  struct {
    uint32_t w:32;
  };
} __EMACxMCMDbits_t;
extern volatile __EMACxMCMDbits_t EMACxMCMDbits __asm__ ("EMACxMCMD") __attribute__((section("sfrs"), address(0xBF889290)));
extern volatile uint32_t EMAC1MCMDCLR __attribute__((section("sfrs"),address(0xBF889294)));
extern volatile uint32_t EMACxMCMDCLR __attribute__((section("sfrs"),address(0xBF889294)));
extern volatile uint32_t EMAC1MCMDSET __attribute__((section("sfrs"),address(0xBF889298)));
extern volatile uint32_t EMACxMCMDSET __attribute__((section("sfrs"),address(0xBF889298)));
extern volatile uint32_t EMAC1MCMDINV __attribute__((section("sfrs"),address(0xBF88929C)));
extern volatile uint32_t EMACxMCMDINV __attribute__((section("sfrs"),address(0xBF88929C)));

extern volatile uint32_t EMAC1MADR __attribute__((section("sfrs"), address(0xBF8892A0)));
typedef union {
  struct {
    uint32_t REGADDR:5;
    uint32_t :3;
    uint32_t PHYADDR:5;
  };
  struct {
    uint32_t w:32;
  };
} __EMAC1MADRbits_t;
extern volatile __EMAC1MADRbits_t EMAC1MADRbits __asm__ ("EMAC1MADR") __attribute__((section("sfrs"), address(0xBF8892A0)));

extern volatile uint32_t EMACxMADR __attribute__((section("sfrs"), address(0xBF8892A0)));
typedef union {
  struct {
    uint32_t REGADDR:5;
    uint32_t :3;
    uint32_t PHYADDR:5;
  };
  struct {
    uint32_t w:32;
  };
} __EMACxMADRbits_t;
extern volatile __EMACxMADRbits_t EMACxMADRbits __asm__ ("EMACxMADR") __attribute__((section("sfrs"), address(0xBF8892A0)));
extern volatile uint32_t EMAC1MADRCLR __attribute__((section("sfrs"),address(0xBF8892A4)));
extern volatile uint32_t EMACxMADRCLR __attribute__((section("sfrs"),address(0xBF8892A4)));
extern volatile uint32_t EMAC1MADRSET __attribute__((section("sfrs"),address(0xBF8892A8)));
extern volatile uint32_t EMACxMADRSET __attribute__((section("sfrs"),address(0xBF8892A8)));
extern volatile uint32_t EMAC1MADRINV __attribute__((section("sfrs"),address(0xBF8892AC)));
extern volatile uint32_t EMACxMADRINV __attribute__((section("sfrs"),address(0xBF8892AC)));

extern volatile uint32_t EMAC1MWTD __attribute__((section("sfrs"), address(0xBF8892B0)));
typedef union {
  struct {
    uint32_t MWTD:16;
  };
  struct {
    uint32_t w:32;
  };
} __EMAC1MWTDbits_t;
extern volatile __EMAC1MWTDbits_t EMAC1MWTDbits __asm__ ("EMAC1MWTD") __attribute__((section("sfrs"), address(0xBF8892B0)));

extern volatile uint32_t EMACxMWTD __attribute__((section("sfrs"), address(0xBF8892B0)));
typedef union {
  struct {
    uint32_t MWTD:16;
  };
  struct {
    uint32_t w:32;
  };
} __EMACxMWTDbits_t;
extern volatile __EMACxMWTDbits_t EMACxMWTDbits __asm__ ("EMACxMWTD") __attribute__((section("sfrs"), address(0xBF8892B0)));
extern volatile uint32_t EMAC1MWTDCLR __attribute__((section("sfrs"),address(0xBF8892B4)));
extern volatile uint32_t EMACxMWTDCLR __attribute__((section("sfrs"),address(0xBF8892B4)));
extern volatile uint32_t EMAC1MWTDSET __attribute__((section("sfrs"),address(0xBF8892B8)));
extern volatile uint32_t EMACxMWTDSET __attribute__((section("sfrs"),address(0xBF8892B8)));
extern volatile uint32_t EMAC1MWTDINV __attribute__((section("sfrs"),address(0xBF8892BC)));
extern volatile uint32_t EMACxMWTDINV __attribute__((section("sfrs"),address(0xBF8892BC)));

extern volatile uint32_t EMAC1MRDD __attribute__((section("sfrs"), address(0xBF8892C0)));
typedef union {
  struct {
    uint32_t MRDD:16;
  };
  struct {
    uint32_t w:32;
  };
} __EMAC1MRDDbits_t;
extern volatile __EMAC1MRDDbits_t EMAC1MRDDbits __asm__ ("EMAC1MRDD") __attribute__((section("sfrs"), address(0xBF8892C0)));

extern volatile uint32_t EMACxMRDD __attribute__((section("sfrs"), address(0xBF8892C0)));
typedef union {
  struct {
    uint32_t MRDD:16;
  };
  struct {
    uint32_t w:32;
  };
} __EMACxMRDDbits_t;
extern volatile __EMACxMRDDbits_t EMACxMRDDbits __asm__ ("EMACxMRDD") __attribute__((section("sfrs"), address(0xBF8892C0)));
extern volatile uint32_t EMAC1MRDDCLR __attribute__((section("sfrs"),address(0xBF8892C4)));
extern volatile uint32_t EMACxMRDDCLR __attribute__((section("sfrs"),address(0xBF8892C4)));
extern volatile uint32_t EMAC1MRDDSET __attribute__((section("sfrs"),address(0xBF8892C8)));
extern volatile uint32_t EMACxMRDDSET __attribute__((section("sfrs"),address(0xBF8892C8)));
extern volatile uint32_t EMAC1MRDDINV __attribute__((section("sfrs"),address(0xBF8892CC)));
extern volatile uint32_t EMACxMRDDINV __attribute__((section("sfrs"),address(0xBF8892CC)));

extern volatile uint32_t EMAC1MIND __attribute__((section("sfrs"), address(0xBF8892D0)));
typedef union {
  struct {
    uint32_t MIIMBUSY:1;
    uint32_t SCAN:1;
    uint32_t NOTVALID:1;
    uint32_t LINKFAIL:1;
  };
  struct {
    uint32_t w:32;
  };
} __EMAC1MINDbits_t;
extern volatile __EMAC1MINDbits_t EMAC1MINDbits __asm__ ("EMAC1MIND") __attribute__((section("sfrs"), address(0xBF8892D0)));

extern volatile uint32_t EMACxMIND __attribute__((section("sfrs"), address(0xBF8892D0)));
typedef union {
  struct {
    uint32_t MIIMBUSY:1;
    uint32_t SCAN:1;
    uint32_t NOTVALID:1;
    uint32_t LINKFAIL:1;
  };
  struct {
    uint32_t w:32;
  };
} __EMACxMINDbits_t;
extern volatile __EMACxMINDbits_t EMACxMINDbits __asm__ ("EMACxMIND") __attribute__((section("sfrs"), address(0xBF8892D0)));
extern volatile uint32_t EMAC1MINDCLR __attribute__((section("sfrs"),address(0xBF8892D4)));
extern volatile uint32_t EMACxMINDCLR __attribute__((section("sfrs"),address(0xBF8892D4)));
extern volatile uint32_t EMAC1MINDSET __attribute__((section("sfrs"),address(0xBF8892D8)));
extern volatile uint32_t EMACxMINDSET __attribute__((section("sfrs"),address(0xBF8892D8)));
extern volatile uint32_t EMAC1MINDINV __attribute__((section("sfrs"),address(0xBF8892DC)));
extern volatile uint32_t EMACxMINDINV __attribute__((section("sfrs"),address(0xBF8892DC)));

extern volatile uint32_t EMAC1SA0 __attribute__((section("sfrs"), address(0xBF889300)));
typedef union {
  struct {
    uint32_t STNADDR5:8;
    uint32_t STNADDR6:8;
  };
  struct {
    uint32_t w:32;
  };
} __EMAC1SA0bits_t;
extern volatile __EMAC1SA0bits_t EMAC1SA0bits __asm__ ("EMAC1SA0") __attribute__((section("sfrs"), address(0xBF889300)));

extern volatile uint32_t EMACxSA0 __attribute__((section("sfrs"), address(0xBF889300)));
typedef union {
  struct {
    uint32_t STNADDR5:8;
    uint32_t STNADDR6:8;
  };
  struct {
    uint32_t w:32;
  };
} __EMACxSA0bits_t;
extern volatile __EMACxSA0bits_t EMACxSA0bits __asm__ ("EMACxSA0") __attribute__((section("sfrs"), address(0xBF889300)));
extern volatile uint32_t EMAC1SA0CLR __attribute__((section("sfrs"),address(0xBF889304)));
extern volatile uint32_t EMACxSA0CLR __attribute__((section("sfrs"),address(0xBF889304)));
extern volatile uint32_t EMAC1SA0SET __attribute__((section("sfrs"),address(0xBF889308)));
extern volatile uint32_t EMACxSA0SET __attribute__((section("sfrs"),address(0xBF889308)));
extern volatile uint32_t EMAC1SA0INV __attribute__((section("sfrs"),address(0xBF88930C)));
extern volatile uint32_t EMACxSA0INV __attribute__((section("sfrs"),address(0xBF88930C)));

extern volatile uint32_t EMAC1SA1 __attribute__((section("sfrs"), address(0xBF889310)));
typedef union {
  struct {
    uint32_t STNADDR3:8;
    uint32_t STNADDR4:8;
  };
  struct {
    uint32_t w:32;
  };
} __EMAC1SA1bits_t;
extern volatile __EMAC1SA1bits_t EMAC1SA1bits __asm__ ("EMAC1SA1") __attribute__((section("sfrs"), address(0xBF889310)));

extern volatile uint32_t EMACxSA1 __attribute__((section("sfrs"), address(0xBF889310)));
typedef union {
  struct {
    uint32_t STNADDR3:8;
    uint32_t STNADDR4:8;
  };
  struct {
    uint32_t w:32;
  };
} __EMACxSA1bits_t;
extern volatile __EMACxSA1bits_t EMACxSA1bits __asm__ ("EMACxSA1") __attribute__((section("sfrs"), address(0xBF889310)));
extern volatile uint32_t EMAC1SA1CLR __attribute__((section("sfrs"),address(0xBF889314)));
extern volatile uint32_t EMACxSA1CLR __attribute__((section("sfrs"),address(0xBF889314)));
extern volatile uint32_t EMAC1SA1SET __attribute__((section("sfrs"),address(0xBF889318)));
extern volatile uint32_t EMACxSA1SET __attribute__((section("sfrs"),address(0xBF889318)));
extern volatile uint32_t EMAC1SA1INV __attribute__((section("sfrs"),address(0xBF88931C)));
extern volatile uint32_t EMACxSA1INV __attribute__((section("sfrs"),address(0xBF88931C)));

extern volatile uint32_t EMAC1SA2 __attribute__((section("sfrs"), address(0xBF889320)));
typedef union {
  struct {
    uint32_t STNADDR1:8;
    uint32_t STNADDR2:8;
  };
  struct {
    uint32_t w:32;
  };
} __EMAC1SA2bits_t;
extern volatile __EMAC1SA2bits_t EMAC1SA2bits __asm__ ("EMAC1SA2") __attribute__((section("sfrs"), address(0xBF889320)));

extern volatile uint32_t EMACxSA2 __attribute__((section("sfrs"), address(0xBF889320)));
typedef union {
  struct {
    uint32_t STNADDR1:8;
    uint32_t STNADDR2:8;
  };
  struct {
    uint32_t w:32;
  };
} __EMACxSA2bits_t;
extern volatile __EMACxSA2bits_t EMACxSA2bits __asm__ ("EMACxSA2") __attribute__((section("sfrs"), address(0xBF889320)));
extern volatile uint32_t EMAC1SA2CLR __attribute__((section("sfrs"),address(0xBF889324)));
extern volatile uint32_t EMACxSA2CLR __attribute__((section("sfrs"),address(0xBF889324)));
extern volatile uint32_t EMAC1SA2SET __attribute__((section("sfrs"),address(0xBF889328)));
extern volatile uint32_t EMACxSA2SET __attribute__((section("sfrs"),address(0xBF889328)));
extern volatile uint32_t EMAC1SA2INV __attribute__((section("sfrs"),address(0xBF88932C)));
extern volatile uint32_t EMACxSA2INV __attribute__((section("sfrs"),address(0xBF88932C)));

extern volatile uint32_t C1CON __attribute__((section("sfrs"), address(0xBF88B000)));
typedef union {
  struct {
    uint32_t DNCNT:5;
    uint32_t :6;
    uint32_t CANBUSY:1;
    uint32_t :1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
    uint32_t :4;
    uint32_t CANCAP:1;
    uint32_t OPMOD:3;
    uint32_t REQOP:3;
    uint32_t ABAT:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1CONbits_t;
extern volatile __C1CONbits_t C1CONbits __asm__ ("C1CON") __attribute__((section("sfrs"), address(0xBF88B000)));
extern volatile uint32_t C1CONCLR __attribute__((section("sfrs"),address(0xBF88B004)));
extern volatile uint32_t C1CONSET __attribute__((section("sfrs"),address(0xBF88B008)));
extern volatile uint32_t C1CONINV __attribute__((section("sfrs"),address(0xBF88B00C)));

extern volatile uint32_t C1CFG __attribute__((section("sfrs"), address(0xBF88B010)));
typedef union {
  struct {
    uint32_t BRP:6;
    uint32_t SJW:2;
    uint32_t PRSEG:3;
    uint32_t SEG1PH:3;
    uint32_t SAM:1;
    uint32_t SEG2PHTS:1;
    uint32_t SEG2PH:3;
    uint32_t :3;
    uint32_t WAKFIL:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1CFGbits_t;
extern volatile __C1CFGbits_t C1CFGbits __asm__ ("C1CFG") __attribute__((section("sfrs"), address(0xBF88B010)));
extern volatile uint32_t C1CFGCLR __attribute__((section("sfrs"),address(0xBF88B014)));
extern volatile uint32_t C1CFGSET __attribute__((section("sfrs"),address(0xBF88B018)));
extern volatile uint32_t C1CFGINV __attribute__((section("sfrs"),address(0xBF88B01C)));

extern volatile uint32_t C1INT __attribute__((section("sfrs"), address(0xBF88B020)));
typedef union {
  struct {
    uint32_t TBIF:1;
    uint32_t RBIF:1;
    uint32_t CTMRIF:1;
    uint32_t MODIF:1;
    uint32_t :7;
    uint32_t RBOVIF:1;
    uint32_t SERRIF:1;
    uint32_t CERRIF:1;
    uint32_t WAKIF:1;
    uint32_t IVRIF:1;
    uint32_t TBIE:1;
    uint32_t RBIE:1;
    uint32_t CTMRIE:1;
    uint32_t MODIE:1;
    uint32_t :7;
    uint32_t RBOVIE:1;
    uint32_t SERRIE:1;
    uint32_t CERRIE:1;
    uint32_t WAKIE:1;
    uint32_t IVRIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1INTbits_t;
extern volatile __C1INTbits_t C1INTbits __asm__ ("C1INT") __attribute__((section("sfrs"), address(0xBF88B020)));
extern volatile uint32_t C1INTCLR __attribute__((section("sfrs"),address(0xBF88B024)));
extern volatile uint32_t C1INTSET __attribute__((section("sfrs"),address(0xBF88B028)));
extern volatile uint32_t C1INTINV __attribute__((section("sfrs"),address(0xBF88B02C)));

extern volatile uint32_t C1VEC __attribute__((section("sfrs"), address(0xBF88B030)));
typedef union {
  struct {
    uint32_t ICODE:7;
    uint32_t :1;
    uint32_t FILHIT:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1VECbits_t;
extern volatile __C1VECbits_t C1VECbits __asm__ ("C1VEC") __attribute__((section("sfrs"), address(0xBF88B030)));
extern volatile uint32_t C1VECCLR __attribute__((section("sfrs"),address(0xBF88B034)));
extern volatile uint32_t C1VECSET __attribute__((section("sfrs"),address(0xBF88B038)));
extern volatile uint32_t C1VECINV __attribute__((section("sfrs"),address(0xBF88B03C)));

extern volatile uint32_t C1TREC __attribute__((section("sfrs"), address(0xBF88B040)));
typedef union {
  struct {
    uint32_t RERRCNT:8;
    uint32_t TERRCNT:8;
    uint32_t EWARN:1;
    uint32_t RXWARN:1;
    uint32_t TXWARN:1;
    uint32_t RXBP:1;
    uint32_t TXBP:1;
    uint32_t TXBO:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1TRECbits_t;
extern volatile __C1TRECbits_t C1TRECbits __asm__ ("C1TREC") __attribute__((section("sfrs"), address(0xBF88B040)));
extern volatile uint32_t C1TRECCLR __attribute__((section("sfrs"),address(0xBF88B044)));
extern volatile uint32_t C1TRECSET __attribute__((section("sfrs"),address(0xBF88B048)));
extern volatile uint32_t C1TRECINV __attribute__((section("sfrs"),address(0xBF88B04C)));

extern volatile uint32_t C1FSTAT __attribute__((section("sfrs"), address(0xBF88B050)));
typedef union {
  struct {
    uint32_t FIFOIP:32;
  };
  struct {
    uint32_t FIFOIP0:1;
    uint32_t FIFOIP1:1;
    uint32_t FIFOIP2:1;
    uint32_t FIFOIP3:1;
    uint32_t FIFOIP4:1;
    uint32_t FIFOIP5:1;
    uint32_t FIFOIP6:1;
    uint32_t FIFOIP7:1;
    uint32_t FIFOIP8:1;
    uint32_t FIFOIP9:1;
    uint32_t FIFOIP10:1;
    uint32_t FIFOIP11:1;
    uint32_t FIFOIP12:1;
    uint32_t FIFOIP13:1;
    uint32_t FIFOIP14:1;
    uint32_t FIFOIP15:1;
    uint32_t FIFOIP16:1;
    uint32_t FIFOIP17:1;
    uint32_t FIFOIP18:1;
    uint32_t FIFOIP19:1;
    uint32_t FIFOIP20:1;
    uint32_t FIFOIP21:1;
    uint32_t FIFOIP22:1;
    uint32_t FIFOIP23:1;
    uint32_t FIFOIP24:1;
    uint32_t FIFOIP25:1;
    uint32_t FIFOIP26:1;
    uint32_t FIFOIP27:1;
    uint32_t FIFOIP28:1;
    uint32_t FIFOIP29:1;
    uint32_t FIFOIP30:1;
    uint32_t FIFOIP31:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FSTATbits_t;
extern volatile __C1FSTATbits_t C1FSTATbits __asm__ ("C1FSTAT") __attribute__((section("sfrs"), address(0xBF88B050)));
extern volatile uint32_t C1FSTATCLR __attribute__((section("sfrs"),address(0xBF88B054)));
extern volatile uint32_t C1FSTATSET __attribute__((section("sfrs"),address(0xBF88B058)));
extern volatile uint32_t C1FSTATINV __attribute__((section("sfrs"),address(0xBF88B05C)));

extern volatile uint32_t C1RXOVF __attribute__((section("sfrs"), address(0xBF88B060)));
typedef union {
  struct {
    uint32_t RXOVF:32;
  };
  struct {
    uint32_t RXOVF0:1;
    uint32_t RXOVF1:1;
    uint32_t RXOVF2:1;
    uint32_t RXOVF3:1;
    uint32_t RXOVF4:1;
    uint32_t RXOVF5:1;
    uint32_t RXOVF6:1;
    uint32_t RXOVF7:1;
    uint32_t RXOVF8:1;
    uint32_t RXOVF9:1;
    uint32_t RXOVF10:1;
    uint32_t RXOVF11:1;
    uint32_t RXOVF12:1;
    uint32_t RXOVF13:1;
    uint32_t RXOVF14:1;
    uint32_t RXOVF15:1;
    uint32_t RXOVF16:1;
    uint32_t RXOVF17:1;
    uint32_t RXOVF18:1;
    uint32_t RXOVF19:1;
    uint32_t RXOVF20:1;
    uint32_t RXOVF21:1;
    uint32_t RXOVF22:1;
    uint32_t RXOVF23:1;
    uint32_t RXOVF24:1;
    uint32_t RXOVF25:1;
    uint32_t RXOVF26:1;
    uint32_t RXOVF27:1;
    uint32_t RXOVF28:1;
    uint32_t RXOVF29:1;
    uint32_t RXOVF30:1;
    uint32_t RXOVF31:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXOVFbits_t;
extern volatile __C1RXOVFbits_t C1RXOVFbits __asm__ ("C1RXOVF") __attribute__((section("sfrs"), address(0xBF88B060)));
extern volatile uint32_t C1RXOVFCLR __attribute__((section("sfrs"),address(0xBF88B064)));
extern volatile uint32_t C1RXOVFSET __attribute__((section("sfrs"),address(0xBF88B068)));
extern volatile uint32_t C1RXOVFINV __attribute__((section("sfrs"),address(0xBF88B06C)));

extern volatile uint32_t C1TMR __attribute__((section("sfrs"), address(0xBF88B070)));
typedef union {
  struct {
    uint32_t CANTSPRE:16;
    uint32_t CANTS:16;
  };
  struct {
    uint32_t w:32;
  };
} __C1TMRbits_t;
extern volatile __C1TMRbits_t C1TMRbits __asm__ ("C1TMR") __attribute__((section("sfrs"), address(0xBF88B070)));
extern volatile uint32_t C1TMRCLR __attribute__((section("sfrs"),address(0xBF88B074)));
extern volatile uint32_t C1TMRSET __attribute__((section("sfrs"),address(0xBF88B078)));
extern volatile uint32_t C1TMRINV __attribute__((section("sfrs"),address(0xBF88B07C)));

extern volatile uint32_t C1RXM0 __attribute__((section("sfrs"), address(0xBF88B080)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t MIDE:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXM0bits_t;
extern volatile __C1RXM0bits_t C1RXM0bits __asm__ ("C1RXM0") __attribute__((section("sfrs"), address(0xBF88B080)));
extern volatile uint32_t C1RXM0CLR __attribute__((section("sfrs"),address(0xBF88B084)));
extern volatile uint32_t C1RXM0SET __attribute__((section("sfrs"),address(0xBF88B088)));
extern volatile uint32_t C1RXM0INV __attribute__((section("sfrs"),address(0xBF88B08C)));

extern volatile uint32_t C1RXM1 __attribute__((section("sfrs"), address(0xBF88B090)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t MIDE:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXM1bits_t;
extern volatile __C1RXM1bits_t C1RXM1bits __asm__ ("C1RXM1") __attribute__((section("sfrs"), address(0xBF88B090)));
extern volatile uint32_t C1RXM1CLR __attribute__((section("sfrs"),address(0xBF88B094)));
extern volatile uint32_t C1RXM1SET __attribute__((section("sfrs"),address(0xBF88B098)));
extern volatile uint32_t C1RXM1INV __attribute__((section("sfrs"),address(0xBF88B09C)));

extern volatile uint32_t C1RXM2 __attribute__((section("sfrs"), address(0xBF88B0A0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t MIDE:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXM2bits_t;
extern volatile __C1RXM2bits_t C1RXM2bits __asm__ ("C1RXM2") __attribute__((section("sfrs"), address(0xBF88B0A0)));
extern volatile uint32_t C1RXM2CLR __attribute__((section("sfrs"),address(0xBF88B0A4)));
extern volatile uint32_t C1RXM2SET __attribute__((section("sfrs"),address(0xBF88B0A8)));
extern volatile uint32_t C1RXM2INV __attribute__((section("sfrs"),address(0xBF88B0AC)));

extern volatile uint32_t C1RXM3 __attribute__((section("sfrs"), address(0xBF88B0B0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t MIDE:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXM3bits_t;
extern volatile __C1RXM3bits_t C1RXM3bits __asm__ ("C1RXM3") __attribute__((section("sfrs"), address(0xBF88B0B0)));
extern volatile uint32_t C1RXM3CLR __attribute__((section("sfrs"),address(0xBF88B0B4)));
extern volatile uint32_t C1RXM3SET __attribute__((section("sfrs"),address(0xBF88B0B8)));
extern volatile uint32_t C1RXM3INV __attribute__((section("sfrs"),address(0xBF88B0BC)));

extern volatile uint32_t C1FLTCON0 __attribute__((section("sfrs"), address(0xBF88B0C0)));
typedef union {
  struct {
    uint32_t FSEL0:5;
    uint32_t MSEL0:2;
    uint32_t FLTEN0:1;
    uint32_t FSEL1:5;
    uint32_t MSEL1:2;
    uint32_t FLTEN1:1;
    uint32_t FSEL2:5;
    uint32_t MSEL2:2;
    uint32_t FLTEN2:1;
    uint32_t FSEL3:5;
    uint32_t MSEL3:2;
    uint32_t FLTEN3:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FLTCON0bits_t;
extern volatile __C1FLTCON0bits_t C1FLTCON0bits __asm__ ("C1FLTCON0") __attribute__((section("sfrs"), address(0xBF88B0C0)));
extern volatile uint32_t C1FLTCON0CLR __attribute__((section("sfrs"),address(0xBF88B0C4)));
extern volatile uint32_t C1FLTCON0SET __attribute__((section("sfrs"),address(0xBF88B0C8)));
extern volatile uint32_t C1FLTCON0INV __attribute__((section("sfrs"),address(0xBF88B0CC)));

extern volatile uint32_t C1FLTCON1 __attribute__((section("sfrs"), address(0xBF88B0D0)));
typedef union {
  struct {
    uint32_t FSEL4:5;
    uint32_t MSEL4:2;
    uint32_t FLTEN4:1;
    uint32_t FSEL5:5;
    uint32_t MSEL5:2;
    uint32_t FLTEN5:1;
    uint32_t FSEL6:5;
    uint32_t MSEL6:2;
    uint32_t FLTEN6:1;
    uint32_t FSEL7:5;
    uint32_t MSEL7:2;
    uint32_t FLTEN7:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FLTCON1bits_t;
extern volatile __C1FLTCON1bits_t C1FLTCON1bits __asm__ ("C1FLTCON1") __attribute__((section("sfrs"), address(0xBF88B0D0)));
extern volatile uint32_t C1FLTCON1CLR __attribute__((section("sfrs"),address(0xBF88B0D4)));
extern volatile uint32_t C1FLTCON1SET __attribute__((section("sfrs"),address(0xBF88B0D8)));
extern volatile uint32_t C1FLTCON1INV __attribute__((section("sfrs"),address(0xBF88B0DC)));

extern volatile uint32_t C1FLTCON2 __attribute__((section("sfrs"), address(0xBF88B0E0)));
typedef union {
  struct {
    uint32_t FSEL8:5;
    uint32_t MSEL8:2;
    uint32_t FLTEN8:1;
    uint32_t FSEL9:5;
    uint32_t MSEL9:2;
    uint32_t FLTEN9:1;
    uint32_t FSEL10:5;
    uint32_t MSEL10:2;
    uint32_t FLTEN10:1;
    uint32_t FSEL11:5;
    uint32_t MSEL11:2;
    uint32_t FLTEN11:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FLTCON2bits_t;
extern volatile __C1FLTCON2bits_t C1FLTCON2bits __asm__ ("C1FLTCON2") __attribute__((section("sfrs"), address(0xBF88B0E0)));
extern volatile uint32_t C1FLTCON2CLR __attribute__((section("sfrs"),address(0xBF88B0E4)));
extern volatile uint32_t C1FLTCON2SET __attribute__((section("sfrs"),address(0xBF88B0E8)));
extern volatile uint32_t C1FLTCON2INV __attribute__((section("sfrs"),address(0xBF88B0EC)));

extern volatile uint32_t C1FLTCON3 __attribute__((section("sfrs"), address(0xBF88B0F0)));
typedef union {
  struct {
    uint32_t FSEL12:5;
    uint32_t MSEL12:2;
    uint32_t FLTEN12:1;
    uint32_t FSEL13:5;
    uint32_t MSEL13:2;
    uint32_t FLTEN13:1;
    uint32_t FSEL14:5;
    uint32_t MSEL14:2;
    uint32_t FLTEN14:1;
    uint32_t FSEL15:5;
    uint32_t MSEL15:2;
    uint32_t FLTEN15:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FLTCON3bits_t;
extern volatile __C1FLTCON3bits_t C1FLTCON3bits __asm__ ("C1FLTCON3") __attribute__((section("sfrs"), address(0xBF88B0F0)));
extern volatile uint32_t C1FLTCON3CLR __attribute__((section("sfrs"),address(0xBF88B0F4)));
extern volatile uint32_t C1FLTCON3SET __attribute__((section("sfrs"),address(0xBF88B0F8)));
extern volatile uint32_t C1FLTCON3INV __attribute__((section("sfrs"),address(0xBF88B0FC)));

extern volatile uint32_t C1FLTCON4 __attribute__((section("sfrs"), address(0xBF88B100)));
typedef union {
  struct {
    uint32_t FSEL16:5;
    uint32_t MSEL16:2;
    uint32_t FLTEN16:1;
    uint32_t FSEL17:5;
    uint32_t MSEL17:2;
    uint32_t FLTEN17:1;
    uint32_t FSEL18:5;
    uint32_t MSEL18:2;
    uint32_t FLTEN18:1;
    uint32_t FSEL19:5;
    uint32_t MSEL19:2;
    uint32_t FLTEN19:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FLTCON4bits_t;
extern volatile __C1FLTCON4bits_t C1FLTCON4bits __asm__ ("C1FLTCON4") __attribute__((section("sfrs"), address(0xBF88B100)));
extern volatile uint32_t C1FLTCON4CLR __attribute__((section("sfrs"),address(0xBF88B104)));
extern volatile uint32_t C1FLTCON4SET __attribute__((section("sfrs"),address(0xBF88B108)));
extern volatile uint32_t C1FLTCON4INV __attribute__((section("sfrs"),address(0xBF88B10C)));

extern volatile uint32_t C1FLTCON5 __attribute__((section("sfrs"), address(0xBF88B110)));
typedef union {
  struct {
    uint32_t FSEL20:5;
    uint32_t MSEL20:2;
    uint32_t FLTEN20:1;
    uint32_t FSEL21:5;
    uint32_t MSEL21:2;
    uint32_t FLTEN21:1;
    uint32_t FSEL22:5;
    uint32_t MSEL22:2;
    uint32_t FLTEN22:1;
    uint32_t FSEL23:5;
    uint32_t MSEL23:2;
    uint32_t FLTEN23:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FLTCON5bits_t;
extern volatile __C1FLTCON5bits_t C1FLTCON5bits __asm__ ("C1FLTCON5") __attribute__((section("sfrs"), address(0xBF88B110)));
extern volatile uint32_t C1FLTCON5CLR __attribute__((section("sfrs"),address(0xBF88B114)));
extern volatile uint32_t C1FLTCON5SET __attribute__((section("sfrs"),address(0xBF88B118)));
extern volatile uint32_t C1FLTCON5INV __attribute__((section("sfrs"),address(0xBF88B11C)));

extern volatile uint32_t C1FLTCON6 __attribute__((section("sfrs"), address(0xBF88B120)));
typedef union {
  struct {
    uint32_t FSEL24:5;
    uint32_t MSEL24:2;
    uint32_t FLTEN24:1;
    uint32_t FSEL25:5;
    uint32_t MSEL25:2;
    uint32_t FLTEN25:1;
    uint32_t FSEL26:5;
    uint32_t MSEL26:2;
    uint32_t FLTEN26:1;
    uint32_t FSEL27:5;
    uint32_t MSEL27:2;
    uint32_t FLTEN27:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FLTCON6bits_t;
extern volatile __C1FLTCON6bits_t C1FLTCON6bits __asm__ ("C1FLTCON6") __attribute__((section("sfrs"), address(0xBF88B120)));
extern volatile uint32_t C1FLTCON6CLR __attribute__((section("sfrs"),address(0xBF88B124)));
extern volatile uint32_t C1FLTCON6SET __attribute__((section("sfrs"),address(0xBF88B128)));
extern volatile uint32_t C1FLTCON6INV __attribute__((section("sfrs"),address(0xBF88B12C)));

extern volatile uint32_t C1FLTCON7 __attribute__((section("sfrs"), address(0xBF88B130)));
typedef union {
  struct {
    uint32_t FSEL28:5;
    uint32_t MSEL28:2;
    uint32_t FLTEN28:1;
    uint32_t FSEL29:5;
    uint32_t MSEL29:2;
    uint32_t FLTEN29:1;
    uint32_t FSEL30:5;
    uint32_t MSEL30:2;
    uint32_t FLTEN30:1;
    uint32_t FSEL31:5;
    uint32_t MSEL31:2;
    uint32_t FLTEN31:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FLTCON7bits_t;
extern volatile __C1FLTCON7bits_t C1FLTCON7bits __asm__ ("C1FLTCON7") __attribute__((section("sfrs"), address(0xBF88B130)));
extern volatile uint32_t C1FLTCON7CLR __attribute__((section("sfrs"),address(0xBF88B134)));
extern volatile uint32_t C1FLTCON7SET __attribute__((section("sfrs"),address(0xBF88B138)));
extern volatile uint32_t C1FLTCON7INV __attribute__((section("sfrs"),address(0xBF88B13C)));

extern volatile uint32_t C1RXF0 __attribute__((section("sfrs"), address(0xBF88B140)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF0bits_t;
extern volatile __C1RXF0bits_t C1RXF0bits __asm__ ("C1RXF0") __attribute__((section("sfrs"), address(0xBF88B140)));
extern volatile uint32_t C1RXF0CLR __attribute__((section("sfrs"),address(0xBF88B144)));
extern volatile uint32_t C1RXF0SET __attribute__((section("sfrs"),address(0xBF88B148)));
extern volatile uint32_t C1RXF0INV __attribute__((section("sfrs"),address(0xBF88B14C)));

extern volatile uint32_t C1RXF1 __attribute__((section("sfrs"), address(0xBF88B150)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF1bits_t;
extern volatile __C1RXF1bits_t C1RXF1bits __asm__ ("C1RXF1") __attribute__((section("sfrs"), address(0xBF88B150)));
extern volatile uint32_t C1RXF1CLR __attribute__((section("sfrs"),address(0xBF88B154)));
extern volatile uint32_t C1RXF1SET __attribute__((section("sfrs"),address(0xBF88B158)));
extern volatile uint32_t C1RXF1INV __attribute__((section("sfrs"),address(0xBF88B15C)));

extern volatile uint32_t C1RXF2 __attribute__((section("sfrs"), address(0xBF88B160)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF2bits_t;
extern volatile __C1RXF2bits_t C1RXF2bits __asm__ ("C1RXF2") __attribute__((section("sfrs"), address(0xBF88B160)));
extern volatile uint32_t C1RXF2CLR __attribute__((section("sfrs"),address(0xBF88B164)));
extern volatile uint32_t C1RXF2SET __attribute__((section("sfrs"),address(0xBF88B168)));
extern volatile uint32_t C1RXF2INV __attribute__((section("sfrs"),address(0xBF88B16C)));

extern volatile uint32_t C1RXF3 __attribute__((section("sfrs"), address(0xBF88B170)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF3bits_t;
extern volatile __C1RXF3bits_t C1RXF3bits __asm__ ("C1RXF3") __attribute__((section("sfrs"), address(0xBF88B170)));
extern volatile uint32_t C1RXF3CLR __attribute__((section("sfrs"),address(0xBF88B174)));
extern volatile uint32_t C1RXF3SET __attribute__((section("sfrs"),address(0xBF88B178)));
extern volatile uint32_t C1RXF3INV __attribute__((section("sfrs"),address(0xBF88B17C)));

extern volatile uint32_t C1RXF4 __attribute__((section("sfrs"), address(0xBF88B180)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF4bits_t;
extern volatile __C1RXF4bits_t C1RXF4bits __asm__ ("C1RXF4") __attribute__((section("sfrs"), address(0xBF88B180)));
extern volatile uint32_t C1RXF4CLR __attribute__((section("sfrs"),address(0xBF88B184)));
extern volatile uint32_t C1RXF4SET __attribute__((section("sfrs"),address(0xBF88B188)));
extern volatile uint32_t C1RXF4INV __attribute__((section("sfrs"),address(0xBF88B18C)));

extern volatile uint32_t C1RXF5 __attribute__((section("sfrs"), address(0xBF88B190)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF5bits_t;
extern volatile __C1RXF5bits_t C1RXF5bits __asm__ ("C1RXF5") __attribute__((section("sfrs"), address(0xBF88B190)));
extern volatile uint32_t C1RXF5CLR __attribute__((section("sfrs"),address(0xBF88B194)));
extern volatile uint32_t C1RXF5SET __attribute__((section("sfrs"),address(0xBF88B198)));
extern volatile uint32_t C1RXF5INV __attribute__((section("sfrs"),address(0xBF88B19C)));

extern volatile uint32_t C1RXF6 __attribute__((section("sfrs"), address(0xBF88B1A0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF6bits_t;
extern volatile __C1RXF6bits_t C1RXF6bits __asm__ ("C1RXF6") __attribute__((section("sfrs"), address(0xBF88B1A0)));
extern volatile uint32_t C1RXF6CLR __attribute__((section("sfrs"),address(0xBF88B1A4)));
extern volatile uint32_t C1RXF6SET __attribute__((section("sfrs"),address(0xBF88B1A8)));
extern volatile uint32_t C1RXF6INV __attribute__((section("sfrs"),address(0xBF88B1AC)));

extern volatile uint32_t C1RXF7 __attribute__((section("sfrs"), address(0xBF88B1B0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF7bits_t;
extern volatile __C1RXF7bits_t C1RXF7bits __asm__ ("C1RXF7") __attribute__((section("sfrs"), address(0xBF88B1B0)));
extern volatile uint32_t C1RXF7CLR __attribute__((section("sfrs"),address(0xBF88B1B4)));
extern volatile uint32_t C1RXF7SET __attribute__((section("sfrs"),address(0xBF88B1B8)));
extern volatile uint32_t C1RXF7INV __attribute__((section("sfrs"),address(0xBF88B1BC)));

extern volatile uint32_t C1RXF8 __attribute__((section("sfrs"), address(0xBF88B1C0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF8bits_t;
extern volatile __C1RXF8bits_t C1RXF8bits __asm__ ("C1RXF8") __attribute__((section("sfrs"), address(0xBF88B1C0)));
extern volatile uint32_t C1RXF8CLR __attribute__((section("sfrs"),address(0xBF88B1C4)));
extern volatile uint32_t C1RXF8SET __attribute__((section("sfrs"),address(0xBF88B1C8)));
extern volatile uint32_t C1RXF8INV __attribute__((section("sfrs"),address(0xBF88B1CC)));

extern volatile uint32_t C1RXF9 __attribute__((section("sfrs"), address(0xBF88B1D0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF9bits_t;
extern volatile __C1RXF9bits_t C1RXF9bits __asm__ ("C1RXF9") __attribute__((section("sfrs"), address(0xBF88B1D0)));
extern volatile uint32_t C1RXF9CLR __attribute__((section("sfrs"),address(0xBF88B1D4)));
extern volatile uint32_t C1RXF9SET __attribute__((section("sfrs"),address(0xBF88B1D8)));
extern volatile uint32_t C1RXF9INV __attribute__((section("sfrs"),address(0xBF88B1DC)));

extern volatile uint32_t C1RXF10 __attribute__((section("sfrs"), address(0xBF88B1E0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF10bits_t;
extern volatile __C1RXF10bits_t C1RXF10bits __asm__ ("C1RXF10") __attribute__((section("sfrs"), address(0xBF88B1E0)));
extern volatile uint32_t C1RXF10CLR __attribute__((section("sfrs"),address(0xBF88B1E4)));
extern volatile uint32_t C1RXF10SET __attribute__((section("sfrs"),address(0xBF88B1E8)));
extern volatile uint32_t C1RXF10INV __attribute__((section("sfrs"),address(0xBF88B1EC)));

extern volatile uint32_t C1RXF11 __attribute__((section("sfrs"), address(0xBF88B1F0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF11bits_t;
extern volatile __C1RXF11bits_t C1RXF11bits __asm__ ("C1RXF11") __attribute__((section("sfrs"), address(0xBF88B1F0)));
extern volatile uint32_t C1RXF11CLR __attribute__((section("sfrs"),address(0xBF88B1F4)));
extern volatile uint32_t C1RXF11SET __attribute__((section("sfrs"),address(0xBF88B1F8)));
extern volatile uint32_t C1RXF11INV __attribute__((section("sfrs"),address(0xBF88B1FC)));

extern volatile uint32_t C1RXF12 __attribute__((section("sfrs"), address(0xBF88B200)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF12bits_t;
extern volatile __C1RXF12bits_t C1RXF12bits __asm__ ("C1RXF12") __attribute__((section("sfrs"), address(0xBF88B200)));
extern volatile uint32_t C1RXF12CLR __attribute__((section("sfrs"),address(0xBF88B204)));
extern volatile uint32_t C1RXF12SET __attribute__((section("sfrs"),address(0xBF88B208)));
extern volatile uint32_t C1RXF12INV __attribute__((section("sfrs"),address(0xBF88B20C)));

extern volatile uint32_t C1RXF13 __attribute__((section("sfrs"), address(0xBF88B210)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF13bits_t;
extern volatile __C1RXF13bits_t C1RXF13bits __asm__ ("C1RXF13") __attribute__((section("sfrs"), address(0xBF88B210)));
extern volatile uint32_t C1RXF13CLR __attribute__((section("sfrs"),address(0xBF88B214)));
extern volatile uint32_t C1RXF13SET __attribute__((section("sfrs"),address(0xBF88B218)));
extern volatile uint32_t C1RXF13INV __attribute__((section("sfrs"),address(0xBF88B21C)));

extern volatile uint32_t C1RXF14 __attribute__((section("sfrs"), address(0xBF88B220)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF14bits_t;
extern volatile __C1RXF14bits_t C1RXF14bits __asm__ ("C1RXF14") __attribute__((section("sfrs"), address(0xBF88B220)));
extern volatile uint32_t C1RXF14CLR __attribute__((section("sfrs"),address(0xBF88B224)));
extern volatile uint32_t C1RXF14SET __attribute__((section("sfrs"),address(0xBF88B228)));
extern volatile uint32_t C1RXF14INV __attribute__((section("sfrs"),address(0xBF88B22C)));

extern volatile uint32_t C1RXF15 __attribute__((section("sfrs"), address(0xBF88B230)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF15bits_t;
extern volatile __C1RXF15bits_t C1RXF15bits __asm__ ("C1RXF15") __attribute__((section("sfrs"), address(0xBF88B230)));
extern volatile uint32_t C1RXF15CLR __attribute__((section("sfrs"),address(0xBF88B234)));
extern volatile uint32_t C1RXF15SET __attribute__((section("sfrs"),address(0xBF88B238)));
extern volatile uint32_t C1RXF15INV __attribute__((section("sfrs"),address(0xBF88B23C)));

extern volatile uint32_t C1RXF16 __attribute__((section("sfrs"), address(0xBF88B240)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF16bits_t;
extern volatile __C1RXF16bits_t C1RXF16bits __asm__ ("C1RXF16") __attribute__((section("sfrs"), address(0xBF88B240)));
extern volatile uint32_t C1RXF16CLR __attribute__((section("sfrs"),address(0xBF88B244)));
extern volatile uint32_t C1RXF16SET __attribute__((section("sfrs"),address(0xBF88B248)));
extern volatile uint32_t C1RXF16INV __attribute__((section("sfrs"),address(0xBF88B24C)));

extern volatile uint32_t C1RXF17 __attribute__((section("sfrs"), address(0xBF88B250)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF17bits_t;
extern volatile __C1RXF17bits_t C1RXF17bits __asm__ ("C1RXF17") __attribute__((section("sfrs"), address(0xBF88B250)));
extern volatile uint32_t C1RXF17CLR __attribute__((section("sfrs"),address(0xBF88B254)));
extern volatile uint32_t C1RXF17SET __attribute__((section("sfrs"),address(0xBF88B258)));
extern volatile uint32_t C1RXF17INV __attribute__((section("sfrs"),address(0xBF88B25C)));

extern volatile uint32_t C1RXF18 __attribute__((section("sfrs"), address(0xBF88B260)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF18bits_t;
extern volatile __C1RXF18bits_t C1RXF18bits __asm__ ("C1RXF18") __attribute__((section("sfrs"), address(0xBF88B260)));
extern volatile uint32_t C1RXF18CLR __attribute__((section("sfrs"),address(0xBF88B264)));
extern volatile uint32_t C1RXF18SET __attribute__((section("sfrs"),address(0xBF88B268)));
extern volatile uint32_t C1RXF18INV __attribute__((section("sfrs"),address(0xBF88B26C)));

extern volatile uint32_t C1RXF19 __attribute__((section("sfrs"), address(0xBF88B270)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF19bits_t;
extern volatile __C1RXF19bits_t C1RXF19bits __asm__ ("C1RXF19") __attribute__((section("sfrs"), address(0xBF88B270)));
extern volatile uint32_t C1RXF19CLR __attribute__((section("sfrs"),address(0xBF88B274)));
extern volatile uint32_t C1RXF19SET __attribute__((section("sfrs"),address(0xBF88B278)));
extern volatile uint32_t C1RXF19INV __attribute__((section("sfrs"),address(0xBF88B27C)));

extern volatile uint32_t C1RXF20 __attribute__((section("sfrs"), address(0xBF88B280)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF20bits_t;
extern volatile __C1RXF20bits_t C1RXF20bits __asm__ ("C1RXF20") __attribute__((section("sfrs"), address(0xBF88B280)));
extern volatile uint32_t C1RXF20CLR __attribute__((section("sfrs"),address(0xBF88B284)));
extern volatile uint32_t C1RXF20SET __attribute__((section("sfrs"),address(0xBF88B288)));
extern volatile uint32_t C1RXF20INV __attribute__((section("sfrs"),address(0xBF88B28C)));

extern volatile uint32_t C1RXF21 __attribute__((section("sfrs"), address(0xBF88B290)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF21bits_t;
extern volatile __C1RXF21bits_t C1RXF21bits __asm__ ("C1RXF21") __attribute__((section("sfrs"), address(0xBF88B290)));
extern volatile uint32_t C1RXF21CLR __attribute__((section("sfrs"),address(0xBF88B294)));
extern volatile uint32_t C1RXF21SET __attribute__((section("sfrs"),address(0xBF88B298)));
extern volatile uint32_t C1RXF21INV __attribute__((section("sfrs"),address(0xBF88B29C)));

extern volatile uint32_t C1RXF22 __attribute__((section("sfrs"), address(0xBF88B2A0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF22bits_t;
extern volatile __C1RXF22bits_t C1RXF22bits __asm__ ("C1RXF22") __attribute__((section("sfrs"), address(0xBF88B2A0)));
extern volatile uint32_t C1RXF22CLR __attribute__((section("sfrs"),address(0xBF88B2A4)));
extern volatile uint32_t C1RXF22SET __attribute__((section("sfrs"),address(0xBF88B2A8)));
extern volatile uint32_t C1RXF22INV __attribute__((section("sfrs"),address(0xBF88B2AC)));

extern volatile uint32_t C1RXF23 __attribute__((section("sfrs"), address(0xBF88B2B0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF23bits_t;
extern volatile __C1RXF23bits_t C1RXF23bits __asm__ ("C1RXF23") __attribute__((section("sfrs"), address(0xBF88B2B0)));
extern volatile uint32_t C1RXF23CLR __attribute__((section("sfrs"),address(0xBF88B2B4)));
extern volatile uint32_t C1RXF23SET __attribute__((section("sfrs"),address(0xBF88B2B8)));
extern volatile uint32_t C1RXF23INV __attribute__((section("sfrs"),address(0xBF88B2BC)));

extern volatile uint32_t C1RXF24 __attribute__((section("sfrs"), address(0xBF88B2C0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF24bits_t;
extern volatile __C1RXF24bits_t C1RXF24bits __asm__ ("C1RXF24") __attribute__((section("sfrs"), address(0xBF88B2C0)));
extern volatile uint32_t C1RXF24CLR __attribute__((section("sfrs"),address(0xBF88B2C4)));
extern volatile uint32_t C1RXF24SET __attribute__((section("sfrs"),address(0xBF88B2C8)));
extern volatile uint32_t C1RXF24INV __attribute__((section("sfrs"),address(0xBF88B2CC)));

extern volatile uint32_t C1RXF25 __attribute__((section("sfrs"), address(0xBF88B2D0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF25bits_t;
extern volatile __C1RXF25bits_t C1RXF25bits __asm__ ("C1RXF25") __attribute__((section("sfrs"), address(0xBF88B2D0)));
extern volatile uint32_t C1RXF25CLR __attribute__((section("sfrs"),address(0xBF88B2D4)));
extern volatile uint32_t C1RXF25SET __attribute__((section("sfrs"),address(0xBF88B2D8)));
extern volatile uint32_t C1RXF25INV __attribute__((section("sfrs"),address(0xBF88B2DC)));

extern volatile uint32_t C1RXF26 __attribute__((section("sfrs"), address(0xBF88B2E0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF26bits_t;
extern volatile __C1RXF26bits_t C1RXF26bits __asm__ ("C1RXF26") __attribute__((section("sfrs"), address(0xBF88B2E0)));
extern volatile uint32_t C1RXF26CLR __attribute__((section("sfrs"),address(0xBF88B2E4)));
extern volatile uint32_t C1RXF26SET __attribute__((section("sfrs"),address(0xBF88B2E8)));
extern volatile uint32_t C1RXF26INV __attribute__((section("sfrs"),address(0xBF88B2EC)));

extern volatile uint32_t C1RXF27 __attribute__((section("sfrs"), address(0xBF88B2F0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF27bits_t;
extern volatile __C1RXF27bits_t C1RXF27bits __asm__ ("C1RXF27") __attribute__((section("sfrs"), address(0xBF88B2F0)));
extern volatile uint32_t C1RXF27CLR __attribute__((section("sfrs"),address(0xBF88B2F4)));
extern volatile uint32_t C1RXF27SET __attribute__((section("sfrs"),address(0xBF88B2F8)));
extern volatile uint32_t C1RXF27INV __attribute__((section("sfrs"),address(0xBF88B2FC)));

extern volatile uint32_t C1RXF28 __attribute__((section("sfrs"), address(0xBF88B300)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF28bits_t;
extern volatile __C1RXF28bits_t C1RXF28bits __asm__ ("C1RXF28") __attribute__((section("sfrs"), address(0xBF88B300)));
extern volatile uint32_t C1RXF28CLR __attribute__((section("sfrs"),address(0xBF88B304)));
extern volatile uint32_t C1RXF28SET __attribute__((section("sfrs"),address(0xBF88B308)));
extern volatile uint32_t C1RXF28INV __attribute__((section("sfrs"),address(0xBF88B30C)));

extern volatile uint32_t C1RXF29 __attribute__((section("sfrs"), address(0xBF88B310)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF29bits_t;
extern volatile __C1RXF29bits_t C1RXF29bits __asm__ ("C1RXF29") __attribute__((section("sfrs"), address(0xBF88B310)));
extern volatile uint32_t C1RXF29CLR __attribute__((section("sfrs"),address(0xBF88B314)));
extern volatile uint32_t C1RXF29SET __attribute__((section("sfrs"),address(0xBF88B318)));
extern volatile uint32_t C1RXF29INV __attribute__((section("sfrs"),address(0xBF88B31C)));

extern volatile uint32_t C1RXF30 __attribute__((section("sfrs"), address(0xBF88B320)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF30bits_t;
extern volatile __C1RXF30bits_t C1RXF30bits __asm__ ("C1RXF30") __attribute__((section("sfrs"), address(0xBF88B320)));
extern volatile uint32_t C1RXF30CLR __attribute__((section("sfrs"),address(0xBF88B324)));
extern volatile uint32_t C1RXF30SET __attribute__((section("sfrs"),address(0xBF88B328)));
extern volatile uint32_t C1RXF30INV __attribute__((section("sfrs"),address(0xBF88B32C)));

extern volatile uint32_t C1RXF31 __attribute__((section("sfrs"), address(0xBF88B330)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C1RXF31bits_t;
extern volatile __C1RXF31bits_t C1RXF31bits __asm__ ("C1RXF31") __attribute__((section("sfrs"), address(0xBF88B330)));
extern volatile uint32_t C1RXF31CLR __attribute__((section("sfrs"),address(0xBF88B334)));
extern volatile uint32_t C1RXF31SET __attribute__((section("sfrs"),address(0xBF88B338)));
extern volatile uint32_t C1RXF31INV __attribute__((section("sfrs"),address(0xBF88B33C)));

extern volatile uint32_t C1FIFOBA __attribute__((section("sfrs"), address(0xBF88B340)));
extern volatile uint32_t C1FIFOBACLR __attribute__((section("sfrs"),address(0xBF88B344)));
extern volatile uint32_t C1FIFOBASET __attribute__((section("sfrs"),address(0xBF88B348)));
extern volatile uint32_t C1FIFOBAINV __attribute__((section("sfrs"),address(0xBF88B34C)));

extern volatile uint32_t C1FIFOCON0 __attribute__((section("sfrs"), address(0xBF88B350)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON0bits_t;
extern volatile __C1FIFOCON0bits_t C1FIFOCON0bits __asm__ ("C1FIFOCON0") __attribute__((section("sfrs"), address(0xBF88B350)));
extern volatile uint32_t C1FIFOCON0CLR __attribute__((section("sfrs"),address(0xBF88B354)));
extern volatile uint32_t C1FIFOCON0SET __attribute__((section("sfrs"),address(0xBF88B358)));
extern volatile uint32_t C1FIFOCON0INV __attribute__((section("sfrs"),address(0xBF88B35C)));

extern volatile uint32_t C1FIFOINT0 __attribute__((section("sfrs"), address(0xBF88B360)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT0bits_t;
extern volatile __C1FIFOINT0bits_t C1FIFOINT0bits __asm__ ("C1FIFOINT0") __attribute__((section("sfrs"), address(0xBF88B360)));
extern volatile uint32_t C1FIFOINT0CLR __attribute__((section("sfrs"),address(0xBF88B364)));
extern volatile uint32_t C1FIFOINT0SET __attribute__((section("sfrs"),address(0xBF88B368)));
extern volatile uint32_t C1FIFOINT0INV __attribute__((section("sfrs"),address(0xBF88B36C)));

extern volatile uint32_t C1FIFOUA0 __attribute__((section("sfrs"), address(0xBF88B370)));
extern volatile uint32_t C1FIFOUA0CLR __attribute__((section("sfrs"),address(0xBF88B374)));
extern volatile uint32_t C1FIFOUA0SET __attribute__((section("sfrs"),address(0xBF88B378)));
extern volatile uint32_t C1FIFOUA0INV __attribute__((section("sfrs"),address(0xBF88B37C)));

extern volatile uint32_t C1FIFOCI0 __attribute__((section("sfrs"), address(0xBF88B380)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI0bits_t;
extern volatile __C1FIFOCI0bits_t C1FIFOCI0bits __asm__ ("C1FIFOCI0") __attribute__((section("sfrs"), address(0xBF88B380)));
extern volatile uint32_t C1FIFOCI0CLR __attribute__((section("sfrs"),address(0xBF88B384)));
extern volatile uint32_t C1FIFOCI0SET __attribute__((section("sfrs"),address(0xBF88B388)));
extern volatile uint32_t C1FIFOCI0INV __attribute__((section("sfrs"),address(0xBF88B38C)));

extern volatile uint32_t C1FIFOCON1 __attribute__((section("sfrs"), address(0xBF88B390)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON1bits_t;
extern volatile __C1FIFOCON1bits_t C1FIFOCON1bits __asm__ ("C1FIFOCON1") __attribute__((section("sfrs"), address(0xBF88B390)));
extern volatile uint32_t C1FIFOCON1CLR __attribute__((section("sfrs"),address(0xBF88B394)));
extern volatile uint32_t C1FIFOCON1SET __attribute__((section("sfrs"),address(0xBF88B398)));
extern volatile uint32_t C1FIFOCON1INV __attribute__((section("sfrs"),address(0xBF88B39C)));

extern volatile uint32_t C1FIFOINT1 __attribute__((section("sfrs"), address(0xBF88B3A0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT1bits_t;
extern volatile __C1FIFOINT1bits_t C1FIFOINT1bits __asm__ ("C1FIFOINT1") __attribute__((section("sfrs"), address(0xBF88B3A0)));
extern volatile uint32_t C1FIFOINT1CLR __attribute__((section("sfrs"),address(0xBF88B3A4)));
extern volatile uint32_t C1FIFOINT1SET __attribute__((section("sfrs"),address(0xBF88B3A8)));
extern volatile uint32_t C1FIFOINT1INV __attribute__((section("sfrs"),address(0xBF88B3AC)));

extern volatile uint32_t C1FIFOUA1 __attribute__((section("sfrs"), address(0xBF88B3B0)));
extern volatile uint32_t C1FIFOUA1CLR __attribute__((section("sfrs"),address(0xBF88B3B4)));
extern volatile uint32_t C1FIFOUA1SET __attribute__((section("sfrs"),address(0xBF88B3B8)));
extern volatile uint32_t C1FIFOUA1INV __attribute__((section("sfrs"),address(0xBF88B3BC)));

extern volatile uint32_t C1FIFOCI1 __attribute__((section("sfrs"), address(0xBF88B3C0)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI1bits_t;
extern volatile __C1FIFOCI1bits_t C1FIFOCI1bits __asm__ ("C1FIFOCI1") __attribute__((section("sfrs"), address(0xBF88B3C0)));
extern volatile uint32_t C1FIFOCI1CLR __attribute__((section("sfrs"),address(0xBF88B3C4)));
extern volatile uint32_t C1FIFOCI1SET __attribute__((section("sfrs"),address(0xBF88B3C8)));
extern volatile uint32_t C1FIFOCI1INV __attribute__((section("sfrs"),address(0xBF88B3CC)));

extern volatile uint32_t C1FIFOCON2 __attribute__((section("sfrs"), address(0xBF88B3D0)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON2bits_t;
extern volatile __C1FIFOCON2bits_t C1FIFOCON2bits __asm__ ("C1FIFOCON2") __attribute__((section("sfrs"), address(0xBF88B3D0)));
extern volatile uint32_t C1FIFOCON2CLR __attribute__((section("sfrs"),address(0xBF88B3D4)));
extern volatile uint32_t C1FIFOCON2SET __attribute__((section("sfrs"),address(0xBF88B3D8)));
extern volatile uint32_t C1FIFOCON2INV __attribute__((section("sfrs"),address(0xBF88B3DC)));

extern volatile uint32_t C1FIFOINT2 __attribute__((section("sfrs"), address(0xBF88B3E0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT2bits_t;
extern volatile __C1FIFOINT2bits_t C1FIFOINT2bits __asm__ ("C1FIFOINT2") __attribute__((section("sfrs"), address(0xBF88B3E0)));
extern volatile uint32_t C1FIFOINT2CLR __attribute__((section("sfrs"),address(0xBF88B3E4)));
extern volatile uint32_t C1FIFOINT2SET __attribute__((section("sfrs"),address(0xBF88B3E8)));
extern volatile uint32_t C1FIFOINT2INV __attribute__((section("sfrs"),address(0xBF88B3EC)));

extern volatile uint32_t C1FIFOUA2 __attribute__((section("sfrs"), address(0xBF88B3F0)));
extern volatile uint32_t C1FIFOUA2CLR __attribute__((section("sfrs"),address(0xBF88B3F4)));
extern volatile uint32_t C1FIFOUA2SET __attribute__((section("sfrs"),address(0xBF88B3F8)));
extern volatile uint32_t C1FIFOUA2INV __attribute__((section("sfrs"),address(0xBF88B3FC)));

extern volatile uint32_t C1FIFOCI2 __attribute__((section("sfrs"), address(0xBF88B400)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI2bits_t;
extern volatile __C1FIFOCI2bits_t C1FIFOCI2bits __asm__ ("C1FIFOCI2") __attribute__((section("sfrs"), address(0xBF88B400)));
extern volatile uint32_t C1FIFOCI2CLR __attribute__((section("sfrs"),address(0xBF88B404)));
extern volatile uint32_t C1FIFOCI2SET __attribute__((section("sfrs"),address(0xBF88B408)));
extern volatile uint32_t C1FIFOCI2INV __attribute__((section("sfrs"),address(0xBF88B40C)));

extern volatile uint32_t C1FIFOCON3 __attribute__((section("sfrs"), address(0xBF88B410)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON3bits_t;
extern volatile __C1FIFOCON3bits_t C1FIFOCON3bits __asm__ ("C1FIFOCON3") __attribute__((section("sfrs"), address(0xBF88B410)));
extern volatile uint32_t C1FIFOCON3CLR __attribute__((section("sfrs"),address(0xBF88B414)));
extern volatile uint32_t C1FIFOCON3SET __attribute__((section("sfrs"),address(0xBF88B418)));
extern volatile uint32_t C1FIFOCON3INV __attribute__((section("sfrs"),address(0xBF88B41C)));

extern volatile uint32_t C1FIFOINT3 __attribute__((section("sfrs"), address(0xBF88B420)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT3bits_t;
extern volatile __C1FIFOINT3bits_t C1FIFOINT3bits __asm__ ("C1FIFOINT3") __attribute__((section("sfrs"), address(0xBF88B420)));
extern volatile uint32_t C1FIFOINT3CLR __attribute__((section("sfrs"),address(0xBF88B424)));
extern volatile uint32_t C1FIFOINT3SET __attribute__((section("sfrs"),address(0xBF88B428)));
extern volatile uint32_t C1FIFOINT3INV __attribute__((section("sfrs"),address(0xBF88B42C)));

extern volatile uint32_t C1FIFOUA3 __attribute__((section("sfrs"), address(0xBF88B430)));
extern volatile uint32_t C1FIFOUA3CLR __attribute__((section("sfrs"),address(0xBF88B434)));
extern volatile uint32_t C1FIFOUA3SET __attribute__((section("sfrs"),address(0xBF88B438)));
extern volatile uint32_t C1FIFOUA3INV __attribute__((section("sfrs"),address(0xBF88B43C)));

extern volatile uint32_t C1FIFOCI3 __attribute__((section("sfrs"), address(0xBF88B440)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI3bits_t;
extern volatile __C1FIFOCI3bits_t C1FIFOCI3bits __asm__ ("C1FIFOCI3") __attribute__((section("sfrs"), address(0xBF88B440)));
extern volatile uint32_t C1FIFOCI3CLR __attribute__((section("sfrs"),address(0xBF88B444)));
extern volatile uint32_t C1FIFOCI3SET __attribute__((section("sfrs"),address(0xBF88B448)));
extern volatile uint32_t C1FIFOCI3INV __attribute__((section("sfrs"),address(0xBF88B44C)));

extern volatile uint32_t C1FIFOCON4 __attribute__((section("sfrs"), address(0xBF88B450)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON4bits_t;
extern volatile __C1FIFOCON4bits_t C1FIFOCON4bits __asm__ ("C1FIFOCON4") __attribute__((section("sfrs"), address(0xBF88B450)));
extern volatile uint32_t C1FIFOCON4CLR __attribute__((section("sfrs"),address(0xBF88B454)));
extern volatile uint32_t C1FIFOCON4SET __attribute__((section("sfrs"),address(0xBF88B458)));
extern volatile uint32_t C1FIFOCON4INV __attribute__((section("sfrs"),address(0xBF88B45C)));

extern volatile uint32_t C1FIFOINT4 __attribute__((section("sfrs"), address(0xBF88B460)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT4bits_t;
extern volatile __C1FIFOINT4bits_t C1FIFOINT4bits __asm__ ("C1FIFOINT4") __attribute__((section("sfrs"), address(0xBF88B460)));
extern volatile uint32_t C1FIFOINT4CLR __attribute__((section("sfrs"),address(0xBF88B464)));
extern volatile uint32_t C1FIFOINT4SET __attribute__((section("sfrs"),address(0xBF88B468)));
extern volatile uint32_t C1FIFOINT4INV __attribute__((section("sfrs"),address(0xBF88B46C)));

extern volatile uint32_t C1FIFOUA4 __attribute__((section("sfrs"), address(0xBF88B470)));
extern volatile uint32_t C1FIFOUA4CLR __attribute__((section("sfrs"),address(0xBF88B474)));
extern volatile uint32_t C1FIFOUA4SET __attribute__((section("sfrs"),address(0xBF88B478)));
extern volatile uint32_t C1FIFOUA4INV __attribute__((section("sfrs"),address(0xBF88B47C)));

extern volatile uint32_t C1FIFOCI4 __attribute__((section("sfrs"), address(0xBF88B480)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI4bits_t;
extern volatile __C1FIFOCI4bits_t C1FIFOCI4bits __asm__ ("C1FIFOCI4") __attribute__((section("sfrs"), address(0xBF88B480)));
extern volatile uint32_t C1FIFOCI4CLR __attribute__((section("sfrs"),address(0xBF88B484)));
extern volatile uint32_t C1FIFOCI4SET __attribute__((section("sfrs"),address(0xBF88B488)));
extern volatile uint32_t C1FIFOCI4INV __attribute__((section("sfrs"),address(0xBF88B48C)));

extern volatile uint32_t C1FIFOCON5 __attribute__((section("sfrs"), address(0xBF88B490)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON5bits_t;
extern volatile __C1FIFOCON5bits_t C1FIFOCON5bits __asm__ ("C1FIFOCON5") __attribute__((section("sfrs"), address(0xBF88B490)));
extern volatile uint32_t C1FIFOCON5CLR __attribute__((section("sfrs"),address(0xBF88B494)));
extern volatile uint32_t C1FIFOCON5SET __attribute__((section("sfrs"),address(0xBF88B498)));
extern volatile uint32_t C1FIFOCON5INV __attribute__((section("sfrs"),address(0xBF88B49C)));

extern volatile uint32_t C1FIFOINT5 __attribute__((section("sfrs"), address(0xBF88B4A0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT5bits_t;
extern volatile __C1FIFOINT5bits_t C1FIFOINT5bits __asm__ ("C1FIFOINT5") __attribute__((section("sfrs"), address(0xBF88B4A0)));
extern volatile uint32_t C1FIFOINT5CLR __attribute__((section("sfrs"),address(0xBF88B4A4)));
extern volatile uint32_t C1FIFOINT5SET __attribute__((section("sfrs"),address(0xBF88B4A8)));
extern volatile uint32_t C1FIFOINT5INV __attribute__((section("sfrs"),address(0xBF88B4AC)));

extern volatile uint32_t C1FIFOUA5 __attribute__((section("sfrs"), address(0xBF88B4B0)));
extern volatile uint32_t C1FIFOUA5CLR __attribute__((section("sfrs"),address(0xBF88B4B4)));
extern volatile uint32_t C1FIFOUA5SET __attribute__((section("sfrs"),address(0xBF88B4B8)));
extern volatile uint32_t C1FIFOUA5INV __attribute__((section("sfrs"),address(0xBF88B4BC)));

extern volatile uint32_t C1FIFOCI5 __attribute__((section("sfrs"), address(0xBF88B4C0)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI5bits_t;
extern volatile __C1FIFOCI5bits_t C1FIFOCI5bits __asm__ ("C1FIFOCI5") __attribute__((section("sfrs"), address(0xBF88B4C0)));
extern volatile uint32_t C1FIFOCI5CLR __attribute__((section("sfrs"),address(0xBF88B4C4)));
extern volatile uint32_t C1FIFOCI5SET __attribute__((section("sfrs"),address(0xBF88B4C8)));
extern volatile uint32_t C1FIFOCI5INV __attribute__((section("sfrs"),address(0xBF88B4CC)));

extern volatile uint32_t C1FIFOCON6 __attribute__((section("sfrs"), address(0xBF88B4D0)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON6bits_t;
extern volatile __C1FIFOCON6bits_t C1FIFOCON6bits __asm__ ("C1FIFOCON6") __attribute__((section("sfrs"), address(0xBF88B4D0)));
extern volatile uint32_t C1FIFOCON6CLR __attribute__((section("sfrs"),address(0xBF88B4D4)));
extern volatile uint32_t C1FIFOCON6SET __attribute__((section("sfrs"),address(0xBF88B4D8)));
extern volatile uint32_t C1FIFOCON6INV __attribute__((section("sfrs"),address(0xBF88B4DC)));

extern volatile uint32_t C1FIFOINT6 __attribute__((section("sfrs"), address(0xBF88B4E0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT6bits_t;
extern volatile __C1FIFOINT6bits_t C1FIFOINT6bits __asm__ ("C1FIFOINT6") __attribute__((section("sfrs"), address(0xBF88B4E0)));
extern volatile uint32_t C1FIFOINT6CLR __attribute__((section("sfrs"),address(0xBF88B4E4)));
extern volatile uint32_t C1FIFOINT6SET __attribute__((section("sfrs"),address(0xBF88B4E8)));
extern volatile uint32_t C1FIFOINT6INV __attribute__((section("sfrs"),address(0xBF88B4EC)));

extern volatile uint32_t C1FIFOUA6 __attribute__((section("sfrs"), address(0xBF88B4F0)));
extern volatile uint32_t C1FIFOUA6CLR __attribute__((section("sfrs"),address(0xBF88B4F4)));
extern volatile uint32_t C1FIFOUA6SET __attribute__((section("sfrs"),address(0xBF88B4F8)));
extern volatile uint32_t C1FIFOUA6INV __attribute__((section("sfrs"),address(0xBF88B4FC)));

extern volatile uint32_t C1FIFOCI6 __attribute__((section("sfrs"), address(0xBF88B500)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI6bits_t;
extern volatile __C1FIFOCI6bits_t C1FIFOCI6bits __asm__ ("C1FIFOCI6") __attribute__((section("sfrs"), address(0xBF88B500)));
extern volatile uint32_t C1FIFOCI6CLR __attribute__((section("sfrs"),address(0xBF88B504)));
extern volatile uint32_t C1FIFOCI6SET __attribute__((section("sfrs"),address(0xBF88B508)));
extern volatile uint32_t C1FIFOCI6INV __attribute__((section("sfrs"),address(0xBF88B50C)));

extern volatile uint32_t C1FIFOCON7 __attribute__((section("sfrs"), address(0xBF88B510)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON7bits_t;
extern volatile __C1FIFOCON7bits_t C1FIFOCON7bits __asm__ ("C1FIFOCON7") __attribute__((section("sfrs"), address(0xBF88B510)));
extern volatile uint32_t C1FIFOCON7CLR __attribute__((section("sfrs"),address(0xBF88B514)));
extern volatile uint32_t C1FIFOCON7SET __attribute__((section("sfrs"),address(0xBF88B518)));
extern volatile uint32_t C1FIFOCON7INV __attribute__((section("sfrs"),address(0xBF88B51C)));

extern volatile uint32_t C1FIFOINT7 __attribute__((section("sfrs"), address(0xBF88B520)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT7bits_t;
extern volatile __C1FIFOINT7bits_t C1FIFOINT7bits __asm__ ("C1FIFOINT7") __attribute__((section("sfrs"), address(0xBF88B520)));
extern volatile uint32_t C1FIFOINT7CLR __attribute__((section("sfrs"),address(0xBF88B524)));
extern volatile uint32_t C1FIFOINT7SET __attribute__((section("sfrs"),address(0xBF88B528)));
extern volatile uint32_t C1FIFOINT7INV __attribute__((section("sfrs"),address(0xBF88B52C)));

extern volatile uint32_t C1FIFOUA7 __attribute__((section("sfrs"), address(0xBF88B530)));
extern volatile uint32_t C1FIFOUA7CLR __attribute__((section("sfrs"),address(0xBF88B534)));
extern volatile uint32_t C1FIFOUA7SET __attribute__((section("sfrs"),address(0xBF88B538)));
extern volatile uint32_t C1FIFOUA7INV __attribute__((section("sfrs"),address(0xBF88B53C)));

extern volatile uint32_t C1FIFOCI7 __attribute__((section("sfrs"), address(0xBF88B540)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI7bits_t;
extern volatile __C1FIFOCI7bits_t C1FIFOCI7bits __asm__ ("C1FIFOCI7") __attribute__((section("sfrs"), address(0xBF88B540)));
extern volatile uint32_t C1FIFOCI7CLR __attribute__((section("sfrs"),address(0xBF88B544)));
extern volatile uint32_t C1FIFOCI7SET __attribute__((section("sfrs"),address(0xBF88B548)));
extern volatile uint32_t C1FIFOCI7INV __attribute__((section("sfrs"),address(0xBF88B54C)));

extern volatile uint32_t C1FIFOCON8 __attribute__((section("sfrs"), address(0xBF88B550)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON8bits_t;
extern volatile __C1FIFOCON8bits_t C1FIFOCON8bits __asm__ ("C1FIFOCON8") __attribute__((section("sfrs"), address(0xBF88B550)));
extern volatile uint32_t C1FIFOCON8CLR __attribute__((section("sfrs"),address(0xBF88B554)));
extern volatile uint32_t C1FIFOCON8SET __attribute__((section("sfrs"),address(0xBF88B558)));
extern volatile uint32_t C1FIFOCON8INV __attribute__((section("sfrs"),address(0xBF88B55C)));

extern volatile uint32_t C1FIFOINT8 __attribute__((section("sfrs"), address(0xBF88B560)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT8bits_t;
extern volatile __C1FIFOINT8bits_t C1FIFOINT8bits __asm__ ("C1FIFOINT8") __attribute__((section("sfrs"), address(0xBF88B560)));
extern volatile uint32_t C1FIFOINT8CLR __attribute__((section("sfrs"),address(0xBF88B564)));
extern volatile uint32_t C1FIFOINT8SET __attribute__((section("sfrs"),address(0xBF88B568)));
extern volatile uint32_t C1FIFOINT8INV __attribute__((section("sfrs"),address(0xBF88B56C)));

extern volatile uint32_t C1FIFOUA8 __attribute__((section("sfrs"), address(0xBF88B570)));
extern volatile uint32_t C1FIFOUA8CLR __attribute__((section("sfrs"),address(0xBF88B574)));
extern volatile uint32_t C1FIFOUA8SET __attribute__((section("sfrs"),address(0xBF88B578)));
extern volatile uint32_t C1FIFOUA8INV __attribute__((section("sfrs"),address(0xBF88B57C)));

extern volatile uint32_t C1FIFOCI8 __attribute__((section("sfrs"), address(0xBF88B580)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI8bits_t;
extern volatile __C1FIFOCI8bits_t C1FIFOCI8bits __asm__ ("C1FIFOCI8") __attribute__((section("sfrs"), address(0xBF88B580)));
extern volatile uint32_t C1FIFOCI8CLR __attribute__((section("sfrs"),address(0xBF88B584)));
extern volatile uint32_t C1FIFOCI8SET __attribute__((section("sfrs"),address(0xBF88B588)));
extern volatile uint32_t C1FIFOCI8INV __attribute__((section("sfrs"),address(0xBF88B58C)));

extern volatile uint32_t C1FIFOCON9 __attribute__((section("sfrs"), address(0xBF88B590)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON9bits_t;
extern volatile __C1FIFOCON9bits_t C1FIFOCON9bits __asm__ ("C1FIFOCON9") __attribute__((section("sfrs"), address(0xBF88B590)));
extern volatile uint32_t C1FIFOCON9CLR __attribute__((section("sfrs"),address(0xBF88B594)));
extern volatile uint32_t C1FIFOCON9SET __attribute__((section("sfrs"),address(0xBF88B598)));
extern volatile uint32_t C1FIFOCON9INV __attribute__((section("sfrs"),address(0xBF88B59C)));

extern volatile uint32_t C1FIFOINT9 __attribute__((section("sfrs"), address(0xBF88B5A0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT9bits_t;
extern volatile __C1FIFOINT9bits_t C1FIFOINT9bits __asm__ ("C1FIFOINT9") __attribute__((section("sfrs"), address(0xBF88B5A0)));
extern volatile uint32_t C1FIFOINT9CLR __attribute__((section("sfrs"),address(0xBF88B5A4)));
extern volatile uint32_t C1FIFOINT9SET __attribute__((section("sfrs"),address(0xBF88B5A8)));
extern volatile uint32_t C1FIFOINT9INV __attribute__((section("sfrs"),address(0xBF88B5AC)));

extern volatile uint32_t C1FIFOUA9 __attribute__((section("sfrs"), address(0xBF88B5B0)));
extern volatile uint32_t C1FIFOUA9CLR __attribute__((section("sfrs"),address(0xBF88B5B4)));
extern volatile uint32_t C1FIFOUA9SET __attribute__((section("sfrs"),address(0xBF88B5B8)));
extern volatile uint32_t C1FIFOUA9INV __attribute__((section("sfrs"),address(0xBF88B5BC)));

extern volatile uint32_t C1FIFOCI9 __attribute__((section("sfrs"), address(0xBF88B5C0)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI9bits_t;
extern volatile __C1FIFOCI9bits_t C1FIFOCI9bits __asm__ ("C1FIFOCI9") __attribute__((section("sfrs"), address(0xBF88B5C0)));
extern volatile uint32_t C1FIFOCI9CLR __attribute__((section("sfrs"),address(0xBF88B5C4)));
extern volatile uint32_t C1FIFOCI9SET __attribute__((section("sfrs"),address(0xBF88B5C8)));
extern volatile uint32_t C1FIFOCI9INV __attribute__((section("sfrs"),address(0xBF88B5CC)));

extern volatile uint32_t C1FIFOCON10 __attribute__((section("sfrs"), address(0xBF88B5D0)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON10bits_t;
extern volatile __C1FIFOCON10bits_t C1FIFOCON10bits __asm__ ("C1FIFOCON10") __attribute__((section("sfrs"), address(0xBF88B5D0)));
extern volatile uint32_t C1FIFOCON10CLR __attribute__((section("sfrs"),address(0xBF88B5D4)));
extern volatile uint32_t C1FIFOCON10SET __attribute__((section("sfrs"),address(0xBF88B5D8)));
extern volatile uint32_t C1FIFOCON10INV __attribute__((section("sfrs"),address(0xBF88B5DC)));

extern volatile uint32_t C1FIFOINT10 __attribute__((section("sfrs"), address(0xBF88B5E0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT10bits_t;
extern volatile __C1FIFOINT10bits_t C1FIFOINT10bits __asm__ ("C1FIFOINT10") __attribute__((section("sfrs"), address(0xBF88B5E0)));
extern volatile uint32_t C1FIFOINT10CLR __attribute__((section("sfrs"),address(0xBF88B5E4)));
extern volatile uint32_t C1FIFOINT10SET __attribute__((section("sfrs"),address(0xBF88B5E8)));
extern volatile uint32_t C1FIFOINT10INV __attribute__((section("sfrs"),address(0xBF88B5EC)));

extern volatile uint32_t C1FIFOUA10 __attribute__((section("sfrs"), address(0xBF88B5F0)));
extern volatile uint32_t C1FIFOUA10CLR __attribute__((section("sfrs"),address(0xBF88B5F4)));
extern volatile uint32_t C1FIFOUA10SET __attribute__((section("sfrs"),address(0xBF88B5F8)));
extern volatile uint32_t C1FIFOUA10INV __attribute__((section("sfrs"),address(0xBF88B5FC)));

extern volatile uint32_t C1FIFOCI10 __attribute__((section("sfrs"), address(0xBF88B600)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI10bits_t;
extern volatile __C1FIFOCI10bits_t C1FIFOCI10bits __asm__ ("C1FIFOCI10") __attribute__((section("sfrs"), address(0xBF88B600)));
extern volatile uint32_t C1FIFOCI10CLR __attribute__((section("sfrs"),address(0xBF88B604)));
extern volatile uint32_t C1FIFOCI10SET __attribute__((section("sfrs"),address(0xBF88B608)));
extern volatile uint32_t C1FIFOCI10INV __attribute__((section("sfrs"),address(0xBF88B60C)));

extern volatile uint32_t C1FIFOCON11 __attribute__((section("sfrs"), address(0xBF88B610)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON11bits_t;
extern volatile __C1FIFOCON11bits_t C1FIFOCON11bits __asm__ ("C1FIFOCON11") __attribute__((section("sfrs"), address(0xBF88B610)));
extern volatile uint32_t C1FIFOCON11CLR __attribute__((section("sfrs"),address(0xBF88B614)));
extern volatile uint32_t C1FIFOCON11SET __attribute__((section("sfrs"),address(0xBF88B618)));
extern volatile uint32_t C1FIFOCON11INV __attribute__((section("sfrs"),address(0xBF88B61C)));

extern volatile uint32_t C1FIFOINT11 __attribute__((section("sfrs"), address(0xBF88B620)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT11bits_t;
extern volatile __C1FIFOINT11bits_t C1FIFOINT11bits __asm__ ("C1FIFOINT11") __attribute__((section("sfrs"), address(0xBF88B620)));
extern volatile uint32_t C1FIFOINT11CLR __attribute__((section("sfrs"),address(0xBF88B624)));
extern volatile uint32_t C1FIFOINT11SET __attribute__((section("sfrs"),address(0xBF88B628)));
extern volatile uint32_t C1FIFOINT11INV __attribute__((section("sfrs"),address(0xBF88B62C)));

extern volatile uint32_t C1FIFOUA11 __attribute__((section("sfrs"), address(0xBF88B630)));
extern volatile uint32_t C1FIFOUA11CLR __attribute__((section("sfrs"),address(0xBF88B634)));
extern volatile uint32_t C1FIFOUA11SET __attribute__((section("sfrs"),address(0xBF88B638)));
extern volatile uint32_t C1FIFOUA11INV __attribute__((section("sfrs"),address(0xBF88B63C)));

extern volatile uint32_t C1FIFOCI11 __attribute__((section("sfrs"), address(0xBF88B640)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI11bits_t;
extern volatile __C1FIFOCI11bits_t C1FIFOCI11bits __asm__ ("C1FIFOCI11") __attribute__((section("sfrs"), address(0xBF88B640)));
extern volatile uint32_t C1FIFOCI11CLR __attribute__((section("sfrs"),address(0xBF88B644)));
extern volatile uint32_t C1FIFOCI11SET __attribute__((section("sfrs"),address(0xBF88B648)));
extern volatile uint32_t C1FIFOCI11INV __attribute__((section("sfrs"),address(0xBF88B64C)));

extern volatile uint32_t C1FIFOCON12 __attribute__((section("sfrs"), address(0xBF88B650)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON12bits_t;
extern volatile __C1FIFOCON12bits_t C1FIFOCON12bits __asm__ ("C1FIFOCON12") __attribute__((section("sfrs"), address(0xBF88B650)));
extern volatile uint32_t C1FIFOCON12CLR __attribute__((section("sfrs"),address(0xBF88B654)));
extern volatile uint32_t C1FIFOCON12SET __attribute__((section("sfrs"),address(0xBF88B658)));
extern volatile uint32_t C1FIFOCON12INV __attribute__((section("sfrs"),address(0xBF88B65C)));

extern volatile uint32_t C1FIFOINT12 __attribute__((section("sfrs"), address(0xBF88B660)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT12bits_t;
extern volatile __C1FIFOINT12bits_t C1FIFOINT12bits __asm__ ("C1FIFOINT12") __attribute__((section("sfrs"), address(0xBF88B660)));
extern volatile uint32_t C1FIFOINT12CLR __attribute__((section("sfrs"),address(0xBF88B664)));
extern volatile uint32_t C1FIFOINT12SET __attribute__((section("sfrs"),address(0xBF88B668)));
extern volatile uint32_t C1FIFOINT12INV __attribute__((section("sfrs"),address(0xBF88B66C)));

extern volatile uint32_t C1FIFOUA12 __attribute__((section("sfrs"), address(0xBF88B670)));
extern volatile uint32_t C1FIFOUA12CLR __attribute__((section("sfrs"),address(0xBF88B674)));
extern volatile uint32_t C1FIFOUA12SET __attribute__((section("sfrs"),address(0xBF88B678)));
extern volatile uint32_t C1FIFOUA12INV __attribute__((section("sfrs"),address(0xBF88B67C)));

extern volatile uint32_t C1FIFOCI12 __attribute__((section("sfrs"), address(0xBF88B680)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI12bits_t;
extern volatile __C1FIFOCI12bits_t C1FIFOCI12bits __asm__ ("C1FIFOCI12") __attribute__((section("sfrs"), address(0xBF88B680)));
extern volatile uint32_t C1FIFOCI12CLR __attribute__((section("sfrs"),address(0xBF88B684)));
extern volatile uint32_t C1FIFOCI12SET __attribute__((section("sfrs"),address(0xBF88B688)));
extern volatile uint32_t C1FIFOCI12INV __attribute__((section("sfrs"),address(0xBF88B68C)));

extern volatile uint32_t C1FIFOCON13 __attribute__((section("sfrs"), address(0xBF88B690)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON13bits_t;
extern volatile __C1FIFOCON13bits_t C1FIFOCON13bits __asm__ ("C1FIFOCON13") __attribute__((section("sfrs"), address(0xBF88B690)));
extern volatile uint32_t C1FIFOCON13CLR __attribute__((section("sfrs"),address(0xBF88B694)));
extern volatile uint32_t C1FIFOCON13SET __attribute__((section("sfrs"),address(0xBF88B698)));
extern volatile uint32_t C1FIFOCON13INV __attribute__((section("sfrs"),address(0xBF88B69C)));

extern volatile uint32_t C1FIFOINT13 __attribute__((section("sfrs"), address(0xBF88B6A0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT13bits_t;
extern volatile __C1FIFOINT13bits_t C1FIFOINT13bits __asm__ ("C1FIFOINT13") __attribute__((section("sfrs"), address(0xBF88B6A0)));
extern volatile uint32_t C1FIFOINT13CLR __attribute__((section("sfrs"),address(0xBF88B6A4)));
extern volatile uint32_t C1FIFOINT13SET __attribute__((section("sfrs"),address(0xBF88B6A8)));
extern volatile uint32_t C1FIFOINT13INV __attribute__((section("sfrs"),address(0xBF88B6AC)));

extern volatile uint32_t C1FIFOUA13 __attribute__((section("sfrs"), address(0xBF88B6B0)));
extern volatile uint32_t C1FIFOUA13CLR __attribute__((section("sfrs"),address(0xBF88B6B4)));
extern volatile uint32_t C1FIFOUA13SET __attribute__((section("sfrs"),address(0xBF88B6B8)));
extern volatile uint32_t C1FIFOUA13INV __attribute__((section("sfrs"),address(0xBF88B6BC)));

extern volatile uint32_t C1FIFOCI13 __attribute__((section("sfrs"), address(0xBF88B6C0)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI13bits_t;
extern volatile __C1FIFOCI13bits_t C1FIFOCI13bits __asm__ ("C1FIFOCI13") __attribute__((section("sfrs"), address(0xBF88B6C0)));
extern volatile uint32_t C1FIFOCI13CLR __attribute__((section("sfrs"),address(0xBF88B6C4)));
extern volatile uint32_t C1FIFOCI13SET __attribute__((section("sfrs"),address(0xBF88B6C8)));
extern volatile uint32_t C1FIFOCI13INV __attribute__((section("sfrs"),address(0xBF88B6CC)));

extern volatile uint32_t C1FIFOCON14 __attribute__((section("sfrs"), address(0xBF88B6D0)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON14bits_t;
extern volatile __C1FIFOCON14bits_t C1FIFOCON14bits __asm__ ("C1FIFOCON14") __attribute__((section("sfrs"), address(0xBF88B6D0)));
extern volatile uint32_t C1FIFOCON14CLR __attribute__((section("sfrs"),address(0xBF88B6D4)));
extern volatile uint32_t C1FIFOCON14SET __attribute__((section("sfrs"),address(0xBF88B6D8)));
extern volatile uint32_t C1FIFOCON14INV __attribute__((section("sfrs"),address(0xBF88B6DC)));

extern volatile uint32_t C1FIFOINT14 __attribute__((section("sfrs"), address(0xBF88B6E0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT14bits_t;
extern volatile __C1FIFOINT14bits_t C1FIFOINT14bits __asm__ ("C1FIFOINT14") __attribute__((section("sfrs"), address(0xBF88B6E0)));
extern volatile uint32_t C1FIFOINT14CLR __attribute__((section("sfrs"),address(0xBF88B6E4)));
extern volatile uint32_t C1FIFOINT14SET __attribute__((section("sfrs"),address(0xBF88B6E8)));
extern volatile uint32_t C1FIFOINT14INV __attribute__((section("sfrs"),address(0xBF88B6EC)));

extern volatile uint32_t C1FIFOUA14 __attribute__((section("sfrs"), address(0xBF88B6F0)));
extern volatile uint32_t C1FIFOUA14CLR __attribute__((section("sfrs"),address(0xBF88B6F4)));
extern volatile uint32_t C1FIFOUA14SET __attribute__((section("sfrs"),address(0xBF88B6F8)));
extern volatile uint32_t C1FIFOUA14INV __attribute__((section("sfrs"),address(0xBF88B6FC)));

extern volatile uint32_t C1FIFOCI14 __attribute__((section("sfrs"), address(0xBF88B700)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI14bits_t;
extern volatile __C1FIFOCI14bits_t C1FIFOCI14bits __asm__ ("C1FIFOCI14") __attribute__((section("sfrs"), address(0xBF88B700)));
extern volatile uint32_t C1FIFOCI14CLR __attribute__((section("sfrs"),address(0xBF88B704)));
extern volatile uint32_t C1FIFOCI14SET __attribute__((section("sfrs"),address(0xBF88B708)));
extern volatile uint32_t C1FIFOCI14INV __attribute__((section("sfrs"),address(0xBF88B70C)));

extern volatile uint32_t C1FIFOCON15 __attribute__((section("sfrs"), address(0xBF88B710)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON15bits_t;
extern volatile __C1FIFOCON15bits_t C1FIFOCON15bits __asm__ ("C1FIFOCON15") __attribute__((section("sfrs"), address(0xBF88B710)));
extern volatile uint32_t C1FIFOCON15CLR __attribute__((section("sfrs"),address(0xBF88B714)));
extern volatile uint32_t C1FIFOCON15SET __attribute__((section("sfrs"),address(0xBF88B718)));
extern volatile uint32_t C1FIFOCON15INV __attribute__((section("sfrs"),address(0xBF88B71C)));

extern volatile uint32_t C1FIFOINT15 __attribute__((section("sfrs"), address(0xBF88B720)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT15bits_t;
extern volatile __C1FIFOINT15bits_t C1FIFOINT15bits __asm__ ("C1FIFOINT15") __attribute__((section("sfrs"), address(0xBF88B720)));
extern volatile uint32_t C1FIFOINT15CLR __attribute__((section("sfrs"),address(0xBF88B724)));
extern volatile uint32_t C1FIFOINT15SET __attribute__((section("sfrs"),address(0xBF88B728)));
extern volatile uint32_t C1FIFOINT15INV __attribute__((section("sfrs"),address(0xBF88B72C)));

extern volatile uint32_t C1FIFOUA15 __attribute__((section("sfrs"), address(0xBF88B730)));
extern volatile uint32_t C1FIFOUA15CLR __attribute__((section("sfrs"),address(0xBF88B734)));
extern volatile uint32_t C1FIFOUA15SET __attribute__((section("sfrs"),address(0xBF88B738)));
extern volatile uint32_t C1FIFOUA15INV __attribute__((section("sfrs"),address(0xBF88B73C)));

extern volatile uint32_t C1FIFOCI15 __attribute__((section("sfrs"), address(0xBF88B740)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI15bits_t;
extern volatile __C1FIFOCI15bits_t C1FIFOCI15bits __asm__ ("C1FIFOCI15") __attribute__((section("sfrs"), address(0xBF88B740)));
extern volatile uint32_t C1FIFOCI15CLR __attribute__((section("sfrs"),address(0xBF88B744)));
extern volatile uint32_t C1FIFOCI15SET __attribute__((section("sfrs"),address(0xBF88B748)));
extern volatile uint32_t C1FIFOCI15INV __attribute__((section("sfrs"),address(0xBF88B74C)));

extern volatile uint32_t C1FIFOCON16 __attribute__((section("sfrs"), address(0xBF88B750)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON16bits_t;
extern volatile __C1FIFOCON16bits_t C1FIFOCON16bits __asm__ ("C1FIFOCON16") __attribute__((section("sfrs"), address(0xBF88B750)));
extern volatile uint32_t C1FIFOCON16CLR __attribute__((section("sfrs"),address(0xBF88B754)));
extern volatile uint32_t C1FIFOCON16SET __attribute__((section("sfrs"),address(0xBF88B758)));
extern volatile uint32_t C1FIFOCON16INV __attribute__((section("sfrs"),address(0xBF88B75C)));

extern volatile uint32_t C1FIFOINT16 __attribute__((section("sfrs"), address(0xBF88B760)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT16bits_t;
extern volatile __C1FIFOINT16bits_t C1FIFOINT16bits __asm__ ("C1FIFOINT16") __attribute__((section("sfrs"), address(0xBF88B760)));
extern volatile uint32_t C1FIFOINT16CLR __attribute__((section("sfrs"),address(0xBF88B764)));
extern volatile uint32_t C1FIFOINT16SET __attribute__((section("sfrs"),address(0xBF88B768)));
extern volatile uint32_t C1FIFOINT16INV __attribute__((section("sfrs"),address(0xBF88B76C)));

extern volatile uint32_t C1FIFOUA16 __attribute__((section("sfrs"), address(0xBF88B770)));
extern volatile uint32_t C1FIFOUA16CLR __attribute__((section("sfrs"),address(0xBF88B774)));
extern volatile uint32_t C1FIFOUA16SET __attribute__((section("sfrs"),address(0xBF88B778)));
extern volatile uint32_t C1FIFOUA16INV __attribute__((section("sfrs"),address(0xBF88B77C)));

extern volatile uint32_t C1FIFOCI16 __attribute__((section("sfrs"), address(0xBF88B780)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI16bits_t;
extern volatile __C1FIFOCI16bits_t C1FIFOCI16bits __asm__ ("C1FIFOCI16") __attribute__((section("sfrs"), address(0xBF88B780)));
extern volatile uint32_t C1FIFOCI16CLR __attribute__((section("sfrs"),address(0xBF88B784)));
extern volatile uint32_t C1FIFOCI16SET __attribute__((section("sfrs"),address(0xBF88B788)));
extern volatile uint32_t C1FIFOCI16INV __attribute__((section("sfrs"),address(0xBF88B78C)));

extern volatile uint32_t C1FIFOCON17 __attribute__((section("sfrs"), address(0xBF88B790)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON17bits_t;
extern volatile __C1FIFOCON17bits_t C1FIFOCON17bits __asm__ ("C1FIFOCON17") __attribute__((section("sfrs"), address(0xBF88B790)));
extern volatile uint32_t C1FIFOCON17CLR __attribute__((section("sfrs"),address(0xBF88B794)));
extern volatile uint32_t C1FIFOCON17SET __attribute__((section("sfrs"),address(0xBF88B798)));
extern volatile uint32_t C1FIFOCON17INV __attribute__((section("sfrs"),address(0xBF88B79C)));

extern volatile uint32_t C1FIFOINT17 __attribute__((section("sfrs"), address(0xBF88B7A0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT17bits_t;
extern volatile __C1FIFOINT17bits_t C1FIFOINT17bits __asm__ ("C1FIFOINT17") __attribute__((section("sfrs"), address(0xBF88B7A0)));
extern volatile uint32_t C1FIFOINT17CLR __attribute__((section("sfrs"),address(0xBF88B7A4)));
extern volatile uint32_t C1FIFOINT17SET __attribute__((section("sfrs"),address(0xBF88B7A8)));
extern volatile uint32_t C1FIFOINT17INV __attribute__((section("sfrs"),address(0xBF88B7AC)));

extern volatile uint32_t C1FIFOUA17 __attribute__((section("sfrs"), address(0xBF88B7B0)));
extern volatile uint32_t C1FIFOUA17CLR __attribute__((section("sfrs"),address(0xBF88B7B4)));
extern volatile uint32_t C1FIFOUA17SET __attribute__((section("sfrs"),address(0xBF88B7B8)));
extern volatile uint32_t C1FIFOUA17INV __attribute__((section("sfrs"),address(0xBF88B7BC)));

extern volatile uint32_t C1FIFOCI17 __attribute__((section("sfrs"), address(0xBF88B7C0)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI17bits_t;
extern volatile __C1FIFOCI17bits_t C1FIFOCI17bits __asm__ ("C1FIFOCI17") __attribute__((section("sfrs"), address(0xBF88B7C0)));
extern volatile uint32_t C1FIFOCI17CLR __attribute__((section("sfrs"),address(0xBF88B7C4)));
extern volatile uint32_t C1FIFOCI17SET __attribute__((section("sfrs"),address(0xBF88B7C8)));
extern volatile uint32_t C1FIFOCI17INV __attribute__((section("sfrs"),address(0xBF88B7CC)));

extern volatile uint32_t C1FIFOCON18 __attribute__((section("sfrs"), address(0xBF88B7D0)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON18bits_t;
extern volatile __C1FIFOCON18bits_t C1FIFOCON18bits __asm__ ("C1FIFOCON18") __attribute__((section("sfrs"), address(0xBF88B7D0)));
extern volatile uint32_t C1FIFOCON18CLR __attribute__((section("sfrs"),address(0xBF88B7D4)));
extern volatile uint32_t C1FIFOCON18SET __attribute__((section("sfrs"),address(0xBF88B7D8)));
extern volatile uint32_t C1FIFOCON18INV __attribute__((section("sfrs"),address(0xBF88B7DC)));

extern volatile uint32_t C1FIFOINT18 __attribute__((section("sfrs"), address(0xBF88B7E0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT18bits_t;
extern volatile __C1FIFOINT18bits_t C1FIFOINT18bits __asm__ ("C1FIFOINT18") __attribute__((section("sfrs"), address(0xBF88B7E0)));
extern volatile uint32_t C1FIFOINT18CLR __attribute__((section("sfrs"),address(0xBF88B7E4)));
extern volatile uint32_t C1FIFOINT18SET __attribute__((section("sfrs"),address(0xBF88B7E8)));
extern volatile uint32_t C1FIFOINT18INV __attribute__((section("sfrs"),address(0xBF88B7EC)));

extern volatile uint32_t C1FIFOUA18 __attribute__((section("sfrs"), address(0xBF88B7F0)));
extern volatile uint32_t C1FIFOUA18CLR __attribute__((section("sfrs"),address(0xBF88B7F4)));
extern volatile uint32_t C1FIFOUA18SET __attribute__((section("sfrs"),address(0xBF88B7F8)));
extern volatile uint32_t C1FIFOUA18INV __attribute__((section("sfrs"),address(0xBF88B7FC)));

extern volatile uint32_t C1FIFOCI18 __attribute__((section("sfrs"), address(0xBF88B800)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI18bits_t;
extern volatile __C1FIFOCI18bits_t C1FIFOCI18bits __asm__ ("C1FIFOCI18") __attribute__((section("sfrs"), address(0xBF88B800)));
extern volatile uint32_t C1FIFOCI18CLR __attribute__((section("sfrs"),address(0xBF88B804)));
extern volatile uint32_t C1FIFOCI18SET __attribute__((section("sfrs"),address(0xBF88B808)));
extern volatile uint32_t C1FIFOCI18INV __attribute__((section("sfrs"),address(0xBF88B80C)));

extern volatile uint32_t C1FIFOCON19 __attribute__((section("sfrs"), address(0xBF88B810)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON19bits_t;
extern volatile __C1FIFOCON19bits_t C1FIFOCON19bits __asm__ ("C1FIFOCON19") __attribute__((section("sfrs"), address(0xBF88B810)));
extern volatile uint32_t C1FIFOCON19CLR __attribute__((section("sfrs"),address(0xBF88B814)));
extern volatile uint32_t C1FIFOCON19SET __attribute__((section("sfrs"),address(0xBF88B818)));
extern volatile uint32_t C1FIFOCON19INV __attribute__((section("sfrs"),address(0xBF88B81C)));

extern volatile uint32_t C1FIFOINT19 __attribute__((section("sfrs"), address(0xBF88B820)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT19bits_t;
extern volatile __C1FIFOINT19bits_t C1FIFOINT19bits __asm__ ("C1FIFOINT19") __attribute__((section("sfrs"), address(0xBF88B820)));
extern volatile uint32_t C1FIFOINT19CLR __attribute__((section("sfrs"),address(0xBF88B824)));
extern volatile uint32_t C1FIFOINT19SET __attribute__((section("sfrs"),address(0xBF88B828)));
extern volatile uint32_t C1FIFOINT19INV __attribute__((section("sfrs"),address(0xBF88B82C)));

extern volatile uint32_t C1FIFOUA19 __attribute__((section("sfrs"), address(0xBF88B830)));
extern volatile uint32_t C1FIFOUA19CLR __attribute__((section("sfrs"),address(0xBF88B834)));
extern volatile uint32_t C1FIFOUA19SET __attribute__((section("sfrs"),address(0xBF88B838)));
extern volatile uint32_t C1FIFOUA19INV __attribute__((section("sfrs"),address(0xBF88B83C)));

extern volatile uint32_t C1FIFOCI19 __attribute__((section("sfrs"), address(0xBF88B840)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI19bits_t;
extern volatile __C1FIFOCI19bits_t C1FIFOCI19bits __asm__ ("C1FIFOCI19") __attribute__((section("sfrs"), address(0xBF88B840)));
extern volatile uint32_t C1FIFOCI19CLR __attribute__((section("sfrs"),address(0xBF88B844)));
extern volatile uint32_t C1FIFOCI19SET __attribute__((section("sfrs"),address(0xBF88B848)));
extern volatile uint32_t C1FIFOCI19INV __attribute__((section("sfrs"),address(0xBF88B84C)));

extern volatile uint32_t C1FIFOCON20 __attribute__((section("sfrs"), address(0xBF88B850)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON20bits_t;
extern volatile __C1FIFOCON20bits_t C1FIFOCON20bits __asm__ ("C1FIFOCON20") __attribute__((section("sfrs"), address(0xBF88B850)));
extern volatile uint32_t C1FIFOCON20CLR __attribute__((section("sfrs"),address(0xBF88B854)));
extern volatile uint32_t C1FIFOCON20SET __attribute__((section("sfrs"),address(0xBF88B858)));
extern volatile uint32_t C1FIFOCON20INV __attribute__((section("sfrs"),address(0xBF88B85C)));

extern volatile uint32_t C1FIFOINT20 __attribute__((section("sfrs"), address(0xBF88B860)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT20bits_t;
extern volatile __C1FIFOINT20bits_t C1FIFOINT20bits __asm__ ("C1FIFOINT20") __attribute__((section("sfrs"), address(0xBF88B860)));
extern volatile uint32_t C1FIFOINT20CLR __attribute__((section("sfrs"),address(0xBF88B864)));
extern volatile uint32_t C1FIFOINT20SET __attribute__((section("sfrs"),address(0xBF88B868)));
extern volatile uint32_t C1FIFOINT20INV __attribute__((section("sfrs"),address(0xBF88B86C)));

extern volatile uint32_t C1FIFOUA20 __attribute__((section("sfrs"), address(0xBF88B870)));
extern volatile uint32_t C1FIFOUA20CLR __attribute__((section("sfrs"),address(0xBF88B874)));
extern volatile uint32_t C1FIFOUA20SET __attribute__((section("sfrs"),address(0xBF88B878)));
extern volatile uint32_t C1FIFOUA20INV __attribute__((section("sfrs"),address(0xBF88B87C)));

extern volatile uint32_t C1FIFOCI20 __attribute__((section("sfrs"), address(0xBF88B880)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI20bits_t;
extern volatile __C1FIFOCI20bits_t C1FIFOCI20bits __asm__ ("C1FIFOCI20") __attribute__((section("sfrs"), address(0xBF88B880)));
extern volatile uint32_t C1FIFOCI20CLR __attribute__((section("sfrs"),address(0xBF88B884)));
extern volatile uint32_t C1FIFOCI20SET __attribute__((section("sfrs"),address(0xBF88B888)));
extern volatile uint32_t C1FIFOCI20INV __attribute__((section("sfrs"),address(0xBF88B88C)));

extern volatile uint32_t C1FIFOCON21 __attribute__((section("sfrs"), address(0xBF88B890)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON21bits_t;
extern volatile __C1FIFOCON21bits_t C1FIFOCON21bits __asm__ ("C1FIFOCON21") __attribute__((section("sfrs"), address(0xBF88B890)));
extern volatile uint32_t C1FIFOCON21CLR __attribute__((section("sfrs"),address(0xBF88B894)));
extern volatile uint32_t C1FIFOCON21SET __attribute__((section("sfrs"),address(0xBF88B898)));
extern volatile uint32_t C1FIFOCON21INV __attribute__((section("sfrs"),address(0xBF88B89C)));

extern volatile uint32_t C1FIFOINT21 __attribute__((section("sfrs"), address(0xBF88B8A0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT21bits_t;
extern volatile __C1FIFOINT21bits_t C1FIFOINT21bits __asm__ ("C1FIFOINT21") __attribute__((section("sfrs"), address(0xBF88B8A0)));
extern volatile uint32_t C1FIFOINT21CLR __attribute__((section("sfrs"),address(0xBF88B8A4)));
extern volatile uint32_t C1FIFOINT21SET __attribute__((section("sfrs"),address(0xBF88B8A8)));
extern volatile uint32_t C1FIFOINT21INV __attribute__((section("sfrs"),address(0xBF88B8AC)));

extern volatile uint32_t C1FIFOUA21 __attribute__((section("sfrs"), address(0xBF88B8B0)));
extern volatile uint32_t C1FIFOUA21CLR __attribute__((section("sfrs"),address(0xBF88B8B4)));
extern volatile uint32_t C1FIFOUA21SET __attribute__((section("sfrs"),address(0xBF88B8B8)));
extern volatile uint32_t C1FIFOUA21INV __attribute__((section("sfrs"),address(0xBF88B8BC)));

extern volatile uint32_t C1FIFOCI21 __attribute__((section("sfrs"), address(0xBF88B8C0)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI21bits_t;
extern volatile __C1FIFOCI21bits_t C1FIFOCI21bits __asm__ ("C1FIFOCI21") __attribute__((section("sfrs"), address(0xBF88B8C0)));
extern volatile uint32_t C1FIFOCI21CLR __attribute__((section("sfrs"),address(0xBF88B8C4)));
extern volatile uint32_t C1FIFOCI21SET __attribute__((section("sfrs"),address(0xBF88B8C8)));
extern volatile uint32_t C1FIFOCI21INV __attribute__((section("sfrs"),address(0xBF88B8CC)));

extern volatile uint32_t C1FIFOCON22 __attribute__((section("sfrs"), address(0xBF88B8D0)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON22bits_t;
extern volatile __C1FIFOCON22bits_t C1FIFOCON22bits __asm__ ("C1FIFOCON22") __attribute__((section("sfrs"), address(0xBF88B8D0)));
extern volatile uint32_t C1FIFOCON22CLR __attribute__((section("sfrs"),address(0xBF88B8D4)));
extern volatile uint32_t C1FIFOCON22SET __attribute__((section("sfrs"),address(0xBF88B8D8)));
extern volatile uint32_t C1FIFOCON22INV __attribute__((section("sfrs"),address(0xBF88B8DC)));

extern volatile uint32_t C1FIFOINT22 __attribute__((section("sfrs"), address(0xBF88B8E0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT22bits_t;
extern volatile __C1FIFOINT22bits_t C1FIFOINT22bits __asm__ ("C1FIFOINT22") __attribute__((section("sfrs"), address(0xBF88B8E0)));
extern volatile uint32_t C1FIFOINT22CLR __attribute__((section("sfrs"),address(0xBF88B8E4)));
extern volatile uint32_t C1FIFOINT22SET __attribute__((section("sfrs"),address(0xBF88B8E8)));
extern volatile uint32_t C1FIFOINT22INV __attribute__((section("sfrs"),address(0xBF88B8EC)));

extern volatile uint32_t C1FIFOUA22 __attribute__((section("sfrs"), address(0xBF88B8F0)));
extern volatile uint32_t C1FIFOUA22CLR __attribute__((section("sfrs"),address(0xBF88B8F4)));
extern volatile uint32_t C1FIFOUA22SET __attribute__((section("sfrs"),address(0xBF88B8F8)));
extern volatile uint32_t C1FIFOUA22INV __attribute__((section("sfrs"),address(0xBF88B8FC)));

extern volatile uint32_t C1FIFOCI22 __attribute__((section("sfrs"), address(0xBF88B900)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI22bits_t;
extern volatile __C1FIFOCI22bits_t C1FIFOCI22bits __asm__ ("C1FIFOCI22") __attribute__((section("sfrs"), address(0xBF88B900)));
extern volatile uint32_t C1FIFOCI22CLR __attribute__((section("sfrs"),address(0xBF88B904)));
extern volatile uint32_t C1FIFOCI22SET __attribute__((section("sfrs"),address(0xBF88B908)));
extern volatile uint32_t C1FIFOCI22INV __attribute__((section("sfrs"),address(0xBF88B90C)));

extern volatile uint32_t C1FIFOCON23 __attribute__((section("sfrs"), address(0xBF88B910)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON23bits_t;
extern volatile __C1FIFOCON23bits_t C1FIFOCON23bits __asm__ ("C1FIFOCON23") __attribute__((section("sfrs"), address(0xBF88B910)));
extern volatile uint32_t C1FIFOCON23CLR __attribute__((section("sfrs"),address(0xBF88B914)));
extern volatile uint32_t C1FIFOCON23SET __attribute__((section("sfrs"),address(0xBF88B918)));
extern volatile uint32_t C1FIFOCON23INV __attribute__((section("sfrs"),address(0xBF88B91C)));

extern volatile uint32_t C1FIFOINT23 __attribute__((section("sfrs"), address(0xBF88B920)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT23bits_t;
extern volatile __C1FIFOINT23bits_t C1FIFOINT23bits __asm__ ("C1FIFOINT23") __attribute__((section("sfrs"), address(0xBF88B920)));
extern volatile uint32_t C1FIFOINT23CLR __attribute__((section("sfrs"),address(0xBF88B924)));
extern volatile uint32_t C1FIFOINT23SET __attribute__((section("sfrs"),address(0xBF88B928)));
extern volatile uint32_t C1FIFOINT23INV __attribute__((section("sfrs"),address(0xBF88B92C)));

extern volatile uint32_t C1FIFOUA23 __attribute__((section("sfrs"), address(0xBF88B930)));
extern volatile uint32_t C1FIFOUA23CLR __attribute__((section("sfrs"),address(0xBF88B934)));
extern volatile uint32_t C1FIFOUA23SET __attribute__((section("sfrs"),address(0xBF88B938)));
extern volatile uint32_t C1FIFOUA23INV __attribute__((section("sfrs"),address(0xBF88B93C)));

extern volatile uint32_t C1FIFOCI23 __attribute__((section("sfrs"), address(0xBF88B940)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI23bits_t;
extern volatile __C1FIFOCI23bits_t C1FIFOCI23bits __asm__ ("C1FIFOCI23") __attribute__((section("sfrs"), address(0xBF88B940)));
extern volatile uint32_t C1FIFOCI23CLR __attribute__((section("sfrs"),address(0xBF88B944)));
extern volatile uint32_t C1FIFOCI23SET __attribute__((section("sfrs"),address(0xBF88B948)));
extern volatile uint32_t C1FIFOCI23INV __attribute__((section("sfrs"),address(0xBF88B94C)));

extern volatile uint32_t C1FIFOCON24 __attribute__((section("sfrs"), address(0xBF88B950)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON24bits_t;
extern volatile __C1FIFOCON24bits_t C1FIFOCON24bits __asm__ ("C1FIFOCON24") __attribute__((section("sfrs"), address(0xBF88B950)));
extern volatile uint32_t C1FIFOCON24CLR __attribute__((section("sfrs"),address(0xBF88B954)));
extern volatile uint32_t C1FIFOCON24SET __attribute__((section("sfrs"),address(0xBF88B958)));
extern volatile uint32_t C1FIFOCON24INV __attribute__((section("sfrs"),address(0xBF88B95C)));

extern volatile uint32_t C1FIFOINT24 __attribute__((section("sfrs"), address(0xBF88B960)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT24bits_t;
extern volatile __C1FIFOINT24bits_t C1FIFOINT24bits __asm__ ("C1FIFOINT24") __attribute__((section("sfrs"), address(0xBF88B960)));
extern volatile uint32_t C1FIFOINT24CLR __attribute__((section("sfrs"),address(0xBF88B964)));
extern volatile uint32_t C1FIFOINT24SET __attribute__((section("sfrs"),address(0xBF88B968)));
extern volatile uint32_t C1FIFOINT24INV __attribute__((section("sfrs"),address(0xBF88B96C)));

extern volatile uint32_t C1FIFOUA24 __attribute__((section("sfrs"), address(0xBF88B970)));
extern volatile uint32_t C1FIFOUA24CLR __attribute__((section("sfrs"),address(0xBF88B974)));
extern volatile uint32_t C1FIFOUA24SET __attribute__((section("sfrs"),address(0xBF88B978)));
extern volatile uint32_t C1FIFOUA24INV __attribute__((section("sfrs"),address(0xBF88B97C)));

extern volatile uint32_t C1FIFOCI24 __attribute__((section("sfrs"), address(0xBF88B980)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI24bits_t;
extern volatile __C1FIFOCI24bits_t C1FIFOCI24bits __asm__ ("C1FIFOCI24") __attribute__((section("sfrs"), address(0xBF88B980)));
extern volatile uint32_t C1FIFOCI24CLR __attribute__((section("sfrs"),address(0xBF88B984)));
extern volatile uint32_t C1FIFOCI24SET __attribute__((section("sfrs"),address(0xBF88B988)));
extern volatile uint32_t C1FIFOCI24INV __attribute__((section("sfrs"),address(0xBF88B98C)));

extern volatile uint32_t C1FIFOCON25 __attribute__((section("sfrs"), address(0xBF88B990)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON25bits_t;
extern volatile __C1FIFOCON25bits_t C1FIFOCON25bits __asm__ ("C1FIFOCON25") __attribute__((section("sfrs"), address(0xBF88B990)));
extern volatile uint32_t C1FIFOCON25CLR __attribute__((section("sfrs"),address(0xBF88B994)));
extern volatile uint32_t C1FIFOCON25SET __attribute__((section("sfrs"),address(0xBF88B998)));
extern volatile uint32_t C1FIFOCON25INV __attribute__((section("sfrs"),address(0xBF88B99C)));

extern volatile uint32_t C1FIFOINT25 __attribute__((section("sfrs"), address(0xBF88B9A0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT25bits_t;
extern volatile __C1FIFOINT25bits_t C1FIFOINT25bits __asm__ ("C1FIFOINT25") __attribute__((section("sfrs"), address(0xBF88B9A0)));
extern volatile uint32_t C1FIFOINT25CLR __attribute__((section("sfrs"),address(0xBF88B9A4)));
extern volatile uint32_t C1FIFOINT25SET __attribute__((section("sfrs"),address(0xBF88B9A8)));
extern volatile uint32_t C1FIFOINT25INV __attribute__((section("sfrs"),address(0xBF88B9AC)));

extern volatile uint32_t C1FIFOUA25 __attribute__((section("sfrs"), address(0xBF88B9B0)));
extern volatile uint32_t C1FIFOUA25CLR __attribute__((section("sfrs"),address(0xBF88B9B4)));
extern volatile uint32_t C1FIFOUA25SET __attribute__((section("sfrs"),address(0xBF88B9B8)));
extern volatile uint32_t C1FIFOUA25INV __attribute__((section("sfrs"),address(0xBF88B9BC)));

extern volatile uint32_t C1FIFOCI25 __attribute__((section("sfrs"), address(0xBF88B9C0)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI25bits_t;
extern volatile __C1FIFOCI25bits_t C1FIFOCI25bits __asm__ ("C1FIFOCI25") __attribute__((section("sfrs"), address(0xBF88B9C0)));
extern volatile uint32_t C1FIFOCI25CLR __attribute__((section("sfrs"),address(0xBF88B9C4)));
extern volatile uint32_t C1FIFOCI25SET __attribute__((section("sfrs"),address(0xBF88B9C8)));
extern volatile uint32_t C1FIFOCI25INV __attribute__((section("sfrs"),address(0xBF88B9CC)));

extern volatile uint32_t C1FIFOCON26 __attribute__((section("sfrs"), address(0xBF88B9D0)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON26bits_t;
extern volatile __C1FIFOCON26bits_t C1FIFOCON26bits __asm__ ("C1FIFOCON26") __attribute__((section("sfrs"), address(0xBF88B9D0)));
extern volatile uint32_t C1FIFOCON26CLR __attribute__((section("sfrs"),address(0xBF88B9D4)));
extern volatile uint32_t C1FIFOCON26SET __attribute__((section("sfrs"),address(0xBF88B9D8)));
extern volatile uint32_t C1FIFOCON26INV __attribute__((section("sfrs"),address(0xBF88B9DC)));

extern volatile uint32_t C1FIFOINT26 __attribute__((section("sfrs"), address(0xBF88B9E0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT26bits_t;
extern volatile __C1FIFOINT26bits_t C1FIFOINT26bits __asm__ ("C1FIFOINT26") __attribute__((section("sfrs"), address(0xBF88B9E0)));
extern volatile uint32_t C1FIFOINT26CLR __attribute__((section("sfrs"),address(0xBF88B9E4)));
extern volatile uint32_t C1FIFOINT26SET __attribute__((section("sfrs"),address(0xBF88B9E8)));
extern volatile uint32_t C1FIFOINT26INV __attribute__((section("sfrs"),address(0xBF88B9EC)));

extern volatile uint32_t C1FIFOUA26 __attribute__((section("sfrs"), address(0xBF88B9F0)));
extern volatile uint32_t C1FIFOUA26CLR __attribute__((section("sfrs"),address(0xBF88B9F4)));
extern volatile uint32_t C1FIFOUA26SET __attribute__((section("sfrs"),address(0xBF88B9F8)));
extern volatile uint32_t C1FIFOUA26INV __attribute__((section("sfrs"),address(0xBF88B9FC)));

extern volatile uint32_t C1FIFOCI26 __attribute__((section("sfrs"), address(0xBF88BA00)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI26bits_t;
extern volatile __C1FIFOCI26bits_t C1FIFOCI26bits __asm__ ("C1FIFOCI26") __attribute__((section("sfrs"), address(0xBF88BA00)));
extern volatile uint32_t C1FIFOCI26CLR __attribute__((section("sfrs"),address(0xBF88BA04)));
extern volatile uint32_t C1FIFOCI26SET __attribute__((section("sfrs"),address(0xBF88BA08)));
extern volatile uint32_t C1FIFOCI26INV __attribute__((section("sfrs"),address(0xBF88BA0C)));

extern volatile uint32_t C1FIFOCON27 __attribute__((section("sfrs"), address(0xBF88BA10)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON27bits_t;
extern volatile __C1FIFOCON27bits_t C1FIFOCON27bits __asm__ ("C1FIFOCON27") __attribute__((section("sfrs"), address(0xBF88BA10)));
extern volatile uint32_t C1FIFOCON27CLR __attribute__((section("sfrs"),address(0xBF88BA14)));
extern volatile uint32_t C1FIFOCON27SET __attribute__((section("sfrs"),address(0xBF88BA18)));
extern volatile uint32_t C1FIFOCON27INV __attribute__((section("sfrs"),address(0xBF88BA1C)));

extern volatile uint32_t C1FIFOINT27 __attribute__((section("sfrs"), address(0xBF88BA20)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT27bits_t;
extern volatile __C1FIFOINT27bits_t C1FIFOINT27bits __asm__ ("C1FIFOINT27") __attribute__((section("sfrs"), address(0xBF88BA20)));
extern volatile uint32_t C1FIFOINT27CLR __attribute__((section("sfrs"),address(0xBF88BA24)));
extern volatile uint32_t C1FIFOINT27SET __attribute__((section("sfrs"),address(0xBF88BA28)));
extern volatile uint32_t C1FIFOINT27INV __attribute__((section("sfrs"),address(0xBF88BA2C)));

extern volatile uint32_t C1FIFOUA27 __attribute__((section("sfrs"), address(0xBF88BA30)));
extern volatile uint32_t C1FIFOUA27CLR __attribute__((section("sfrs"),address(0xBF88BA34)));
extern volatile uint32_t C1FIFOUA27SET __attribute__((section("sfrs"),address(0xBF88BA38)));
extern volatile uint32_t C1FIFOUA27INV __attribute__((section("sfrs"),address(0xBF88BA3C)));

extern volatile uint32_t C1FIFOCI27 __attribute__((section("sfrs"), address(0xBF88BA40)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI27bits_t;
extern volatile __C1FIFOCI27bits_t C1FIFOCI27bits __asm__ ("C1FIFOCI27") __attribute__((section("sfrs"), address(0xBF88BA40)));
extern volatile uint32_t C1FIFOCI27CLR __attribute__((section("sfrs"),address(0xBF88BA44)));
extern volatile uint32_t C1FIFOCI27SET __attribute__((section("sfrs"),address(0xBF88BA48)));
extern volatile uint32_t C1FIFOCI27INV __attribute__((section("sfrs"),address(0xBF88BA4C)));

extern volatile uint32_t C1FIFOCON28 __attribute__((section("sfrs"), address(0xBF88BA50)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON28bits_t;
extern volatile __C1FIFOCON28bits_t C1FIFOCON28bits __asm__ ("C1FIFOCON28") __attribute__((section("sfrs"), address(0xBF88BA50)));
extern volatile uint32_t C1FIFOCON28CLR __attribute__((section("sfrs"),address(0xBF88BA54)));
extern volatile uint32_t C1FIFOCON28SET __attribute__((section("sfrs"),address(0xBF88BA58)));
extern volatile uint32_t C1FIFOCON28INV __attribute__((section("sfrs"),address(0xBF88BA5C)));

extern volatile uint32_t C1FIFOINT28 __attribute__((section("sfrs"), address(0xBF88BA60)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT28bits_t;
extern volatile __C1FIFOINT28bits_t C1FIFOINT28bits __asm__ ("C1FIFOINT28") __attribute__((section("sfrs"), address(0xBF88BA60)));
extern volatile uint32_t C1FIFOINT28CLR __attribute__((section("sfrs"),address(0xBF88BA64)));
extern volatile uint32_t C1FIFOINT28SET __attribute__((section("sfrs"),address(0xBF88BA68)));
extern volatile uint32_t C1FIFOINT28INV __attribute__((section("sfrs"),address(0xBF88BA6C)));

extern volatile uint32_t C1FIFOUA28 __attribute__((section("sfrs"), address(0xBF88BA70)));
extern volatile uint32_t C1FIFOUA28CLR __attribute__((section("sfrs"),address(0xBF88BA74)));
extern volatile uint32_t C1FIFOUA28SET __attribute__((section("sfrs"),address(0xBF88BA78)));
extern volatile uint32_t C1FIFOUA28INV __attribute__((section("sfrs"),address(0xBF88BA7C)));

extern volatile uint32_t C1FIFOCI28 __attribute__((section("sfrs"), address(0xBF88BA80)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI28bits_t;
extern volatile __C1FIFOCI28bits_t C1FIFOCI28bits __asm__ ("C1FIFOCI28") __attribute__((section("sfrs"), address(0xBF88BA80)));
extern volatile uint32_t C1FIFOCI28CLR __attribute__((section("sfrs"),address(0xBF88BA84)));
extern volatile uint32_t C1FIFOCI28SET __attribute__((section("sfrs"),address(0xBF88BA88)));
extern volatile uint32_t C1FIFOCI28INV __attribute__((section("sfrs"),address(0xBF88BA8C)));

extern volatile uint32_t C1FIFOCON29 __attribute__((section("sfrs"), address(0xBF88BA90)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON29bits_t;
extern volatile __C1FIFOCON29bits_t C1FIFOCON29bits __asm__ ("C1FIFOCON29") __attribute__((section("sfrs"), address(0xBF88BA90)));
extern volatile uint32_t C1FIFOCON29CLR __attribute__((section("sfrs"),address(0xBF88BA94)));
extern volatile uint32_t C1FIFOCON29SET __attribute__((section("sfrs"),address(0xBF88BA98)));
extern volatile uint32_t C1FIFOCON29INV __attribute__((section("sfrs"),address(0xBF88BA9C)));

extern volatile uint32_t C1FIFOINT29 __attribute__((section("sfrs"), address(0xBF88BAA0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT29bits_t;
extern volatile __C1FIFOINT29bits_t C1FIFOINT29bits __asm__ ("C1FIFOINT29") __attribute__((section("sfrs"), address(0xBF88BAA0)));
extern volatile uint32_t C1FIFOINT29CLR __attribute__((section("sfrs"),address(0xBF88BAA4)));
extern volatile uint32_t C1FIFOINT29SET __attribute__((section("sfrs"),address(0xBF88BAA8)));
extern volatile uint32_t C1FIFOINT29INV __attribute__((section("sfrs"),address(0xBF88BAAC)));

extern volatile uint32_t C1FIFOUA29 __attribute__((section("sfrs"), address(0xBF88BAB0)));
extern volatile uint32_t C1FIFOUA29CLR __attribute__((section("sfrs"),address(0xBF88BAB4)));
extern volatile uint32_t C1FIFOUA29SET __attribute__((section("sfrs"),address(0xBF88BAB8)));
extern volatile uint32_t C1FIFOUA29INV __attribute__((section("sfrs"),address(0xBF88BABC)));

extern volatile uint32_t C1FIFOCI29 __attribute__((section("sfrs"), address(0xBF88BAC0)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI29bits_t;
extern volatile __C1FIFOCI29bits_t C1FIFOCI29bits __asm__ ("C1FIFOCI29") __attribute__((section("sfrs"), address(0xBF88BAC0)));
extern volatile uint32_t C1FIFOCI29CLR __attribute__((section("sfrs"),address(0xBF88BAC4)));
extern volatile uint32_t C1FIFOCI29SET __attribute__((section("sfrs"),address(0xBF88BAC8)));
extern volatile uint32_t C1FIFOCI29INV __attribute__((section("sfrs"),address(0xBF88BACC)));

extern volatile uint32_t C1FIFOCON30 __attribute__((section("sfrs"), address(0xBF88BAD0)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON30bits_t;
extern volatile __C1FIFOCON30bits_t C1FIFOCON30bits __asm__ ("C1FIFOCON30") __attribute__((section("sfrs"), address(0xBF88BAD0)));
extern volatile uint32_t C1FIFOCON30CLR __attribute__((section("sfrs"),address(0xBF88BAD4)));
extern volatile uint32_t C1FIFOCON30SET __attribute__((section("sfrs"),address(0xBF88BAD8)));
extern volatile uint32_t C1FIFOCON30INV __attribute__((section("sfrs"),address(0xBF88BADC)));

extern volatile uint32_t C1FIFOINT30 __attribute__((section("sfrs"), address(0xBF88BAE0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT30bits_t;
extern volatile __C1FIFOINT30bits_t C1FIFOINT30bits __asm__ ("C1FIFOINT30") __attribute__((section("sfrs"), address(0xBF88BAE0)));
extern volatile uint32_t C1FIFOINT30CLR __attribute__((section("sfrs"),address(0xBF88BAE4)));
extern volatile uint32_t C1FIFOINT30SET __attribute__((section("sfrs"),address(0xBF88BAE8)));
extern volatile uint32_t C1FIFOINT30INV __attribute__((section("sfrs"),address(0xBF88BAEC)));

extern volatile uint32_t C1FIFOUA30 __attribute__((section("sfrs"), address(0xBF88BAF0)));
extern volatile uint32_t C1FIFOUA30CLR __attribute__((section("sfrs"),address(0xBF88BAF4)));
extern volatile uint32_t C1FIFOUA30SET __attribute__((section("sfrs"),address(0xBF88BAF8)));
extern volatile uint32_t C1FIFOUA30INV __attribute__((section("sfrs"),address(0xBF88BAFC)));

extern volatile uint32_t C1FIFOCI30 __attribute__((section("sfrs"), address(0xBF88BB00)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI30bits_t;
extern volatile __C1FIFOCI30bits_t C1FIFOCI30bits __asm__ ("C1FIFOCI30") __attribute__((section("sfrs"), address(0xBF88BB00)));
extern volatile uint32_t C1FIFOCI30CLR __attribute__((section("sfrs"),address(0xBF88BB04)));
extern volatile uint32_t C1FIFOCI30SET __attribute__((section("sfrs"),address(0xBF88BB08)));
extern volatile uint32_t C1FIFOCI30INV __attribute__((section("sfrs"),address(0xBF88BB0C)));

extern volatile uint32_t C1FIFOCON31 __attribute__((section("sfrs"), address(0xBF88BB10)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCON31bits_t;
extern volatile __C1FIFOCON31bits_t C1FIFOCON31bits __asm__ ("C1FIFOCON31") __attribute__((section("sfrs"), address(0xBF88BB10)));
extern volatile uint32_t C1FIFOCON31CLR __attribute__((section("sfrs"),address(0xBF88BB14)));
extern volatile uint32_t C1FIFOCON31SET __attribute__((section("sfrs"),address(0xBF88BB18)));
extern volatile uint32_t C1FIFOCON31INV __attribute__((section("sfrs"),address(0xBF88BB1C)));

extern volatile uint32_t C1FIFOINT31 __attribute__((section("sfrs"), address(0xBF88BB20)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOINT31bits_t;
extern volatile __C1FIFOINT31bits_t C1FIFOINT31bits __asm__ ("C1FIFOINT31") __attribute__((section("sfrs"), address(0xBF88BB20)));
extern volatile uint32_t C1FIFOINT31CLR __attribute__((section("sfrs"),address(0xBF88BB24)));
extern volatile uint32_t C1FIFOINT31SET __attribute__((section("sfrs"),address(0xBF88BB28)));
extern volatile uint32_t C1FIFOINT31INV __attribute__((section("sfrs"),address(0xBF88BB2C)));

extern volatile uint32_t C1FIFOUA31 __attribute__((section("sfrs"), address(0xBF88BB30)));
extern volatile uint32_t C1FIFOUA31CLR __attribute__((section("sfrs"),address(0xBF88BB34)));
extern volatile uint32_t C1FIFOUA31SET __attribute__((section("sfrs"),address(0xBF88BB38)));
extern volatile uint32_t C1FIFOUA31INV __attribute__((section("sfrs"),address(0xBF88BB3C)));

extern volatile uint32_t C1FIFOCI31 __attribute__((section("sfrs"), address(0xBF88BB40)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C1FIFOCI31bits_t;
extern volatile __C1FIFOCI31bits_t C1FIFOCI31bits __asm__ ("C1FIFOCI31") __attribute__((section("sfrs"), address(0xBF88BB40)));
extern volatile uint32_t C1FIFOCI31CLR __attribute__((section("sfrs"),address(0xBF88BB44)));
extern volatile uint32_t C1FIFOCI31SET __attribute__((section("sfrs"),address(0xBF88BB48)));
extern volatile uint32_t C1FIFOCI31INV __attribute__((section("sfrs"),address(0xBF88BB4C)));

extern volatile uint32_t C2CON __attribute__((section("sfrs"), address(0xBF88C000)));
typedef union {
  struct {
    uint32_t DNCNT:5;
    uint32_t :6;
    uint32_t CANBUSY:1;
    uint32_t :1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
    uint32_t :4;
    uint32_t CANCAP:1;
    uint32_t OPMOD:3;
    uint32_t REQOP:3;
    uint32_t ABAT:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2CONbits_t;
extern volatile __C2CONbits_t C2CONbits __asm__ ("C2CON") __attribute__((section("sfrs"), address(0xBF88C000)));
extern volatile uint32_t C2CONCLR __attribute__((section("sfrs"),address(0xBF88C004)));
extern volatile uint32_t C2CONSET __attribute__((section("sfrs"),address(0xBF88C008)));
extern volatile uint32_t C2CONINV __attribute__((section("sfrs"),address(0xBF88C00C)));

extern volatile uint32_t C2CFG __attribute__((section("sfrs"), address(0xBF88C010)));
typedef union {
  struct {
    uint32_t BRP:6;
    uint32_t SJW:2;
    uint32_t PRSEG:3;
    uint32_t SEG1PH:3;
    uint32_t SAM:1;
    uint32_t SEG2PHTS:1;
    uint32_t SEG2PH:3;
    uint32_t :3;
    uint32_t WAKFIL:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2CFGbits_t;
extern volatile __C2CFGbits_t C2CFGbits __asm__ ("C2CFG") __attribute__((section("sfrs"), address(0xBF88C010)));
extern volatile uint32_t C2CFGCLR __attribute__((section("sfrs"),address(0xBF88C014)));
extern volatile uint32_t C2CFGSET __attribute__((section("sfrs"),address(0xBF88C018)));
extern volatile uint32_t C2CFGINV __attribute__((section("sfrs"),address(0xBF88C01C)));

extern volatile uint32_t C2INT __attribute__((section("sfrs"), address(0xBF88C020)));
typedef union {
  struct {
    uint32_t TBIF:1;
    uint32_t RBIF:1;
    uint32_t CTMRIF:1;
    uint32_t MODIF:1;
    uint32_t :7;
    uint32_t RBOVIF:1;
    uint32_t SERRIF:1;
    uint32_t CERRIF:1;
    uint32_t WAKIF:1;
    uint32_t IVRIF:1;
    uint32_t TBIE:1;
    uint32_t RBIE:1;
    uint32_t CTMRIE:1;
    uint32_t MODIE:1;
    uint32_t :7;
    uint32_t RBOVIE:1;
    uint32_t SERRIE:1;
    uint32_t CERRIE:1;
    uint32_t WAKIE:1;
    uint32_t IVRIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2INTbits_t;
extern volatile __C2INTbits_t C2INTbits __asm__ ("C2INT") __attribute__((section("sfrs"), address(0xBF88C020)));
extern volatile uint32_t C2INTCLR __attribute__((section("sfrs"),address(0xBF88C024)));
extern volatile uint32_t C2INTSET __attribute__((section("sfrs"),address(0xBF88C028)));
extern volatile uint32_t C2INTINV __attribute__((section("sfrs"),address(0xBF88C02C)));

extern volatile uint32_t C2VEC __attribute__((section("sfrs"), address(0xBF88C030)));
typedef union {
  struct {
    uint32_t ICODE:7;
    uint32_t :1;
    uint32_t FILHIT:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2VECbits_t;
extern volatile __C2VECbits_t C2VECbits __asm__ ("C2VEC") __attribute__((section("sfrs"), address(0xBF88C030)));
extern volatile uint32_t C2VECCLR __attribute__((section("sfrs"),address(0xBF88C034)));
extern volatile uint32_t C2VECSET __attribute__((section("sfrs"),address(0xBF88C038)));
extern volatile uint32_t C2VECINV __attribute__((section("sfrs"),address(0xBF88C03C)));

extern volatile uint32_t C2TREC __attribute__((section("sfrs"), address(0xBF88C040)));
typedef union {
  struct {
    uint32_t RERRCNT:8;
    uint32_t TERRCNT:8;
    uint32_t EWARN:1;
    uint32_t RXWARN:1;
    uint32_t TXWARN:1;
    uint32_t RXBP:1;
    uint32_t TXBP:1;
    uint32_t TXBO:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2TRECbits_t;
extern volatile __C2TRECbits_t C2TRECbits __asm__ ("C2TREC") __attribute__((section("sfrs"), address(0xBF88C040)));
extern volatile uint32_t C2TRECCLR __attribute__((section("sfrs"),address(0xBF88C044)));
extern volatile uint32_t C2TRECSET __attribute__((section("sfrs"),address(0xBF88C048)));
extern volatile uint32_t C2TRECINV __attribute__((section("sfrs"),address(0xBF88C04C)));

extern volatile uint32_t C2FSTAT __attribute__((section("sfrs"), address(0xBF88C050)));
typedef union {
  struct {
    uint32_t FIFOIP:32;
  };
  struct {
    uint32_t FIFOIP0:1;
    uint32_t FIFOIP1:1;
    uint32_t FIFOIP2:1;
    uint32_t FIFOIP3:1;
    uint32_t FIFOIP4:1;
    uint32_t FIFOIP5:1;
    uint32_t FIFOIP6:1;
    uint32_t FIFOIP7:1;
    uint32_t FIFOIP8:1;
    uint32_t FIFOIP9:1;
    uint32_t FIFOIP10:1;
    uint32_t FIFOIP11:1;
    uint32_t FIFOIP12:1;
    uint32_t FIFOIP13:1;
    uint32_t FIFOIP14:1;
    uint32_t FIFOIP15:1;
    uint32_t FIFOIP16:1;
    uint32_t FIFOIP17:1;
    uint32_t FIFOIP18:1;
    uint32_t FIFOIP19:1;
    uint32_t FIFOIP20:1;
    uint32_t FIFOIP21:1;
    uint32_t FIFOIP22:1;
    uint32_t FIFOIP23:1;
    uint32_t FIFOIP24:1;
    uint32_t FIFOIP25:1;
    uint32_t FIFOIP26:1;
    uint32_t FIFOIP27:1;
    uint32_t FIFOIP28:1;
    uint32_t FIFOIP29:1;
    uint32_t FIFOIP30:1;
    uint32_t FIFOIP31:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FSTATbits_t;
extern volatile __C2FSTATbits_t C2FSTATbits __asm__ ("C2FSTAT") __attribute__((section("sfrs"), address(0xBF88C050)));
extern volatile uint32_t C2FSTATCLR __attribute__((section("sfrs"),address(0xBF88C054)));
extern volatile uint32_t C2FSTATSET __attribute__((section("sfrs"),address(0xBF88C058)));
extern volatile uint32_t C2FSTATINV __attribute__((section("sfrs"),address(0xBF88C05C)));

extern volatile uint32_t C2RXOVF __attribute__((section("sfrs"), address(0xBF88C060)));
typedef union {
  struct {
    uint32_t RXOVF:32;
  };
  struct {
    uint32_t RXOVF0:1;
    uint32_t RXOVF1:1;
    uint32_t RXOVF2:1;
    uint32_t RXOVF3:1;
    uint32_t RXOVF4:1;
    uint32_t RXOVF5:1;
    uint32_t RXOVF6:1;
    uint32_t RXOVF7:1;
    uint32_t RXOVF8:1;
    uint32_t RXOVF9:1;
    uint32_t RXOVF10:1;
    uint32_t RXOVF11:1;
    uint32_t RXOVF12:1;
    uint32_t RXOVF13:1;
    uint32_t RXOVF14:1;
    uint32_t RXOVF15:1;
    uint32_t RXOVF16:1;
    uint32_t RXOVF17:1;
    uint32_t RXOVF18:1;
    uint32_t RXOVF19:1;
    uint32_t RXOVF20:1;
    uint32_t RXOVF21:1;
    uint32_t RXOVF22:1;
    uint32_t RXOVF23:1;
    uint32_t RXOVF24:1;
    uint32_t RXOVF25:1;
    uint32_t RXOVF26:1;
    uint32_t RXOVF27:1;
    uint32_t RXOVF28:1;
    uint32_t RXOVF29:1;
    uint32_t RXOVF30:1;
    uint32_t RXOVF31:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXOVFbits_t;
extern volatile __C2RXOVFbits_t C2RXOVFbits __asm__ ("C2RXOVF") __attribute__((section("sfrs"), address(0xBF88C060)));
extern volatile uint32_t C2RXOVFCLR __attribute__((section("sfrs"),address(0xBF88C064)));
extern volatile uint32_t C2RXOVFSET __attribute__((section("sfrs"),address(0xBF88C068)));
extern volatile uint32_t C2RXOVFINV __attribute__((section("sfrs"),address(0xBF88C06C)));

extern volatile uint32_t C2TMR __attribute__((section("sfrs"), address(0xBF88C070)));
typedef union {
  struct {
    uint32_t CANTSPRE:16;
    uint32_t CANTS:16;
  };
  struct {
    uint32_t w:32;
  };
} __C2TMRbits_t;
extern volatile __C2TMRbits_t C2TMRbits __asm__ ("C2TMR") __attribute__((section("sfrs"), address(0xBF88C070)));
extern volatile uint32_t C2TMRCLR __attribute__((section("sfrs"),address(0xBF88C074)));
extern volatile uint32_t C2TMRSET __attribute__((section("sfrs"),address(0xBF88C078)));
extern volatile uint32_t C2TMRINV __attribute__((section("sfrs"),address(0xBF88C07C)));

extern volatile uint32_t C2RXM0 __attribute__((section("sfrs"), address(0xBF88C080)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t MIDE:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXM0bits_t;
extern volatile __C2RXM0bits_t C2RXM0bits __asm__ ("C2RXM0") __attribute__((section("sfrs"), address(0xBF88C080)));
extern volatile uint32_t C2RXM0CLR __attribute__((section("sfrs"),address(0xBF88C084)));
extern volatile uint32_t C2RXM0SET __attribute__((section("sfrs"),address(0xBF88C088)));
extern volatile uint32_t C2RXM0INV __attribute__((section("sfrs"),address(0xBF88C08C)));

extern volatile uint32_t C2RXM1 __attribute__((section("sfrs"), address(0xBF88C090)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t MIDE:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXM1bits_t;
extern volatile __C2RXM1bits_t C2RXM1bits __asm__ ("C2RXM1") __attribute__((section("sfrs"), address(0xBF88C090)));
extern volatile uint32_t C2RXM1CLR __attribute__((section("sfrs"),address(0xBF88C094)));
extern volatile uint32_t C2RXM1SET __attribute__((section("sfrs"),address(0xBF88C098)));
extern volatile uint32_t C2RXM1INV __attribute__((section("sfrs"),address(0xBF88C09C)));

extern volatile uint32_t C2RXM2 __attribute__((section("sfrs"), address(0xBF88C0A0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t MIDE:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXM2bits_t;
extern volatile __C2RXM2bits_t C2RXM2bits __asm__ ("C2RXM2") __attribute__((section("sfrs"), address(0xBF88C0A0)));
extern volatile uint32_t C2RXM2CLR __attribute__((section("sfrs"),address(0xBF88C0A4)));
extern volatile uint32_t C2RXM2SET __attribute__((section("sfrs"),address(0xBF88C0A8)));
extern volatile uint32_t C2RXM2INV __attribute__((section("sfrs"),address(0xBF88C0AC)));

extern volatile uint32_t C2RXM3 __attribute__((section("sfrs"), address(0xBF88C0B0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t MIDE:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXM3bits_t;
extern volatile __C2RXM3bits_t C2RXM3bits __asm__ ("C2RXM3") __attribute__((section("sfrs"), address(0xBF88C0B0)));
extern volatile uint32_t C2RXM3CLR __attribute__((section("sfrs"),address(0xBF88C0B4)));
extern volatile uint32_t C2RXM3SET __attribute__((section("sfrs"),address(0xBF88C0B8)));
extern volatile uint32_t C2RXM3INV __attribute__((section("sfrs"),address(0xBF88C0BC)));

extern volatile uint32_t C2FLTCON0 __attribute__((section("sfrs"), address(0xBF88C0C0)));
typedef union {
  struct {
    uint32_t FSEL0:5;
    uint32_t MSEL0:2;
    uint32_t FLTEN0:1;
    uint32_t FSEL1:5;
    uint32_t MSEL1:2;
    uint32_t FLTEN1:1;
    uint32_t FSEL2:5;
    uint32_t MSEL2:2;
    uint32_t FLTEN2:1;
    uint32_t FSEL3:5;
    uint32_t MSEL3:2;
    uint32_t FLTEN3:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FLTCON0bits_t;
extern volatile __C2FLTCON0bits_t C2FLTCON0bits __asm__ ("C2FLTCON0") __attribute__((section("sfrs"), address(0xBF88C0C0)));
extern volatile uint32_t C2FLTCON0CLR __attribute__((section("sfrs"),address(0xBF88C0C4)));
extern volatile uint32_t C2FLTCON0SET __attribute__((section("sfrs"),address(0xBF88C0C8)));
extern volatile uint32_t C2FLTCON0INV __attribute__((section("sfrs"),address(0xBF88C0CC)));

extern volatile uint32_t C2FLTCON1 __attribute__((section("sfrs"), address(0xBF88C0D0)));
typedef union {
  struct {
    uint32_t FSEL4:5;
    uint32_t MSEL4:2;
    uint32_t FLTEN4:1;
    uint32_t FSEL5:5;
    uint32_t MSEL5:2;
    uint32_t FLTEN5:1;
    uint32_t FSEL6:5;
    uint32_t MSEL6:2;
    uint32_t FLTEN6:1;
    uint32_t FSEL7:5;
    uint32_t MSEL7:2;
    uint32_t FLTEN7:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FLTCON1bits_t;
extern volatile __C2FLTCON1bits_t C2FLTCON1bits __asm__ ("C2FLTCON1") __attribute__((section("sfrs"), address(0xBF88C0D0)));
extern volatile uint32_t C2FLTCON1CLR __attribute__((section("sfrs"),address(0xBF88C0D4)));
extern volatile uint32_t C2FLTCON1SET __attribute__((section("sfrs"),address(0xBF88C0D8)));
extern volatile uint32_t C2FLTCON1INV __attribute__((section("sfrs"),address(0xBF88C0DC)));

extern volatile uint32_t C2FLTCON2 __attribute__((section("sfrs"), address(0xBF88C0E0)));
typedef union {
  struct {
    uint32_t FSEL8:5;
    uint32_t MSEL8:2;
    uint32_t FLTEN8:1;
    uint32_t FSEL9:5;
    uint32_t MSEL9:2;
    uint32_t FLTEN9:1;
    uint32_t FSEL10:5;
    uint32_t MSEL10:2;
    uint32_t FLTEN10:1;
    uint32_t FSEL11:5;
    uint32_t MSEL11:2;
    uint32_t FLTEN11:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FLTCON2bits_t;
extern volatile __C2FLTCON2bits_t C2FLTCON2bits __asm__ ("C2FLTCON2") __attribute__((section("sfrs"), address(0xBF88C0E0)));
extern volatile uint32_t C2FLTCON2CLR __attribute__((section("sfrs"),address(0xBF88C0E4)));
extern volatile uint32_t C2FLTCON2SET __attribute__((section("sfrs"),address(0xBF88C0E8)));
extern volatile uint32_t C2FLTCON2INV __attribute__((section("sfrs"),address(0xBF88C0EC)));

extern volatile uint32_t C2FLTCON3 __attribute__((section("sfrs"), address(0xBF88C0F0)));
typedef union {
  struct {
    uint32_t FSEL12:5;
    uint32_t MSEL12:2;
    uint32_t FLTEN12:1;
    uint32_t FSEL13:5;
    uint32_t MSEL13:2;
    uint32_t FLTEN13:1;
    uint32_t FSEL14:5;
    uint32_t MSEL14:2;
    uint32_t FLTEN14:1;
    uint32_t FSEL15:5;
    uint32_t MSEL15:2;
    uint32_t FLTEN15:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FLTCON3bits_t;
extern volatile __C2FLTCON3bits_t C2FLTCON3bits __asm__ ("C2FLTCON3") __attribute__((section("sfrs"), address(0xBF88C0F0)));
extern volatile uint32_t C2FLTCON3CLR __attribute__((section("sfrs"),address(0xBF88C0F4)));
extern volatile uint32_t C2FLTCON3SET __attribute__((section("sfrs"),address(0xBF88C0F8)));
extern volatile uint32_t C2FLTCON3INV __attribute__((section("sfrs"),address(0xBF88C0FC)));

extern volatile uint32_t C2FLTCON4 __attribute__((section("sfrs"), address(0xBF88C100)));
typedef union {
  struct {
    uint32_t FSEL16:5;
    uint32_t MSEL16:2;
    uint32_t FLTEN16:1;
    uint32_t FSEL17:5;
    uint32_t MSEL17:2;
    uint32_t FLTEN17:1;
    uint32_t FSEL18:5;
    uint32_t MSEL18:2;
    uint32_t FLTEN18:1;
    uint32_t FSEL19:5;
    uint32_t MSEL19:2;
    uint32_t FLTEN19:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FLTCON4bits_t;
extern volatile __C2FLTCON4bits_t C2FLTCON4bits __asm__ ("C2FLTCON4") __attribute__((section("sfrs"), address(0xBF88C100)));
extern volatile uint32_t C2FLTCON4CLR __attribute__((section("sfrs"),address(0xBF88C104)));
extern volatile uint32_t C2FLTCON4SET __attribute__((section("sfrs"),address(0xBF88C108)));
extern volatile uint32_t C2FLTCON4INV __attribute__((section("sfrs"),address(0xBF88C10C)));

extern volatile uint32_t C2FLTCON5 __attribute__((section("sfrs"), address(0xBF88C110)));
typedef union {
  struct {
    uint32_t FSEL20:5;
    uint32_t MSEL20:2;
    uint32_t FLTEN20:1;
    uint32_t FSEL21:5;
    uint32_t MSEL21:2;
    uint32_t FLTEN21:1;
    uint32_t FSEL22:5;
    uint32_t MSEL22:2;
    uint32_t FLTEN22:1;
    uint32_t FSEL23:5;
    uint32_t MSEL23:2;
    uint32_t FLTEN23:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FLTCON5bits_t;
extern volatile __C2FLTCON5bits_t C2FLTCON5bits __asm__ ("C2FLTCON5") __attribute__((section("sfrs"), address(0xBF88C110)));
extern volatile uint32_t C2FLTCON5CLR __attribute__((section("sfrs"),address(0xBF88C114)));
extern volatile uint32_t C2FLTCON5SET __attribute__((section("sfrs"),address(0xBF88C118)));
extern volatile uint32_t C2FLTCON5INV __attribute__((section("sfrs"),address(0xBF88C11C)));

extern volatile uint32_t C2FLTCON6 __attribute__((section("sfrs"), address(0xBF88C120)));
typedef union {
  struct {
    uint32_t FSEL24:5;
    uint32_t MSEL24:2;
    uint32_t FLTEN24:1;
    uint32_t FSEL25:5;
    uint32_t MSEL25:2;
    uint32_t FLTEN25:1;
    uint32_t FSEL26:5;
    uint32_t MSEL26:2;
    uint32_t FLTEN26:1;
    uint32_t FSEL27:5;
    uint32_t MSEL27:2;
    uint32_t FLTEN27:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FLTCON6bits_t;
extern volatile __C2FLTCON6bits_t C2FLTCON6bits __asm__ ("C2FLTCON6") __attribute__((section("sfrs"), address(0xBF88C120)));
extern volatile uint32_t C2FLTCON6CLR __attribute__((section("sfrs"),address(0xBF88C124)));
extern volatile uint32_t C2FLTCON6SET __attribute__((section("sfrs"),address(0xBF88C128)));
extern volatile uint32_t C2FLTCON6INV __attribute__((section("sfrs"),address(0xBF88C12C)));

extern volatile uint32_t C2FLTCON7 __attribute__((section("sfrs"), address(0xBF88C130)));
typedef union {
  struct {
    uint32_t FSEL28:5;
    uint32_t MSEL28:2;
    uint32_t FLTEN28:1;
    uint32_t FSEL29:5;
    uint32_t MSEL29:2;
    uint32_t FLTEN29:1;
    uint32_t FSEL30:5;
    uint32_t MSEL30:2;
    uint32_t FLTEN30:1;
    uint32_t FSEL31:5;
    uint32_t MSEL31:2;
    uint32_t FLTEN31:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FLTCON7bits_t;
extern volatile __C2FLTCON7bits_t C2FLTCON7bits __asm__ ("C2FLTCON7") __attribute__((section("sfrs"), address(0xBF88C130)));
extern volatile uint32_t C2FLTCON7CLR __attribute__((section("sfrs"),address(0xBF88C134)));
extern volatile uint32_t C2FLTCON7SET __attribute__((section("sfrs"),address(0xBF88C138)));
extern volatile uint32_t C2FLTCON7INV __attribute__((section("sfrs"),address(0xBF88C13C)));

extern volatile uint32_t C2RXF0 __attribute__((section("sfrs"), address(0xBF88C140)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF0bits_t;
extern volatile __C2RXF0bits_t C2RXF0bits __asm__ ("C2RXF0") __attribute__((section("sfrs"), address(0xBF88C140)));
extern volatile uint32_t C2RXF0CLR __attribute__((section("sfrs"),address(0xBF88C144)));
extern volatile uint32_t C2RXF0SET __attribute__((section("sfrs"),address(0xBF88C148)));
extern volatile uint32_t C2RXF0INV __attribute__((section("sfrs"),address(0xBF88C14C)));

extern volatile uint32_t C2RXF1 __attribute__((section("sfrs"), address(0xBF88C150)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF1bits_t;
extern volatile __C2RXF1bits_t C2RXF1bits __asm__ ("C2RXF1") __attribute__((section("sfrs"), address(0xBF88C150)));
extern volatile uint32_t C2RXF1CLR __attribute__((section("sfrs"),address(0xBF88C154)));
extern volatile uint32_t C2RXF1SET __attribute__((section("sfrs"),address(0xBF88C158)));
extern volatile uint32_t C2RXF1INV __attribute__((section("sfrs"),address(0xBF88C15C)));

extern volatile uint32_t C2RXF2 __attribute__((section("sfrs"), address(0xBF88C160)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF2bits_t;
extern volatile __C2RXF2bits_t C2RXF2bits __asm__ ("C2RXF2") __attribute__((section("sfrs"), address(0xBF88C160)));
extern volatile uint32_t C2RXF2CLR __attribute__((section("sfrs"),address(0xBF88C164)));
extern volatile uint32_t C2RXF2SET __attribute__((section("sfrs"),address(0xBF88C168)));
extern volatile uint32_t C2RXF2INV __attribute__((section("sfrs"),address(0xBF88C16C)));

extern volatile uint32_t C2RXF3 __attribute__((section("sfrs"), address(0xBF88C170)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF3bits_t;
extern volatile __C2RXF3bits_t C2RXF3bits __asm__ ("C2RXF3") __attribute__((section("sfrs"), address(0xBF88C170)));
extern volatile uint32_t C2RXF3CLR __attribute__((section("sfrs"),address(0xBF88C174)));
extern volatile uint32_t C2RXF3SET __attribute__((section("sfrs"),address(0xBF88C178)));
extern volatile uint32_t C2RXF3INV __attribute__((section("sfrs"),address(0xBF88C17C)));

extern volatile uint32_t C2RXF4 __attribute__((section("sfrs"), address(0xBF88C180)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF4bits_t;
extern volatile __C2RXF4bits_t C2RXF4bits __asm__ ("C2RXF4") __attribute__((section("sfrs"), address(0xBF88C180)));
extern volatile uint32_t C2RXF4CLR __attribute__((section("sfrs"),address(0xBF88C184)));
extern volatile uint32_t C2RXF4SET __attribute__((section("sfrs"),address(0xBF88C188)));
extern volatile uint32_t C2RXF4INV __attribute__((section("sfrs"),address(0xBF88C18C)));

extern volatile uint32_t C2RXF5 __attribute__((section("sfrs"), address(0xBF88C190)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF5bits_t;
extern volatile __C2RXF5bits_t C2RXF5bits __asm__ ("C2RXF5") __attribute__((section("sfrs"), address(0xBF88C190)));
extern volatile uint32_t C2RXF5CLR __attribute__((section("sfrs"),address(0xBF88C194)));
extern volatile uint32_t C2RXF5SET __attribute__((section("sfrs"),address(0xBF88C198)));
extern volatile uint32_t C2RXF5INV __attribute__((section("sfrs"),address(0xBF88C19C)));

extern volatile uint32_t C2RXF6 __attribute__((section("sfrs"), address(0xBF88C1A0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF6bits_t;
extern volatile __C2RXF6bits_t C2RXF6bits __asm__ ("C2RXF6") __attribute__((section("sfrs"), address(0xBF88C1A0)));
extern volatile uint32_t C2RXF6CLR __attribute__((section("sfrs"),address(0xBF88C1A4)));
extern volatile uint32_t C2RXF6SET __attribute__((section("sfrs"),address(0xBF88C1A8)));
extern volatile uint32_t C2RXF6INV __attribute__((section("sfrs"),address(0xBF88C1AC)));

extern volatile uint32_t C2RXF7 __attribute__((section("sfrs"), address(0xBF88C1B0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF7bits_t;
extern volatile __C2RXF7bits_t C2RXF7bits __asm__ ("C2RXF7") __attribute__((section("sfrs"), address(0xBF88C1B0)));
extern volatile uint32_t C2RXF7CLR __attribute__((section("sfrs"),address(0xBF88C1B4)));
extern volatile uint32_t C2RXF7SET __attribute__((section("sfrs"),address(0xBF88C1B8)));
extern volatile uint32_t C2RXF7INV __attribute__((section("sfrs"),address(0xBF88C1BC)));

extern volatile uint32_t C2RXF8 __attribute__((section("sfrs"), address(0xBF88C1C0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF8bits_t;
extern volatile __C2RXF8bits_t C2RXF8bits __asm__ ("C2RXF8") __attribute__((section("sfrs"), address(0xBF88C1C0)));
extern volatile uint32_t C2RXF8CLR __attribute__((section("sfrs"),address(0xBF88C1C4)));
extern volatile uint32_t C2RXF8SET __attribute__((section("sfrs"),address(0xBF88C1C8)));
extern volatile uint32_t C2RXF8INV __attribute__((section("sfrs"),address(0xBF88C1CC)));

extern volatile uint32_t C2RXF9 __attribute__((section("sfrs"), address(0xBF88C1D0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF9bits_t;
extern volatile __C2RXF9bits_t C2RXF9bits __asm__ ("C2RXF9") __attribute__((section("sfrs"), address(0xBF88C1D0)));
extern volatile uint32_t C2RXF9CLR __attribute__((section("sfrs"),address(0xBF88C1D4)));
extern volatile uint32_t C2RXF9SET __attribute__((section("sfrs"),address(0xBF88C1D8)));
extern volatile uint32_t C2RXF9INV __attribute__((section("sfrs"),address(0xBF88C1DC)));

extern volatile uint32_t C2RXF10 __attribute__((section("sfrs"), address(0xBF88C1E0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF10bits_t;
extern volatile __C2RXF10bits_t C2RXF10bits __asm__ ("C2RXF10") __attribute__((section("sfrs"), address(0xBF88C1E0)));
extern volatile uint32_t C2RXF10CLR __attribute__((section("sfrs"),address(0xBF88C1E4)));
extern volatile uint32_t C2RXF10SET __attribute__((section("sfrs"),address(0xBF88C1E8)));
extern volatile uint32_t C2RXF10INV __attribute__((section("sfrs"),address(0xBF88C1EC)));

extern volatile uint32_t C2RXF11 __attribute__((section("sfrs"), address(0xBF88C1F0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF11bits_t;
extern volatile __C2RXF11bits_t C2RXF11bits __asm__ ("C2RXF11") __attribute__((section("sfrs"), address(0xBF88C1F0)));
extern volatile uint32_t C2RXF11CLR __attribute__((section("sfrs"),address(0xBF88C1F4)));
extern volatile uint32_t C2RXF11SET __attribute__((section("sfrs"),address(0xBF88C1F8)));
extern volatile uint32_t C2RXF11INV __attribute__((section("sfrs"),address(0xBF88C1FC)));

extern volatile uint32_t C2RXF12 __attribute__((section("sfrs"), address(0xBF88C200)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF12bits_t;
extern volatile __C2RXF12bits_t C2RXF12bits __asm__ ("C2RXF12") __attribute__((section("sfrs"), address(0xBF88C200)));
extern volatile uint32_t C2RXF12CLR __attribute__((section("sfrs"),address(0xBF88C204)));
extern volatile uint32_t C2RXF12SET __attribute__((section("sfrs"),address(0xBF88C208)));
extern volatile uint32_t C2RXF12INV __attribute__((section("sfrs"),address(0xBF88C20C)));

extern volatile uint32_t C2RXF13 __attribute__((section("sfrs"), address(0xBF88C210)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF13bits_t;
extern volatile __C2RXF13bits_t C2RXF13bits __asm__ ("C2RXF13") __attribute__((section("sfrs"), address(0xBF88C210)));
extern volatile uint32_t C2RXF13CLR __attribute__((section("sfrs"),address(0xBF88C214)));
extern volatile uint32_t C2RXF13SET __attribute__((section("sfrs"),address(0xBF88C218)));
extern volatile uint32_t C2RXF13INV __attribute__((section("sfrs"),address(0xBF88C21C)));

extern volatile uint32_t C2RXF14 __attribute__((section("sfrs"), address(0xBF88C220)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF14bits_t;
extern volatile __C2RXF14bits_t C2RXF14bits __asm__ ("C2RXF14") __attribute__((section("sfrs"), address(0xBF88C220)));
extern volatile uint32_t C2RXF14CLR __attribute__((section("sfrs"),address(0xBF88C224)));
extern volatile uint32_t C2RXF14SET __attribute__((section("sfrs"),address(0xBF88C228)));
extern volatile uint32_t C2RXF14INV __attribute__((section("sfrs"),address(0xBF88C22C)));

extern volatile uint32_t C2RXF15 __attribute__((section("sfrs"), address(0xBF88C230)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF15bits_t;
extern volatile __C2RXF15bits_t C2RXF15bits __asm__ ("C2RXF15") __attribute__((section("sfrs"), address(0xBF88C230)));
extern volatile uint32_t C2RXF15CLR __attribute__((section("sfrs"),address(0xBF88C234)));
extern volatile uint32_t C2RXF15SET __attribute__((section("sfrs"),address(0xBF88C238)));
extern volatile uint32_t C2RXF15INV __attribute__((section("sfrs"),address(0xBF88C23C)));

extern volatile uint32_t C2RXF16 __attribute__((section("sfrs"), address(0xBF88C240)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF16bits_t;
extern volatile __C2RXF16bits_t C2RXF16bits __asm__ ("C2RXF16") __attribute__((section("sfrs"), address(0xBF88C240)));
extern volatile uint32_t C2RXF16CLR __attribute__((section("sfrs"),address(0xBF88C244)));
extern volatile uint32_t C2RXF16SET __attribute__((section("sfrs"),address(0xBF88C248)));
extern volatile uint32_t C2RXF16INV __attribute__((section("sfrs"),address(0xBF88C24C)));

extern volatile uint32_t C2RXF17 __attribute__((section("sfrs"), address(0xBF88C250)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF17bits_t;
extern volatile __C2RXF17bits_t C2RXF17bits __asm__ ("C2RXF17") __attribute__((section("sfrs"), address(0xBF88C250)));
extern volatile uint32_t C2RXF17CLR __attribute__((section("sfrs"),address(0xBF88C254)));
extern volatile uint32_t C2RXF17SET __attribute__((section("sfrs"),address(0xBF88C258)));
extern volatile uint32_t C2RXF17INV __attribute__((section("sfrs"),address(0xBF88C25C)));

extern volatile uint32_t C2RXF18 __attribute__((section("sfrs"), address(0xBF88C260)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF18bits_t;
extern volatile __C2RXF18bits_t C2RXF18bits __asm__ ("C2RXF18") __attribute__((section("sfrs"), address(0xBF88C260)));
extern volatile uint32_t C2RXF18CLR __attribute__((section("sfrs"),address(0xBF88C264)));
extern volatile uint32_t C2RXF18SET __attribute__((section("sfrs"),address(0xBF88C268)));
extern volatile uint32_t C2RXF18INV __attribute__((section("sfrs"),address(0xBF88C26C)));

extern volatile uint32_t C2RXF19 __attribute__((section("sfrs"), address(0xBF88C270)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF19bits_t;
extern volatile __C2RXF19bits_t C2RXF19bits __asm__ ("C2RXF19") __attribute__((section("sfrs"), address(0xBF88C270)));
extern volatile uint32_t C2RXF19CLR __attribute__((section("sfrs"),address(0xBF88C274)));
extern volatile uint32_t C2RXF19SET __attribute__((section("sfrs"),address(0xBF88C278)));
extern volatile uint32_t C2RXF19INV __attribute__((section("sfrs"),address(0xBF88C27C)));

extern volatile uint32_t C2RXF20 __attribute__((section("sfrs"), address(0xBF88C280)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF20bits_t;
extern volatile __C2RXF20bits_t C2RXF20bits __asm__ ("C2RXF20") __attribute__((section("sfrs"), address(0xBF88C280)));
extern volatile uint32_t C2RXF20CLR __attribute__((section("sfrs"),address(0xBF88C284)));
extern volatile uint32_t C2RXF20SET __attribute__((section("sfrs"),address(0xBF88C288)));
extern volatile uint32_t C2RXF20INV __attribute__((section("sfrs"),address(0xBF88C28C)));

extern volatile uint32_t C2RXF21 __attribute__((section("sfrs"), address(0xBF88C290)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF21bits_t;
extern volatile __C2RXF21bits_t C2RXF21bits __asm__ ("C2RXF21") __attribute__((section("sfrs"), address(0xBF88C290)));
extern volatile uint32_t C2RXF21CLR __attribute__((section("sfrs"),address(0xBF88C294)));
extern volatile uint32_t C2RXF21SET __attribute__((section("sfrs"),address(0xBF88C298)));
extern volatile uint32_t C2RXF21INV __attribute__((section("sfrs"),address(0xBF88C29C)));

extern volatile uint32_t C2RXF22 __attribute__((section("sfrs"), address(0xBF88C2A0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF22bits_t;
extern volatile __C2RXF22bits_t C2RXF22bits __asm__ ("C2RXF22") __attribute__((section("sfrs"), address(0xBF88C2A0)));
extern volatile uint32_t C2RXF22CLR __attribute__((section("sfrs"),address(0xBF88C2A4)));
extern volatile uint32_t C2RXF22SET __attribute__((section("sfrs"),address(0xBF88C2A8)));
extern volatile uint32_t C2RXF22INV __attribute__((section("sfrs"),address(0xBF88C2AC)));

extern volatile uint32_t C2RXF23 __attribute__((section("sfrs"), address(0xBF88C2B0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF23bits_t;
extern volatile __C2RXF23bits_t C2RXF23bits __asm__ ("C2RXF23") __attribute__((section("sfrs"), address(0xBF88C2B0)));
extern volatile uint32_t C2RXF23CLR __attribute__((section("sfrs"),address(0xBF88C2B4)));
extern volatile uint32_t C2RXF23SET __attribute__((section("sfrs"),address(0xBF88C2B8)));
extern volatile uint32_t C2RXF23INV __attribute__((section("sfrs"),address(0xBF88C2BC)));

extern volatile uint32_t C2RXF24 __attribute__((section("sfrs"), address(0xBF88C2C0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF24bits_t;
extern volatile __C2RXF24bits_t C2RXF24bits __asm__ ("C2RXF24") __attribute__((section("sfrs"), address(0xBF88C2C0)));
extern volatile uint32_t C2RXF24CLR __attribute__((section("sfrs"),address(0xBF88C2C4)));
extern volatile uint32_t C2RXF24SET __attribute__((section("sfrs"),address(0xBF88C2C8)));
extern volatile uint32_t C2RXF24INV __attribute__((section("sfrs"),address(0xBF88C2CC)));

extern volatile uint32_t C2RXF25 __attribute__((section("sfrs"), address(0xBF88C2D0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF25bits_t;
extern volatile __C2RXF25bits_t C2RXF25bits __asm__ ("C2RXF25") __attribute__((section("sfrs"), address(0xBF88C2D0)));
extern volatile uint32_t C2RXF25CLR __attribute__((section("sfrs"),address(0xBF88C2D4)));
extern volatile uint32_t C2RXF25SET __attribute__((section("sfrs"),address(0xBF88C2D8)));
extern volatile uint32_t C2RXF25INV __attribute__((section("sfrs"),address(0xBF88C2DC)));

extern volatile uint32_t C2RXF26 __attribute__((section("sfrs"), address(0xBF88C2E0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF26bits_t;
extern volatile __C2RXF26bits_t C2RXF26bits __asm__ ("C2RXF26") __attribute__((section("sfrs"), address(0xBF88C2E0)));
extern volatile uint32_t C2RXF26CLR __attribute__((section("sfrs"),address(0xBF88C2E4)));
extern volatile uint32_t C2RXF26SET __attribute__((section("sfrs"),address(0xBF88C2E8)));
extern volatile uint32_t C2RXF26INV __attribute__((section("sfrs"),address(0xBF88C2EC)));

extern volatile uint32_t C2RXF27 __attribute__((section("sfrs"), address(0xBF88C2F0)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF27bits_t;
extern volatile __C2RXF27bits_t C2RXF27bits __asm__ ("C2RXF27") __attribute__((section("sfrs"), address(0xBF88C2F0)));
extern volatile uint32_t C2RXF27CLR __attribute__((section("sfrs"),address(0xBF88C2F4)));
extern volatile uint32_t C2RXF27SET __attribute__((section("sfrs"),address(0xBF88C2F8)));
extern volatile uint32_t C2RXF27INV __attribute__((section("sfrs"),address(0xBF88C2FC)));

extern volatile uint32_t C2RXF28 __attribute__((section("sfrs"), address(0xBF88C300)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF28bits_t;
extern volatile __C2RXF28bits_t C2RXF28bits __asm__ ("C2RXF28") __attribute__((section("sfrs"), address(0xBF88C300)));
extern volatile uint32_t C2RXF28CLR __attribute__((section("sfrs"),address(0xBF88C304)));
extern volatile uint32_t C2RXF28SET __attribute__((section("sfrs"),address(0xBF88C308)));
extern volatile uint32_t C2RXF28INV __attribute__((section("sfrs"),address(0xBF88C30C)));

extern volatile uint32_t C2RXF29 __attribute__((section("sfrs"), address(0xBF88C310)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF29bits_t;
extern volatile __C2RXF29bits_t C2RXF29bits __asm__ ("C2RXF29") __attribute__((section("sfrs"), address(0xBF88C310)));
extern volatile uint32_t C2RXF29CLR __attribute__((section("sfrs"),address(0xBF88C314)));
extern volatile uint32_t C2RXF29SET __attribute__((section("sfrs"),address(0xBF88C318)));
extern volatile uint32_t C2RXF29INV __attribute__((section("sfrs"),address(0xBF88C31C)));

extern volatile uint32_t C2RXF30 __attribute__((section("sfrs"), address(0xBF88C320)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF30bits_t;
extern volatile __C2RXF30bits_t C2RXF30bits __asm__ ("C2RXF30") __attribute__((section("sfrs"), address(0xBF88C320)));
extern volatile uint32_t C2RXF30CLR __attribute__((section("sfrs"),address(0xBF88C324)));
extern volatile uint32_t C2RXF30SET __attribute__((section("sfrs"),address(0xBF88C328)));
extern volatile uint32_t C2RXF30INV __attribute__((section("sfrs"),address(0xBF88C32C)));

extern volatile uint32_t C2RXF31 __attribute__((section("sfrs"), address(0xBF88C330)));
typedef union {
  struct {
    uint32_t EID:18;
    uint32_t :1;
    uint32_t EXID:1;
    uint32_t :1;
    uint32_t SID:11;
  };
  struct {
    uint32_t w:32;
  };
} __C2RXF31bits_t;
extern volatile __C2RXF31bits_t C2RXF31bits __asm__ ("C2RXF31") __attribute__((section("sfrs"), address(0xBF88C330)));
extern volatile uint32_t C2RXF31CLR __attribute__((section("sfrs"),address(0xBF88C334)));
extern volatile uint32_t C2RXF31SET __attribute__((section("sfrs"),address(0xBF88C338)));
extern volatile uint32_t C2RXF31INV __attribute__((section("sfrs"),address(0xBF88C33C)));

extern volatile uint32_t C2FIFOBA __attribute__((section("sfrs"), address(0xBF88C340)));
extern volatile uint32_t C2FIFOBACLR __attribute__((section("sfrs"),address(0xBF88C344)));
extern volatile uint32_t C2FIFOBASET __attribute__((section("sfrs"),address(0xBF88C348)));
extern volatile uint32_t C2FIFOBAINV __attribute__((section("sfrs"),address(0xBF88C34C)));

extern volatile uint32_t C2FIFOCON0 __attribute__((section("sfrs"), address(0xBF88C350)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON0bits_t;
extern volatile __C2FIFOCON0bits_t C2FIFOCON0bits __asm__ ("C2FIFOCON0") __attribute__((section("sfrs"), address(0xBF88C350)));
extern volatile uint32_t C2FIFOCON0CLR __attribute__((section("sfrs"),address(0xBF88C354)));
extern volatile uint32_t C2FIFOCON0SET __attribute__((section("sfrs"),address(0xBF88C358)));
extern volatile uint32_t C2FIFOCON0INV __attribute__((section("sfrs"),address(0xBF88C35C)));

extern volatile uint32_t C2FIFOINT0 __attribute__((section("sfrs"), address(0xBF88C360)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT0bits_t;
extern volatile __C2FIFOINT0bits_t C2FIFOINT0bits __asm__ ("C2FIFOINT0") __attribute__((section("sfrs"), address(0xBF88C360)));
extern volatile uint32_t C2FIFOINT0CLR __attribute__((section("sfrs"),address(0xBF88C364)));
extern volatile uint32_t C2FIFOINT0SET __attribute__((section("sfrs"),address(0xBF88C368)));
extern volatile uint32_t C2FIFOINT0INV __attribute__((section("sfrs"),address(0xBF88C36C)));

extern volatile uint32_t C2FIFOUA0 __attribute__((section("sfrs"), address(0xBF88C370)));
extern volatile uint32_t C2FIFOUA0CLR __attribute__((section("sfrs"),address(0xBF88C374)));
extern volatile uint32_t C2FIFOUA0SET __attribute__((section("sfrs"),address(0xBF88C378)));
extern volatile uint32_t C2FIFOUA0INV __attribute__((section("sfrs"),address(0xBF88C37C)));

extern volatile uint32_t C2FIFOCI0 __attribute__((section("sfrs"), address(0xBF88C380)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI0bits_t;
extern volatile __C2FIFOCI0bits_t C2FIFOCI0bits __asm__ ("C2FIFOCI0") __attribute__((section("sfrs"), address(0xBF88C380)));
extern volatile uint32_t C2FIFOCI0CLR __attribute__((section("sfrs"),address(0xBF88C384)));
extern volatile uint32_t C2FIFOCI0SET __attribute__((section("sfrs"),address(0xBF88C388)));
extern volatile uint32_t C2FIFOCI0INV __attribute__((section("sfrs"),address(0xBF88C38C)));

extern volatile uint32_t C2FIFOCON1 __attribute__((section("sfrs"), address(0xBF88C390)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON1bits_t;
extern volatile __C2FIFOCON1bits_t C2FIFOCON1bits __asm__ ("C2FIFOCON1") __attribute__((section("sfrs"), address(0xBF88C390)));
extern volatile uint32_t C2FIFOCON1CLR __attribute__((section("sfrs"),address(0xBF88C394)));
extern volatile uint32_t C2FIFOCON1SET __attribute__((section("sfrs"),address(0xBF88C398)));
extern volatile uint32_t C2FIFOCON1INV __attribute__((section("sfrs"),address(0xBF88C39C)));

extern volatile uint32_t C2FIFOINT1 __attribute__((section("sfrs"), address(0xBF88C3A0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT1bits_t;
extern volatile __C2FIFOINT1bits_t C2FIFOINT1bits __asm__ ("C2FIFOINT1") __attribute__((section("sfrs"), address(0xBF88C3A0)));
extern volatile uint32_t C2FIFOINT1CLR __attribute__((section("sfrs"),address(0xBF88C3A4)));
extern volatile uint32_t C2FIFOINT1SET __attribute__((section("sfrs"),address(0xBF88C3A8)));
extern volatile uint32_t C2FIFOINT1INV __attribute__((section("sfrs"),address(0xBF88C3AC)));

extern volatile uint32_t C2FIFOUA1 __attribute__((section("sfrs"), address(0xBF88C3B0)));
extern volatile uint32_t C2FIFOUA1CLR __attribute__((section("sfrs"),address(0xBF88C3B4)));
extern volatile uint32_t C2FIFOUA1SET __attribute__((section("sfrs"),address(0xBF88C3B8)));
extern volatile uint32_t C2FIFOUA1INV __attribute__((section("sfrs"),address(0xBF88C3BC)));

extern volatile uint32_t C2FIFOCI1 __attribute__((section("sfrs"), address(0xBF88C3C0)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI1bits_t;
extern volatile __C2FIFOCI1bits_t C2FIFOCI1bits __asm__ ("C2FIFOCI1") __attribute__((section("sfrs"), address(0xBF88C3C0)));
extern volatile uint32_t C2FIFOCI1CLR __attribute__((section("sfrs"),address(0xBF88C3C4)));
extern volatile uint32_t C2FIFOCI1SET __attribute__((section("sfrs"),address(0xBF88C3C8)));
extern volatile uint32_t C2FIFOCI1INV __attribute__((section("sfrs"),address(0xBF88C3CC)));

extern volatile uint32_t C2FIFOCON2 __attribute__((section("sfrs"), address(0xBF88C3D0)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON2bits_t;
extern volatile __C2FIFOCON2bits_t C2FIFOCON2bits __asm__ ("C2FIFOCON2") __attribute__((section("sfrs"), address(0xBF88C3D0)));
extern volatile uint32_t C2FIFOCON2CLR __attribute__((section("sfrs"),address(0xBF88C3D4)));
extern volatile uint32_t C2FIFOCON2SET __attribute__((section("sfrs"),address(0xBF88C3D8)));
extern volatile uint32_t C2FIFOCON2INV __attribute__((section("sfrs"),address(0xBF88C3DC)));

extern volatile uint32_t C2FIFOINT2 __attribute__((section("sfrs"), address(0xBF88C3E0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT2bits_t;
extern volatile __C2FIFOINT2bits_t C2FIFOINT2bits __asm__ ("C2FIFOINT2") __attribute__((section("sfrs"), address(0xBF88C3E0)));
extern volatile uint32_t C2FIFOINT2CLR __attribute__((section("sfrs"),address(0xBF88C3E4)));
extern volatile uint32_t C2FIFOINT2SET __attribute__((section("sfrs"),address(0xBF88C3E8)));
extern volatile uint32_t C2FIFOINT2INV __attribute__((section("sfrs"),address(0xBF88C3EC)));

extern volatile uint32_t C2FIFOUA2 __attribute__((section("sfrs"), address(0xBF88C3F0)));
extern volatile uint32_t C2FIFOUA2CLR __attribute__((section("sfrs"),address(0xBF88C3F4)));
extern volatile uint32_t C2FIFOUA2SET __attribute__((section("sfrs"),address(0xBF88C3F8)));
extern volatile uint32_t C2FIFOUA2INV __attribute__((section("sfrs"),address(0xBF88C3FC)));

extern volatile uint32_t C2FIFOCI2 __attribute__((section("sfrs"), address(0xBF88C400)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI2bits_t;
extern volatile __C2FIFOCI2bits_t C2FIFOCI2bits __asm__ ("C2FIFOCI2") __attribute__((section("sfrs"), address(0xBF88C400)));
extern volatile uint32_t C2FIFOCI2CLR __attribute__((section("sfrs"),address(0xBF88C404)));
extern volatile uint32_t C2FIFOCI2SET __attribute__((section("sfrs"),address(0xBF88C408)));
extern volatile uint32_t C2FIFOCI2INV __attribute__((section("sfrs"),address(0xBF88C40C)));

extern volatile uint32_t C2FIFOCON3 __attribute__((section("sfrs"), address(0xBF88C410)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON3bits_t;
extern volatile __C2FIFOCON3bits_t C2FIFOCON3bits __asm__ ("C2FIFOCON3") __attribute__((section("sfrs"), address(0xBF88C410)));
extern volatile uint32_t C2FIFOCON3CLR __attribute__((section("sfrs"),address(0xBF88C414)));
extern volatile uint32_t C2FIFOCON3SET __attribute__((section("sfrs"),address(0xBF88C418)));
extern volatile uint32_t C2FIFOCON3INV __attribute__((section("sfrs"),address(0xBF88C41C)));

extern volatile uint32_t C2FIFOINT3 __attribute__((section("sfrs"), address(0xBF88C420)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT3bits_t;
extern volatile __C2FIFOINT3bits_t C2FIFOINT3bits __asm__ ("C2FIFOINT3") __attribute__((section("sfrs"), address(0xBF88C420)));
extern volatile uint32_t C2FIFOINT3CLR __attribute__((section("sfrs"),address(0xBF88C424)));
extern volatile uint32_t C2FIFOINT3SET __attribute__((section("sfrs"),address(0xBF88C428)));
extern volatile uint32_t C2FIFOINT3INV __attribute__((section("sfrs"),address(0xBF88C42C)));

extern volatile uint32_t C2FIFOUA3 __attribute__((section("sfrs"), address(0xBF88C430)));
extern volatile uint32_t C2FIFOUA3CLR __attribute__((section("sfrs"),address(0xBF88C434)));
extern volatile uint32_t C2FIFOUA3SET __attribute__((section("sfrs"),address(0xBF88C438)));
extern volatile uint32_t C2FIFOUA3INV __attribute__((section("sfrs"),address(0xBF88C43C)));

extern volatile uint32_t C2FIFOCI3 __attribute__((section("sfrs"), address(0xBF88C440)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI3bits_t;
extern volatile __C2FIFOCI3bits_t C2FIFOCI3bits __asm__ ("C2FIFOCI3") __attribute__((section("sfrs"), address(0xBF88C440)));
extern volatile uint32_t C2FIFOCI3CLR __attribute__((section("sfrs"),address(0xBF88C444)));
extern volatile uint32_t C2FIFOCI3SET __attribute__((section("sfrs"),address(0xBF88C448)));
extern volatile uint32_t C2FIFOCI3INV __attribute__((section("sfrs"),address(0xBF88C44C)));

extern volatile uint32_t C2FIFOCON4 __attribute__((section("sfrs"), address(0xBF88C450)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON4bits_t;
extern volatile __C2FIFOCON4bits_t C2FIFOCON4bits __asm__ ("C2FIFOCON4") __attribute__((section("sfrs"), address(0xBF88C450)));
extern volatile uint32_t C2FIFOCON4CLR __attribute__((section("sfrs"),address(0xBF88C454)));
extern volatile uint32_t C2FIFOCON4SET __attribute__((section("sfrs"),address(0xBF88C458)));
extern volatile uint32_t C2FIFOCON4INV __attribute__((section("sfrs"),address(0xBF88C45C)));

extern volatile uint32_t C2FIFOINT4 __attribute__((section("sfrs"), address(0xBF88C460)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT4bits_t;
extern volatile __C2FIFOINT4bits_t C2FIFOINT4bits __asm__ ("C2FIFOINT4") __attribute__((section("sfrs"), address(0xBF88C460)));
extern volatile uint32_t C2FIFOINT4CLR __attribute__((section("sfrs"),address(0xBF88C464)));
extern volatile uint32_t C2FIFOINT4SET __attribute__((section("sfrs"),address(0xBF88C468)));
extern volatile uint32_t C2FIFOINT4INV __attribute__((section("sfrs"),address(0xBF88C46C)));

extern volatile uint32_t C2FIFOUA4 __attribute__((section("sfrs"), address(0xBF88C470)));
extern volatile uint32_t C2FIFOUA4CLR __attribute__((section("sfrs"),address(0xBF88C474)));
extern volatile uint32_t C2FIFOUA4SET __attribute__((section("sfrs"),address(0xBF88C478)));
extern volatile uint32_t C2FIFOUA4INV __attribute__((section("sfrs"),address(0xBF88C47C)));

extern volatile uint32_t C2FIFOCI4 __attribute__((section("sfrs"), address(0xBF88C480)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI4bits_t;
extern volatile __C2FIFOCI4bits_t C2FIFOCI4bits __asm__ ("C2FIFOCI4") __attribute__((section("sfrs"), address(0xBF88C480)));
extern volatile uint32_t C2FIFOCI4CLR __attribute__((section("sfrs"),address(0xBF88C484)));
extern volatile uint32_t C2FIFOCI4SET __attribute__((section("sfrs"),address(0xBF88C488)));
extern volatile uint32_t C2FIFOCI4INV __attribute__((section("sfrs"),address(0xBF88C48C)));

extern volatile uint32_t C2FIFOCON5 __attribute__((section("sfrs"), address(0xBF88C490)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON5bits_t;
extern volatile __C2FIFOCON5bits_t C2FIFOCON5bits __asm__ ("C2FIFOCON5") __attribute__((section("sfrs"), address(0xBF88C490)));
extern volatile uint32_t C2FIFOCON5CLR __attribute__((section("sfrs"),address(0xBF88C494)));
extern volatile uint32_t C2FIFOCON5SET __attribute__((section("sfrs"),address(0xBF88C498)));
extern volatile uint32_t C2FIFOCON5INV __attribute__((section("sfrs"),address(0xBF88C49C)));

extern volatile uint32_t C2FIFOINT5 __attribute__((section("sfrs"), address(0xBF88C4A0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT5bits_t;
extern volatile __C2FIFOINT5bits_t C2FIFOINT5bits __asm__ ("C2FIFOINT5") __attribute__((section("sfrs"), address(0xBF88C4A0)));
extern volatile uint32_t C2FIFOINT5CLR __attribute__((section("sfrs"),address(0xBF88C4A4)));
extern volatile uint32_t C2FIFOINT5SET __attribute__((section("sfrs"),address(0xBF88C4A8)));
extern volatile uint32_t C2FIFOINT5INV __attribute__((section("sfrs"),address(0xBF88C4AC)));

extern volatile uint32_t C2FIFOUA5 __attribute__((section("sfrs"), address(0xBF88C4B0)));
extern volatile uint32_t C2FIFOUA5CLR __attribute__((section("sfrs"),address(0xBF88C4B4)));
extern volatile uint32_t C2FIFOUA5SET __attribute__((section("sfrs"),address(0xBF88C4B8)));
extern volatile uint32_t C2FIFOUA5INV __attribute__((section("sfrs"),address(0xBF88C4BC)));

extern volatile uint32_t C2FIFOCI5 __attribute__((section("sfrs"), address(0xBF88C4C0)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI5bits_t;
extern volatile __C2FIFOCI5bits_t C2FIFOCI5bits __asm__ ("C2FIFOCI5") __attribute__((section("sfrs"), address(0xBF88C4C0)));
extern volatile uint32_t C2FIFOCI5CLR __attribute__((section("sfrs"),address(0xBF88C4C4)));
extern volatile uint32_t C2FIFOCI5SET __attribute__((section("sfrs"),address(0xBF88C4C8)));
extern volatile uint32_t C2FIFOCI5INV __attribute__((section("sfrs"),address(0xBF88C4CC)));

extern volatile uint32_t C2FIFOCON6 __attribute__((section("sfrs"), address(0xBF88C4D0)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON6bits_t;
extern volatile __C2FIFOCON6bits_t C2FIFOCON6bits __asm__ ("C2FIFOCON6") __attribute__((section("sfrs"), address(0xBF88C4D0)));
extern volatile uint32_t C2FIFOCON6CLR __attribute__((section("sfrs"),address(0xBF88C4D4)));
extern volatile uint32_t C2FIFOCON6SET __attribute__((section("sfrs"),address(0xBF88C4D8)));
extern volatile uint32_t C2FIFOCON6INV __attribute__((section("sfrs"),address(0xBF88C4DC)));

extern volatile uint32_t C2FIFOINT6 __attribute__((section("sfrs"), address(0xBF88C4E0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT6bits_t;
extern volatile __C2FIFOINT6bits_t C2FIFOINT6bits __asm__ ("C2FIFOINT6") __attribute__((section("sfrs"), address(0xBF88C4E0)));
extern volatile uint32_t C2FIFOINT6CLR __attribute__((section("sfrs"),address(0xBF88C4E4)));
extern volatile uint32_t C2FIFOINT6SET __attribute__((section("sfrs"),address(0xBF88C4E8)));
extern volatile uint32_t C2FIFOINT6INV __attribute__((section("sfrs"),address(0xBF88C4EC)));

extern volatile uint32_t C2FIFOUA6 __attribute__((section("sfrs"), address(0xBF88C4F0)));
extern volatile uint32_t C2FIFOUA6CLR __attribute__((section("sfrs"),address(0xBF88C4F4)));
extern volatile uint32_t C2FIFOUA6SET __attribute__((section("sfrs"),address(0xBF88C4F8)));
extern volatile uint32_t C2FIFOUA6INV __attribute__((section("sfrs"),address(0xBF88C4FC)));

extern volatile uint32_t C2FIFOCI6 __attribute__((section("sfrs"), address(0xBF88C500)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI6bits_t;
extern volatile __C2FIFOCI6bits_t C2FIFOCI6bits __asm__ ("C2FIFOCI6") __attribute__((section("sfrs"), address(0xBF88C500)));
extern volatile uint32_t C2FIFOCI6CLR __attribute__((section("sfrs"),address(0xBF88C504)));
extern volatile uint32_t C2FIFOCI6SET __attribute__((section("sfrs"),address(0xBF88C508)));
extern volatile uint32_t C2FIFOCI6INV __attribute__((section("sfrs"),address(0xBF88C50C)));

extern volatile uint32_t C2FIFOCON7 __attribute__((section("sfrs"), address(0xBF88C510)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON7bits_t;
extern volatile __C2FIFOCON7bits_t C2FIFOCON7bits __asm__ ("C2FIFOCON7") __attribute__((section("sfrs"), address(0xBF88C510)));
extern volatile uint32_t C2FIFOCON7CLR __attribute__((section("sfrs"),address(0xBF88C514)));
extern volatile uint32_t C2FIFOCON7SET __attribute__((section("sfrs"),address(0xBF88C518)));
extern volatile uint32_t C2FIFOCON7INV __attribute__((section("sfrs"),address(0xBF88C51C)));

extern volatile uint32_t C2FIFOINT7 __attribute__((section("sfrs"), address(0xBF88C520)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT7bits_t;
extern volatile __C2FIFOINT7bits_t C2FIFOINT7bits __asm__ ("C2FIFOINT7") __attribute__((section("sfrs"), address(0xBF88C520)));
extern volatile uint32_t C2FIFOINT7CLR __attribute__((section("sfrs"),address(0xBF88C524)));
extern volatile uint32_t C2FIFOINT7SET __attribute__((section("sfrs"),address(0xBF88C528)));
extern volatile uint32_t C2FIFOINT7INV __attribute__((section("sfrs"),address(0xBF88C52C)));

extern volatile uint32_t C2FIFOUA7 __attribute__((section("sfrs"), address(0xBF88C530)));
extern volatile uint32_t C2FIFOUA7CLR __attribute__((section("sfrs"),address(0xBF88C534)));
extern volatile uint32_t C2FIFOUA7SET __attribute__((section("sfrs"),address(0xBF88C538)));
extern volatile uint32_t C2FIFOUA7INV __attribute__((section("sfrs"),address(0xBF88C53C)));

extern volatile uint32_t C2FIFOCI7 __attribute__((section("sfrs"), address(0xBF88C540)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI7bits_t;
extern volatile __C2FIFOCI7bits_t C2FIFOCI7bits __asm__ ("C2FIFOCI7") __attribute__((section("sfrs"), address(0xBF88C540)));
extern volatile uint32_t C2FIFOCI7CLR __attribute__((section("sfrs"),address(0xBF88C544)));
extern volatile uint32_t C2FIFOCI7SET __attribute__((section("sfrs"),address(0xBF88C548)));
extern volatile uint32_t C2FIFOCI7INV __attribute__((section("sfrs"),address(0xBF88C54C)));

extern volatile uint32_t C2FIFOCON8 __attribute__((section("sfrs"), address(0xBF88C550)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON8bits_t;
extern volatile __C2FIFOCON8bits_t C2FIFOCON8bits __asm__ ("C2FIFOCON8") __attribute__((section("sfrs"), address(0xBF88C550)));
extern volatile uint32_t C2FIFOCON8CLR __attribute__((section("sfrs"),address(0xBF88C554)));
extern volatile uint32_t C2FIFOCON8SET __attribute__((section("sfrs"),address(0xBF88C558)));
extern volatile uint32_t C2FIFOCON8INV __attribute__((section("sfrs"),address(0xBF88C55C)));

extern volatile uint32_t C2FIFOINT8 __attribute__((section("sfrs"), address(0xBF88C560)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT8bits_t;
extern volatile __C2FIFOINT8bits_t C2FIFOINT8bits __asm__ ("C2FIFOINT8") __attribute__((section("sfrs"), address(0xBF88C560)));
extern volatile uint32_t C2FIFOINT8CLR __attribute__((section("sfrs"),address(0xBF88C564)));
extern volatile uint32_t C2FIFOINT8SET __attribute__((section("sfrs"),address(0xBF88C568)));
extern volatile uint32_t C2FIFOINT8INV __attribute__((section("sfrs"),address(0xBF88C56C)));

extern volatile uint32_t C2FIFOUA8 __attribute__((section("sfrs"), address(0xBF88C570)));
extern volatile uint32_t C2FIFOUA8CLR __attribute__((section("sfrs"),address(0xBF88C574)));
extern volatile uint32_t C2FIFOUA8SET __attribute__((section("sfrs"),address(0xBF88C578)));
extern volatile uint32_t C2FIFOUA8INV __attribute__((section("sfrs"),address(0xBF88C57C)));

extern volatile uint32_t C2FIFOCI8 __attribute__((section("sfrs"), address(0xBF88C580)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI8bits_t;
extern volatile __C2FIFOCI8bits_t C2FIFOCI8bits __asm__ ("C2FIFOCI8") __attribute__((section("sfrs"), address(0xBF88C580)));
extern volatile uint32_t C2FIFOCI8CLR __attribute__((section("sfrs"),address(0xBF88C584)));
extern volatile uint32_t C2FIFOCI8SET __attribute__((section("sfrs"),address(0xBF88C588)));
extern volatile uint32_t C2FIFOCI8INV __attribute__((section("sfrs"),address(0xBF88C58C)));

extern volatile uint32_t C2FIFOCON9 __attribute__((section("sfrs"), address(0xBF88C590)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON9bits_t;
extern volatile __C2FIFOCON9bits_t C2FIFOCON9bits __asm__ ("C2FIFOCON9") __attribute__((section("sfrs"), address(0xBF88C590)));
extern volatile uint32_t C2FIFOCON9CLR __attribute__((section("sfrs"),address(0xBF88C594)));
extern volatile uint32_t C2FIFOCON9SET __attribute__((section("sfrs"),address(0xBF88C598)));
extern volatile uint32_t C2FIFOCON9INV __attribute__((section("sfrs"),address(0xBF88C59C)));

extern volatile uint32_t C2FIFOINT9 __attribute__((section("sfrs"), address(0xBF88C5A0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT9bits_t;
extern volatile __C2FIFOINT9bits_t C2FIFOINT9bits __asm__ ("C2FIFOINT9") __attribute__((section("sfrs"), address(0xBF88C5A0)));
extern volatile uint32_t C2FIFOINT9CLR __attribute__((section("sfrs"),address(0xBF88C5A4)));
extern volatile uint32_t C2FIFOINT9SET __attribute__((section("sfrs"),address(0xBF88C5A8)));
extern volatile uint32_t C2FIFOINT9INV __attribute__((section("sfrs"),address(0xBF88C5AC)));

extern volatile uint32_t C2FIFOUA9 __attribute__((section("sfrs"), address(0xBF88C5B0)));
extern volatile uint32_t C2FIFOUA9CLR __attribute__((section("sfrs"),address(0xBF88C5B4)));
extern volatile uint32_t C2FIFOUA9SET __attribute__((section("sfrs"),address(0xBF88C5B8)));
extern volatile uint32_t C2FIFOUA9INV __attribute__((section("sfrs"),address(0xBF88C5BC)));

extern volatile uint32_t C2FIFOCI9 __attribute__((section("sfrs"), address(0xBF88C5C0)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI9bits_t;
extern volatile __C2FIFOCI9bits_t C2FIFOCI9bits __asm__ ("C2FIFOCI9") __attribute__((section("sfrs"), address(0xBF88C5C0)));
extern volatile uint32_t C2FIFOCI9CLR __attribute__((section("sfrs"),address(0xBF88C5C4)));
extern volatile uint32_t C2FIFOCI9SET __attribute__((section("sfrs"),address(0xBF88C5C8)));
extern volatile uint32_t C2FIFOCI9INV __attribute__((section("sfrs"),address(0xBF88C5CC)));

extern volatile uint32_t C2FIFOCON10 __attribute__((section("sfrs"), address(0xBF88C5D0)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON10bits_t;
extern volatile __C2FIFOCON10bits_t C2FIFOCON10bits __asm__ ("C2FIFOCON10") __attribute__((section("sfrs"), address(0xBF88C5D0)));
extern volatile uint32_t C2FIFOCON10CLR __attribute__((section("sfrs"),address(0xBF88C5D4)));
extern volatile uint32_t C2FIFOCON10SET __attribute__((section("sfrs"),address(0xBF88C5D8)));
extern volatile uint32_t C2FIFOCON10INV __attribute__((section("sfrs"),address(0xBF88C5DC)));

extern volatile uint32_t C2FIFOINT10 __attribute__((section("sfrs"), address(0xBF88C5E0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT10bits_t;
extern volatile __C2FIFOINT10bits_t C2FIFOINT10bits __asm__ ("C2FIFOINT10") __attribute__((section("sfrs"), address(0xBF88C5E0)));
extern volatile uint32_t C2FIFOINT10CLR __attribute__((section("sfrs"),address(0xBF88C5E4)));
extern volatile uint32_t C2FIFOINT10SET __attribute__((section("sfrs"),address(0xBF88C5E8)));
extern volatile uint32_t C2FIFOINT10INV __attribute__((section("sfrs"),address(0xBF88C5EC)));

extern volatile uint32_t C2FIFOUA10 __attribute__((section("sfrs"), address(0xBF88C5F0)));
extern volatile uint32_t C2FIFOUA10CLR __attribute__((section("sfrs"),address(0xBF88C5F4)));
extern volatile uint32_t C2FIFOUA10SET __attribute__((section("sfrs"),address(0xBF88C5F8)));
extern volatile uint32_t C2FIFOUA10INV __attribute__((section("sfrs"),address(0xBF88C5FC)));

extern volatile uint32_t C2FIFOCI10 __attribute__((section("sfrs"), address(0xBF88C600)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI10bits_t;
extern volatile __C2FIFOCI10bits_t C2FIFOCI10bits __asm__ ("C2FIFOCI10") __attribute__((section("sfrs"), address(0xBF88C600)));
extern volatile uint32_t C2FIFOCI10CLR __attribute__((section("sfrs"),address(0xBF88C604)));
extern volatile uint32_t C2FIFOCI10SET __attribute__((section("sfrs"),address(0xBF88C608)));
extern volatile uint32_t C2FIFOCI10INV __attribute__((section("sfrs"),address(0xBF88C60C)));

extern volatile uint32_t C2FIFOCON11 __attribute__((section("sfrs"), address(0xBF88C610)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON11bits_t;
extern volatile __C2FIFOCON11bits_t C2FIFOCON11bits __asm__ ("C2FIFOCON11") __attribute__((section("sfrs"), address(0xBF88C610)));
extern volatile uint32_t C2FIFOCON11CLR __attribute__((section("sfrs"),address(0xBF88C614)));
extern volatile uint32_t C2FIFOCON11SET __attribute__((section("sfrs"),address(0xBF88C618)));
extern volatile uint32_t C2FIFOCON11INV __attribute__((section("sfrs"),address(0xBF88C61C)));

extern volatile uint32_t C2FIFOINT11 __attribute__((section("sfrs"), address(0xBF88C620)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT11bits_t;
extern volatile __C2FIFOINT11bits_t C2FIFOINT11bits __asm__ ("C2FIFOINT11") __attribute__((section("sfrs"), address(0xBF88C620)));
extern volatile uint32_t C2FIFOINT11CLR __attribute__((section("sfrs"),address(0xBF88C624)));
extern volatile uint32_t C2FIFOINT11SET __attribute__((section("sfrs"),address(0xBF88C628)));
extern volatile uint32_t C2FIFOINT11INV __attribute__((section("sfrs"),address(0xBF88C62C)));

extern volatile uint32_t C2FIFOUA11 __attribute__((section("sfrs"), address(0xBF88C630)));
extern volatile uint32_t C2FIFOUA11CLR __attribute__((section("sfrs"),address(0xBF88C634)));
extern volatile uint32_t C2FIFOUA11SET __attribute__((section("sfrs"),address(0xBF88C638)));
extern volatile uint32_t C2FIFOUA11INV __attribute__((section("sfrs"),address(0xBF88C63C)));

extern volatile uint32_t C2FIFOCI11 __attribute__((section("sfrs"), address(0xBF88C640)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI11bits_t;
extern volatile __C2FIFOCI11bits_t C2FIFOCI11bits __asm__ ("C2FIFOCI11") __attribute__((section("sfrs"), address(0xBF88C640)));
extern volatile uint32_t C2FIFOCI11CLR __attribute__((section("sfrs"),address(0xBF88C644)));
extern volatile uint32_t C2FIFOCI11SET __attribute__((section("sfrs"),address(0xBF88C648)));
extern volatile uint32_t C2FIFOCI11INV __attribute__((section("sfrs"),address(0xBF88C64C)));

extern volatile uint32_t C2FIFOCON12 __attribute__((section("sfrs"), address(0xBF88C650)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON12bits_t;
extern volatile __C2FIFOCON12bits_t C2FIFOCON12bits __asm__ ("C2FIFOCON12") __attribute__((section("sfrs"), address(0xBF88C650)));
extern volatile uint32_t C2FIFOCON12CLR __attribute__((section("sfrs"),address(0xBF88C654)));
extern volatile uint32_t C2FIFOCON12SET __attribute__((section("sfrs"),address(0xBF88C658)));
extern volatile uint32_t C2FIFOCON12INV __attribute__((section("sfrs"),address(0xBF88C65C)));

extern volatile uint32_t C2FIFOINT12 __attribute__((section("sfrs"), address(0xBF88C660)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT12bits_t;
extern volatile __C2FIFOINT12bits_t C2FIFOINT12bits __asm__ ("C2FIFOINT12") __attribute__((section("sfrs"), address(0xBF88C660)));
extern volatile uint32_t C2FIFOINT12CLR __attribute__((section("sfrs"),address(0xBF88C664)));
extern volatile uint32_t C2FIFOINT12SET __attribute__((section("sfrs"),address(0xBF88C668)));
extern volatile uint32_t C2FIFOINT12INV __attribute__((section("sfrs"),address(0xBF88C66C)));

extern volatile uint32_t C2FIFOUA12 __attribute__((section("sfrs"), address(0xBF88C670)));
extern volatile uint32_t C2FIFOUA12CLR __attribute__((section("sfrs"),address(0xBF88C674)));
extern volatile uint32_t C2FIFOUA12SET __attribute__((section("sfrs"),address(0xBF88C678)));
extern volatile uint32_t C2FIFOUA12INV __attribute__((section("sfrs"),address(0xBF88C67C)));

extern volatile uint32_t C2FIFOCI12 __attribute__((section("sfrs"), address(0xBF88C680)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI12bits_t;
extern volatile __C2FIFOCI12bits_t C2FIFOCI12bits __asm__ ("C2FIFOCI12") __attribute__((section("sfrs"), address(0xBF88C680)));
extern volatile uint32_t C2FIFOCI12CLR __attribute__((section("sfrs"),address(0xBF88C684)));
extern volatile uint32_t C2FIFOCI12SET __attribute__((section("sfrs"),address(0xBF88C688)));
extern volatile uint32_t C2FIFOCI12INV __attribute__((section("sfrs"),address(0xBF88C68C)));

extern volatile uint32_t C2FIFOCON13 __attribute__((section("sfrs"), address(0xBF88C690)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON13bits_t;
extern volatile __C2FIFOCON13bits_t C2FIFOCON13bits __asm__ ("C2FIFOCON13") __attribute__((section("sfrs"), address(0xBF88C690)));
extern volatile uint32_t C2FIFOCON13CLR __attribute__((section("sfrs"),address(0xBF88C694)));
extern volatile uint32_t C2FIFOCON13SET __attribute__((section("sfrs"),address(0xBF88C698)));
extern volatile uint32_t C2FIFOCON13INV __attribute__((section("sfrs"),address(0xBF88C69C)));

extern volatile uint32_t C2FIFOINT13 __attribute__((section("sfrs"), address(0xBF88C6A0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT13bits_t;
extern volatile __C2FIFOINT13bits_t C2FIFOINT13bits __asm__ ("C2FIFOINT13") __attribute__((section("sfrs"), address(0xBF88C6A0)));
extern volatile uint32_t C2FIFOINT13CLR __attribute__((section("sfrs"),address(0xBF88C6A4)));
extern volatile uint32_t C2FIFOINT13SET __attribute__((section("sfrs"),address(0xBF88C6A8)));
extern volatile uint32_t C2FIFOINT13INV __attribute__((section("sfrs"),address(0xBF88C6AC)));

extern volatile uint32_t C2FIFOUA13 __attribute__((section("sfrs"), address(0xBF88C6B0)));
extern volatile uint32_t C2FIFOUA13CLR __attribute__((section("sfrs"),address(0xBF88C6B4)));
extern volatile uint32_t C2FIFOUA13SET __attribute__((section("sfrs"),address(0xBF88C6B8)));
extern volatile uint32_t C2FIFOUA13INV __attribute__((section("sfrs"),address(0xBF88C6BC)));

extern volatile uint32_t C2FIFOCI13 __attribute__((section("sfrs"), address(0xBF88C6C0)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI13bits_t;
extern volatile __C2FIFOCI13bits_t C2FIFOCI13bits __asm__ ("C2FIFOCI13") __attribute__((section("sfrs"), address(0xBF88C6C0)));
extern volatile uint32_t C2FIFOCI13CLR __attribute__((section("sfrs"),address(0xBF88C6C4)));
extern volatile uint32_t C2FIFOCI13SET __attribute__((section("sfrs"),address(0xBF88C6C8)));
extern volatile uint32_t C2FIFOCI13INV __attribute__((section("sfrs"),address(0xBF88C6CC)));

extern volatile uint32_t C2FIFOCON14 __attribute__((section("sfrs"), address(0xBF88C6D0)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON14bits_t;
extern volatile __C2FIFOCON14bits_t C2FIFOCON14bits __asm__ ("C2FIFOCON14") __attribute__((section("sfrs"), address(0xBF88C6D0)));
extern volatile uint32_t C2FIFOCON14CLR __attribute__((section("sfrs"),address(0xBF88C6D4)));
extern volatile uint32_t C2FIFOCON14SET __attribute__((section("sfrs"),address(0xBF88C6D8)));
extern volatile uint32_t C2FIFOCON14INV __attribute__((section("sfrs"),address(0xBF88C6DC)));

extern volatile uint32_t C2FIFOINT14 __attribute__((section("sfrs"), address(0xBF88C6E0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT14bits_t;
extern volatile __C2FIFOINT14bits_t C2FIFOINT14bits __asm__ ("C2FIFOINT14") __attribute__((section("sfrs"), address(0xBF88C6E0)));
extern volatile uint32_t C2FIFOINT14CLR __attribute__((section("sfrs"),address(0xBF88C6E4)));
extern volatile uint32_t C2FIFOINT14SET __attribute__((section("sfrs"),address(0xBF88C6E8)));
extern volatile uint32_t C2FIFOINT14INV __attribute__((section("sfrs"),address(0xBF88C6EC)));

extern volatile uint32_t C2FIFOUA14 __attribute__((section("sfrs"), address(0xBF88C6F0)));
extern volatile uint32_t C2FIFOUA14CLR __attribute__((section("sfrs"),address(0xBF88C6F4)));
extern volatile uint32_t C2FIFOUA14SET __attribute__((section("sfrs"),address(0xBF88C6F8)));
extern volatile uint32_t C2FIFOUA14INV __attribute__((section("sfrs"),address(0xBF88C6FC)));

extern volatile uint32_t C2FIFOCI14 __attribute__((section("sfrs"), address(0xBF88C700)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI14bits_t;
extern volatile __C2FIFOCI14bits_t C2FIFOCI14bits __asm__ ("C2FIFOCI14") __attribute__((section("sfrs"), address(0xBF88C700)));
extern volatile uint32_t C2FIFOCI14CLR __attribute__((section("sfrs"),address(0xBF88C704)));
extern volatile uint32_t C2FIFOCI14SET __attribute__((section("sfrs"),address(0xBF88C708)));
extern volatile uint32_t C2FIFOCI14INV __attribute__((section("sfrs"),address(0xBF88C70C)));

extern volatile uint32_t C2FIFOCON15 __attribute__((section("sfrs"), address(0xBF88C710)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON15bits_t;
extern volatile __C2FIFOCON15bits_t C2FIFOCON15bits __asm__ ("C2FIFOCON15") __attribute__((section("sfrs"), address(0xBF88C710)));
extern volatile uint32_t C2FIFOCON15CLR __attribute__((section("sfrs"),address(0xBF88C714)));
extern volatile uint32_t C2FIFOCON15SET __attribute__((section("sfrs"),address(0xBF88C718)));
extern volatile uint32_t C2FIFOCON15INV __attribute__((section("sfrs"),address(0xBF88C71C)));

extern volatile uint32_t C2FIFOINT15 __attribute__((section("sfrs"), address(0xBF88C720)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT15bits_t;
extern volatile __C2FIFOINT15bits_t C2FIFOINT15bits __asm__ ("C2FIFOINT15") __attribute__((section("sfrs"), address(0xBF88C720)));
extern volatile uint32_t C2FIFOINT15CLR __attribute__((section("sfrs"),address(0xBF88C724)));
extern volatile uint32_t C2FIFOINT15SET __attribute__((section("sfrs"),address(0xBF88C728)));
extern volatile uint32_t C2FIFOINT15INV __attribute__((section("sfrs"),address(0xBF88C72C)));

extern volatile uint32_t C2FIFOUA15 __attribute__((section("sfrs"), address(0xBF88C730)));
extern volatile uint32_t C2FIFOUA15CLR __attribute__((section("sfrs"),address(0xBF88C734)));
extern volatile uint32_t C2FIFOUA15SET __attribute__((section("sfrs"),address(0xBF88C738)));
extern volatile uint32_t C2FIFOUA15INV __attribute__((section("sfrs"),address(0xBF88C73C)));

extern volatile uint32_t C2FIFOCI15 __attribute__((section("sfrs"), address(0xBF88C740)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI15bits_t;
extern volatile __C2FIFOCI15bits_t C2FIFOCI15bits __asm__ ("C2FIFOCI15") __attribute__((section("sfrs"), address(0xBF88C740)));
extern volatile uint32_t C2FIFOCI15CLR __attribute__((section("sfrs"),address(0xBF88C744)));
extern volatile uint32_t C2FIFOCI15SET __attribute__((section("sfrs"),address(0xBF88C748)));
extern volatile uint32_t C2FIFOCI15INV __attribute__((section("sfrs"),address(0xBF88C74C)));

extern volatile uint32_t C2FIFOCON16 __attribute__((section("sfrs"), address(0xBF88C750)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON16bits_t;
extern volatile __C2FIFOCON16bits_t C2FIFOCON16bits __asm__ ("C2FIFOCON16") __attribute__((section("sfrs"), address(0xBF88C750)));
extern volatile uint32_t C2FIFOCON16CLR __attribute__((section("sfrs"),address(0xBF88C754)));
extern volatile uint32_t C2FIFOCON16SET __attribute__((section("sfrs"),address(0xBF88C758)));
extern volatile uint32_t C2FIFOCON16INV __attribute__((section("sfrs"),address(0xBF88C75C)));

extern volatile uint32_t C2FIFOINT16 __attribute__((section("sfrs"), address(0xBF88C760)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT16bits_t;
extern volatile __C2FIFOINT16bits_t C2FIFOINT16bits __asm__ ("C2FIFOINT16") __attribute__((section("sfrs"), address(0xBF88C760)));
extern volatile uint32_t C2FIFOINT16CLR __attribute__((section("sfrs"),address(0xBF88C764)));
extern volatile uint32_t C2FIFOINT16SET __attribute__((section("sfrs"),address(0xBF88C768)));
extern volatile uint32_t C2FIFOINT16INV __attribute__((section("sfrs"),address(0xBF88C76C)));

extern volatile uint32_t C2FIFOUA16 __attribute__((section("sfrs"), address(0xBF88C770)));
extern volatile uint32_t C2FIFOUA16CLR __attribute__((section("sfrs"),address(0xBF88C774)));
extern volatile uint32_t C2FIFOUA16SET __attribute__((section("sfrs"),address(0xBF88C778)));
extern volatile uint32_t C2FIFOUA16INV __attribute__((section("sfrs"),address(0xBF88C77C)));

extern volatile uint32_t C2FIFOCI16 __attribute__((section("sfrs"), address(0xBF88C780)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI16bits_t;
extern volatile __C2FIFOCI16bits_t C2FIFOCI16bits __asm__ ("C2FIFOCI16") __attribute__((section("sfrs"), address(0xBF88C780)));
extern volatile uint32_t C2FIFOCI16CLR __attribute__((section("sfrs"),address(0xBF88C784)));
extern volatile uint32_t C2FIFOCI16SET __attribute__((section("sfrs"),address(0xBF88C788)));
extern volatile uint32_t C2FIFOCI16INV __attribute__((section("sfrs"),address(0xBF88C78C)));

extern volatile uint32_t C2FIFOCON17 __attribute__((section("sfrs"), address(0xBF88C790)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON17bits_t;
extern volatile __C2FIFOCON17bits_t C2FIFOCON17bits __asm__ ("C2FIFOCON17") __attribute__((section("sfrs"), address(0xBF88C790)));
extern volatile uint32_t C2FIFOCON17CLR __attribute__((section("sfrs"),address(0xBF88C794)));
extern volatile uint32_t C2FIFOCON17SET __attribute__((section("sfrs"),address(0xBF88C798)));
extern volatile uint32_t C2FIFOCON17INV __attribute__((section("sfrs"),address(0xBF88C79C)));

extern volatile uint32_t C2FIFOINT17 __attribute__((section("sfrs"), address(0xBF88C7A0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT17bits_t;
extern volatile __C2FIFOINT17bits_t C2FIFOINT17bits __asm__ ("C2FIFOINT17") __attribute__((section("sfrs"), address(0xBF88C7A0)));
extern volatile uint32_t C2FIFOINT17CLR __attribute__((section("sfrs"),address(0xBF88C7A4)));
extern volatile uint32_t C2FIFOINT17SET __attribute__((section("sfrs"),address(0xBF88C7A8)));
extern volatile uint32_t C2FIFOINT17INV __attribute__((section("sfrs"),address(0xBF88C7AC)));

extern volatile uint32_t C2FIFOUA17 __attribute__((section("sfrs"), address(0xBF88C7B0)));
extern volatile uint32_t C2FIFOUA17CLR __attribute__((section("sfrs"),address(0xBF88C7B4)));
extern volatile uint32_t C2FIFOUA17SET __attribute__((section("sfrs"),address(0xBF88C7B8)));
extern volatile uint32_t C2FIFOUA17INV __attribute__((section("sfrs"),address(0xBF88C7BC)));

extern volatile uint32_t C2FIFOCI17 __attribute__((section("sfrs"), address(0xBF88C7C0)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI17bits_t;
extern volatile __C2FIFOCI17bits_t C2FIFOCI17bits __asm__ ("C2FIFOCI17") __attribute__((section("sfrs"), address(0xBF88C7C0)));
extern volatile uint32_t C2FIFOCI17CLR __attribute__((section("sfrs"),address(0xBF88C7C4)));
extern volatile uint32_t C2FIFOCI17SET __attribute__((section("sfrs"),address(0xBF88C7C8)));
extern volatile uint32_t C2FIFOCI17INV __attribute__((section("sfrs"),address(0xBF88C7CC)));

extern volatile uint32_t C2FIFOCON18 __attribute__((section("sfrs"), address(0xBF88C7D0)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON18bits_t;
extern volatile __C2FIFOCON18bits_t C2FIFOCON18bits __asm__ ("C2FIFOCON18") __attribute__((section("sfrs"), address(0xBF88C7D0)));
extern volatile uint32_t C2FIFOCON18CLR __attribute__((section("sfrs"),address(0xBF88C7D4)));
extern volatile uint32_t C2FIFOCON18SET __attribute__((section("sfrs"),address(0xBF88C7D8)));
extern volatile uint32_t C2FIFOCON18INV __attribute__((section("sfrs"),address(0xBF88C7DC)));

extern volatile uint32_t C2FIFOINT18 __attribute__((section("sfrs"), address(0xBF88C7E0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT18bits_t;
extern volatile __C2FIFOINT18bits_t C2FIFOINT18bits __asm__ ("C2FIFOINT18") __attribute__((section("sfrs"), address(0xBF88C7E0)));
extern volatile uint32_t C2FIFOINT18CLR __attribute__((section("sfrs"),address(0xBF88C7E4)));
extern volatile uint32_t C2FIFOINT18SET __attribute__((section("sfrs"),address(0xBF88C7E8)));
extern volatile uint32_t C2FIFOINT18INV __attribute__((section("sfrs"),address(0xBF88C7EC)));

extern volatile uint32_t C2FIFOUA18 __attribute__((section("sfrs"), address(0xBF88C7F0)));
extern volatile uint32_t C2FIFOUA18CLR __attribute__((section("sfrs"),address(0xBF88C7F4)));
extern volatile uint32_t C2FIFOUA18SET __attribute__((section("sfrs"),address(0xBF88C7F8)));
extern volatile uint32_t C2FIFOUA18INV __attribute__((section("sfrs"),address(0xBF88C7FC)));

extern volatile uint32_t C2FIFOCI18 __attribute__((section("sfrs"), address(0xBF88C800)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI18bits_t;
extern volatile __C2FIFOCI18bits_t C2FIFOCI18bits __asm__ ("C2FIFOCI18") __attribute__((section("sfrs"), address(0xBF88C800)));
extern volatile uint32_t C2FIFOCI18CLR __attribute__((section("sfrs"),address(0xBF88C804)));
extern volatile uint32_t C2FIFOCI18SET __attribute__((section("sfrs"),address(0xBF88C808)));
extern volatile uint32_t C2FIFOCI18INV __attribute__((section("sfrs"),address(0xBF88C80C)));

extern volatile uint32_t C2FIFOCON19 __attribute__((section("sfrs"), address(0xBF88C810)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON19bits_t;
extern volatile __C2FIFOCON19bits_t C2FIFOCON19bits __asm__ ("C2FIFOCON19") __attribute__((section("sfrs"), address(0xBF88C810)));
extern volatile uint32_t C2FIFOCON19CLR __attribute__((section("sfrs"),address(0xBF88C814)));
extern volatile uint32_t C2FIFOCON19SET __attribute__((section("sfrs"),address(0xBF88C818)));
extern volatile uint32_t C2FIFOCON19INV __attribute__((section("sfrs"),address(0xBF88C81C)));

extern volatile uint32_t C2FIFOINT19 __attribute__((section("sfrs"), address(0xBF88C820)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT19bits_t;
extern volatile __C2FIFOINT19bits_t C2FIFOINT19bits __asm__ ("C2FIFOINT19") __attribute__((section("sfrs"), address(0xBF88C820)));
extern volatile uint32_t C2FIFOINT19CLR __attribute__((section("sfrs"),address(0xBF88C824)));
extern volatile uint32_t C2FIFOINT19SET __attribute__((section("sfrs"),address(0xBF88C828)));
extern volatile uint32_t C2FIFOINT19INV __attribute__((section("sfrs"),address(0xBF88C82C)));

extern volatile uint32_t C2FIFOUA19 __attribute__((section("sfrs"), address(0xBF88C830)));
extern volatile uint32_t C2FIFOUA19CLR __attribute__((section("sfrs"),address(0xBF88C834)));
extern volatile uint32_t C2FIFOUA19SET __attribute__((section("sfrs"),address(0xBF88C838)));
extern volatile uint32_t C2FIFOUA19INV __attribute__((section("sfrs"),address(0xBF88C83C)));

extern volatile uint32_t C2FIFOCI19 __attribute__((section("sfrs"), address(0xBF88C840)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI19bits_t;
extern volatile __C2FIFOCI19bits_t C2FIFOCI19bits __asm__ ("C2FIFOCI19") __attribute__((section("sfrs"), address(0xBF88C840)));
extern volatile uint32_t C2FIFOCI19CLR __attribute__((section("sfrs"),address(0xBF88C844)));
extern volatile uint32_t C2FIFOCI19SET __attribute__((section("sfrs"),address(0xBF88C848)));
extern volatile uint32_t C2FIFOCI19INV __attribute__((section("sfrs"),address(0xBF88C84C)));

extern volatile uint32_t C2FIFOCON20 __attribute__((section("sfrs"), address(0xBF88C850)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON20bits_t;
extern volatile __C2FIFOCON20bits_t C2FIFOCON20bits __asm__ ("C2FIFOCON20") __attribute__((section("sfrs"), address(0xBF88C850)));
extern volatile uint32_t C2FIFOCON20CLR __attribute__((section("sfrs"),address(0xBF88C854)));
extern volatile uint32_t C2FIFOCON20SET __attribute__((section("sfrs"),address(0xBF88C858)));
extern volatile uint32_t C2FIFOCON20INV __attribute__((section("sfrs"),address(0xBF88C85C)));

extern volatile uint32_t C2FIFOINT20 __attribute__((section("sfrs"), address(0xBF88C860)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT20bits_t;
extern volatile __C2FIFOINT20bits_t C2FIFOINT20bits __asm__ ("C2FIFOINT20") __attribute__((section("sfrs"), address(0xBF88C860)));
extern volatile uint32_t C2FIFOINT20CLR __attribute__((section("sfrs"),address(0xBF88C864)));
extern volatile uint32_t C2FIFOINT20SET __attribute__((section("sfrs"),address(0xBF88C868)));
extern volatile uint32_t C2FIFOINT20INV __attribute__((section("sfrs"),address(0xBF88C86C)));

extern volatile uint32_t C2FIFOUA20 __attribute__((section("sfrs"), address(0xBF88C870)));
extern volatile uint32_t C2FIFOUA20CLR __attribute__((section("sfrs"),address(0xBF88C874)));
extern volatile uint32_t C2FIFOUA20SET __attribute__((section("sfrs"),address(0xBF88C878)));
extern volatile uint32_t C2FIFOUA20INV __attribute__((section("sfrs"),address(0xBF88C87C)));

extern volatile uint32_t C2FIFOCI20 __attribute__((section("sfrs"), address(0xBF88C880)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI20bits_t;
extern volatile __C2FIFOCI20bits_t C2FIFOCI20bits __asm__ ("C2FIFOCI20") __attribute__((section("sfrs"), address(0xBF88C880)));
extern volatile uint32_t C2FIFOCI20CLR __attribute__((section("sfrs"),address(0xBF88C884)));
extern volatile uint32_t C2FIFOCI20SET __attribute__((section("sfrs"),address(0xBF88C888)));
extern volatile uint32_t C2FIFOCI20INV __attribute__((section("sfrs"),address(0xBF88C88C)));

extern volatile uint32_t C2FIFOCON21 __attribute__((section("sfrs"), address(0xBF88C890)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON21bits_t;
extern volatile __C2FIFOCON21bits_t C2FIFOCON21bits __asm__ ("C2FIFOCON21") __attribute__((section("sfrs"), address(0xBF88C890)));
extern volatile uint32_t C2FIFOCON21CLR __attribute__((section("sfrs"),address(0xBF88C894)));
extern volatile uint32_t C2FIFOCON21SET __attribute__((section("sfrs"),address(0xBF88C898)));
extern volatile uint32_t C2FIFOCON21INV __attribute__((section("sfrs"),address(0xBF88C89C)));

extern volatile uint32_t C2FIFOINT21 __attribute__((section("sfrs"), address(0xBF88C8A0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT21bits_t;
extern volatile __C2FIFOINT21bits_t C2FIFOINT21bits __asm__ ("C2FIFOINT21") __attribute__((section("sfrs"), address(0xBF88C8A0)));
extern volatile uint32_t C2FIFOINT21CLR __attribute__((section("sfrs"),address(0xBF88C8A4)));
extern volatile uint32_t C2FIFOINT21SET __attribute__((section("sfrs"),address(0xBF88C8A8)));
extern volatile uint32_t C2FIFOINT21INV __attribute__((section("sfrs"),address(0xBF88C8AC)));

extern volatile uint32_t C2FIFOUA21 __attribute__((section("sfrs"), address(0xBF88C8B0)));
extern volatile uint32_t C2FIFOUA21CLR __attribute__((section("sfrs"),address(0xBF88C8B4)));
extern volatile uint32_t C2FIFOUA21SET __attribute__((section("sfrs"),address(0xBF88C8B8)));
extern volatile uint32_t C2FIFOUA21INV __attribute__((section("sfrs"),address(0xBF88C8BC)));

extern volatile uint32_t C2FIFOCI21 __attribute__((section("sfrs"), address(0xBF88C8C0)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI21bits_t;
extern volatile __C2FIFOCI21bits_t C2FIFOCI21bits __asm__ ("C2FIFOCI21") __attribute__((section("sfrs"), address(0xBF88C8C0)));
extern volatile uint32_t C2FIFOCI21CLR __attribute__((section("sfrs"),address(0xBF88C8C4)));
extern volatile uint32_t C2FIFOCI21SET __attribute__((section("sfrs"),address(0xBF88C8C8)));
extern volatile uint32_t C2FIFOCI21INV __attribute__((section("sfrs"),address(0xBF88C8CC)));

extern volatile uint32_t C2FIFOCON22 __attribute__((section("sfrs"), address(0xBF88C8D0)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON22bits_t;
extern volatile __C2FIFOCON22bits_t C2FIFOCON22bits __asm__ ("C2FIFOCON22") __attribute__((section("sfrs"), address(0xBF88C8D0)));
extern volatile uint32_t C2FIFOCON22CLR __attribute__((section("sfrs"),address(0xBF88C8D4)));
extern volatile uint32_t C2FIFOCON22SET __attribute__((section("sfrs"),address(0xBF88C8D8)));
extern volatile uint32_t C2FIFOCON22INV __attribute__((section("sfrs"),address(0xBF88C8DC)));

extern volatile uint32_t C2FIFOINT22 __attribute__((section("sfrs"), address(0xBF88C8E0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT22bits_t;
extern volatile __C2FIFOINT22bits_t C2FIFOINT22bits __asm__ ("C2FIFOINT22") __attribute__((section("sfrs"), address(0xBF88C8E0)));
extern volatile uint32_t C2FIFOINT22CLR __attribute__((section("sfrs"),address(0xBF88C8E4)));
extern volatile uint32_t C2FIFOINT22SET __attribute__((section("sfrs"),address(0xBF88C8E8)));
extern volatile uint32_t C2FIFOINT22INV __attribute__((section("sfrs"),address(0xBF88C8EC)));

extern volatile uint32_t C2FIFOUA22 __attribute__((section("sfrs"), address(0xBF88C8F0)));
extern volatile uint32_t C2FIFOUA22CLR __attribute__((section("sfrs"),address(0xBF88C8F4)));
extern volatile uint32_t C2FIFOUA22SET __attribute__((section("sfrs"),address(0xBF88C8F8)));
extern volatile uint32_t C2FIFOUA22INV __attribute__((section("sfrs"),address(0xBF88C8FC)));

extern volatile uint32_t C2FIFOCI22 __attribute__((section("sfrs"), address(0xBF88C900)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI22bits_t;
extern volatile __C2FIFOCI22bits_t C2FIFOCI22bits __asm__ ("C2FIFOCI22") __attribute__((section("sfrs"), address(0xBF88C900)));
extern volatile uint32_t C2FIFOCI22CLR __attribute__((section("sfrs"),address(0xBF88C904)));
extern volatile uint32_t C2FIFOCI22SET __attribute__((section("sfrs"),address(0xBF88C908)));
extern volatile uint32_t C2FIFOCI22INV __attribute__((section("sfrs"),address(0xBF88C90C)));

extern volatile uint32_t C2FIFOCON23 __attribute__((section("sfrs"), address(0xBF88C910)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON23bits_t;
extern volatile __C2FIFOCON23bits_t C2FIFOCON23bits __asm__ ("C2FIFOCON23") __attribute__((section("sfrs"), address(0xBF88C910)));
extern volatile uint32_t C2FIFOCON23CLR __attribute__((section("sfrs"),address(0xBF88C914)));
extern volatile uint32_t C2FIFOCON23SET __attribute__((section("sfrs"),address(0xBF88C918)));
extern volatile uint32_t C2FIFOCON23INV __attribute__((section("sfrs"),address(0xBF88C91C)));

extern volatile uint32_t C2FIFOINT23 __attribute__((section("sfrs"), address(0xBF88C920)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT23bits_t;
extern volatile __C2FIFOINT23bits_t C2FIFOINT23bits __asm__ ("C2FIFOINT23") __attribute__((section("sfrs"), address(0xBF88C920)));
extern volatile uint32_t C2FIFOINT23CLR __attribute__((section("sfrs"),address(0xBF88C924)));
extern volatile uint32_t C2FIFOINT23SET __attribute__((section("sfrs"),address(0xBF88C928)));
extern volatile uint32_t C2FIFOINT23INV __attribute__((section("sfrs"),address(0xBF88C92C)));

extern volatile uint32_t C2FIFOUA23 __attribute__((section("sfrs"), address(0xBF88C930)));
extern volatile uint32_t C2FIFOUA23CLR __attribute__((section("sfrs"),address(0xBF88C934)));
extern volatile uint32_t C2FIFOUA23SET __attribute__((section("sfrs"),address(0xBF88C938)));
extern volatile uint32_t C2FIFOUA23INV __attribute__((section("sfrs"),address(0xBF88C93C)));

extern volatile uint32_t C2FIFOCI23 __attribute__((section("sfrs"), address(0xBF88C940)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI23bits_t;
extern volatile __C2FIFOCI23bits_t C2FIFOCI23bits __asm__ ("C2FIFOCI23") __attribute__((section("sfrs"), address(0xBF88C940)));
extern volatile uint32_t C2FIFOCI23CLR __attribute__((section("sfrs"),address(0xBF88C944)));
extern volatile uint32_t C2FIFOCI23SET __attribute__((section("sfrs"),address(0xBF88C948)));
extern volatile uint32_t C2FIFOCI23INV __attribute__((section("sfrs"),address(0xBF88C94C)));

extern volatile uint32_t C2FIFOCON24 __attribute__((section("sfrs"), address(0xBF88C950)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON24bits_t;
extern volatile __C2FIFOCON24bits_t C2FIFOCON24bits __asm__ ("C2FIFOCON24") __attribute__((section("sfrs"), address(0xBF88C950)));
extern volatile uint32_t C2FIFOCON24CLR __attribute__((section("sfrs"),address(0xBF88C954)));
extern volatile uint32_t C2FIFOCON24SET __attribute__((section("sfrs"),address(0xBF88C958)));
extern volatile uint32_t C2FIFOCON24INV __attribute__((section("sfrs"),address(0xBF88C95C)));

extern volatile uint32_t C2FIFOINT24 __attribute__((section("sfrs"), address(0xBF88C960)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT24bits_t;
extern volatile __C2FIFOINT24bits_t C2FIFOINT24bits __asm__ ("C2FIFOINT24") __attribute__((section("sfrs"), address(0xBF88C960)));
extern volatile uint32_t C2FIFOINT24CLR __attribute__((section("sfrs"),address(0xBF88C964)));
extern volatile uint32_t C2FIFOINT24SET __attribute__((section("sfrs"),address(0xBF88C968)));
extern volatile uint32_t C2FIFOINT24INV __attribute__((section("sfrs"),address(0xBF88C96C)));

extern volatile uint32_t C2FIFOUA24 __attribute__((section("sfrs"), address(0xBF88C970)));
extern volatile uint32_t C2FIFOUA24CLR __attribute__((section("sfrs"),address(0xBF88C974)));
extern volatile uint32_t C2FIFOUA24SET __attribute__((section("sfrs"),address(0xBF88C978)));
extern volatile uint32_t C2FIFOUA24INV __attribute__((section("sfrs"),address(0xBF88C97C)));

extern volatile uint32_t C2FIFOCI24 __attribute__((section("sfrs"), address(0xBF88C980)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI24bits_t;
extern volatile __C2FIFOCI24bits_t C2FIFOCI24bits __asm__ ("C2FIFOCI24") __attribute__((section("sfrs"), address(0xBF88C980)));
extern volatile uint32_t C2FIFOCI24CLR __attribute__((section("sfrs"),address(0xBF88C984)));
extern volatile uint32_t C2FIFOCI24SET __attribute__((section("sfrs"),address(0xBF88C988)));
extern volatile uint32_t C2FIFOCI24INV __attribute__((section("sfrs"),address(0xBF88C98C)));

extern volatile uint32_t C2FIFOCON25 __attribute__((section("sfrs"), address(0xBF88C990)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON25bits_t;
extern volatile __C2FIFOCON25bits_t C2FIFOCON25bits __asm__ ("C2FIFOCON25") __attribute__((section("sfrs"), address(0xBF88C990)));
extern volatile uint32_t C2FIFOCON25CLR __attribute__((section("sfrs"),address(0xBF88C994)));
extern volatile uint32_t C2FIFOCON25SET __attribute__((section("sfrs"),address(0xBF88C998)));
extern volatile uint32_t C2FIFOCON25INV __attribute__((section("sfrs"),address(0xBF88C99C)));

extern volatile uint32_t C2FIFOINT25 __attribute__((section("sfrs"), address(0xBF88C9A0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT25bits_t;
extern volatile __C2FIFOINT25bits_t C2FIFOINT25bits __asm__ ("C2FIFOINT25") __attribute__((section("sfrs"), address(0xBF88C9A0)));
extern volatile uint32_t C2FIFOINT25CLR __attribute__((section("sfrs"),address(0xBF88C9A4)));
extern volatile uint32_t C2FIFOINT25SET __attribute__((section("sfrs"),address(0xBF88C9A8)));
extern volatile uint32_t C2FIFOINT25INV __attribute__((section("sfrs"),address(0xBF88C9AC)));

extern volatile uint32_t C2FIFOUA25 __attribute__((section("sfrs"), address(0xBF88C9B0)));
extern volatile uint32_t C2FIFOUA25CLR __attribute__((section("sfrs"),address(0xBF88C9B4)));
extern volatile uint32_t C2FIFOUA25SET __attribute__((section("sfrs"),address(0xBF88C9B8)));
extern volatile uint32_t C2FIFOUA25INV __attribute__((section("sfrs"),address(0xBF88C9BC)));

extern volatile uint32_t C2FIFOCI25 __attribute__((section("sfrs"), address(0xBF88C9C0)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI25bits_t;
extern volatile __C2FIFOCI25bits_t C2FIFOCI25bits __asm__ ("C2FIFOCI25") __attribute__((section("sfrs"), address(0xBF88C9C0)));
extern volatile uint32_t C2FIFOCI25CLR __attribute__((section("sfrs"),address(0xBF88C9C4)));
extern volatile uint32_t C2FIFOCI25SET __attribute__((section("sfrs"),address(0xBF88C9C8)));
extern volatile uint32_t C2FIFOCI25INV __attribute__((section("sfrs"),address(0xBF88C9CC)));

extern volatile uint32_t C2FIFOCON26 __attribute__((section("sfrs"), address(0xBF88C9D0)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON26bits_t;
extern volatile __C2FIFOCON26bits_t C2FIFOCON26bits __asm__ ("C2FIFOCON26") __attribute__((section("sfrs"), address(0xBF88C9D0)));
extern volatile uint32_t C2FIFOCON26CLR __attribute__((section("sfrs"),address(0xBF88C9D4)));
extern volatile uint32_t C2FIFOCON26SET __attribute__((section("sfrs"),address(0xBF88C9D8)));
extern volatile uint32_t C2FIFOCON26INV __attribute__((section("sfrs"),address(0xBF88C9DC)));

extern volatile uint32_t C2FIFOINT26 __attribute__((section("sfrs"), address(0xBF88C9E0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT26bits_t;
extern volatile __C2FIFOINT26bits_t C2FIFOINT26bits __asm__ ("C2FIFOINT26") __attribute__((section("sfrs"), address(0xBF88C9E0)));
extern volatile uint32_t C2FIFOINT26CLR __attribute__((section("sfrs"),address(0xBF88C9E4)));
extern volatile uint32_t C2FIFOINT26SET __attribute__((section("sfrs"),address(0xBF88C9E8)));
extern volatile uint32_t C2FIFOINT26INV __attribute__((section("sfrs"),address(0xBF88C9EC)));

extern volatile uint32_t C2FIFOUA26 __attribute__((section("sfrs"), address(0xBF88C9F0)));
extern volatile uint32_t C2FIFOUA26CLR __attribute__((section("sfrs"),address(0xBF88C9F4)));
extern volatile uint32_t C2FIFOUA26SET __attribute__((section("sfrs"),address(0xBF88C9F8)));
extern volatile uint32_t C2FIFOUA26INV __attribute__((section("sfrs"),address(0xBF88C9FC)));

extern volatile uint32_t C2FIFOCI26 __attribute__((section("sfrs"), address(0xBF88CA00)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI26bits_t;
extern volatile __C2FIFOCI26bits_t C2FIFOCI26bits __asm__ ("C2FIFOCI26") __attribute__((section("sfrs"), address(0xBF88CA00)));
extern volatile uint32_t C2FIFOCI26CLR __attribute__((section("sfrs"),address(0xBF88CA04)));
extern volatile uint32_t C2FIFOCI26SET __attribute__((section("sfrs"),address(0xBF88CA08)));
extern volatile uint32_t C2FIFOCI26INV __attribute__((section("sfrs"),address(0xBF88CA0C)));

extern volatile uint32_t C2FIFOCON27 __attribute__((section("sfrs"), address(0xBF88CA10)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON27bits_t;
extern volatile __C2FIFOCON27bits_t C2FIFOCON27bits __asm__ ("C2FIFOCON27") __attribute__((section("sfrs"), address(0xBF88CA10)));
extern volatile uint32_t C2FIFOCON27CLR __attribute__((section("sfrs"),address(0xBF88CA14)));
extern volatile uint32_t C2FIFOCON27SET __attribute__((section("sfrs"),address(0xBF88CA18)));
extern volatile uint32_t C2FIFOCON27INV __attribute__((section("sfrs"),address(0xBF88CA1C)));

extern volatile uint32_t C2FIFOINT27 __attribute__((section("sfrs"), address(0xBF88CA20)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT27bits_t;
extern volatile __C2FIFOINT27bits_t C2FIFOINT27bits __asm__ ("C2FIFOINT27") __attribute__((section("sfrs"), address(0xBF88CA20)));
extern volatile uint32_t C2FIFOINT27CLR __attribute__((section("sfrs"),address(0xBF88CA24)));
extern volatile uint32_t C2FIFOINT27SET __attribute__((section("sfrs"),address(0xBF88CA28)));
extern volatile uint32_t C2FIFOINT27INV __attribute__((section("sfrs"),address(0xBF88CA2C)));

extern volatile uint32_t C2FIFOUA27 __attribute__((section("sfrs"), address(0xBF88CA30)));
extern volatile uint32_t C2FIFOUA27CLR __attribute__((section("sfrs"),address(0xBF88CA34)));
extern volatile uint32_t C2FIFOUA27SET __attribute__((section("sfrs"),address(0xBF88CA38)));
extern volatile uint32_t C2FIFOUA27INV __attribute__((section("sfrs"),address(0xBF88CA3C)));

extern volatile uint32_t C2FIFOCI27 __attribute__((section("sfrs"), address(0xBF88CA40)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI27bits_t;
extern volatile __C2FIFOCI27bits_t C2FIFOCI27bits __asm__ ("C2FIFOCI27") __attribute__((section("sfrs"), address(0xBF88CA40)));
extern volatile uint32_t C2FIFOCI27CLR __attribute__((section("sfrs"),address(0xBF88CA44)));
extern volatile uint32_t C2FIFOCI27SET __attribute__((section("sfrs"),address(0xBF88CA48)));
extern volatile uint32_t C2FIFOCI27INV __attribute__((section("sfrs"),address(0xBF88CA4C)));

extern volatile uint32_t C2FIFOCON28 __attribute__((section("sfrs"), address(0xBF88CA50)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON28bits_t;
extern volatile __C2FIFOCON28bits_t C2FIFOCON28bits __asm__ ("C2FIFOCON28") __attribute__((section("sfrs"), address(0xBF88CA50)));
extern volatile uint32_t C2FIFOCON28CLR __attribute__((section("sfrs"),address(0xBF88CA54)));
extern volatile uint32_t C2FIFOCON28SET __attribute__((section("sfrs"),address(0xBF88CA58)));
extern volatile uint32_t C2FIFOCON28INV __attribute__((section("sfrs"),address(0xBF88CA5C)));

extern volatile uint32_t C2FIFOINT28 __attribute__((section("sfrs"), address(0xBF88CA60)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT28bits_t;
extern volatile __C2FIFOINT28bits_t C2FIFOINT28bits __asm__ ("C2FIFOINT28") __attribute__((section("sfrs"), address(0xBF88CA60)));
extern volatile uint32_t C2FIFOINT28CLR __attribute__((section("sfrs"),address(0xBF88CA64)));
extern volatile uint32_t C2FIFOINT28SET __attribute__((section("sfrs"),address(0xBF88CA68)));
extern volatile uint32_t C2FIFOINT28INV __attribute__((section("sfrs"),address(0xBF88CA6C)));

extern volatile uint32_t C2FIFOUA28 __attribute__((section("sfrs"), address(0xBF88CA70)));
extern volatile uint32_t C2FIFOUA28CLR __attribute__((section("sfrs"),address(0xBF88CA74)));
extern volatile uint32_t C2FIFOUA28SET __attribute__((section("sfrs"),address(0xBF88CA78)));
extern volatile uint32_t C2FIFOUA28INV __attribute__((section("sfrs"),address(0xBF88CA7C)));

extern volatile uint32_t C2FIFOCI28 __attribute__((section("sfrs"), address(0xBF88CA80)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI28bits_t;
extern volatile __C2FIFOCI28bits_t C2FIFOCI28bits __asm__ ("C2FIFOCI28") __attribute__((section("sfrs"), address(0xBF88CA80)));
extern volatile uint32_t C2FIFOCI28CLR __attribute__((section("sfrs"),address(0xBF88CA84)));
extern volatile uint32_t C2FIFOCI28SET __attribute__((section("sfrs"),address(0xBF88CA88)));
extern volatile uint32_t C2FIFOCI28INV __attribute__((section("sfrs"),address(0xBF88CA8C)));

extern volatile uint32_t C2FIFOCON29 __attribute__((section("sfrs"), address(0xBF88CA90)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON29bits_t;
extern volatile __C2FIFOCON29bits_t C2FIFOCON29bits __asm__ ("C2FIFOCON29") __attribute__((section("sfrs"), address(0xBF88CA90)));
extern volatile uint32_t C2FIFOCON29CLR __attribute__((section("sfrs"),address(0xBF88CA94)));
extern volatile uint32_t C2FIFOCON29SET __attribute__((section("sfrs"),address(0xBF88CA98)));
extern volatile uint32_t C2FIFOCON29INV __attribute__((section("sfrs"),address(0xBF88CA9C)));

extern volatile uint32_t C2FIFOINT29 __attribute__((section("sfrs"), address(0xBF88CAA0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT29bits_t;
extern volatile __C2FIFOINT29bits_t C2FIFOINT29bits __asm__ ("C2FIFOINT29") __attribute__((section("sfrs"), address(0xBF88CAA0)));
extern volatile uint32_t C2FIFOINT29CLR __attribute__((section("sfrs"),address(0xBF88CAA4)));
extern volatile uint32_t C2FIFOINT29SET __attribute__((section("sfrs"),address(0xBF88CAA8)));
extern volatile uint32_t C2FIFOINT29INV __attribute__((section("sfrs"),address(0xBF88CAAC)));

extern volatile uint32_t C2FIFOUA29 __attribute__((section("sfrs"), address(0xBF88CAB0)));
extern volatile uint32_t C2FIFOUA29CLR __attribute__((section("sfrs"),address(0xBF88CAB4)));
extern volatile uint32_t C2FIFOUA29SET __attribute__((section("sfrs"),address(0xBF88CAB8)));
extern volatile uint32_t C2FIFOUA29INV __attribute__((section("sfrs"),address(0xBF88CABC)));

extern volatile uint32_t C2FIFOCI29 __attribute__((section("sfrs"), address(0xBF88CAC0)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI29bits_t;
extern volatile __C2FIFOCI29bits_t C2FIFOCI29bits __asm__ ("C2FIFOCI29") __attribute__((section("sfrs"), address(0xBF88CAC0)));
extern volatile uint32_t C2FIFOCI29CLR __attribute__((section("sfrs"),address(0xBF88CAC4)));
extern volatile uint32_t C2FIFOCI29SET __attribute__((section("sfrs"),address(0xBF88CAC8)));
extern volatile uint32_t C2FIFOCI29INV __attribute__((section("sfrs"),address(0xBF88CACC)));

extern volatile uint32_t C2FIFOCON30 __attribute__((section("sfrs"), address(0xBF88CAD0)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON30bits_t;
extern volatile __C2FIFOCON30bits_t C2FIFOCON30bits __asm__ ("C2FIFOCON30") __attribute__((section("sfrs"), address(0xBF88CAD0)));
extern volatile uint32_t C2FIFOCON30CLR __attribute__((section("sfrs"),address(0xBF88CAD4)));
extern volatile uint32_t C2FIFOCON30SET __attribute__((section("sfrs"),address(0xBF88CAD8)));
extern volatile uint32_t C2FIFOCON30INV __attribute__((section("sfrs"),address(0xBF88CADC)));

extern volatile uint32_t C2FIFOINT30 __attribute__((section("sfrs"), address(0xBF88CAE0)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT30bits_t;
extern volatile __C2FIFOINT30bits_t C2FIFOINT30bits __asm__ ("C2FIFOINT30") __attribute__((section("sfrs"), address(0xBF88CAE0)));
extern volatile uint32_t C2FIFOINT30CLR __attribute__((section("sfrs"),address(0xBF88CAE4)));
extern volatile uint32_t C2FIFOINT30SET __attribute__((section("sfrs"),address(0xBF88CAE8)));
extern volatile uint32_t C2FIFOINT30INV __attribute__((section("sfrs"),address(0xBF88CAEC)));

extern volatile uint32_t C2FIFOUA30 __attribute__((section("sfrs"), address(0xBF88CAF0)));
extern volatile uint32_t C2FIFOUA30CLR __attribute__((section("sfrs"),address(0xBF88CAF4)));
extern volatile uint32_t C2FIFOUA30SET __attribute__((section("sfrs"),address(0xBF88CAF8)));
extern volatile uint32_t C2FIFOUA30INV __attribute__((section("sfrs"),address(0xBF88CAFC)));

extern volatile uint32_t C2FIFOCI30 __attribute__((section("sfrs"), address(0xBF88CB00)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI30bits_t;
extern volatile __C2FIFOCI30bits_t C2FIFOCI30bits __asm__ ("C2FIFOCI30") __attribute__((section("sfrs"), address(0xBF88CB00)));
extern volatile uint32_t C2FIFOCI30CLR __attribute__((section("sfrs"),address(0xBF88CB04)));
extern volatile uint32_t C2FIFOCI30SET __attribute__((section("sfrs"),address(0xBF88CB08)));
extern volatile uint32_t C2FIFOCI30INV __attribute__((section("sfrs"),address(0xBF88CB0C)));

extern volatile uint32_t C2FIFOCON31 __attribute__((section("sfrs"), address(0xBF88CB10)));
typedef union {
  struct {
    uint32_t TXPRI:2;
    uint32_t RTREN:1;
    uint32_t TXREQ:1;
    uint32_t TXERR:1;
    uint32_t TXLARB:1;
    uint32_t TXABAT:1;
    uint32_t TXEN:1;
    uint32_t :4;
    uint32_t DONLY:1;
    uint32_t UINC:1;
    uint32_t FRESET:1;
    uint32_t :1;
    uint32_t FSIZE:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCON31bits_t;
extern volatile __C2FIFOCON31bits_t C2FIFOCON31bits __asm__ ("C2FIFOCON31") __attribute__((section("sfrs"), address(0xBF88CB10)));
extern volatile uint32_t C2FIFOCON31CLR __attribute__((section("sfrs"),address(0xBF88CB14)));
extern volatile uint32_t C2FIFOCON31SET __attribute__((section("sfrs"),address(0xBF88CB18)));
extern volatile uint32_t C2FIFOCON31INV __attribute__((section("sfrs"),address(0xBF88CB1C)));

extern volatile uint32_t C2FIFOINT31 __attribute__((section("sfrs"), address(0xBF88CB20)));
typedef union {
  struct {
    uint32_t RXNEMPTYIF:1;
    uint32_t RXHALFIF:1;
    uint32_t RXFULLIF:1;
    uint32_t RXOVFLIF:1;
    uint32_t :4;
    uint32_t TXEMPTYIF:1;
    uint32_t TXHALFIF:1;
    uint32_t TXNFULLIF:1;
    uint32_t :5;
    uint32_t RXNEMPTYIE:1;
    uint32_t RXHALFIE:1;
    uint32_t RXFULLIE:1;
    uint32_t RXOVFLIE:1;
    uint32_t :4;
    uint32_t TXEMPTYIE:1;
    uint32_t TXHALFIE:1;
    uint32_t TXNFULLIE:1;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOINT31bits_t;
extern volatile __C2FIFOINT31bits_t C2FIFOINT31bits __asm__ ("C2FIFOINT31") __attribute__((section("sfrs"), address(0xBF88CB20)));
extern volatile uint32_t C2FIFOINT31CLR __attribute__((section("sfrs"),address(0xBF88CB24)));
extern volatile uint32_t C2FIFOINT31SET __attribute__((section("sfrs"),address(0xBF88CB28)));
extern volatile uint32_t C2FIFOINT31INV __attribute__((section("sfrs"),address(0xBF88CB2C)));

extern volatile uint32_t C2FIFOUA31 __attribute__((section("sfrs"), address(0xBF88CB30)));
extern volatile uint32_t C2FIFOUA31CLR __attribute__((section("sfrs"),address(0xBF88CB34)));
extern volatile uint32_t C2FIFOUA31SET __attribute__((section("sfrs"),address(0xBF88CB38)));
extern volatile uint32_t C2FIFOUA31INV __attribute__((section("sfrs"),address(0xBF88CB3C)));

extern volatile uint32_t C2FIFOCI31 __attribute__((section("sfrs"), address(0xBF88CB40)));
typedef union {
  struct {
    uint32_t CFIFOCI:5;
  };
  struct {
    uint32_t w:32;
  };
} __C2FIFOCI31bits_t;
extern volatile __C2FIFOCI31bits_t C2FIFOCI31bits __asm__ ("C2FIFOCI31") __attribute__((section("sfrs"), address(0xBF88CB40)));
extern volatile uint32_t C2FIFOCI31CLR __attribute__((section("sfrs"),address(0xBF88CB44)));
extern volatile uint32_t C2FIFOCI31SET __attribute__((section("sfrs"),address(0xBF88CB48)));
extern volatile uint32_t C2FIFOCI31INV __attribute__((section("sfrs"),address(0xBF88CB4C)));

extern volatile uint32_t DEVCFG3 __attribute__((section("sfrs"), address(0xBFC02FF0)));
typedef union {
  struct {
    uint32_t USERID:16;
    uint32_t FSRSSEL:3;
    uint32_t :5;
    uint32_t FMIIEN:1;
    uint32_t FETHIO:1;
    uint32_t FCANIO:1;
    uint32_t :3;
    uint32_t FUSBIDIO:1;
    uint32_t FVBUSONIO:1;
  };
  struct {
    uint32_t w:32;
  };
} __DEVCFG3bits_t;
extern volatile __DEVCFG3bits_t DEVCFG3bits __asm__ ("DEVCFG3") __attribute__((section("sfrs"), address(0xBFC02FF0)));

extern volatile uint32_t DEVCFG2 __attribute__((section("sfrs"), address(0xBFC02FF4)));
typedef union {
  struct {
    uint32_t FPLLIDIV:3;
    uint32_t :1;
    uint32_t FPLLMUL:3;
    uint32_t :1;
    uint32_t UPLLIDIV:3;
    uint32_t :4;
    uint32_t UPLLEN:1;
    uint32_t FPLLODIV:3;
  };
  struct {
    uint32_t w:32;
  };
} __DEVCFG2bits_t;
extern volatile __DEVCFG2bits_t DEVCFG2bits __asm__ ("DEVCFG2") __attribute__((section("sfrs"), address(0xBFC02FF4)));

extern volatile uint32_t DEVCFG1 __attribute__((section("sfrs"), address(0xBFC02FF8)));
typedef union {
  struct {
    uint32_t FNOSC:3;
    uint32_t :2;
    uint32_t FSOSCEN:1;
    uint32_t :1;
    uint32_t IESO:1;
    uint32_t POSCMOD:2;
    uint32_t OSCIOFNC:1;
    uint32_t :1;
    uint32_t FPBDIV:2;
    uint32_t FCKSM:2;
    uint32_t WDTPS:5;
    uint32_t :2;
    uint32_t FWDTEN:1;
  };
  struct {
    uint32_t w:32;
  };
} __DEVCFG1bits_t;
extern volatile __DEVCFG1bits_t DEVCFG1bits __asm__ ("DEVCFG1") __attribute__((section("sfrs"), address(0xBFC02FF8)));

extern volatile uint32_t DEVCFG0 __attribute__((section("sfrs"), address(0xBFC02FFC)));
typedef union {
  struct {
    uint32_t DEBUG:2;
    uint32_t :1;
    uint32_t ICESEL:1;
    uint32_t :8;
    uint32_t PWP:8;
    uint32_t :4;
    uint32_t BWP:1;
    uint32_t :3;
    uint32_t CP:1;
  };
  struct {
    uint32_t FDEBUG:2;
  };
  struct {
    uint32_t w:32;
  };
} __DEVCFG0bits_t;
extern volatile __DEVCFG0bits_t DEVCFG0bits __asm__ ("DEVCFG0") __attribute__((section("sfrs"), address(0xBFC02FFC)));
# 41994 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\proc\\pic32mx\\p32mx795f512l.h" 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\pic32m-libs\\proc\\ppic32mx.h" 1 3 4
# 41995 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\proc\\pic32mx\\p32mx795f512l.h" 2 3
# 419 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\xc.h" 2 3
# 799 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\xc.h" 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\lib\\gcc\\pic32mx\\8.3.1\\include\\pic32m_builtins.h" 1 3
# 45 "c:\\program files\\microchip\\xc32\\v4.45\\lib\\gcc\\pic32mx\\8.3.1\\include\\pic32m_builtins.h" 3
uint32_t __builtin_mips_get_fcsr (void);
void __builtin_mips_set_fcsr (uint32_t);
int16_t __attribute__ ((vector_size(4))) __builtin_mips_addq_ph (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_addq_s_ph (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int32_t __builtin_mips_addq_s_w (int32_t, int32_t);
int8_t __attribute__ ((vector_size(4))) __builtin_mips_addu_qb (int8_t __attribute__ ((vector_size(4))), int8_t __attribute__ ((vector_size(4))));
int8_t __attribute__ ((vector_size(4))) __builtin_mips_addu_s_qb (int8_t __attribute__ ((vector_size(4))), int8_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_subq_ph (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_subq_s_ph (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int32_t __builtin_mips_subq_s_w (int32_t, int32_t);
int8_t __attribute__ ((vector_size(4))) __builtin_mips_subu_qb (int8_t __attribute__ ((vector_size(4))), int8_t __attribute__ ((vector_size(4))));
int8_t __attribute__ ((vector_size(4))) __builtin_mips_subu_s_qb (int8_t __attribute__ ((vector_size(4))), int8_t __attribute__ ((vector_size(4))));
int32_t __builtin_mips_addsc (int32_t, int32_t);
int32_t __builtin_mips_addwc (int32_t, int32_t);
int32_t __builtin_mips_modsub (int32_t, int32_t);
int32_t __builtin_mips_raddu_w_qb (int8_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_absq_s_ph (int16_t __attribute__ ((vector_size(4))));
int32_t __builtin_mips_absq_s_w (int32_t);
int8_t __attribute__ ((vector_size(4))) __builtin_mips_precrq_qb_ph (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_precrq_ph_w (int32_t, int32_t);
int16_t __attribute__ ((vector_size(4))) __builtin_mips_precrq_rs_ph_w (int32_t, int32_t);
int8_t __attribute__ ((vector_size(4))) __builtin_mips_precrqu_s_qb_ph (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int32_t __builtin_mips_preceq_w_phl (int16_t __attribute__ ((vector_size(4))));
int32_t __builtin_mips_preceq_w_phr (int16_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_precequ_ph_qbl (int8_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_precequ_ph_qbr (int8_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_precequ_ph_qbla (int8_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_precequ_ph_qbra (int8_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_preceu_ph_qbl (int8_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_preceu_ph_qbr (int8_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_preceu_ph_qbla (int8_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_preceu_ph_qbra (int8_t __attribute__ ((vector_size(4))));
int8_t __attribute__ ((vector_size(4))) __builtin_mips_shll_qb (int8_t __attribute__ ((vector_size(4))), int32_t);
int16_t __attribute__ ((vector_size(4))) __builtin_mips_shll_ph (int16_t __attribute__ ((vector_size(4))), int32_t);
int16_t __attribute__ ((vector_size(4))) __builtin_mips_shll_s_ph (int16_t __attribute__ ((vector_size(4))), int32_t);
int32_t __builtin_mips_shll_s_w (int32_t, int32_t);
int8_t __attribute__ ((vector_size(4))) __builtin_mips_shrl_qb (int8_t __attribute__ ((vector_size(4))), int32_t);
int16_t __attribute__ ((vector_size(4))) __builtin_mips_shra_ph (int16_t __attribute__ ((vector_size(4))), int32_t);
int16_t __attribute__ ((vector_size(4))) __builtin_mips_shra_r_ph (int16_t __attribute__ ((vector_size(4))), int32_t);
int32_t __builtin_mips_shra_r_w (int32_t, int32_t);
int16_t __attribute__ ((vector_size(4))) __builtin_mips_muleu_s_ph_qbl (int8_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_muleu_s_ph_qbr (int8_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_mulq_rs_ph (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int32_t __builtin_mips_muleq_s_w_phl (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int32_t __builtin_mips_muleq_s_w_phr (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int32_t __builtin_mips_bitrev (int32_t);
int32_t __builtin_mips_insv (int32_t, int32_t);
int8_t __attribute__ ((vector_size(4))) __builtin_mips_repl_qb (int32_t);
int16_t __attribute__ ((vector_size(4))) __builtin_mips_repl_ph (int32_t);
void __builtin_mips_cmpu_eq_qb (int8_t __attribute__ ((vector_size(4))), int8_t __attribute__ ((vector_size(4))));
void __builtin_mips_cmpu_lt_qb (int8_t __attribute__ ((vector_size(4))), int8_t __attribute__ ((vector_size(4))));
void __builtin_mips_cmpu_le_qb (int8_t __attribute__ ((vector_size(4))), int8_t __attribute__ ((vector_size(4))));
int32_t __builtin_mips_cmpgu_eq_qb (int8_t __attribute__ ((vector_size(4))), int8_t __attribute__ ((vector_size(4))));
int32_t __builtin_mips_cmpgu_lt_qb (int8_t __attribute__ ((vector_size(4))), int8_t __attribute__ ((vector_size(4))));
int32_t __builtin_mips_cmpgu_le_qb (int8_t __attribute__ ((vector_size(4))), int8_t __attribute__ ((vector_size(4))));
void __builtin_mips_cmp_eq_ph (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
void __builtin_mips_cmp_lt_ph (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
void __builtin_mips_cmp_le_ph (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int8_t __attribute__ ((vector_size(4))) __builtin_mips_pick_qb (int8_t __attribute__ ((vector_size(4))), int8_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_pick_ph (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_packrl_ph (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
void __builtin_mips_wrdsp (int32_t, int32_t);
int32_t __builtin_mips_rddsp (int32_t);
int32_t __builtin_mips_lbux (void *, int32_t);
int32_t __builtin_mips_lhx (void *, int32_t);
int32_t __builtin_mips_lwx (void *, int32_t);
int8_t __attribute__ ((vector_size(4))) __builtin_mips_absq_s_qb (int8_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_addu_ph (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_addu_s_ph (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int8_t __attribute__ ((vector_size(4))) __builtin_mips_adduh_qb (int8_t __attribute__ ((vector_size(4))), int8_t __attribute__ ((vector_size(4))));
int8_t __attribute__ ((vector_size(4))) __builtin_mips_adduh_r_qb (int8_t __attribute__ ((vector_size(4))), int8_t __attribute__ ((vector_size(4))));
int32_t __builtin_mips_append (int32_t, int32_t, int32_t);
int32_t __builtin_mips_balign (int32_t, int32_t, int32_t);
int32_t __builtin_mips_cmpgdu_eq_qb (int8_t __attribute__ ((vector_size(4))), int8_t __attribute__ ((vector_size(4))));
int32_t __builtin_mips_cmpgdu_lt_qb (int8_t __attribute__ ((vector_size(4))), int8_t __attribute__ ((vector_size(4))));
int32_t __builtin_mips_cmpgdu_le_qb (int8_t __attribute__ ((vector_size(4))), int8_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_mul_ph (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_mul_s_ph (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int32_t __builtin_mips_mulq_rs_w (int32_t, int32_t);
int16_t __attribute__ ((vector_size(4))) __builtin_mips_mulq_s_ph (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int32_t __builtin_mips_mulq_s_w (int32_t, int32_t);
int8_t __attribute__ ((vector_size(4))) __builtin_mips_precr_qb_ph (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_precr_sra_ph_w (int32_t, int32_t, int32_t);
int16_t __attribute__ ((vector_size(4))) __builtin_mips_precr_sra_r_ph_w (int32_t, int32_t, int32_t);
int32_t __builtin_mips_prepend (int32_t, int32_t, int32_t);
int8_t __attribute__ ((vector_size(4))) __builtin_mips_shra_qb (int8_t __attribute__ ((vector_size(4))), int32_t);
int8_t __attribute__ ((vector_size(4))) __builtin_mips_shra_r_qb (int8_t __attribute__ ((vector_size(4))), int32_t);
int16_t __attribute__ ((vector_size(4))) __builtin_mips_shrl_ph (int16_t __attribute__ ((vector_size(4))), int32_t);
int16_t __attribute__ ((vector_size(4))) __builtin_mips_subu_ph (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_subu_s_ph (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int8_t __attribute__ ((vector_size(4))) __builtin_mips_subuh_qb (int8_t __attribute__ ((vector_size(4))), int8_t __attribute__ ((vector_size(4))));
int8_t __attribute__ ((vector_size(4))) __builtin_mips_subuh_r_qb (int8_t __attribute__ ((vector_size(4))), int8_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_addqh_ph (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_addqh_r_ph (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int32_t __builtin_mips_addqh_w (int32_t, int32_t);
int32_t __builtin_mips_addqh_r_w (int32_t, int32_t);
int16_t __attribute__ ((vector_size(4))) __builtin_mips_subqh_ph (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int16_t __attribute__ ((vector_size(4))) __builtin_mips_subqh_r_ph (int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int32_t __builtin_mips_subqh_w (int32_t, int32_t);
int32_t __builtin_mips_subqh_r_w (int32_t, int32_t);
int64_t __builtin_mips_dpau_h_qbl (int64_t, int8_t __attribute__ ((vector_size(4))), int8_t __attribute__ ((vector_size(4))));
int64_t __builtin_mips_dpau_h_qbr (int64_t, int8_t __attribute__ ((vector_size(4))), int8_t __attribute__ ((vector_size(4))));
int64_t __builtin_mips_dpsu_h_qbl (int64_t, int8_t __attribute__ ((vector_size(4))), int8_t __attribute__ ((vector_size(4))));
int64_t __builtin_mips_dpsu_h_qbr (int64_t, int8_t __attribute__ ((vector_size(4))), int8_t __attribute__ ((vector_size(4))));
int64_t __builtin_mips_dpaq_s_w_ph (int64_t, int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int64_t __builtin_mips_dpsq_s_w_ph (int64_t, int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int64_t __builtin_mips_mulsaq_s_w_ph (int64_t, int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int64_t __builtin_mips_dpaq_sa_l_w (int64_t, int32_t, int32_t);
int64_t __builtin_mips_dpsq_sa_l_w (int64_t, int32_t, int32_t);
int64_t __builtin_mips_maq_s_w_phl (int64_t, int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int64_t __builtin_mips_maq_s_w_phr (int64_t, int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int64_t __builtin_mips_maq_sa_w_phl (int64_t, int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int64_t __builtin_mips_maq_sa_w_phr (int64_t, int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int32_t __builtin_mips_extr_w (int64_t, int32_t);
int32_t __builtin_mips_extr_r_w (int64_t, int32_t);
int32_t __builtin_mips_extr_rs_w (int64_t, int32_t);
int32_t __builtin_mips_extr_s_h (int64_t, int32_t);
int32_t __builtin_mips_extp (int64_t, int32_t);
int32_t __builtin_mips_extpdp (int64_t, int32_t);
int64_t __builtin_mips_shilo (int64_t, int32_t);
int64_t __builtin_mips_mthlip (int64_t, int32_t);
int64_t __builtin_mips_madd (int64_t, int32_t, int32_t);
int64_t __builtin_mips_maddu (int64_t, uint32_t, uint32_t);
int64_t __builtin_mips_msub (int64_t, int32_t, int32_t);
int64_t __builtin_mips_msubu (int64_t, uint32_t, uint32_t);
int64_t __builtin_mips_mult (int32_t, int32_t);
int64_t __builtin_mips_multu (uint32_t, uint32_t);
int64_t __builtin_mips_dpa_w_ph (int64_t, int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int64_t __builtin_mips_dps_w_ph (int64_t, int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int64_t __builtin_mips_mulsa_w_ph (int64_t, int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int64_t __builtin_mips_dpax_w_ph (int64_t, int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int64_t __builtin_mips_dpsx_w_ph (int64_t, int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int64_t __builtin_mips_dpaqx_s_w_ph (int64_t, int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int64_t __builtin_mips_dpaqx_sa_w_ph (int64_t, int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int64_t __builtin_mips_dpsqx_s_w_ph (int64_t, int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
int64_t __builtin_mips_dpsqx_sa_w_ph (int64_t, int16_t __attribute__ ((vector_size(4))), int16_t __attribute__ ((vector_size(4))));
void __builtin_mips_cache (int32_t, const volatile void *);
uint32_t __builtin_mfc0 (uint32_t, uint32_t);
void __builtin_mtc0 (uint32_t, uint32_t, uint32_t);
uint32_t __builtin_mxc0 (uint32_t, uint32_t, uint32_t);
uint32_t __builtin_bcc0 (uint32_t, uint32_t, uint32_t);
uint32_t __builtin_bsc0 (uint32_t, uint32_t, uint32_t);
uint32_t __builtin_bcsc0 (uint32_t, uint32_t, uint32_t, uint32_t);
uint32_t __builtin_unique_id (const int8_t * , int32_t);
uint32_t __builtin_section_begin (const int8_t * );
uint32_t __builtin_section_end (const int8_t * );
uint32_t __builtin_section_size (const int8_t * );
uint32_t __builtin_get_isr_state (void);
void __builtin_set_isr_state (uint32_t);
uint32_t __builtin_disable_interrupts (void);
uint32_t __builtin_enable_interrupts (void);
void __builtin_software_breakpoint (void);
# 800 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\xc.h" 2 3







extern int __XC_UART;
# 821 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\xc.h" 3
typedef unsigned long _reg_t;
# 985 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\xc.h" 3
extern unsigned int _xchsrspss (unsigned int);
# 999 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\xc.h" 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\pic32m-libs\\cp0defs.h" 1 3 4
# 36 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\pic32m-libs\\cp0defs.h" 3 4
       
# 1000 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\xc.h" 2 3


# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\pic32m-libs\\sys\\appio.h" 1 3 4
# 1003 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\xc.h" 2 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\pic32m-libs\\sys\\l1cache.h" 1 3 4
# 50 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\pic32m-libs\\sys\\l1cache.h" 3 4
       
# 60 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\pic32m-libs\\sys\\l1cache.h" 3 4
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\stdlib.h" 1 3 4







# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\features.h" 1 3 4
# 9 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\stdlib.h" 2 3 4
# 19 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\stdlib.h" 3 4
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 1 3 4
# 29 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 3 4
typedef int wchar_t;
# 112 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 3 4
typedef unsigned int size_t;
# 20 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\stdlib.h" 2 3 4

int atoi (const char *);
long atol (const char *);
long long atoll (const char *);
double atof (const char *);

float strtof (const char *restrict, char **restrict);
double strtod (const char *restrict, char **restrict);
long double strtold (const char *restrict, char **restrict);

long strtol (const char *restrict, char **restrict, int);
unsigned long strtoul (const char *restrict, char **restrict, int);
long long strtoll (const char *restrict, char **restrict, int);
unsigned long long strtoull (const char *restrict, char **restrict, int);

int rand (void);
void srand (unsigned);

void *malloc (size_t);
void *calloc (size_t, size_t);
void *realloc (void *, size_t);
void free (void *);
void *aligned_alloc(size_t, size_t);

_Noreturn void abort (void);
int atexit (void (*) (void));
_Noreturn void exit (int);
_Noreturn void _Exit (int);
int at_quick_exit (void (*) (void));
_Noreturn void quick_exit (int);

char *getenv (const char *);

int system (const char *);

void *bsearch (const void *, const void *, size_t, size_t, int (*)(const void *, const void *));
void qsort (void *, size_t, size_t, int (*)(const void *, const void *));

int abs (int);
long labs (long);
long long llabs (long long);

typedef struct { int quot, rem; } div_t;
typedef struct { long quot, rem; } ldiv_t;
typedef struct { long long quot, rem; } lldiv_t;

div_t div (int, int);
ldiv_t ldiv (long, long);
lldiv_t lldiv (long long, long long);

int mblen (const char *, size_t);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int wctomb (char *, wchar_t);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);




size_t __ctype_get_mb_cur_max(void);
# 99 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\stdlib.h" 3 4
int posix_memalign (void **, size_t, size_t);
int setenv (const char *, const char *, int);
int unsetenv (const char *);
int mkstemp (char *);
int mkostemp (char *, int);
char *mkdtemp (char *);
int getsubopt (char **, char *const *, char **);
int rand_r (unsigned *);






char *realpath (const char *restrict, char *restrict);
long int random (void);
void srandom (unsigned int);
char *initstate (unsigned int, char *, size_t);
char *setstate (char *);
int putenv (char *);
int posix_openpt (int);
int grantpt (int);
int unlockpt (int);
char *ptsname (int);
char *l64a (long);
long a64l (const char *);
void setkey (const char *);
double drand48 (void);
double erand48 (unsigned short [3]);
long int lrand48 (void);
long int nrand48 (unsigned short [3]);
long mrand48 (void);
long jrand48 (unsigned short [3]);
void srand48 (long);
unsigned short *seed48 (unsigned short [3]);
void lcong48 (unsigned short [7]);



# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\alloca.h" 1 3 4
# 9 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\alloca.h" 3 4
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 1 3 4
# 10 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\alloca.h" 2 3 4

void *alloca(size_t);
# 139 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\stdlib.h" 2 3 4
char *mktemp (char *);
int mkstemps (char *, int);
int mkostemps (char *, int, int);
void *valloc (size_t);
void *memalign(size_t, size_t);
int getloadavg(double *, int);
int clearenv(void);
# 61 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\pic32m-libs\\sys\\l1cache.h" 2 3 4
# 93 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\pic32m-libs\\sys\\l1cache.h" 3 4
static __inline__ void * __pic32_alloc_coherent (size_t size)
{
  void *retptr;
  retptr = malloc (size);
  if (retptr == ((void*)0)) {
    return ((void*)0);
  }

  return (retptr);
}

static __inline__ void * __pic32_realloc_coherent (void *p, size_t size)
{
  void *retptr;
  retptr = realloc(p, size);
  if (retptr == ((void*)0)) {
    return ((void*)0);
  }

  return (retptr);
}

static __inline__ void * __pic32_calloc_coherent (size_t num, size_t size)
{
  void *retptr;
  retptr = calloc(num,size);
  if (retptr == ((void*)0)) {
    return ((void*)0);
  }

  return (retptr);
}

static __inline__ void __pic32_free_coherent (void* ptr)
{

  free ((ptr));
}
# 1004 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\xc.h" 2 3
# 6 "main.c" 2
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\string.h" 1 3 4
# 23 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\string.h" 3 4
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 1 3 4
# 526 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 3 4
typedef struct __locale_struct * locale_t;
# 24 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\string.h" 2 3 4

void *memcpy (void *restrict, const void *restrict, size_t);
void *memmove (void *, const void *, size_t);
void *memset (void *, int, size_t);
int memcmp (const void *, const void *, size_t);
void *memchr (const void *, int, size_t);

char *strcpy (char *restrict, const char *restrict);
char *strncpy (char *restrict, const char *restrict, size_t);

char *strcat (char *restrict, const char *restrict);
char *strncat (char *restrict, const char *restrict, size_t);

int strcmp (const char *, const char *);
int strncmp (const char *, const char *, size_t);

int strcoll (const char *, const char *);
size_t strxfrm (char *restrict, const char *restrict, size_t);

char *strchr (const char *, int);
char *strrchr (const char *, int);

size_t strcspn (const char *, const char *);
size_t strspn (const char *, const char *);
char *strpbrk (const char *, const char *);
char *strstr (const char *, const char *);
char *strtok (char *restrict, const char *restrict);

size_t strlen (const char *);

char *strerror (int);




char *strtok_r (char *restrict, const char *restrict, char **restrict);
int strerror_r (int, char *, size_t);
char *stpcpy(char *restrict, const char *restrict);
char *stpncpy(char *restrict, const char *restrict, size_t);
size_t strnlen (const char *, size_t);
char *strdup (const char *);
char *strndup (const char *, size_t);
char *strsignal(int);
char *strerror_l (int, locale_t);
int strcoll_l (const char *, const char *, locale_t);
size_t strxfrm_l (char *restrict, const char *restrict, size_t, locale_t);




void *memccpy (void *restrict, const void *restrict, int, size_t);



char *strsep(char **, const char *);
size_t strlcat (char *, const char *, size_t);
size_t strlcpy (char *, const char *, size_t);
# 7 "main.c" 2

# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\stdbool.h" 1 3 4
# 9 "main.c" 2
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\pic32m-libs\\sys\\attribs.h" 1 3 4
# 50 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\pic32m-libs\\sys\\attribs.h" 3 4
       
# 10 "main.c" 2
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\pic32m-libs\\sys\\kmem.h" 1 3 4
# 52 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\pic32m-libs\\sys\\kmem.h" 3 4
       
# 73 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\pic32m-libs\\sys\\kmem.h" 3 4
typedef unsigned long _paddr_t;
typedef unsigned long _vaddr_t;
# 11 "main.c" 2


# 1 "HardwareProfile_EmberCore.h" 1
# 14 "main.c" 2


#pragma GCC diagnostic ignored "-Wcpp"


#pragma config FNOSC = PRIPLL
#pragma config FPLLIDIV = DIV_2
#pragma config FPLLMUL = MUL_20
#pragma config FPLLODIV = DIV_1
#pragma config FPBDIV = DIV_1
# 47 "main.c"

# 47 "main.c"
void StackTask(void);
void StackApplications(void);

# 1 "TCPIP.h" 1
# 56 "TCPIP.h"
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\generictypedefs.h" 1 3
# 48 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\generictypedefs.h" 3

# 48 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\generictypedefs.h" 3
typedef enum _BOOL { FALSE = 0, TRUE } BOOL;
# 58 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\generictypedefs.h" 3
typedef unsigned char BYTE;
typedef unsigned short int WORD;
typedef unsigned long DWORD;
typedef unsigned long long QWORD;
typedef signed char CHAR;
typedef signed short int SHORT;
typedef signed long LONG;
typedef signed long long LONGLONG;


typedef void VOID;

typedef char CHAR8;
typedef unsigned char UCHAR8;





typedef signed int INT;
typedef signed char INT8;
typedef signed short int INT16;
typedef signed long int INT32;
typedef signed long long INT64;

typedef unsigned int UINT;
typedef unsigned char UINT8;
typedef unsigned short int UINT16;
typedef unsigned long int UINT32;
typedef unsigned long long UINT64;

typedef union _BYTE_VAL
{
    BYTE Val;
    struct
    {
        unsigned char b0:1;
        unsigned char b1:1;
        unsigned char b2:1;
        unsigned char b3:1;
        unsigned char b4:1;
        unsigned char b5:1;
        unsigned char b6:1;
        unsigned char b7:1;
    } bits;
} BYTE_VAL, BYTE_BITS;

typedef union _WORD_VAL
{
    WORD Val;
    BYTE v[2];
    struct
    {
        BYTE LB;
        BYTE HB;
    } byte;
    struct
    {
        unsigned char b0:1;
        unsigned char b1:1;
        unsigned char b2:1;
        unsigned char b3:1;
        unsigned char b4:1;
        unsigned char b5:1;
        unsigned char b6:1;
        unsigned char b7:1;
        unsigned char b8:1;
        unsigned char b9:1;
        unsigned char b10:1;
        unsigned char b11:1;
        unsigned char b12:1;
        unsigned char b13:1;
        unsigned char b14:1;
        unsigned char b15:1;
    } bits;
} WORD_VAL, WORD_BITS;

typedef union _DWORD_VAL
{
    DWORD Val;
 WORD w[2];
    BYTE v[4];
    struct
    {
        WORD LW;
        WORD HW;
    } word;
    struct
    {
        BYTE LB;
        BYTE HB;
        BYTE UB;
        BYTE MB;
    } byte;
    struct
    {
        WORD_VAL low;
        WORD_VAL high;
    }wordUnion;
    struct
    {
        unsigned char b0:1;
        unsigned char b1:1;
        unsigned char b2:1;
        unsigned char b3:1;
        unsigned char b4:1;
        unsigned char b5:1;
        unsigned char b6:1;
        unsigned char b7:1;
        unsigned char b8:1;
        unsigned char b9:1;
        unsigned char b10:1;
        unsigned char b11:1;
        unsigned char b12:1;
        unsigned char b13:1;
        unsigned char b14:1;
        unsigned char b15:1;
        unsigned char b16:1;
        unsigned char b17:1;
        unsigned char b18:1;
        unsigned char b19:1;
        unsigned char b20:1;
        unsigned char b21:1;
        unsigned char b22:1;
        unsigned char b23:1;
        unsigned char b24:1;
        unsigned char b25:1;
        unsigned char b26:1;
        unsigned char b27:1;
        unsigned char b28:1;
        unsigned char b29:1;
        unsigned char b30:1;
        unsigned char b31:1;
    } bits;
} DWORD_VAL;

typedef union _QWORD_VAL
{
    QWORD Val;
 DWORD d[2];
 WORD w[4];
    BYTE v[8];
    struct
    {
        DWORD LD;
        DWORD HD;
    } dword;
    struct
    {
        WORD LW;
        WORD HW;
        WORD UW;
        WORD MW;
    } word;
    struct
    {
        unsigned char b0:1;
        unsigned char b1:1;
        unsigned char b2:1;
        unsigned char b3:1;
        unsigned char b4:1;
        unsigned char b5:1;
        unsigned char b6:1;
        unsigned char b7:1;
        unsigned char b8:1;
        unsigned char b9:1;
        unsigned char b10:1;
        unsigned char b11:1;
        unsigned char b12:1;
        unsigned char b13:1;
        unsigned char b14:1;
        unsigned char b15:1;
        unsigned char b16:1;
        unsigned char b17:1;
        unsigned char b18:1;
        unsigned char b19:1;
        unsigned char b20:1;
        unsigned char b21:1;
        unsigned char b22:1;
        unsigned char b23:1;
        unsigned char b24:1;
        unsigned char b25:1;
        unsigned char b26:1;
        unsigned char b27:1;
        unsigned char b28:1;
        unsigned char b29:1;
        unsigned char b30:1;
        unsigned char b31:1;
        unsigned char b32:1;
        unsigned char b33:1;
        unsigned char b34:1;
        unsigned char b35:1;
        unsigned char b36:1;
        unsigned char b37:1;
        unsigned char b38:1;
        unsigned char b39:1;
        unsigned char b40:1;
        unsigned char b41:1;
        unsigned char b42:1;
        unsigned char b43:1;
        unsigned char b44:1;
        unsigned char b45:1;
        unsigned char b46:1;
        unsigned char b47:1;
        unsigned char b48:1;
        unsigned char b49:1;
        unsigned char b50:1;
        unsigned char b51:1;
        unsigned char b52:1;
        unsigned char b53:1;
        unsigned char b54:1;
        unsigned char b55:1;
        unsigned char b56:1;
        unsigned char b57:1;
        unsigned char b58:1;
        unsigned char b59:1;
        unsigned char b60:1;
        unsigned char b61:1;
        unsigned char b62:1;
        unsigned char b63:1;
    } bits;
} QWORD_VAL;
# 57 "TCPIP.h" 2
# 1 "Compiler.h" 1
# 110 "Compiler.h"
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\pic32m-libs\\p32xxxx.h" 1 3 4
# 111 "Compiler.h" 2
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 1 3
# 49 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\adc10.h" 1 3
# 45 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\adc10.h" 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 1 3
# 86 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int_5xx_6xx_7xx.h" 1 3
# 73 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int_5xx_6xx_7xx.h" 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\int_5xx_6xx_7xx_legacy.h" 1 3
# 74 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int_5xx_6xx_7xx.h" 2 3
# 100 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int_5xx_6xx_7xx.h" 3
typedef enum
{
    INT_CT = 0,

    INT_CS0,
    INT_CS1,

    INT_INT0,
    INT_INT1,
    INT_INT2,
    INT_INT3,
    INT_INT4,

    INT_T1,
    INT_T2,
    INT_T3,
    INT_T4,
    INT_T5,

    INT_IC1,
    INT_IC2,
    INT_IC3,
    INT_IC4,
    INT_IC5,

    INT_IC1E,
    INT_IC2E,
    INT_IC3E,
    INT_IC4E,
    INT_IC5E,

    INT_OC1,
    INT_OC2,
    INT_OC3,
    INT_OC4,
    INT_OC5,

    INT_CN,

    INT_SPI1,
    INT_SPI2A,
    INT_SPI1A,
    INT_SPI3A,

    INT_SPI1E,
    INT_SPI2AE,
    INT_SPI1AE,
    INT_SPI3AE,

    INT_SPI1TX,
    INT_SPI2ATX,
    INT_SPI1ATX,
    INT_SPI3ATX,

    INT_SPI1RX,
    INT_SPI2ARX,
    INT_SPI1ARX,
    INT_SPI3ARX,

    INT_I2C1,
    INT_I2C2,
    INT_I2C1A,
    INT_I2C2A,
    INT_I2C3A,

    INT_I2C1B,
    INT_I2C2B,
    INT_I2C1AB,
    INT_I2C2AB,
    INT_I2C3AB,

    INT_I2C1S,
    INT_I2C2S,
    INT_I2C1AS,
    INT_I2C2AS,
    INT_I2C3AS,

    INT_I2C1M,
    INT_I2C2M,
    INT_I2C1AM,
    INT_I2C2AM,
    INT_I2C3AM,

    INT_U1A,
    INT_U3A,
    INT_U2A,
    INT_U1B,
    INT_U3B,
    INT_U2B,

    INT_U1AE,
    INT_U3AE,
    INT_U2AE,
    INT_U1BE,
    INT_U3BE,
    INT_U2BE,

    INT_U1ARX,
    INT_U3ARX,
    INT_U2ARX,
    INT_U1BRX,
    INT_U3BRX,
    INT_U2BRX,

    INT_U1ATX,
    INT_U3ATX,
    INT_U2ATX,
    INT_U1BTX,
    INT_U3BTX,
    INT_U2BTX,

    INT_AD1,

    INT_PMP,
    INT_PMPE,

    INT_CMP1,
    INT_CMP2,

    INT_FSCM,

    INT_FCE,

    INT_RTCC,

    INT_DMA0,
    INT_DMA1,
    INT_DMA2,
    INT_DMA3,
    INT_DMA4,
    INT_DMA5,
    INT_DMA6,
    INT_DMA7,

    INT_USB,

    INT_CAN1,
    INT_CAN2,

    INT_ETHERNET,

    INT_NUM
}INT_SOURCE;
# 320 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int_5xx_6xx_7xx.h" 3
typedef enum
{
    INT_CORE_TIMER_VECTOR,

    INT_CORE_SOFTWARE_0_VECTOR,
    INT_CORE_SOFTWARE_1_VECTOR,

    INT_EXTERNAL_0_VECTOR,
    INT_EXTERNAL_1_VECTOR,
    INT_EXTERNAL_2_VECTOR,
    INT_EXTERNAL_3_VECTOR,
    INT_EXTERNAL_4_VECTOR,

    INT_TIMER_1_VECTOR,
    INT_TIMER_2_VECTOR,
    INT_TIMER_3_VECTOR,
    INT_TIMER_4_VECTOR,
    INT_TIMER_5_VECTOR,

    INT_INPUT_CAPTURE_1_VECTOR,
    INT_INPUT_CAPTURE_2_VECTOR,
    INT_INPUT_CAPTURE_3_VECTOR,
    INT_INPUT_CAPTURE_4_VECTOR,
    INT_INPUT_CAPTURE_5_VECTOR,

    INT_OUTPUT_COMPARE_1_VECTOR,
    INT_OUTPUT_COMPARE_2_VECTOR,
    INT_OUTPUT_COMPARE_3_VECTOR,
    INT_OUTPUT_COMPARE_4_VECTOR,
    INT_OUTPUT_COMPARE_5_VECTOR,

    INT_SPI_1_VECTOR,
    INT_SPI_2A_VECTOR,
    INT_SPI_1A_VECTOR,
    INT_SPI_3A_VECTOR,

    INT_UART_1A_VECTOR,
    INT_UART_3A_VECTOR,
    INT_UART_2A_VECTOR,
    INT_UART_1B_VECTOR,
    INT_UART_3B_VECTOR,
    INT_UART_2B_VECTOR,

    INT_I2C_1_VECTOR,
    INT_I2C_2_VECTOR,
    INT_I2C_1A_VECTOR,
    INT_I2C_2A_VECTOR,
    INT_I2C_3A_VECTOR,

    INT_CHANGE_NOTICE_VECTOR,
    INT_ADC_VECTOR,
    INT_PMP_VECTOR,

    INT_COMPARATOR_1_VECTOR,
    INT_COMPARATOR_2_VECTOR,

    INT_FAIL_SAFE_MONITOR_VECTOR,
    INT_RTCC_VECTOR,

    INT_DMA_0_VECTOR,
    INT_DMA_1_VECTOR,
    INT_DMA_2_VECTOR,
    INT_DMA_3_VECTOR,
    INT_DMA_4_VECTOR,
    INT_DMA_5_VECTOR,
    INT_DMA_6_VECTOR,
    INT_DMA_7_VECTOR,

    INT_FCE_VECTOR,

    INT_USB_1_VECTOR,

    INT_CAN_1_VECTOR,
    INT_CAN_2_VECTOR,

    INT_ETH_VECTOR


}INT_VECTOR;
# 87 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 2 3
# 96 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\int_legacy.h" 1 3
# 64 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\int_legacy.h" 3
void __attribute__ ((nomips16)) INTEnableSystemMultiVectoredInt(void);
# 78 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\int_legacy.h" 3
void __attribute__ ((nomips16)) INTEnableSystemSingleVectoredInt(void);
# 416 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\int_legacy.h" 3
void __attribute__((nomips16)) SetCoreSW0(void);
# 447 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\int_legacy.h" 3
void __attribute__((nomips16)) SetCoreSW1(void);
# 481 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\int_legacy.h" 3
void __attribute__((nomips16)) ClearCoreSW0(void);
# 515 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\int_legacy.h" 3
void __attribute__((nomips16)) ClearCoreSW1(void);
# 97 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 2 3
# 114 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
typedef enum
{

    INT_REGISTOR_SET_SELECT_NONE = 0 ,

    INT_REGISTOR_SET_SELECT_SS0 = (0x00010000)

}INT_SV_SS;
# 133 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
typedef enum
{

    INT_PRIORITY_DISABLED = 0 ,

    INT_PRIORITY_LEVEL_1 = 1 ,

    INT_PRIORITY_LEVEL_2 = 2 ,

    INT_PRIORITY_LEVEL_3 = 3 ,

    INT_PRIORITY_LEVEL_4 = 4 ,

    INT_PRIORITY_LEVEL_5 = 5 ,

    INT_PRIORITY_LEVEL_6 = 6 ,

    INT_PRIORITY_LEVEL_7 = 7
}INT_PRIORITY;
# 163 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
typedef enum
{

    INT_SUB_PRIORITY_LEVEL_0 = 0 ,

    INT_SUB_PRIORITY_LEVEL_1 = 1 ,

    INT_SUB_PRIORITY_LEVEL_2 = 2 ,

    INT_SUB_PRIORITY_LEVEL_3 = 3
}INT_SUB_PRIORITY;
# 184 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
typedef enum
{

    INT_DISABLED = 0 ,

    INT_ENABLED = 1
}INT_EN_DIS;
# 200 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
typedef enum
{

    INT_TPC_DISABLE = 0x00000700 ,

    INT_TPC_GROUP_PRI_LEVEL_1 = 1 ,

    INT_TPC_GROUP_PRI_LEVEL_2 = 2 ,

    INT_TPC_GROUP_PRI_LEVEL_3 = 3 ,

    INT_TPC_GROUP_PRI_LEVEL_4 = 4 ,

    INT_TPC_GROUP_PRI_LEVEL_5 = 5 ,

    INT_TPC_GROUP_PRI_LEVEL_6 = 6 ,

    INT_TPC_GROUP_PRI_LEVEL_7 = 7
}INT_TPC_GROUP;
# 229 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
typedef enum
{

    INT_VS_32 = 32 ,

    INT_VS_64 = 64 ,

    INT_VS_128 = 128 ,

    INT_VS_256 = 256 ,

    INT_VS_512 = 512
}INT_VS;
# 252 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
typedef enum
{

    INT_SYSTEM_CONFIG_MULT_VECTOR,

    INT_SYSTEM_CONFIG_SINGLE_VECTOR
}INT_SYSTEM_CONFIG;
# 296 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
unsigned int __attribute__((nomips16)) INTDisableInterrupts(void);
# 328 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
unsigned int __attribute__((nomips16)) INTEnableInterrupts(void);
# 363 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
void __attribute__((nomips16)) INTRestoreInterrupts(unsigned int status);
# 413 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
void __attribute__ ((nomips16)) INTConfigureSystem(INT_SYSTEM_CONFIG config);
# 445 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
void __attribute__((nomips16)) INTSetEBASE(unsigned int ebase_address);
# 475 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
void __attribute__((nomips16)) INTSetVectorSpacing(INT_VS vector_spacing);
# 505 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
extern inline void __attribute__ ((always_inline)) INTSingleVectorRegisterSet(INT_SV_SS reg_set)
{
    INTCONCLR = reg_set;
    INTCONSET = reg_set;
}
# 545 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
extern inline unsigned int __attribute__ ((always_inline)) INTGetInterruptVectorNumber(void)
{
    return (unsigned int)(INTSTATbits.VEC);
}
# 578 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
extern inline INT_PRIORITY __attribute__ ((always_inline)) INTGetInterruptVectorPriority(void)
{
    return (INT_PRIORITY)(INTSTATbits.SRIPL);
}
# 620 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
extern inline void __attribute__ ((always_inline)) INTGetInterruptVectorNumberAndPriority(unsigned int *number, INT_PRIORITY *priority)
{
    *number = INTSTAT;
    *priority = (INT_PRIORITY)((*number >> 8) & 7);
    *number &= 0x3F;
}
# 654 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
void INTClearFlag(INT_SOURCE source);
# 684 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
void INTSetFlag(INT_SOURCE source);
# 717 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
unsigned int INTGetFlag(INT_SOURCE source);
# 747 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
void INTEnable(INT_SOURCE source, INT_EN_DIS enable);
# 780 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
unsigned int INTGetEnable(INT_SOURCE source);
# 810 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
void INTSetVectorPriority(INT_VECTOR vector, INT_PRIORITY priority);
# 841 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
INT_PRIORITY INTGetVectorPriority(INT_VECTOR vector);
# 871 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
void INTSetVectorSubPriority(INT_VECTOR vector, INT_SUB_PRIORITY subPriority);
# 902 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
INT_SUB_PRIORITY INTGetVectorSubPriority(INT_VECTOR vector);
# 932 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
extern inline void __attribute__ ((always_inline)) INTSetIntProximityTimerReload(unsigned int time)
{
    IPTMR = time;
}
# 965 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
extern inline unsigned int __attribute__ ((always_inline)) INTGetIntProximityTimer(void)
{
    return IPTMR;
}
# 996 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
extern inline void __attribute__ ((always_inline)) INTSetTemporalProximityControl(INT_TPC_GROUP level)
{
    INTCONCLR = INT_TPC_DISABLE;

    if(level != INT_TPC_DISABLE)
        INTCONSET = (level << 0x00000008);
}
# 1043 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
void __attribute__((nomips16)) CoreSetSoftwareInterrupt0(void);
# 1074 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
void __attribute__((nomips16)) CoreSetSoftwareInterrupt1(void);
# 1108 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
void __attribute__((nomips16)) CoreClearSoftwareInterrupt0(void);
# 1142 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\int.h" 3
void __attribute__((nomips16)) CoreClearSoftwareInterrupt1(void);
# 46 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\adc10.h" 2 3
# 50 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 2 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\bmx.h" 1 3
# 51 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 2 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\cmp.h" 1 3
# 52 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 2 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\cvref.h" 1 3
# 53 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 2 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma.h" 1 3
# 81 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma.h" 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 1 3
# 65 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
    typedef enum
    {
        DMA_CHANNEL0,

        DMA_CHANNEL1,

        DMA_CHANNEL2,

        DMA_CHANNEL3,

        DMA_CHANNEL4,

        DMA_CHANNEL5,

        DMA_CHANNEL6,

        DMA_CHANNEL7,
# 91 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
        DMA_CHANNELS
    }DmaChannel;



    typedef enum
    {
        DMA_CHN_PRI0,
        DMA_CHN_PRI1,
        DMA_CHN_PRI2,
        DMA_CHN_PRI3
    }DmaChannelPri;





    typedef enum
    {
        DMA_OPEN_DEFAULT = 0,
        DMA_OPEN_AUTO = 0x00000010,
        DMA_OPEN_CHAIN_LOW = (0x00000020|0x00000100),
        DMA_OPEN_CHAIN_HI = (0x00000020),
        DMA_OPEN_DET_EN = 0x00000040,
        DMA_OPEN_ENABLE = 0x00000080,
        DMA_OPEN_MATCH = 0x80000000,
    }DmaOpenFlags;


    typedef enum
    {
        DMA_EV_ERR = 0x1,
        DMA_EV_ABORT = 0x2,
        DMA_EV_CELL_DONE = 0x4,
        DMA_EV_BLOCK_DONE = 0x8,
        DMA_EV_DST_HALF = 0x10,
        DMA_EV_DST_FULL = 0x20,
        DMA_EV_SRC_HALF = 0x40,
        DMA_EV_SRC_FULL = 0x80,

        DMA_EV_ALL_EVNTS= (DMA_EV_ERR|DMA_EV_ABORT|DMA_EV_CELL_DONE|DMA_EV_BLOCK_DONE|DMA_EV_DST_HALF|
                                    DMA_EV_DST_FULL|DMA_EV_SRC_HALF|DMA_EV_SRC_FULL)
    }DmaEvFlags;


    typedef enum
    {
        DMA_TXFER_OK,
        DMA_TXFER_ADD_ERR,
        DMA_TXFER_ABORT,
        DMA_TXFER_BC_ERR,
        DMA_TXFER_CC_ERR,
        DMA_TXFER_TMO
    }DmaTxferRes;

    typedef enum
    {
        DMA_WAIT_NOT,
        DMA_WAIT_CELL,
        DMA_WAIT_BLOCK
    }DmaWaitMode;

    typedef enum
    {
        DMA_CHKSUM_CRC,
        DMA_CHKSUM_IP,
    }DmaChksumType;

    typedef enum
    {
        DMA_BITO_MSb,
        DMA_BITO_LSb,
    }DmaBitOrder;

    typedef enum
    {
        DMA_REORDER_NOT,
        DMA_REORDER_ENDIAN,
        DMA_REORDER_SWAP_HALF,
        DMA_REORDER_SWAP_BYTE,
    }DmaReorderMode;
# 211 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     void DmaChnOpen(DmaChannel chn, DmaChannelPri chPri, DmaOpenFlags oFlags);
# 230 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     void DmaChnEnable(DmaChannel chn);
# 249 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     void DmaChnDisable(DmaChannel chn);
# 281 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     void DmaChnSetTxfer(DmaChannel chn, const void* vSrcAdd, void* vDstAdd, int srcSize, int dstSize, int cellSize);
# 301 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     void DmaChnSetSrcAdd(DmaChannel chn, const void* vSrcAdd);
# 320 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     void DmaChnSetDstAdd(DmaChannel chn, void* vDstAdd);
# 340 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     void DmaChnSetMatchPattern(DmaChannel chn, int pattern);
# 359 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     int DmaChnGetMatchPattern(DmaChannel chn);
# 393 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     DmaTxferRes DmaChnStartTxfer(DmaChannel chn, DmaWaitMode wMode, unsigned long retries);
# 412 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     void DmaChnForceTxfer(DmaChannel chn);
# 431 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     void DmaChnAbortTxfer(DmaChannel chn);
# 464 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     void DmaChnSetEvEnableFlags(DmaChannel chn, DmaEvFlags eFlags);
# 495 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     void DmaChnClrEvEnableFlags(DmaChannel chn, DmaEvFlags eFlags);
# 525 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     void DmaChnWriteEvEnableFlags(DmaChannel chn, DmaEvFlags eFlags);
# 553 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     DmaEvFlags DmaChnGetEvEnableFlags(DmaChannel chn);
# 584 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     void DmaChnClrEvFlags(DmaChannel chn, DmaEvFlags eFlags);
# 612 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     DmaEvFlags DmaChnGetEvFlags(DmaChannel chn);
# 648 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     DmaTxferRes DmaChnMemcpy(void* s1, const void* s2, int n, DmaChannel chn, DmaChannelPri chPri);
# 680 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     DmaTxferRes DmaChnStrcpy(char* s1, const char* s2, DmaChannel chn, DmaChannelPri chPri);
# 715 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     DmaTxferRes DmaChnStrncpy(char* s1, const char* s2, int n, DmaChannel chn, DmaChannelPri chPri);
# 748 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     DmaTxferRes DmaChnMemCrc(void* d, const void* s, int n, DmaChannel chn, DmaChannelPri chPri);
# 781 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     DmaTxferRes DmaChnMemChecksum(void* d, const void* s, int n, DmaChannel chn, DmaChannelPri chPri);
# 808 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
    extern __inline__ void __attribute__((always_inline)) DmaSfmConfigure(DmaChksumType cType, DmaBitOrder bitO, DmaReorderMode rMode)
    {
        DCRCCONCLR=0x00000020|0x01000000|0x30000000;
        DCRCCONSET=(cType<<0x00000005)|(bitO<<0x00000018)|(rMode<<0x0000001C);
    }
# 838 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
    extern __inline__ void __attribute__((always_inline)) DmaSfmTxferReorder(int enable)
    {
        DCRCCONCLR=0x08000000;
        DCRCCONSET=(enable<<0x0000001B);
    }
# 881 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
    extern __inline__ void __attribute__((always_inline)) DmaSfmCrcConfigure(unsigned int polynomial, int pLen, unsigned int seed)
    {
        DCRCCONCLR=0x00001F00;
        DCRCCONSET=(pLen-1)<<0x00000008;
        DCRCDATA=seed;
        DCRCXOR=polynomial;
    }
# 917 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
    void DmaSfmAttachChannel(DmaChannel chn, int appendMode);
# 938 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
    extern __inline__ int __attribute__((always_inline)) DmaSfmChecksum(void)
    {
        return DCRCDATA;
    }
# 964 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
    extern __inline__ void __attribute__((always_inline)) DmaSfmSetSeed(unsigned int seed)
    {
        DCRCDATA=seed;
    }
# 976 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
    typedef struct
    {
        union
        {
            struct
            {
                unsigned int chn: 3;
                unsigned int rdOp: 1;
            };
            unsigned int w;
        }lastAccess;
        void* lastAddress;
    }DmaStatus;

    typedef enum
    {
        DMA_GFLG_SUSPEND = 0x00001000,
        DMA_GFLG_ON = 0x00008000,

        DMA_GFLG_ALL_FLAGS= DMA_GFLG_SUSPEND|DMA_GFLG_ON
    }DmaGlblFlags;




    typedef enum
    {
        DMA_EV_ABORT_IRQ_EN = 0x00000008,
        DMA_EV_START_IRQ_EN = 0x00000010,


        DMA_EV_MATCH_EN = 0x00000020,



        _DMA_EV_MAX_MASK = 0x00FF0000,
    }DmaEvCtrlFlags;
# 1024 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
    typedef enum
    {
        DMA_CTL_AUTO_EN = 0x00000010,
        DMA_CTL_CHAIN_EN = 0x00000020,
        DMA_CTL_DET_EN = 0x00000040,
        DMA_CTL_CHN_EN = 0x00000080,
        DMA_CTL_CHAIN_DIR = 0x00000100,


    }DmaChnCtrlFlags;






    typedef struct
    {
        void* vSrcAdd;
        void* vDstAdd;
        int srcSize;
        int dstSize;
        int cellSize;
    }DmaTxferCtrl;
# 1073 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
    extern __inline__ void __attribute__((always_inline)) DmaEnable(int enable)
    {
        if(enable)
        {
            DMACONSET=0x00008000;
        }
        else
        {
            DMACONCLR=0x00008000;
            while(DMACONbits.ON);
        }
    }
# 1125 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
        extern __inline__ int __attribute__((always_inline)) DmaSuspend(void)
    {
        int suspSt;
        if(!(suspSt=DMACONbits.SUSPEND))
        {
            DMACONSET=0x00001000;
            while((DMACONbits.DMABUSY));
        }
        return suspSt;
    }
# 1155 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
        extern __inline__ void __attribute__((always_inline)) DmaResume(int susp)
    {
        if(susp)
        {
            DmaSuspend();
        }
        else
        {
            DMACONCLR=0x00001000;
        }
    }
# 1189 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     void DmaGetStatus(DmaStatus* pStat);
# 1213 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
        extern __inline__ void __attribute__((always_inline)) DmaSetGlobalFlags(DmaGlblFlags gFlags)
    {
        DMACONSET=gFlags;
    }
# 1240 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
        extern __inline__ void __attribute__((always_inline)) DmaClrGlobalFlags(DmaGlblFlags gFlags)
    {
        DMACONCLR=gFlags;
    }
# 1267 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
        extern __inline__ void __attribute__((always_inline)) DmaWriteGlobalFlags(DmaGlblFlags gFlags)
    {
        DMACON=gFlags;
    }
# 1291 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
        extern __inline__ DmaGlblFlags __attribute__((always_inline)) DmaGetGlobalFlags(void)
    {
        return (DmaGlblFlags)DMACON;
    }
# 1314 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
    extern __inline__ int __attribute__((always_inline)) DmaGetMaxTxferSize(void)
    {
        return 65536;
    }



    typedef enum
    {
        DMA_CONFIG_DEFAULT = 0,
        DMA_CONFIG_AUTO = 0x00000010,
        DMA_CONFIG_CHAIN_LOW = (0x00000020|0x00000100),
        DMA_CONFIG_CHAIN_HI = (0x00000020),
        DMA_CONFIG_DET_EN = 0x00000040,
        DMA_CONFIG_ENABLE = 0x00000080,
        DMA_CONFIG_MATCH = 0x80000000,
    }DmaConfigFlags;
# 1369 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
    void DmaChnConfigure(DmaChannel chn, DmaChannelPri chPri, DmaConfigFlags cFlags);
# 1390 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     int DmaChnGetSrcPnt(DmaChannel chn);
# 1410 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     int DmaChnGetDstPnt(DmaChannel chn);
# 1430 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     int DmaChnGetCellPnt(DmaChannel chn);
# 1466 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     void DmaChnSetEventControlFlags(DmaChannel chn, DmaEvCtrlFlags dmaEvCtrl);
# 1501 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     void DmaChnClrEventControlFlags(DmaChannel chn, DmaEvCtrlFlags dmaEvCtrl);
# 1537 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     void DmaChnWriteEventControlFlags(DmaChannel chn, DmaEvCtrlFlags dmaEvCtrl);
# 1608 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     DmaEvCtrlFlags DmaChnGetEventControl(DmaChannel chn);
# 1644 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     void DmaChnSetControlFlags(DmaChannel chn, DmaChnCtrlFlags dmaChnCtrl);
# 1679 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     void DmaChnClrControlFlags(DmaChannel chn, DmaChnCtrlFlags dmaChnCtrl);
# 1713 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     void DmaChnWriteControlFlags(DmaChannel chn, DmaChnCtrlFlags dmaChnCtrl);
# 1780 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     DmaChnCtrlFlags DmaChnGetControlFlags(DmaChannel chn);
# 1801 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     int DmaChnGetEvDetect(DmaChannel chn);
# 1831 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     void DmaChnGetTxfer(DmaChannel chn, DmaTxferCtrl* pTxCtrl, int mapToK0);
# 1853 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
    extern __inline__ void __attribute__((always_inline)) DmaSfmEnable(int enable)
    {
        if(enable)
        {
            DCRCCONSET=0x00000080;
        }
        else
        {
            DCRCCONCLR=0x00000080;
        }
    }
# 1885 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
    extern __inline__ int __attribute__((always_inline)) DmaSfmGetEnable(void)
    {
        return DCRCCONbits.CRCEN!=0;
    }
# 1913 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
    extern __inline__ void __attribute__((always_inline)) DmaSfmAppendEnable(int enable)
    {
        if(enable)
        {
            DCRCCONSET=0x00000040;
        }
        else
        {
            DCRCCONCLR=0x00000040;
        }
    }
# 1945 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
    extern __inline__ int __attribute__((always_inline)) DmaSfmGetAppendMode(void)
    {
        return DCRCCONbits.CRCAPP!=0;
    }
# 1969 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
    extern __inline__ void __attribute__((always_inline)) DmaSfmSetAttach(DmaChannel chn)
    {
        DCRCCONCLR=0x00000007;
        DCRCCONSET=chn;
    }
# 1994 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
    extern __inline__ DmaChannel __attribute__((always_inline)) DmaSfmGetAttach(void)
    {
        return (DmaChannel)DCRCCONbits.CRCCH;
    }
# 2017 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
    extern __inline__ void __attribute__((always_inline)) DmaCrcSetPLen(int pLen)
    {
        DCRCCONCLR=0x00001F00;
        DCRCCONSET=(pLen)-1;
    }
# 2041 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
    extern __inline__ int __attribute__((always_inline)) DmaCrcGetPLen(void)
    {
        return DCRCCONbits.PLEN+1;
    }
# 2065 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
    extern __inline__ void __attribute__((always_inline)) DmaCrcSetShiftFeedback(unsigned int feedback)
    {
        DCRCXOR=feedback;
    }
# 2090 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
    extern __inline__ unsigned int __attribute__((always_inline)) DmaCrcGetShiftFeedback(void)
    {
        return DCRCXOR;
    }
# 2128 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     void DmaChnSetEvFlags(DmaChannel chn, DmaEvFlags eFlags);
# 2158 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
     void DmaChnWriteEvFlags(DmaChannel chn, DmaEvFlags eFlags);
# 2168 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\dma_legacy.h" 1 3
# 48 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\dma_legacy.h" 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma.h" 1 3
# 49 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\dma_legacy.h" 2 3
# 734 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\dma_legacy.h" 3
typedef enum
{

    DMA_REG_IX_CON,
    DMA_REG_IX_CON_CLR,
    DMA_REG_IX_CON_SET,
    DMA_REG_IX_CON_INV,

    DMA_REG_IX_ECON,
    DMA_REG_IX_ECON_CLR,
    DMA_REG_IX_ECON_SET,
    DMA_REG_IX_ECON_INV,

    DMA_REG_IX_INTR,
    DMA_REG_IX_INTR_CLR,
    DMA_REG_IX_INTR_SET,
    DMA_REG_IX_INTR_INV,

    DMA_REG_IX_SSA,
    DMA_REG_IX_SSA_CLR,
    DMA_REG_IX_SSA_SET,
    DMA_REG_IX_SSA_INV,

    DMA_REG_IX_DSA,
    DMA_REG_IX_DSA_CLR,
    DMA_REG_IX_DSA_SET,
    DMA_REG_IX_DSA_INV,

    DMA_REG_IX_SSIZ,
    DMA_REG_IX_SSIZ_CLR,
    DMA_REG_IX_SSIZ_SET,
    DMA_REG_IX_SSIZ_INV,

    DMA_REG_IX_DSIZ,
    DMA_REG_IX_DSIZ_CLR,
    DMA_REG_IX_DSIZ_SET,
    DMA_REG_IX_DSIZ_INV,

    DMA_REG_IX_SPTR,
    DMA_REG_IX_RESERVED0,
    DMA_REG_IX_RESERVED1,
    DMA_REG_IX_RESERVED2,

    DMA_REG_IX_DPTR,
    DMA_REG_IX_RESERVED3,
    DMA_REG_IX_RESERVED4,
    DMA_REG_IX_RESERVED5,

    DMA_REG_IX_CSIZ,
    DMA_REG_IX_CSIZ_CLR,
    DMA_REG_IX_CSIZ_SET,
    DMA_REG_IX_CSIZ_INV,

    DMA_REG_IX_CPTR,
    DMA_REG_IX_RESERVED6,
    DMA_REG_IX_RESERVED7,
    DMA_REG_IX_RESERVED8,

    DMA_REG_IX_DAT,
    DMA_REG_IX_DAT_CLR,
    DMA_REG_IX_DAT_SET,
    DMA_REG_IX_DAT_INV,
}DmaChnRegIx;
# 817 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\dma_legacy.h" 3
 void DmaChnSetRegister(DmaChannel chn, DmaChnRegIx regIx, unsigned int value);
# 838 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\dma_legacy.h" 3
 unsigned int DmaChnGetRegister(DmaChannel chn, DmaChnRegIx regIx);
# 2169 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma_5xx_6xx_7xx.h" 2 3
# 82 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\dma.h" 2 3
# 54 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 2 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 1 3
# 64 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\i2c_legacy.h" 1 3
# 568 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\i2c_legacy.h" 3
    void IdleI2C1( void );



    void IdleI2C2( void );
# 594 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\i2c_legacy.h" 3
    unsigned char MasterReadI2C1( void );



    unsigned char MasterReadI2C2( void );
# 620 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\i2c_legacy.h" 3
    unsigned int MasterWriteI2C1( unsigned char data );



    unsigned int MasterWriteI2C2( unsigned char data );
# 650 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\i2c_legacy.h" 3
    unsigned int MastergetsI2C1( unsigned int length, unsigned char *data,
                                    unsigned int I2cDataWait );



    unsigned int MastergetsI2C2( unsigned int length, unsigned char *data,
                                    unsigned int I2cDataWait );
# 678 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\i2c_legacy.h" 3
    unsigned int MasterputsI2C1( unsigned char *data );



    unsigned int MasterputsI2C2( unsigned char *data );
# 704 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\i2c_legacy.h" 3
    unsigned char SlaveReadI2C1( void );



    unsigned char SlaveReadI2C2( void );
# 729 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\i2c_legacy.h" 3
    void SlaveWriteI2C1( unsigned char data );



    void SlaveWriteI2C2( unsigned char data );
# 756 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\i2c_legacy.h" 3
    unsigned int SlavegetsI2C1( unsigned char *data,
                                   unsigned int I2cDataWait );



    unsigned int SlavegetsI2C2( unsigned char *data,
                                   unsigned int I2cDataWait );
# 784 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\i2c_legacy.h" 3
    unsigned int SlaveputsI2C1( unsigned char *data );



    unsigned int SlaveputsI2C2( unsigned char *data );
# 65 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 2 3
# 90 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
typedef enum
{


    I2C1,




    I2C2,




    I2C3,




    I2C4,




    I2C5,



    I2C_NUMBER_OF_MODULES

} I2C_MODULE;
# 133 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
typedef union
{


    UINT8 byte;

    struct
    {

        UINT8 rw : 1;


        UINT8 address : 7;
    };

} I2C_7_BIT_ADDRESS;
# 161 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
typedef union
{

    UINT16 both_bytes;

    struct
    {

        BYTE first_byte;


        BYTE second_byte;
    };

    struct
    {

        UINT16 rw : 1;


        UINT16 high_bits : 2;


        UINT16 const_bits : 5;


        UINT16 low_bits : 8;
    };

} I2C_10_BIT_ADDRESS;
# 281 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
typedef enum
{

    I2C_SUCCESS = 0,


    I2C_ERROR,


    I2C_MASTER_BUS_COLLISION,



    I2C_RECEIVE_OVERFLOW

} I2C_RESULT;
# 315 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
typedef enum
{


    I2C_ENABLE_SLAVE_CLOCK_STRETCHING
                             = 0x00000040 ,



    I2C_ENABLE_SMB_SUPPORT
                             = 0x00000100 ,


    I2C_ENABLE_HIGH_SPEED
                             = 0x00000200 ,


    I2C_STOP_IN_IDLE
                             = 0x00002000

} I2C_CONFIGURATION;
# 353 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
typedef enum
{

    I2C_USE_7BIT_ADDRESS
                             = 0x00000000 ,


    I2C_USE_10BIT_ADDRESS
                             = 0x00000400 ,



    I2C_ENABLE_GENERAL_CALL_ADDRESS
                             = 0x00000080 ,



    I2C_USE_RESERVED_ADDRESSES
                             = 0x00000800

} I2C_ADDRESS_MODE;
# 392 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
typedef enum
{


    I2C_TRANSMITTER_FULL
                             = 0x00000001 ,



    I2C_DATA_AVAILABLE
                            = 0x00000002 ,




    I2C_SLAVE_READ
                             = 0x00000004 ,


    I2C_START
                             = 0x00000008 ,


    I2C_STOP
                             = 0x00000010 ,



    I2C_SLAVE_DATA
                             = 0x00000020 ,



    I2C_RECEIVER_OVERFLOW
                             = 0x00000040 ,



    I2C_TRANSMITTER_OVERFLOW
                             = 0x00000080 ,



    I2C_10BIT_ADDRESS
                             = 0x00000100 ,


    I2C_GENERAL_CALL
                             = 0x00000200 ,



    I2C_ARBITRATION_LOSS
                             = 0x00000400 ,


    I2C_TRANSMITTER_BUSY
                             = 0x00004000 ,


    I2C_BYTE_ACKNOWLEDGED
                             = 0x00008000

} I2C_STATUS;
# 728 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
void I2CEnable( I2C_MODULE id, BOOL enable );
# 765 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
void I2CConfigure ( I2C_MODULE id, I2C_CONFIGURATION flags );
# 809 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
UINT32 I2CSetFrequency ( I2C_MODULE id, UINT32 sourceClock, UINT32 i2cClock );
# 862 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
void I2CSetSlaveAddress ( I2C_MODULE id, UINT16 address, UINT16 mask, I2C_ADDRESS_MODE flags );
# 902 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
BOOL I2CBusIsIdle( I2C_MODULE id );
# 941 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
I2C_RESULT I2CStart( I2C_MODULE id );
# 978 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
I2C_RESULT I2CRepeatStart ( I2C_MODULE id );
# 1012 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
void I2CStop ( I2C_MODULE id );
# 1051 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
BOOL I2CTransmitterIsReady ( I2C_MODULE id );
# 1093 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
I2C_RESULT I2CSendByte ( I2C_MODULE id, BYTE data );
# 1136 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
BOOL I2CTransmissionHasCompleted ( I2C_MODULE id );
# 1179 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
BOOL I2CByteWasAcknowledged ( I2C_MODULE id );
# 1220 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
I2C_RESULT I2CReceiverEnable ( I2C_MODULE id, BOOL enable );
# 1258 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
BOOL I2CReceivedDataIsAvailable ( I2C_MODULE id );
# 1304 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
BOOL I2CReceivedByteIsAnAddress ( I2C_MODULE id );
# 1342 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
BYTE I2CGetByte ( I2C_MODULE id );
# 1384 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
void I2CAcknowledgeByte ( I2C_MODULE id, BOOL ack );
# 1426 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
BOOL I2CAcknowledgeHasCompleted ( I2C_MODULE id );
# 1471 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
BOOL I2CSlaveDataReadRequested ( I2C_MODULE id );
# 1505 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
void I2CSlaveClockHold ( I2C_MODULE id );
# 1541 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
void I2CSlaveClockRelease ( I2C_MODULE id );
# 1579 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
I2C_STATUS I2CGetStatus ( I2C_MODULE id );
# 1619 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\i2c.h" 3
void I2CClearStatus ( I2C_MODULE id, I2C_STATUS status );
# 55 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 2 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\incap.h" 1 3
# 350 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\incap.h" 3
    void ReadCapture1(unsigned int * buffer);



    void ReadCapture2(unsigned int * buffer);



    void ReadCapture3(unsigned int * buffer);



    void ReadCapture4(unsigned int * buffer);



    void ReadCapture5(unsigned int * buffer);
# 56 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 2 3

# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\nvm.h" 1 3
# 80 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\nvm.h" 3
unsigned int NVMProgram(void * address, const void * data, unsigned int size, void* pagebuff);
# 98 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\nvm.h" 3
unsigned int NVMWriteWord(void* address, unsigned int data);
# 117 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\nvm.h" 3
unsigned int NVMWriteRow(void* address, void* data);
# 135 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\nvm.h" 3
unsigned int NVMErasePage(void* address);
# 151 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\nvm.h" 3
unsigned int NVMClearError(void);
# 58 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 2 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\outcompare.h" 1 3
# 59 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 2 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\pcache.h" 1 3
# 383 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\pcache.h" 3
void __attribute__ ((nomips16)) CheKseg0CacheOff();
# 398 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\pcache.h" 3
void __attribute__ ((nomips16)) CheKseg0CacheOn();
# 60 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 2 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\pmp.h" 1 3
# 57 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\pmp.h" 3
typedef enum {BUF0, BUF1, BUF2, BUF3}BUFFER ;
# 323 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\pmp.h" 3
extern inline void __attribute__((always_inline)) PMPSetAddress(unsigned int addrs)
{
    while((PMMODEbits.BUSY));
    PMADDR = addrs;
}
# 404 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\pmp.h" 3
extern inline unsigned int __attribute__((always_inline)) PMPMasterRead(void)
{
    while((PMMODEbits.BUSY));
    return(PMDIN);
}
# 434 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\pmp.h" 3
void PMPMasterReadByteBlock(unsigned int addrs, unsigned int bytes, unsigned char* pDest);
# 460 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\pmp.h" 3
void PMPMasterReadWordBlock(unsigned int addrs, unsigned int words, unsigned short* pDest);
# 488 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\pmp.h" 3
extern inline void __attribute__((always_inline)) PMPMasterWrite(unsigned short value)
{
    while((PMMODEbits.BUSY));
    PMDIN = value;
}
# 518 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\pmp.h" 3
void PMPMasterWriteByteBlock(unsigned int addrs, unsigned int bytes, unsigned char* source);
# 544 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\pmp.h" 3
void PMPMasterWriteWordBlock(unsigned int addrs, unsigned int words, unsigned short* source);
# 565 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\pmp.h" 3
unsigned char PMPSlaveReadBuffer(BUFFER);
# 587 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\pmp.h" 3
void PMPSlaveReadBuffers(unsigned char* pDest);
# 612 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\pmp.h" 3
void PMPSlaveWriteBuffer(BUFFER, unsigned char value);
# 635 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\pmp.h" 3
void PMPSlaveWriteBuffers(unsigned char* source);
# 61 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 2 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\ports.h" 1 3
# 46 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\ports.h" 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_port_mappings.h" 1 3
# 47 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\ports.h" 2 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\ethernet_port_mappings.h" 1 3
# 48 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\ports.h" 2 3
# 2070 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\ports.h" 3
typedef enum {

        IOPORT_A,


        IOPORT_B,


        IOPORT_C,


        IOPORT_D,


        IOPORT_E,


        IOPORT_F,


        IOPORT_G,

    IOPORT_NUM
} IoPortId;
# 2117 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\ports.h" 3
void PORTSetPinsDigitalIn(IoPortId portId, unsigned int inputs);
# 2141 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\ports.h" 3
void PORTSetPinsDigitalOut(IoPortId portId, unsigned int outputs);
# 2165 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\ports.h" 3
void PORTSetPinsAnalogIn(IoPortId portId, unsigned int inputs);
# 2189 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\ports.h" 3
void PORTSetPinsAnalogOut(IoPortId portId, unsigned int outputs);
# 2210 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\ports.h" 3
void PORTResetPins(IoPortId portId, unsigned int pins);
# 2228 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\ports.h" 3
unsigned int PORTRead(IoPortId portId);
# 2248 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\ports.h" 3
unsigned int PORTReadBits(IoPortId portId, unsigned int bits);
# 2266 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\ports.h" 3
void PORTWrite(IoPortId portId, unsigned int bits);
# 2286 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\ports.h" 3
void PORTSetBits(IoPortId portId, unsigned int bits);
# 2306 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\ports.h" 3
void PORTClearBits(IoPortId portId, unsigned int bits);
# 2326 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\ports.h" 3
void PORTToggleBits(IoPortId portId, unsigned int bits);
# 62 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 2 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\pps.h" 1 3
# 63 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 2 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\power.h" 1 3
# 70 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\power.h" 3
void __attribute__((nomips16)) PowerSaveSleep(void);
# 88 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\power.h" 3
void __attribute__((nomips16)) PowerSaveIdle(void);
# 64 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 2 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\reset.h" 1 3
# 45 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\reset.h" 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\lock.h" 1 3
# 46 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\reset.h" 2 3
# 149 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\reset.h" 3
void __attribute__((noreturn)) SoftReset(void);
# 172 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\reset.h" 3
char isWU(void);
# 65 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 2 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 1 3
# 66 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
typedef union
{
    struct
    {
        unsigned char rsvd;
        unsigned char sec;
        unsigned char min;
        unsigned char hour;
    };
    unsigned char b[4];
    unsigned short w[2];
    unsigned long l;
}rtccTime;


typedef union
{
    struct
    {
        unsigned char wday;
        unsigned char mday;
        unsigned char mon;
        unsigned char year;
    };
    unsigned char b[4];
    unsigned short w[2];
    unsigned long l;
}rtccDate;


typedef enum
{
    RTCC_RPT_HALF_SEC,
    RTCC_RPT_SEC,
    RTCC_RPT_TEN_SEC,
    RTCC_RPT_MIN,
    RTCC_RPT_TEN_MIN,
    RTCC_RPT_HOUR,
    RTCC_RPT_DAY,
    RTCC_RPT_WEEK,
    RTCC_RPT_MON,
    RTCC_RPT_YEAR
}rtccRepeat;


typedef enum
{
    RTCC_CLK_ON,
    RTCC_SOSC_NRDY,
    RTCC_CLK_NRDY,
    RTCC_WR_DSBL,
}rtccRes;
# 146 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
rtccRes RtccInit(void);
# 185 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
rtccRes RtccOpen(unsigned long tm, unsigned long dt, int drift);
# 206 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
void RtccShutdown(void);
# 241 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
void RtccSetTime(unsigned long tm);
# 262 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
extern __inline__ unsigned long __attribute__((always_inline)) RtccGetTime(void)
{
    unsigned int t0, t1;
    do
    {
        t0=RTCTIME;
        t1=RTCTIME;
    }while(t0!=t1);
    return t0;
}
# 303 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
void RtccSetDate(unsigned long dt);
# 324 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
extern __inline__ unsigned long __attribute__((always_inline)) RtccGetDate(void)
{
    unsigned int d0, d1;
    do
    {
        d0=RTCDATE;
        d1=RTCDATE;
    }while(d0!=d1);

    return d0;
}
# 373 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
void RtccSetTimeDate(unsigned long tm, unsigned long dt);
# 396 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
extern __inline__ void __attribute__((always_inline)) RtccGetTimeDate(rtccTime* pTm, rtccDate* pDt)
{
    rtccTime t0;
    rtccDate d0;
    do
    {
        d0.l=RTCDATE;
        t0.l=RTCTIME;
        pTm->l=RTCTIME;
        pDt->l=RTCDATE;
    }while((d0.l!=pDt->l) || (t0.l!=pTm->l));
}
# 434 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
void RtccSetAlarmTime(unsigned long tm);
# 453 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
extern __inline__ unsigned long __attribute__((always_inline)) RtccGetAlarmTime(void)
{
    return ALRMTIME;
}
# 484 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
void RtccSetAlarmDate(unsigned long dt);
# 503 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
extern __inline__ unsigned long __attribute__((always_inline)) RtccGetAlarmDate(void)
{
    return ALRMDATE;
}
# 541 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
void RtccSetAlarmTimeDate(unsigned long tm, unsigned long dt);
# 562 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
extern __inline__ void __attribute__((always_inline)) RtccGetAlarmTimeDate(rtccTime* pTm, rtccDate* pDt)
{
    pTm->l=ALRMTIME;
    pDt->l=ALRMDATE;
}
# 587 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
 void RtccAlarmEnable(void);
# 609 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
 void RtccAlarmDisable(void);
# 629 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
extern __inline__ int __attribute__((always_inline)) RtccGetAlarmEnable(void)
{
    int isAlrm0, isAlrm1;
    do
    {
        isAlrm0=RTCALRMbits.ALRMEN;
        isAlrm1=RTCALRMbits.ALRMEN;
    }while(isAlrm0!=isAlrm1);

    return isAlrm0;
}
# 661 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
void RtccChimeEnable(void);
# 682 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
void RtccChimeDisable(void);
# 702 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
extern __inline__ int __attribute__((always_inline)) RtccGetChimeEnable(void)
{
    int ch0, ch1;
    do
    {
        ch0=RTCALRMbits.CHIME;
        ch1=RTCALRMbits.CHIME;
    }while(ch0!=ch1);

    return ch0;

}
# 734 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
void RtccSetAlarmRpt(rtccRepeat rpt);
# 753 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
extern __inline__ rtccRepeat __attribute__((always_inline)) RtccGetAlarmRpt(void)
{
    rtccRepeat r0, r1;

    do
    {
        r0=(rtccRepeat)(RTCALRM&0x00000F00);
        r1=(rtccRepeat)(RTCALRM&0x00000F00);
    }while(r0!=r1);

    return (rtccRepeat)(r0>>0x00000008);
}
# 791 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
void RtccSetAlarmRptCount(int rptCnt);
# 811 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
extern __inline__ int __attribute__((always_inline)) RtccGetAlarmRptCount(void)
{
    int rpt0, rpt1;
    do
    {
        rpt0=RTCALRMbits.ARPT;
        rpt1=RTCALRMbits.ARPT;
    }while(rpt0!=rpt1);

    return rpt0;
}
# 844 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
int RtccWeekDay(int year, int month, int day);
# 870 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
rtccRes RtccEnable(void);
# 896 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
int RtccDisable(void);
# 915 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
extern __inline__ int __attribute__((always_inline)) RtccGetEnable(void)
{
    return (RTCCON&(0x00008000|0x00000040));
}
# 938 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
extern __inline__ rtccRes __attribute__((always_inline)) RtccGetClkStat(void)
{

    if( (!(OSCCONbits.SOSCEN)) || (!(OSCCONbits.SOSCRDY)) )
    {
        return RTCC_SOSC_NRDY;
    }
    else if(!(RTCCONbits.RTCCLKON))
    {
        return RTCC_CLK_NRDY;
    }

    return RTCC_CLK_ON;
}
# 984 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
void RtccSetCalibration(int drift);
# 1005 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
extern __inline__ int __attribute__((always_inline)) RtccGetCalibration(void)
{
    return RTCCONbits.CAL;
}
# 1032 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
extern __inline__ void __attribute__((always_inline)) RtccWrEnable(int enable)
{
    if(enable)
    {
        do{int intStat, dmaSusp; intStat=INTDisableInterrupts(); dmaSusp=DmaSuspend(); SYSKEY = 0, SYSKEY = 0xAA996655, SYSKEY = 0x556699AA; (RTCCONSET=0x00000008); SYSKEY = 0x33333333; DmaResume(dmaSusp); INTRestoreInterrupts(intStat);}while(0);
    }
    else
    {
        RTCCONCLR=0x00000008;
    }
}
# 1062 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
extern __inline__ int __attribute__((always_inline)) RtccGetWrEnable(void)
{
    return RTCCONbits.RTCWREN!=0;
}
# 1084 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
extern __inline__ int __attribute__((always_inline)) RtccGetSync(void)
{
    return RTCCONbits.RTCSYNC!=0;
}
# 1107 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
extern __inline__ int __attribute__((always_inline)) RtccGetHalfSecond(void)
{
    return RTCCONbits.HALFSEC!=0;
}
# 1129 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
extern __inline__ int __attribute__((always_inline)) RtccGetAlrmSync(void)
{
    return RTCALRMbits.ALRMSYNC!=0;
}
# 1152 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
extern __inline__ void __attribute__((always_inline)) RtccSelectPulseOutput(int secPulse)
{
    if(secPulse)
    {
        RTCCONSET=0x00000080;
    }
    else
    {
        RTCCONCLR=0x00000080;
    }
}
# 1187 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
void RtccAlarmPulseHigh(void);
# 1210 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
void RtccAlarmPulseLow(void);
# 1233 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
void RtccAlarmPulseToggle(void);
# 1253 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
extern __inline__ int __attribute__((always_inline)) RtccGetAlarmPulse(void)
{
    return RTCALRMbits.PIV!=0;
}
# 1276 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
extern __inline__ void __attribute__((always_inline)) RtccOutputEnable(int enable)
{
    if(enable)
    {
        RTCCONSET=0x00000001;
    }
    else
    {
        RTCCONCLR=0x00000001;
    }
}
# 1305 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
extern __inline__ int __attribute__((always_inline)) RtccGetOutputEnable(void)
{
    return RTCCONbits.RTCOE!=0;
}
# 1320 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\rtcc_legacy.h" 1 3
# 1321 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\rtcc.h" 2 3
# 66 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 2 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi.h" 1 3
# 78 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi.h" 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 1 3
# 79 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
typedef enum
{

    SPI_CHANNEL1 = 1,



    SPI_CHANNEL2 = 2,



    SPI_CHANNEL3 = 3,



    SPI_CHANNEL4 = 4,


    SPI_CHANNELS = 0

                        + 1


                        + 1


                        + 1


                        + 1


                   +1



                   +1


}SpiChannel;
# 135 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
typedef enum
{

    SPI_OPEN_MSTEN = 0x00000020,
    SPI_OPEN_SMP_END = 0x00000200,
    SPI_OPEN_MSSEN = 0x10000000,
    SPI_OPEN_MSSEN_HIGH = 0x20000000,


    SPI_OPEN_SLVEN = 0,
    SPI_OPEN_SSEN = 0x00000080,


    SPI_OPEN_CKP_HIGH = 0x00000040,
    SPI_OPEN_CKE_REV = 0x00000100,


    SPI_OPEN_MODE8 = 0,
    SPI_OPEN_MODE16 = 0x00000400,
    SPI_OPEN_MODE32 = 0x00000800,


    SPI_OPEN_FRMEN = 0x80000000,
    SPI_OPEN_FSP_IN = 0x40000000,

    SPI_OPEN_FSP_HIGH = 0x20000000,
    SPI_OPEN_FSP_CLK1 = 0x00020000,

    SPI_OPEN_FSP_WIDE = 0x08000000,

    SPI_OPEN_FRM_CNT1 = (0 << 0x00000018),
    SPI_OPEN_FRM_CNT2 = (1 << 0x00000018),
    SPI_OPEN_FRM_CNT4 = (2 << 0x00000018),
    SPI_OPEN_FRM_CNT8 = (3 << 0x00000018),
    SPI_OPEN_FRM_CNT16 = (4 << 0x00000018),
    SPI_OPEN_FRM_CNT32 = (5 << 0x00000018),


    SPI_OPEN_ENHBUF = 0x00010000,

    SPI_OPEN_TBE_NOT_FULL = (3 << 0x00000002),
    SPI_OPEN_TBE_HALF_EMPTY = (2 << 0x00000002),
    SPI_OPEN_TBE_EMPTY = (1 << 0x00000002),
    SPI_OPEN_TBE_SR_EMPTY = (0 << 0x00000002),


    SPI_OPEN_RBF_FULL = (3 << 0x00000000),
    SPI_OPEN_RBF_HALF_FULL = (2 << 0x00000000),
    SPI_OPEN_RBF_NOT_EMPTY = (1 << 0x00000000),
    SPI_OPEN_RBF_EMPTY = (0 << 0x00000000),


    SPI_OPEN_DISSDO = 0x00001000,

    SPI_OPEN_SIDL = 0x00002000,
    SPI_OPEN_ON = 0x00008000,
}SpiOpenFlags;

typedef enum
{
    SPI_STAT_SPIRBF = 0x00000001,
    SPI_STAT_SPITBF = 0x00000002,
    SPI_STAT_SPITBE = 0x00000008,
    SPI_STAT_SPIRBE = 0x00000020,
    SPI_STAT_SPIROV = 0x00000040,
    SPI_STAT_SPISRMT = 0x00000080,
    SPI_STAT_SPITUR = 0x00000100,
    SPI_STAT_SPIBUSY = 0x00000800,
}SpiStatusFlags;
# 248 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
void SpiChnOpen(SpiChannel chn, SpiOpenFlags oFlags, unsigned int srcClkDiv);
# 271 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
void SpiChnClose(SpiChannel chn);
# 304 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
void SpiChnChangeMode(SpiChannel chn, int isMaster, int isFrmMaster, int waitBusy);
# 326 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
int SpiChnDataRdy(SpiChannel chn);
# 346 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
int SpiChnRxBuffEmpty(SpiChannel chn);
# 367 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
int SpiChnRxBuffFull(SpiChannel chn);
# 386 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
int SpiChnRxBuffCount(SpiChannel chn);
# 414 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
unsigned int SpiChnReadC(SpiChannel chn);
# 441 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
unsigned int SpiChnGetC(SpiChannel chn);
# 476 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
void SpiChnGetS(SpiChannel chn, unsigned int *pBuff, unsigned int nChars);
# 498 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
int SpiChnTxBuffEmpty(SpiChannel chn);
# 518 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
int SpiChnTxBuffFull(SpiChannel chn);
# 537 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
int SpiChnTxBuffCount(SpiChannel chn);
# 559 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
void SpiChnWriteC(SpiChannel chn, unsigned int data);
# 581 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
void SpiChnPutC(SpiChannel chn, unsigned int data);
# 605 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
void SpiChnPutS(SpiChannel chn, unsigned int* pBuff, unsigned int nChars);
# 627 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
int SpiChnGetRov(SpiChannel chn, int clear);
# 649 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
int SpiChnIsBusy(SpiChannel chn);
# 670 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
int SpiChnIsSrEmpty(SpiChannel chn);
# 695 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
int SpiChnGetTur(SpiChannel chn);
# 716 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
SpiStatusFlags SpiChnGetStatus(SpiChannel chn);
# 739 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
volatile void* SpiChnBuffer(SpiChannel chn);







typedef enum
{

    SPI_CONFIG_MSTEN = 0x00000020,
    SPI_CONFIG_SMP_END = 0x00000200,
    SPI_CONFIG_MSSEN = 0x10000000,
    SPI_CONFIG_MSSEN_HIGH = 0x20000000,


    SPI_CONFIG_SLVEN = 0,
    SPI_CONFIG_SSEN = 0x00000080,


    SPI_CONFIG_CKP_HIGH = 0x00000040,
    SPI_CONFIG_CKE_REV = 0x00000100,


    SPI_CONFIG_MODE8 = 0,
    SPI_CONFIG_MODE16 = 0x00000400,
    SPI_CONFIG_MODE32 = 0x00000800,


    SPI_CONFIG_FRMEN = 0x80000000,
    SPI_CONFIG_FSP_IN = 0x40000000,

    SPI_CONFIG_FSP_HIGH = 0x20000000,
    SPI_CONFIG_FSP_CLK1 = 0x00020000,

    SPI_CONFIG_FSP_WIDE = 0x08000000,

    SPI_CONFIG_FRM_CNT1 = (0 << 0x00000018),
    SPI_CONFIG_FRM_CNT2 = (1 << 0x00000018),
    SPI_CONFIG_FRM_CNT4 = (2 << 0x00000018),
    SPI_CONFIG_FRM_CNT8 = (3 << 0x00000018),
    SPI_CONFIG_FRM_CNT16 = (4 << 0x00000018),
    SPI_CONFIG_FRM_CNT32 = (5 << 0x00000018),


    SPI_CONFIG_ENHBUF = 0x00010000,

    SPI_CONFIG_TBE_NOT_FULL = (3 << 0x00000002),
    SPI_CONFIG_TBE_HALF_EMPTY = (2 << 0x00000002),
    SPI_CONFIG_TBE_EMPTY = (1 << 0x00000002),
    SPI_CONFIG_TBE_SR_EMPTY = (0 << 0x00000002),


    SPI_CONFIG_RBF_FULL = (3 << 0x00000000),
    SPI_CONFIG_RBF_HALF_FULL = (2 << 0x00000000),
    SPI_CONFIG_RBF_NOT_EMPTY = (1 << 0x00000000),
    SPI_CONFIG_RBF_EMPTY = (0 << 0x00000000),


    SPI_CONFIG_DISSDO = 0x00001000,

    SPI_CONFIG_SIDL = 0x00002000,
    SPI_CONFIG_ON = 0x00008000,
}SpiConfigFlags;
# 837 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
void SpiChnConfigure(SpiChannel chn, SpiConfigFlags config);
# 860 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
void SpiChnEnable(SpiChannel chn, int enable);
# 893 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
unsigned int SpiChnSetBitRate(SpiChannel chn, unsigned int srcClk, unsigned int spiClk);
# 915 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
void SpiChnSetBrg(SpiChannel chn, unsigned int brg);
# 934 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
extern __inline__ unsigned int __attribute__((always_inline)) SpiBrgVal(unsigned int srcClk, unsigned int spiClk)
{
    return (srcClk / (2 * spiClk)) - 1;
}
# 947 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\spi_legacy.h" 1 3
# 71 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\spi_legacy.h" 3
typedef enum
{

    SPI_CON_MSTEN = 0x00000020,
    SPI_CON_SMP = 0x00000200,


    SPI_CON_SLVEN = 0,
    SPI_CON_SSEN = 0x00000080,


    SPI_CON_CKP = 0x00000040,
    SPI_CON_CKE = 0x00000100,


    SPI_CON_MODE8 = 0,
    SPI_CON_MODE16 = 0x00000400,
    SPI_CON_MODE32 = 0x00000800,


    SPI_CON_FRMEN = 0x80000000,
    SPI_CON_FRMSYNC = 0x40000000,

    SPI_CON_FRMPOL = 0x20000000,
    SPI_CON_SPIFE = 0x00020000,



    SPI_CON_DISSDO = 0x00001000,
    SPI_CON_SIDL = 0x00002000,
    SPI_CON_ON = 0x00008000,
}SpiCtrlFlags;
# 614 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\spi_legacy.h" 3
typedef union
{
    struct
    {
        unsigned PPRE: 2;
        unsigned SPRE: 3;
        unsigned MSTEN: 1;
        unsigned CKP: 1;
        unsigned SSEN: 1;
        unsigned CKE: 1;
        unsigned SMP: 1;
        unsigned MODE16: 1;
        unsigned MODE32: 1;
        unsigned DISSDO: 1;
        unsigned: 17;
        unsigned FRMSYNC: 1;
        unsigned FRMEN: 1;
    };
    unsigned int w;
}SpiOpenConfig1;
# 688 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\spi_legacy.h" 3
typedef union
{
    struct
    {
        unsigned: 6;
        unsigned SPIROV: 1;
        unsigned: 6;
        unsigned SIDL: 1;
        unsigned: 1;
        unsigned ON: 1;
        unsigned: 1;
        unsigned SPIFE: 1;
        unsigned: 11;
        unsigned FRMPOL: 1;
    };
    unsigned int w;
}SpiOpenConfig2;
# 731 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\spi_legacy.h" 3
typedef union
{
    struct
    {
        unsigned ipl: 3;
        unsigned ispl: 2;
        unsigned fie: 1;
        unsigned txie: 1;
        unsigned rxie: 1;
    };
    unsigned int w;
}SpiConfigInt;
# 839 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\spi_legacy.h" 3
    void OpenSPI1(unsigned int config1, unsigned int config2);
# 1091 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\spi_legacy.h" 3
    unsigned int getcSPI1(void);
# 1146 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\spi_legacy.h" 3
    unsigned int getsSPI1(unsigned int length, unsigned int *rdptr, unsigned int spi_data_wait);
# 1170 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\spi_legacy.h" 3
    void putsSPI1(unsigned int length, unsigned int *wrptr);
# 1233 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\spi_legacy.h" 3
    void OpenSPI2(unsigned int config1, unsigned int config2 );
# 1478 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\spi_legacy.h" 3
    unsigned int getcSPI2(void);
# 1531 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\spi_legacy.h" 3
    unsigned int getsSPI2(unsigned int length, unsigned int *rdptr, unsigned int spi_data_wait);
# 1555 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\spi_legacy.h" 3
    void putsSPI2(unsigned int length, unsigned int *wrptr);
# 948 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi_5xx_6xx_7xx.h" 2 3
# 79 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\spi.h" 2 3
# 67 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 2 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\system.h" 1 3
# 58 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\system.h" 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\osc.h" 1 3
# 77 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\osc.h" 3
void OSCConfig(unsigned long int source, unsigned long int mult, unsigned long int post, unsigned long int div);
# 211 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\osc.h" 3
extern inline void __attribute__((always_inline)) OSCSetPBDIV(unsigned int oscPbDiv)
{
    unsigned int dma_status;
    unsigned int int_status;
    __OSCCONbits_t oscBits;

    do{int_status=INTDisableInterrupts(); dma_status=DmaSuspend(); SYSKEY = 0, SYSKEY = 0xAA996655, SYSKEY = 0x556699AA;}while(0);

    oscBits.w=OSCCON;
    oscBits.PBDIV=0;
    oscBits.w|=oscPbDiv;
    OSCCON=oscBits.w;
    oscBits.w=OSCCON;

    do{SYSKEY = 0x33333333; DmaResume(dma_status); INTRestoreInterrupts(int_status);}while(0);
}
# 59 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\system.h" 2 3
# 121 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\system.h" 3
extern inline unsigned int __attribute__((always_inline)) SYSTEMConfigPB(unsigned int sys_clock)
{
    unsigned int pb_div;
    unsigned int pb_clock;

    pb_clock = sys_clock;

    if(sys_clock > 80000000)
    {
        pb_div=(1 << 0x00000013);
        pb_clock >>= 1;
    }
    else
    {
        pb_div=(0 << 0x00000013);
    }

    OSCSetPBDIV(pb_div);

    return pb_clock;
}
# 172 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\system.h" 3
extern inline void __attribute__((always_inline)) SYSTEMConfigWaitStates(unsigned int sys_clock)
{

    unsigned int wait_states;
    unsigned int int_status;



    wait_states = 0;

    while(sys_clock > 30000000)
    {
        wait_states++;
        sys_clock -= 30000000;
    }

    int_status=INTDisableInterrupts();
    (CHECON = (wait_states));
    INTRestoreInterrupts(int_status);


}
# 223 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\system.h" 3
extern inline unsigned int __attribute__((always_inline)) SYSTEMConfigWaitStatesAndPB(unsigned int sys_clock)
{

    unsigned int wait_states;

    unsigned int pb_clock;
    unsigned int int_status;

    pb_clock = SYSTEMConfigPB(sys_clock);





    wait_states = 0;

    while(sys_clock > 30000000)
    {
        wait_states++;
        sys_clock -= 30000000;
    }

    int_status=INTDisableInterrupts();
    (CHECON = (wait_states));
    INTRestoreInterrupts(int_status);



    return pb_clock;
}
# 282 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\system.h" 3
extern inline unsigned int __attribute__((always_inline)) SYSTEMConfigPerformance(unsigned int sys_clock)
{

    unsigned int pb_clk;

    unsigned int cache_status;

    unsigned int int_status;

    pb_clk = SYSTEMConfigWaitStatesAndPB(sys_clock);

    int_status=INTDisableInterrupts();

    (BMXCONCLR = 0x00000040);


    cache_status = CHECON;
    cache_status |= (3 << 0x00000004);
    (CHECON = (cache_status));
    CheKseg0CacheOn();


    INTRestoreInterrupts(int_status);

    return pb_clk;

}
# 346 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\system.h" 3
extern inline unsigned int __attribute__((always_inline)) SYSTEMConfig(unsigned int sys_clock, unsigned int flags)
{
    unsigned int pb_clk;
    unsigned int int_status;

    unsigned int cache_status;


    int_status=INTDisableInterrupts();

    (BMXCONCLR = 0x00000040);

    if(flags & 0x00000001)
    {
        SYSTEMConfigWaitStates(sys_clock);
    }

    if(flags & 0x00000002)
    {
        SYSTEMConfigPB(sys_clock);
    }



    if(flags & 0x00000004)
    {
        cache_status = CHECON;
        cache_status |= (3 << 0x00000004);
        (CHECON = (cache_status));
        CheKseg0CacheOn();
    }


    pb_clk = sys_clock;
    pb_clk >>= OSCCONbits.PBDIV;

    INTRestoreInterrupts(int_status);

    return pb_clk;

}
# 68 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 2 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\timer.h" 1 3
# 71 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\timer.h" 3
void __attribute__((nomips16)) OpenCoreTimer(unsigned int period);
# 89 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\timer.h" 3
 void __attribute__((nomips16)) UpdateCoreTimer(unsigned int period);
# 201 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\timer.h" 3
unsigned int __attribute__((nomips16)) ReadCoreTimer(void);
# 218 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\timer.h" 3
void __attribute__((nomips16)) WriteCoreTimer(unsigned int timer);
# 69 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 2 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 1 3
# 59 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\uart_legacy.h" 1 3
# 515 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\uart_legacy.h" 3
void putsUART1(const char* buffer);



void putsUART2(const char* buffer);
# 672 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\uart_legacy.h" 3
unsigned int getsUART1(unsigned int length, char* buffer, unsigned int uart_data_wait);



unsigned int getsUART2(unsigned int length, char* buffer, unsigned int uart_data_wait);
# 60 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 2 3
# 89 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
typedef struct
{
    volatile UINT reg;
    volatile UINT clr;
    volatile UINT set;
    volatile UINT inv;
}REG_SET;

typedef struct
{
    volatile REG_SET mode;
    volatile REG_SET sta;
    volatile REG_SET tx;
    volatile REG_SET rx;
    volatile REG_SET brg;
}UART_REGS;

extern UART_REGS * const uartReg[];
# 119 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
typedef enum
{


    UART1 = 0,



    UART3A,



    UART2A,



    UART1B,



    UART3B,



    UART2B,


    UART_NUMBER_OF_MODULES

} UART_MODULE;
# 170 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
typedef enum
{

    UART_DISABLE = 0x00 ,


    UART_ENABLE = 0x80 ,




    UART_PERIPHERAL = 0x01 ,


    UART_RX = 0x02 ,


    UART_TX = 0x04


} UART_ENABLE_MODE;
# 252 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
typedef enum
{

    UART_ENABLE_HIGH_SPEED = 0x00000008 ,


    UART_INVERT_RECEIVE_POLARITY = 0x00000010 ,


    UART_ENABLE_LOOPBACK = 0x00000040 ,


    UART_ENABLE_WAKE_ON_START = 0x00000080 ,



    UART_ENABLE_PINS_BIT_CLOCK = 0x00000300 ,



    UART_ENABLE_PINS_CTS_RTS = 0x00000200 ,



    UART_ENABLE_PINS_RTS = 0x00000100 ,



    UART_ENABLE_PINS_TX_RX_ONLY = 0x00000000 ,




    UART_RTS_WHEN_RX_NOT_FULL = 0x00000000 ,




    UART_RTS_WHEN_TX_NOT_EMPTY = 0x00000800 ,


    UART_ENABLE_IRDA = 0x00001000 ,



    UART_ENABLE_STOP_ON_IDLE = 0x00002000 ,


    UART_INVERT_TRANSMIT_POLARITY = 0x20000000 ,





    UART_SUPPORT_IEEE_485 = 0x00000900

} UART_CONFIGURATION;
# 331 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
typedef enum
{

    UART_INTERRUPT_ON_TX_BUFFER_EMPTY = 0x8000 ,


    UART_INTERRUPT_ON_TX_DONE = 0x4000 ,



    UART_INTERRUPT_ON_TX_NOT_FULL = 0x0000 ,



    UART_INTERRUPT_ON_RX_FULL = 0x00C0 ,



    UART_INTERRUPT_ON_RX_3_QUARTER_FULL = 0x0080 ,



    UART_INTERRUPT_ON_RX_HALF_FULL = 0x0040 ,



    UART_INTERRUPT_ON_RX_NOT_EMPTY = 0x0000

} UART_FIFO_MODE;
# 381 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
typedef enum
{

    UART_DATA_SIZE_8_BITS = 0x0000 ,


    UART_DATA_SIZE_9_BITS = 0x0006 ,


    UART_PARITY_ODD = 0x0004 ,


    UART_PARITY_EVEN = 0x0002 ,


    UART_PARITY_NONE = 0x0000 ,


    UART_STOP_BITS_2 = 0x0001 ,


    UART_STOP_BITS_1 = 0x0000

} UART_LINE_CONTROL_MODE;
# 422 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
typedef enum
{

    UART_TRANSMITTER_NOT_FULL = 0x00000200 ,


    UART_TRANSMITTER_EMPTY = 0x00000100 ,


    UART_RECEIVER_IDLE = 0x00000010 ,


    UART_PARITY_ERROR = 0x00000008 ,




    UART_FRAMING_ERROR = 0x00000004 ,


    UART_OVERRUN_ERROR = 0x00000002 ,


    UART_DATA_READY = 0x00000001

} UART_LINE_STATUS;
# 465 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
typedef union
{

    struct
    {
        UINT16 data8bit : 8;
    };


    struct
    {
        UINT16 data9bit : 9;
    };

    UINT16 __data;
} UART_DATA;
# 522 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
void UARTEnable( UART_MODULE id, UART_ENABLE_MODE mode );
# 559 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
void UARTConfigure ( UART_MODULE id, UART_CONFIGURATION flags );
# 597 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
void UARTSetFifoMode ( UART_MODULE id, UART_FIFO_MODE mode );
# 644 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
UINT32 UARTSetDataRate ( UART_MODULE id, UINT32 sourceClock, UINT32 dataRate );
# 684 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
UINT32 UARTGetDataRate( UART_MODULE id, UINT32 sourceClock );
# 721 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
void UARTSetLineControl ( UART_MODULE id, UART_LINE_CONTROL_MODE mode );
# 766 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
extern inline UART_LINE_STATUS __attribute__((always_inline)) UARTGetLineStatus ( UART_MODULE id )
{
    return (UART_LINE_STATUS)(uartReg[id]->sta.reg & ((UART_TRANSMITTER_NOT_FULL | UART_TRANSMITTER_EMPTY | UART_RECEIVER_IDLE | UART_PARITY_ERROR | UART_FRAMING_ERROR | UART_OVERRUN_ERROR | UART_DATA_READY)));
}
# 809 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
extern inline BOOL __attribute__ ((always_inline)) UARTTransmitterIsReady ( UART_MODULE id )
{
    return (BOOL)(!(uartReg[id]->sta.reg & 0x00000200));
}
# 856 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
extern inline void __attribute__((always_inline)) UARTSendDataByte ( UART_MODULE id, BYTE data )
{
    uartReg[id]->tx.reg = data;
}
# 901 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
extern inline void __attribute__((always_inline)) UARTSendData( UART_MODULE id, UART_DATA data )
{
    uartReg[id]->tx.reg = data.__data;
}
# 941 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
extern inline BOOL __attribute__((always_inline)) UARTTransmissionHasCompleted ( UART_MODULE id )
{
    return (BOOL)(0x00000100 == (uartReg[id]->sta.reg & 0x00000100));
}
# 984 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
extern inline BOOL __attribute__((always_inline)) UARTReceivedDataIsAvailable ( UART_MODULE id )
{
    return (BOOL)(0x00000001 == (uartReg[id]->sta.reg & 0x00000001));
}
# 1025 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
extern inline BYTE __attribute__((always_inline)) UARTGetDataByte ( UART_MODULE id )
{
    return (BYTE)uartReg[id]->rx.reg;
}
# 1066 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
extern inline UART_DATA __attribute__((always_inline)) UARTGetData ( UART_MODULE id )
{
    UART_DATA data;

    data.__data = uartReg[id]->rx.reg;

    return data;
}
# 1115 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
void UARTSetAddress ( UART_MODULE id, BYTE address, BOOL watch );
# 1164 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
void UARTWatchForAddress ( UART_MODULE id, BOOL watch );
# 1201 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
extern inline void __attribute__((always_inline)) UARTSendBreak ( UART_MODULE id )
{
    uartReg[id]->sta.set = 0x00000800;
}
# 1250 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
extern inline void __attribute__((always_inline)) UARTStartAutoDataRateDetect ( UART_MODULE id )
{
   uartReg[id]->mode.set = 0x00000020;
}
# 1295 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\uart.h" 3
extern inline BOOL __attribute__((always_inline)) UARTDataRateDetected ( UART_MODULE id )
{
    return (BOOL)(!(uartReg[id]->mode.reg & 0x00000020));
}
# 70 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 2 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\wdt.h" 1 3
# 71 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 2 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 1 3
# 83 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
typedef enum
{

    ETH_RES_OK,




    ETH_RES_NO_PACKET,


    ETH_RES_PACKET_QUEUED,




    ETH_RES_OUT_OF_MEMORY,


    ETH_RES_NO_DESCRIPTORS,


    ETH_RES_USPACE_ERR,


    ETH_RES_RX_SIZE_ERR,


    ETH_RES_RX_PKT_SPLIT_ERR,




    ETH_RES_NEGOTIATION_UNABLE,


    ETH_RES_NEGOTIATION_INACTIVE,


    ETH_RES_NEGOTIATION_NOT_STARTED,


    ETH_RES_NEGOTIATION_ACTIVE,


    ETH_RES_NEGOTIATION_LINKDOWN,




    ETH_RES_DTCT_ERR,



    ETH_RES_CPBL_ERR,


    ETH_RES_CFG_ERR,

} eEthRes;
# 175 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
typedef enum
{



    ETH_OPEN_AUTO
                             = 0x1 ,


    ETH_OPEN_FDUPLEX
                             = 0x2 ,


    ETH_OPEN_HDUPLEX
                             = 0x4 ,


    ETH_OPEN_100
                             = 0x8 ,


    ETH_OPEN_10
                             = 0x10 ,




    ETH_OPEN_HUGE_PKTS
                             = 0x20 ,


    ETH_OPEN_MAC_LOOPBACK
                             = 0x40 ,


    ETH_OPEN_PHY_LOOPBACK
                             = 0x80 ,




    ETH_OPEN_MDIX_AUTO
                             = 0x100 ,


    ETH_OPEN_MDIX_NORM
                             = 0x0 ,


    ETH_OPEN_MDIX_SWAP
                             = 0x200 ,




    ETH_OPEN_RMII
                             = 0x400 ,


    ETH_OPEN_MII
                             = 0x000 ,



    ETH_OPEN_DEFAULT = (ETH_OPEN_AUTO|ETH_OPEN_FDUPLEX|ETH_OPEN_HDUPLEX|
                        ETH_OPEN_100|ETH_OPEN_10|ETH_OPEN_MDIX_AUTO)

} eEthOpenFlags;
# 258 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
typedef enum
{

    ETH_LINK_ST_DOWN
                             = 0x0 ,


    ETH_LINK_ST_UP
                             = 0x1 ,


    ETH_LINK_ST_LP_NEG_UNABLE
                             = 0x2 ,


    ETH_LINK_ST_REMOTE_FAULT
                             = 0x4 ,


    ETH_LINK_ST_PDF
                             = 0x8 ,


    ETH_LINK_ST_LP_PAUSE
                             = 0x10 ,


    ETH_LINK_ST_LP_ASM_DIR
                             = 0x20 ,


    ETH_LINK_ST_NEG_TMO
                             = 0x1000 ,


    ETH_LINK_ST_NEG_FATAL_ERR
                             = 0x2000 ,

} eEthLinkStat;
# 309 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
typedef enum
{

    ETH_ST_RXBUSY = 0x1 ,


    ETH_ST_TXBUSY = 0x2 ,


    ETH_ST_BUSY = 0x4 ,

} eEthStat;
# 332 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
typedef enum
{

    ETH_CLOSE_GRACEFUL = 0x1 ,


    ETH_CLOSE_DEFAULT = (0)

} eEthCloseFlags;
# 352 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
typedef enum
{

    ETH_MAC_PAUSE_TYPE_NONE = 0x0 ,


    ETH_MAC_PAUSE_TYPE_PAUSE = 0x1 ,


    ETH_MAC_PAUSE_TYPE_ASM_DIR = 0x2 ,




    ETH_MAC_PAUSE_TYPE_EN_TX = 0x4 ,


    ETH_MAC_PAUSE_TYPE_EN_RX = 0x8 ,


    ETH_MAC_PAUSE_ALL = (ETH_MAC_PAUSE_TYPE_PAUSE|ETH_MAC_PAUSE_TYPE_ASM_DIR|
                           ETH_MAC_PAUSE_TYPE_EN_TX|ETH_MAC_PAUSE_TYPE_EN_RX),


    ETH_MAC_PAUSE_CPBL_MASK = ETH_MAC_PAUSE_ALL

} eEthMacPauseType;
# 417 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
eEthRes EthInit ( void );
# 450 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
eEthRes EthClose ( eEthCloseFlags cFlags );
# 500 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthMACOpen ( eEthOpenFlags oFlags, eEthMacPauseType pauseType );
# 534 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthMACSetAddress ( unsigned char bAddress[6] );
# 567 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthMACGetAddress ( unsigned char bAddress[6] );
# 598 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthMACSetMaxFrame ( unsigned short maxFrmSz );
# 637 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
typedef void* ( *pEthDcptAlloc )( size_t nitems, size_t size, void* param );
# 669 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
typedef void ( *pEthDcptFree ) ( void* ptr, void* param );
# 686 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
typedef enum
{

    ETH_DCPT_TYPE_RX = 0x1 ,


    ETH_DCPT_TYPE_TX = 0x2 ,


    ETH_DCPT_TYPE_ALL = (ETH_DCPT_TYPE_RX|ETH_DCPT_TYPE_TX)

}eEthDcptType;
# 711 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
typedef struct
{

    int dIdle;




    int dUnack;





    int dQueued;

}sEthDcptQuery;
# 740 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
typedef enum
{


    ETH_BUFF_FLAG_RX_STICKY = 0x1 ,






    ETH_BUFF_FLAG_RX_UNACK = 0x2 ,
} eEthBuffFlags;
# 808 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
int EthDescriptorsPoolAdd ( int nDescriptors, eEthDcptType dType, pEthDcptAlloc fAlloc, void* fParam );
# 857 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
int EthDescriptorsPoolRemove ( int nDescriptors, eEthDcptType dType, pEthDcptFree fFree, void* fParam );
# 902 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthDescriptorsPoolCleanUp ( eEthDcptType dType, pEthDcptFree fFree, void* fParam );
# 935 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
int EthDescriptorsGetSize ( eEthDcptType dType );
# 983 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthDescriptorsQuery ( eEthDcptType dType, sEthDcptQuery *pQuery );
# 1026 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
int EthDescriptorsGetRxUnack ( void );


extern __inline__ int __attribute__((always_inline)) EthDescriptorsGetRxUnack( void )
{
    return ETHSTATbits.BUFCNT;
}
# 1085 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void* EthDescriptorGetBuffer ( void *pDcpt );
# 1154 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
eEthRes EthRxBuffersAppend ( void *ppBuff[], int nBuffs, eEthBuffFlags rxFlags );
# 1194 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
eEthRes EthRxSetBufferSize ( int rxBuffSize );
# 1215 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
typedef struct _tag_sEthPktDcpt
{

    struct _tag_sEthPktDcpt *next;


    void *pBuff;


    unsigned short int nBytes;

} __attribute__ ((__packed__)) sEthPktDcpt;
# 1242 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
typedef union
{
    struct
    {

        unsigned short totTxBytes;


        unsigned txCtrl : 1;


        unsigned txPause : 1;


        unsigned txBPres : 1;


        unsigned txVLAN : 1;

        unsigned : 12;


        unsigned short bCount;


        unsigned collCount : 4;


        unsigned crcError : 1;


        unsigned lenError : 1;


        unsigned lenRange : 1;


        unsigned txDone : 1;


        unsigned mcast : 1;


        unsigned bcast : 1;


        unsigned defer : 1;


        unsigned excDefer : 1;


        unsigned maxColl : 1;


        unsigned lateColl : 1;


        unsigned giant : 1;


        unsigned underrun : 1;

    }__attribute__ ((__packed__));


    unsigned long long w;

} sEthTxPktStat;
# 1326 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
typedef union
{
    struct
    {

        unsigned pktChecksum :16;

        unsigned : 8;


        unsigned runtPkt : 1;


        unsigned notMeUcast : 1;


        unsigned htMatch : 1;


        unsigned magicMatch : 1;


        unsigned pmMatch : 1;


        unsigned uMatch : 1;


        unsigned bMatch : 1;


        unsigned mMatch : 1;


        unsigned rxBytes :16;


        unsigned prevIgnore : 1;


        unsigned prevDV : 1;


        unsigned prevCarrier : 1;


        unsigned rxCodeViol : 1;


        unsigned crcError : 1;


        unsigned lenError : 1;


        unsigned lenRange : 1;


        unsigned rxOk : 1;


        unsigned mcast : 1;


        unsigned bcast : 1;


        unsigned dribble : 1;


        unsigned rxCtrl : 1;


        unsigned rxPause : 1;


        unsigned rxCodeErr : 1;


        unsigned rxVLAN : 1;

        unsigned : 1;

    }__attribute__ ((__packed__));


    unsigned long long w;

} sEthRxPktStat;
# 1453 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
typedef void ( *pEthBuffAck ) ( void *pPktBuff, int buffIx, void* param );
# 1502 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
eEthRes EthTxSendBuffer ( const void *pBuff, unsigned short int nBytes );
# 1556 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
eEthRes EthTxSendPacket ( const sEthPktDcpt *pPkt );
# 1604 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
eEthRes EthTxGetBufferStatus ( const void *pBuff, const sEthTxPktStat **pTxStat );
# 1649 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
eEthRes EthTxGetPacketStatus(const sEthPktDcpt* pPkt, const sEthTxPktStat** pTxStat);


extern __inline__ eEthRes __attribute__((always_inline)) EthTxGetPacketStatus(const sEthPktDcpt* pPkt, const sEthTxPktStat** pTxStat)
{
    return EthTxGetBufferStatus(pPkt?pPkt->pBuff:0, pTxStat);
}
# 1720 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
eEthRes EthTxAcknowledgeBuffer ( const void *pBuff, pEthBuffAck ackFnc, void* fParam );
# 1776 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
eEthRes EthTxAcknowledgePacket(const sEthPktDcpt* pPkt, pEthBuffAck ackFnc, void* fParam );


extern __inline__ eEthRes __attribute__((always_inline)) EthTxAcknowledgePacket(const sEthPktDcpt* pPkt, pEthBuffAck ackFnc, void* fParam )
{
    return EthTxAcknowledgeBuffer(pPkt?pPkt->pBuff:0, ackFnc, fParam);
}
# 1853 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
eEthRes EthRxGetBuffer ( void **ppBuff, const sEthRxPktStat **pRxStat );
# 1931 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
eEthRes EthRxGetPacket ( sEthPktDcpt *pPkt, int *pnBuffs, const sEthRxPktStat **pRxStat );
# 1993 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
eEthRes EthRxAcknowledgeBuffer ( const void *pBuff, pEthBuffAck ackFnc, void* fParam );
# 2046 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
eEthRes EthRxAcknowledgePacket ( const sEthPktDcpt* pPkt, pEthBuffAck ackFnc, void* fParam );


extern __inline__ eEthRes __attribute__((always_inline)) EthRxAcknowledgePacket(const sEthPktDcpt* pPkt, pEthBuffAck ackFnc, void* fParam )
{
    return EthRxAcknowledgeBuffer(pPkt?pPkt->pBuff:0, ackFnc, fParam);
}
# 2086 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
eEthStat EthStatusGet ( void );
# 2101 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
typedef enum
{

    ETH_FC_AUTO = 0,


    ETH_FC_SOFTWARE

} eEthFc;
# 2149 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthFCSetPauseValue ( unsigned int pauseBytes );
# 2210 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthFCEnable ( eEthFc fcType, int enable );
# 2250 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthFCSetRxWMark ( int fullWM, int emptyWM );
# 2275 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
typedef enum
{

    ETH_FILT_CRC_ERR_ACCEPT
                             = 0x00000080 ,


    ETH_FILT_RUNT_ACCEPT
                             = 0x00000020 ,


    ETH_FILT_CRC_ERR_REJECT
                             = 0x00000040 ,


    ETH_FILT_RUNT_REJECT
                             = 0x00000010 ,


    ETH_FILT_ME_UCAST_ACCEPT
                             = 0x00000008 ,


    ETH_FILT_NOTME_UCAST_ACCEPT
                             = 0x00000004 ,


    ETH_FILT_MCAST_ACCEPT
                             = 0x00000002 ,


    ETH_FILT_BCAST_ACCEPT
                             = 0x00000001 ,


    ETH_FILT_HTBL_ACCEPT
                             = 0x00008000 ,


    ETH_FILT_MAGICP_ACCEPT
                             = 0x00004000 ,



    ETH_FILT_ALL_FILTERS = ETH_FILT_CRC_ERR_ACCEPT | ETH_FILT_RUNT_ACCEPT |
                               ETH_FILT_CRC_ERR_REJECT | ETH_FILT_RUNT_REJECT |
                               ETH_FILT_ME_UCAST_ACCEPT | ETH_FILT_NOTME_UCAST_ACCEPT |
                               ETH_FILT_MCAST_ACCEPT | ETH_FILT_BCAST_ACCEPT |
                               ETH_FILT_HTBL_ACCEPT | ETH_FILT_MAGICP_ACCEPT

} eEthRxFilters;
# 2342 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
typedef enum
{

    ETH_FILT_PMATCH_ACCEPT = 1,


    ETH_FILT_PMATCH_ME_UCAST_ACCEPT,


    ETH_FILT_PMATCH_NOTME_UCAST_ACCEPT,


    ETH_FILT_PMATCH_MCAST_ACCEPT,


    ETH_FILT_PMATCH_NOT_MCAST_ACCEPT,


    ETH_FILT_PMATCH_BCAST_ACCEPT,


    ETH_FILT_PMATCH_NOT_BCAST_ACCEPT,



    ETH_FILT_PMATCH_HTBL_ACCEPT,


    ETH_FILT_PMATCH_MAGICP_ACCEPT,



    ETH_FILT_PMATCH_INVERT = 0x80000000

} eEthPMatchMode;
# 2417 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthRxFiltersSet ( eEthRxFilters rxFilters );
# 2450 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthRxFiltersClr ( eEthRxFilters rxFilters );
# 2491 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthRxFiltersWrite ( eEthRxFilters rxFilters );
# 2523 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthRxFiltersHTSet ( unsigned long long htable );
# 2565 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthRxFiltersPMSet ( eEthPMatchMode mode, unsigned long long matchMask,
                         unsigned int matchOffs, unsigned int matchChecksum );
# 2597 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthRxFiltersPMClr ( void );
# 2613 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
typedef enum
{

    ETH_EV_RXOVFLOW
                             = 0x00000001 ,


    ETH_EV_RXBUFNA
                             = 0x00000002 ,


    ETH_EV_TXABORT
                             = 0x00000004 ,


    ETH_EV_TXDONE
                             = 0x00000008 ,


    ETH_EV_RXACT
                             = 0x00000020 ,


    ETH_EV_PKTPEND
                             = 0x00000040 ,


    ETH_EV_RXDONE
                             = 0x00000080 ,


    ETH_EV_FWMARK
                             = 0x00000100 ,


    ETH_EV_EWMARK
                             = 0x00000200 ,


    ETH_EV_RXBUSERR
                             = 0x00002000 ,


    ETH_EV_TXBUSERR
                             = 0x00004000 ,


    ETH_EV_ALL = (ETH_EV_RXOVFLOW | ETH_EV_RXBUFNA | ETH_EV_TXABORT |
                      ETH_EV_TXDONE | ETH_EV_RXACT | ETH_EV_PKTPEND |
                      ETH_EV_RXDONE | ETH_EV_FWMARK | ETH_EV_EWMARK |
                      ETH_EV_RXBUSERR | ETH_EV_TXBUSERR)
} eEthEvents;
# 2698 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthEventsEnableSet ( eEthEvents eEvents );
# 2732 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthEventsEnableClr ( eEthEvents eEvents );
# 2767 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthEventsEnableWrite ( eEthEvents eEvents );
# 2799 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
eEthEvents EthEventsEnableGet ( void );
# 2840 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthEventsClr ( eEthEvents eEvents );


extern __inline__ void __attribute__((always_inline)) EthEventsClr(eEthEvents eEvents)
{
    ETHIRQCLR=eEvents;
}
# 2878 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
eEthEvents EthEventsGet ( void );


extern __inline__ eEthEvents __attribute__((always_inline)) EthEventsGet(void)
{
    return (eEthEvents)ETHIRQ;
}
# 2923 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
int EthStatRxOvflCnt ( void );
# 2962 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
int EthStatRxOkCnt ( void );
# 3001 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
int EthStatRxFcsErrCnt ( void );
# 3039 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
int EthStatRxAlgnErrCnt ( void );
# 3075 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
int EthStatTxOkCnt ( void );
# 3112 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
int EthStatTxSColCnt ( void );
# 3149 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
int EthStatTxMColCnt( void );
# 3189 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthMIIMConfig ( unsigned int hostClock, unsigned int miimClock );
# 3232 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthMIIMReadStart ( unsigned int rIx, unsigned int phyAdd );
# 3270 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
unsigned short EthMIIMReadResult ( void );
# 3317 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthMIIMWriteStart ( unsigned int rIx, unsigned int phyAdd, unsigned short wData );
# 3360 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthMIIMScanStart ( unsigned int rIx, unsigned int phyAdd );
# 3400 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
unsigned short EthMIIMScanResult ( void );
# 3439 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthMIIMScanStop ( void );


extern __inline__ void __attribute__((always_inline)) EthMIIMScanStop(void)
{
    EMACxMCMD=0;
}
# 3484 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
int EthMIIMScanValid ( void );


extern __inline__ int __attribute__((always_inline)) EthMIIMScanValid(void)
{
    return EMACxMINDbits.NOTVALID==0;
}
# 3531 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
int EthMIIMBusy ( void );


extern __inline__ int __attribute__((always_inline)) EthMIIMBusy(void)
{
    return EMACxMINDbits.MIIMBUSY!=0;
}
# 3553 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
typedef enum
{

    ETH_CONFIG_MANFC
                             = 0x00000010 ,


    ETH_CONFIG_AUTOFC
                             = 0x00000080 ,


    ETH_CONFIG_RXEN
                             = 0x00000100 ,


    ETH_CONFIG_TXRTS
                             = 0x00000200 ,


    ETH_CONFIG_SIDL
                             = 0x00002000 ,


    ETH_CONFIG_ON
                             = 0x00008000

} eEthConfigFlags;
# 3612 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthEnable ( int enable );
# 3646 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthConfig ( eEthConfigFlags cFlags );
# 3680 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthConfigSetFlags ( eEthConfigFlags cFlags );
# 3714 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthConfigClrFlags ( eEthConfigFlags cFlags );
# 3751 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthConfigTxStAddress ( void *address );
# 3788 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthConfigRxStAddress ( void *address );
# 3828 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthAckRxDcpt ( void );


extern __inline__ void __attribute__((always_inline)) EthAckRxDcpt(void)
{
    ETHCON1SET=0x00000001;
}
# 3853 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
typedef enum
{

    ETH_MAC_CONFIG1_RXEN
                             = 0x00000001 ,


    ETH_MAC_CONFIG1_PASS_ALL
                             = 0x00000002 ,


    ETH_MAC_CONFIG1_RX_PAUSE
                             = 0x00000004 ,


    ETH_MAC_CONFIG1_TX_PAUSE
                             = 0x00000008 ,


    ETH_MAC_CONFIG1_LOOPBACK
                             = 0x00000010 ,


    ETH_MAC_CONFIG1_RESET_TFUN
                             = 0x00000100 ,


    ETH_MAC_CONFIG1_RESET_TMCS
                             = 0x00000200 ,


    ETH_MAC_CONFIG1_RESET_RFUN
                             = 0x00000400 ,


    ETH_MAC_CONFIG1_RESET_RMCS
                             = 0x00000800 ,


    ETH_MAC_CONFIG1_RESET_SIM
                             = 0x00004000 ,


    ETH_MAC_CONFIG1_RESET_MAC
                             = 0x00008000

} eEthMACConfig1Flags;
# 3918 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
typedef enum
{

    ETH_MAC_CONFIG2_FDUPLEX
                             = 0x00000001 ,


    ETH_MAC_CONFIG2_LEN_CHECK
                             = 0x00000002 ,


    ETH_MAC_CONFIG2_HUGE_FRAME
                             = 0x00000004 ,


    ETH_MAC_CONFIG2_DELAY_CRC
                             = 0x00000008 ,


    ETH_MAC_CONFIG2_CRC_ENABLE
                             = 0x00000010 ,



    ETH_MAC_CONFIG2_PAD_ENABLE
                             = 0x00000020 ,


    ETH_MAC_CONFIG2_VLAN_PAD
                             = 0x00000040 ,



    ETH_MAC_CONFIG2_AUTO_PAD
                             = 0x00000080 ,


    ETH_MAC_CONFIG2_PURE_PRE
                             = 0x00000100 ,


    ETH_MAC_CONFIG2_LONG_PRE
                             = 0x00000200 ,



    ETH_MAC_CONFIG2_NO_BACKOFF
                             = 0x00001000 ,



    ETH_MAC_CONFIG2_BP_NO_BACKOFF
                             = 0x00002000 ,


    ETH_MAC_CONFIG2_EXCESS_DEFER
                             = 0x00004000 ,

} eEthMACConfig2Flags;
# 3992 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
typedef enum
{

    ETH_MAC_CONFIG_SUPP_RMII_RESET
                             = 0x00000800 ,


    ETH_MAC_CONFIG_SUPP_RMII_SPEED
                             = 0x00000100

} eEthMACConfigSuppFlags;
# 4042 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthMACConfig ( eEthMACConfig1Flags c1Flags, eEthMACConfig2Flags c2Flags,
                    eEthMACConfigSuppFlags sFlags );
# 4084 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthMACConfigSetFlags ( eEthMACConfig1Flags c1Flags, eEthMACConfig2Flags c2Flags,
                            eEthMACConfigSuppFlags sFlags );
# 4126 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthMACConfigClrFlags ( eEthMACConfig1Flags c1Flags, eEthMACConfig2Flags c2Flags,
                            eEthMACConfigSuppFlags sFlags );
# 4162 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthMACConfigB2BIpGap ( unsigned int ipGap );
# 4206 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthMACConfigNB2BIpGap ( unsigned int ipgr1, unsigned int ipgr2 );
# 4252 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
void EthMACConfigCollWinRetry ( unsigned int collWin, unsigned int retMax );
# 4262 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\eth_legacy.h" 1 3
# 78 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\eth_legacy.h" 3
typedef enum
{
    MAC_PAUSE_TYPE_NONE = 0x0,

    MAC_PAUSE_TYPE_PAUSE = 0x1,

    MAC_PAUSE_TYPE_ASM_DIR = 0x2,

    MAC_PAUSE_TYPE_EN_TX = 0x4,

    MAC_PAUSE_TYPE_EN_RX = 0x8,

    MAC_PAUSE_ALL = (MAC_PAUSE_TYPE_PAUSE|MAC_PAUSE_TYPE_ASM_DIR|
                           MAC_PAUSE_TYPE_EN_TX|MAC_PAUSE_TYPE_EN_RX),

    MAC_PAUSE_CPBL_MASK = MAC_PAUSE_ALL

} eMacPauseType;
# 121 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\eth_legacy.h" 3
void EthMIIMInit(unsigned int hostClock, unsigned int miimClock, eEthOpenFlags oFlags, int isRmii);
# 161 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\eth_legacy.h" 3
unsigned short EthMIIMReadReg ( unsigned int rIx, unsigned int phyAdd );
# 203 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\eth_legacy.h" 3
void EthMIIMWriteReg ( unsigned int rIx, unsigned int phyAdd, unsigned short wData );
# 246 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\eth_legacy.h" 3
void EthMIIMWriteRegWait ( unsigned int rIx, unsigned int phyAdd, unsigned short wData );
# 284 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\eth_legacy.h" 3
unsigned short EthMIIMScanRead ( void );
# 320 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\eth_legacy.h" 3
void EthMIIMScanStopWait ( void );
# 358 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\eth_legacy.h" 3
typedef void* ( *pEthDcptAllocF )( size_t nitems, size_t size );
# 389 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\eth_legacy.h" 3
typedef void ( *pEthDcptFreeF ) ( void* ptr );
# 440 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\eth_legacy.h" 3
int EthDescriptorsAdd ( int nDescriptors, eEthDcptType dType, pEthDcptAllocF fAlloc );
# 488 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\eth_legacy.h" 3
int EthDescriptorsRemove ( int nDescriptors, eEthDcptType dType, pEthDcptFreeF fFree );
# 531 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\eth_legacy.h" 3
void EthDescriptorsCleanUp ( eEthDcptType dType, pEthDcptFreeF fFree );
# 565 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\eth_legacy.h" 3
typedef void ( *pEthPktAckF ) ( void *pPktBuff, int buffIx );
# 622 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\eth_legacy.h" 3
eEthRes EthTxAckBuffer ( const void *pBuff, pEthPktAckF ackFnc );
# 674 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\eth_legacy.h" 3
eEthRes EthTxAckPacket(const sEthPktDcpt* pPkt, pEthPktAckF ackFnc);

extern __inline__ eEthRes __attribute__((always_inline)) EthTxAckPacket(const sEthPktDcpt* pPkt, pEthPktAckF ackFnc)
{
    return EthTxAckBuffer(pPkt?pPkt->pBuff:0, ackFnc);
}
# 732 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\eth_legacy.h" 3
eEthRes EthRxAckBuffer ( const void *pBuff, pEthPktAckF ackFnc );
# 782 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\legacy\\eth_legacy.h" 3
eEthRes EthRxAckPacket ( const sEthPktDcpt* pPkt, pEthPktAckF ackFnc );

extern __inline__ eEthRes __attribute__((always_inline)) EthRxAckPacket(const sEthPktDcpt* pPkt, pEthPktAckF ackFnc)
{
    return EthRxAckBuffer(pPkt?pPkt->pBuff:0, ackFnc);
}
# 4263 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\eth.h" 2 3
# 72 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 2 3
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 1 3
# 88 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef enum
{

    CAN1,



    CAN2,


    CAN_NUMBER_OF_MODULES

}CAN_MODULE;
# 115 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef enum
{
    CAN_CHANNEL0,
    CAN_CHANNEL1,
    CAN_CHANNEL2,
    CAN_CHANNEL3,
    CAN_CHANNEL4,
    CAN_CHANNEL5,
    CAN_CHANNEL6,
    CAN_CHANNEL7,
    CAN_CHANNEL8,
    CAN_CHANNEL9,
    CAN_CHANNEL10,
    CAN_CHANNEL11,
    CAN_CHANNEL12,
    CAN_CHANNEL13,
    CAN_CHANNEL14,
    CAN_CHANNEL15,
    CAN_CHANNEL16,
    CAN_CHANNEL17,
    CAN_CHANNEL18,
    CAN_CHANNEL19,
    CAN_CHANNEL20,
    CAN_CHANNEL21,
    CAN_CHANNEL22,
    CAN_CHANNEL23,
    CAN_CHANNEL24,
    CAN_CHANNEL25,
    CAN_CHANNEL26,
    CAN_CHANNEL27,
    CAN_CHANNEL28,
    CAN_CHANNEL29,
    CAN_CHANNEL30,
    CAN_CHANNEL31,
    CAN_ALL_CHANNELS


}CAN_CHANNEL;
# 167 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef enum
{


    CAN_NORMAL_OPERATION,



    CAN_DISABLE,




    CAN_LOOPBACK,




    CAN_LISTEN_ONLY,



    CAN_CONFIGURATION,



    CAN_LISTEN_ALL_MESSAGES = 7

}CAN_OP_MODE;
# 217 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef enum
{
    CAN_RX_CHANNEL_NOT_EMPTY = 0x1,
    CAN_RX_CHANNEL_HALF_FULL = 0x2,
    CAN_RX_CHANNEL_FULL = 0x4,
    CAN_RX_CHANNEL_OVERFLOW = 0x8,
    CAN_RX_CHANNEL_ANY_EVENT = 0xF,
    CAN_TX_CHANNEL_EMPTY = 0x100,
    CAN_TX_CHANNEL_HALF_EMPTY = 0x200,
    CAN_TX_CHANNEL_NOT_FULL = 0x400,
    CAN_TX_CHANNEL_ANY_EVENT = 0x700

}CAN_CHANNEL_EVENT;
# 242 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef enum
{
    CAN_BIT_1TQ,
    CAN_BIT_2TQ,
    CAN_BIT_3TQ,
    CAN_BIT_4TQ,
    CAN_BIT_5TQ,
    CAN_BIT_6TQ,
    CAN_BIT_7TQ,
    CAN_BIT_8TQ

}CAN_BIT_TQ;
# 270 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef struct
{


    CAN_BIT_TQ phaseSeg2Tq;



    CAN_BIT_TQ phaseSeg1Tq;



    CAN_BIT_TQ propagationSegTq;





    BOOL phaseSeg2TimeSelect;





    BOOL sample3Time;



    CAN_BIT_TQ syncJumpWidth;

}CAN_BIT_CONFIG;
# 313 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef enum
{
    CAN_CHANNEL0_EVENT,
    CAN_CHANNEL1_EVENT,
    CAN_CHANNEL2_EVENT,
    CAN_CHANNEL3_EVENT,
    CAN_CHANNEL4_EVENT,
    CAN_CHANNEL5_EVENT,
    CAN_CHANNEL6_EVENT,
    CAN_CHANNEL7_EVENT,
    CAN_CHANNEL8_EVENT,
    CAN_CHANNEL9_EVENT,
    CAN_CHANNEL10_EVENT,
    CAN_CHANNEL11_EVENT,
    CAN_CHANNEL12_EVENT,
    CAN_CHANNEL13_EVENT,
    CAN_CHANNEL14_EVENT,
    CAN_CHANNEL15_EVENT,
    CAN_CHANNEL16_EVENT,
    CAN_CHANNEL17_EVENT,
    CAN_CHANNEL18_EVENT,
    CAN_CHANNEL19_EVENT,
    CAN_CHANNEL20_EVENT,
    CAN_CHANNEL21_EVENT,
    CAN_CHANNEL22_EVENT,
    CAN_CHANNEL23_EVENT,
    CAN_CHANNEL24_EVENT,
    CAN_CHANNEL25_EVENT,
    CAN_CHANNEL26_EVENT,
    CAN_CHANNEL27_EVENT,
    CAN_CHANNEL28_EVENT,
    CAN_CHANNEL29_EVENT,
    CAN_CHANNEL30_EVENT,
    CAN_CHANNEL31_EVENT,
    CAN_NO_EVENT = 0x40,
    CAN_ERROR_EVENT,
    CAN_WAKEUP_EVENT,
    CAN_RX_CHANNEL_OVERFLOW_EVENT,
    CAN_ADDRESS_ERROR_EVENT,
    CAN_BUS_BANDWIDTH_ERROR,
    CAN_TIMESTAMP_TIMER_EVENT,
    CAN_MODE_CHANGE_EVENT,
    CAN_INVALID_MESSAGE_RECEIVED_EVENT

}CAN_EVENT_CODE;
# 369 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef enum
{
    CAN_FILTER0,
    CAN_FILTER1,
    CAN_FILTER2,
    CAN_FILTER3,
    CAN_FILTER4,
    CAN_FILTER5,
    CAN_FILTER6,
    CAN_FILTER7,
    CAN_FILTER8,
    CAN_FILTER9,
    CAN_FILTER10,
    CAN_FILTER11,
    CAN_FILTER12,
    CAN_FILTER13,
    CAN_FILTER14,
    CAN_FILTER15,
    CAN_FILTER16,
    CAN_FILTER17,
    CAN_FILTER18,
    CAN_FILTER19,
    CAN_FILTER20,
    CAN_FILTER21,
    CAN_FILTER22,
    CAN_FILTER23,
    CAN_FILTER24,
    CAN_FILTER25,
    CAN_FILTER26,
    CAN_FILTER27,
    CAN_FILTER28,
    CAN_FILTER29,
    CAN_FILTER30,
    CAN_FILTER31,




    CAN_NUMBER_OF_FILTERS


}CAN_FILTER;
# 422 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef enum
{
    CAN_FILTER_MASK0,
    CAN_FILTER_MASK1,
    CAN_FILTER_MASK2,
    CAN_FILTER_MASK3,




    CAN_NUMBER_OF_FILTER_MASKS

}CAN_FILTER_MASK;
# 448 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef enum
{
    CAN_EID,
    CAN_SID

}CAN_ID_TYPE;
# 470 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef enum
{
    CAN_TX_RTR_ENABLED,
    CAN_TX_RTR_DISABLED

}CAN_TX_RTR;
# 491 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef enum
{
    CAN_RX_DATA_ONLY,
    CAN_RX_FULL_RECEIVE

}CAN_RX_DATA_MODE;
# 514 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef enum
{
    CAN_FILTER_MASK_IDE_TYPE,
    CAN_FILTER_MASK_ANY_TYPE

}CAN_FILTER_MASK_TYPE;
# 535 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef enum
{
    CAN_LOWEST_PRIORITY,
    CAN_LOW_MEDIUM_PRIORITY,
    CAN_HIGH_MEDIUM_PRIORITY,
    CAN_HIGHEST_PRIORITY

}CAN_TXCHANNEL_PRIORITY;
# 556 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef enum
{
    CAN_DNET_FILTER_DISABLE,
    CAN_DNET_FILTER_SIZE_1_BIT,
    CAN_DNET_FILTER_SIZE_2_BIT,
    CAN_DNET_FILTER_SIZE_3_BIT,
    CAN_DNET_FILTER_SIZE_4_BIT,
    CAN_DNET_FILTER_SIZE_5_BIT,
    CAN_DNET_FILTER_SIZE_6_BIT,
    CAN_DNET_FILTER_SIZE_7_BIT,
    CAN_DNET_FILTER_SIZE_8_BIT,
    CAN_DNET_FILTER_SIZE_9_BIT,
    CAN_DNET_FILTER_SIZE_10_BIT,
    CAN_DNET_FILTER_SIZE_11_BIT,
    CAN_DNET_FILTER_SIZE_12_BIT,
    CAN_DNET_FILTER_SIZE_13_BIT,
    CAN_DNET_FILTER_SIZE_14_BIT,
    CAN_DNET_FILTER_SIZE_15_BIT,
    CAN_DNET_FILTER_SIZE_16_BIT,
    CAN_DNET_FILTER_SIZE_17_BIT,
    CAN_DNET_FILTER_SIZE_18_BIT,

}CAN_DNET_FILTER_SIZE;
# 596 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef enum
{


    CAN_TX_EVENT = 0x1,



    CAN_RX_EVENT = 0x2,




    CAN_TIMESTAMP_TIMER_OVERFLOW_EVENT = 0x4,




    CAN_OPERATION_MODE_CHANGE_EVENT = 0x8,



    CAN_RX_OVERFLOW_EVENT = 0x800,




    CAN_SYSTEM_ERROR_EVENT = 0x1000,



    CAN_BUS_ERROR_EVENT = 0x2000,




    CAN_BUS_ACTIVITY_WAKEUP_EVENT = 0x4000,



    CAN_INVALID_RX_MESSAGE_EVENT = 0x8000

}CAN_MODULE_EVENT;
# 655 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef enum
{

    CAN_TX_RX_WARNING_STATE = 0x10000,


    CAN_RX_WARNING_STATE = 0x20000,


    CAN_TX_WARNING_STATE = 0x40000,


    CAN_RX_BUS_PASSIVE_STATE = 0x80000,


    CAN_TX_BUS_PASSIVE_STATE = 0x100000,


    CAN_TX_BUS_OFF_STATE = 0x200000

}CAN_ERROR_STATE;
# 692 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef enum
{


    CAN_STOP_IN_IDLE = 0x2000,



    CAN_RX_TIMESTAMP = 0x100000,



    CAN_WAKEUP_BUS_FILTER = 0x400000

}CAN_MODULE_FEATURES;
# 722 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef enum
{
    CAN_CHANNEL0_MASK = 0x00000001,
    CAN_CHANNEL1_MASK = 0x00000002,
    CAN_CHANNEL2_MASK = 0x00000004,
    CAN_CHANNEL3_MASK = 0x00000008,
    CAN_CHANNEL4_MASK = 0x00000010,
    CAN_CHANNEL5_MASK = 0x00000020,
    CAN_CHANNEL6_MASK = 0x00000040,
    CAN_CHANNEL7_MASK = 0x00000080,
    CAN_CHANNEL8_MASK = 0x00000100,
    CAN_CHANNEL9_MASK = 0x00000200,
    CAN_CHANNEL10_MASK = 0x00000400,
    CAN_CHANNEL11_MASK = 0x00000800,
    CAN_CHANNEL12_MASK = 0x00001000,
    CAN_CHANNEL13_MASK = 0x00002000,
    CAN_CHANNEL14_MASK = 0x00004000,
    CAN_CHANNEL15_MASK = 0x00008000,
    CAN_CHANNEL16_MASK = 0x00010000,
    CAN_CHANNEL17_MASK = 0x00020000,
    CAN_CHANNEL18_MASK = 0x00040000,
    CAN_CHANNEL19_MASK = 0x00080000,
    CAN_CHANNEL20_MASK = 0x00100000,
    CAN_CHANNEL21_MASK = 0x00200000,
    CAN_CHANNEL22_MASK = 0x00400000,
    CAN_CHANNEL23_MASK = 0x00800000,
    CAN_CHANNEL24_MASK = 0x01000000,
    CAN_CHANNEL25_MASK = 0x02000000,
    CAN_CHANNEL26_MASK = 0x04000000,
    CAN_CHANNEL27_MASK = 0x08000000,
    CAN_CHANNEL28_MASK = 0x10000000,
    CAN_CHANNEL29_MASK = 0x20000000,
    CAN_CHANNEL30_MASK = 0x40000000,
    CAN_CHANNEL31_MASK = 0x80000000,
    CAN_ANYCHANNEL_MASK = 0xFFFFFFFF

}CAN_CHANNEL_MASK;
# 773 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef enum
{

    CAN_TX_CHANNEL_TRANSMITTING = 0x8,


    CAN_TX_CHANNEL_ERROR = 0x10,


    CAN_TX_CHANNEL_ARBITRATION_LOST = 0x20

}CAN_TX_CHANNEL_CONDITION;
# 797 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef struct
{


    unsigned SID:11;
    unsigned :21;
}CAN_TX_MSG_SID;
# 817 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef struct
{



    unsigned DLC:4;


    unsigned RB0:1;
    unsigned :3;


    unsigned RB1:1;



    unsigned RTR:1;



    unsigned EID:18;



    unsigned IDE:1;




    unsigned SRR:1;
    unsigned :2;

}CAN_MSG_EID;
# 869 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef union {

    struct
    {

        CAN_TX_MSG_SID msgSID;


        CAN_MSG_EID msgEID;


        BYTE data[8];
    };



    UINT32 messageWord[4];

}CANTxMessageBuffer;
# 900 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef struct
{

    unsigned SID:11;


    unsigned FILHIT:5;



    unsigned CMSGTS:16;

}CAN_RX_MSG_SID;
# 932 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
typedef union {

    struct
    {

        CAN_RX_MSG_SID msgSID;


        CAN_MSG_EID msgEID;



        BYTE data[8];
    };



    BYTE dataOnlyMsgData[8];



    UINT32 messageWord[4];

}CANRxMessageBuffer;
# 1005 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
void CANAssignMemoryBuffer(CAN_MODULE module, void * buffer, UINT sizeInBytes);
# 1043 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
void CANSetOperatingMode(CAN_MODULE module, CAN_OP_MODE opmode);
# 1078 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
CAN_OP_MODE CANGetOperatingMode(CAN_MODULE module);
# 1125 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
void CANEnableFeature(CAN_MODULE module, CAN_MODULE_FEATURES features, BOOL enable);
# 1168 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
void CANDeviceNetFilter(CAN_MODULE module, CAN_DNET_FILTER_SIZE dncnt);
# 1209 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
void CANSetTimeStampValue(CAN_MODULE module, UINT value);
# 1244 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
UINT CANGetTimeStampValue(CAN_MODULE module);
# 1285 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
void CANSetTimeStampPrescalar(CAN_MODULE module, UINT prescalar);
# 1327 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
void CANEnableModule(CAN_MODULE module, BOOL enable );
# 1389 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
void CANSetSpeed(CAN_MODULE module, const CAN_BIT_CONFIG * canBitConfig,
                        UINT32 sysClock, UINT32 canBusSpeed );
# 1436 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
BOOL CANIsActive(CAN_MODULE module);
# 1481 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
void CANResetChannel(CAN_MODULE module, CAN_CHANNEL channel );
# 1523 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
BOOL CANIsChannelReset(CAN_MODULE module, CAN_CHANNEL channel );
# 1606 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
void CANUpdateChannel(CAN_MODULE module, CAN_CHANNEL channel);
# 1659 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
void CANEnableModuleEvent(CAN_MODULE module, CAN_MODULE_EVENT flags, BOOL enable);
# 1699 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
void CANClearModuleEvent(CAN_MODULE module, CAN_MODULE_EVENT flags);
# 1755 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
void CANEnableChannelEvent(CAN_MODULE module, CAN_CHANNEL channel,CAN_CHANNEL_EVENT flags, BOOL enable);
# 1809 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
CAN_MODULE_EVENT CANGetModuleEvent(CAN_MODULE module);
# 1866 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
CAN_EVENT_CODE CANGetPendingEventCode(CAN_MODULE module);
# 1926 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
CAN_CHANNEL_MASK CANGetAllChannelEventStatus(CAN_MODULE module);
# 1987 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
CAN_CHANNEL_MASK CANGetAllChannelOverflowStatus(CAN_MODULE module);
# 2060 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
CAN_CHANNEL_EVENT CANGetChannelEvent(CAN_MODULE module, CAN_CHANNEL channel);
# 2101 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
void CANClearChannelEvent(CAN_MODULE module, CAN_CHANNEL channel, CAN_CHANNEL_EVENT events);
# 2164 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
void CANConfigureChannelForTx(CAN_MODULE module,CAN_CHANNEL channel, UINT channelSize,
                             CAN_TX_RTR rtren, CAN_TXCHANNEL_PRIORITY priority);
# 2213 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
void CANAbortPendingTx(CAN_MODULE module, CAN_CHANNEL channel);
# 2253 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
void CANFlushTxChannel(CAN_MODULE module, CAN_CHANNEL channel);
# 2313 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
CAN_TX_CHANNEL_CONDITION CANGetTxChannelCondition(CAN_MODULE module, CAN_CHANNEL channel);
# 2377 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
CANTxMessageBuffer * CANGetTxMessageBuffer(CAN_MODULE module, CAN_CHANNEL channel);
# 2434 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
BOOL CANIsTxAborted(CAN_MODULE module, CAN_CHANNEL channel);
# 2527 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
CANRxMessageBuffer * CANGetRxMessage(CAN_MODULE module, CAN_CHANNEL channel);
# 2589 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
void CANConfigureChannelForRx(CAN_MODULE module, CAN_CHANNEL channel, UINT32 channelSize,
        CAN_RX_DATA_MODE dataOnly);
# 2670 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
void CANConfigureFilterMask(CAN_MODULE module, CAN_FILTER_MASK mask, UINT32 maskbits,
                                CAN_ID_TYPE idType, CAN_FILTER_MASK_TYPE mide);
# 2727 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
void CANConfigureFilter(CAN_MODULE module, CAN_FILTER filter, UINT32 id, CAN_ID_TYPE filterType);
# 2778 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
void CANEnableFilter(CAN_MODULE module, CAN_FILTER filter, BOOL enable);
# 2823 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
CAN_FILTER CANGetLatestFilterHit(CAN_MODULE module);
# 2886 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
void CANLinkFilterToChannel(CAN_MODULE module, CAN_FILTER filter, CAN_FILTER_MASK mask, CAN_CHANNEL channel);
# 2929 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
BOOL CANIsFilterDisabled(CAN_MODULE module, CAN_FILTER filter);
# 2982 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
UINT CANGetRxErrorCount(CAN_MODULE module);
# 3028 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
UINT CANGetTxErrorCount(CAN_MODULE module);
# 3085 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
CAN_ERROR_STATE CANGetErrorState(CAN_MODULE module);
# 3116 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
UINT CANTotalModules(void);
# 3141 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
UINT CANTotalChannels(void);
# 3166 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
UINT CANTotalFilters(void);
# 3191 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\peripheral\\can.h" 3
UINT CANTotalMasks(void);
# 73 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\plib.h" 2 3
# 112 "Compiler.h" 2




# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\stdio.h" 1 3 4
# 22 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\stdio.h" 3 4
# 1 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 1 3 4
# 16 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 3 4
typedef __builtin_va_list va_list;




typedef __builtin_va_list __isoc_va_list;
# 43 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 3 4
typedef long off_t;
# 153 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 3 4
typedef int ssize_t;
# 514 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\bits\\alltypes.h" 3 4
typedef struct _IO_FILE FILE;
# 23 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\stdio.h" 2 3 4
# 50 "c:\\program files\\microchip\\xc32\\v4.45\\pic32mx\\include\\musl\\stdio.h" 3 4
typedef union _G_fpos64_t {
 char __opaque[16];
 double __align;
} fpos_t;

extern __attribute__((section(".data._stdout"))) FILE *const *_stdout;
extern __attribute__((section(".data._stderr"))) FILE *const *_stderr;
extern __attribute__((section(".data._stdin"))) FILE *const *_stdin;





FILE *fopen(const char *restrict, const char *restrict);
FILE *freopen(const char *restrict, const char *restrict, FILE *restrict);
int fclose(FILE *);

int remove(const char *);
int rename(const char *, const char *);

int feof(FILE *);
int ferror(FILE *);
int fflush(FILE *);
void clearerr(FILE *);

int fseek(FILE *, long, int);
long ftell(FILE *);
void rewind(FILE *);

int fgetpos(FILE *restrict, fpos_t *restrict);
int fsetpos(FILE *, const fpos_t *);

size_t fread(void *restrict, size_t, size_t, FILE *restrict);
size_t fwrite(const void *restrict, size_t, size_t, FILE *restrict);

int fgetc(FILE *);
int getc(FILE *);
int getchar(void);
int ungetc(int, FILE *);

int fputc(int, FILE *);
int putc(int, FILE *);
int putchar(int);

char *fgets(char *restrict, int, FILE *restrict);




int fputs(const char *restrict, FILE *restrict);
int puts(const char *);

int printf(const char *restrict, ...);
int fprintf(FILE *restrict, const char *restrict, ...);
int sprintf(char *restrict, const char *restrict, ...);
int snprintf(char *restrict, size_t, const char *restrict, ...);

int vprintf(const char *restrict, __isoc_va_list);
int vfprintf(FILE *restrict, const char *restrict, __isoc_va_list);
int vsprintf(char *restrict, const char *restrict, __isoc_va_list);
int vsnprintf(char *restrict, size_t, const char *restrict, __isoc_va_list);

int scanf(const char *restrict, ...);
int fscanf(FILE *restrict, const char *restrict, ...);
int sscanf(const char *restrict, const char *restrict, ...);
int vscanf(const char *restrict, __isoc_va_list);
int vfscanf(FILE *restrict, const char *restrict, __isoc_va_list);
int vsscanf(const char *restrict, const char *restrict, __isoc_va_list);

void perror(const char *);

int setvbuf(FILE *restrict, char *restrict, int, size_t);
void setbuf(FILE *restrict, char *restrict);

char *tmpnam(char *);
FILE *tmpfile(void);




FILE *fmemopen(void *restrict, size_t, const char *restrict);
FILE *fdopen(int, const char *);
int fileno(FILE *);
int fseeko(FILE *, off_t, int);
off_t ftello(FILE *);
int getc_unlocked(FILE *);
int getchar_unlocked(void);
int putc_unlocked(int, FILE *);
int putchar_unlocked(int);






char *tempnam(const char *, const char *);



void setbuffer(FILE *, char *, size_t);
void setlinebuf(FILE *f);
int fgetc_unlocked(FILE *);
int fputc_unlocked(int, FILE *);
int fflush_unlocked(FILE *);
size_t fread_unlocked(void *, size_t, size_t, FILE *);
size_t fwrite_unlocked(const void *, size_t, size_t, FILE *);
int feof_unlocked(FILE *);
int ferror_unlocked(FILE *);
int fileno_unlocked(FILE *);
int asprintf(char **, const char *, ...);
int vasprintf(char **, const char *, __isoc_va_list);
# 117 "Compiler.h" 2
# 58 "TCPIP.h" 2
# 1 "HardwareProfile.h" 1
# 59 "TCPIP.h" 2

# 1 "Addon.h" 1

# 1 "Config.h" 1
# 3 "Addon.h" 2



# 5 "Addon.h"
void InitAddon(void);
void AddonTask(void);
void PowerMeterTask(void);






typedef union{
    struct{
        unsigned All:16;
    };
    struct{
        unsigned Overall:1;
        unsigned VoltageUpper:1;
        unsigned VoltageLower:1;
        unsigned OverCurrent:1;
        unsigned FrequencyUpper:1;
        unsigned FrequencyLower:1;
        unsigned RotationIncorrect:1;
        unsigned ReverseCurrent:1;
        unsigned DipDetectedA:1;
        unsigned DipDetectedB:1;
        unsigned DipDetectedC:1;
        unsigned SwellDetectedA:1;
        unsigned SwellDetectedB:1;
        unsigned SwellDetectedC:1;
        unsigned :2;
    };
}BussStatusBits;

typedef union{
    struct{
        unsigned All:8;
    };
    struct{
        unsigned Rotation:1;
        unsigned NoVoltage:1;
        unsigned Noload:1;
        unsigned :5;
    };
}WorkingBits;

typedef struct{
    float Voltage[3];
    float Current[4];
    float Frequency;
    float ActivePower[3];
    float ReactivePower[3];
    float ApparentPower[3];
    float PowerFactor[3];
    float TotalPowerFactor;
    float TotalActivePower;
    float TotalReactivePower;
    float TotalApparentPower;
    float THDI;
    float HDI[3];
    float HDV[3];
    float PhaseVoltageAngles[3];
    float PhaseCurrentAngles[3];
    float PhaseVoltageToCurrentAngles[3];
    float THDV;
    float ActiveWattAcc[3];
    float ReactiveWattAcc[3];
    float ApparentWattAcc[3];
    UINT16 PrimaryCT;
    UINT16 SecondaryCT;
    UINT16 CTRatio;
    float ActiveEnergyAccumulationCalc;
    float ReactiveEnergyAccumulationCalc;
    float ApparentEnergyAccumulationCalc;
    INT32 ActiveEnergyAccumulation;
    INT32 ReactiveEnergyAccumulation;
    INT32 ApparentEnergyAccumulation;
    char PowerMeterResetFlag;
    char PowerMeterResetCounter;
    BussStatusBits BussStatus;
    WorkingBits Working;
}MeterData;

typedef struct{
    UINT16 VoltageUpper;
    UINT16 HysterisisVoltageUpper;
    UINT16 VoltageLower;
    UINT8 PrecentageVoltageHysterisis;
    UINT8 PrecentageFrequencyHysterisis;
    UINT16 HysterisisVoltageLower;
    UINT16 FrequencyLower;
    UINT16 HysterisisFrequencyLower;
    UINT16 FrequencyUpper;
    UINT16 HysterisisFrequencyUpper;
    UINT8 PrecentageNoLoadVoltage;
    UINT8 PrecentageNoLoadCurrent;
    UINT16 NoLoadVoltage;
    UINT16 NoLoadCurrent;
    UINT16 Current;
    UINT16 RevereCurrentThreshold;
}MeterThresholds;

typedef struct{
    float VoltageSetpoint;
    float CurrentSetpoint;
    float PowerFactorSepoint;
    INT32 ADERegistersCalibrationData[15];
}MeterCalibration;

typedef struct{
    UINT32 Current[3][256];
    UINT32 Voltage[3][256];
}WaveData;

typedef struct{
    BYTE WIFISSIDName[40];
    BYTE SSIDtoConnectTo[40];
    BYTE SSIDPasstoConnectTo[40];
    BYTE SSIDConnectedTo[40];
    union{
        struct{
            unsigned All:8;
        };
        struct{
            unsigned AskPIWIFIData:1;
            unsigned RequestMoreNames:1;
            unsigned GotNewSSIDName:1;
            unsigned SendPIWifiDetails:1;
            unsigned GetNextSSID:1;
            unsigned GetWIFIConnectionStatus:1;
            unsigned ReceivedConnectionStatus:1;
            unsigned DisconnectPIWIFI:1;
        };
    }Working;
}PIWIFIstuct;

struct{
    BYTE MYIP[5];
    UINT32 MYMAC;
    BYTE MYMASK[5];
    BYTE MYGate[5];
    BYTE ControllerName[1+25];
    PIWIFIstuct PiFi;
    union{
        struct{
            unsigned All:8;
        };
        struct{
            unsigned In1:1;
            unsigned In2:1;
            unsigned :6;
        };
    }DigitalInputs;
    union{
        struct{
            unsigned All:8;
        };
        struct{
            unsigned InveterTheRotation:1;
            unsigned InveterCTL1:1;
            unsigned InveterCTL2:1;
            unsigned InveterCTL3:1;
            unsigned :4;
        };
    }Settings;
    union{
        struct{
            unsigned All:16;
        };
        struct{
            unsigned RequestedID:1;
            unsigned SendHTMLPopup:1;
            unsigned SendIDOnCANBuss:1;
            unsigned Debug:1;
            unsigned StartCalibration:1;
            unsigned WaveformToggle:1;
            unsigned GetWaveForm:1;
            unsigned :9;
        };
    }Working;
    UINT8 KWToggleStatus;
    UINT8 KWToggleMinor;
    UINT8 PortOldStatus;
    UINT8 HTMLSelection;
    UINT8 BoardID;
    UINT16 EnergyTimer;
    UINT8 BoardType;
    UINT8 ModbusUsedSockets;
    UINT8 AmountOfBoardsAttached;
    MeterData MeterMeasurements;
    MeterCalibration CalibrationData;
    MeterThresholds MeterThreshold;
    WaveData Waveform;
    char ModbusMeterData[201];
    char ModbusConfiguationData[101];
    char ModbusMeterExtra[201];
    char ModbusMeterFloats[201];
}Board;
# 61 "TCPIP.h" 2
# 1 "SRAM.h" 1
# 30 "SRAM.h"
# 1 "TCPIP.h" 1
# 31 "SRAM.h" 2
# 54 "SRAM.h"
extern void InitSRAM(void);
extern unsigned char SRAMReadStatusReg(void);
void SRAMCommand(UINT32 Address, unsigned char RWCmd);
extern char SRAMWriteStatusReg(unsigned char WriteVal);
extern char SRAMWriteByte(UINT32 Address,UINT8 WriteData);
extern unsigned char SRAMReadByte(UINT32 Address);
extern unsigned char SRAMTCPWriteData(UINT8 BAtchNumber,UINT8 Quantity,UINT8 InstanceNo, unsigned char *WriteData);
extern unsigned char SRAMReadPageDataFromStart(UINT8 BAtchNumber,UINT8 Quantity,UINT8 InstanceNo,unsigned char *ReadData);
extern unsigned char SRAMReadByteFromLocation(UINT8 BAtchNumber,UINT8 InstanceNo,UINT8 ByteNumber);
extern char SRAMWriteByteFromLocation(UINT8 Type,UINT8 InstanceNo,UINT8 ByteNumber,UINT8 WriteData);
unsigned char SRAMClearData(UINT8 Type,UINT8 Quantity,UINT8 InstanceNo);
extern unsigned char SRAMReadPage(UINT32 Address,unsigned char *ReadData);
extern char SRAMWriteSeq(UINT32 Address, unsigned char *WriteData,unsigned int WriteCnt);
extern char SRAMReadSeq(UINT32 Address,unsigned char *ReadData,unsigned int ReadCnt);
UINT32 StartAddressCalculation(UINT8 BAtchNumber,UINT8 InstanceNo);
# 62 "TCPIP.h" 2

BYTE CAN2MessageFifoArea[2 * 8 * 16];


typedef struct{
    UINT8 Data[10];
    UINT8 DLC;
}CAN;

CAN CANPort1;
# 99 "TCPIP.h"
# 1 "TCPIPConfig.h" 1
# 54 "TCPIPConfig.h"
# 1 "TCPIP_ETH795.h" 1
# 55 "TCPIPConfig.h" 2
# 100 "TCPIP.h" 2
# 299 "TCPIP.h"
# 1 "StackTsk.h" 1
# 76 "StackTsk.h"
typedef struct __attribute__((__packed__))
{
    BYTE v[6];
} MAC_ADDR;





typedef struct __attribute__((__packed__))
{
    DWORD_VAL IPAddr;
    MAC_ADDR MACAddr;
} NODE_INFO;


typedef struct __attribute__((__packed__))
{
 DWORD_VAL MyIPAddr;
 DWORD_VAL MyMask;
 DWORD_VAL MyGateway;
 DWORD_VAL PrimaryDNSServer;
 DWORD_VAL SecondaryDNSServer;
 DWORD_VAL DefaultIPAddr;
 DWORD_VAL DefaultMask;
 BYTE NetBIOSName[16];
 struct
 {
  unsigned char : 6;
  unsigned char bIsDHCPEnabled : 1;
  unsigned char bInConfigMode : 1;
 } Flags;
 MAC_ADDR MyMACAddr;
# 136 "StackTsk.h"
} APP_CONFIG;






void StackInit(void);
void StackTask(void);
void StackApplications(void);
# 300 "TCPIP.h" 2
# 1 "Helpers.h" 1
# 56 "Helpers.h"
 char *strupr(char* s);
# 81 "Helpers.h"
DWORD LFSRSeedRand(DWORD dwSeed);
WORD LFSRRand(void);
DWORD GenerateRandomDWORD(void);
void uitoa(WORD Value, BYTE* Buffer);
void UnencodeURL(BYTE* URL);
WORD Base64Decode(BYTE* cSourceData, WORD wSourceLen, BYTE* cDestData, WORD wDestLen);
WORD Base64Encode(BYTE* cSourceData, WORD wSourceLen, BYTE* cDestData, WORD wDestLen);
BOOL StringToIPAddress(BYTE* str, DWORD_VAL* IPAddress);
BYTE ReadStringUART(BYTE* Dest, BYTE BufferLen);
BYTE hexatob(WORD_VAL AsciiChars);
BYTE btohexa_high(BYTE b);
BYTE btohexa_low(BYTE b);
signed char stricmppgm2ram(BYTE* a, const BYTE* b);
char * strnchr(const char *searchString, size_t count, char c);
# 104 "Helpers.h"
WORD swaps(WORD v);
DWORD swapl(DWORD v);

WORD CalcIPChecksum(BYTE* buffer, WORD len);
WORD CalcIPBufferChecksum(WORD len);
# 117 "Helpers.h"
void FormatNetBIOSName(BYTE Name[16]);





typedef enum
{
 PROTOCOL_HTTP = 0u,
 PROTOCOL_HTTPS,
 PROTOCOL_MMS,
 PROTOCOL_RTSP
} PROTOCOLS;

BYTE ExtractURLFields(BYTE *vURL, PROTOCOLS *protocol, BYTE *vUsername, WORD *wUsernameLen, BYTE *vPassword, WORD *wPasswordLen, BYTE *vHostname, WORD *wHostnameLen, WORD *wPort, BYTE *vFilePath, WORD *wFilePathLen);
SHORT Replace(BYTE *vExpression, const BYTE *vFind, const BYTE *vReplacement, WORD wMaxLen, BOOL bSearchCaseInsensitive);
# 301 "TCPIP.h" 2
# 1 "Delay.h" 1
# 57 "Delay.h"
# 1 "HardwareProfile.h" 1
# 58 "Delay.h" 2
# 77 "Delay.h"
 void Delay10us(DWORD dwCount);
 void DelayMs(WORD ms);
# 302 "TCPIP.h" 2
# 1 "Tick.h" 1
# 63 "Tick.h"
typedef __attribute__((__deprecated__)) DWORD TICK;
# 80 "Tick.h"
void TickInit(void);
DWORD TickGet(void);
DWORD TickGetDiv256(void);
DWORD TickGetDiv64K(void);
DWORD TickConvertToMilliseconds(DWORD dwTickValue);
void TickUpdate(void);
# 303 "TCPIP.h" 2
# 1 "MAC.h" 1
# 59 "MAC.h"
# 1 "HardwareProfile.h" 1
# 60 "MAC.h" 2
# 98 "MAC.h"
typedef struct __attribute__((aligned(2), packed))
{
 MAC_ADDR DestMACAddr;
 MAC_ADDR SourceMACAddr;
 WORD_VAL Type;
} ETHER_HEADER;
# 168 "MAC.h"
WORD MACCalcRxChecksum(WORD offset, WORD len);
WORD CalcIPBufferChecksum(WORD len);

void MACPowerDown(void);
void MACEDPowerDown(void);
void MACPowerUp(void);






void SetRXHashTableEntry(MAC_ADDR DestMACAddr);


void SetCLKOUT(BYTE NewConfig);
BYTE GetCLKOUT(void);
# 286 "MAC.h"
void MACInit(void);
void MACProcess(void);
BOOL MACIsLinked(void);

BOOL MACGetHeader(MAC_ADDR *remote, BYTE* type);
void MACSetReadPtrInRx(WORD offset);
unsigned long MACSetWritePtr(unsigned long address);
unsigned long MACSetReadPtr(unsigned long address);
BYTE MACGet(void);
WORD MACGetArray(BYTE *val, WORD len);
void MACDiscardRx(void);
WORD MACGetFreeRxSize(void);
void MACMemCopyAsync(unsigned long destAddr, unsigned long sourceAddr, WORD len);
BOOL MACIsMemCopyDone(void);

void MACPutHeader(MAC_ADDR *remote, BYTE type, WORD dataLen);
BOOL MACIsTxReady(void);
void MACPut(BYTE val);
void MACPutArray(BYTE *val, WORD len);
void MACFlush(void);
# 317 "MAC.h"
 unsigned long MACGetTxBaseAddr(void);
 unsigned long MACGetHttpBaseAddr(void);
 unsigned long MACGetSslBaseAddr(void);
# 304 "TCPIP.h" 2
# 1 "IP.h" 1
# 64 "IP.h"
typedef struct _IP_HEADER
{
    BYTE VersionIHL;
    BYTE TypeOfService;
    WORD TotalLength;
    WORD Identification;
    WORD FragmentInfo;
    BYTE TimeToLive;
    BYTE Protocol;
    WORD HeaderChecksum;
    DWORD_VAL SourceAddress;
    DWORD_VAL DestAddress;
} IP_HEADER;



typedef struct _PSEUDO_HEADER
{
    DWORD_VAL SourceAddress;
    DWORD_VAL DestAddress;
    BYTE Zero;
    BYTE Protocol;
    WORD Length;
} PSEUDO_HEADER;
# 154 "IP.h"
WORD IPPutHeader(NODE_INFO *remote,
                    BYTE protocol,
                    WORD len);
# 185 "IP.h"
BOOL IPGetHeader(DWORD_VAL *localIP,
                 NODE_INFO *remote,
                 BYTE *protocol,
                 WORD *len);
# 246 "IP.h"
void IPSetRxBuffer(WORD Offset);
# 305 "TCPIP.h" 2
# 1 "ARP.h" 1
# 59 "ARP.h"
 void ARPInit(void);
# 72 "ARP.h"
typedef struct __attribute__((aligned(2), packed))
{
    WORD HardwareType;
    WORD Protocol;
    BYTE MACAddrLen;
    BYTE ProtocolLen;
    WORD Operation;
    MAC_ADDR SenderMACAddr;
    DWORD_VAL SenderIPAddr;
    MAC_ADDR TargetMACAddr;
    DWORD_VAL TargetIPAddr;
} ARP_PACKET;

BOOL ARPProcess(void);
void ARPResolve(DWORD_VAL* IPAddr);
BOOL ARPIsResolved(DWORD_VAL* IPAddr, MAC_ADDR* MACAddr);
void SwapARPPacket(ARP_PACKET* p);
# 306 "TCPIP.h" 2
# 328 "TCPIP.h"
# 1 "UDP.h" 1
# 56 "UDP.h"
typedef WORD UDP_PORT;


typedef BYTE UDP_SOCKET;


typedef enum
{
 UDP_DNS_IS_RESOLVED,
 UDP_DNS_RESOLVE,
 UDP_GATEWAY_SEND_ARP,
 UDP_GATEWAY_GET_ARP,
    UDP_CLOSED,
 UDP_OPENED
} UDP_STATE;



typedef struct
{
 union
 {
  NODE_INFO remoteNode;
  DWORD remoteHost;
 } remote;

    UDP_PORT remotePort;
    UDP_PORT localPort;
    UDP_STATE smState;
    DWORD retryInterval;
 BYTE retryCount;
 struct
 {
  unsigned char bRemoteHostIsROM : 1;
 }flags;
 WORD eventTime;
} UDP_SOCKET_INFO;
# 103 "UDP.h"
    extern UDP_SOCKET activeUDPSocket;
    extern UDP_SOCKET_INFO UDPSocketInfo[(10u)];
 extern WORD UDPTxCount;
 extern WORD UDPRxCount;



typedef struct
{
    UDP_PORT SourcePort;
    UDP_PORT DestinationPort;
    WORD Length;
    WORD Checksum;
} UDP_HEADER;
# 145 "UDP.h"
void UDPInit(void);
void UDPTask(void);
UDP_SOCKET UDPOpenEx(DWORD remoteHost, BYTE remoteHostType, UDP_PORT localPort,UDP_PORT remotePort);


void UDPClose(UDP_SOCKET s);
BOOL UDPProcess(NODE_INFO *remoteNode, DWORD_VAL *localIP, WORD len);

void UDPSetTxBuffer(WORD wOffset);
void UDPSetRxBuffer(WORD wOffset);
WORD UDPIsPutReady(UDP_SOCKET s);
BOOL UDPPut(BYTE v);
WORD UDPPutArray(BYTE *cData, WORD wDataLen);
BYTE* UDPPutString(BYTE *strData);
void UDPFlush(void);
# 170 "UDP.h"
WORD UDPIsGetReady(UDP_SOCKET s);
BOOL UDPGet(BYTE *v);
WORD UDPGetArray(BYTE *cData, WORD wDataLen);
void UDPDiscard(void);
BOOL UDPIsOpened(UDP_SOCKET socket);
# 329 "TCPIP.h" 2



# 1 "TCP.h" 1
# 61 "TCP.h"
typedef BYTE TCP_SOCKET;
# 72 "TCP.h"
typedef enum
{
 TCP_GET_DNS_MODULE,
 TCP_DNS_RESOLVE,
 TCP_GATEWAY_SEND_ARP,
 TCP_GATEWAY_GET_ARP,

    TCP_LISTEN,
    TCP_SYN_SENT,
    TCP_SYN_RECEIVED,
    TCP_ESTABLISHED,
    TCP_FIN_WAIT_1,
    TCP_FIN_WAIT_2,
    TCP_CLOSING,

 TCP_CLOSE_WAIT,
    TCP_LAST_ACK,
    TCP_CLOSED,

    TCP_CLOSED_BUT_RESERVED
} TCP_STATE;

typedef enum
{
 SSL_NONE = 0,
 SSL_HANDSHAKING,
 SSL_ESTABLISHED,
 SSL_CLOSED
} SSL_STATE;
# 109 "TCP.h"
typedef struct
{
 unsigned long bufferTxStart;
 unsigned long bufferRxStart;
 unsigned long bufferEnd;
 unsigned long txHead;
 unsigned long txTail;
 unsigned long rxHead;
 unsigned long rxTail;
    DWORD eventTime;
 WORD eventTime2;
 union
 {
  WORD delayedACKTime;
  WORD closeWaitTime;
 } OverlappedTimers;
    TCP_STATE smState;
    struct
    {
     unsigned char vUnackedKeepalives : 3;
        unsigned char bServer : 1;
  unsigned char bTimerEnabled : 1;
  unsigned char bTimer2Enabled : 1;
  unsigned char bDelayedACKTimerEnabled : 1;
  unsigned char bOneSegmentReceived : 1;
  unsigned char bHalfFullFlush : 1;
  unsigned char bTXASAP : 1;
  unsigned char bTXASAPWithoutTimerReset : 1;
  unsigned char bTXFIN : 1;
  unsigned char bSocketReset : 1;
  unsigned char bSSLHandshaking : 1;
  unsigned char filler : 2;
    } Flags;
 WORD_VAL remoteHash;
# 152 "TCP.h"
 BYTE vMemoryMedium;

} TCB_STUB;




typedef struct
{
 DWORD retryInterval;
 DWORD MySEQ;
 DWORD RemoteSEQ;
 unsigned long txUnackedTail;
    WORD_VAL remotePort;
    WORD_VAL localPort;
 WORD remoteWindow;
 WORD wFutureDataSize;
 union
 {
  NODE_INFO niRemoteMACIP;
  DWORD dwRemoteHost;
 } remote;
 SHORT sHoleSize;
    struct
    {
        unsigned char bFINSent : 1;
  unsigned char bSYNSent : 1;
  unsigned char bRemoteHostIsROM : 1;
  unsigned char bRXNoneACKed1 : 1;
  unsigned char bRXNoneACKed2 : 1;
  unsigned char filler : 3;
    } flags;
 WORD wRemoteMSS;



 BYTE retryCount;
 BYTE vSocketPurpose;
} TCB;


typedef struct
{
 NODE_INFO remote;
 WORD_VAL remotePort;
} SOCKET_INFO;






void TCPInit(void);
SOCKET_INFO* TCPGetRemoteInfo(TCP_SOCKET hTCP);
BOOL TCPWasReset(TCP_SOCKET hTCP);
BOOL TCPIsConnected(TCP_SOCKET hTCP);
UINT8 TCPCurrentState(TCP_SOCKET hTCP);
void TCPDisconnect(TCP_SOCKET hTCP);
void TCPClose(TCP_SOCKET hTCP);
WORD TCPIsPutReady(TCP_SOCKET hTCP);
BOOL TCPPut(TCP_SOCKET hTCP, BYTE byte);
WORD TCPPutArray(TCP_SOCKET hTCP, BYTE* Data, WORD Len);
BYTE* TCPPutString(TCP_SOCKET hTCP, BYTE* Data);
WORD TCPIsGetReady(TCP_SOCKET hTCP);
WORD TCPGetRxFIFOFree(TCP_SOCKET hTCP);
BOOL TCPGet(TCP_SOCKET hTCP, BYTE* byte);
WORD TCPGetArray(TCP_SOCKET hTCP, BYTE* buffer, WORD count);
BYTE TCPPeek(TCP_SOCKET hTCP, WORD wStart);
WORD TCPPeekArray(TCP_SOCKET hTCP, BYTE *vBuffer, WORD wLen, WORD wStart);
WORD TCPFindEx(TCP_SOCKET hTCP, BYTE cFind, WORD wStart, WORD wSearchLen, BOOL bTextCompare);
WORD TCPFindArrayEx(TCP_SOCKET hTCP, BYTE* cFindArray, WORD wLen, WORD wStart, WORD wSearchLen, BOOL bTextCompare);
void TCPDiscard(TCP_SOCKET hTCP);
BOOL TCPProcess(NODE_INFO* remote, DWORD_VAL* localIP, WORD len);
void TCPTick(void);
void TCPFlush(TCP_SOCKET hTCP);
# 256 "TCP.h"
TCP_SOCKET TCPOpen(DWORD dwRemoteHost, BYTE vRemoteHostType, WORD wPort, BYTE vSocketPurpose);
# 280 "TCP.h"
WORD TCPGetTxFIFOFull(TCP_SOCKET hTCP);
# 290 "TCP.h"
BOOL TCPAdjustFIFOSize(TCP_SOCKET hTCP, WORD wMinRXSize, WORD wMinTXSize, BYTE vFlags);
# 333 "TCPIP.h" 2




struct{
    UINT8 Data[100];
    UINT8 WriteData[10];
    DWORD Timer;
    UINT32 UniqueID;
    UINT8 SoftwareVersion[2];
    UINT8 DeviceType;
    UINT8 DeviceDisconnnected;
    union{
        struct{
            unsigned All:8;
        };
        struct{
            unsigned DataRecived:1;
            unsigned WriteDataAvailable:1;
            unsigned :6;
        };
    }StatusBits;
}Slaves[20];

typedef struct{
    UINT8 TCPServerState;
    UINT8 MessageStart[9];
    UINT16 Quantity;
    BYTE Data[255];
    UINT16 OffSet;
    UINT16 SendAmount;
    UINT8 IsConnected;
    TCP_SOCKET MySocket;
    DWORD Timer;
}devices;

devices Servers[1+10];
# 458 "TCPIP.h"
typedef union{
    struct{
        unsigned All:8;
    };
    struct{
        unsigned Configured:1;
        unsigned MessageRecieved:1;
        unsigned SetMessgeReceived:1;
        unsigned :5;
    };
}PIWorkingBits;
# 501 "TCPIP.h"
struct{
    UINT8 SendArray[40];
    UINT8 RecievedData[40];
    UINT8 RecievedFunctionCode;
    UINT8 AmountOfDataBytesRecevied;
    PIWorkingBits Bits;
}PIConnection;


typedef struct{
    UINT8 ServerState;
    UINT8 RemoteIP[5];
    UINT8 ObjectID[15];
    UINT16 ID;
    UDP_SOCKET MySocket;
    WORD AmountOfDataRecieved;
}TypeDefSNMP;

TypeDefSNMP SNMPServers[1+2];