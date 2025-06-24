/*********************************************************************
 *
 *  Microchip TCP/IP Stack Include File
 *
 *********************************************************************
 * FileName:        TCPIP.h
 * Dependencies:
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
 * V5.36 ---- STACK_USE_MPFS has been removed.
 ********************************************************************/
#ifndef __TCPIP_HITECH_WORKAROUND_H
#define __TCPIP_HITECH_WORKAROUND_H

#define TCPIP_STACK_VERSION 		"v5.36"		// TCP/IP stack version

#include <string.h>
#include <stdlib.h>
#include "GenericTypeDefs.h"
#include "Compiler.h"
#include "HardwareProfile.h"
#include "Addon.h"


BYTE CAN2MessageFifoArea[2 * 8 * 16];


typedef struct{
    UINT8 Data[10];
    UINT8 DLC;
}CAN;

CAN CANPort1;

// RESERVED FEATURE -- do not change from current value of 1u as this is not
// fully implemented yet.
// Defines the number of different network interfaces to support (ex: 2 for
// Wifi and Ethernet simultaneously).
#define NETWORK_INTERFACES		(1u)

/*******************************************************************
 * Memory Configuration
 *   The following section sets up the memory types for use by
 *   this application.
 *******************************************************************/
	// Represents data stored in Ethernet buffer RAM
	#define TCP_ETH_RAM	0u
	// The base address for TCP data in Ethernet RAM
	#define TCP_ETH_RAM_BASE_ADDRESS			(BASE_TCB_ADDR)
	// Represents data stored in local PIC RAM
	#define TCP_PIC_RAM	1u
	// The base address for TCP data in PIC RAM
	#define TCP_PIC_RAM_BASE_ADDRESS			((PTR_BASE)&TCPBufferInPIC[0])
	// Represents data stored in external SPI RAM
	#define TCP_SPI_RAM	2u

/*******************************************************************
 * User Configuration
 *   Load the user-specific configuration from TCPIPConfig.h
 *******************************************************************/
#include "TCPIPConfig.h"

/*******************************************************************
 * Configuration Rules Enforcement
 *   The following section enforces requirements for modules based
 *   on configurations selected in TCPIPConfig.h
 *******************************************************************/

#ifndef STACK_USE_MDD



	#if defined(STACK_USE_HTTP2_SERVER) || defined(STACK_USE_FTP_SERVER)
		#define STACK_USE_MPFS2
	#endif

	#if defined(STACK_USE_SNMPV3_SERVER) && !defined (STACK_USE_SNMP_SERVER)
		#define STACK_USE_SNMP_SERVER
	#endif

	#if defined(STACK_USE_SNMP_SERVER) //&& !defined(STACK_USE_MPFS) && !defined(STACK_USE_MPFS2)
		#define STACK_USE_MPFS2
	#endif

	#if defined(STACK_USE_SNMP_SERVER) && defined (STACK_USE_SNMPV3_SERVER)
		#define STACK_USE_MD5
		#define STACK_USE_SHA1
	#endif
