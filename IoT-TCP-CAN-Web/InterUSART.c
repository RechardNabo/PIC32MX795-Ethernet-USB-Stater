// <editor-fold defaultstate="collapsed" desc="Initialization and define">
#include "TCPIP.h"					// Peripheral Library
#include "MainDemo.h"

#if(MaskAsOldUC>0)
    #define DESIRED_BAUDRATE    	(833333)      //The desired BaudRate
#else
    #define DESIRED_BAUDRATE    	(1000000)      //The desired BaudRate
#endif

// <editor-fold defaultstate="collapsed" desc="Prototypes">
void UARTIntilize(void);
void DigiSend(void);
void SendToDigi(UINT8 TXDataLength,BOOL SendFunction);
void MessageAssemble(void);
void SendAllData(void);
void WriteToReg(void);
BOOL UARTIsTXReady(void);
BOOL UARTHasSentMessage(void);
void StartSNMP(UINT16 FunctionCode,UINT8 InstanceNo);
void Interupt_Send(UINT16 Function,UINT8 ID, UINT8 Data,UINT8 DeviceType);
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Common Variables">
static UINT16 SendFunctionCode;
static UINT8 InstanceNoToSend;

#define UARTBufferSize              10
#define UARTWriteDataBufferSize     10

    union{
        struct{
            unsigned All:16;
        };
        struct{
            unsigned C1_Compressor_1_On:1;
            unsigned C1_Compressor_2_On:1;
            unsigned C2_Compressor_1_On:1;
            unsigned C2_Compressor_2_On:1;
            unsigned C1_Compressor_1_Alarm:1;
            unsigned C1_Compressor_2_Alarm:1;
            unsigned C1_InverterCompressor_Alarm:1;
            unsigned C2_Compressor_1_Alarm:1;
            unsigned C2_Compressor_2_Alarm:1;
            unsigned C2_InverterCompressor_Alarm:1;
            unsigned C1_CompressorMaintenance_1_Alarm:1;
            unsigned C1_CompressorMaintenance_2_Alarm:1;
            unsigned C1_InverterCompressorMaintenance_2_Alarm:1;
            unsigned C2_CompressorMaintenance_1_Alarm:1;
            unsigned C2_CompressorMaintenance_2_Alarm:1;
            unsigned C2_InverterCompressorMaintenance_2_Alarm:1;
        };
    }HVACCompressor;
    
    union{
        struct{
            unsigned All:16;
        };
        struct{
            unsigned FanEnabled:1;
            unsigned AirflowSwitch:1;
            unsigned FreecoolingOn:1;
            unsigned FilterChangeAlarm:1;
            unsigned PhaseFailureAlarm:1;
            unsigned CombinedWaterFlood_DayTrip:1;
            unsigned Fire_SmokeAlarm:1;
            unsigned LeakDetectAlarm:1;
            unsigned OverheatCuttoffAlarm:1;
            unsigned :7;
        };
    }HVACStatusNew;

struct{
    UINT16 FunctionCode;
    UINT8 InstanceNo;
    UINT8 DeviceType;
    union{
        struct{
           unsigned All:8; 
        };
        struct{
            unsigned ReadDataRecieved:1;
            unsigned WriteDataRecieved:1;
            unsigned :6;
        };
    }Settings;
    UINT8 ReadDataRecieved;
    UINT8 WriteDataRecieved;
    UINT8 WriteData[UARTWriteDataBufferSize];
}UARTBuffer[UARTBufferSize];

UINT8 CurrentUartBufferPosition;

static UINT8 UARTSWBuffer[200];
extern INT32 Current[NumberOfBatteryBanks];
// </editor-fold>
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Interupt Service routine of USART1 for DIGI to Pic">
void __ISR(_UART1_VECTOR, ipl2) IntUart1Handler(void)
{
    // <editor-fold defaultstate="collapsed" desc="RX interupt service">
    if(INTGetFlag(INT_SOURCE_UART_RX(UART1)))
    {
        // Wait for the UART HW buffer to be idle, in case there is another message on the way
        while(!U1STAbits.RIDLE);
        // run through the FIFO buffer till nothing is left
        do{
            MessageAssemble();
            // Wait for the UART HW buffer to be idle, in case there is another message on the way
            while(!U1STAbits.RIDLE);
        }while(U1STAbits.URXDA);
        // Safty read
        UARTGetDataByte(UART1);
        // Clear the interupt flag
        INTClearFlag(INT_SOURCE_UART_RX(UART1));        // Clear the RX interupt flag
    }// </editor-fold>
    // <editor-fold defaultstate="collapsed" desc="TX Interupt service">
    else if ( INTGetFlag(INT_SOURCE_UART_TX(UART1)) )
    {
        INTClearFlag(INT_SOURCE_UART_TX(UART1));        // Clear th TX interupt flag
        DisableIntU1TX;
    }// </editor-fold>
}// </editor-fold>

