/**********************************************************************
 * 2020 Master Power Technology
 *
 * FileName:        USART Setup.c
 * Processor:       PIC32MX795F512L
 * Linker:          MPLINK 4.37+
 * Compiler:        C32 v3.36+
 *
 * REVISION HISTORY:
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Author        Date      	Comments on this revision
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Pascal C.    ?/?/2020	First release of source file
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *
 * ADDITIONAL NOTES:
 * Code Tested on:
 *
 * DESCRIPTION:
 * USART Setup and running
 *********************************************************************/

#include "TCPIP.h"
#define Baud            115200
//#define TestString      "123456789 Micro is Talking 123456789 This is test Data 123456789 please send it all 123456789 Still more text to see how much we can send 12345679"
extern APP_CONFIG AppConfig;

// Prototypes
void USARTSetup(void);
void UARTHasSentMessage(void);
void UARTIsTXReady(void);
void SendData(UINT8 Data[],UINT8 FunctionCode, UINT8 Operation);
void MakeStringAndSend(void);
void MakeMessage(void);
void SendDataToPITask(void);
void SendCmd(UINT8 FunctionCode, UINT8 Operation);
void HandleReceivedMessage(void);
BYTE * StringIP(UINT8 IP[]);
BYTE * StringMAC(UINT8 MAC[]);

void SerialTask(void)
{
//    static DWORD FunctionTimer = 0;
    
    if(PIConnection.Bits.Configured == 0){
        // Clear all the bits
        PIConnection.Bits.All=0;
        // Setup u baud rates
        USARTSetup();
        // set flag as done
        PIConnection.Bits.Configured = 1;
//        SendData((UINT8*)TestString,'1','r');
    }else{
        if(PIConnection.Bits.MessageRecieved){
            HandleReceivedMessage();
            PIConnection.Bits.MessageRecieved = 0;
        }
        
        SendDataToPITask();
    }
}

