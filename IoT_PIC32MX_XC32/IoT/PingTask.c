#include "TCPIP.h"                  // Include all headers for any enabled TCPIP Stack functions

void PingClientTask(void)
{
        switch(PINGTask.State)
        {
            case 0:
                // Check to see if there is any ping tasks to do
                if(PINGTask.WorkingBits.All>0)
                {
                    // do task only every sec
                    if(TickGet() - PINGTask.Timer >= TICK_SECOND)
                    {
                        if(ICMPBeginUsage())
                        {
                            // Send the ping request
                            ICMPSendPing(PINGTask.ClientIP.Val);
                            PINGTask.ResponceClient=-5;
                            PINGTask.State++;
                        }            
                        else
                            PINGTask.ResponceClient=-4;
                        // Refresh the timer
                        PINGTask.Timer=TickGet ();
                    }
                }
                break;
            case 1:
                // Get the status
                PINGTask.ResponceClient=ICMPGetReply();
                
                if(PINGTask.ResponceClient == -2)
                {
                    // Do nothing: still waiting
                    break;
                }
                
                PINGTask.State=0;
                
                if(PINGTask.ResponceClient>0)
                    PINGTask.ResponceClient=TickConvertToMilliseconds((DWORD)PINGTask.ResponceClient);
                
                PINGTask.NumberOfTriesClient++;
                
                if((PINGTask.NumberOfTriesClient>4)||(PINGTask.ResponceClient==-1))
                {
                    PINGTask.NumberOfTriesClient=0;
                    PINGTask.WorkingBits.All=0;
                    
                    if(PINGTask.ResponceClient!=-1)
                        PINGTask.ResponceClient=-6;
                }
                // Finished with the ICMP module, release it so other apps can begin using it
                ICMPEndUsage ();
                break;
        }
}


