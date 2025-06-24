/*********************************************************************
 *
 *	Network Configuration Header
 *
 *********************************************************************
 * FileName:        NetworkConfig.h
 * Description:     Contains network configuration settings
 ********************************************************************/

#ifndef __NETWORKCONFIG_H
#define __NETWORKCONFIG_H

#include "TCPIP.h"

// Network Configuration Defaults
#define MY_DEFAULT_HOST_NAME           "PIC32"
#define MY_DEFAULT_MAC_BYTE1           0x00
#define MY_DEFAULT_MAC_BYTE2           0x04
#define MY_DEFAULT_MAC_BYTE3           0xA3
#define MY_DEFAULT_MAC_BYTE4           0x00
#define MY_DEFAULT_MAC_BYTE5           0x00
#define MY_DEFAULT_MAC_BYTE6           0x00

#define MY_DEFAULT_IP_ADDR_BYTE1       192
#define MY_DEFAULT_IP_ADDR_BYTE2       168
#define MY_DEFAULT_IP_ADDR_BYTE3       1
#define MY_DEFAULT_IP_ADDR_BYTE4       100

#define MY_DEFAULT_MASK_BYTE1          255
#define MY_DEFAULT_MASK_BYTE2          255
#define MY_DEFAULT_MASK_BYTE3          255
#define MY_DEFAULT_MASK_BYTE4          0

#define MY_DEFAULT_GATE_BYTE1          192
#define MY_DEFAULT_GATE_BYTE2          168
#define MY_DEFAULT_GATE_BYTE3          1
#define MY_DEFAULT_GATE_BYTE4          1

#define MY_DEFAULT_PRIMARY_DNS_BYTE1   8
#define MY_DEFAULT_PRIMARY_DNS_BYTE2   8
#define MY_DEFAULT_PRIMARY_DNS_BYTE3   8
#define MY_DEFAULT_PRIMARY_DNS_BYTE4   8

#define MY_DEFAULT_SECONDARY_DNS_BYTE1 8
#define MY_DEFAULT_SECONDARY_DNS_BYTE2 8
#define MY_DEFAULT_SECONDARY_DNS_BYTE3 4
#define MY_DEFAULT_SECONDARY_DNS_BYTE4 4

#define MY_DEFAULT_DHCP_ENABLE         FALSE

// Function Prototypes
void InitNetworkConfig(void);

#endif