#endif

	// FTP is not supported in MPFS2 or when MPFS is stored in internal program
	// memory (instead of external EEPROM).
	#if ( (!defined(MPFS_USE_EEPROM) && !defined(MPFS_USE_SPI_FLASH)) || defined(STACK_USE_MPFS2) ) && defined(STACK_USE_FTP)
		#error FTP server is not supported with HTTP2 / MPFS2, or with internal Flash memory storage
	#endif

	// When IP Gleaning is enabled, ICMP must also be enabled.
	#if defined(STACK_USE_IP_GLEANING)
	    #if !defined(STACK_USE_ICMP_SERVER)
	        #define STACK_USE_ICMP_SERVER
	    #endif
	#endif

	// Include modules required by specific HTTP demos
	#if !defined(STACK_USE_HTTP2_SERVER)
		#undef STACK_USE_HTTP_EMAIL_DEMO
		#undef STACK_USE_HTTP_MD5_DEMO
		#undef STACK_USE_HTTP_APP_RECONFIG
	#endif
	#if defined(STACK_USE_HTTP_EMAIL_DEMO)
		#if !defined(STACK_USE_SMTP_CLIENT)
			#error HTTP E-mail Demo requires SMTP_CLIENT and HTTP2
		#endif
	#endif
	#if defined(STACK_USE_HTTP_MD5_DEMO)
		#if !defined(STACK_USE_MD5)
			#define STACK_USE_MD5
		#endif
	#endif

	// Can't do MPFS upload without POST or external memory
	#if defined(HTTP_MPFS_UPLOAD)
		#if !defined(HTTP_USE_POST) || (!defined(MPFS_USE_EEPROM) && !defined(MPFS_USE_SPI_FLASH))
			#undef HTTP_MPFS_UPLOAD
		#endif
	#endif

	// Make sure that the DNS client is enabled if services require it
	#if defined(STACK_USE_GENERIC_TCP_CLIENT_EXAMPLE) || \
		defined(STACK_USE_SNTP_CLIENT) || \
		defined(STACK_USE_DYNAMICDNS_CLIENT) || \
		defined(STACK_USE_SMTP_CLIENT)
	    #if !defined(STACK_USE_DNS)
	        #define STACK_USE_DNS
	    #endif
	#endif

	// Make sure that STACK_CLIENT_MODE is defined if a service
	// depends on it
	#if defined(STACK_USE_FTP_SERVER) || \
		defined(STACK_USE_SNMP_SERVER) || \
		defined(STACK_USE_DNS) || \
		defined(STACK_USE_GENERIC_TCP_CLIENT_EXAMPLE) || \
		defined(STACK_USE_TFTP_CLIENT) || \
		defined(STACK_USE_SMTP_CLIENT) || \
		defined(STACK_USE_ICMP_CLIENT) || \
		defined(STACK_USE_DYNAMICDNS_CLIENT) || \
		defined(STACK_USE_SNTP_CLIENT) || \
		defined(STACK_USE_BERKELEY_API) || \
		defined(STACK_USE_SSL_CLIENT) || \
        defined(STACK_USE_AUTO_IP)
		#if !defined(STACK_CLIENT_MODE)
		    #define STACK_CLIENT_MODE
		#endif
	#endif

	// Make sure that STACK_USE_TCP is defined if a service
	// depends on it
	#if defined(STACK_USE_UART2TCP_BRIDGE) || \
		defined(STACK_USE_HTTP2_SERVER) || \
		defined(STACK_USE_FTP_SERVER) || \
		defined(STACK_USE_TELNET_SERVER) || \
		defined(STACK_USE_GENERIC_TCP_CLIENT_EXAMPLE) || \
		defined(STACK_USE_GENERIC_TCP_SERVER_EXAMPLE) || \
		defined(STACK_USE_SMTP_CLIENT) || \
		defined(STACK_USE_TCP_PERFORMANCE_TEST) || \
		defined(STACK_USE_DYNAMICDNS_CLIENT) || \
		defined(STACK_USE_BERKELEY_API) || \
		defined(STACK_USE_SSL_CLIENT) || \
		defined(STACK_USE_SSL_SERVER)
	    #if !defined(STACK_USE_TCP)
	        #define STACK_USE_TCP
	    #endif
	#endif

	// If TCP is not enabled, clear all memory allocations
	#if !defined(STACK_USE_TCP)
		#undef TCP_ETH_RAM_SIZE
		#undef TCP_PIC_RAM_SIZE
		#undef TCP_SPI_RAM_SIZE
		#define TCP_ETH_RAM_SIZE 0u
		#define TCP_PIC_RAM_SIZE 0u
		#define TCP_SPI_RAM_SIZE 0u
	#endif

	// If PIC RAM is used to store TCP socket FIFOs and TCBs,
	// let's allocate it so the linker dynamically chooses
	// where to locate it and prevents other variables from
	// overlapping with it
	#if defined(__TCP_C) && TCP_PIC_RAM_SIZE > 0u
		#if defined(__18CXX) && !defined(HI_TECH_C)
			#pragma udata TCPSocketMemory
		#endif
		static BYTE TCPBufferInPIC[TCP_PIC_RAM_SIZE] __attribute__((far));
		#if defined(__18CXX) && !defined(HI_TECH_C)
			#pragma udata
		#endif
	#endif

	// Make sure that STACK_USE_UDP is defined if a service
	// depends on it
	#if defined(STACK_USE_DHCP_CLIENT) || \
		defined(STACK_USE_DHCP_SERVER) || \
		defined(STACK_USE_DNS) || \
		defined(STACK_USE_NBNS) || \
		defined(STACK_USE_SNMP_SERVER) || \
		defined(STACK_USE_TFTP_CLIENT) || \
		defined(STACK_USE_ANNOUNCE) || \
		defined(STACK_USE_UDP_PERFORMANCE_TEST) || \
		defined(STACK_USE_SNTP_CLIENT) || \
		defined(STACK_USE_BERKELEY_API)
	    #if !defined(STACK_USE_UDP)
	        #define STACK_USE_UDP
	    #endif
	#endif

	// When using SSL server, enable RSA decryption
	#if defined(STACK_USE_SSL_SERVER)
		#define STACK_USE_RSA_DECRYPT
		#define STACK_USE_SSL
	#endif

	// When using SSL client, enable RSA encryption
	#if defined(STACK_USE_SSL_CLIENT)
		#define STACK_USE_RSA_ENCRYPT
		#define STACK_USE_SSL
	#endif

	// If using SSL (either), include the rest of the support modules
	#if defined(STACK_USE_SSL)
		#define STACK_USE_ARCFOUR
		#define STACK_USE_MD5
		#define STACK_USE_SHA1
		#define STACK_USE_RANDOM
	#endif

	// When using either RSA operation, include the RSA module
	#if defined(STACK_USE_RSA_ENCRYPT) || defined(STACK_USE_RSA_DECRYPT)
		#define STACK_USE_RSA
		#define STACK_USE_BIGINT
	#endif

	// Enable the LCD if configured in the hardware profile
	#if defined(LCD_DATA_IO) || defined(LCD_DATA0_IO)
		#define USE_LCD
	#endif

	// SPI Flash MPFS images must start on a block boundary
	#if (defined(STACK_USE_MPFS2)) && \
		defined(MPFS_USE_SPI_FLASH) && ((MPFS_RESERVE_BLOCK & 0x0fff) != 0)
		#error MPFS_RESERVE_BLOCK must be a multiple of 4096 for SPI Flash storage
	#endif

	// HTTP2 requires 2 MPFS2 handles per connection, plus one spare
	#if defined(STACK_USE_HTTP2_SERVER)
		#if MAX_MPFS_HANDLES < ((MAX_HTTP_CONNECTIONS * 2) + 1)
			#error HTTP2 requires 2 MPFS2 file handles per connection, plus one additional.
		#endif
	#endif