void UARTTask(void)
{
    union{
        float TempFloat;
        struct{
            UINT8 FloatBytes[4];
        };
    }IntToFloat;
    
    float CalcTemp;
    UINT8 i,j,loop,Devicelookup,TempSend;
    UINT16 Temp=0;

    if(CurrentUartBufferPosition>0)
    {
        for(loop=0;loop<CurrentUartBufferPosition;loop++)
        {
            // <editor-fold defaultstate="collapsed" desc="DIGI wants to Read data from us">
            if(UARTBuffer[loop].ReadDataRecieved==1)
            {
                // Clear the Flag
                UARTBuffer[loop].ReadDataRecieved=0;
                // Save the Function code to send back to the digi
                SendFunctionCode=UARTBuffer[loop].FunctionCode;
                // Save the Instance Number to send back to the digi
                InstanceNoToSend=UARTBuffer[loop].InstanceNo;

                // Clear software buffer
                for(i=0;i<8;i++)
                    UARTSWBuffer[i]=0;

                // <editor-fold defaultstate="collapsed" desc="21 -> Disconnected devices">
                if(UARTBuffer[loop].FunctionCode==21)
                {
                    for(i=0;i<ActualNumberOfRTUDevices;i++)
                    {
                        
                        UARTSWBuffer[0]=RTUDevices[0].Failed.All;
                        SendToDigi(1,1);
                        break;
                    }
//                    for(i=0;i<ActualNumberOfTCPDevices;i++)
//                    {
//                        if(ThisIsaBTSSite)
//                        {
//                            if(7==UARTBuffer[loop].DeviceType)
//                            {
//                                UARTSWBuffer[0]=0;
//                                SendToDigi(1,1);
//                                break;
//                            }
//                        }
//                        
//                        if(TCPDevice[i].DeviceIs==UARTBuffer[loop].DeviceType)
//                        {
//                            if(TCPDevice[i].InstanceNumber==UARTBuffer[loop].InstanceNo)
//                            {
//                                UARTSWBuffer[0]=TCPDevice[i].Settings.DeviceFail;
//                                SendToDigi(1,1);
//                                break;
//                            }
//                        }
//                    }
                }// </editor-fold>
                // <editor-fold defaultstate="collapsed" desc="100 -> Controller information">
                else if ((UARTBuffer[loop].FunctionCode>=100)&&(UARTBuffer[loop].FunctionCode<=199))
                {
                    // <editor-fold defaultstate="collapsed" desc="116 -> MAC address">
                    if(UARTBuffer[loop].FunctionCode==116)
                    {
                        for(i=0;i<6;i++)
                            UARTSWBuffer[i]=AppConfig.MyMACAddr.v[i];

                        SendToDigi(6,1);//ONe Byte to send Only
                    }// </editor-fold>
                    // <editor-fold defaultstate="collapsed" desc="123 -> UC Version number">
                    else if(UARTBuffer[loop].FunctionCode==123)
                    {
                        memcpypgm2ram(UARTSWBuffer, (ROM void*)UCCodeVersion, 12);

                        SendToDigi(12,1);//ONe Byte to send Only
                    }// </editor-fold>
                    // <editor-fold defaultstate="collapsed" desc="139 -> Power Status">
                    else if(UARTBuffer[loop].FunctionCode==139)
                    {
                        if(PwrStatus.All!=0)
                            UARTSWBuffer[0]=PwrStatus.All;
                        else
                            UARTSWBuffer[0]=0xFF;

                        SendToDigi(1,1);//ONe Byte to send Only
                    }// </editor-fold>
                }// </editor-fold>
                else
                {
                    // <editor-fold defaultstate="collapsed" desc="300-> Three Phase Power meter">
                    if ((UARTBuffer[loop].FunctionCode>=300)&&(UARTBuffer[loop].FunctionCode<=499))
                    {
//                        if(NumberOfPowerMeterBoards>0)
                        if(UARTBuffer[loop].InstanceNo<=NumberOfPowerMeterBoards)
                        {
                            // <editor-fold defaultstate="collapsed" desc="Our TCP Meters">
                            for(i=0;i<NumberOfPowerMeterBoards;i++)
                            {
                                if(TCPMeters[i].InstanceNo==UARTBuffer[loop].InstanceNo)
                                {
                                    UARTBuffer[loop].FunctionCode-=309;
                                    UARTBuffer[loop].FunctionCode*=2;

                                    if(UARTBuffer[loop].FunctionCode==42)
                                    {
                                        UARTBuffer[loop].FunctionCode-=12;
                                        UARTSWBuffer[0]=TCPMeters[i].Data[0][UARTBuffer[loop].FunctionCode+1];
                                        //UARTSWBuffer[0]=0x01;
                                        SendToDigi(1,1);
                                        break;
                                    }
                                    // <editor-fold defaultstate="collapsed" desc="317 - Buss Status (1Byte)">
                                    else if(UARTBuffer[loop].FunctionCode==16)
                                    {
                                        for(Devicelookup=0;Devicelookup<ActualNumberOfTCPDevices;Devicelookup++)
                                        {
                                            if(TCPDevice[Devicelookup].DeviceIs==DeviceIsThreePhaseMeter)
                                            {
                                                if(TCPDevice[Devicelookup].InstanceNumber==InstanceNoToSend)
                                                {
                                                    UARTSWBuffer[0]=TCPDevice[Devicelookup].Settings.DeviceFail;
                                                    break;
                                                }
                                            }
                                        }
                                        UARTSWBuffer[0]=UARTSWBuffer[0]<<7;
                                        UARTSWBuffer[0]|=TCPMeters[i].Data[0][UARTBuffer[loop].FunctionCode+1];
                                        SendToDigi(1,1);
                                        break;
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="336 - Energy Accumulation (4bytes)">
                                    else if(UARTBuffer[loop].FunctionCode==54)
                                    {
                                        UARTSWBuffer[0]=TCPMeters[i].Data[0][34];
                                        UARTSWBuffer[1]=TCPMeters[i].Data[0][35];
                                        UARTSWBuffer[2]=TCPMeters[i].Data[0][32];
                                        UARTSWBuffer[3]=TCPMeters[i].Data[0][33];
                                        SendToDigi(4,1);
                                        break;
                                    }// </editor-fold>
                                    else
                                    {
                                        UARTSWBuffer[0]=TCPMeters[i].Data[0][UARTBuffer[loop].FunctionCode];
                                        UARTSWBuffer[1]=TCPMeters[i].Data[0][UARTBuffer[loop].FunctionCode+1];
                                        SendToDigi(2,1);
                                        break;
                                    }
                                }
                            }// </editor-fold>   
                        }
                        else
                        {
                            UARTBuffer[loop].InstanceNo-=NumberOfPowerMeterBoards;
                            
                            switch(UARTBuffer[loop].FunctionCode)
                            {
                                // <editor-fold defaultstate="collapsed" desc="309-> VL1"> 
                                case 309:
                                    UARTSWBuffer[1]=Meters[UARTBuffer[loop].InstanceNo].VL1;
                                    UARTSWBuffer[0]=Meters[UARTBuffer[loop].InstanceNo].VL1>>8;
                                    SendToDigi(2,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="310-> VL2">     
                                case 310:
                                    UARTSWBuffer[1]=Meters[UARTBuffer[loop].InstanceNo].VL2;
                                    UARTSWBuffer[0]=Meters[UARTBuffer[loop].InstanceNo].VL2>>8;
                                    SendToDigi(2,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="311-> VL3">  
                                case 311:
                                    UARTSWBuffer[1]=Meters[UARTBuffer[loop].InstanceNo].VL3;
                                    UARTSWBuffer[0]=Meters[UARTBuffer[loop].InstanceNo].VL3>>8;
                                    SendToDigi(2,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="312-> Current L1">
                                case 312:
                                    UARTSWBuffer[1]=Meters[UARTBuffer[loop].InstanceNo].IL1;
                                    UARTSWBuffer[0]=Meters[UARTBuffer[loop].InstanceNo].IL1>>8;
                                    SendToDigi(2,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="313-> Current L2">
                                case 313:
                                    UARTSWBuffer[1]=Meters[UARTBuffer[loop].InstanceNo].IL2;
                                    UARTSWBuffer[0]=Meters[UARTBuffer[loop].InstanceNo].IL2>>8;
                                    SendToDigi(2,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="314-> Current L3">
                                case 314:
                                    UARTSWBuffer[1]=Meters[UARTBuffer[loop].InstanceNo].IL3;
                                    UARTSWBuffer[0]=Meters[UARTBuffer[loop].InstanceNo].IL3>>8;
                                    SendToDigi(2,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="315-> Current N">
                                case 315:
                                    UARTSWBuffer[1]=Meters[UARTBuffer[loop].InstanceNo].ILN;
                                    UARTSWBuffer[0]=Meters[UARTBuffer[loop].InstanceNo].ILN>>8;
                                    SendToDigi(2,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="316-> Frequency">
                                case 316:
                                    UARTSWBuffer[1]=Meters[UARTBuffer[loop].InstanceNo].Frequency;
                                    UARTSWBuffer[0]=Meters[UARTBuffer[loop].InstanceNo].Frequency>>8;
                                    SendToDigi(2,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="317-> Buss Status">
                                case 317:
                                    UARTSWBuffer[0]=Meters[UARTBuffer[loop].InstanceNo].BussState;
                                    SendToDigi(1,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="318-> Apparent Power">
                                case 318:
                                    UARTSWBuffer[0]=Meters[UARTBuffer[loop].InstanceNo].ApparentPower>>8;
                                    UARTSWBuffer[1]=Meters[UARTBuffer[loop].InstanceNo].ApparentPower;
                                    SendToDigi(2,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="319-> Active Power">
                                case 319:
                                    UARTSWBuffer[0]=Meters[UARTBuffer[loop].InstanceNo].ActivePower>>8;
                                    UARTSWBuffer[1]=Meters[UARTBuffer[loop].InstanceNo].ActivePower;
                                    SendToDigi(2,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="320-> Power Factor">
                                case 320:
                                    UARTSWBuffer[0]=Meters[UARTBuffer[loop].InstanceNo].PowerFactor>>8;
                                    UARTSWBuffer[1]=Meters[UARTBuffer[loop].InstanceNo].PowerFactor;
                                    SendToDigi(2,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="321-> Energy Acc 2Bytes">
                                case 321:
                                    UARTSWBuffer[0]=Meters[UARTBuffer[loop].InstanceNo].EnergyACC>>8;
                                    UARTSWBuffer[1]=Meters[UARTBuffer[loop].InstanceNo].EnergyACC;
                                    SendToDigi(2,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="330-> Inputs">
                                case 330:
                                    if(UARTBuffer[loop].InstanceNo>=3)
                                    {
                                        UARTBuffer[loop].InstanceNo-=2;
                                        
                                        for(i=0;i<NumberOfTCPSeapam40;i++)
                                        {
                                            if(Seapam40[i].InstanceNo==UARTBuffer[loop].InstanceNo)
                                            {
                                                // open/close signal as bit 0
                                                Temp=Seapam40[i].Data[0][1];
                                                Temp>>=1;
                                                Temp&=1;
                                                // Trip as bit 1
                                                Seapam40[i].Data[0][6]<<=1;
                                                Seapam40[i].Data[0][6]&=2;
                                                Temp|=Seapam40[i].Data[0][6];

                                                UARTSWBuffer[0]=Temp;
                                                break;
                                            }
                                        }
                                    }
                                    SendToDigi(1,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="336-> Energy Acc 4Byte">
                                case 336:
                                    UARTSWBuffer[3]=Meters[UARTBuffer[loop].InstanceNo].BEnergyACC;
                                    UARTSWBuffer[2]=Meters[UARTBuffer[loop].InstanceNo].BEnergyACC>>8;
                                    UARTSWBuffer[1]=Meters[UARTBuffer[loop].InstanceNo].BEnergyACC>>16;
                                    UARTSWBuffer[0]=Meters[UARTBuffer[loop].InstanceNo].BEnergyACC>>24;
                                    
                                    SendToDigi(4,1);
                                    break;// </editor-fold>
                                default:
                                    SendToDigi(2,1);
                                    break;     
                            }
                        }
                    }// </editor-fold>
                    // <editor-fold defaultstate="collapsed" desc="600-> Shunt board">
                    else if ((UARTBuffer[loop].FunctionCode>=600)&&(UARTBuffer[loop].FunctionCode<700))
                    {
                        UARTBuffer[loop].FunctionCode-=609;
                        UARTBuffer[loop].FunctionCode*=2;
                        UARTBuffer[loop].InstanceNo-=1;
                        UARTBuffer[loop].InstanceNo*=4;
                        UARTBuffer[loop].FunctionCode+=UARTBuffer[loop].InstanceNo;
                        UARTSWBuffer[0]=ShuntBoard[0].Data[0][UARTBuffer[loop].FunctionCode];
                        UARTSWBuffer[1]=ShuntBoard[0].Data[0][UARTBuffer[loop].FunctionCode+1];

                        SendToDigi(2,1);
                    }// </editor-fold>
                    // <editor-fold defaultstate="collapsed" desc="700-> Temperature and humdity board">
                    else if ((UARTBuffer[loop].FunctionCode>=700)&&(UARTBuffer[loop].FunctionCode<800))
                    {
                        if(UseOnBoardTempAndHumidity>0)
                        {
                            if((UARTBuffer[loop].FunctionCode>=709)&&(UARTBuffer[loop].FunctionCode<=724))
                            {
                                UARTSWBuffer[0]=TemperatureSensor.Temperature>>8;
                                UARTSWBuffer[1]=TemperatureSensor.Temperature;
                            }
                            else if((UARTBuffer[loop].FunctionCode>=725)&&(UARTBuffer[loop].FunctionCode<=740))
                            {
                                UARTSWBuffer[0]=TemperatureSensor.Humidity>>8;
                                UARTSWBuffer[1]=TemperatureSensor.Humidity;
                            }
                        }
                        else
                        {
                            for(i=0;i<NumberOfTemperatureBoards;i++)
                            {
                                if(TemperatureBoard[i].InstanceNo==UARTBuffer[loop].InstanceNo)
                                {
                                    UARTBuffer[loop].FunctionCode-=700;

                                    if(UARTBuffer[loop].FunctionCode<25)
                                    {
                                        UARTBuffer[loop].FunctionCode-=9;
                                        UARTBuffer[loop].FunctionCode*=4;
                                    }
                                    else
                                    {
                                        UARTBuffer[loop].FunctionCode-=25;
                                        //FunctionCode-=9;
                                        UARTBuffer[loop].FunctionCode*=4;
                                        UARTBuffer[loop].FunctionCode+=2;
                                    }

                                    UARTSWBuffer[0]=TemperatureBoard[i].Data[0][UARTBuffer[loop].FunctionCode];
                                    UARTSWBuffer[1]=TemperatureBoard[i].Data[0][UARTBuffer[loop].FunctionCode+1];
                                    break;
                                }
                            }
                        }

                        SendToDigi(2,1);
                    }// </editor-fold>
                    // <editor-fold defaultstate="collapsed" desc="800-> Digital input board">
                    else if ((UARTBuffer[loop].FunctionCode>=800)&&(UARTBuffer[loop].FunctionCode<900))
                    {
                        if((UARTBuffer[loop].InstanceNo==InstanceUC_002_IN)&&(UseUC_002_IN==1))
                        {
                            UARTSWBuffer[0]=Board.Inputs.All>>8;
                            UARTSWBuffer[1]=Board.Inputs.All;
                        }
                        else
                        {
                            for(i=0;i<NumberOfInputBoards;i++)
                            {
                                if(InputBoards[i].InstanceNo==UARTBuffer[loop].InstanceNo)
                                {
                                    UARTSWBuffer[0]=InputBoards[i].Data[0][0];
                                    UARTSWBuffer[1]=InputBoards[i].Data[0][1];
                                    break;
                                }
                            }
                        }

                        SendToDigi(2,1);
                    }// </editor-fold>
                    // <editor-fold defaultstate="collapsed" desc="900-> Relay board">
                    else if ((UARTBuffer[loop].FunctionCode>=900)&&(UARTBuffer[loop].FunctionCode<1000))
                    {
                        if(UseUC_002_Out>0)
                        {
                            Temp=Board.Outputs.All;
                            
                            if(InvertRelaySignals>0)
                                Temp^=0xFFFF;
                            
                            UARTSWBuffer[0]=Temp>>8;
                            UARTSWBuffer[1]=Temp;
                        }
                        else
                        {
                            for(i=0;i<NumberOfRelayBoards;i++)
                            {
                                if(RelayBoards[i].InstanceNo==UARTBuffer[loop].InstanceNo)
                                {                            
                                    UARTSWBuffer[0]=RelayBoards[i].Data[0][0];
                                    UARTSWBuffer[1]=RelayBoards[i].Data[0][1];
                                    break;
                                }
                            }
                        }

                        SendToDigi(2,1);
                    }// </editor-fold>
                    // <editor-fold defaultstate="collapsed" desc="1100 -> Weather Station">
                    else if ((UARTBuffer[loop].FunctionCode>=1100)&&(UARTBuffer[loop].FunctionCode<=1200))
                    {
                        UARTBuffer[loop].FunctionCode-=1100;
                        // Send the data to the digi with the function code in the header
                        SendToDigi(2,1);
                    }// </editor-fold>
                    // <editor-fold defaultstate="collapsed" desc="1200-> HVAC">
                    else if ((UARTBuffer[loop].FunctionCode>=1200)&&(UARTBuffer[loop].FunctionCode<1300))
                    {
                        UARTBuffer[loop].FunctionCode-=1200;

                        // <editor-fold defaultstate="collapsed" desc="StratoSat">
                        if(StratoSatHack>0)
                        {
                                // <editor-fold defaultstate="collapsed" desc="1211 - Supply Temp">
                                if(UARTBuffer[loop].FunctionCode==11)
                                {
                                    UARTSWBuffer[0]=TCPHVAC[0].Data[0][0];
                                    UARTSWBuffer[1]=TCPHVAC[0].Data[0][1];

                                    SendToDigi(2,1);
                                }// </editor-fold>
                                else
                                {
                                    SendToDigi(2,1);
                                }
                        }// </editor-fold>
                        // <editor-fold defaultstate="collapsed" desc="TCP Type">
                        #if(ErmeloSNMP>0)
                            else if(UARTBuffer[loop].InstanceNo<=2)
                        #else
                            else if(NumberOfTCPHVAC>0)
                        #endif
                        {
                            for(i=0;i<NumberOfTCPHVAC;i++)
                            {                                
                                if(TCPHVAC[i].InstanceNo==UARTBuffer[loop].InstanceNo)
                                {
                                         // <editor-fold defaultstate="collapsed" desc="1209 - Digital">
                                        if(UARTBuffer[loop].FunctionCode==9)
                                        {
                                            HVACStatusNew.All=0;
                                            
                                            if(TCPHVAC[i].Data[0][1]==1)
                                                HVACStatusNew.FanEnabled=1;

                                            UARTSWBuffer[0]=HVACStatusNew.All>>8;
                                            UARTSWBuffer[1]=HVACStatusNew.All;
                                            
                                            SendToDigi(2,1);
                                        }// </editor-fold>
                                         // <editor-fold defaultstate="collapsed" desc="1210 - Return Humdity">
                                        else if(UARTBuffer[loop].FunctionCode==10)
                                        {
                                            UARTSWBuffer[0]=TCPHVAC[i].Data[0][58];
                                            UARTSWBuffer[1]=TCPHVAC[i].Data[0][59];
                                                
                                            SendToDigi(2,1);
                                        }// </editor-fold>
                                         // <editor-fold defaultstate="collapsed" desc="1211 - Supply Temp">
                                        else if(UARTBuffer[loop].FunctionCode==11)
                                        {
                                            UARTSWBuffer[0]=TCPHVAC[i].Data[0][24];
                                            UARTSWBuffer[1]=TCPHVAC[i].Data[0][25];
                                                
                                            SendToDigi(2,1);
                                        }// </editor-fold>
                                         // <editor-fold defaultstate="collapsed" desc="1212 - Return Temp">
                                        else if(UARTBuffer[loop].FunctionCode==12)
                                        {
//                                            UARTSWBuffer[0]=TCPHVAC[i].Data[0][18];
//                                            UARTSWBuffer[1]=TCPHVAC[i].Data[0][19];
                                            UARTSWBuffer[0]=TCPHVAC[i].Data[0][20];
                                            UARTSWBuffer[1]=TCPHVAC[i].Data[0][21];
                                                
                                            SendToDigi(2,1);
                                        }// </editor-fold>
                                         // <editor-fold defaultstate="collapsed" desc="1213 - Temp setpoint">
                                        else if(UARTBuffer[loop].FunctionCode==13)
                                        {
                                            UARTSWBuffer[0]=TCPHVAC[i].Data[0][24];
                                            UARTSWBuffer[1]=TCPHVAC[i].Data[0][25];
                                                
                                            SendToDigi(2,1);
                                        }// </editor-fold>
                                         // <editor-fold defaultstate="collapsed" desc="1214 - Humidity setpoint">
                                        else if(UARTBuffer[loop].FunctionCode==14)
                                        {
                                            UARTSWBuffer[0]=TCPHVAC[i].Data[0][24];
                                            UARTSWBuffer[1]=TCPHVAC[i].Data[0][25];
                                                
                                            SendToDigi(2,1);
                                        }// </editor-fold>
                                         // <editor-fold defaultstate="collapsed" desc="1215 - Air Fan Speed">
                                        else if(UARTBuffer[loop].FunctionCode==15)
                                        {
                                            UARTSWBuffer[0]=TCPHVAC[i].Data[0][4];
                                            UARTSWBuffer[1]=TCPHVAC[i].Data[0][5];
                                                
                                            SendToDigi(2,1);
                                        }// </editor-fold>
                                         // <editor-fold defaultstate="collapsed" desc="1216 - C1 Pressure">
                                        else if(UARTBuffer[loop].FunctionCode==16)
                                        {
//                                            UARTSWBuffer[0]=TCPHVAC[i].Data[0][0];
//                                            UARTSWBuffer[1]=TCPHVAC[i].Data[0][1];
                                                
                                            SendToDigi(2,1);
                                        }// </editor-fold>
                                         // <editor-fold defaultstate="collapsed" desc="1217 - C2 Pressure">
                                        else if(UARTBuffer[loop].FunctionCode==17)
                                        {
//                                            UARTSWBuffer[0]=TCPHVAC[i].Data[0][0];
//                                            UARTSWBuffer[1]=TCPHVAC[i].Data[0][1];
                                                
                                            SendToDigi(2,1);
                                        }// </editor-fold>
                                         // <editor-fold defaultstate="collapsed" desc="1218 - Compressor States">
                                        else if(UARTBuffer[loop].FunctionCode==18)
                                        {
//                                            UARTSWBuffer[0]=TCPHVAC[i].Data[0][0];
//                                            UARTSWBuffer[1]=TCPHVAC[i].Data[0][1];
                                                
                                            SendToDigi(2,1);
                                        }// </editor-fold>
                                         // <editor-fold defaultstate="collapsed" desc="1219 - Ambient Temp">
                                        else if(UARTBuffer[loop].FunctionCode==19)
                                        {
//                                            UARTSWBuffer[0]=TCPHVAC[i].Data[0][0];
//                                            UARTSWBuffer[1]=TCPHVAC[i].Data[0][1];
                                                
                                            SendToDigi(2,1);
                                        }// </editor-fold>
                                         // <editor-fold defaultstate="collapsed" desc="1220 - Free Coolin">
                                        else if(UARTBuffer[loop].FunctionCode==20)
                                        {
                                            if(TCPHVAC[i].Data[0][17]==2)
                                                UARTSWBuffer[1]=1;
                                            else
                                                UARTSWBuffer[1]=0;
                                                
                                            SendToDigi(2,1);
                                        }// </editor-fold>
                                        // <editor-fold defaultstate="collapsed" desc="1221 - Compressor1Circuit1RunHours">
                                        else if(UARTBuffer[loop].FunctionCode==21)
                                        {
                                            UARTSWBuffer[0]=0;
                                            UARTSWBuffer[1]=0;
//                                            UARTSWBuffer[2]=TCPHVAC[i].Data[0][2];
//                                            UARTSWBuffer[3]=TCPHVAC[i].Data[0][3];
                                            
                                            SendToDigi(4,1);
                                        }// </editor-fold>
                                        // <editor-fold defaultstate="collapsed" desc="2122 - Compressor2Circuit1RunHours">
                                        else if(UARTBuffer[loop].FunctionCode==22)
                                        {
                                            UARTSWBuffer[0]=0;
                                            UARTSWBuffer[1]=0;
//                                            UARTSWBuffer[2]=RTUDevices[i].DataType2Data[4];
//                                            UARTSWBuffer[3]=RTUDevices[i].DataType2Data[5];
                                            
                                            SendToDigi(4,1);
                                        }// </editor-fold>
                                        // <editor-fold defaultstate="collapsed" desc="2127 - SupplyFanRunHours">
                                        else if(UARTBuffer[loop].FunctionCode==27)
                                        {
                                            UARTSWBuffer[0]=0;
                                            UARTSWBuffer[1]=0;
//                                            UARTSWBuffer[2]=RTUDevices[i].DataType2Data[0];
//                                            UARTSWBuffer[3]=RTUDevices[i].DataType2Data[1];
                                            
                                            SendToDigi(4,1);
                                        }// </editor-fold>
                                        else
                                        {
                                            SendToDigi(4,1);
                                        }
                                }
                            }
                        }// </editor-fold>
                    }// </editor-fold>
                    // <editor-fold defaultstate="collapsed" desc="1300-> Analogue input board">
                    else if ((UARTBuffer[loop].FunctionCode>=1300)&&(UARTBuffer[loop].FunctionCode<1400))
                    {
                        UARTBuffer[loop].FunctionCode-=1309;
                        UARTBuffer[loop].FunctionCode*=2;
                        
                        if(HasRS485FuelSensor>0)
                        {
                            UARTSWBuffer[0]=Generator[UARTBuffer[loop].InstanceNo].PercentageFuelLevel>>8;
                            UARTSWBuffer[1]=Generator[UARTBuffer[loop].InstanceNo].PercentageFuelLevel;
                        }
                        else
                        {
                            if(UseUC_002_AIN>0)
                            {
                                UARTSWBuffer[0]=AnalogueInputs[0].Data[0][UARTBuffer[loop].FunctionCode];
                                UARTSWBuffer[1]=AnalogueInputs[0].Data[0][1+UARTBuffer[loop].FunctionCode];
                            }
                            else
                            {
                                for(i=0;i<NumberOfAnalogues;i++)
                                {
                                    if(AnalogueInputs[i].DeviceType==Moxa1242)
                                    {
                                        if(AnalogueInputs[i].InstanceNo==UARTBuffer[loop].InstanceNo)
                                        {
                                            if(UARTBuffer[loop].FunctionCode>0)
                                                UARTBuffer[loop].FunctionCode*=2;
                                            // Comes in as a float
                                            IntToFloat.FloatBytes[1]=AnalogueInputs[i].Data[0][UARTBuffer[loop].FunctionCode];
                                            UARTBuffer[loop].FunctionCode++;
                                            IntToFloat.FloatBytes[0]=AnalogueInputs[i].Data[0][UARTBuffer[loop].FunctionCode];
                                            UARTBuffer[loop].FunctionCode++;
                                            IntToFloat.FloatBytes[3]=AnalogueInputs[i].Data[0][UARTBuffer[loop].FunctionCode];
                                            UARTBuffer[loop].FunctionCode++;
                                            IntToFloat.FloatBytes[2]=AnalogueInputs[i].Data[0][UARTBuffer[loop].FunctionCode];

                                            // For Scaling
                                            IntToFloat.TempFloat*=1000;

                                            Temp=IntToFloat.TempFloat;

                                            UARTSWBuffer[1]=Temp;
                                            UARTSWBuffer[0]=Temp>>8;
                                            break;
                                        }   
                                    }
                                    else
                                    {
                                        if(AnalogueInputs[i].InstanceNo==UARTBuffer[loop].InstanceNo)
                                        {
                                            UARTSWBuffer[0]=AnalogueInputs[i].Data[0][UARTBuffer[loop].FunctionCode];
                                            UARTSWBuffer[1]=AnalogueInputs[i].Data[0][1+UARTBuffer[loop].FunctionCode];
                                            break;
                                        }
                                    }
                                }
                            }
                        }
                        
                        SendToDigi(2,1);
                    }// </editor-fold>
                    // <editor-fold defaultstate="collapsed" desc="1400-> UPS">
                    else if((UARTBuffer[loop].FunctionCode>=1400)&&(UARTBuffer[loop].FunctionCode<1500))
                    {
                        UARTBuffer[loop].FunctionCode-=1400;
                        
                        // <editor-fold defaultstate="collapsed" desc="TCP UPS Data">
                        #if(MaputoHack>0)
                            UARTBuffer[loop].InstanceNo-=2;
                        #endif

                        for(i=0;i<NumberOfTCPUPS;i++)
                        {
                            // <editor-fold defaultstate="collapsed" desc="UPS device is Manage UPS or libert">
                            if((TCPUPS[i].DeviceType==DeviceTypeIsLibert)||(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS))
                            {
                                if(TCPUPS[i].InstanceNo==UARTBuffer[loop].InstanceNo)
                                {
                                    // <editor-fold defaultstate="collapsed" desc="1409 - System Current A">
                                    if(UARTBuffer[loop].FunctionCode==9)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            Temp=TCPUPS[i].Data[0][36];
                                            Temp=Temp<<8;
                                            Temp|=TCPUPS[i].Data[0][37];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            Temp=TCPUPS[i].Data[0][6];
                                            Temp=Temp<<8;
                                            Temp|=TCPUPS[i].Data[0][7];
                                        }

                                        Temp/=10;

                                        UARTSWBuffer[1]=Temp;
                                        UARTSWBuffer[0]=Temp>>8;
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1410 - System Current B">
                                    else if(UARTBuffer[loop].FunctionCode==10)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            Temp=TCPUPS[i].Data[0][38];
                                            Temp=Temp<<8;
                                            Temp|=TCPUPS[i].Data[0][39];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            Temp=TCPUPS[i].Data[0][8];
                                            Temp=Temp<<8;
                                            Temp|=TCPUPS[i].Data[0][9];
                                        }

                                        Temp/=10;

                                        UARTSWBuffer[1]=Temp;
                                        UARTSWBuffer[0]=Temp>>8;
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1411 - System Current C">
                                    else if(UARTBuffer[loop].FunctionCode==11)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            Temp=TCPUPS[i].Data[0][40];
                                            Temp=Temp<<8;
                                            Temp|=TCPUPS[i].Data[0][41];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            Temp=TCPUPS[i].Data[0][10];
                                            Temp=Temp<<8;
                                            Temp|=TCPUPS[i].Data[0][11];
                                        }

                                        Temp/=10;

                                        UARTSWBuffer[1]=Temp;
                                        UARTSWBuffer[0]=Temp>>8;
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1412 - System Frequency">
                                    else if(UARTBuffer[loop].FunctionCode==12)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][26];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][27];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][12];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][13];
                                        }

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1413 - System Voltage A">
                                    else if(UARTBuffer[loop].FunctionCode==13)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][30];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][31];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][14];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][15];
                                        }
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1414 - System Voltage B">
                                    else if(UARTBuffer[loop].FunctionCode==14)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][32];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][33];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][16];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][17];
                                        }   
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1415 - System Voltage C">
                                    else if(UARTBuffer[loop].FunctionCode==15)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][34];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][35];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][18];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][19];
                                        }
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1419 - Bypass voltage A">
                                    else if(UARTBuffer[loop].FunctionCode==19)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][106];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][107];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][32];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][33];
                                        }
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1420 - Bypass voltage B">
                                    else if(UARTBuffer[loop].FunctionCode==20)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][108];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][109];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][34];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][35];
                                        }   
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1421 - Bypass voltage C">
                                    else if(UARTBuffer[loop].FunctionCode==21)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][110];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][111];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][36];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][37];
                                        }
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1422 - Bypass Frequency">
                                    else if(UARTBuffer[loop].FunctionCode==22)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][102];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][103];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][38];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][39];
                                        }
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1423 Time remaining on Bat">
                                    else if(UARTBuffer[loop].FunctionCode==23)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            Temp=TCPUPS[i].Data[0][4];
                                            Temp=Temp<<8;
                                            Temp|=TCPUPS[i].Data[0][5];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            Temp=TCPUPS[i].Data[0][46];
                                            Temp=Temp<<8;
                                            Temp|=TCPUPS[i].Data[0][47];
                                        }

                                        UARTSWBuffer[1]=Temp;
                                        UARTSWBuffer[0]=Temp>>8;
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1424 Battery Voltage">
                                    else if(UARTBuffer[loop].FunctionCode==24)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][8];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][9];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][48];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][49];
                                        }

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1425 Battery Temperature">
                                    else if(UARTBuffer[loop].FunctionCode==25)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][12];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][13];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][50];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][51];
                                        }

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1426 - Inlet air Temp - N/A">
                                    else if(UARTBuffer[loop].FunctionCode==26)
                                    {
                                        UARTSWBuffer[0]=0;
                                        UARTSWBuffer[1]=0;
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1427 - DC Buss Current">
                                    else if(UARTBuffer[loop].FunctionCode==27)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][10];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][11];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][58];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][59];
                                        }

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1428 - UPS Battery Status">
                                    else if(UARTBuffer[loop].FunctionCode==28)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][0];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][1];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][60];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][61];
                                        }

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1429 - UPS Output Current A">
                                    else if(UARTBuffer[loop].FunctionCode==29)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            Temp=TCPUPS[i].Data[0][72];
                                            Temp=Temp<<8;
                                            Temp|=TCPUPS[i].Data[0][73];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            Temp=TCPUPS[i].Data[0][74];
                                            Temp=Temp<<8;
                                            Temp|=TCPUPS[i].Data[0][75];
                                        }

                                        Temp/=10;

                                        UARTSWBuffer[1]=Temp;
                                        UARTSWBuffer[0]=Temp>>8;
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1430 - UPS Output Current B">
                                    else if(UARTBuffer[loop].FunctionCode==30)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            Temp=TCPUPS[i].Data[0][74];
                                            Temp=Temp<<8;
                                            Temp|=TCPUPS[i].Data[0][75];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            Temp=TCPUPS[i].Data[0][76];
                                            Temp=Temp<<8;
                                            Temp|=TCPUPS[i].Data[0][77];
                                        }

                                        Temp/=10;

                                        UARTSWBuffer[1]=Temp;
                                        UARTSWBuffer[0]=Temp>>8;
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1431 - UPS Output Current C">
                                    else if(UARTBuffer[loop].FunctionCode==31)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            Temp=TCPUPS[i].Data[0][76];
                                            Temp=Temp<<8;
                                            Temp|=TCPUPS[i].Data[0][77];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            Temp=TCPUPS[i].Data[0][78];
                                            Temp=Temp<<8;
                                            Temp|=TCPUPS[i].Data[0][79];
                                        }

                                        Temp/=10;

                                        UARTSWBuffer[1]=Temp;
                                        UARTSWBuffer[0]=Temp>>8;
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1432 - UPS Output Frequency">
                                    else if(UARTBuffer[loop].FunctionCode==32)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][62];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][63];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][80];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][81];
                                        }

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1433 - UPS Output Voltage A">
                                    else if(UARTBuffer[loop].FunctionCode==33)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][66];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][67];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][68];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][69];
                                        }

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1434 - UPS Output Voltage B">
                                    else if(UARTBuffer[loop].FunctionCode==34)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][68];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][69];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][70];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][71];
                                        }

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1435 - UPS Output Voltage C">
                                    else if(UARTBuffer[loop].FunctionCode==35)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][70];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][71];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][72];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][73];
                                        }

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1439 - UPS Output A P%">
                                    else if(UARTBuffer[loop].FunctionCode==39)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][84];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][85];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][94];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][95];
                                        }

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1440 - UPS Output B P%">
                                    else if(UARTBuffer[loop].FunctionCode==40)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][86];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][87];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][96];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][97];
                                        }

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1441 - UPS Output C P%">
                                    else if(UARTBuffer[loop].FunctionCode==41)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][88];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][89];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][98];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][99];
                                        }

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1446 inverter state ">
                                    else if(UARTBuffer[loop].FunctionCode==46)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                            Temp=TCPUPS[i].Data[0][145];
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                            Temp=TCPUPS[i].Data[0][120];

                                        if(Temp>1)
                                            Temp=1;
                                        else
                                            Temp=0;

                                        UARTSWBuffer[0]=0;
                                        UARTSWBuffer[1]=Temp;
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1447 Maintance Bypass breaker N/A">
                                    else if(UARTBuffer[loop].FunctionCode==47)
                                    {
                                        UARTSWBuffer[1]=0;
                                        UARTSWBuffer[0]=0;

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1448 Ouput Source">
                                    else if(UARTBuffer[loop].FunctionCode==48)
                                    {
                                        if(TCPUPS[i].DeviceType==DeviceTypeIsManageUPS)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][60];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][61];
                                        }
                                        else if(TCPUPS[i].DeviceType==DeviceTypeIsLibert)
                                        {
                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][124];
                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][125];
                                        }

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1450 - Status bits">
                                    else if(UARTBuffer[loop].FunctionCode==50)
                                    {
                                        UINT8 Temp,Bit1,Bit2,Bit3,Bit4,Bit5;

                                        Temp=0;

                                        Bit1=TCPUPS[i].Data[0][147];
                                        if(Bit1==3)
                                            Bit1=1;
                                        else
                                            Bit1=0;

                                        Bit2=TCPUPS[i].Data[0][145];
                                        if(Bit2==3)
                                            Bit2=1;
                                        else
                                            Bit2=0;

                                        Bit3=TCPUPS[i].Data[0][143];
                                        Bit5=TCPUPS[i].Data[0][1];
                                        Bit3&=0x04;
                                        Bit5&=0x20;
                                        Bit3=Bit3>>2;
                                        Bit5=Bit5>>5;
                                        Bit3&=0x01;
                                        Bit5&=0x01;

                                        Bit4=0;

                                        Temp=Bit5;
                                        Temp=Temp<<1;
                                        Temp|=Bit4;
                                        Temp=Temp<<1;
                                        Temp|=Bit3;
                                        Temp=Temp<<1;
                                        Temp|=Bit2;
                                        Temp=Temp<<1;
                                        Temp|=Bit1;

                                        UARTSWBuffer[0]=0;
                                        UARTSWBuffer[1]=Temp;

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1452 - UPS Well known alarms">
                                    else if(UARTBuffer[loop].FunctionCode==52)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][86];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][87];
                                        UARTSWBuffer[2]=TCPUPS[i].Data[0][88];
                                        UARTSWBuffer[3]=TCPUPS[i].Data[0][89];
                                        UARTSWBuffer[4]=TCPUPS[i].Data[0][90];
                                        UARTSWBuffer[5]=TCPUPS[i].Data[0][91];
                                        UARTSWBuffer[6]=TCPUPS[i].Data[0][92];
                                        UARTSWBuffer[7]=TCPUPS[i].Data[0][93];

                                        SendToDigi(8,1);
                                    }// </editor-fold>
                                    else
                                    {
                                        UARTSWBuffer[0]=0;
                                        UARTSWBuffer[1]=0;

                                        SendToDigi(2,1);
                                    }
                                    break;
                                }
                            }// </editor-fold>
                            // <editor-fold defaultstate="collapsed" desc="UPS Type Is Galaxy">
                            else if(TCPUPS[i].DeviceType==DeviceTypeIsGalaxy)
                            {
                                if(TCPUPS[i].InstanceNo==UARTBuffer[loop].InstanceNo)
                                {
                                    // <editor-fold defaultstate="collapsed" desc="1409 - System Current A">
                                    if(UARTBuffer[loop].FunctionCode==9)
                                    {
                                        Temp=TCPUPS[i].Data[0][0];
                                        Temp=Temp<<8;
                                        Temp|=TCPUPS[i].Data[0][1];

//                                            Temp/=10;

                                        UARTSWBuffer[1]=Temp;
                                        UARTSWBuffer[0]=Temp>>8;
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1410 - System Current B">
                                    else if(UARTBuffer[loop].FunctionCode==10)
                                    {
                                        Temp=TCPUPS[i].Data[0][2];
                                        Temp=Temp<<8;
                                        Temp|=TCPUPS[i].Data[0][3];

//                                            Temp/=10;

                                        UARTSWBuffer[1]=Temp;
                                        UARTSWBuffer[0]=Temp>>8;
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1411 - System Current C">
                                    else if(UARTBuffer[loop].FunctionCode==11)
                                    {
                                        Temp=TCPUPS[i].Data[0][4];
                                        Temp=Temp<<8;
                                        Temp|=TCPUPS[i].Data[0][5];

//                                            Temp/=10;

                                        UARTSWBuffer[1]=Temp;
                                        UARTSWBuffer[0]=Temp>>8;
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1412 - System Frequency">
                                    else if(UARTBuffer[loop].FunctionCode==12)
                                    {
//                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][124];
//                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][125];
                                        Temp=TCPUPS[i].Data[0][124];
                                        Temp=Temp<<8;
                                        Temp|=TCPUPS[i].Data[0][125];

                                        Temp*=10;

                                        UARTSWBuffer[1]=Temp;
                                        UARTSWBuffer[0]=Temp>>8;
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1413 - System Voltage A">
                                    else if(UARTBuffer[loop].FunctionCode==13)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][42];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][43];
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1414 - System Voltage B">
                                    else if(UARTBuffer[loop].FunctionCode==14)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][44];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][45];
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1415 - System Voltage C">
                                    else if(UARTBuffer[loop].FunctionCode==15)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][46];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][47];
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1416-1418 - Blanks (Power Factor Input)">
                                    else if((UARTBuffer[loop].FunctionCode>=16)&&(UARTBuffer[loop].FunctionCode<=18))
                                    {
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1419 - Bypass voltage A">
                                    else if(UARTBuffer[loop].FunctionCode==19)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][66];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][67];
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1420 - Bypass voltage B">
                                    else if(UARTBuffer[loop].FunctionCode==20)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][68];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][69];
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1421 - Bypass voltage C">
                                    else if(UARTBuffer[loop].FunctionCode==21)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][70];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][71];
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1422 - Bypass Frequency">
                                    else if(UARTBuffer[loop].FunctionCode==22)
                                    {
//                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][128];
//                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][129];
                                        Temp=TCPUPS[i].Data[0][128];
                                        Temp=Temp<<8;
                                        Temp|=TCPUPS[i].Data[0][129];

                                        Temp*=10;

                                        UARTSWBuffer[1]=Temp;
                                        UARTSWBuffer[0]=Temp>>8;
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1423 Time remaining on Bat - Working">
                                    else if(UARTBuffer[loop].FunctionCode==23)
                                    {
                                        UINT16 Temp;

                                        Temp=TCPUPS[i].Data[0][146];
                                        Temp=Temp<<8;
                                        Temp|=TCPUPS[i].Data[0][147];

                                        UARTSWBuffer[1]=Temp;
                                        UARTSWBuffer[0]=Temp>>8;
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1424 Battery Voltage - Working">
                                    else if(UARTBuffer[loop].FunctionCode==24)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][90];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][91];
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1425 Battery Temperature - Working">
                                    else if(UARTBuffer[loop].FunctionCode==25)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][148];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][149];
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1426 - Inlet air Temp - N/A">
                                    else if(UARTBuffer[loop].FunctionCode==26)
                                    {
                                        UARTSWBuffer[0]=0;
                                        UARTSWBuffer[1]=0;
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1427 - DC Buss Current - Working">
                                    else if(UARTBuffer[loop].FunctionCode==27)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][28];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][29];
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1428 - UPS Battery Status - n/a">
                                    else if(UARTBuffer[loop].FunctionCode==28)
                                    {
                                        UARTSWBuffer[0]=0;
                                        UARTSWBuffer[1]=0;
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1429 - UPS Output Current A">
                                    else if(UARTBuffer[loop].FunctionCode==29)
                                    {
                                        Temp=TCPUPS[i].Data[0][18];
                                        Temp=Temp<<8;
                                        Temp|=TCPUPS[i].Data[0][19];
//                                            Temp/=10;

                                        UARTSWBuffer[1]=Temp;
                                        UARTSWBuffer[0]=Temp>>8;
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1430 - UPS Output Current B">
                                    else if(UARTBuffer[loop].FunctionCode==30)
                                    {
                                        Temp=TCPUPS[i].Data[0][20];
                                        Temp=Temp<<8;
                                        Temp|=TCPUPS[i].Data[0][21];
//                                            Temp/=10;

                                        UARTSWBuffer[1]=Temp;
                                        UARTSWBuffer[0]=Temp>>8;
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1431 - UPS Output Current C">
                                    else if(UARTBuffer[loop].FunctionCode==31)
                                    {
                                        Temp=TCPUPS[i].Data[0][22];
                                        Temp=Temp<<8;
                                        Temp|=TCPUPS[i].Data[0][23];
//                                            Temp/=10;

                                        UARTSWBuffer[1]=Temp;
                                        UARTSWBuffer[0]=Temp>>8;
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1432 - UPS Output Frequency">
                                    else if(UARTBuffer[loop].FunctionCode==32)
                                    {
//                                            UARTSWBuffer[0]=TCPUPS[i].Data[0][130];
//                                            UARTSWBuffer[1]=TCPUPS[i].Data[0][131];
                                        Temp=TCPUPS[i].Data[0][130];
                                        Temp=Temp<<8;
                                        Temp|=TCPUPS[i].Data[0][131];

                                        Temp*=10;

                                        UARTSWBuffer[1]=Temp;
                                        UARTSWBuffer[0]=Temp>>8;
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1433 - UPS Output Voltage A">
                                    else if(UARTBuffer[loop].FunctionCode==33)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][78];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][79];
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1434 - UPS Output Voltage B">
                                    else if(UARTBuffer[loop].FunctionCode==34)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][80];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][81];
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1435 - UPS Output Voltage C">
                                    else if(UARTBuffer[loop].FunctionCode==35)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][82];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][83];
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1436-1438 - Blanks (Power Factor Output)">
                                    else if((UARTBuffer[loop].FunctionCode>=36)&&(UARTBuffer[loop].FunctionCode<=38))
                                    {
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1439 - UPS Output A P%">
                                    else if(UARTBuffer[loop].FunctionCode==39)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][114];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][115];
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1440 - UPS Output B P%">
                                    else if(UARTBuffer[loop].FunctionCode==40)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][114];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][115];
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1441 - UPS Output C P%">
                                    else if(UARTBuffer[loop].FunctionCode==41)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][114];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][115];
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1442-1443 - Blanks">
                                    else if((UARTBuffer[loop].FunctionCode>=42)&&(UARTBuffer[loop].FunctionCode<=43))
                                    {
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1444 - Output Apparent Power">
                                    else if(UARTBuffer[loop].FunctionCode==44)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][110];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][111];
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1445 - Output Active Power">
                                    else if(UARTBuffer[loop].FunctionCode==45)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][108];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][109];
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1446 inverter state ">
                                    else if(UARTBuffer[loop].FunctionCode==46)
                                    {
//                                        Temp=TCPUPS[i].Data[0][145];
//
//                                        if(Temp>1)
//                                            Temp=1;
//                                        else
                                            Temp=0;

                                        UARTSWBuffer[0]=0;
                                        UARTSWBuffer[1]=Temp;
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1447 Maintance Bypass breaker N/A">
                                    else if(UARTBuffer[loop].FunctionCode==47)
                                    {
                                        UARTSWBuffer[1]=0;
                                        UARTSWBuffer[0]=0;

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1448 Ouput Source">
                                    else if(UARTBuffer[loop].FunctionCode==48)
                                    {
                                        // Start with 3- Normal
                                        Temp=3;

                                        if((TCPUPS[i].Data[1][1]&0x01)==0)
                                            Temp=2;
                                        else if((TCPUPS[i].Data[1][1]&0x10)==1)
                                            Temp=5;
                                        else if((TCPUPS[i].Data[1][1]&0x80)==1)
                                            Temp=4;

                                        UARTSWBuffer[0]=0;
                                        UARTSWBuffer[1]=Temp;

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1450 - Status bits">
                                    else if(UARTBuffer[loop].FunctionCode==50)
                                    {
                                        UINT8 Temp8,Bit1,Bit2,Bit3,Bit4,Bit5;

                                        Temp8=0;
                                        Bit3=0;

                                        Bit4=TCPUPS[i].Data[1][1];
                                        Bit4&=0x20;

                                        if(Bit4>0)
                                            Bit4=1;
                                        else
                                            Bit4=0;

                                        Bit1=TCPUPS[i].Data[1][2];
                                        Bit1&=0x20;

                                        if(Bit1>0)
                                            Bit1=1;
                                        else
                                            Bit1=0;

                                        Bit2=TCPUPS[i].Data[1][25];
                                        Bit2&=0x02;

                                        if(Bit2>0)
                                            Bit2=1;
                                        else
                                            Bit2=0;

                                        Bit5=TCPUPS[i].Data[1][19];
                                        Bit5&=0x01;

                                        if(Bit5>0)
                                            Bit5=1;
                                        else
                                            Bit5=0;

                                        Temp8=Bit5;
                                        Temp8=Temp8<<1;
                                        Temp8|=Bit4;
                                        Temp8=Temp8<<1;
                                        Temp8|=Bit3;
                                        Temp8=Temp8<<1;
                                        Temp8|=Bit2;
                                        Temp8=Temp8<<1;
                                        Temp8|=Bit1;

                                        UARTSWBuffer[0]=0;
                                        UARTSWBuffer[1]=Temp8;

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1452 - UPS Well known alarms">
                                    else if(UARTBuffer[loop].FunctionCode==52)
                                    {

                                        SendToDigi(8,1);
                                    }// </editor-fold>
                                    else
                                    {                                        
                                        SendToDigi(2,1);
                                    }
                                    break;
                                }
                            }// </editor-fold>
                            // <editor-fold defaultstate="collapsed" desc="UPS Type Is Socemec">
                            else if(TCPUPS[i].DeviceType==DeviceTypeIsSocemec)
                            {
                                if(TCPUPS[i].InstanceNo==UARTBuffer[loop].InstanceNo)
                                {
                                    // <editor-fold defaultstate="collapsed" desc="1409 - System Current A">
                                    if(UARTBuffer[loop].FunctionCode==9)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][6];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][7];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1410 - System Current B">
                                    else if(UARTBuffer[loop].FunctionCode==10)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][8];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][9];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1411 - System Current C">
                                    else if(UARTBuffer[loop].FunctionCode==11)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][10];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][11];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1412 - System Frequency">
                                    else if(UARTBuffer[loop].FunctionCode==12)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][12];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][13];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1413 - System Voltage A">
                                    else if(UARTBuffer[loop].FunctionCode==13)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][0];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][1];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1414 - System Voltage B">
                                    else if(UARTBuffer[loop].FunctionCode==14)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][2];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][3];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1415 - System Voltage C">
                                    else if(UARTBuffer[loop].FunctionCode==15)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][4];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][5];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1416-1418 - Blanks (Power Factor Input)">
                                    else if((UARTBuffer[loop].FunctionCode>=16)&&(UARTBuffer[loop].FunctionCode<=18))
                                    {
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1419 - Bypass voltage A">
                                    else if(UARTBuffer[loop].FunctionCode==19)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][14];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][15];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1420 - Bypass voltage B">
                                    else if(UARTBuffer[loop].FunctionCode==20)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][16];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][17];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1421 - Bypass voltage C">
                                    else if(UARTBuffer[loop].FunctionCode==21)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][18];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][19];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1422 - Bypass Frequency">
                                    else if(UARTBuffer[loop].FunctionCode==22)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][20];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][21];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1423 Time remaining on Bat - Working">
                                    else if(UARTBuffer[loop].FunctionCode==23)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][22];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][23];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1424 Battery Voltage - Working">
                                    else if(UARTBuffer[loop].FunctionCode==24)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][24];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][25];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1425 Battery Temperature - Working">
                                    else if(UARTBuffer[loop].FunctionCode==25)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][28];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][29];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1426 - Inlet air Temp - N/A">
                                    else if(UARTBuffer[loop].FunctionCode==26)
                                    {
                                        UARTSWBuffer[0]=0;
                                        UARTSWBuffer[1]=0;
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1427 - DC Buss Current - Working">
                                    else if(UARTBuffer[loop].FunctionCode==27)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][26];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][27];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1428 - UPS Battery Status - n/a">
                                    else if(UARTBuffer[loop].FunctionCode==28)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][46];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][47];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1429 - UPS Output Current A">
                                    else if(UARTBuffer[loop].FunctionCode==29)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][30];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][31];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1430 - UPS Output Current B">
                                    else if(UARTBuffer[loop].FunctionCode==30)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][32];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][33];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1431 - UPS Output Current C">
                                    else if(UARTBuffer[loop].FunctionCode==31)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][34];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][35];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1432 - UPS Output Frequency">
                                    else if(UARTBuffer[loop].FunctionCode==32)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][36];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][37];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1433 - UPS Output Voltage A">
                                    else if(UARTBuffer[loop].FunctionCode==33)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][38];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][39];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1434 - UPS Output Voltage B">
                                    else if(UARTBuffer[loop].FunctionCode==34)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][40];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][41];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1435 - UPS Output Voltage C">
                                    else if(UARTBuffer[loop].FunctionCode==35)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][42];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][43];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1436-1438 - Blanks (Power Factor Output)">
                                    else if((UARTBuffer[loop].FunctionCode>=36)&&(UARTBuffer[loop].FunctionCode<=38))
                                    {
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1439 - UPS Output A P%">
                                    else if(UARTBuffer[loop].FunctionCode==39)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][48];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][49];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1440 - UPS Output B P%">
                                    else if(UARTBuffer[loop].FunctionCode==40)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][50];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][51];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1441 - UPS Output C P%">
                                    else if(UARTBuffer[loop].FunctionCode==41)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][52];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][53];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1442-1443 - Blanks">
                                    else if((UARTBuffer[loop].FunctionCode>=42)&&(UARTBuffer[loop].FunctionCode<=43))
                                    {
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1444 - Output Apparent Power">
                                    else if(UARTBuffer[loop].FunctionCode==44)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][110];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][111];
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1445 - Output Active Power">
                                    else if(UARTBuffer[loop].FunctionCode==45)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][108];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][109];
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1446 inverter state ">
                                    else if(UARTBuffer[loop].FunctionCode==46)
                                    {
//                                        Temp=TCPUPS[i].Data[0][145];
//
//                                        if(Temp>1)
//                                            Temp=1;
//                                        else
                                            Temp=0;

                                        UARTSWBuffer[0]=0;
                                        UARTSWBuffer[1]=Temp;
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1447 Maintance Bypass breaker N/A">
                                    else if(UARTBuffer[loop].FunctionCode==47)
                                    {
                                        UARTSWBuffer[1]=0;
                                        UARTSWBuffer[0]=0;

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1448 Ouput Source">
                                    else if(UARTBuffer[loop].FunctionCode==48)
                                    {
                                        UARTSWBuffer[0]=TCPUPS[i].Data[0][44];
                                        UARTSWBuffer[1]=TCPUPS[i].Data[0][45];

                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1450 - Status bits">
                                    else if(UARTBuffer[loop].FunctionCode==50)
                                    {
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1452 - UPS Well known alarms">
                                    else if(UARTBuffer[loop].FunctionCode==52)
                                    {

                                        SendToDigi(8,1);
                                    }// </editor-fold>
                                    else
                                    {                                        
                                        SendToDigi(2,1);
                                    }
                                    break;
                                }
                            }// </editor-fold>
                        }// </editor-fold>

                    }// </editor-fold>
                    // <editor-fold defaultstate="collapsed" desc="1500-> PDU">
                    else if((UARTBuffer[loop].FunctionCode>=1500)&&(UARTBuffer[loop].FunctionCode<1600))
                    {
                        // 1509 -> Load Status
                        if(UARTBuffer[loop].FunctionCode==1509)
                            StartSNMP(UARTBuffer[loop].FunctionCode,InstanceNoToSend);
                        // 1510 -> Power KW
                        else if(UARTBuffer[loop].FunctionCode==1510)
                            StartSNMP(UARTBuffer[loop].FunctionCode,InstanceNoToSend);
                        // 1511 -> Energy
                        else if(UARTBuffer[loop].FunctionCode==1511)
                            StartSNMP(UARTBuffer[loop].FunctionCode,InstanceNoToSend);
                        // 1512 -> Power VA
                        else if(UARTBuffer[loop].FunctionCode==1512)
                            StartSNMP(UARTBuffer[loop].FunctionCode,InstanceNoToSend);
                        // 1513 -> Power Factor
                        else if(UARTBuffer[loop].FunctionCode==1513)
                            StartSNMP(UARTBuffer[loop].FunctionCode,InstanceNoToSend);
                        // 1514 -> Voltage
                        else if(UARTBuffer[loop].FunctionCode==1514)
                            StartSNMP(UARTBuffer[loop].FunctionCode,InstanceNoToSend);
                        // 1515 -> Current
                        else if(UARTBuffer[loop].FunctionCode==1515)
                            StartSNMP(UARTBuffer[loop].FunctionCode,InstanceNoToSend);

                        SendToDigi(4,0);
                    }// </editor-fold>            
                    // <editor-fold defaultstate="collapsed" desc="1900-> Rectifier">
                    else if((UARTBuffer[loop].FunctionCode>=1900)&&(UARTBuffer[loop].FunctionCode<2000))
                    {
                        for(i=0;i<NumberOfTCPRectifierBoards;i++)
                        {
                            if(RectifierControllers[i].InstanceNo==UARTBuffer[loop].InstanceNo)
                            {
                                if((ErmeloSNMP==1)||(RecitifierSNMP==1))
                                {
                                    // <editor-fold defaultstate="collapsed" desc="1909 - Recitfier State">
                                    if(UARTBuffer[loop].FunctionCode==1909)
                                    {
                                        UARTSWBuffer[0]=0;
                                        SendToDigi(1,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1910 - Rec bits">
                                    else if(UARTBuffer[loop].FunctionCode==1910)
                                    {
                                        UARTSWBuffer[0]=0;

                                        SendToDigi(1,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1911 - Total Energy">
                                    else if(UARTBuffer[loop].FunctionCode==1911)
                                    {
                                        SendToDigi(4,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1912 - Rectifer Voltage">
                                    else if(UARTBuffer[loop].FunctionCode==1912)
                                    {
                                        UARTSWBuffer[0]=RectifierControllers[i].Data[0][2];
                                        UARTSWBuffer[1]=RectifierControllers[i].Data[0][3];
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1913 - Rectifer Current">
                                    else if(UARTBuffer[loop].FunctionCode==1913)
                                    {
                                        UARTSWBuffer[0]=RectifierControllers[i].Data[0][4];
                                        UARTSWBuffer[1]=RectifierControllers[i].Data[0][5];
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1915 - Rectifer State">
                                    else if(UARTBuffer[loop].FunctionCode==1915)
                                    {
                                        UARTSWBuffer[0]=RectifierControllers[i].Data[0][1];
                                        
                                        SendToDigi(1,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1916 - Battery State">
                                    else if(UARTBuffer[loop].FunctionCode==1916)
                                    {
                                        UARTSWBuffer[0]=RectifierControllers[i].Data[0][11];
                                        
                                        SendToDigi(1,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1918 - Battery Voltage">
                                    else if(UARTBuffer[loop].FunctionCode==1918)
                                    {
                                        UARTSWBuffer[0]=RectifierControllers[i].Data[0][6];
                                        UARTSWBuffer[1]=RectifierControllers[i].Data[0][7];
                                        
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1919 - Battery Current">
                                    else if(UARTBuffer[loop].FunctionCode==1919)
                                    {
                                        UARTSWBuffer[0]=RectifierControllers[i].Data[0][8];
                                        UARTSWBuffer[1]=RectifierControllers[i].Data[0][9];
                                        
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1920 - Used Capacity">
                                    else if(UARTBuffer[loop].FunctionCode==1920)
                                    {
                                        UARTSWBuffer[0]=RectifierControllers[i].Data[0][12];
                                        UARTSWBuffer[1]=RectifierControllers[i].Data[0][13];
                                        
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                }
                                else
                                {
                                    // <editor-fold defaultstate="collapsed" desc="1909 - Recitfier State">
                                    if(UARTBuffer[loop].FunctionCode==1909)
                                    {
                                        UARTSWBuffer[0]=RectifierControllers[i].Data[0][1];
                                        SendToDigi(1,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1910 - Rec bits">
                                    else if(UARTBuffer[loop].FunctionCode==1910)
                                    {
                                        j=0;

                                        if(((UINT8)RectifierControllers[i].Data[0][7]==2)||((UINT8)RectifierControllers[i].Data[0][7]==5)||((UINT8)RectifierControllers[i].Data[0][7]==8))
                                            j=1;

                                        j<<=1;

                                        if(((UINT8)RectifierControllers[i].Data[0][5]==2)||((UINT8)RectifierControllers[i].Data[0][5]==5)||((UINT8)RectifierControllers[i].Data[0][5]==8))
                                            j|=1;

                                        j<<=1;

                                        if(((UINT8)RectifierControllers[i].Data[0][3]==2)||((UINT8)RectifierControllers[i].Data[0][3]==5)||((UINT8)RectifierControllers[i].Data[0][3]==8))
                                            j|=1;

                                        UARTSWBuffer[0]=j;

                                        SendToDigi(1,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1911 - Total Energy">
                                    else if(UARTBuffer[loop].FunctionCode==1911)
                                    {
//                                        Temp=RectifierControllers[i].Data[0][8];
//                                        Temp=Temp<<8;
//                                        Temp|=RectifierControllers[i].Data[0][9];

                                        UARTSWBuffer[0]=0;
                                        UARTSWBuffer[1]=0;
                                        UARTSWBuffer[2]=0;
                                        UARTSWBuffer[3]=0;
//                                        UARTSWBuffer[3]=Temp;
//                                        UARTSWBuffer[2]=Temp>>8;
                                        SendToDigi(4,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1912 - Rectifer Voltage">
                                    else if(UARTBuffer[loop].FunctionCode==1912)
                                    {
                                        UARTSWBuffer[0]=RectifierControllers[i].Data[0][10];
                                        UARTSWBuffer[1]=RectifierControllers[i].Data[0][11];
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1913 - Rectifer Current">
                                    else if(UARTBuffer[loop].FunctionCode==1913)
                                    {
                                        UARTSWBuffer[0]=RectifierControllers[i].Data[0][18];
                                        UARTSWBuffer[1]=RectifierControllers[i].Data[0][19];
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="1917 - Rectifer KW">
                                    else if(UARTBuffer[loop].FunctionCode==1917)
                                    {
                                        
                                        Temp=RectifierControllers[i].Data[0][12];
                                        Temp<<=8;
                                        Temp|=RectifierControllers[i].Data[0][13];
                                        
                                        Temp/=1000;
                                        
                                        UARTSWBuffer[0]=Temp>>8;
                                        UARTSWBuffer[1]=Temp;
                                        
                                        SendToDigi(2,1);
                                    }// </editor-fold>
                                    else
                                    {
                                        SendToDigi(2,1);
                                    }
                                }
                                
                                break;
                            }
                        }
                    }// </editor-fold>
                    // <editor-fold defaultstate="collapsed" desc="2100-> Monitored Battery Bank">
                    else if((UARTBuffer[loop].FunctionCode>=2100)&&(UARTBuffer[loop].FunctionCode<2200))
                    {
                        for(i=0;i<ActualNumberOfRTUDevices;i++)
                        {
                            if((RTUDevices[i].DeviceIs==DeviceIsRTUBMU)||(NumberofRTULithiums>0))
                            {
                                // <editor-fold defaultstate="collapsed" desc="2104 - SOC (2 Bytes)">
                                if(UARTBuffer[loop].FunctionCode==2104)
                                {
                                    #if(LithiumOnBMU>0)
                                        UARTSWBuffer[0]=RTUDevices[i].DataType1Data[8];
                                        UARTSWBuffer[1]=RTUDevices[i].DataType1Data[9];
                                    #else
                                        UARTSWBuffer[0]=LithiumBattery.Average_SOC>>8;
                                        UARTSWBuffer[1]=LithiumBattery.Average_SOC;
                                    #endif
                                    SendToDigi(2,1);
                                }// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="2105 - SOH (2 Bytes)">
                                else if(UARTBuffer[loop].FunctionCode==2105)
                                {
                                    #if(LithiumOnBMU>0)
                                        UARTSWBuffer[0]=RTUDevices[i].DataType1Data[10];
                                        UARTSWBuffer[1]=RTUDevices[i].DataType1Data[11];
                                    #else
                                        UARTSWBuffer[0]=LithiumBattery.Average_SOH>>8;
                                        UARTSWBuffer[1]=LithiumBattery.Average_SOH;
                                    #endif
                                    SendToDigi(2,1);
                                }// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="2106 - Voltage (2 Bytes)">
                                else if(UARTBuffer[loop].FunctionCode==2106)
                                {
                                    #if(LithiumOnBMU>0)
                                        UARTSWBuffer[0]=RTUDevices[i].DataType1Data[16];
                                        UARTSWBuffer[1]=RTUDevices[i].DataType1Data[17];
                                    #else
                                        Temp=LithiumBattery.Average_Voltage;
                                        Temp*=10;

                                        UARTSWBuffer[0]=Temp>>8;
                                        UARTSWBuffer[1]=Temp;
                                    #endif
                                    SendToDigi(2,1);
                                }// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="2107 - Current (2 Bytes)">
                                else if(UARTBuffer[loop].FunctionCode==2107)
                                {
                                    #if(LithiumOnBMU>0)
                                        UARTSWBuffer[0]=RTUDevices[i].DataType1Data[18];
                                        UARTSWBuffer[1]=RTUDevices[i].DataType1Data[19];
                                    #else
                                        UARTSWBuffer[0]=LithiumBattery.Average_Current>>8;
                                        UARTSWBuffer[1]=LithiumBattery.Average_Current;
                                    #endif
                                    SendToDigi(2,1);
                                }// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="2108 - Temp (2 Bytes)">
                                else if(UARTBuffer[loop].FunctionCode==2108)
                                {
                                    #if(LithiumOnBMU>0)
                                        UARTSWBuffer[0]=RTUDevices[i].DataType1Data[20];
                                        UARTSWBuffer[1]=RTUDevices[i].DataType1Data[21];
                                    #else
                                        Temp=LithiumBattery.Average_Temp;
                                        Temp*=10;

                                        UARTSWBuffer[0]=Temp>>8;
                                        UARTSWBuffer[1]=Temp;
                                    #endif
                                    SendToDigi(2,1);
                                }// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="2109 - Alarms Status (4 Bytes)">
                                else if(UARTBuffer[loop].FunctionCode==2109)
                                {
                                    #if(LithiumOnBMU>0)
                                        UARTSWBuffer[0]=RTUDevices[i].DataType1Data[24];
                                        UARTSWBuffer[1]=RTUDevices[i].DataType1Data[25];
                                        UARTSWBuffer[2]=RTUDevices[i].DataType1Data[26];
                                        UARTSWBuffer[3]=RTUDevices[i].DataType1Data[27];
                                    #else
                                        UARTSWBuffer[0]=LithiumBattery.Average_Alarms>>24;
                                        UARTSWBuffer[1]=LithiumBattery.Average_Alarms>>16;
                                        UARTSWBuffer[2]=LithiumBattery.Average_Alarms>>8;   
                                        UARTSWBuffer[3]=LithiumBattery.Average_Alarms;
                                    #endif
                                    SendToDigi(4,1);
                                }// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="2110 - Protect status (4 Bytes)">
                                else if(UARTBuffer[loop].FunctionCode==2110)
                                {
                                    #if(LithiumOnBMU>0)
                                        UARTSWBuffer[0]=RTUDevices[i].DataType1Data[28];
                                        UARTSWBuffer[1]=RTUDevices[i].DataType1Data[29];
                                        UARTSWBuffer[2]=RTUDevices[i].DataType1Data[30];
                                        UARTSWBuffer[3]=RTUDevices[i].DataType1Data[31];
                                    #else
                                        UARTSWBuffer[0]=LithiumBattery.Average_Protect>>24;
                                        UARTSWBuffer[1]=LithiumBattery.Average_Protect>>16;
                                        UARTSWBuffer[2]=LithiumBattery.Average_Protect>>8;
                                        UARTSWBuffer[3]=LithiumBattery.Average_Protect;
                                    #endif
                                    SendToDigi(4,1);
                                }// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="2111 - Fault status (4 Bytes)">
                                else if(UARTBuffer[loop].FunctionCode==2111)
                                {
                                    #if(LithiumOnBMU>0)
                                        UARTSWBuffer[0]=RTUDevices[i].DataType1Data[32];
                                        UARTSWBuffer[1]=RTUDevices[i].DataType1Data[33];
                                        UARTSWBuffer[2]=RTUDevices[i].DataType1Data[34];
                                        UARTSWBuffer[3]=RTUDevices[i].DataType1Data[35];
                                    #else
                                        UARTSWBuffer[0]=LithiumBattery.Average_Fault>>24;
                                        UARTSWBuffer[1]=LithiumBattery.Average_Fault>>16;
                                        UARTSWBuffer[2]=LithiumBattery.Average_Fault>>8;
                                        UARTSWBuffer[3]=LithiumBattery.Average_Fault;
                                    #endif
                                    SendToDigi(4,1);
                                }// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="2114 - Battery Capacity (2 Bytes)">
                                else if(UARTBuffer[loop].FunctionCode==2114)
                                {
                                    #if(LithiumOnBMU>0)
                                        UARTSWBuffer[0]=RTUDevices[i].DataType1Data[52];
                                        UARTSWBuffer[1]=RTUDevices[i].DataType1Data[53];
                                    #else
                                        UARTSWBuffer[1]=50;
                                    #endif
                                    SendToDigi(2,1);
                                }// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="2115 - Total Discharged (4 Bytes)">
                                else if(UARTBuffer[loop].FunctionCode==2115)
                                {
                                    #if(LithiumOnBMU>0)
                                        UARTSWBuffer[0]=RTUDevices[i].DataType1Data[56];
                                        UARTSWBuffer[1]=RTUDevices[i].DataType1Data[57];
                                        UARTSWBuffer[2]=RTUDevices[i].DataType1Data[58];
                                        UARTSWBuffer[3]=RTUDevices[i].DataType1Data[59];
                                    #else
                                        UARTSWBuffer[0]=LithiumBattery.Total_Discharged>>24;
                                        UARTSWBuffer[1]=LithiumBattery.Total_Discharged>>16;
                                        UARTSWBuffer[2]=LithiumBattery.Total_Discharged>>8;
                                        UARTSWBuffer[3]=LithiumBattery.Total_Discharged;
                                    #endif
                                    SendToDigi(4,1);
                                }// </editor-fold>
                                else
                                {
                                    UARTBuffer[loop].FunctionCode-=2100;
                                    UARTBuffer[loop].FunctionCode*=2;

//                                    UARTSWBuffer[0]=RTUDevices[i].DataType1Data[UARTBuffer[loop].FunctionCode];
//                                    UARTSWBuffer[1]=RTUDevices[i].DataType1Data[1+UARTBuffer[loop].FunctionCode];
                                    SendToDigi(2,1);
                                }
                                break;
                            }
                        }
                    }// </editor-fold>
                    // <editor-fold defaultstate="collapsed" desc="20000-> Triple changeover controller">
                    else if ((UARTBuffer[loop].FunctionCode>=20000)&&(UARTBuffer[loop].FunctionCode<=20100))
                    {
                        for(i=0;i<NumberOfTCPTCO;i++)
                        {
                            if(TCO[i].InstanceNo==UARTBuffer[loop].InstanceNo)
                            {
                                switch(UARTBuffer[loop].FunctionCode)
                                {
                                    // <editor-fold defaultstate="collapsed" desc="20000-> Line States">
                                    case 20000:
                                        UARTSWBuffer[0]=TCO[i].BussStatus.All;
                                        break;// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="20001-> Generator States">
                                    case 20001:
                                        TempSend=0;
                                        TempSend=TCO[i].ChangeOverStatus.LagGenFailed;
                                        TempSend<<=1;
                                        TempSend|=TCO[i].ChangeOverStatus.SecondaryLeadLag;
                                        TempSend<<=1;
                                        TempSend|=TCO[i].ChangeOverOutput.SGenStart;
                                        TempSend<<=2;
                                        TempSend|=TCO[i].ChangeOverStatus.LeadGenFailed;
                                        TempSend<<=1;
                                        TempSend|=TCO[i].ChangeOverStatus.PrimaryLeadLag;
                                        TempSend<<=1;
                                        TempSend|=TCO[i].ChangeOverOutput.PGenStart;

                                        UARTSWBuffer[0]=TempSend;
                                        break;// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="20002-> Power meter states">
                                    case 20002:
                                        UARTSWBuffer[0]=TCO[i].PowerMeterStatus.All;
                                        break;// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="20003-> Utility Breaker state">
                                    case 20003:

                                        UARTSWBuffer[0]=TCO[i].BreakerStateUtl.All;
                                        break;// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="20004-> Generator Breaker state">
                                    case 20004:

                                        UARTSWBuffer[0]=TCO[i].BreakerStatePrimary.All;
                                        break;// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="20005-> Secondary Breaker state">
                                    case 20005:

                                        UARTSWBuffer[0]=TCO[i].BreakerStateSecondary.All;
                                        break;// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="20006-> Crosslink Breaker state">
                                    case 20006:
                                        UARTSWBuffer[0]=TCO[i].BreakerStateCrosslink.All;
                                        break;// </editor-fold>
                                    // <editor-fold defaultstate="collapsed" desc="20007-> Auto manual switch">
                                    case 20007:
                                        UARTSWBuffer[0]=TCO[i].TCOModeBits.EmergencyStopActive;
                                        UARTSWBuffer[0]=UARTSWBuffer[0]<<1;
                                        UARTSWBuffer[0]|=TCO[i].ChangeOverStatus.Auto_Manual;
                                        break;// </editor-fold>
                                }
                                
                                break;
                            }
                        }
                        
                        SendToDigi(1,1);//ONe Byte to send Only
                    }// </editor-fold>
                    // <editor-fold defaultstate="collapsed" desc="20400-> Battery Manager">
                    else if ((UARTBuffer[loop].FunctionCode>=20400)&&(UARTBuffer[loop].FunctionCode<=20499))
                    {
                        #if(UseBVT840DirectONCAN==1)
                            switch(UARTBuffer[loop].FunctionCode)
                            {
                                // <editor-fold defaultstate="collapsed" desc="20400 -> Number of strings (1 Byte)">
                                case 20400:
                                    UARTSWBuffer[0]=NumberOfBVT840AttachedCards;
                                    SendToDigi(1,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="20401 -> Primary CT Ratio (2 Bytes)">
                                case 20401:
                                    UARTSWBuffer[0]=ActualBVT840Card[UARTBuffer[loop].InstanceNo].PrimaryCTRatio;
                                    UARTSWBuffer[1]=ActualBVT840Card[UARTBuffer[loop].InstanceNo].PrimaryCTRatio>>8;

                                    SendToDigi(2,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="20402 -> Secondary CT Ratio (1 Byte)">
                                case 20402:
                                    UARTSWBuffer[0]=ActualBVT840Card[UARTBuffer[loop].InstanceNo].SecondayCTRatio;

                                    SendToDigi(1,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="20404 -> Current Measurement (4 Bytes)">
                                case 20404:
                                    if(BatterYManagerSettings.CurrentIs2Byte)
                                    {
                                        CalcTemp=ActualBVT840Card[UARTBuffer[loop].InstanceNo].Current;
                                        CalcTemp/=1000;

                                        Temp=CalcTemp;

                                        UARTSWBuffer[0]=Temp;
                                        UARTSWBuffer[1]=Temp>>8;
                                        SendToDigi(2,1);
                                    }
                                    else
                                    {
                                        // Scaling by 10
                                        ActualBVT840Card[UARTBuffer[loop].InstanceNo].Current/=10;
//                                        ActualBVT840Card[UARTBuffer[loop].InstanceNo].Current^=0xffffffff;

                                        UARTSWBuffer[0]=ActualBVT840Card[UARTBuffer[loop].InstanceNo].Current;
                                        UARTSWBuffer[1]=ActualBVT840Card[UARTBuffer[loop].InstanceNo].Current>>8;
                                        UARTSWBuffer[2]=ActualBVT840Card[UARTBuffer[loop].InstanceNo].Current>>16;
                                        UARTSWBuffer[3]=ActualBVT840Card[UARTBuffer[loop].InstanceNo].Current>>24;

                                        SendToDigi(4,1);
                                    }
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="20405 -> Voltage Array (128 Bytes)">
                                #if(BVT840OnSeperateBanks)
                                case 20405:
                                    for(i=0;i<20;i+=2)
                                    {
                                        UARTSWBuffer[i]=ActualBVT840Card[UARTBuffer[loop].InstanceNo].Voltage[i + 1];
                                        UARTSWBuffer[i+1]=ActualBVT840Card[UARTBuffer[loop].InstanceNo].Voltage[i];
                                    }
                                    SendToDigi(128,1);
                                    break;
                                #else
                                case 20405:
                                    Temp=0;
                                    
                                    for(j=0;j<6;j++)
                                    {
                                        for(i=0;i<20;i++)
                                        {
                                            UARTSWBuffer[Temp]=ActualBVT840Card[1+j].Voltage[i];
                                            Temp++;
                                        }
                                    }
                                    SendToDigi(128,1);
                                    break;
                                #endif
                                // </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="20406 -> Temperature Array (128 Bytes)">
                                #if(BVT840OnSeperateBanks)
                                case 20406:
                                    for(i=0;i<20;i+=2)
                                    {
                                        Temp=ActualBVT840Card[UARTBuffer[loop].InstanceNo].Temperature[i];
                                        Temp<<=8;
                                        Temp|=ActualBVT840Card[UARTBuffer[loop].InstanceNo].Temperature[i + 1];
                                        Temp/=100;
                                        
                                        ActualBVT840Card[UARTBuffer[loop].InstanceNo].Temperature[i]=Temp>>8;
                                        ActualBVT840Card[UARTBuffer[loop].InstanceNo].Temperature[i + 1]=Temp;
                                        
                                        UARTSWBuffer[i]=ActualBVT840Card[UARTBuffer[loop].InstanceNo].Temperature[i + 1];
                                        UARTSWBuffer[i+1]=ActualBVT840Card[UARTBuffer[loop].InstanceNo].Temperature[i];
                                    }
                                    SendToDigi(128,1);
                                    break;
                                #else
                                case 20406:
                                    Temp=0;
                                    
                                    for(j=0;j<6;j++)
                                    {
                                        for(i=0;i<20;i++)
                                        {
                                            UARTSWBuffer[Temp]=ActualBVT840Card[1+j].Temperature[i];
                                            Temp++;
                                        }
                                    }
                                    SendToDigi(128,1);
                                    break;
                                #endif
                                // </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="20407 -> Disconnected Batteries (8 Bytes)">
                                case 20407:
                                    for(i=0;i<8;i++)
//                                        UARTSWBuffer[i]=SRAMReadByteFromLocation(RamTypeBatteryConfig,UARTBuffer[loop].InstanceNo,2+i);
                                        UARTSWBuffer[i]=0x00;
                                    SendToDigi(8,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="20408 -> Disconnected Temp sensors (8 Bytes)">
                                case 20408:
                                    for(i=0;i<8;i++)
                                        UARTSWBuffer[i]=0x00;
//                                        UARTSWBuffer[i]=SRAMReadByteFromLocation(RamTypeBatteryConfig,UARTBuffer[loop].InstanceNo,10+i);
                                    SendToDigi(8,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="20451 -> Average ambient temperature (2 Bytes)">
                                case 20451:
                                    UARTSWBuffer[1]=ActualBVT840Card[UARTBuffer[loop].InstanceNo].AmbientTemp[1];
                                    UARTSWBuffer[0]=ActualBVT840Card[UARTBuffer[loop].InstanceNo].AmbientTemp[0];
                                    SendToDigi(2,1);
                                    break;// </editor-fold>
                            } 
                        #else
                            switch(UARTBuffer[loop].FunctionCode)
                            {
                                // <editor-fold defaultstate="collapsed" desc="20400 -> Number of strings (1 Byte)">
                                case 20400:
                                    UARTSWBuffer[0]=ActualNumberOfConverters;
                                    SendToDigi(1,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="20401 -> Primary CT Ratio (2 Bytes)">
                                case 20401:
                                    UARTSWBuffer[0]=BattManagers[UARTBuffer[loop].InstanceNo-1].PrimaryCTRatio;
                                    UARTSWBuffer[1]=BattManagers[UARTBuffer[loop].InstanceNo-1].PrimaryCTRatio>>8;

                                    SendToDigi(2,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="20402 -> Secondary CT Ratio (1 Byte)">
                                case 20402:
                                    UARTSWBuffer[0]=BattManagers[UARTBuffer[loop].InstanceNo-1].SecondayCTRatio;

                                    SendToDigi(1,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="20404 -> Current Measurement (4 Bytes)">
                                case 20404:
                                    UARTBuffer[loop].InstanceNo-=1;

                                    if(BatterYManagerSettings.CurrentIs2Byte)
                                    {
                                        CalcTemp=Current[UARTBuffer[loop].InstanceNo];
                                        CalcTemp/=1000;

                                        Temp=CalcTemp;

                                        UARTSWBuffer[0]=Temp;
                                        UARTSWBuffer[1]=Temp>>8;
                                        SendToDigi(2,1);
                                    }
                                    else
                                    {
                                        // Scaling by 10
                                        Current[UARTBuffer[loop].InstanceNo]/=10;

                                        UARTSWBuffer[0]=Current[UARTBuffer[loop].InstanceNo];
                                        UARTSWBuffer[1]=Current[UARTBuffer[loop].InstanceNo]>>8;
                                        UARTSWBuffer[2]=Current[UARTBuffer[loop].InstanceNo]>>16;
                                        UARTSWBuffer[3]=Current[UARTBuffer[loop].InstanceNo]>>24;

                                        SendToDigi(4,1);
                                    }
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="20405 -> Voltage Array (128 Bytes)">
                                case 20405:
                                    #if(MaskAsOldUC>0)
                                    
                                        UARTBuffer[loop].InstanceNo-=1;
                                        
                                        for(i=0;i<128;i++)
                                        {
                                            UARTSWBuffer[i]=BattManagers[UARTBuffer[loop].InstanceNo].BatteryVoltage[1+i];
                                            i++;
                                            j=i;
                                            j-=1;
                                            UARTSWBuffer[i]=BattManagers[UARTBuffer[loop].InstanceNo].BatteryVoltage[j];
                                        }
                                    #else
                                    
                                        for(i=0;i<128;i++)
                                        {
                                            UARTSWBuffer[i]=SRAMReadByteFromLocation(RamTypeBatteryVoltage,UARTBuffer[loop].InstanceNo,1+i);
                                            i++;
                                            j=i;
                                            j-=1;
                                            UARTSWBuffer[i]=SRAMReadByteFromLocation(RamTypeBatteryVoltage,UARTBuffer[loop].InstanceNo,j);
                                        }
        //                                SRAMReadPageDataFromStart(RamTypeBatteryVoltage,128,TCPDevice[m].InstanceNumber,UARTSWBuffer);
                                    
                                    #endif

                                    SendToDigi(128,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="20406 -> Temperature Array (128 Bytes)">
                                case 20406:
                                    #if(MaskAsOldUC>0)
                                        UARTBuffer[loop].InstanceNo-=1;
                                        
                                        for(i=0;i<128;i++)
                                        {
                                            UARTSWBuffer[i]=BattManagers[UARTBuffer[loop].InstanceNo].BatteryTemperature[1+i];
                                            i++;
                                            j=i;
                                            j-=1;
                                            UARTSWBuffer[i]=BattManagers[UARTBuffer[loop].InstanceNo].BatteryTemperature[j];
                                        }
                                    #else
                                        for(i=0;i<128;i++)
                                        {
                                            UARTSWBuffer[i]=SRAMReadByteFromLocation(RamTypeBatteryTemperature,UARTBuffer[loop].InstanceNo,1+i);
                                            i++;
                                            j=i;
                                            j-=1;
                                            UARTSWBuffer[i]=SRAMReadByteFromLocation(RamTypeBatteryTemperature,UARTBuffer[loop].InstanceNo,j);
                                        }
        //                                SRAMReadPageDataFromStart(RamTypeBatteryTemperature,128,TCPDevice[m].InstanceNumber,UARTSWBuffer);
                                    #endif

                                    SendToDigi(128,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="20407 -> Disconnected Batteries (8 Bytes)">
                                case 20407:
                                    #if(MaskAsOldUC>0)
                                        UARTBuffer[loop].InstanceNo-=1;
                                        
                                        for(i=0;i<8;i++)
                                            UARTSWBuffer[i]=BattManagers[UARTBuffer[loop].InstanceNo].BatteryConfig[2+i];
                                    #else
                                        for(i=0;i<8;i++)
                                            UARTSWBuffer[i]=SRAMReadByteFromLocation(RamTypeBatteryConfig,UARTBuffer[loop].InstanceNo,2+i);
                                    #endif
                                    SendToDigi(8,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="20408 -> Disconnected Temp sensors (8 Bytes)">
                                case 20408:
                                    #if(MaskAsOldUC>0)
                                        UARTBuffer[loop].InstanceNo-=1;
                                        
                                        for(i=0;i<8;i++)
                                            UARTSWBuffer[i]=BattManagers[UARTBuffer[loop].InstanceNo].BatteryConfig[10+i];
                                    #else
                                        for(i=0;i<8;i++)
                                            UARTSWBuffer[i]=SRAMReadByteFromLocation(RamTypeBatteryConfig,UARTBuffer[loop].InstanceNo,10+i);
                                    #endif
                                    SendToDigi(8,1);
                                    break;// </editor-fold>
                                // <editor-fold defaultstate="collapsed" desc="20451 -> Average ambient temperature (2 Bytes)">
                                case 20451:
                                    UARTSWBuffer[1]=BattManagers[UARTBuffer[loop].InstanceNo-1].AverageAmbientTemperature;
                                    UARTSWBuffer[0]=BattManagers[UARTBuffer[loop].InstanceNo-1].AverageAmbientTemperature>>8;
                                    SendToDigi(2,1);
                                    break;// </editor-fold>
                            }   
                        #endif
                    }// </editor-fold>
                    // <editor-fold defaultstate="collapsed" desc="20800-> Gen controller">
                    else if((UARTBuffer[loop].FunctionCode>=20800)&&(UARTBuffer[loop].FunctionCode<20900))
                    {
                        UARTBuffer[loop].FunctionCode-=20800;

                        // <editor-fold defaultstate="collapsed" desc="20804 - Control Signals(1 Byte)">
                        if(UARTBuffer[loop].FunctionCode==4)
                        {
                            UARTSWBuffer[0]=Generator[UARTBuffer[loop].InstanceNo].DigiControl.All;
                            SendToDigi(1,1);
                        }// </editor-fold>
                        // <editor-fold defaultstate="collapsed" desc="20805 - Status Bits(2 Byte)">
                        else if(UARTBuffer[loop].FunctionCode==5)
                        {
                            Temp=Generator[UARTBuffer[loop].InstanceNo].GeneratorStatus.All;
                            UARTSWBuffer[1]=Temp;
                            UARTSWBuffer[0]=Temp>>8;
                            SendToDigi(2,1);
                        }// </editor-fold>
                        // <editor-fold defaultstate="collapsed" desc="20806 - General Alarms (2 Byte)">
                        else if(UARTBuffer[loop].FunctionCode==6)
                        {
                            Temp=Generator[UARTBuffer[loop].InstanceNo].GeneratorAlarms.All;
                            UARTSWBuffer[1]=Temp;
                            UARTSWBuffer[0]=Temp>>8;
                            SendToDigi(2,1);
                        }// </editor-fold>
                        // <editor-fold defaultstate="collapsed" desc="20807 - Non serious Alarms (1 Byte)">
                        else if(UARTBuffer[loop].FunctionCode==7)
                        {
                            UARTSWBuffer[0]=Generator[UARTBuffer[loop].InstanceNo].GeneratorNonSerious.All;
                            SendToDigi(1,1);
                        }// </editor-fold>
                        // <editor-fold defaultstate="collapsed" desc="20808 - Serious Alarms (1 Byte)">
                        else if(UARTBuffer[loop].FunctionCode==8)
                        {
                            UARTSWBuffer[0]=Generator[UARTBuffer[loop].InstanceNo].GeneratorSerious.All;
                            SendToDigi(1,1);
                        }// </editor-fold>
                        // <editor-fold defaultstate="collapsed" desc="20809 - Oil Pressure (2 Byte)">
                        else if(UARTBuffer[loop].FunctionCode==9)
                        {
                            Temp=Generator[UARTBuffer[loop].InstanceNo].OilPressure;

                            UARTSWBuffer[1]=Temp;
                            UARTSWBuffer[0]=Temp>>8;
                            SendToDigi(2,1);
                        }// </editor-fold>
                        // <editor-fold defaultstate="collapsed" desc="20810 - Temperature (2 Byte)">
                        else if(UARTBuffer[loop].FunctionCode==10)
                        {
                            Temp=Generator[UARTBuffer[loop].InstanceNo].CoolantTemperature;

                            UARTSWBuffer[1]=Temp;
                            UARTSWBuffer[0]=Temp>>8;
                            SendToDigi(2,1);
                        }// </editor-fold>
                        // <editor-fold defaultstate="collapsed" desc="20811 - Oil Temperature(2 Bytes)">
                        else if(UARTBuffer[loop].FunctionCode==11)
                        {
                            Temp=Generator[UARTBuffer[loop].InstanceNo].OilTemperature;

                            UARTSWBuffer[1]=Temp;
                            UARTSWBuffer[0]=Temp>>8;
                            SendToDigi(2,1);
                        }// </editor-fold>
                        // <editor-fold defaultstate="collapsed" desc="20812 - Charge Alternator Voltage(2 Bytes)">
                        else if(UARTBuffer[loop].FunctionCode==12)
                        {
                            Temp=Generator[UARTBuffer[loop].InstanceNo].ChargeAlternatorVoltage;

                            UARTSWBuffer[1]=Temp;
                            UARTSWBuffer[0]=Temp>>8;
                            SendToDigi(2,1);
                        }// </editor-fold>
                        // <editor-fold defaultstate="collapsed" desc="20813 - Battery Voltage(2 Bytes)">
                        else if(UARTBuffer[loop].FunctionCode==13)
                        {
                            Temp=Generator[UARTBuffer[loop].InstanceNo].BatteryVoltage;

                            UARTSWBuffer[1]=Temp;
                            UARTSWBuffer[0]=Temp>>8;
                            SendToDigi(2,1);
                        }// </editor-fold>
                        // <editor-fold defaultstate="collapsed" desc="20814 - Engine Speed(2 Bytes)">
                        else if(UARTBuffer[loop].FunctionCode==14)
                        {
                            Temp=Generator[UARTBuffer[loop].InstanceNo].EngineSpeed;

                            UARTSWBuffer[1]=Temp;
                            UARTSWBuffer[0]=Temp>>8;
                            SendToDigi(2,1);
                        }// </editor-fold>
                        // <editor-fold defaultstate="collapsed" desc="20815 - Crank Timer (2 Bytes)">
                        else if(UARTBuffer[loop].FunctionCode==15)
                        {
                            Temp=Generator[UARTBuffer[loop].InstanceNo].CrankTimer;

                            UARTSWBuffer[1]=Temp;
                            UARTSWBuffer[0]=Temp>>8;
                            SendToDigi(2,1);
                        }// </editor-fold>
                        // <editor-fold defaultstate="collapsed" desc="20816 - Non Serious Timer (2 Bytes)">
                        else if(UARTBuffer[loop].FunctionCode==16)
                        {
                            Temp=Generator[UARTBuffer[loop].InstanceNo].NonSeriousTimer;

                            UARTSWBuffer[1]=Temp;
                            UARTSWBuffer[0]=Temp>>8;
                            SendToDigi(2,1);
                        }// </editor-fold>
                        // <editor-fold defaultstate="collapsed" desc="20817 - Cool down time that lapsed (2 Byte)">
                        else if(UARTBuffer[loop].FunctionCode==17)   //
                        {
                            Temp=Generator[UARTBuffer[loop].InstanceNo].CooldownTimer;

                            UARTSWBuffer[0]=Temp;
                            UARTSWBuffer[1]=Temp>>8;
                            SendToDigi(2,1);
                        }// </editor-fold>
                        // <editor-fold defaultstate="collapsed" desc="20818 - Running Hours (4 Byte)">
                        else if(UARTBuffer[loop].FunctionCode==18)
                        {
                            Temp=Generator[UARTBuffer[loop].InstanceNo].GeneratorRunCounter;

                            UARTSWBuffer[0]=Temp;
                            UARTSWBuffer[1]=Temp>>8;
                            UARTSWBuffer[2]=Temp>>16;
                            UARTSWBuffer[3]=Temp>>24;
                            SendToDigi(4,1);
                        }// </editor-fold>
                        // <editor-fold defaultstate="collapsed" desc="20824 - Fuel consumption (2 Byte)">
                        else if(UARTBuffer[loop].FunctionCode==24)
                        {
                            Temp=Generator[UARTBuffer[loop].InstanceNo].FuelConsumption;

                            UARTSWBuffer[1]=Temp;
                            UARTSWBuffer[0]=Temp>>8;
                            
                            SendToDigi(2,1);
                        }// </editor-fold>
                    }// </editor-fold>      
                    // <editor-fold defaultstate="collapsed" desc="20900-> Fuel System">
                    else if((UARTBuffer[loop].FunctionCode>=20900)&&(UARTBuffer[loop].FunctionCode<21000))
                    {
                        switch(UARTBuffer[loop].FunctionCode)
                        {
                            // <editor-fold defaultstate="collapsed" desc="20900 - Fuel level percentage(2 Byte)">
                            case 20900:
                                UARTSWBuffer[0]=Generator[UARTBuffer[loop].InstanceNo].PercentageFuelLevel>>8;
                                UARTSWBuffer[1]=Generator[UARTBuffer[loop].InstanceNo].PercentageFuelLevel;
                                SendToDigi(2,1);
                                break;// </editor-fold>
                        }
                    }// </editor-fold>
                    // <editor-fold defaultstate="collapsed" desc="21000 -> Solar Management">
                    else if ((UARTBuffer[loop].FunctionCode>=21000)&&(UARTBuffer[loop].FunctionCode<=21100))
                    {
                        UINT16 NumberOfBVTCardsAttached;

                        UARTBuffer[loop].FunctionCode-=21000;

                        // Look through all the cards connected
                        for(i=0;i<ActualNumberOfTCPDevices;i++)
                        {
                            if(TCPDevice[i].DeviceIs==DeviceIsBatteryManager)
                            {
                                // Find the Instance Number we want
                                if(TCPDevice[i].InstanceNumber==UARTBuffer[loop].InstanceNo)
                                {
                                    // Get the number of cards that are attached to the Can to ethernet
                                    NumberOfBVTCardsAttached=SRAMReadByteFromLocation(RamTypeBatteryConfig,UARTBuffer[loop].InstanceNo,1);
                                    // each card has 16bit values, convert 8 bit to 16bit
                                    NumberOfBVTCardsAttached*=2;

                                    switch(UARTBuffer[loop].FunctionCode)
                                    {
                                        // <editor-fold defaultstate="collapsed" desc="21002 -> String Current (array)">
                                        case 2:
                                            // Load the Data to send to the Digi
                                            for(j=0;j<NumberOfBVTCardsAttached;j++)
//                                                    UARTSWBuffer[j]=TCPDevice[i].Batch3Data[52+j];
                                                    UARTSWBuffer[j]=SRAMReadByteFromLocation(RamTypeBatteryConfig,UARTBuffer[loop].InstanceNo,52+j);

                                            SendToDigi(NumberOfBVTCardsAttached,1);
                                            break;// </editor-fold>
                                        // <editor-fold defaultstate="collapsed" desc="21003 -> Voltage (array)">
                                        case 3:
                                            // there are 10 channels per card
                                            NumberOfBVTCardsAttached*=10;

                                            // Load the Data to send to the Digi
                                            for(j=0;j<NumberOfBVTCardsAttached;j++)
                                                    UARTSWBuffer[j]=SRAMReadByteFromLocation(RamTypeBatteryVoltage,UARTBuffer[loop].InstanceNo,1+j);

                                            SendToDigi(NumberOfBVTCardsAttached,1);
                                            break;// </editor-fold>
                                        // <editor-fold defaultstate="collapsed" desc="21004 -> Temperature (array)">
                                        case 4:
                                            // there are 10 channels per card
                                            NumberOfBVTCardsAttached*=10;

                                            // Load the Data to send to the Digi
                                            for(j=0;j<NumberOfBVTCardsAttached;j++)
                                                    UARTSWBuffer[j]=SRAMReadByteFromLocation(RamTypeBatteryTemperature,UARTBuffer[loop].InstanceNo,1+j);

                                            SendToDigi(NumberOfBVTCardsAttached,1);
                                            break;// </editor-fold>
                                    }
                                    break;
                                }
                            }
                        }
                    }// </editor-fold>
                }
            }// </editor-fold>
            // <editor-fold defaultstate="collapsed" desc="DIGI wants to write data to us">
            else if(UARTBuffer[loop].WriteDataRecieved==1)
            {
                // Clear the Flag
                UARTBuffer[loop].WriteDataRecieved=0;

                // <editor-fold defaultstate="collapsed" desc="44-> Card Reader">
                if (UARTBuffer[loop].FunctionCode==44)
                {
                    if(UARTBuffer[loop].WriteData[0])
                        CardReader.Settings.IsAValidCard=1;
                    
                    CardReader.Settings.InstanceNo=UARTBuffer[loop].InstanceNo;
                }// </editor-fold>
                // <editor-fold defaultstate="collapsed" desc="45-> Pepper Spray">
                else if (UARTBuffer[loop].FunctionCode==45)
                {
                    if(UARTBuffer[loop].InstanceNo==1)
                    {
                        if(UARTBuffer[loop].WriteData[0]==1)
                            PepperSpray.Settings.SprayNow=1;
                    }
                }// </editor-fold>
                // <editor-fold defaultstate="collapsed" desc="900-> Relay board">
                else if ((UARTBuffer[loop].FunctionCode>=900)&&(UARTBuffer[loop].FunctionCode<1000))
                {
                    if(UseUC_002_Out>0)
                    {
                        Board.Outputs.All=UARTBuffer[loop].WriteData[0];
                        
                        if(InvertRelaySignals>0)
                            Board.Outputs.All^=0xFFFF;
                    }
                    else
                    {
                        // look through all the devices
                        for(i=0;i<ActualNumberOfTCPDevices;i++)
                        {
                            // Find the device type we need
                            if(TCPDevice[i].DeviceIs==DeviceIsRelayBoard)
                            {
                                // Find the instance we need
                                if(TCPDevice[i].InstanceNumber==UARTBuffer[loop].InstanceNo)
                                {                            
                                    // Full the buffer with data to write.
                                    TCPDevice[i].WriteData[TCPDevice[i].WriteBufferPoistionKeeper][0]=UARTBuffer[loop].WriteData[0];
                                    TCPDevice[i].WriteData[TCPDevice[i].WriteBufferPoistionKeeper][1]=UARTBuffer[loop].WriteData[1];

                                    if(IsMoxaOutput>0)
                                        TCPDevice[i].WriteAddress[TCPDevice[i].WriteBufferPoistionKeeper]=32;
                                    else
                                        TCPDevice[i].WriteAddress[TCPDevice[i].WriteBufferPoistionKeeper]=0;

                                    TCPDevice[i].AmountOf8BitRegistersToWrite[TCPDevice[i].WriteBufferPoistionKeeper]=2;
                                    // Flage that there is data to be written to
                                    TCPDevice[i].Settings.WriteDataAvailable=1;
                                    // increament the buffer counter
                                    TCPDevice[i].WriteBufferPoistionKeeper++;
                                    // check to see if we too many items remaining in the que
                                    if(TCPDevice[i].WriteBufferPoistionKeeper>=WriteBufferSize)
                                    {
                                        // if the buffer is full and the device is failed the there is no need to keep the data, flush the buffer
                                        if(TCPDevice[i].Settings.DeviceFail)
                                        {
                                            TCPDevice[i].Settings.WriteDataAvailable=0;
                                            TCPDevice[i].WriteBufferPoistionKeeper=0;
                                        }
                                        else
                                            TCPDevice[i].WriteBufferPoistionKeeper--;
                                    }  

                                    break;
                                }
                            }
                        }
                    }
                }// </editor-fold>
                // <editor-fold defaultstate="collapsed" desc="20400 -> Battery Manager">
                else if ((UARTBuffer[loop].FunctionCode>=20400)&&(UARTBuffer[loop].FunctionCode<=20499))
                {            
                    switch(UARTBuffer[loop].FunctionCode)
                    {
                        // <editor-fold defaultstate="collapsed" desc="20401 -> Primary CT Ratio (2 Bytes)">
                        case 20401:                    
                            Temp=UARTBuffer[loop].WriteData[0];
                            Temp=Temp<<8;
                            Temp|=UARTBuffer[loop].WriteData[1];

                            if(UARTBuffer[loop].InstanceNo!=1)
                            {
                                // Save the value only if it is different
                                if(BattManagers[UARTBuffer[loop].InstanceNo-1].PrimaryCTRatio!=Temp)
                                {
                                    // Error checking, dont save if it is 0
                                    if(Temp!=0)
                                    {
                                        BattManagers[UARTBuffer[loop].InstanceNo-1].Settings.SavePrimaryToEEPROM=1;
                                        BattManagers[UARTBuffer[loop].InstanceNo-1].PrimaryCTRatio=Temp;
                                    }
                                }
                            }
                            else
                            {
                                for(i=0;i<NumberOfBatteryBanks;i++)
                                {
                                    // Save the value only if it is different
                                    if(BattManagers[i].PrimaryCTRatio!=Temp)
                                    {
                                        // Error checking, dont save if it is 0
                                        if(Temp!=0)
                                        {
                                            BattManagers[i].Settings.SavePrimaryToEEPROM=1;
                                            BattManagers[i].PrimaryCTRatio=Temp;
                                        }
                                    }
                                }
                            }
                            break;// </editor-fold>
                        // <editor-fold defaultstate="collapsed" desc="20402 -> Secondary CT Ratio (1 Byte)">
                        case 20402:
                            Temp=UARTBuffer[loop].WriteData[0];

                            if(UARTBuffer[loop].InstanceNo!=1)
                            {
                                // Save the value only if it is different
                                if(BattManagers[UARTBuffer[loop].InstanceNo-1].SecondayCTRatio!=Temp)
                                {
                                    // Error checking, dont save if it is 0
                                    if(Temp!=0)
                                    {
                                        BattManagers[UARTBuffer[loop].InstanceNo-1].Settings.SaveSecondaryToEEPROM=1;
                                        BattManagers[UARTBuffer[loop].InstanceNo-1].SecondayCTRatio=Temp;
                                    }       
                                } 
                            }
                            else
                            {
                                for(i=0;i<NumberOfBatteryBanks;i++)
                                {
                                    // Save the value only if it is different
                                    if(BattManagers[i].SecondayCTRatio!=Temp)
                                    {
                                        // Error checking, dont save if it is 0
                                        if(Temp!=0)
                                        {
                                            BattManagers[i].Settings.SaveSecondaryToEEPROM=1;
                                            BattManagers[i].SecondayCTRatio=Temp;
                                        }
                                    }
                                } 
                            }
                            break;// </editor-fold>
                        // <editor-fold defaultstate="collapsed" desc="20403 -> Voltage or current (1 Byte)">
                        case 20403:
                            VoltageCurrent=UARTBuffer[loop].WriteData[0];
                            break;// </editor-fold>
                        // <editor-fold defaultstate="collapsed" desc="20416 -> Alarms Status (1 Byte)">
                        case 20416:
                            Alarm=UARTBuffer[loop].WriteData[0];
                            break;// </editor-fold>
                        // <editor-fold defaultstate="collapsed" desc="20417 -> Voltage Threshold Upper(2 Byte)">
                        case 20417:
                            // look through all the devices
                            for(i=0;i<ActualNumberOfTCPDevices;i++)
                            {
                                // Find the device type we need
                                if(TCPDevice[i].DeviceIs==DeviceIsBatteryManager)
                                {
                                    // Find the instance we need
                                    if(TCPDevice[i].InstanceNumber==UARTBuffer[loop].InstanceNo)
                                    {       
                                        TCPDevice[i].WriteData[TCPDevice[i].WriteBufferPoistionKeeper][0]=UARTBuffer[loop].WriteData[0];
                                        TCPDevice[i].WriteData[TCPDevice[i].WriteBufferPoistionKeeper][1]=UARTBuffer[loop].WriteData[1];

                                        TCPDevice[i].WriteAddress[TCPDevice[i].WriteBufferPoistionKeeper]=213;
                                        TCPDevice[i].AmountOf8BitRegistersToWrite[TCPDevice[i].WriteBufferPoistionKeeper]=2;

                                        // Flage that there is data to be written to
                                        TCPDevice[i].Settings.WriteDataAvailable=1;
                                        // increament the buffer counter
                                        TCPDevice[i].WriteBufferPoistionKeeper++;

                                        // check to see if we too many items remaining in the que
                                        if(TCPDevice[i].WriteBufferPoistionKeeper>=WriteBufferSize)
                                        {
                                            // if the buffer is full and the device is failed the there is no need to keep the data, flush the buffer
                                            if(TCPDevice[i].Settings.DeviceFail)
                                            {
                                                TCPDevice[i].Settings.WriteDataAvailable=0;
                                                TCPDevice[i].WriteBufferPoistionKeeper=0;
                                            }
                                            else
                                                TCPDevice[i].WriteBufferPoistionKeeper--;
                                        } 
                                        break;
                                    }
                                }
                            }
                            break;// </editor-fold>
                        // <editor-fold defaultstate="collapsed" desc="20418 -> Voltage Threshold Lower(2 Byte)">
                        case 20418:
                            // look through all the devices
                            for(i=0;i<ActualNumberOfTCPDevices;i++)
                            {
                                // Find the device type we need
                                if(TCPDevice[i].DeviceIs==DeviceIsBatteryManager)
                                {
                                    // Find the instance we need
                                    if(TCPDevice[i].InstanceNumber==UARTBuffer[loop].InstanceNo)
                                    {       
                                        TCPDevice[i].WriteData[TCPDevice[i].WriteBufferPoistionKeeper][0]=UARTBuffer[loop].WriteData[0];
                                        TCPDevice[i].WriteData[TCPDevice[i].WriteBufferPoistionKeeper][1]=UARTBuffer[loop].WriteData[1];

                                        TCPDevice[i].WriteAddress[TCPDevice[i].WriteBufferPoistionKeeper]=214;
                                        TCPDevice[i].AmountOf8BitRegistersToWrite[TCPDevice[i].WriteBufferPoistionKeeper]=2;

                                        // Flage that there is data to be written to
                                        TCPDevice[i].Settings.WriteDataAvailable=1;
                                        // increament the buffer counter
                                        TCPDevice[i].WriteBufferPoistionKeeper++;

                                        // check to see if we too many items remaining in the que
                                        if(TCPDevice[i].WriteBufferPoistionKeeper>=WriteBufferSize)
                                        {
                                            // if the buffer is full and the device is failed the there is no need to keep the data, flush the buffer
                                            if(TCPDevice[i].Settings.DeviceFail)
                                            {
                                                TCPDevice[i].Settings.WriteDataAvailable=0;
                                                TCPDevice[i].WriteBufferPoistionKeeper=0;
                                            }
                                            else
                                                TCPDevice[i].WriteBufferPoistionKeeper--;
                                        } 
                                        break;
                                    }
                                }
                            }
                            break;// </editor-fold>
                    }
                }// </editor-fold>
                // <editor-fold defaultstate="collapsed" desc="20800-> Gen Control">
                else if((UARTBuffer[loop].FunctionCode>=20800)&&(UARTBuffer[loop].FunctionCode<20900))
                {
                    // <editor-fold defaultstate="collapsed" desc="20804 - Control Signals (1 Byte)">
                    if(UARTBuffer[loop].FunctionCode==20804)
                    {
                        union{
                            struct{
                                unsigned All:8;
                            };
                            struct{
                                unsigned SoftwareStart:1;
                                unsigned ManualAuto:1;
                                unsigned GeneratorTest:1;
                                unsigned :5;
                            };
                        }OldDigiControl;
                        
                        // load the old state
                        OldDigiControl.All=Generator[UARTBuffer[loop].InstanceNo].DigiControl.All;
                        // Load the new 1
                        Generator[UARTBuffer[loop].InstanceNo].DigiControl.All=UARTBuffer[loop].WriteData[0];

                        if(Generator[UARTBuffer[loop].InstanceNo].DigiControl.ManualAuto!=OldDigiControl.ManualAuto)
                        {
                            if(Generator[UARTBuffer[loop].InstanceNo].DigiControl.ManualAuto)
                                Temp=35701;
                            else
                                Temp=35702;

                                if(Board.Settings.UseTheTCP)
                                {
                                    for(i=0;i<ActualNumberOfTCPDevices;i++)
                                    {
                                        if(TCPDevice[i].DeviceIs==DeviceIsTCPGenerator)
                                        {
                                            if(TCPDevice[i].InstanceNumber==1)
                                            {
                                                TCPDevice[i].WriteAddress[TCPDevice[i].WriteBufferPoistionKeeper]=4104;
                                                TCPDevice[i].AmountOf8BitRegistersToWrite[TCPDevice[i].WriteBufferPoistionKeeper]=4;

                                                TCPDevice[i].WriteData[TCPDevice[i].WriteBufferPoistionKeeper][0]=Temp>>8;
                                                TCPDevice[i].WriteData[TCPDevice[i].WriteBufferPoistionKeeper][1]=Temp;

                                                Temp^=0xFFFF;

                                                TCPDevice[i].WriteData[TCPDevice[i].WriteBufferPoistionKeeper][2]=Temp>>8;
                                                TCPDevice[i].WriteData[TCPDevice[i].WriteBufferPoistionKeeper][3]=Temp;

                                                TCPDevice[i].WriteBufferPoistionKeeper++;
                                                TCPDevice[i].Settings.WriteDataAvailable=1;
                                                break;
                                            }
                                        }
                                    }
                                }
                                else
                                {

                                        RTUDevices[0].WorkingBits.WriteDataAvaiable=1;
                                        RTUDevices[0].FunctionCodeToWrite[RTUDevices[0].WriteBufferTracker]=16;
                                        RTUDevices[0].AddressToWrite[RTUDevices[0].WriteBufferTracker]=4104;
                                        RTUDevices[0].NumberOfWordsToWrite[RTUDevices[0].WriteBufferTracker]=2;

                                        RTUDevices[0].DataToWrite[RTUDevices[0].WriteBufferTracker][0]=Temp>>8;
                                        RTUDevices[0].DataToWrite[RTUDevices[0].WriteBufferTracker][1]=Temp;

                                        Temp^=0xFFFF;

                                        RTUDevices[0].DataToWrite[RTUDevices[0].WriteBufferTracker][2]=Temp>>8;
                                        RTUDevices[0].DataToWrite[RTUDevices[0].WriteBufferTracker][3]=Temp;

                                        RTUDevices[0].WriteBufferTracker++;
                                }
                        }
                        
                        if(Generator[UARTBuffer[loop].InstanceNo].DigiControl.SoftwareStart!=OldDigiControl.SoftwareStart)
                        {
                                if(Generator[UARTBuffer[loop].InstanceNo].DigiControl.SoftwareStart)
                                    Temp=35705;
                                else
                                    Temp=35700;
                                
                                if(Board.Settings.UseTheTCP)
                                {
                                    for(i=0;i<ActualNumberOfTCPDevices;i++)
                                    {
                                        if(TCPDevice[i].DeviceIs==DeviceIsTCPGenerator)
                                        {
                                            if(TCPDevice[i].InstanceNumber==1)
                                            {
                                                TCPDevice[i].WriteAddress[TCPDevice[i].WriteBufferPoistionKeeper]=4104;
                                                TCPDevice[i].AmountOf8BitRegistersToWrite[TCPDevice[i].WriteBufferPoistionKeeper]=4;

                                                TCPDevice[i].WriteData[TCPDevice[i].WriteBufferPoistionKeeper][0]=Temp>>8;
                                                TCPDevice[i].WriteData[TCPDevice[i].WriteBufferPoistionKeeper][1]=Temp;

                                                Temp^=0xFFFF;

                                                TCPDevice[i].WriteData[TCPDevice[i].WriteBufferPoistionKeeper][2]=Temp>>8;
                                                TCPDevice[i].WriteData[TCPDevice[i].WriteBufferPoistionKeeper][3]=Temp;

                                                TCPDevice[i].WriteBufferPoistionKeeper++;
                                                TCPDevice[i].Settings.WriteDataAvailable=1;
                                                break;
                                            }
                                        }
                                    }
                                }
                                else
                                {
                                    RTUDevices[0].WorkingBits.WriteDataAvaiable=1;
                                    RTUDevices[0].FunctionCodeToWrite[RTUDevices[0].WriteBufferTracker]=16;
                                    RTUDevices[0].AddressToWrite[RTUDevices[0].WriteBufferTracker]=4104;
                                    RTUDevices[0].NumberOfWordsToWrite[RTUDevices[0].WriteBufferTracker]=2;

                                    RTUDevices[0].DataToWrite[RTUDevices[0].WriteBufferTracker][0]=Temp>>8;
                                    RTUDevices[0].DataToWrite[RTUDevices[0].WriteBufferTracker][1]=Temp;

                                    Temp^=0xFFFF;

                                    RTUDevices[0].DataToWrite[RTUDevices[0].WriteBufferTracker][2]=Temp>>8;
                                    RTUDevices[0].DataToWrite[RTUDevices[0].WriteBufferTracker][3]=Temp;

                                    RTUDevices[0].WriteBufferTracker++;
                                }
                        }

                        Interupt_Send(20804,UARTBuffer[loop].InstanceNo,Generator[UARTBuffer[loop].InstanceNo].DigiControl.All,0);
                    }// </editor-fold>
                    // <editor-fold defaultstate="collapsed" desc="20808 - Serious Alarms (1 Byte)">
                    else if(UARTBuffer[loop].FunctionCode==20808)
                    {
                        if(Board.Settings.UseTheTCP)
                        {
                            for(i=0;i<ActualNumberOfTCPDevices;i++)
                            {
                                if(TCPDevice[i].DeviceIs==DeviceIsTCPGenerator)
                                {
                                    if(TCPDevice[i].InstanceNumber==1)
                                    {
                                        Temp=35702;
                                        
                                        TCPDevice[i].WriteAddress[TCPDevice[i].WriteBufferPoistionKeeper]=4104;
                                        TCPDevice[i].AmountOf8BitRegistersToWrite[TCPDevice[i].WriteBufferPoistionKeeper]=4;
                                        
                                        TCPDevice[i].WriteData[TCPDevice[i].WriteBufferPoistionKeeper][0]=Temp>>8;
                                        TCPDevice[i].WriteData[TCPDevice[i].WriteBufferPoistionKeeper][1]=Temp;
                                        
                                        Temp^=0xFFFF;
                                        
                                        TCPDevice[i].WriteData[TCPDevice[i].WriteBufferPoistionKeeper][2]=Temp>>8;
                                        TCPDevice[i].WriteData[TCPDevice[i].WriteBufferPoistionKeeper][3]=Temp;
                                        
                                        TCPDevice[i].WriteBufferPoistionKeeper++;
                                        
                                        Temp=35700;
                                        
                                        TCPDevice[i].WriteAddress[TCPDevice[i].WriteBufferPoistionKeeper]=4104;
                                        TCPDevice[i].AmountOf8BitRegistersToWrite[TCPDevice[i].WriteBufferPoistionKeeper]=4;
                                        
                                        TCPDevice[i].WriteData[TCPDevice[i].WriteBufferPoistionKeeper][0]=Temp>>8;
                                        TCPDevice[i].WriteData[TCPDevice[i].WriteBufferPoistionKeeper][1]=Temp;                                 
                                        
                                        Temp^=0xFFFF;
                                        
                                        TCPDevice[i].WriteData[TCPDevice[i].WriteBufferPoistionKeeper][2]=Temp>>8;
                                        TCPDevice[i].WriteData[TCPDevice[i].WriteBufferPoistionKeeper][3]=Temp;
                                        
                                        TCPDevice[i].WriteBufferPoistionKeeper++;
                                        TCPDevice[i].Settings.WriteDataAvailable=1;
                                        break;
                                    }
                                }
                            }
                        }
                        else
                        {
                            Temp=35702;

                            RTUDevices[0].WorkingBits.WriteDataAvaiable=1;
                            RTUDevices[0].FunctionCodeToWrite[RTUDevices[0].WriteBufferTracker]=16;
                            RTUDevices[0].AddressToWrite[RTUDevices[0].WriteBufferTracker]=4104;
                            RTUDevices[0].NumberOfWordsToWrite[RTUDevices[0].WriteBufferTracker]=2;

                            RTUDevices[0].DataToWrite[RTUDevices[0].WriteBufferTracker][0]=Temp>>8;
                            RTUDevices[0].DataToWrite[RTUDevices[0].WriteBufferTracker][1]=Temp;

                            Temp^=0xFFFF;

                            RTUDevices[0].DataToWrite[RTUDevices[0].WriteBufferTracker][2]=Temp>>8;
                            RTUDevices[0].DataToWrite[RTUDevices[0].WriteBufferTracker][3]=Temp;

                            RTUDevices[0].WriteBufferTracker++;

                            Temp=35700;

                            RTUDevices[0].WorkingBits.WriteDataAvaiable=1;
                            RTUDevices[0].FunctionCodeToWrite[RTUDevices[0].WriteBufferTracker]=16;
                            RTUDevices[0].AddressToWrite[RTUDevices[0].WriteBufferTracker]=4104;
                            RTUDevices[0].NumberOfWordsToWrite[RTUDevices[0].WriteBufferTracker]=2;

                            RTUDevices[0].DataToWrite[RTUDevices[0].WriteBufferTracker][0]=Temp>>8;
                            RTUDevices[0].DataToWrite[RTUDevices[0].WriteBufferTracker][1]=Temp;

                            Temp^=0xFFFF;

                            RTUDevices[0].DataToWrite[RTUDevices[0].WriteBufferTracker][2]=Temp>>8;
                            RTUDevices[0].DataToWrite[RTUDevices[0].WriteBufferTracker][3]=Temp;

                            RTUDevices[0].WriteBufferTracker++;
                        }
                        
                        Generator[UARTBuffer[loop].InstanceNo].GeneratorSerious.All=0;
                                
                        Interupt_Send(20808,UARTBuffer[loop].InstanceNo,Generator[UARTBuffer[loop].InstanceNo].GeneratorSerious.All,0);
                    }// </editor-fold>
                    // <editor-fold defaultstate="collapsed" desc="20827 - Interface (1 Byte)">
                    else if(UARTBuffer[loop].FunctionCode==20827)
                    {                 
                        // 0 = TCP, 1 = RTU
                        UARTBuffer[loop].WriteData[0]^=0xFF;
                        UARTBuffer[loop].WriteData[0]&=0x01;
                        
                        EEPROMDataFunction(0,EEPROMRTUTCPSwitch,UARTBuffer[loop].WriteData[0]);
                        
                        Board.Settings.UseTheTCP=UARTBuffer[loop].WriteData[0];
                    }// </editor-fold>
                    // <editor-fold defaultstate="collapsed" desc="20829 - Baud Rate (4 Byte)">
                    else if(UARTBuffer[loop].FunctionCode==20829)
                    {
                        UINT32 Temp32=0;
                        
                        i=EEPROMRTUBaudHH;
                        
                        Temp32=UARTBuffer[loop].WriteData[0];
                        Temp32<<=8;
                        Temp32|=UARTBuffer[loop].WriteData[1];
                        Temp32<<=8;
                        Temp32|=UARTBuffer[loop].WriteData[2];
                        Temp32<<=8;
                        Temp32|=UARTBuffer[loop].WriteData[3];
                        
                        if(RTUDevices[0].RequiredBaudRate!=Temp32)
                        {
                            EEPROMDataFunction(0,i,UARTBuffer[loop].WriteData[0]);
                            i++;
                            EEPROMDataFunction(0,i,UARTBuffer[loop].WriteData[1]);
                            i++;
                            EEPROMDataFunction(0,i,UARTBuffer[loop].WriteData[2]);
                            i++;
                            EEPROMDataFunction(0,i,UARTBuffer[loop].WriteData[3]);
                            
                            RTUDevices[0].RequiredBaudRate=UARTBuffer[loop].WriteData[0];
                            RTUDevices[0].RequiredBaudRate<<=8;
                            RTUDevices[0].RequiredBaudRate|=UARTBuffer[loop].WriteData[1];
                            RTUDevices[0].RequiredBaudRate<<=8;
                            RTUDevices[0].RequiredBaudRate|=UARTBuffer[loop].WriteData[2];
                            RTUDevices[0].RequiredBaudRate<<=8;
                            RTUDevices[0].RequiredBaudRate|=UARTBuffer[loop].WriteData[3];
                        }
                    }// </editor-fold>
                    // <editor-fold defaultstate="collapsed" desc="20830 - Slave ID(1 Byte)">
                    else if(UARTBuffer[loop].FunctionCode==20830)
                    {
                        if(RTUDevices[0].SlaveAddress!=UARTBuffer[loop].WriteData[0])
                        {
                            EEPROMDataFunction(0,EEPROMRTUSlaveID,UARTBuffer[loop].WriteData[0]);
                            RTUDevices[0].SlaveAddress=UARTBuffer[loop].WriteData[0];
                        }
                    }// </editor-fold>
                }// </editor-fold>
            }// </editor-fold>
        }

        CurrentUartBufferPosition=0;
    }
}

// <editor-fold defaultstate="collapsed" desc="Initilization of the USART between DIGI and PIC">
void UARTIntilize(void)
{
    UARTTX_TRIS=0;              //Transmit output
    UARTRX_TRIS=1;              //Recieve input

    // <editor-fold defaultstate="collapsed" desc="Set UART 1, TX and RX only 8bits Data, no parity, 1 stop bit.">
    UARTConfigure(UART1, UART_ENABLE_PINS_TX_RX_ONLY);
    UARTSetFifoMode(UART1, UART_INTERRUPT_ON_TX_NOT_FULL | UART_INTERRUPT_ON_RX_NOT_EMPTY);
    UARTSetLineControl(UART1, UART_DATA_SIZE_8_BITS | UART_PARITY_NONE | UART_STOP_BITS_1);
    UARTSetDataRate(UART1, GetPeripheralClock(), DESIRED_BAUDRATE);
    UARTEnable(UART1, UART_ENABLE_FLAGS(UART_PERIPHERAL | UART_RX | UART_TX));
    // </editor-fold>

    // <editor-fold defaultstate="collapsed" desc="Configure UART1 RX Interrupt and disable TX interrupt">
    INTEnable(INT_SOURCE_UART_RX(UART1), INT_ENABLED);
    INTEnable(INT_SOURCE_UART_TX(UART1), INT_DISABLED);
    INTSetVectorPriority(INT_VECTOR_UART(UART1), INT_PRIORITY_LEVEL_2);
    INTSetVectorSubPriority(INT_VECTOR_UART(UART1), INT_SUB_PRIORITY_LEVEL_0);
    
    INTConfigureSystem(INT_SYSTEM_CONFIG_MULT_VECTOR);      // configure for multi-vectored mode

    INTEnableInterrupts();      // enable interrupts
    // </editor-fold>
    
    CurrentUartBufferPosition=0;
}// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Function to send data to DIGI">
void SendToDigi(UINT8 TXDataLength,BOOL SendFunction)
{
    UINT8 e,i;
    UINT8 TempH,TempL;

    e=0;

    if(SendFunction)
    {
        // <editor-fold defaultstate="collapsed" desc="Send Higher Byte">
        UARTIsTXReady();

        TempL=SendFunctionCode;
        TempH=SendFunctionCode>>8;

        TempH|=0x80;

        UARTSendDataByte(UART1, TempH);

        UARTHasSentMessage();
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Send Function Lower Byte">
        UARTIsTXReady();

        UARTSendDataByte(UART1, TempL);

        UARTHasSentMessage();
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Send instance NO.">
        UARTIsTXReady();

        UARTSendDataByte(UART1, InstanceNoToSend);

        UARTHasSentMessage();
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Send Number of bytes">
        UARTIsTXReady();

        UARTSendDataByte(UART1, TXDataLength);

        UARTHasSentMessage();
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Send Data">
        for(i=0;i<TXDataLength;i++,e++)
        {
            UARTIsTXReady();

            UARTSendDataByte(UART1, UARTSWBuffer[e]);

            UARTHasSentMessage();
        }// </editor-fold>
    }
    else
    {
        // <editor-fold defaultstate="collapsed" desc="Send Data Bytes only">
        for(i=0;i<TXDataLength;i++,e++)
        {
            UARTIsTXReady();

            UARTSendDataByte(UART1, UARTSWBuffer[e]);

            UARTHasSentMessage();
        }// </editor-fold>
    }
}
// <editor-fold defaultstate="collapsed" desc="IS the transmiter ready">
BOOL UARTIsTXReady(void)
    {
    UINT16 Timeout;

    Timeout=0;

    while(!UARTTransmitterIsReady(UART1))
    {
        Timeout++;

        if(Timeout>1000)
            return 0;
    }

    return 1;
}// </editor-fold>
// <editor-fold defaultstate="collapsed" desc="Has the transmition of the message gone ok">
BOOL UARTHasSentMessage(void)
{
    UINT16 Timeout;

    Timeout=0;

    while(!UARTTransmissionHasCompleted(UART1))
    {
        Timeout++;

        if(Timeout>1000)
            return 0;
    }

    return 1;
}// </editor-fold>
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Message Assemble as a message comes in from interupt">
void MessageAssemble(void)
{
    static UINT8 RW,DataLength;
    
    // <editor-fold defaultstate="collapsed" desc="Initilization">
    static UINT8 TempDataLength;
    static UINT8 RXBuffer[10];
    const UINT16 ComSTimeOut=50;
    static UINT8 TimerCheck;
    static UINT8 WriteDataPlaceHolder=0;
    static UINT32 InitialTimer;

    static enum _MessageState
    {
            MSByte_Function_Code = 0,
            LSByte_Function_Code,
            InstanceByte,
            DataLenghtByte,
            DataByte
    } MessageState = MSByte_Function_Code;
    // </editor-fold>

    // <editor-fold defaultstate="collapsed" desc="Message timeout timer">
    if(MessageState!=0)
    {
        TimerCheck=TickGet()-InitialTimer;

        if(TimerCheck>ComSTimeOut)
        {
            TimerCheck=0;
            MessageState=0;
        }
    }// </editor-fold>

    switch(MessageState)
    {
        // <editor-fold defaultstate="collapsed" desc="Catch the MSB of the Function Code">
        case MSByte_Function_Code:
            // Get the message from hardware buffer
            RXBuffer[0]=UARTGetDataByte(UART1);

            // Get the timer value so we don't wait to long for the messages to arrive
            InitialTimer=TickGet();

            // MSB contains the Read/Write bit on the last bit
            RW=RXBuffer[0];
            RW&=0x80;
            RW=RW>>7;

            // Wait for the LSB to arrive
            MessageState++;
            break;
            // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Catch the LSB of the Function Code">
        case LSByte_Function_Code:
            // Get the message from the hardware buffer
            RXBuffer[1]=UARTGetDataByte(UART1);

            // From the MSB recieved earlier remove the Read/Write bit and join it to the LSB to get the full Function code
            RXBuffer[0]&=0x7f;
            UARTBuffer[CurrentUartBufferPosition].FunctionCode=RXBuffer[0]<<8;
            UARTBuffer[CurrentUartBufferPosition].FunctionCode=UARTBuffer[CurrentUartBufferPosition].FunctionCode|RXBuffer[1];

            // Wait for the Instance Number to arrive
            MessageState++;
            break;
            // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Catch the Instance number">
        case InstanceByte:
            // Get the message from the Hardware buffer
            UARTBuffer[CurrentUartBufferPosition].InstanceNo=UARTGetDataByte(UART1);

            // This is when the DIGI wants us to enter bootLoader State
            if((UARTBuffer[CurrentUartBufferPosition].FunctionCode==16)&&(UARTBuffer[CurrentUartBufferPosition].InstanceNo==255))
            {
                EEPROMWriteData(EEPROMEnterBootloader,1);
                Reset();   
            }
            
            // <editor-fold defaultstate="collapsed" desc="Write request recieved">
            if(RW==1)
            {
                if((UARTBuffer[CurrentUartBufferPosition].FunctionCode==44)||(UARTBuffer[CurrentUartBufferPosition].FunctionCode==45))
                {
                    MessageState=DataByte;
                    DataLength=1;
                    WriteDataPlaceHolder=0;
                    TempDataLength=DataLength;
                }
                else
                    // Wait for the amount of write data byte to come in
                    MessageState=DataLenghtByte;
                break;
            }// </editor-fold>
            // <editor-fold defaultstate="collapsed" desc="Read request">
            else
            {
                // <editor-fold defaultstate="collapsed" desc="Special function read request go to data length to recieve more data">
                if((UARTBuffer[CurrentUartBufferPosition].FunctionCode==20)||(UARTBuffer[CurrentUartBufferPosition].FunctionCode==21))
                {
                    MessageState=DataLenghtByte;
                    break;
                }// </editor-fold>
                // <editor-fold defaultstate="collapsed" desc="Normal message read request">
                else
                {
                    // all nessarry data has been recieved clear the state machine, flag message recieved
                    MessageState=0;
                    UARTBuffer[CurrentUartBufferPosition].ReadDataRecieved=1;
                    CurrentUartBufferPosition++;
                    break;
                }// </editor-fold>
            }// </editor-fold>
            // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Catch the Datalength for write request, or more data for special function">
        case DataLenghtByte:
            // get the message from the buffer
            DataLength=UARTGetDataByte(UART1);

            if((UARTBuffer[CurrentUartBufferPosition].FunctionCode==20)||(UARTBuffer[CurrentUartBufferPosition].FunctionCode==21))
            {
                UARTBuffer[CurrentUartBufferPosition].DeviceType=DataLength;
                MessageState=0;
                UARTBuffer[CurrentUartBufferPosition].ReadDataRecieved=1;
                CurrentUartBufferPosition++;
                break;
            }
            else
            {
                if(DataLength==0)
                {
                    MessageState=0;
                    UARTBuffer[CurrentUartBufferPosition].WriteDataRecieved=1;
                    CurrentUartBufferPosition++;
                    break;
                }
                else
                {
                    WriteDataPlaceHolder=0;
                    TempDataLength=DataLength;
                    MessageState++;
                    break;
                }
            }// </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Get the Write data">
        case DataByte:
            // Check to see if there is more data coming in then we can handle
            if(WriteDataPlaceHolder>=UARTWriteDataBufferSize)
            {
                // Eat the byte
                TempDataLength=UARTGetDataByte(UART1);
                TempDataLength=0;
                UARTBuffer[CurrentUartBufferPosition].WriteDataRecieved=0;
                return;
            }
            
            // Get the Data from the Hardware Buffer
            UARTBuffer[CurrentUartBufferPosition].WriteData[WriteDataPlaceHolder]=UARTGetDataByte(UART1);

            TempDataLength--;
            WriteDataPlaceHolder++;

            if(TempDataLength==0)
            {
                WriteDataPlaceHolder=0;
                MessageState=0;
                UARTBuffer[CurrentUartBufferPosition].WriteDataRecieved=1;
                CurrentUartBufferPosition++;
                break;
            }

            break;
            // </editor-fold>
    }
}// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Interupt the digi on events of changeover">
void Interupt_Send(UINT16 Function,UINT8 ID, UINT8 Data,UINT8 DeviceType)
{
    if(Function==21)
    {
        Function|=0x8000;

        UARTSWBuffer[4]=Data;               // Data
        UARTSWBuffer[3]=DeviceType;         // byte of Data
        UARTSWBuffer[2]=ID;                 // ID as 1
        UARTSWBuffer[1]=Function;
        UARTSWBuffer[0]=(Function>>8);
        SendToDigi(5,0);                      // Five Byte to send
    }
    else
    {
        Function|=0x8000;

        UARTSWBuffer[4]=Data;               // Data
        UARTSWBuffer[3]=1;                  // byte of Data
        UARTSWBuffer[2]=ID;                 // ID as 1
        UARTSWBuffer[1]=Function;
        UARTSWBuffer[0]=(Function>>8);
        SendToDigi(5,0);                      // Five Byte to send
    }
}
// </editor-fold>
// <editor-fold defaultstate="collapsed" desc="Interupt the digi with 2 byte">
void Interupt_Send2Bytes(UINT16 Function,UINT8 ID, UINT8 DataH,UINT8 DataL)
{
    Function|=0x8000;

    UARTSWBuffer[5]=DataL;               // Data
    UARTSWBuffer[4]=DataH;               // Data
    UARTSWBuffer[3]=1;                  // byte of Data
    UARTSWBuffer[2]=ID;                 // ID as 1
    UARTSWBuffer[1]=Function;
    UARTSWBuffer[0]=(Function>>8);
    SendToDigi(6,0);                      // Five Byte to send
}
void Interupt_Send_Word(UINT16 Function,UINT8 ID, UINT32 Data)
{
    UINT8 Size;
    
    Size=2;
    
    if(Function==1509)
        Size=1;
    else if(Function==1511)
        Size=4;
    
    Function|=0x8000;

    if(Size==4)
    {
        UARTSWBuffer[7]=Data;               // Data
        UARTSWBuffer[6]=Data>>8;               // Data
        UARTSWBuffer[5]=Data>>16;               // Data
        UARTSWBuffer[4]=Data>>24;               // Data
    }
    else if(Size==3)
    {
        UARTSWBuffer[6]=Data;               // Data
        UARTSWBuffer[5]=Data>>8;               // Data
        UARTSWBuffer[4]=Data>>16;               // Data
    }
    else if(Size==2)
    {
        UARTSWBuffer[5]=Data;               // Data
        UARTSWBuffer[4]=Data>>8;               // Data
    }
    else if(Size==1)
    {
        UARTSWBuffer[4]=Data;               // Data
    }
    
    UARTSWBuffer[3]=Size;                  // byte of Data
    UARTSWBuffer[2]=ID;                 // ID as 1
    UARTSWBuffer[1]=Function;
    UARTSWBuffer[0]=(Function>>8);
    
    SendToDigi((4+Size),0);                      // Five Byte to send
}
// </editor-fold>
// <editor-fold defaultstate="collapsed" desc="Interupt the digi on events and send Array">
void InteruptArray_Send(UINT16 Function,UINT8 ID, UINT8 Data1,UINT8 Data2,UINT8 Data3,UINT8 Data4,UINT8 Data5,UINT8 Data6,UINT8 Data7,UINT8 Data8)
{
    Function|=0x8000;

    UARTSWBuffer[11]=Data8;              // Data
    UARTSWBuffer[10]=Data7;              // Data
    UARTSWBuffer[9]=Data6;               // Data
    UARTSWBuffer[8]=Data5;               // Data
    UARTSWBuffer[7]=Data4;               // Data
    UARTSWBuffer[6]=Data3;               // Data
    UARTSWBuffer[5]=Data2;               // Data
    UARTSWBuffer[4]=Data1;               // Data
    UARTSWBuffer[3]=8;                   // byte of Data
    UARTSWBuffer[2]=1+ID;                 // ID as 1
    UARTSWBuffer[1]=Function;
    UARTSWBuffer[0]=(Function>>8);
    SendToDigi(12,0);                      // Five Byte to send
}// </editor-fold>
// <editor-fold defaultstate="collapsed" desc="Send array to Digi">
void ArraySendtoDigi(UINT16 Function,UINT8 ID,UINT8 AmountToSend,UINT8 Data[])
{
    UINT8 i;
    
    if(Function==44)
    {
        // Add write bit
        Function|=0x8000;
        // load the function code
        UARTSWBuffer[0]=(Function>>8);
        UARTSWBuffer[1]=Function;
        // Instance Number to Send
        UARTSWBuffer[2]=ID;             
        
        for(i=0;i<AmountToSend;i++)
            UARTSWBuffer[3+i]=Data[i];
        
        SendToDigi(3+AmountToSend,0);  
    }
    else
    {
        // Add write bit
        Function|=0x8000;
        // load the function code
        UARTSWBuffer[0]=(Function>>8);
        UARTSWBuffer[1]=Function;
        // Instance Number to Send
        UARTSWBuffer[2]=ID;             
        // Amount of Data bytes to send
        UARTSWBuffer[3]=AmountToSend; 

        for(i=0;i<AmountToSend;i++)
            UARTSWBuffer[4+i]=Data[i];

        SendToDigi(4+AmountToSend,0);  
    }
}// </editor-fold>
