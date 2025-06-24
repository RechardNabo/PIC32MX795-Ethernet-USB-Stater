/*********************************************************************
 *
 *	Generic TCP Server Example Application
 *  Module for Microchip TCP/IP Stack
 *   -Implements an example "ToUpper" TCP server on port 9760 and
 *	  should be used as a basis for creating new TCP server
 *    applications
 *
 *********************************************************************
 * FileName:        GenericTCPServer.c
 * Dependencies:    TCP
 * Processor:       PIC18, PIC24F, PIC24H, dsPIC30F, dsPIC33F, PIC32
 * Compiler:        Microchip C32 v1.05 or higher
 *					Microchip C30 v3.12 or higher
 *					Microchip C18 v3.30 or higher
 *					HI-TECH PICC-18 PRO 9.63PL2 or higher
 * Company:         Microchip Technology, Inc.
 *
 * Software License Agreement
 *
 * Copyright (C) 2002-2009 Microchip Technology Inc.  All rights
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
 * Author               Date    	Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Howard Schlunder     10/19/06	Original
 * Microchip            08/11/10    Added ability to close session by
 *                                  pressing the ESCAPE key.
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *
 * Description of how to run the demo:
 *   1) Connect the ethernet port of the programmed demo board to a
 *        computer either directly or through a router.
 *   2) Determine the IP address of the demo board.  This can be done several
 *        different ways.
 *      a) If you are using a demo setup with an LCD display (e.g. Explorer 16
 *           or PICDEM.net 2), the IP address should be displayed on the second
 *           line of the display.
 *      b) Open the Microchip Ethernet Device Discoverer from the start menu.
 *           Press the "Discover Devices" button to see the addresses and host
 *           names of all devices with the Announce Protocol enabled on your
 *           network.  You may have to configure your computer's firewall to
 *           prevent it from blocking UDP port 30303 for this solution.
 *      c) If your board is connected directly with your computer with a
 *           crossover cable:
 *              1) Open a command/DOS prompt and type 'ipconfig'.  Find the
 *                   network adaptor that is connected to the board.  The IP
 *                   address of the board is located in the 'Default Gateway'
 *                   field
 *              2) Open up the network status for the network adaptor that
 *                   connects the two devices.  This can be done by right clicking
 *                   on the network connection icon in the network settings folder
 *                   and select 'status' from the menu. Find the 'Default Gateway'
 *                   field.
 *   3) Open a command/DOS prompt.  Type "telnet ip_address 9760" where
 *        ip_address is the IP address that you got from step 2.
 *   4) As you type characters, they will be echoed back in your command prompt
 *        window in UPPER CASE.
 *   5) Press Escape to end the demo.
 *
 ********************************************************************/
#define __GENERICTCPSERVER_C

#include "TCPIPConfig.h"

#if defined(STACK_USE_GENERIC_TCP_SERVER_EXAMPLE)

#include "TCPIP.h"

// Defines which port the server will listen on
#define SERVER_PORT	502
extern BYTE RecData[250];