#include "StackTsk.h"
#include "Helpers.h"
#include "Delay.h"
#include "Tick.h"
#include "MAC.h"
#include "IP.h"
#include "ARP.h"

#if defined(STACK_USE_BIGINT)
	#include "TCPIP Stack/BigInt.h"
#endif

#if defined(STACK_USE_RSA)
	#include "TCPIP Stack/RSA.h"
#endif

#if defined(STACK_USE_ARCFOUR)
	#include "TCPIP Stack/ARCFOUR.h"
#endif

#if defined(STACK_USE_RANDOM)
	#include "TCPIP Stack/Random.h"
#endif

#if defined(STACK_USE_MD5) || defined(STACK_USE_SHA1)
	#include "Hashes.h"
#endif

#if defined(STACK_USE_UDP)
	#include "UDP.h"
#endif

#if defined(STACK_USE_TCP)
	#include "TCP.h"
#endif

// <editor-fold defaultstate="collapsed" desc="TCP Server Setup">

struct{
    UINT8 Data[AmountOFAttachedBoardsData];
    UINT8 WriteData[10];
    DWORD Timer;
    UINT32 UniqueID;
    UINT8 SoftwareVersion[2];
    UINT8 DeviceType;
    UINT8 DeviceDisconnnected;
    union{
        struct{
            unsigned All:8;
        };
        struct{
            unsigned DataRecived:1;
            unsigned WriteDataAvailable:1;
            unsigned :6;
        };
    }StatusBits;
}Slaves[AmountOFAttachedBoards];

