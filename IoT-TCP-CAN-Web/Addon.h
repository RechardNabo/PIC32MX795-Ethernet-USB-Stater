#include "GenericTypeDefs.h"
#include "Config.h"

// ProtoTypes
void InitAddon(void);
void AddonTask(void);
void PowerMeterTask(void);

#define ADEDummyByte                        0xFF
#define	ADEWriteSPI(a)                      SpiChnPutC(SPI_CHANNEL4, a); 	//WriteSPI1(a)
#define	ADEReadSPI()                        SpiChnGetC(SPI_CHANNEL4);//ReadSPI1(a)
#define ADESPI_Rx_Buf_Full                  SPI4STATbits.SPIRBF

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
    float Voltage[3];                           // float - voltage L1,L2 and L3 respectively, in Volts
    float Current[4];                           // float - currents I1,I2,I3 and In respectively, in Amps
    float Frequency;                            // float - frequency of the system, in Hz
    float ActivePower[3];                       // float - Active power L1,L2 and L3 respectively, in W
    float ReactivePower[3];                     // float - Reactive power L1,L2 and L3 respectively, in VAR
    float ApparentPower[3];                     // float - Active power L1,L2 and L3 respectively, in VA
    float PowerFactor[3];                       // float - Power factor L1,L2 and L3 respectively
    float TotalPowerFactor;                     // float - Total Power Factor 
    float TotalActivePower;                     // float - Total active power, in W
    float TotalReactivePower;                   // float - Total reactive power, in VAR
    float TotalApparentPower;                   // float - Total Apparent power, in VA
    float THDI;                                 // float - Total current harmonics, in %
    float HDI[3];                               // float - Current harmonics L1,L2 and L3 respectively, in %
    float HDV[3];                               // float - voltage harmonics L1,L2 and L3 respectively, in %
    float PhaseVoltageAngles[3];                // float - Voltage angles L1,L2 and L3 respectively, in Degress
    float PhaseCurrentAngles[3];                // float - Current angles L1,L2 and L3 respectively, in Degress
    float PhaseVoltageToCurrentAngles[3];       // float - Angles between voltage and current V1 and I1,V2 and I2,V3 and I3 respectively, in Degress
    float THDV;                                 // flaot - Total voltage harmics, in %
    float ActiveWattAcc[3];                     // flaot - Total Watts Accumulated in 1s, in W
    float ReactiveWattAcc[3];                   // flaot - Total Watts Accumulated in 1s, in VAR
    float ApparentWattAcc[3];                   // flaot - Total Watts Accumulated in 1s, in VA
    UINT16 PrimaryCT;                           // x/1 - Primary side CT winding, in A
    UINT16 SecondaryCT;                         // x/1 - Secondary side CT winding, in A
    UINT16 CTRatio;                             // x/1 - Primary/Secondary Ration, in A
    float ActiveEnergyAccumulationCalc;         // x/1 - Active Power Accumulated
    float ReactiveEnergyAccumulationCalc;       // x/1 - Active Power Accumulated
    float ApparentEnergyAccumulationCalc;       // x/1 - Active Power Accumulated
    INT32 ActiveEnergyAccumulation;            // x/1 - KW Active Power Accumulated
    INT32 ReactiveEnergyAccumulation;          // x/1 - KVAR Reactive Power Accumulated
    INT32 ApparentEnergyAccumulation;          // x/1 - KVA Apparent Power Accumulated
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
    BYTE ControllerName[1+MaximumNameLength];
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
