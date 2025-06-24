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
#include "TCPIPConfig.h"
#include "TCPIP.h"

/*
 * InitNetworkConfig
 * 
 * Description: Initializes the network configuration with hardcoded values
 * 
 * Parameters:  None
 * 
 * Returns:     None
 */
void InitNetworkConfig(void)
{
    // Initialize default network configuration
    AppConfig.MyIPAddr.Val = MY_DEFAULT_IP_ADDR_BYTE1 | \
                            MY_DEFAULT_IP_ADDR_BYTE2 << 8ul | \
                            MY_DEFAULT_IP_ADDR_BYTE3 << 16ul | \
                            MY_DEFAULT_IP_ADDR_BYTE4 << 24ul;

    AppConfig.MyMask.Val = MY_DEFAULT_MASK_BYTE1 | \
                          MY_DEFAULT_MASK_BYTE2 << 8ul | \
                          MY_DEFAULT_MASK_BYTE3 << 16ul | \
                          MY_DEFAULT_MASK_BYTE4 << 24ul;

    AppConfig.MyGateway.Val = MY_DEFAULT_GATE_BYTE1 | \
                             MY_DEFAULT_GATE_BYTE2 << 8ul | \
                             MY_DEFAULT_GATE_BYTE3 << 16ul | \
                             MY_DEFAULT_GATE_BYTE4 << 24ul;

    AppConfig.PrimaryDNSServer.Val = MY_DEFAULT_PRIMARY_DNS_BYTE1 | \
                                    MY_DEFAULT_PRIMARY_DNS_BYTE2 << 8ul | \
                                    MY_DEFAULT_PRIMARY_DNS_BYTE3 << 16ul | \
                                    MY_DEFAULT_PRIMARY_DNS_BYTE4 << 24ul;

    AppConfig.SecondaryDNSServer.Val = MY_DEFAULT_SECONDARY_DNS_BYTE1 | \
                                      MY_DEFAULT_SECONDARY_DNS_BYTE2 << 8ul | \
                                      MY_DEFAULT_SECONDARY_DNS_BYTE3 << 16ul | \
                                      MY_DEFAULT_SECONDARY_DNS_BYTE4 << 24ul;

    // MAC Address
    AppConfig.MyMACAddr.v[0] = MY_DEFAULT_MAC_BYTE1;
    AppConfig.MyMACAddr.v[1] = MY_DEFAULT_MAC_BYTE2;
    AppConfig.MyMACAddr.v[2] = MY_DEFAULT_MAC_BYTE3;
    AppConfig.MyMACAddr.v[3] = MY_DEFAULT_MAC_BYTE4;
    AppConfig.MyMACAddr.v[4] = MY_DEFAULT_MAC_BYTE5;
    AppConfig.MyMACAddr.v[5] = MY_DEFAULT_MAC_BYTE6;

    // Host name
    memcpy(AppConfig.NetBIOSName, MY_DEFAULT_HOST_NAME, sizeof(MY_DEFAULT_HOST_NAME));

    // DHCP Enable
    AppConfig.Flags.bIsDHCPEnabled = MY_DEFAULT_DHCP_ENABLE;

    // Initialize other network parameters
    AppConfig.Flags.bInConfigMode = FALSE;
}