typedef struct{
    UINT8 TCPServerState;
    UINT8 MessageStart[9];
    UINT16 Quantity;
    BYTE Data[255];
    UINT16 OffSet;
    UINT16 SendAmount;
    UINT8 IsConnected;
    TCP_SOCKET	MySocket;
    DWORD	Timer;
}devices;

devices Servers[1+NumberOfModbusServersSockets];
// </editor-fold>                                                 
// <editor-fold defaultstate="collapsed" desc="EEPROM Address's">
#define EEPROMFirstBoot             0
#define EEPROMEnterBootloader		1

#define EEPROMIP1                   2
#define EEPROMIP2                   3
#define EEPROMIP3                   4
#define EEPROMIP4                   5

#define EEPROMSub1                  6
#define EEPROMSub2                  7
#define EEPROMSub3                  8
#define EEPROMSub4                  9

#define EEPROMGate1                 10
#define EEPROMGate2                 11
#define EEPROMGate3                 12
#define EEPROMGate4                 13

#define EEPROMNameChars             (1 + EEPROMGate4)                                   // Max name charaters

#define EEPROMCTRatioPrimary		(1 + EEPROMNameChars + MaximumNameLength)           // 16 Bit
#define EEPROMCTRatioSecondary		(2 + EEPROMCTRatioPrimary)                          // 8 bit

#define EEPROMVoltageUpperThreshold	(1 + EEPROMCTRatioSecondary)                        // 16 bit
#define EEPROMVoltageLowerThreshold	(2 + EEPROMVoltageUpperThreshold)                   // 16 bit

#define EEPROMFreqUpperThreshold	(2 + EEPROMVoltageLowerThreshold)                   // 16 bit
#define EEPROMFreqLowerThreshold	(2 + EEPROMFreqUpperThreshold)                      // 16 bit

#define EEPROMCurrentThreshold      (2 + EEPROMFreqLowerThreshold)                      // 16 bit

#define EEPROMSettings              (2 + EEPROMCurrentThreshold)                        // 8 bit

#define EEPROMHysterisisVoltage     (1 + EEPROMSettings)                                // 8 bit
#define EEPROMHysterisisFrequency   (1 + EEPROMHysterisisVoltage)                       // 8 bit

#define EEPROMNOLoadVoltage         (1 + EEPROMHysterisisFrequency)                     // 8 bit
#define EEPROMNOLoadCurrent         (1 + EEPROMNOLoadVoltage)                           // 8 bit

#define EEPROMKiloWattToggle        (1 + EEPROMNOLoadCurrent)                           // 8 bit

#define EEPROMKiloWattHRByte8       (1 + EEPROMKiloWattToggle)                          // 8 bit
#define EEPROMKiloWattHRByte16      (1 + EEPROMKiloWattHRByte8)                         // 8 bit
#define EEPROMKiloWattHRByte24      (1 + EEPROMKiloWattHRByte16)                        // 8 bit
#define EEPROMKiloWattHRByte32      (1 + EEPROMKiloWattHRByte24)                        // 8 bit

#define EEPROMKiloWattHRByte8T      (1 + EEPROMKiloWattHRByte32)                        // 8 bit
#define EEPROMKiloWattHRByte16T     (1 + EEPROMKiloWattHRByte8T)                        // 8 bit
#define EEPROMKiloWattHRByte24T     (1 + EEPROMKiloWattHRByte16T)                       // 8 bit
#define EEPROMKiloWattHRByte32T     (1 + EEPROMKiloWattHRByte24T)                       // 8 bit

#define EEPROMCurrentCalibrationL1  (1 + EEPROMKiloWattHRByte32T)                      // 32 bit
#define EEPROMCurrentCalibrationL2  (4 + EEPROMCurrentCalibrationL1)                    // 32 bit
#define EEPROMCurrentCalibrationL3  (4 + EEPROMCurrentCalibrationL2)                    // 32 bit

#define EEPROMVoltageCalibrationL1  (4 + EEPROMCurrentCalibrationL3)                    // 32 bit
#define EEPROMVoltageCalibrationL2  (4 + EEPROMVoltageCalibrationL1)                    // 32 bit
#define EEPROMVoltageCalibrationL3  (4 + EEPROMVoltageCalibrationL2)                    // 32 bit

