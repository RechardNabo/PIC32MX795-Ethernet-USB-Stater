/*********************************************************************
 *
 *  Generic TCP Client Example Application
 *  Module for Microchip TCP/IP Stack
 *   -Implements an example HTTP client and should be used as a basis
 *	  for creating new TCP client applications
 *	 -Reference: None.  Hopefully AN833 in the future.
 *
 *********************************************************************
 * FileName:        GenericTCPClient.c
 * Dependencies:    TCP, DNS, ARP, Tick
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
 * Author               Date    Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Howard Schlunder     8/01/06	Original
 ********************************************************************/
#define __GENERICTCPCLIENT_C

#include "TCPIPConfig.h"

#if defined(STACK_USE_GENERIC_TCP_CLIENT_EXAMPLE)

#include "TCPIP.h"


// Defines the server to be accessed for this application
//static BYTE ServerName[] =	"192.168.0.2";

// Defines the port to be accessed for this application
static WORD ServerPort = 502;

// Defines the URL to be requested by this HTTP client
static ROM BYTE RemoteURL[] = "/search?as_q=Microchip&as_sitesearch=microchip.com";
extern BYTE RecData[250];

/*****************************************************************************
  Function:
	void GenericTCPClient(void)

  Summary:
	Implements a simple HTTP client (over TCP).

  Description:
	This function implements a simple HTTP client, which operates over TCP.
	The function is called periodically by the stack, and waits for BUTTON1
	to be pressed.  When the button is pressed, the application opens a TCP
	connection to an Internet search engine, performs a search for the word
	"Microchip" on "microchip.com", and prints the resulting HTML page to
	the UART.

	This example can be used as a model for many TCP and HTTP client
	applications.

  Precondition:
	TCP is initialized.

  Parameters:
	None

  Returns:
  	None
  ***************************************************************************/
void GenericTCPClient(void)
{
    static BYTE AppBuffer[265] = {};
    static DWORD        Timer;
    static TCP_SOCKET	MySocket;

    static enum _GenericTCPExampleState
    {
            SM_HOME = 0,
            SM_SOCKET_OBTAINED,
    } GenericTCPExampleState = SM_HOME;

    switch(GenericTCPExampleState)
    {
            case SM_HOME:
                    MySocket = TCPOpen(0x0200A8C0, TCP_OPEN_IP_ADDRESS, ServerPort, TCP_PURPOSE_GENERIC_TCP_CLIENT);            // Allocate a socket for this server to listen and accept connections on
                    //MySocket = TCPOpen((DWORD)(PTR_BASE)"192.168.0.2",TCP_OPEN_RAM_HOST, ServerPort, TCP_PURPOSE_DEFAULT);
                    //MySocket = TCPOpen((DWORD)&ServerName[0], TCP_OPEN_RAM_HOST, ServerPort, TCP_PURPOSE_GENERIC_TCP_CLIENT);

                    if(MySocket == INVALID_SOCKET)
                    {
                        //LED1_IO = 1;
                        //LED2_IO = 0;
                        break;
                    }
                    else
                    {
                        //LED2_IO = 1;
                        //LED1_IO = 0;
                        GenericTCPExampleState=SM_SOCKET_OBTAINED;
                        Timer = TickGet();
                        break;
                    }
            case SM_SOCKET_OBTAINED:
                    //LED2_IO = 1;
                    // Wait for the remote server to accept our connection request
                    if(!TCPIsConnected(MySocket))
                    {
                        // Time out if too much time is spent in this state
                        if(TickGet()-Timer > 5*TICK_SECOND)
                        {
                            LED1_IO = 1;
                            LED2_IO=0;
                            // Close the socket so it can be used by other modules
                            TCPDisconnect(MySocket);
                            MySocket = INVALID_SOCKET;
                            GenericTCPExampleState=SM_HOME;
                        }
                        else
                        {
                        break;
                        }
                    }
                    else
                    {
                        //LED2_IO = 1;
                        Timer = TickGet();

                        // Make certain the socket can be written to
                        if(TCPIsPutReady(MySocket) < 125u)
                        {
                            //LED1_IO=1;
                            LED2_IO=0;
                            break;
                        }
                        else
                        {
                            LED1_IO=0;
                            LED2_IO=1;
                            // Place the application protocol data into the transmit buffer.  For this example, we are connected to an HTTP server, so we'll send an HTTP GET request.

                            AppBuffer[0]=0;
                            AppBuffer[1]=0;
                            AppBuffer[2]=0;
                            AppBuffer[3]=0;
                            AppBuffer[4]=0;
                            AppBuffer[5]=6;
                            AppBuffer[6]=1;
                            AppBuffer[7]=3;
                            AppBuffer[8]=0;
                            AppBuffer[9]=0;
                            AppBuffer[10]=0;
                            AppBuffer[11]=1;

                            TCPPutArray(MySocket, AppBuffer,12);
                            // Send the packet
                            TCPFlush(MySocket);

                            TCPGetArray(MySocket, AppBuffer, 262);

                            RecData[0]=AppBuffer[9];
                            RecData[1]=AppBuffer[10];
                            break;
                        }
                    }
    }
}

#endif	//#if defined(STACK_USE_GENERIC_TCP_CLIENT_EXAMPLE)