// <editor-fold defaultstate="collapsed" desc="Send data to the PI">
void SendDataToPITask(void){
    if(Board.PiFi.Working.AskPIWIFIData){
        Board.PiFi.Working.AskPIWIFIData = 0;
        
        SendCmd(PICode_ScanWifi,PIMicro_Get_Request);
    }else if(Board.PiFi.Working.GetWIFIConnectionStatus){
        Board.PiFi.Working.GetWIFIConnectionStatus = 0;
        
        SendCmd(PICode_GetWIFIConnectionStatus,PIMicro_Get_Request);
    }else if(Board.PiFi.Working.GetNextSSID){
        Board.PiFi.Working.GetNextSSID = 0;
        
        SendCmd(PICode_GetNextSSID,PIMicro_Get_Request);
    }else if(Board.PiFi.Working.DisconnectPIWIFI){
        Board.PiFi.Working.DisconnectPIWIFI = 0;
        
        SendCmd(PICode_WIFIDisconnect,PIMicro_Set_Request);
    }else if(Board.PiFi.Working.SendPIWifiDetails){
        Board.PiFi.Working.SendPIWifiDetails = 0;
        
        SendData(Board.PiFi.SSIDtoConnectTo,PICode_WIFISSID,PIMicro_Set_Request);
        SendData(Board.PiFi.SSIDPasstoConnectTo,PICode_WIFISSIDPass,PIMicro_Set_Request);
    }
}// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Recieved Data Handler">
void HandleReceivedMessage(void){   
    char buffer[10]={0};
    UINT8 i;
    
    if(PIConnection.Bits.SetMessgeReceived == 0){// Get message   
        switch(PIConnection.RecievedFunctionCode){
            case PICode_MeterData:
                MakeStringAndSend();
                break;
            case PICode_MicroHostname:
                SendData(Board.ControllerName,PIConnection.RecievedFunctionCode,PIMicro_Responce_Request);
                break;
            case PICode_MicroIP:
                SendData(StringIP(Board.MYIP),PIConnection.RecievedFunctionCode,PIMicro_Responce_Request);
                break;
            case PICode_MicroSubnet:
                SendData(StringIP(Board.MYMASK),PIConnection.RecievedFunctionCode,PIMicro_Responce_Request);
                break;
            case PICode_MicroGateway:
                SendData(StringIP(Board.MYGate),PIConnection.RecievedFunctionCode,PIMicro_Responce_Request);
                break;
            case PICode_MicroMACAddress:
                SendData(StringMAC(AppConfig.MyMACAddr.v),PIConnection.RecievedFunctionCode,PIMicro_Responce_Request);
                break;
            case PICode_MicroCodeVersion:
                SendData((UINT8 *)CodeVersion,PIConnection.RecievedFunctionCode,PIMicro_Responce_Request);
                break;
            case PICode_MicroPrimaryCT:
                itoa(buffer,Board.MeterMeasurements.PrimaryCT,10);   // here 10 means decimal
                SendData((UINT8 *)buffer,PIConnection.RecievedFunctionCode,PIMicro_Responce_Request);
                break;
            case PICode_MicroSecondayCT:
                itoa(buffer,Board.MeterMeasurements.SecondaryCT,10);   // here 10 means decimal
                SendData((UINT8 *)buffer,PIConnection.RecievedFunctionCode,PIMicro_Responce_Request);
                break;
            case PICode_MicroVoltageUpperTH:
                itoa(buffer,Board.MeterThreshold.VoltageUpper,10);   // here 10 means decimal
                SendData((UINT8 *)buffer,PIConnection.RecievedFunctionCode,PIMicro_Responce_Request);
                break;
            case PICode_MicroVoltageLowerTH:
                itoa(buffer,Board.MeterThreshold.VoltageLower,10);   // here 10 means decimal
                SendData((UINT8 *)buffer,PIConnection.RecievedFunctionCode,PIMicro_Responce_Request);
                break;
            case PICode_MicroVoltageHysteris:
                itoa(buffer,Board.MeterThreshold.PrecentageVoltageHysterisis,10);   // here 10 means decimal
                SendData((UINT8 *)buffer,PIConnection.RecievedFunctionCode,PIMicro_Responce_Request);
                break;
            case PICode_MicroFrequenUpperTH:
                itoa(buffer,Board.MeterThreshold.FrequencyUpper,10);   // here 10 means decimal
                SendData((UINT8 *)buffer,PIConnection.RecievedFunctionCode,PIMicro_Responce_Request);
                break;
            case PICode_MicroFrequenLowerTH:
                itoa(buffer,Board.MeterThreshold.FrequencyLower,10);   // here 10 means decimal
                SendData((UINT8 *)buffer,PIConnection.RecievedFunctionCode,PIMicro_Responce_Request);
                break;
            case PICode_MicroFrequenHysteris:
                itoa(buffer,Board.MeterThreshold.PrecentageFrequencyHysterisis,10);   // here 10 means decimal
                SendData((UINT8 *)buffer,PIConnection.RecievedFunctionCode,PIMicro_Responce_Request);
                break;
            case PICode_MicroCurrentTH:
                itoa(buffer,Board.MeterThreshold.Current,10);   // here 10 means decimal
                SendData((UINT8 *)buffer,PIConnection.RecievedFunctionCode,PIMicro_Responce_Request);
                break;
            case PICode_MicroCanID:
                itoa(buffer,Board.BoardID,10);   // here 10 means decimal
                SendData((UINT8 *)buffer,PIConnection.RecievedFunctionCode,PIMicro_Responce_Request);
                break;
            case PICode_MicroSettings:
                itoa(buffer,Board.Settings.All,10);   // here 10 means decimal
                SendData((UINT8 *)buffer,PIConnection.RecievedFunctionCode,PIMicro_Responce_Request);
                break;
        }
    }else{
        switch(PIConnection.RecievedFunctionCode){
            case PICode_WIFISSID:               
                memset(Board.PiFi.WIFISSIDName,0,40);
                
                for(i = 0;i < PIConnection.AmountOfDataBytesRecevied;i++)
                    Board.PiFi.WIFISSIDName[i] = PIConnection.RecievedData[i];
                Board.PiFi.Working.GotNewSSIDName = 1;
                break;
            case PICode_GetWIFIConnectionStatus:                     
                memset(Board.PiFi.SSIDConnectedTo,0,40);
                
                for(i = 0;i < PIConnection.AmountOfDataBytesRecevied;i++)
                    Board.PiFi.SSIDConnectedTo[i] = PIConnection.RecievedData[i];
                Board.PiFi.Working.ReceivedConnectionStatus = 1;
                break;
            
        }
    }
}// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="MAC to string Helper">
BYTE * StringMAC(UINT8 MAC[]){
    BYTE digits[10]={0};
    UINT8 i;
    static BYTE FullMacString[20]={0};
    
    strcpy((char *)FullMacString," ");
    
    for(i=0;i<6;i++){
        sprintf((char *)digits,"%02X",MAC[i]);
        strcat((char *)FullMacString,(char *)digits);
        
        if(i<5)
            strcat((char *)FullMacString,"-");
    }
    strcat((char *)FullMacString,",");
    
    return FullMacString; 
}// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="IP to comma seperated String helper">
BYTE * StringIP(UINT8 IP[]){
    BYTE digits[10]={0};
    UINT8 i;
    static BYTE FullString[20]={0};
    
    strcpy((char *)FullString," ");
    
    for(i=0;i<4;i++){
        sprintf((char *)digits,"%ud",IP[i]);
        strcat((char *)FullString,(char *)digits);
        strcat((char *)FullString,",");
    }
    
    return FullString;
}// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Make up the meter data string">
void MakeStringAndSend(void){
    BYTE digits[20]={0};
    UINT8 i;
    BYTE FullString[400]={0};

    // Start with a ,
    strcpy((char *)FullString," ");
    
    for(i=0;i<3;i++){
        sprintf((char *)digits,"%.2f",(double)(Board.MeterMeasurements.Voltage[i]));
        strcat((char *)FullString,(char *)digits);
        strcat((char *)FullString,",");
    }
    
    for(i=0;i<3;i++){
        sprintf((char *)digits,"%.2f",(double)(Board.MeterMeasurements.Current[i]));
        strcat((char *)FullString,(char *)digits);
        strcat((char *)FullString,",");
    }
    
    for(i=0;i<3;i++){
        sprintf((char *)digits,"%ld",(INT32)(Board.MeterMeasurements.ActivePower[i]));
        strcat((char *)FullString,(char *)digits);
        strcat((char *)FullString,",");
    }
    
    for(i=0;i<3;i++){
        sprintf((char *)digits,"%ld",(INT32)(Board.MeterMeasurements.ReactivePower[i]));
        strcat((char *)FullString,(char *)digits);
        strcat((char *)FullString,",");
    }
    
    for(i=0;i<3;i++){
        sprintf((char *)digits,"%ld",(INT32)(Board.MeterMeasurements.ApparentPower[i]));
        strcat((char *)FullString,(char *)digits);
        strcat((char *)FullString,",");
    }
    
    for(i=0;i<3;i++){
        sprintf((char *)digits,"%.4f",((double)Board.MeterMeasurements.PowerFactor[i]));
        strcat((char *)FullString,(char *)digits);
        strcat((char *)FullString,",");
    }
    
    for(i=0;i<3;i++){
        sprintf((char *)digits,"%.3f",(double)(Board.MeterMeasurements.HDV[i]));
        strcat((char *)FullString,(char *)digits);
        strcat((char *)FullString,",");
    }
    
    for(i=0;i<3;i++){
        sprintf((char *)digits,"%.3f",(double)(Board.MeterMeasurements.HDI[i]));
        strcat((char *)FullString,(char *)digits);
        strcat((char *)FullString,",");
    }
    
    sprintf((char *)digits,"%ld",(INT32)(Board.MeterMeasurements.TotalActivePower));
    strcat((char *)FullString,(char *)digits);
    strcat((char *)FullString,",");
    
    sprintf((char *)digits,"%ld",(INT32)(Board.MeterMeasurements.TotalReactivePower));
    strcat((char *)FullString,(char *)digits);
    strcat((char *)FullString,",");
    
    sprintf((char *)digits,"%ld",(INT32)(Board.MeterMeasurements.TotalApparentPower));
    strcat((char *)FullString,(char *)digits);
    strcat((char *)FullString,",");
    
    sprintf((char *)digits,"%.4f",(double)(Board.MeterMeasurements.TotalPowerFactor));
    strcat((char *)FullString,(char *)digits);
    strcat((char *)FullString,",");
    
    sprintf((char *)digits,"%.3f",(double)(Board.MeterMeasurements.THDV));
    strcat((char *)FullString,(char *)digits);
    strcat((char *)FullString,",");
    
    sprintf((char *)digits,"%.3f",(double)(Board.MeterMeasurements.THDI));
    strcat((char *)FullString,(char *)digits);
    strcat((char *)FullString,",");
    
    sprintf((char *)digits,"%.3f",(double)(Board.MeterMeasurements.Frequency));
    strcat((char *)FullString,(char *)digits);
    strcat((char *)FullString,",");
    
    sprintf((char *)digits,"%ld",Board.MeterMeasurements.ActiveEnergyAccumulation);
    strcat((char *)FullString,(char *)digits);
    strcat((char *)FullString,",");
    
    sprintf((char *)digits,"%ld",Board.MeterMeasurements.ReactiveEnergyAccumulation);
    strcat((char *)FullString,(char *)digits);
    strcat((char *)FullString,",");
    
    sprintf((char *)digits,"%ld",Board.MeterMeasurements.ApparentEnergyAccumulation);
    strcat((char *)FullString,(char *)digits);
    strcat((char *)FullString,",");
    
    for(i=0;i<3;i++){
        sprintf((char *)digits,"%.2f",(double)(Board.MeterMeasurements.PhaseVoltageAngles[i]));
        strcat((char *)FullString,(char *)digits);
        strcat((char *)FullString,",");
    }
    
    for(i=0;i<3;i++){
        sprintf((char *)digits,"%.2f",(double)(Board.MeterMeasurements.PhaseCurrentAngles[i]));
        strcat((char *)FullString,(char *)digits);
        strcat((char *)FullString,",");
    }
        
    sprintf((char *)digits,"%u",Board.MeterMeasurements.BussStatus.All);
    strcat((char *)FullString,(char *)digits);
    strcat((char *)FullString,",");
    
    SendData((UINT8*)FullString,PICode_MeterData,'r');
}// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Interupt Service routine">
//void __ISR(_UART_4_VECTOR, ipl2AUTO) IntUart4Handler(void)
void __ISR(_UART_4_VECTOR, ipl2) IntUart4Handler(void)
{
    // <editor-fold defaultstate="collapsed" desc="RX interupt service">
    if(INTGetFlag(INT_SOURCE_UART_RX(UART4)))
    {
        MakeMessage();   
        // Clear the interupt flag
        INTClearFlag(INT_SOURCE_UART_RX(UART4));        // Clear the RX interupt flag
    }// </editor-fold>
    // <editor-fold defaultstate="collapsed" desc="TX Interupt service">
    else if ( INTGetFlag(INT_SOURCE_UART_TX(UART4)) )
    {
        INTClearFlag(INT_SOURCE_UART_TX(UART4));        // Clear th TX interupt flag
//        DisableIntUTX;
    }// </editor-fold>
    
    // Check for the overrun on the UART
    if(U4STAbits.OERR)
        U4STAbits.OERR=0;
}// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Message Assemeble">
void MakeMessage(void){
    static enum _MessageState{
        CallType = 0,
        Comma,
        FunctionCode,
        PIData,
    } MessageState = CallType;
    
    UINT8 Data;
    static DWORD InitialTimer = 0;
    

    // <editor-fold defaultstate="collapsed" desc="Message timeout timer">
    if(MessageState > 0)
    {
        if(TickGet() - InitialTimer >= TICK_SECOND/4ul){
            MessageState = CallType;
        }
    }// </editor-fold>
    
    switch(MessageState){
        case CallType:
            Data=UARTGetDataByte(UART4);
            
            if(Data == 'g') //get
                PIConnection.Bits.SetMessgeReceived = 0;
            else if(Data == 's') //set
                PIConnection.Bits.SetMessgeReceived = 1;
            // Get the timer value so we don't wait to long for the messages to arrive
            InitialTimer=TickGet();
            // Move to next
            MessageState++;
            break;
        case Comma:
            Data=UARTGetDataByte(UART4);
            // Get the timer value so we don't wait to long for the messages to arrive
            InitialTimer=TickGet();
            // Move to next
            MessageState++;
            break;
        case FunctionCode:
            PIConnection.RecievedFunctionCode=UARTGetDataByte(UART4);
            // if it is a get request there is nothing after
            if(PIConnection.Bits.SetMessgeReceived==0){
                PIConnection.Bits.MessageRecieved = 1;
                MessageState = CallType;
            }else{
                // Get the timer value so we don't wait to long for the messages to arrive
                InitialTimer=TickGet();
                // Move to next
                MessageState++;
                memset(PIConnection.RecievedData,0,40);
                PIConnection.AmountOfDataBytesRecevied=0;
            }
            break;
        case PIData:
            Data = UARTGetDataByte(UART4);
            
            if(Data == '\n'){
                PIConnection.Bits.MessageRecieved = 1;
                MessageState = CallType;
            }else{
                PIConnection.RecievedData[PIConnection.AmountOfDataBytesRecevied] = Data;
                PIConnection.AmountOfDataBytesRecevied++;
            }
            
            // Get the timer value so we don't wait to long for the messages to arrive
            InitialTimer=TickGet();
            
            break;
        default:
            Data=UARTGetDataByte(UART4);
            MessageState=0;
            break;
    }
}// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="UART Setup">
void USARTSetup(void)
{
    UARTTX_TRIS=0;              //Transmit output
    UARTRX_TRIS=1;              //Recieve input

    UARTConfigure(UART4, UART_ENABLE_PINS_TX_RX_ONLY);
    UARTSetFifoMode(UART4, UART_INTERRUPT_ON_TX_NOT_FULL | UART_INTERRUPT_ON_RX_NOT_EMPTY);
    UARTSetLineControl(UART4, UART_DATA_SIZE_8_BITS | UART_PARITY_NONE | UART_STOP_BITS_1);
    UARTSetDataRate(UART4, GetPeripheralClock(), Baud);
    UARTEnable(UART4, UART_ENABLE_FLAGS(UART_PERIPHERAL | UART_RX | UART_TX));

    INTEnable(INT_SOURCE_UART_RX(UART4), INT_ENABLED);
    INTEnable(INT_SOURCE_UART_TX(UART4), INT_DISABLED);
    INTSetVectorPriority(INT_VECTOR_UART(UART4), INT_PRIORITY_LEVEL_2);
    INTSetVectorSubPriority(INT_VECTOR_UART(UART4), INT_SUB_PRIORITY_LEVEL_0);
    
    INTConfigureSystem(INT_SYSTEM_CONFIG_MULT_VECTOR);      // configure for multi-vectored mode

    INTEnableInterrupts();      // enable interrupts
}// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="IS the transmiter ready">
void UARTIsTXReady(void){
    UINT16 Timeout = 0;

    while(!UARTTransmitterIsReady(UART4))
    {
        Timeout++;

        if(Timeout>1000)
            return;
    }
}// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Has the transmition of the message gone ok">
void UARTHasSentMessage(void){
    UINT16 Timeout = 0;

    while(!UARTTransmissionHasCompleted(UART4))
    {
        Timeout++;

        if(Timeout>1000)
            return;
    }
}// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Send a command to the PI">
void SendCmd(UINT8 FunctionCode, UINT8 Operation){
    
    UARTSendDataByte(UART4, Operation);
    UARTIsTXReady();
    UARTSendDataByte(UART4, ',');
    UARTIsTXReady();
    UARTSendDataByte(UART4, FunctionCode);
    UARTIsTXReady();
    UARTSendDataByte(UART4, ',');
    UARTIsTXReady();
    
    UARTSendDataByte(UART4, '\r');
    UARTIsTXReady();
    UARTSendDataByte(UART4, '\n');
    UARTHasSentMessage();
}// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Sending Data to the PI">
void SendData(UINT8 Data[],UINT8 FunctionCode, UINT8 Operation){
    UINT16 i = 0;
    
    if(Data[0] == '\0')
        return;
    
    UARTSendDataByte(UART4, Operation);
    UARTIsTXReady();
    UARTSendDataByte(UART4, ',');
    UARTIsTXReady();
    UARTSendDataByte(UART4, FunctionCode);
    UARTIsTXReady();
    UARTSendDataByte(UART4, ',');
    UARTIsTXReady();
    
    do{
        UARTIsTXReady();

        UARTSendDataByte(UART4, Data[i]);

        UARTHasSentMessage();
        
        i++;
        
        // Message limit
        if(i > 300)
            break;
    }while(Data[i] != '\0');
    
    UARTSendDataByte(UART4, '\r');
    UARTIsTXReady();
    UARTSendDataByte(UART4, '\n');
    UARTHasSentMessage();
}// </editor-fold>