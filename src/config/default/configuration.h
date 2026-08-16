/*******************************************************************************
  System Configuration Header

  File Name:
    configuration.h

  Summary:
    Build-time configuration header for the system defined by this project.

  Description:
    An MPLAB Project may have multiple configurations.  This file defines the
    build-time options for a single configuration.

  Remarks:
    This configuration header must not define any prototypes or data
    definitions (or include any files that do).  It only provides macro
    definitions for build-time configuration options

*******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
* Copyright (C) 2018 Microchip Technology Inc. and its subsidiaries.
*
* Subject to your compliance with these terms, you may use Microchip software
* and any derivatives exclusively with Microchip products. It is your
* responsibility to comply with third party license terms applicable to your
* use of third party software (including open source software) that may
* accompany Microchip software.
*
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
* EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
* WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
* PARTICULAR PURPOSE.
*
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
* FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
* ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
* THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
*******************************************************************************/
// DOM-IGNORE-END

#ifndef CONFIGURATION_H
#define CONFIGURATION_H

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************
/*  This section Includes other configuration headers necessary to completely
    define this configuration.
*/

#include "user.h"
#include "device.h"

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

extern "C" {

#endif
// DOM-IGNORE-END

// *****************************************************************************
// *****************************************************************************
// Section: System Configuration
// *****************************************************************************
// *****************************************************************************



// *****************************************************************************
// *****************************************************************************
// Section: System Service Configuration
// *****************************************************************************
// *****************************************************************************
/* TIME System Service Configuration Options */
#define SYS_TIME_INDEX_0                            (0)
#define SYS_TIME_MAX_TIMERS                         (5)
#define SYS_TIME_HW_COUNTER_WIDTH                   (32)
#define SYS_TIME_TICK_FREQ_IN_HZ                    (1220.72175)

#define SYS_CONSOLE_INDEX_0                       0





/* File System Service Configuration */

#define SYS_FS_MEDIA_NUMBER               (1U)
#define SYS_FS_VOLUME_NUMBER              (1U)

#define SYS_FS_AUTOMOUNT_ENABLE           false
#define SYS_FS_MAX_FILES                  (1U)
#define SYS_FS_MAX_FILE_SYSTEM_TYPE       (1U)
#define SYS_FS_MEDIA_MAX_BLOCK_SIZE       (512U)
#define SYS_FS_MEDIA_MANAGER_BUFFER_SIZE  (2048U)
#define SYS_FS_USE_LFN                    (1)
#define SYS_FS_FILE_NAME_LEN              (255U)
#define SYS_FS_CWD_STRING_LEN             (1024)

/* File System RTOS Configurations*/
#define SYS_FS_STACK_SIZE                 1024
#define SYS_FS_PRIORITY                   1

#define SYS_FS_FAT_VERSION                "v0.15"
#define SYS_FS_FAT_READONLY               false
#define SYS_FS_FAT_CODE_PAGE              437
#define SYS_FS_FAT_MAX_SS                 SYS_FS_MEDIA_MAX_BLOCK_SIZE






#define SYS_CONSOLE_DEVICE_MAX_INSTANCES   			(1U)
#define SYS_CONSOLE_UART_MAX_INSTANCES 	   			(1U)
#define SYS_CONSOLE_USB_CDC_MAX_INSTANCES 	   		(0U)
#define SYS_CONSOLE_PRINT_BUFFER_SIZE        		(200U)




// *****************************************************************************
// *****************************************************************************
// Section: Driver Configuration
// *****************************************************************************
// *****************************************************************************
/*** MIIM Driver Configuration ***/
#define DRV_MIIM_ETH_MODULE_ID_0                _ETH_BASE_ADDRESS
#define DRV_MIIM_DRIVER_INDEX_0                 0
#define DRV_MIIM_INSTANCES_NUMBER           1
#define DRV_MIIM_INSTANCE_OPERATIONS        4
#define DRV_MIIM_INSTANCE_CLIENTS           2
#define DRV_MIIM_CLIENT_OP_PROTECTION   true
#define DRV_MIIM_COMMANDS   true
#define DRV_MIIM_DRIVER_OBJECT              DRV_MIIM_OBJECT_BASE_Default            

/* MIIM RTOS Configurations*/
#define DRV_MIIM_RTOS_STACK_SIZE                1024
#define DRV_MIIM_RTOS_TASK_PRIORITY             1




// *****************************************************************************
// *****************************************************************************
// Section: Middleware & Other Library Configuration
// *****************************************************************************
// *****************************************************************************


/*** DNS Client Configuration ***/
#define TCPIP_STACK_USE_DNS
#define TCPIP_DNS_CLIENT_SERVER_TMO					60
#define TCPIP_DNS_CLIENT_TASK_PROCESS_RATE			200
#define TCPIP_DNS_CLIENT_CACHE_ENTRIES				5
#define TCPIP_DNS_CLIENT_CACHE_ENTRY_TMO			0
#define TCPIP_DNS_CLIENT_CACHE_PER_IPV4_ADDRESS		5
#define TCPIP_DNS_CLIENT_CACHE_PER_IPV6_ADDRESS		1
#define TCPIP_DNS_CLIENT_ADDRESS_TYPE			    IP_ADDRESS_TYPE_IPV4
#define TCPIP_DNS_CLIENT_CACHE_DEFAULT_TTL_VAL		1200
#define TCPIP_DNS_CLIENT_LOOKUP_RETRY_TMO			2
#define TCPIP_DNS_CLIENT_MAX_HOSTNAME_LEN			64
#define TCPIP_DNS_CLIENT_MAX_SELECT_INTERFACES		4
#define TCPIP_DNS_CLIENT_DELETE_OLD_ENTRIES			true
#define TCPIP_DNS_CLIENT_CONSOLE_CMD               	true
#define TCPIP_DNS_CLIENT_USER_NOTIFICATION   false



/*** ICMPv4 Server Configuration ***/
#define TCPIP_STACK_USE_ICMP_SERVER
#define TCPIP_ICMP_ECHO_ALLOW_BROADCASTS    false

/*** ICMPv4 Client Configuration ***/
#define TCPIP_STACK_USE_ICMP_CLIENT
#define TCPIP_ICMP_ECHO_REQUEST_TIMEOUT        500
#define TCPIP_ICMP_TASK_TICK_RATE              33
#define TCPIP_STACK_MAX_CLIENT_ECHO_REQUESTS   4
#define TCPIP_ICMP_COMMAND_ENABLE              false


/*** HTTP NET Configuration ***/
/* #define TCPIP_STACK_USE_HTTP_NET_SERVER */
#define TCPIP_HTTP_NET_MAX_HEADER_LEN		    		15
#define TCPIP_HTTP_NET_CACHE_LEN		        		"600"
#define TCPIP_HTTP_NET_TIMEOUT		            		45
#define TCPIP_HTTP_NET_MAX_CONNECTIONS		    		4
#define TCPIP_HTTP_NET_DEFAULT_FILE		        		"index.htm"
#define TCPIP_HTTP_NET_FILENAME_MAX_LEN			        25
#define TCPIP_HTTP_NET_WEB_DIR		        		    "/mnt/mchpSite1/"
#define TCPIP_HTTP_NET_USE_POST
#define TCPIP_HTTP_NET_USE_COOKIES
#define TCPIP_HTTP_NET_USE_AUTHENTICATION
#define TCPIP_HTTP_NET_MAX_DATA_LEN		        		100
#define TCPIP_HTTP_NET_SKT_TX_BUFF_SIZE		    		1024
#define TCPIP_HTTP_NET_SKT_RX_BUFF_SIZE		    		1024
#define TCPIP_HTTP_NET_LISTEN_PORT		    		    80
#define TCPIP_HTTP_NET_CONFIG_FLAGS                       \
                                                        TCPIP_HTTP_NET_MODULE_FLAG_SECURE_DEFAULT |\
                                                        TCPIP_HTTP_NET_MODULE_FLAG_DEFAULT
#define TCPIP_HTTP_NET_TASK_RATE					    33
#define TCPIP_HTTP_NET_RESPONSE_BUFFER_SIZE				300
#define TCPIP_HTTP_NET_COOKIE_BUFFER_SIZE				200
#define TCPIP_HTTP_NET_FIND_PEEK_BUFF_SIZE				512
#define TCPIP_HTTP_NET_FILE_PROCESS_BUFFER_SIZE         512
#define TCPIP_HTTP_NET_FILE_PROCESS_BUFFERS_NUMBER      4
#define TCPIP_HTTP_NET_FILE_PROCESS_BUFFER_RETRIES      10
#define TCPIP_HTTP_NET_CHUNKS_NUMBER                    10
#define TCPIP_HTTP_NET_CHUNK_RETRIES                    10
#define TCPIP_HTTP_NET_MAX_RECURSE_LEVEL				3
#define TCPIP_HTTP_NET_DYNVAR_PROCESS           		1
#define TCPIP_HTTP_NET_DYNVAR_DESCRIPTORS_NUMBER		10
#define TCPIP_HTTP_NET_DYNVAR_MAX_LEN					50
#define TCPIP_HTTP_NET_DYNVAR_ARG_MAX_NUMBER			4
#define TCPIP_HTTP_NET_DYNVAR_PROCESS_RETRIES			10
#define TCPIP_HTTP_NET_SSI_PROCESS           			1
#define TCPIP_HTTP_NET_SSI_ATTRIBUTES_MAX_NUMBER        4
#define TCPIP_HTTP_NET_SSI_STATIC_ATTTRIB_NUMBER        2
#define TCPIP_HTTP_NET_SSI_CMD_MAX_LEN                  100
#define TCPIP_HTTP_NET_SSI_VARIABLES_NUMBER             13
#define TCPIP_HTTP_NET_SSI_VARIABLE_NAME_MAX_LENGTH     10
#define TCPIP_HTTP_NET_SSI_VARIABLE_STRING_MAX_LENGTH   10
#define TCPIP_HTTP_NET_SSI_ECHO_NOT_FOUND_MESSAGE       "SSI Echo - Not Found: "
#define TCPIP_HTTP_NET_CONNECTION_TIMEOUT          	0
#define TCPIP_HTTP_NET_MALLOC_FUNC                  malloc
#define TCPIP_HTTP_NET_FREE_FUNC                    free
#define TCPIP_HTTP_NET_CONSOLE_CMD           		false


/* Number of Endpoints used */
#define DRV_USBFS_ENDPOINTS_NUMBER                        4U

/* The USB Device Layer will not initialize the USB Driver */
#define USB_DEVICE_DRIVER_INITIALIZE_EXPLICIT

/* Maximum device layer instances */
#define USB_DEVICE_INSTANCES_NUMBER                         1U

/* EP0 size in bytes */
#define USB_DEVICE_EP0_BUFFER_SIZE                          64U


/*** TCPIP MAC Configuration ***/
#define TCPIP_EMAC_TX_DESCRIPTORS				    16
#define TCPIP_EMAC_RX_DESCRIPTORS				    16
#define TCPIP_EMAC_RX_DEDICATED_BUFFERS				10
#define TCPIP_EMAC_RX_INIT_BUFFERS				    2
#define TCPIP_EMAC_RX_LOW_THRESHOLD				    2
#define TCPIP_EMAC_RX_LOW_FILL				        3
#define TCPIP_EMAC_MAX_FRAME		    			1536
#define TCPIP_EMAC_LINK_MTU		    			    1500
#define TCPIP_EMAC_RX_BUFF_SIZE		    			1536
#define TCPIP_EMAC_RX_FRAGMENTS		    			1

#define TCPIP_EMAC_RX_FILTERS                       \
                                                    TCPIP_MAC_RX_FILTER_TYPE_BCAST_ACCEPT |\
                                                    TCPIP_MAC_RX_FILTER_TYPE_MCAST_ACCEPT |\
                                                    TCPIP_MAC_RX_FILTER_TYPE_UCAST_ACCEPT |\
                                                    TCPIP_MAC_RX_FILTER_TYPE_RUNT_REJECT |\
                                                    TCPIP_MAC_RX_FILTER_TYPE_CRC_ERROR_REJECT |\
                                                    0
#define TCPIP_EMAC_ETH_OPEN_FLAGS       			\
                                                    TCPIP_ETH_OPEN_AUTO |\
                                                    TCPIP_ETH_OPEN_FDUPLEX |\
                                                    TCPIP_ETH_OPEN_HDUPLEX |\
                                                    TCPIP_ETH_OPEN_100 |\
                                                    TCPIP_ETH_OPEN_10 |\
                                                    TCPIP_ETH_OPEN_MDIX_AUTO |\
                                                    TCPIP_ETH_OPEN_RMII |\
                                                    0

#define TCPIP_INTMAC_MODULE_ID		    			_ETH_BASE_ADDRESS
#define TCPIP_INTMAC_PERIPHERAL_CLK  				80000000

#define DRV_ETHMAC_INTERRUPT_SOURCE				_ETHERNET_IRQ

#define DRV_ETHMAC_INTERRUPT_MODE        			true

#define TCPIP_EMAC_AUTO_FLOW_CONTROL_ENABLE        	true
#define TCPIP_EMAC_FLOW_CONTROL_PAUSE_BYTES         3072
#define TCPIP_EMAC_FLOW_CONTROL_FULL_WMARK          2
#define TCPIP_EMAC_FLOW_CONTROL_EMPTY_WMARK         0

#define DRV_ETHMAC_MULTI_CLIENT        			true



/*** TCP Configuration ***/
#define TCPIP_TCP_MAX_SEG_SIZE_TX		        	1460
#define TCPIP_TCP_SOCKET_DEFAULT_TX_SIZE			512
#define TCPIP_TCP_SOCKET_DEFAULT_RX_SIZE			512
#define TCPIP_TCP_DYNAMIC_OPTIONS             			true
#define TCPIP_TCP_START_TIMEOUT_VAL		        	1000
#define TCPIP_TCP_DELAYED_ACK_TIMEOUT		    		100
#define TCPIP_TCP_FIN_WAIT_2_TIMEOUT		    		5000
#define TCPIP_TCP_KEEP_ALIVE_TIMEOUT		    		10000
#define TCPIP_TCP_CLOSE_WAIT_TIMEOUT		    		0
#define TCPIP_TCP_MAX_RETRIES		            		5
#define TCPIP_TCP_MAX_UNACKED_KEEP_ALIVES			6
#define TCPIP_TCP_MAX_SYN_RETRIES		        	3
#define TCPIP_TCP_AUTO_TRANSMIT_TIMEOUT_VAL			40
#define TCPIP_TCP_WINDOW_UPDATE_TIMEOUT_VAL			200
#define TCPIP_TCP_MAX_SOCKETS		                10
#define TCPIP_TCP_TASK_TICK_RATE		        	5
#define TCPIP_TCP_MSL_TIMEOUT		        	    0
#define TCPIP_TCP_QUIET_TIME		        	    0
#define TCPIP_TCP_COMMANDS   false
#define TCPIP_TCP_EXTERN_PACKET_PROCESS   false
#define TCPIP_TCP_DISABLE_CRYPTO_USAGE		        	    false



/*** DHCP Configuration ***/
#define TCPIP_STACK_USE_DHCP_CLIENT
#define TCPIP_DHCP_TIMEOUT                          10
#define TCPIP_DHCP_TASK_TICK_RATE                   5
#define TCPIP_DHCP_HOST_NAME_SIZE                   20
#define TCPIP_DHCP_CLIENT_CONNECT_PORT              68
#define TCPIP_DHCP_SERVER_LISTEN_PORT               67
#define TCPIP_DHCP_CLIENT_CONSOLE_CMD               true

#define TCPIP_DHCP_USE_OPTION_TIME_SERVER           0
#define TCPIP_DHCP_TIME_SERVER_ADDRESSES            0
#define TCPIP_DHCP_USE_OPTION_NTP_SERVER            0
#define TCPIP_DHCP_NTP_SERVER_ADDRESSES             0
#define TCPIP_DHCP_ARP_LEASE_CHECK_TMO              1000
#define TCPIP_DHCP_WAIT_ARP_FAIL_CHECK_TMO          10



/*** ARP Configuration ***/
#define TCPIP_ARP_CACHE_ENTRIES                 		5
#define TCPIP_ARP_CACHE_DELETE_OLD		        	true
#define TCPIP_ARP_CACHE_SOLVED_ENTRY_TMO			1200
#define TCPIP_ARP_CACHE_PENDING_ENTRY_TMO			60
#define TCPIP_ARP_CACHE_PENDING_RETRY_TMO			2
#define TCPIP_ARP_CACHE_PERMANENT_QUOTA		    		50
#define TCPIP_ARP_CACHE_PURGE_THRESHOLD		    		75
#define TCPIP_ARP_CACHE_PURGE_QUANTA		    		1
#define TCPIP_ARP_CACHE_ENTRY_RETRIES		    		3
#define TCPIP_ARP_GRATUITOUS_PROBE_COUNT			1
#define TCPIP_ARP_TASK_PROCESS_RATE		        	2000
#define TCPIP_ARP_PRIMARY_CACHE_ONLY		        	true
#define TCPIP_ARP_COMMANDS true


/* Maximum instances of CDC function driver */
#define USB_DEVICE_CDC_INSTANCES_NUMBER                     1U


/* CDC Transfer Queue Size for both read and
   write. Applicable to all instances of the
   function driver */
#define USB_DEVICE_CDC_QUEUE_DEPTH_COMBINED                 3U


/* Network Configuration Index 0 */
#define TCPIP_NETWORK_DEFAULT_INTERFACE_NAME_IDX0 "ETHMAC"
#define TCPIP_IF_ETHMAC

#define TCPIP_NETWORK_DEFAULT_HOST_NAME_IDX0              "MCHPBOARD_E"
#define TCPIP_NETWORK_DEFAULT_MAC_ADDR_IDX0               0

#define TCPIP_NETWORK_DEFAULT_IP_ADDRESS_IDX0         "192.168.0.151"
#define TCPIP_NETWORK_DEFAULT_IP_MASK_IDX0            "255.255.255.0"
#define TCPIP_NETWORK_DEFAULT_GATEWAY_IDX0            "192.168.0.1"
#define TCPIP_NETWORK_DEFAULT_DNS_IDX0                "192.168.0.1"
#define TCPIP_NETWORK_DEFAULT_SECOND_DNS_IDX0         "0.0.0.0"
#define TCPIP_NETWORK_DEFAULT_POWER_MODE_IDX0         "full"
#define TCPIP_NETWORK_DEFAULT_INTERFACE_FLAGS_IDX0            \
                                                    TCPIP_NETWORK_CONFIG_DHCP_CLIENT_ON |\
                                                    TCPIP_NETWORK_CONFIG_DNS_CLIENT_ON |\
                                                    TCPIP_NETWORK_CONFIG_IP_STATIC
                                                    
#define TCPIP_NETWORK_DEFAULT_MAC_DRIVER_IDX0         DRV_ETHMAC_PIC32MACObject



#define TCPIP_NETWORK_VLAN_ID_IDX0         0
#define TCPIP_NETWORK_VLAN_PCP_IDX0         0


/*** USB Driver Configuration ***/

/* Maximum USB driver instances */
#define DRV_USBFS_INSTANCES_NUMBER                        1U

/* Polling mode — no USB ISR needed (bare-metal main loop without FreeRTOS scheduler).
   MCC default is true (interrupt mode). Changed to false because the MCC-generated
   ISR wrappers in interrupts_a.S use FreeRTOS portSAVE_CONTEXT/portRESTORE_CONTEXT
   macros that require vTaskStartScheduler() to have been called. In bare-metal mode,
   DRV_USBFS_Tasks() must be called frequently in the main loop to poll USB events.
   If MCC regenerates this file, change this back to false. */
#define DRV_USBFS_INTERRUPT_MODE                          false


/* Enables Device Support */
#define DRV_USBFS_DEVICE_SUPPORT                          true

/* Disable Host Support */
#define DRV_USBFS_HOST_SUPPORT                            false




/* Alignment for buffers that are submitted to USB Driver*/ 
#define USB_ALIGN  CACHE_ALIGN


/*** Berkeley API Configuration ***/
#define TCPIP_STACK_USE_BERKELEY_API
#define MAX_BSD_SOCKETS 					4
#define TCPIP_STACK_USE_BERKELEY_API


/*** IPv4 Configuration ***/
#define TCPIP_IPV4_ARP_SLOTS                        10
/*** IPv4 Fragmentation Configuration ***/
#define TCPIP_IPV4_FRAGMENTATION		        	true
#define TCPIP_IPV4_FRAGMENT_TIMEOUT		        	15
#define TCPIP_IPV4_FRAGMENT_MAX_STREAMS		       	3
#define TCPIP_IPV4_FRAGMENT_MAX_NUMBER		       	4
#define TCPIP_IPV4_TASK_TICK_RATE		       	    37
#define TCPIP_IPV4_EXTERN_PACKET_PROCESS   false

#define TCPIP_IPV4_COMMANDS true

#define TCPIP_IPV4_FORWARDING_ENABLE    false 





/*** TCPIP Heap Configuration ***/
#define TCPIP_STACK_USE_INTERNAL_HEAP
#define TCPIP_STACK_DRAM_SIZE                       39250
#define TCPIP_STACK_DRAM_RUN_LIMIT                  2048

#define TCPIP_STACK_MALLOC_FUNC                     malloc

#define TCPIP_STACK_CALLOC_FUNC                     calloc

#define TCPIP_STACK_FREE_FUNC                       free



#define TCPIP_STACK_HEAP_USE_FLAGS                   TCPIP_STACK_HEAP_FLAG_ALLOC_UNCACHED

#define TCPIP_STACK_HEAP_USAGE_CONFIG                TCPIP_STACK_HEAP_USE_DEFAULT

#define TCPIP_STACK_SUPPORTED_HEAPS                  1




// *****************************************************************************
// *****************************************************************************
// Section: TCPIP Stack Configuration
// *****************************************************************************
// *****************************************************************************

#define TCPIP_STACK_USE_IPV4
#define TCPIP_STACK_USE_TCP
#define TCPIP_STACK_USE_UDP

#define TCPIP_STACK_TICK_RATE		        		5
#define TCPIP_STACK_SECURE_PORT_ENTRIES             10
#define TCPIP_STACK_LINK_RATE		        		333

#define TCPIP_STACK_ALIAS_INTERFACE_SUPPORT   false

#define TCPIP_STACK_VLAN_INTERFACE_SUPPORT   false

#define TCPIP_PACKET_LOG_ENABLE     0

/* TCP/IP stack event notification */
#define TCPIP_STACK_USE_EVENT_NOTIFICATION
#define TCPIP_STACK_USER_NOTIFICATION   false
#define TCPIP_STACK_DOWN_OPERATION   true
#define TCPIP_STACK_IF_UP_DOWN_OPERATION   true
#define TCPIP_STACK_MAC_DOWN_OPERATION  true
#define TCPIP_STACK_INTERFACE_CHANGE_SIGNALING   false
#define TCPIP_STACK_CONFIGURATION_SAVE_RESTORE   true
#define TCPIP_STACK_EXTERN_PACKET_PROCESS   false
#define TCPIP_STACK_RUN_TIME_INIT   false

#define TCPIP_STACK_INTMAC_COUNT           1



/* TCP/IP RTOS Configurations*/
#define TCPIP_RTOS_STACK_SIZE                1024
#define TCPIP_RTOS_PRIORITY             1



/*** announce Configuration ***/
#define TCPIP_STACK_USE_ANNOUNCE
#define TCPIP_ANNOUNCE_MAX_PAYLOAD 	512
#define TCPIP_ANNOUNCE_TASK_RATE    333
#define TCPIP_ANNOUNCE_NETWORK_DIRECTED_BCAST             			false



/*** UDP Configuration ***/
#define TCPIP_UDP_MAX_SOCKETS		                	10
#define TCPIP_UDP_SOCKET_DEFAULT_TX_SIZE		    	512
#define TCPIP_UDP_SOCKET_DEFAULT_TX_QUEUE_LIMIT    	 	3
#define TCPIP_UDP_SOCKET_DEFAULT_RX_QUEUE_LIMIT			3
#define TCPIP_UDP_USE_POOL_BUFFERS   false
#define TCPIP_UDP_USE_TX_CHECKSUM             			true
#define TCPIP_UDP_USE_RX_CHECKSUM             			true
#define TCPIP_UDP_COMMANDS   false
#define TCPIP_UDP_EXTERN_PACKET_PROCESS   false



/*** wolfCrypt Library Configuration ***/
#define MICROCHIP_PIC32
#define MICROCHIP_MPLAB_HARMONY
#define MICROCHIP_MPLAB_HARMONY_3
#define HAVE_MCAPI
#define SIZEOF_LONG_LONG 8
#define WOLFSSL_USER_IO
#define NO_WRITEV
#define NO_FILESYSTEM
#define USE_FAST_MATH
#define NO_PWDBASED
#define HAVE_MCAPI
#define WOLF_CRYPTO_CB  // provide call-back support
#define WOLFCRYPT_ONLY
#if (__XC32_VERSION > 100000000)
#define WOLFSSL_HAVE_MIN
#define WOLFSSL_HAVE_MAX
#endif
#undef WOLFSSL_HAVE_MIN
#undef WOLFSSL_HAVE_MAX
// ---------- FUNCTIONAL CONFIGURATION START ----------
#define WOLFSSL_AES_SMALL_TABLES
#define NO_MD4
#define WOLFSSL_SHA224
#define WOLFSSL_RIPEMD
#define WOLFSSL_AES_128
#define WOLFSSL_AES_192
#define WOLFSSL_AES_256
#define WOLFSSL_AES_DIRECT
#define HAVE_AES_DECRYPT
#define HAVE_AES_ECB
#define HAVE_AES_CBC
#define WOLFSSL_AES_COUNTER
#define WOLFSSL_AES_OFB
#define HAVE_AESGCM
#define HAVE_AESCCM
#define NO_RC4
#define HAVE_HC128
#define NO_RABBIT
#define HAVE_ECC
#define HAVE_CURVE25519
#define NO_DH
#define NO_DSA
#define FP_MAX_BITS 4096
#define USE_CERT_BUFFERS_2048
#define NO_DEV_RANDOM
#define HAVE_HASHDRBG
#define WC_NO_HARDEN
#define FREERTOS
#define NO_SIG_WRAPPER
#define NO_WOLFSSL_MEMORY
#define HAVE_LIBZ
// ---------- FUNCTIONAL CONFIGURATION END ----------

#define DRV_DP83848_PHY_CONFIG_FLAGS       ( 0 \
                                                    | DRV_ETHPHY_CFG_RMII \
                                                    | DRV_ETHPHY_CFG_AUTO \
                                                    )
                                                    
