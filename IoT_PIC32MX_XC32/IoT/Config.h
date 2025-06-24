/***************************************************************************
 * Author:  Pascal Courvoisier
 * Date:    May 2020
 * 
 * Configuration file for defaults and naming
 ***************************************************************************/
#define DefaultIP1                          10
#define DefaultIP2                          0
#define DefaultIP3                          1
#define DefaultIP4                          30

#define DefaultSub1                         255
#define DefaultSub2                         255
#define DefaultSub3                         0
#define DefaultSub4                         0

#define DefaultGate1                        0
#define DefaultGate2                        0
#define DefaultGate3                        0
#define DefaultGate4                        0

#define DefaultUpperVoltageThreshold        25500           // Divide by 100
#define DefaultLowerVoltageThreshold        20700           // Divide by 100

#define DefaultUpperFrequencyThreshold      5500            // Divide by 100
#define DefaultLowerFrequencyThreshold      4500            // Divide by 100

#define DefaultCTRatioPrimary               400
#define DefaultCTRatioSeconday              5

#define DefaultHysterisisVoltage            1               // Precentage of nominal 240V, i.e. 5%
#define DefaultHysterisisFrequency          1               // Precentage of nominal 50hz, i.e. 5%

#define DefaultNoLoadVoltage                5               // Precentage, i.e. 5%
#define DefaultNoLoadCurrent                1               // Precentage, i.e. 1%

#define CodeVersion                         "V1.7.1"
/*******************************************************************************
 * Verison History
 *******************************************************************************
 * V1.7.1
 * V1.7
 *  - PPA on CAN buss as slaves on this device
 * 
 * V1.6
 *  - The ability to swop the CT current
 * 
 * V1.5
 *  - Zero the current on the CT if no load
 * 
 * V1.4
 *  - Secondary CT save from webpage bug, was saving as 2 byts, but it is only 1
 *    Byte, made the secondary CT value 0
 * 
 * V1.3
 *  - SPI Timeout introduced, the SPI would get stuck
 * 
 * V1.2
 *  - CAN buss total active and apprent power scaling
 * 
 * V1.1
 *  - Calibration page changes made to see the values
 *  - improved the energy accumulation
 * 
 * V1.0
 * - Inital release.
 *******************************************************************************/

// Define the number of Battery Banks attached to the controller
#define MY_DEFAULT_HOST_NAME                "PPA-230"
#define MYDiscoveryNAME                     "PolyPhase Meter"

// Number of connection we can do at once
#define NumberOfSimultaneousConnection		10
// Number of Modbus connection we can take
#define NumberOfModbusServersSockets		10
// Number of SNMP Trap connection we can take
#define NumberOfSNMPServersSockets          2
// Define Maximum Name length
#define MaximumNameLength                   25
// Transmit frequeceny if Slave
#define CANTransmitPeriod                      TICK_SECOND/2ul
// the amount of allowed boards to be attatched
#define AmountOFAttachedBoards              20
// Amount of data allowed per attached board
#define AmountOFAttachedBoardsData          100
