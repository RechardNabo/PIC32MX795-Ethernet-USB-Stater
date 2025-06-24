/**********************************************************
 *  File for the addon boards on the UC
 **********************************************************/
#include <peripheral/ports.h>
#include <proc/p32mx795f512l.h>
#include <peripheral/spi_5xx_6xx_7xx.h>

#include "TCPIP.h"
#include "MainDemo.h"
#include <math.h>

// Prototypes
void UserButtonTask(void);
void ADECommand(UINT16 Address, UINT8 Read);
UINT32 ADE32Read(UINT16 Address);
UINT16 ADE16Read(UINT16 Address);
void ADE32BurstRead(UINT16 Address,UINT32 Data[],UINT16 Amount);
void ADE32Write(UINT16 Address, UINT32 Data);
void ADE16Write(UINT16 Address, UINT16 Data);
void ADESetup (void);
void GetAndSortADE(void);
void EnergyRead(void);
void DoCTCalcs(void);
UINT8 GetWaveform(void);
void CalibrateMe(void);
void SaveCalibrationData(void);
void SetWaveFormRegister(void);
void InputsTask (void);

union{
    struct{
        unsigned Al1:16;
    };
    struct{
        unsigned BURST_CHAN:4;
        unsigned WF_Cap_EN:1;
        unsigned WF_Cap_Sel:1;
        unsigned WF_MODE:2;
        unsigned WF_SRC:2;
        unsigned :2;
        unsigned WF_IN_EN:1;
        unsigned :3;
    };
}WFB_CFG;

union{
    struct{
        unsigned All:32;
    };
    struct{
        unsigned ANLOAD:1;
        unsigned RNLOAD:1;
        unsigned VANLOAD:1;
        unsigned AFNOLOAD:1;
        unsigned RFNOLOAD:1;
        unsigned VAFNOLOAD:1;
        unsigned ZXTOVA:1;
        unsigned ZXTOVB:1;
        unsigned ZXTOVC:1;
        unsigned ZXVA:1;
        unsigned ZXVB:1;
        unsigned ZXVC:1;
        unsigned ZXCOMB:1;
        unsigned ZXIA:1;
        unsigned ZXIB:1;
        unsigned ZXIC:1;
        unsigned RSTDONE:1;
        unsigned OI:1;
        unsigned SEQERR:1;
        unsigned :1;
        unsigned SWELLA:1;
        unsigned SWELLB:1;
        unsigned SWELLC:1;
        unsigned DIPA:1;
        unsigned DIPB:1;
        unsigned DIPC:1;
        unsigned CRC_CHG:1;
        unsigned CRC_DONE:1;
        unsigned ERROR0:1;
        unsigned ERROR1:1;
        unsigned ERROR2:1;
        unsigned ERROR3:1;
    };
}Status1;

union{
    struct{
        unsigned All:32;
    };
    struct{
        unsigned EGYRDY:1;
        unsigned REVAPA:1;
        unsigned REVAPB:1;
        unsigned REVAPC:1;
        unsigned REVRPA:1;
        unsigned REVRPB:1;
        unsigned REVRPC:1;
        unsigned REVPSUM1:1;
        unsigned REVPSUM2:1;
        unsigned REVPSUM3:1;
        unsigned REVPSUM4:1;
        unsigned CF1:1;
        unsigned CF2:1;
        unsigned CF3:1;
        unsigned CF4:1;
        unsigned DREADY:1;
        unsigned WFB_TRIG_IRQ:1;
        unsigned PAGE_FULL:1;
        unsigned PWRRDY:1;
        unsigned RMSONERDY:1;
        unsigned RMS1012RDY:1;
        unsigned THD_PF_RDY:1;
        unsigned WFB_TRIG:1;
        unsigned COH_WFB_FULL:1;
        unsigned MISMTCH:1;
        unsigned TEMP_RDY:1;
        unsigned :6;
    };
}Status0;
