/* 
 * File:   UDPChangeIP.c
 * Author: Pascal Courvoisier
 *
 * Created on May 12, 2020, 7:48 PM
 */

#define __UDPChangeIP_C

#include "TCPIPConfig.h"
#include "TCPIP.h"

// The port Used
#define UPDChangeIP_PORT	30304

UINT8 FindComma(UINT8 Data[],UINT8 Length);

/*********************************************************************
 * Function:        void UPDChangeIPTask(void)
 *
 * Summary:         Change IP with a UPD and discovery tool callback task.
 *
 * PreCondition:    Stack is initialized()
 *
 * Input:           None
 *
 * Output:          None
 *
 * Side Effects:    None
 *
 * Overview:        Recurring task used to listen for UDPChgIP
 *                  messages on the specified UPDChangeIP_PORT.  These
 *                  messages can be sent using the MPT
 *                  Discoverer tool. If one is received, this
 *                  function will transmit a reply.
 *
 * Note:            A UDP socket must be available before this
 *					function is called.  It is freed at the end of
 *					the function.  MAX_UDP_SOCKETS may need to be
 *					increased if other modules use UDP sockets.
 ********************************************************************/
void UPDChangeIPTask(void)
{   
	static enum {
		UDPChgIP_HOME = 0,
		UDPChgIP_LISTEN,
		UDPChgIP_DISABLED
	} UDPChgIPSM = UDPChgIP_HOME;

	static UDP_SOCKET	MySocket;
	UINT8 Placeholder = 0;
    BYTE *ReceivedData;
    BYTE AmountOfDatatoReceive;
    BYTE UnloadedData[20] = {0};
    UINT8 i = 0;
    APP_CONFIG newAppConfig;

	switch(UDPChgIPSM)
	{
		case UDPChgIP_HOME:
			// Open a UDP socket for inbound and outbound transmission
			// Since we expect to only receive broadcast packets and
			// only send unicast packets directly to the node we last
			// received from, the remote NodeInfo parameter can be anything
			MySocket = UDPOpenEx(0,UDP_OPEN_SERVER,UPDChangeIP_PORT, UPDChangeIP_PORT);

			if(MySocket == INVALID_UDP_SOCKET)
				return;
			else
				UDPChgIPSM++;
			break;

		case UDPChgIP_LISTEN:
            // Get the amount of data from the buffer
            AmountOfDatatoReceive = UDPIsGetReady(MySocket);
			// Do nothing if no data is waiting
			if(!AmountOfDatatoReceive)
				return;
            
            *ReceivedData = 0;

			// Get the Data
			UDPGetArray(ReceivedData,AmountOfDatatoReceive);
            // Clear the buffer
			UDPDiscard();
            
			if(*ReceivedData != '\0')
            {
                Placeholder = FindComma(ReceivedData,AmountOfDatatoReceive);
                Placeholder--;
                
                for(i = 0;i < Placeholder;i++){
                    UnloadedData[i] = *ReceivedData;
                    ReceivedData++;
                }
                
                // First IP is the Destination
                if(!StringToIPAddress(UnloadedData, &newAppConfig.MyIPAddr))
                    return;
              
                // If it is our IP we change
                if(AppConfig.MyIPAddr.Val == newAppConfig.MyIPAddr.Val){
                    // move passed comma
                    ReceivedData++;

                    Placeholder = FindComma(ReceivedData,AmountOfDatatoReceive);
                    Placeholder--;
                    
                    memset(UnloadedData,0,20);

                    for(i = 0;i < Placeholder;i++){
                        UnloadedData[i] = *ReceivedData;
                        ReceivedData++;
                    }
                    
                    if(!StringToIPAddress(UnloadedData, &newAppConfig.MyIPAddr))
                        return;



                    // move passed comma
                    ReceivedData++;
                    
                    memset(UnloadedData,0,20);

                    for(i = 0;i < 50;i++){
                        Placeholder = *ReceivedData;
                        
                        if(Placeholder != '*'){
                            UnloadedData[i] = Placeholder;
                            ReceivedData++;
                        }else{
                            break;// out for loop
                        }
                    }

                    if(!StringToIPAddress(UnloadedData, &newAppConfig.MyMask))
                        return;

                    Reset();     
                }
            }else
				return;

			// Listen for other discovery requests
			UDPChgIPSM = UDPChgIP_LISTEN;
			break;

		case UDPChgIP_DISABLED:
			break;
	}

}

UINT8 FindComma(UINT8 Data[],UINT8 Length){
    UINT8 m = 0, Placeholder = 0;
    
    for(m=0;m<Length;m++){
        if(Data[m] == ','){
            Placeholder = m;
            Placeholder++;
            break;
        }
    }
    
    return Placeholder;
}
