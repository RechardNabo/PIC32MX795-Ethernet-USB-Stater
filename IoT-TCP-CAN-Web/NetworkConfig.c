/*********************************************************************
 *
 *	Network Configuration Implementation
 *
 *********************************************************************
 * FileName:        NetworkConfig.c
 * Description:     Contains network configuration settings implementation
 *                  with hardcoded values (no EEPROM required)
 ********************************************************************/

#include "NetworkConfig.h"
#include "TCPIP.h"

/*
 * InitNetworkConfig
 * 
 * Description: Initializes the network configuration with hardcoded values
 * 
 * Parameters:  AppConfig - Pointer to the application configuration structure
 * 
 * Returns:     None
 */
void InitNetworkConfig(APP_CONFIG* AppConfig)
{
    // Disable DHCP and set to config mode
    AppConfig->Flags.bIsDHCPEnabled = FALSE;
    AppConfig->Flags.bInConfigMode = TRUE;

    // Set MAC address (default MAC address)
    AppConfig->MyMACAddr.v[0] = 0x00;
    AppConfig->MyMACAddr.v[1] = 0x04;
    AppConfig->MyMACAddr.v[2] = 0xA3;
    AppConfig->MyMACAddr.v[3] = 0x00;
    AppConfig->MyMACAddr.v[4] = 0x00;
    AppConfig->MyMACAddr.v[5] = 0x01;
    
    // Store MAC address in Board structure (used elsewhere in the code)
    Board.MYMAC = (AppConfig->MyMACAddr.v[2] | 
                  (AppConfig->MyMACAddr.v[3] << 8) | 
                  (AppConfig->MyMACAddr.v[4] << 16) | 
                  (AppConfig->MyMACAddr.v[5] << 24));
    
    // Set IP address to 192.168.18.22
    AppConfig->MyIPAddr.v[0] = 192;
    AppConfig->MyIPAddr.v[1] = 168;
    AppConfig->MyIPAddr.v[2] = 18;
    AppConfig->MyIPAddr.v[3] = 22;
    AppConfig->DefaultIPAddr.Val = AppConfig->MyIPAddr.Val;
    
    // Store IP in Board structure (used elsewhere in the code)
    Board.MYIP[0] = AppConfig->MyIPAddr.v[0];
    Board.MYIP[1] = AppConfig->MyIPAddr.v[1];
    Board.MYIP[2] = AppConfig->MyIPAddr.v[2];
    Board.MYIP[3] = AppConfig->MyIPAddr.v[3];
    
    // Set subnet mask to 255.255.255.0
    AppConfig->MyMask.v[0] = 255;
    AppConfig->MyMask.v[1] = 255;
    AppConfig->MyMask.v[2] = 255;
    AppConfig->MyMask.v[3] = 0;
    AppConfig->DefaultMask.Val = AppConfig->MyMask.Val;
    
    // Set gateway to 192.168.1.1
    AppConfig->MyGateway.v[0] = 192;
    AppConfig->MyGateway.v[1] = 168;
    AppConfig->MyGateway.v[2] = 1;
    AppConfig->MyGateway.v[3] = 1;
    
    // Set primary DNS to Google DNS (8.8.8.8)
    AppConfig->PrimaryDNSServer.v[0] = 8;
    AppConfig->PrimaryDNSServer.v[1] = 8;
    AppConfig->PrimaryDNSServer.v[2] = 8;
    AppConfig->PrimaryDNSServer.v[3] = 8;
    
    // Set secondary DNS to Google DNS (8.8.4.4)
    AppConfig->SecondaryDNSServer.v[0] = 8;
    AppConfig->SecondaryDNSServer.v[1] = 8;
    AppConfig->SecondaryDNSServer.v[2] = 4;
    AppConfig->SecondaryDNSServer.v[3] = 4;
}