#define EEPROMPowerCalibrationL1    (4 + EEPROMVoltageCalibrationL3)                    // 32 bit
#define EEPROMPowerCalibrationL2    (4 + EEPROMPowerCalibrationL1)                      // 32 bit
#define EEPROMPowerCalibrationL3    (4 + EEPROMPowerCalibrationL2)                      // 32 bit

#define EEPROMBoardCANID            (4+ EEPROMPowerCalibrationL3)                      // 8 bit

#define EEPROMKVAHRByte8            (1 + EEPROMBoardCANID)                              // 8 bit
#define EEPROMKVAHRByte16           (1 + EEPROMKVAHRByte8)                              // 8 bit
#define EEPROMKVAHRByte24           (1 + EEPROMKVAHRByte16)                             // 8 bit
#define EEPROMKVAHRByte32           (1 + EEPROMKVAHRByte24)                             // 8 bit

#define EEPROMKVAHRByte8T           (1 + EEPROMKVAHRByte32)                             // 8 bit
#define EEPROMKVAHRByte16T          (1 + EEPROMKVAHRByte8T)                             // 8 bit
#define EEPROMKVAHRByte24T          (1 + EEPROMKVAHRByte16T)                            // 8 bit
#define EEPROMKVAHRByte32T          (1 + EEPROMKVAHRByte24T)                            // 8 bit

#define EEPROMKVARHRByte8            (1 + EEPROMKVAHRByte32T)                              // 8 bit
#define EEPROMKVARHRByte16           (1 + EEPROMKVARHRByte8)                              // 8 bit
#define EEPROMKVARHRByte24           (1 + EEPROMKVARHRByte16)                             // 8 bit
#define EEPROMKVARHRByte32           (1 + EEPROMKVARHRByte24)                             // 8 bit

#define EEPROMKVARHRByte8T           (1 + EEPROMKVARHRByte32)                             // 8 bit
#define EEPROMKVARHRByte16T          (1 + EEPROMKVARHRByte8T)                             // 8 bit
#define EEPROMKVARHRByte24T          (1 + EEPROMKVARHRByte16T)                            // 8 bit
#define EEPROMKVARHRByte32T          (1 + EEPROMKVARHRByte24T)                            // 8 bit
// </editor-fold>
// <editor-fold defaultstate="collapsed" desc="Serial Struct">
typedef union{
    struct{
        unsigned All:8;
    };
    struct{
        unsigned Configured:1;
        unsigned MessageRecieved:1;
        unsigned SetMessgeReceived:1;
        unsigned :5;
    };
}PIWorkingBits;

#define PICode_MeterData                '0'
#define PICode_MicroHostname            '1'
#define PICode_MicroIP                  '2'
#define PICode_MicroSubnet              '3'
#define PICode_MicroGateway             '4'
#define PICode_MicroMACAddress          '5'
#define PICode_MicroCodeVersion         '6'
#define PICode_MicroPrimaryCT           '7'
#define PICode_MicroSecondayCT          '8'
#define PICode_MicroVoltageUpperTH      '9'
#define PICode_MicroVoltageLowerTH      'A'
#define PICode_MicroVoltageHysteris     'B'
#define PICode_MicroFrequenUpperTH      'C'
#define PICode_MicroFrequenLowerTH      'D'
#define PICode_MicroFrequenHysteris     'E'
#define PICode_MicroCurrentTH           'F'
#define PICode_MicroCanID               'G'
#define PICode_MicroSettings            'H'
#define PICode_ScanWifi                 'I'
#define PICode_WIFISSID                 'J'
#define PICode_WIFISSIDPass             'L'
#define PICode_GetNextSSID              'M'
#define PICode_GetWIFIConnectionStatus  'N'
#define PICode_WIFIDisconnect           'O'

#define PIMicro_Get_Request              'g'
#define PIMicro_Set_Request              's'
#define PIMicro_Responce_Request         'r'

#define PIMicro_NullData                  '0'

struct{
    UINT8 SendArray[40];
    UINT8 RecievedData[40];
    UINT8 RecievedFunctionCode;
    UINT8 AmountOfDataBytesRecevied;
    PIWorkingBits Bits;
}PIConnection;
// </editor-fold>
// <editor-fold defaultstate="collapsed" desc="SNMP servers">
typedef struct{
    UINT8 ServerState;
    UINT8 RemoteIP[5];
    UINT8 ObjectID[15];
    UINT16 ID;
    UDP_SOCKET MySocket;
    WORD AmountOfDataRecieved;
}TypeDefSNMP;