#define DRV_DP83848_PHY_LINK_INIT_DELAY            500
#define DRV_DP83848_PHY_ADDRESS                    1
#define DRV_DP83848_PHY_PERIPHERAL_ID              _ETH_BASE_ADDRESS
#define DRV_ETHPHY_DP83848_NEG_INIT_TMO            1
#define DRV_ETHPHY_DP83848_NEG_DONE_TMO            2000
#define DRV_ETHPHY_DP83848_RESET_CLR_TMO           500



/*** DNS Server Configuration ***/
#define TCPIP_STACK_USE_DNS_SERVER
#define TCPIP_DNSS_HOST_NAME_LEN		    	64
#define TCPIP_DNSS_REPLY_BOARD_ADDR				true
#define TCPIP_DNSS_CACHE_PER_IPV4_ADDRESS		2
#define TCPIP_DNSS_CACHE_PER_IPV6_ADDRESS		1
#define TCPIP_DNSS_TTL_TIME						600
#define TCPIP_DNSS_TASK_PROCESS_RATE			33
#define TCPIP_DNSS_DELETE_OLD_LEASE				true
#define TCPIP_DNSS_CONSOLE_CMD           false
/***Maximum DNS server Cache entries. It is the sum of TCPIP_DNSS_CACHE_PER_IPV4_ADDRESS and TCPIP_DNSS_CACHE_PER_IPV6_ADDRESS.***/
#define TCPIP_DNSS_CACHE_MAX_SERVER_ENTRIES     (TCPIP_DNSS_CACHE_PER_IPV4_ADDRESS + TCPIP_DNSS_CACHE_PER_IPV6_ADDRESS)


#define TCPIP_STACK_NETWORK_INTERAFCE_COUNT  	1


// *****************************************************************************
// Network Presentation (NET_PRES) Layer Configuration
// *****************************************************************************
#define NET_PRES_NUM_INSTANCE                       1
#define NET_PRES_NUM_SOCKETS                        (TCPIP_TCP_MAX_SOCKETS + TCPIP_UDP_MAX_SOCKETS)





// *****************************************************************************
// *****************************************************************************
// Section: Application Configuration
// *****************************************************************************
// *****************************************************************************


//DOM-IGNORE-BEGIN
#ifdef __cplusplus
}
#endif
//DOM-IGNORE-END

#endif // CONFIGURATION_H
/*******************************************************************************
 End of File
*/
