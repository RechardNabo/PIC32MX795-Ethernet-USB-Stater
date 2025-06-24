/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;
;                     Software License Agreement
;
;     ©2007 Microchip Technology Inc
;     Mirochip Technology Inc. ("Microchip") licenses this software to
;     you solely for the use with Microchip Products. The software is
;     owned by Microchip and is protected under applicable copyright
;     laws. All rights reserved.
;
;     SOFTWARE IS PROVIDED "AS IS." MICROCHIP EXPRESSLY DISCLAIMS ANY
;     WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
;     LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
;     PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL MICROCHIP
;     BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
;     DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
;     PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
;     BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
;     ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
;
;
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;	Filename:			    	SRAMDriver.h
;	Date:				    	January 30, 2009
;	File Version:		  		1.0
;	Compiler Used:			MPLAB IDE 8.20
; 	Author:			  	    	Pinakin K Makwana
;	Company:			    	Microchip Technology, Inc.
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
#include "TCPIP.h"

#define SYS_FREQ 		(80000000L)

#define		USE_SPI_Module1

#define  	SRAMRead   					0x03     	//Read Command for SRAM
#define  	SRAMWrite  					0x02     	//Write Command for SRAM
#define 	SRAMRDSR   					0x05     	//Read the status register
#define  	SRAMWRSR  					0x01     	//Write the status register
#define		SRAMByteMode				0x00
#define		SRAMPageMode				0x80
#define		SRAMSeqMode				0x40
#define		SRAMPageSize				32
#define		DummyByte					0xFF


	#define	WriteSPI(a)					SpiChnPutC(1, a); 	//WriteSPI1(a)
	#define	ReadSPI()					SpiChnGetC(1);//ReadSPI1(a)
	#define SPI_Rx_Buf_Full					SPI1STATbits.SPIRBF

#define		SRAM_CS					BIT_2			//RB2 used as Chip Select

// <editor-fold defaultstate="collapsed" desc="Prototypes">
extern void InitSRAM(void);
extern unsigned char SRAMReadStatusReg(void);
void SRAMCommand(UINT32 Address, unsigned char RWCmd);
extern char SRAMWriteStatusReg(unsigned char WriteVal);
extern char SRAMWriteByte(UINT32 Address,UINT8 WriteData);
extern unsigned char SRAMReadByte(UINT32 Address);
extern unsigned char SRAMTCPWriteData(UINT8 BAtchNumber,UINT8 Quantity,UINT8 InstanceNo, unsigned char *WriteData);
extern unsigned char SRAMReadPageDataFromStart(UINT8 BAtchNumber,UINT8 Quantity,UINT8 InstanceNo,unsigned char *ReadData);
extern unsigned char SRAMReadByteFromLocation(UINT8 BAtchNumber,UINT8 InstanceNo,UINT8 ByteNumber);
extern char SRAMWriteByteFromLocation(UINT8 Type,UINT8 InstanceNo,UINT8 ByteNumber,UINT8 WriteData);
unsigned char SRAMClearData(UINT8 Type,UINT8 Quantity,UINT8 InstanceNo);
extern unsigned char SRAMReadPage(UINT32 Address,unsigned char *ReadData);
extern char SRAMWriteSeq(UINT32 Address, unsigned char *WriteData,unsigned int WriteCnt);
extern char SRAMReadSeq(UINT32 Address,unsigned char *ReadData,unsigned int ReadCnt);
UINT32 StartAddressCalculation(UINT8 BAtchNumber,UINT8 InstanceNo);
// </editor-fold>

#define AllocatedSpace                          192

#define ExternRam_BatteryCardsStartAddress      0

#define RamTypeBatteryVoltage                       0
#define RamTypeBatteryTemperature                   1
#define RamTypeBatteryConfig                        2

#define RamTypeBatch1                       0
#define RamTypeBatch2                       1
#define RamTypeBatch3                       2