TypeDefSNMP SNMPServers[1+NumberOfSNMPServersSockets];
// </editor-fold>
// <editor-fold defaultstate="collapsed" desc="DeviceTypes">
#define DeviceTypeIs3PhasePowerMeter	1
#define DeviceTypeIsDigitalInput		3
#define DeviceTypeIsRelayOutput         2
#define DeviceTypeIs3AnalogueInput      8
#define DeviceTypeIsBIDirShuntBoard     4
// </editor-fold>

#if defined(STACK_USE_BERKELEY_API)
	#include "BerkeleyAPI.h"
#endif

#if defined(USE_LCD)
	#include "TCPIP Stack/LCDBlocking.h"
#endif

#if defined(STACK_USE_UART2TCP_BRIDGE)
	#include "TCPBridge.h"
#endif

#if defined(STACK_USE_UART)
	#include "TCPIP Stack/UART.h"
#endif

#if defined(STACK_USE_DHCP_CLIENT) || defined(STACK_USE_DHCP_SERVER)
	#include "DHCP.h"
#endif

#if defined(STACK_USE_DNS) || defined(STACK_USE_DNS_SERVER)
	#include "DNS.h"
#endif

#if defined(STACK_USE_MPFS2)
	#include "MPFS2.h"
#endif

#if defined(STACK_USE_FTP_SERVER)
	#include "FTP.h"
#endif


#if defined(STACK_USE_HTTP2_SERVER)
	#ifdef STACK_USE_MDD
		#include "TCPIP Stack/FileSystem.h"
		#include "TCPIP Stack/_HTTP2.h"
	#else
		#include "HTTP2.h"
	#endif
#endif

#if defined(STACK_USE_ICMP_SERVER) || defined(STACK_USE_ICMP_CLIENT)
	#include "ICMP.h"
#endif

#if defined(STACK_USE_ANNOUNCE)
	#include "Annonce.h"
#endif

// <editor-fold defaultstate="collapsed" desc="Ping Items">
struct{
    IP_ADDR ClientIP;
    UINT8 NumberOfTriesClient;
    UINT8 State;
    DWORD Timer;
    LONG ResponceClient;
    union{
	struct{
	    unsigned All:8;
	};
	struct{
	    unsigned PingClient:1;
	    unsigned :7;
	};
    }WorkingBits;
}PINGTask;
// </editor-fold>

#if defined(STACK_USE_SNMP_SERVER)
	#include "TCPIP Stack/SNMP.h"
	#include "mib.h"
#endif

#if defined(STACK_USE_NBNS)
	#include "NBNS.h"
#endif

#if defined(STACK_USE_DNS)
	#include "DNS.h"
#endif

#if defined(STACK_USE_DYNAMICDNS_CLIENT)
	#include "TCPIP Stack/DynDNS.h"
#endif

#if defined(STACK_USE_TELNET_SERVER)
	#include "TCPIP Stack/Telnet.h"
#endif

#if defined(STACK_USE_SMTP_CLIENT)
	#include "SMTP.h"
#endif

#if defined(STACK_USE_TFTP_CLIENT)
	#include "TCPIP Stack/TFTPc.h"
#endif

#if defined(STACK_USE_REBOOT_SERVER)
	#include "TCPIP Stack/Reboot.h"
#endif

#if defined(STACK_USE_SNTP_CLIENT)
	#include "TCPIP Stack/SNTP.h"
#endif

#if defined(STACK_USE_UDP_PERFORMANCE_TEST)
	#include "TCPIP Stack/UDPPerformanceTest.h"
#endif

#if defined(STACK_USE_TCP_PERFORMANCE_TEST)
	#include "TCPIP Stack/TCPPerformanceTest.h"
#endif

#if defined(STACK_USE_SSL)
	#include "TCPIP Stack/SSL.h"
#endif

#if defined(WF_CS_TRIS)
    #include "TCPIP Stack/WFMac.h"
#endif
 
#endif
