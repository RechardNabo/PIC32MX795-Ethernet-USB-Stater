/*********************************************************************
 *
 *  Application to Demo HTTP2 Server
 *  Support for HTTP2 module in Microchip TCP/IP Stack
 *	 -Implements the application
 *	 -Reference: RFC 1002
 *
 *********************************************************************
 * FileName:        CustomHTTPApp.c
 * Dependencies:    TCP/IP stack
 * Processor:       PIC18, PIC24F, PIC24H, dsPIC30F, dsPIC33F, PIC32
 * Compiler:        Microchip C32 v1.05 or higher
 *					Microchip C30 v3.12 or higher
 *					Microchip C18 v3.30 or higher
 *					HI-TECH PICC-18 PRO 9.63PL2 or higher
 * Company:         Microchip Technology, Inc.
 *
 * Software License Agreement
 *
 * Copyright (C) 2002-2010 Microchip Technology Inc.  All rights
 * reserved.
 *
 * Microchip licenses to you the right to use, modify, copy, and
 * distribute:
 * (i)  the Software when embedded on a Microchip microcontroller or
 *      digital signal controller product ("Device") which is
 *      integrated into Licensee's product; or
 * (ii) ONLY the Software driver source files ENC28J60.c, ENC28J60.h,
 *		ENCX24J600.c and ENCX24J600.h ported to a non-Microchip device
 *		used in conjunction with a Microchip ethernet controller for
 *		the sole purpose of interfacing with the ethernet controller.
 *
 * You should refer to the license agreement accompanying this
 * Software for additional information regarding your rights and
 * obligations.
 *
 * THE SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT
 * WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT
 * LIMITATION, ANY WARRANTY OF MERCHANTABILITY, FITNESS FOR A
 * PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT SHALL
 * MICROCHIP BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR
 * CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF
 * PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
 * BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE
 * THEREOF), ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER
 * SIMILAR COSTS, WHETHER ASSERTED ON THE BASIS OF CONTRACT, TORT
 * (INCLUDING NEGLIGENCE), BREACH OF WARRANTY, OR OTHERWISE.
 *
 *
 * Author               Date    Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Elliott Wood     	6/18/07	Original
 ********************************************************************/
 #define __CUSTOMHTTPAPP_C

 #include "TCPIPConfig.h"
 
 #if defined(STACK_USE_HTTP2_SERVER)
 
 #include "TCPIP.h"
 #include "MainDemo.h"
 
 void ResetSlaves(void);
 void MeterThresholdCalcs(void);
 void RestartWaveform(void);
 
 #define MaxNumberToSend 100
 //#define MaxNumberToSend 125
 
 // Forward declaration for the new boardInfo handler
 static HTTP_IO_RESULT HTTPPostBoardInfo(void);
 
 /****************************************************************************
   Section:
     Function Prototypes and Memory Globalizers
   ***************************************************************************/
 #if defined(HTTP_USE_POST)
     #if defined(USE_LCD)
         static HTTP_IO_RESULT HTTPPostLCD(void);
     #endif
     #if defined(STACK_USE_HTTP_MD5_DEMO)
         #if !defined(STACK_USE_MD5)
             #error The HTTP_MD5_DEMO requires STACK_USE_MD5
         #endif
         static HTTP_IO_RESULT HTTPPostMD5(void);
     #endif
     #if defined(STACK_USE_AUTOUPDATE_HTTPSERVER) && defined(WF_CS_TRIS) && defined(MRF24WG)
         static HTTP_IO_RESULT HTTPPostImage(void);
     #endif
     #if defined(STACK_USE_HTTP_APP_RECONFIG)
         extern APP_CONFIG AppConfig;
         static HTTP_IO_RESULT HTTPPostConfig(void);
         static HTTP_IO_RESULT HTTPPostDevConfig(void);
         static HTTP_IO_RESULT HTTPPostEnterBoot(void);
         static HTTP_IO_RESULT HTTPPostWIFIData(void);
         #if defined(STACK_USE_SNMP_SERVER)
         static HTTP_IO_RESULT HTTPPostSNMPCommunity(void);
         #endif
     #endif
     #if defined(STACK_USE_HTTP_EMAIL_DEMO) || defined(STACK_USE_SMTP_CLIENT)
         #if !defined(STACK_USE_SMTP_CLIENT)
             #error The HTTP_EMAIL_DEMO requires STACK_USE_SMTP_CLIENT
         #endif
         static HTTP_IO_RESULT HTTPPostEmail(void);
     #endif
     #if defined(STACK_USE_DYNAMICDNS_CLIENT)
         static HTTP_IO_RESULT HTTPPostDDNSConfig(void);
     #endif
 #endif
 
 // RAM allocated for DDNS parameters
 #if defined(STACK_USE_DYNAMICDNS_CLIENT)
     static BYTE DDNSData[100];
 #endif
 
 
 /****************************************************************************
   Section:
     Authorization Handlers
   ***************************************************************************/
 
 /*****************************************************************************
   Function:
     BYTE HTTPNeedsAuth(BYTE* cFile)
 
   Internal:
       See documentation in the TCP/IP Stack API or HTTP2.h for details.
   ***************************************************************************/
 #if defined(HTTP_USE_AUTHENTICATION)
 BYTE HTTPNeedsAuth(BYTE* cFile)
 {
     // If the filename begins with the folder "protect", then require auth
     if(memcmppgm2ram(cFile, (ROM void*)"protect", 7) == 0)
         return 0x00;		// Authentication will be needed later
 
     // If the filename begins with the folder "snmp", then require auth
     if(memcmppgm2ram(cFile, (ROM void*)"snmp", 4) == 0)
         return 0x00;		// Authentication will be needed later
 
     #if defined(HTTP_MPFS_UPLOAD_REQUIRES_AUTH)
     if(memcmppgm2ram(cFile, (ROM void*)"mpfsupload", 10) == 0)
         return 0x00;
     #endif
 
     return 0x80;			// No authentication required
 }
 #endif
 
 /*****************************************************************************
   Function:
     BYTE HTTPCheckAuth(BYTE* cUser, BYTE* cPass)
 
   Internal:
       See documentation in the TCP/IP Stack API or HTTP2.h for details.
   ***************************************************************************/
 #if defined(HTTP_USE_AUTHENTICATION)
 BYTE HTTPCheckAuth(BYTE* cUser, BYTE* cPass)
 {
     if(strcmppgm2ram((char *)cUser,(ROM char *)"MPT") == 0
         && strcmppgm2ram((char *)cPass, (ROM char *)"MPT") == 0)
         return 0x80;		// We accept this combination
 
     // You can add additional user/pass combos here.
     // If you return specific "realm" values above, you can base this
     //   decision on what specific file or folder is being accessed.
     // You could return different values (0x80 to 0xff) to indicate
     //   various users or groups, and base future processing decisions
     //   in HTTPExecuteGet/Post or HTTPPrint callbacks on this value.
 
     return 0x00;			// Provided user/pass is invalid
 }
 #endif
 
 /****************************************************************************
   Section:
     GET Form Handlers
   ***************************************************************************/
 
 /*****************************************************************************
   Function:
     HTTP_IO_RESULT HTTPExecuteGet(void)
 
   Internal:
       See documentation in the TCP/IP Stack API or HTTP2.h for details.
   ***************************************************************************/
 HTTP_IO_RESULT HTTPExecuteGet(void)
 {
     UINT8 PlaceHolder = 0, Position, Numbers[10] = {0};
     char Command;
     BYTE *ptr;
     BYTE filename[25] = {0};
 
     // Load the file name
     // Make sure BYTE filename[] above is large enough for your longest name
     MPFSGetFilename(curHTTP.file, filename, 21);
 
     // If it's the LED updater file
     if(!memcmppgm2ram(filename, "cookies.htm", 11))
     {
         curHTTP.hasArgs = 0x01;
     }
     // If it's the Temperature board updater file
     else if(!memcmppgm2ram(filename, "protect/breboot.cgi", 20))
     {
         //EEPROMWriteData(EEPROMEnterBootloader,1);
         Reset();   
     }
     // <editor-fold defaultstate="collapsed" desc="Ping command">
     else if(!memcmppgm2ram(filename, "cgi/pin.cgi", 11))
     {
         // Determine the command that is sent
         ptr = HTTPGetROMArg(curHTTP.data, (ROM BYTE *)"pin");
 
         // Reset the command
         PINGTask.NumberOfTriesClient=0;
         // start from the first digit
         PlaceHolder=0;
         Position=0;
         
         Command=*ptr;
 
         while(1){
             if(Command==' ')
                 break;
             else if(Command==',')
             {
                 PINGTask.ClientIP.v[Position]=atoi ((char*)Numbers);
                 PINGTask.WorkingBits.PingClient=1;
                 break;
             }
             else if(Command=='.')
             {
                 PINGTask.ClientIP.v[Position]=atoi ((char*)Numbers);
 
                 Position++;
                 memset (Numbers,0,PlaceHolder);
                 PlaceHolder=0;
             }
             else
             {
                 Numbers[PlaceHolder]=*ptr;
                 PlaceHolder++;
             }
 
             ptr++;
             Command=*ptr;
         }
     }// </editor-fold>
     // <editor-fold defaultstate="collapsed" desc="Command">
     else if(!memcmppgm2ram(filename, "cgi/cmd.cgi", 7))
     {
         // Determine which tmp card to toggle
         ptr = HTTPGetROMArg(curHTTP.data, (ROM BYTE *)"cmd");
         
         switch(*ptr){
             case 'A': // Start Calibration
                 Board.Working.StartCalibration = 1;
                 return HTTP_IO_DONE;
             case 'B': // Toggle Waveform
                 Board.Working.WaveformToggle ^= 1;
                 return HTTP_IO_DONE;
             case 'S': // Stop Calibration
                 Board.Working.StartCalibration = 0;
                 return HTTP_IO_DONE;
             case 'D': // Scan WIFI details from PI
                 Board.PiFi.Working.AskPIWIFIData = 1;
                 return HTTP_IO_DONE;
             case 'N': // WIFI Connection Status
                 Board.PiFi.Working.GetWIFIConnectionStatus = 1;
                 return HTTP_IO_DONE;
             case 'O': // WIFI Disconnect
                 Board.PiFi.Working.DisconnectPIWIFI = 1;
                 return HTTP_IO_DONE;
             case 'R': // Reset the Accumulation
                 // Reset the slaves
                 Board.EnergyTimer = 0;
                 Board.MeterMeasurements.ActiveEnergyAccumulation = 0;
                 Board.MeterMeasurements.ActiveEnergyAccumulationCalc = 0;
                 Board.MeterMeasurements.ReactiveEnergyAccumulation = 0;
                 Board.MeterMeasurements.ReactiveEnergyAccumulationCalc = 0;
                 Board.MeterMeasurements.ApparentEnergyAccumulation = 0;
                 Board.MeterMeasurements.ApparentEnergyAccumulationCalc = 0;
                 // Make sure we are pointing at the correct EEPOM Bank
               
                 return HTTP_IO_DONE;
             default:
                 Command = *ptr;
                 break;
         }
         
         // this is the start of the first number
         ptr++;
         
         while(1){
             // this is the start of the first number
             ptr++;
 
             if(*ptr == '\0')
                 break;
             else if(*ptr==',')
             {
                 switch(Command){
                     case 'V':
                         Board.CalibrationData.VoltageSetpoint = atof((char*)Numbers);
                         break;
                     case 'C':
                         Position = atof((char*)Numbers);
                         
                         if(Position == 1){
                             Board.Working.GetWaveForm = 1;
                             Board.Working.WaveformToggle = 0;
                             //RestartWaveform();
                         }
                         break;
                     case 'I':
                         Board.CalibrationData.CurrentSetpoint = atof((char*)Numbers);
                         break;
                     case 'P':
                         Board.CalibrationData.PowerFactorSepoint = atof((char*)Numbers);
                         break;
                 }
                 // Clear the numbers
                 memset(Numbers,0,9);
                 // start from the first digit
                 PlaceHolder = 0;
             }
             else
             {
                 // We want to create a number
                 Numbers[PlaceHolder]=*ptr;
                 PlaceHolder++;
             }
         }
     }// </editor-fold>
     
     return HTTP_IO_DONE;
 }
 
 
 /****************************************************************************
   Section:
     POST Form Handlers
   ***************************************************************************/
 #if defined(HTTP_USE_POST)
 
 /*****************************************************************************
   Function:
     HTTP_IO_RESULT HTTPExecutePost(void)
 
   Internal:
       See documentation in the TCP/IP Stack API or HTTP2.h for details.
   ***************************************************************************/
 HTTP_IO_RESULT HTTPExecutePost(void)
 {
     // Resolve which function to use and pass along
     BYTE filename[22];
 
     // Load the file name
     // Make sure BYTE filename[] above is large enough for your longest name
     MPFSGetFilename(curHTTP.file, filename, sizeof(filename));
 
 #if defined(STACK_USE_HTTP_APP_RECONFIG)
     /*if(!memcmppgm2ram(filename, "protect/config.htm", 18))
         //return HTTPPostConfig();
         continue;
     else if(!memcmppgm2ram(filename, "protect/devconfig.htm", 21))
         //return HTTPPostDevConfig();
         continue;
     else if(!memcmppgm2ram(filename, "protect/boot.htm", 16))
         //return HTTPPostEnterBoot();
         continue;
     else if(!memcmppgm2ram(filename, "cgi/wif.cgi", 11))
         //return HTTPPostWIFIData();
         continue;
     else if(!memcmppgm2ram(filename, "boardInfo.htm", 13))
         return HTTPPostBoardInfo();
     continue;*/
 #endif
 
 
     return HTTP_IO_DONE;
 }
 

 #if defined(STACK_USE_HTTP_APP_RECONFIG)


 #endif	// #if defined(STACK_USE_HTTP_APP_RECONFIG)
 
 static HTTP_IO_RESULT HTTPPostBoardInfo(void){
     
     // Make sure all data is ready to be parsed
     if(curHTTP.byteCount > TCPIsGetReady(sktHTTP) + TCPGetRxFIFOFree(sktHTTP))
         return HTTP_IO_DONE;
 
     // Ensure that all data is waiting to be parsed.  If not, keep waiting for
     // all of it to arrive.
     if(TCPIsGetReady(sktHTTP) < curHTTP.byteCount)
         return HTTP_IO_NEED_DATA;
     
     // Read all browser POST data
     while(curHTTP.byteCount)
     {
         // Read a form field name
         if(HTTPReadPostName(curHTTP.data, 6) != HTTP_READ_OK)
             return HTTP_IO_DONE;
 
         // Read a form field value
         if(HTTPReadPostValue(curHTTP.data + 6, sizeof(curHTTP.data)-6-2) != HTTP_READ_OK)
             return HTTP_IO_DONE;
 
         // Parse the value that was read
         // <editor-fold defaultstate="collapsed" desc="Reset Power Counter">
         if(!strcmppgm2ram((char*)curHTTP.data, (ROM char*)"Variable holding data"))
         {
        
            
         }// </editor-fold>
         // Add more handlers here for other boardInfo.htm POST actions if needed
     }
     
     // Redirect back to the boardInfo.htm page
     //strcpypgm2ram((char*)curHTTP.data, "/boardInfo.htm");
     curHTTP.httpStatus = HTTP_REDIRECT;
     
     return HTTP_IO_DONE;
 }
 
 #endif //(use_post)
 
 void HTTPPrint_version(void)
 {
     TCPPutROMString(sktHTTP, (ROM void*)CodeVersion);
 }
 

 extern APP_CONFIG AppConfig;
 
 void HTTPPrintIP(IP_ADDR ip)
 {
     BYTE digits[4];
     BYTE i;
 
     for(i = 0; i < 4u; i++)
     {
         if(i)
             TCPPut(sktHTTP, '.');
         uitoa(ip.v[i], digits);
         TCPPutString(sktHTTP, digits);
     }
 }
 
 void HTTPPrint_config_hostname(void)
 {
     TCPPutString(sktHTTP, AppConfig.NetBIOSName);
     return;
 }
 
 // <editor-fold defaultstate="collapsed" desc="Network realted stuff">
 void HTTPPrint_config_ip(void)
 {
     HTTPPrintIP(AppConfig.MyIPAddr);
     return;
 }

 void HTTPPrint_config_gw(void)
 {
     HTTPPrintIP(AppConfig.MyGateway);
     return;
 }
 
 void HTTPPrint_config_subnet(void)
 {
     HTTPPrintIP(AppConfig.MyMask);
     return;
 }
 
 void HTTPPrint_config_dns1(void)
 {
     HTTPPrintIP(AppConfig.PrimaryDNSServer);
     return;
 }
 
 void HTTPPrint_config_dns2(void)
 {
     HTTPPrintIP(AppConfig.SecondaryDNSServer);
     return;
 }
 
 void HTTPPrint_config_mac(void)
 {
     BYTE i;
 
     if(TCPIsPutReady(sktHTTP) < 18u)
     {//need 17 bytes to write a MAC
         curHTTP.callbackPos = 0x01;
         return;
     }
 
     // Write each byte
     for(i = 0; i < 6u; i++)
     {
         if(i)
             TCPPut(sktHTTP, ':');
         TCPPut(sktHTTP, btohexa_high(AppConfig.MyMACAddr.v[i]));
         TCPPut(sktHTTP, btohexa_low(AppConfig.MyMACAddr.v[i]));
     }
 
     // Indicate that we're done
     curHTTP.callbackPos = 0x00;
     return;
 }// </editor-fold>
 
 void HTTPPrint_mis(void){
     BYTE digits[20]={0};
     BYTE FullString[300]={0};
 
     // Start with a ,
     strcpy((char *)FullString,",");
     
     sprintf((char *)digits,"%u",55);
     strcat((char *)FullString,(char *)digits);
     strcat((char *)FullString,",");
     

     // Send the data to the webpage
     TCPPutString(sktHTTP, FullString);
 }

 void HTTPPrint_dat(void){
     BYTE digits[20]={0};
     UINT8 i;
     BYTE FullString[300]={0};
    char data [] = {'1','2','3','4','5','6','7','8','9','0'};
     // Start with a ,
     strcpy((char *)FullString,",");
     
     for(i=0;i<3;i++){
         sprintf((char *)digits,"%u",(UINT16)(data[i]));
         strcat((char *)FullString,(char *)digits);
         strcat((char *)FullString,",");
     }
     
     // Send the data to the webpage
     TCPPutString(sktHTTP, FullString);
 }


 void HTTPPrint_dtt(void){
     BYTE digits[25]={0};
     //UINT8 i;
     BYTE FullString[300]={0};
 
     // Start with a ,
     strcpy((char *)FullString,",");
     
     sprintf((char *)digits,"%ld",(INT32)(55));
     strcat((char *)FullString,(char *)digits);
     strcat((char *)FullString,",");

     // Send the data to the webpage
     TCPPutString(sktHTTP, FullString);
 }
 


 #endif
 