void MODBUSTRY (void)
{
    static BYTE AppBuffer[265] = {};
    WORD TEMP;
    BYTE i,w;
    static TCP_SOCKET	ModbusServer;
    static TCP_SOCKET	ModbusServer1;

    static enum _TCPServerState
    {
            MDB_OPEN = 0,
            MDB_Request,
    } TCPServerState = MDB_OPEN;

        static enum _TCPServerState1
    {
            MDB1_OPEN = 0,
            MDB1_Request,
    } TCPServerState1 = MDB1_OPEN;

    typedef struct ModbusTCP
    {
        BYTE Length_H;
        BYTE Length_L;
        BYTE UNIT_ID;
        BYTE FUNCTION;
        BYTE Quantity_L;

    } MOD;

    MOD Mod03;

    switch(TCPServerState)
    {
        case MDB_OPEN:
            ModbusServer = TCPOpen(0, TCP_OPEN_SERVER, SERVER_PORT, TCP_PURPOSE_GENERIC_TCP_SERVER);            // Allocate a socket for this server to listen and accept connections on

            if(ModbusServer == INVALID_SOCKET)                      // Is the socket valid
            {
                break;                                             // return out of function
            }
            else
                TCPServerState = MDB_Request;                       // Socket is valid keep open
            break;

        case MDB_Request:
            if(!TCPIsConnected(ModbusServer))                       // See if anyone is connected to us
                    return;                                         // NoBody Connected, jump out function
            else
            {
            TCPGetArray(ModbusServer, AppBuffer, 262);              // Get the standard Modbus TCP/IP frame from the client
                                                                     // Length is so big in case of function 16.
                if (AppBuffer[7] == 3)                              // Is the function recieved a function 3?
                {
                    TEMP=AppBuffer[11];
                    Mod03.Quantity_L=TEMP*2;
                    Mod03.Length_L=3+Mod03.Quantity_L;
                    Mod03.Length_H=0x00;
                    TEMP=9+Mod03.Quantity_L;

                    AppBuffer[0]=AppBuffer[0];
                    AppBuffer[1]=AppBuffer[1];
                    AppBuffer[2]=AppBuffer[2];
                    AppBuffer[3]=AppBuffer[3];
                    AppBuffer[4]=Mod03.Length_H;
                    AppBuffer[5]=Mod03.Length_L;
                    AppBuffer[6]=AppBuffer[6];
                    AppBuffer[7]=AppBuffer[7];
                    AppBuffer[8]=Mod03.Quantity_L;
                    w=9;

                        for(i=0;i<AppBuffer[8];i++)
                        {
                            AppBuffer[w]=RecData[i];
                            w++;
                        }

                    TCPPutArray(ModbusServer, AppBuffer,TEMP);
                    AppBuffer[7]=0;
                    break;
                }
                else if(AppBuffer[7] == 16)
                {
                    w=13;
                    for(i=0;i<AppBuffer[12];i++)
                    {
                        RecData[i]=AppBuffer[w];
                        w++;
                    }

                    AppBuffer[0]=AppBuffer[0];
                    AppBuffer[1]=AppBuffer[1];
                    AppBuffer[2]=AppBuffer[2];
                    AppBuffer[3]=AppBuffer[3];
                    AppBuffer[4]=0;
                    AppBuffer[5]=6;
                    AppBuffer[6]=AppBuffer[6];
                    AppBuffer[7]=AppBuffer[7];
                    AppBuffer[8]=AppBuffer[8];
                    AppBuffer[9]=AppBuffer[9];
                    AppBuffer[10]=AppBuffer[10];
                    AppBuffer[11]=AppBuffer[11];

                    TCPPutArray(ModbusServer, AppBuffer,12);
                    AppBuffer[7]=0;
                    break;
                }
                else
                    break;
            }
    }

    switch(TCPServerState1)
    {
        case MDB1_OPEN:
            ModbusServer1 = TCPOpen(0, TCP_OPEN_SERVER, SERVER_PORT, TCP_PURPOSE_GENERIC_TCP_SERVER);            // Allocate a socket for this server to listen and accept connections on

            if(ModbusServer1 == INVALID_SOCKET)                      // Is the socket valid
            {
                break;                                             // return out of function
            }
            else
                TCPServerState1 = MDB_Request;                       // Socket is valid keep open
            break;

        case MDB1_Request:
            if(!TCPIsConnected(ModbusServer1))                       // See if anyone is connected to us
                    return;                                         // NoBody Connected, jump out function
            else
            {
            TCPGetArray(ModbusServer1, AppBuffer, 262);              // Get the standard Modbus TCP/IP frame from the client
                                                                     // Length is so big in case of function 16.
                if (AppBuffer[7] == 3)                              // Is the function recieved a function 3?
                {
                    TEMP=AppBuffer[11];
                    Mod03.Quantity_L=TEMP*2;
                    Mod03.Length_L=3+Mod03.Quantity_L;
                    Mod03.Length_H=0x00;
                    TEMP=9+Mod03.Quantity_L;

                    AppBuffer[0]=AppBuffer[0];
                    AppBuffer[1]=AppBuffer[1];
                    AppBuffer[2]=AppBuffer[2];
                    AppBuffer[3]=AppBuffer[3];
                    AppBuffer[4]=Mod03.Length_H;
                    AppBuffer[5]=Mod03.Length_L;
                    AppBuffer[6]=AppBuffer[6];
                    AppBuffer[7]=AppBuffer[7];
                    AppBuffer[8]=Mod03.Quantity_L;
                    w=9;

                        for(i=0;i<AppBuffer[8];i++)
                        {
                            AppBuffer[w]=RecData[i];
                            w++;
                        }

                    TCPPutArray(ModbusServer1, AppBuffer,TEMP);
                    AppBuffer[7]=0;
                    break;
                }
                else if(AppBuffer[7] == 16)
                {
                    w=13;
                    for(i=0;i<AppBuffer[12];i++)
                    {
                        RecData[i]=AppBuffer[w];
                        w++;
                    }

                    AppBuffer[0]=AppBuffer[0];
                    AppBuffer[1]=AppBuffer[1];
                    AppBuffer[2]=AppBuffer[2];
                    AppBuffer[3]=AppBuffer[3];
                    AppBuffer[4]=0;
                    AppBuffer[5]=6;
                    AppBuffer[6]=AppBuffer[6];
                    AppBuffer[7]=AppBuffer[7];
                    AppBuffer[8]=AppBuffer[8];
                    AppBuffer[9]=AppBuffer[9];
                    AppBuffer[10]=AppBuffer[10];
                    AppBuffer[11]=AppBuffer[11];

                    TCPPutArray(ModbusServer1, AppBuffer,12);
                    AppBuffer[7]=0;
                    break;
                }
                else
                    break;
            }
    }
}
#endif //#if defined(STACK_USE_GENERIC_TCP_SERVER_EXAMPLE)
