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
;	Filename:			    	SRAMDriver.c
;	Date:				    	January 30, 2009
;	File Version:		  		1.0
;	Compiler Used:			MPLAB IDE 8.20
; 	Author:			  	    	Pinakin K Makwana
;	Company:			    	Microchip Technology, Inc.
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

#include <plib.h>
#include "SRAM.h"
#include "TCPIP.h"


unsigned char SRAMBuf[SRAMPageSize];

void InitSRAM(void)
{
	unsigned int config = SPI_CON_MSTEN | SPI_CON_MODE8 | SPI_SMP_OFF | SPI_CKE_ON | CLK_POL_ACTIVE_HIGH |SPI_CON_ON;    // SPI configuration word
//	PORTSetPinsDigitalOut(IOPORT_F, BIT_2);
//	mPORTFSetBits(BIT_2);
	PORTSetPinsDigitalOut(IOPORT_D, BIT_9);
	mPORTDSetBits(BIT_9);


	#if defined(USE_SPI_Module1)
		SpiChnClose(1);		/* Turn off SPI module 1 */
		SpiChnOpen(1, config, 8);
	#elif defined(USE_SPI_Module2)
		SpiChnClose(2);		/* Turn off SPI module 1 */
		SpiChnOpen(2, config, 8);
	#else
		#error Uncomment any one of the macro in "SRAMDriver.h" USE_SPI_ModuleX(where X = 1 or 2 or 3)
	#endif
}

// <editor-fold defaultstate="collapsed" desc="Write Status Reg">
char SRAMWriteStatusReg(unsigned char WriteVal)
{
	unsigned char ReadData;
	mPORTDClearBits(BIT_9);
	WriteSPI(SRAMWRSR);
	ReadData =ReadSPI();
	WriteSPI(WriteVal);
	ReadData =ReadSPI();
	mPORTDSetBits(BIT_9);
	return(0);			//Return non -ve nuber indicating success
}// </editor-fold>

unsigned char SRAMReadStatusReg(void)
{
	unsigned char ReadData;
//	mPORTFClearBits(BIT_2);
	mPORTDClearBits(BIT_9);
	WriteSPI(SRAMRDSR);
	//while(!SPI_Rx_Buf_Full);
	ReadData =ReadSPI();
	WriteSPI(DummyByte);
	//while(!SPI_Rx_Buf_Full);
	ReadData =ReadSPI();
//	mPORTFSetBits(BIT_2);
	mPORTDSetBits(BIT_9);
	return(ReadData);
}

// <editor-fold defaultstate="collapsed" desc="Send Command to SRAM">
void SRAMCommand(UINT32 Address, unsigned char RWCmd)
{
    UINT8 LowerByte,MiddleByte,UpperByte;

    LowerByte=Address;
    Address=Address>>8;
    MiddleByte=Address;
    Address=Address>>8;
    UpperByte=Address;

    unsigned char ReadData;
    //Send Read or Write command to SRAM
    WriteSPI(RWCmd);
    //while(!SPI_Rx_Buf_Full);
    ReadData =ReadSPI();
    //Send High byte of address to SRAM
    WriteSPI(UpperByte);
    //while(!SPI_Rx_Buf_Full);
    ReadData =ReadSPI();
    //Send Low byte of address to SRAM
    WriteSPI(MiddleByte);
    //while(!SPI_Rx_Buf_Full);
    ReadData =ReadSPI();
    WriteSPI(LowerByte);
    //while(!SPI_Rx_Buf_Full);
    ReadData =ReadSPI();
}// </editor-fold>

//char SRAMWriteByte(unsigned char AddLB,unsigned char AddHB,unsigned char WriteData)
char SRAMWriteByte(UINT32 Address,UINT8 WriteData)
{
	SRAMWriteStatusReg(SRAMByteMode);
//	mPORTFClearBits(BIT_2);
	mPORTDClearBits(BIT_9);
	//Send Write command to SRAM along with address
	SRAMCommand(Address,SRAMWrite);
	//Send Data to be written to SRAM
	WriteSPI(WriteData);
	//while(!SPI_Rx_Buf_Full);
	WriteData =ReadSPI();
//	mPORTFSetBits(BIT_2);
	mPORTDSetBits(BIT_9);
	return(0);			//Return non -ve number indicating success
}

//unsigned char SRAMReadByte(unsigned char AddLB,unsigned char AddHB)
unsigned char SRAMReadByte(UINT32 Address)
{
	unsigned char ReadData;
	SRAMWriteStatusReg(SRAMByteMode);
//	mPORTFClearBits(BIT_2);
	mPORTDClearBits(BIT_9);
	//Send Read command to SRAM along with address
	SRAMCommand(Address,SRAMRead);
	//Send dummy data so SRAM can put desired Data read from SRAM
	WriteSPI(DummyByte);
	//while(!SPI_Rx_Buf_Full);
	ReadData =ReadSPI();
//	mPORTFSetBits(BIT_2);
	mPORTDSetBits(BIT_9);
	return(ReadData);
}

// <editor-fold defaultstate="collapsed" desc="Write a Page worth of data">
unsigned char SRAMTCPWriteData(UINT8 BAtchNumber,UINT8 Quantity,UINT8 InstanceNo, unsigned char *WriteData)
{
    unsigned char ReadData,WriteCnt;
    UINT8 NumberOfPageWrites,i,Temp;
    UINT16 Remainder;
    UINT32 StartAddress;

    StartAddress=StartAddressCalculation(BAtchNumber,InstanceNo);

    // <editor-fold defaultstate="collapsed" desc="Work Out how many 32 Byte Page writes we have to do">
    Remainder=Quantity;

    NumberOfPageWrites=1;

    if(Remainder>=SRAMPageSize)
    {
        Remainder-=SRAMPageSize;

        while(Remainder>=SRAMPageSize)
        {
            NumberOfPageWrites++;

            Remainder-=SRAMPageSize;
        }
    }// </editor-fold>

    // Make Sure the RAM is in Page Wirte
    SRAMWriteStatusReg(SRAMPageMode);

    // Chip select the RAM
    mPORTDClearBits(BIT_9);

    //Send Write command to SRAM along with address
    SRAMCommand(StartAddress,SRAMWrite);

    // <editor-fold defaultstate="collapsed" desc="Send Data to be written to SRAM">
    // Get Rid of the First 8 Bytes of Data as it is the Header
    for(i = 0;i < 9;i++)
            Temp=*WriteData++;

    while(NumberOfPageWrites)
    {
        for(WriteCnt = 0;WriteCnt < SRAMPageSize;WriteCnt++)
        {
                WriteSPI(*WriteData++);
                //while(!SPI_Rx_Buf_Full);

                //Read Dummy Data
                ReadData =ReadSPI();
        }

        NumberOfPageWrites--;
        mPORTDSetBits(BIT_9);

        if(NumberOfPageWrites!=0)
        {
            // Make Sure the RAM is in Page Wirte
            SRAMWriteStatusReg(SRAMPageMode);

            mPORTDClearBits(BIT_9);

            StartAddress+=SRAMPageSize;
            //Send Write command to SRAM along with address
            SRAMCommand(StartAddress,SRAMWrite);
        }

    }

    if(Remainder>0)
    {
        mPORTDClearBits(BIT_9);

        StartAddress+=SRAMPageSize;
        //Send Write command to SRAM along with address
        SRAMCommand(StartAddress,SRAMWrite);

        for(WriteCnt = 0;WriteCnt < SRAMPageSize;WriteCnt++)
        {
                WriteSPI(*WriteData++);
                //while(!SPI_Rx_Buf_Full);

                //Read Dummy Data
                ReadData =ReadSPI();
        }
    }// </editor-fold>

    //Un-chip select it
    mPORTDSetBits(BIT_9);
    return(WriteCnt);			//Return no# of bytes written to SRAM
}// </editor-fold>
// <editor-fold defaultstate="collapsed" desc="Clear a Page worth of data">
unsigned char SRAMClearData(UINT8 BAtchNumber,UINT8 Quantity,UINT8 InstanceNo)
{
    unsigned char ReadData,WriteCnt;
    UINT8 NumberOfPageWrites;
    UINT16 Remainder;
    UINT32 StartAddress;

    StartAddress=StartAddressCalculation(BAtchNumber,InstanceNo);

    // <editor-fold defaultstate="collapsed" desc="Work Out how many 32 Byte Page writes we have to do">
    Remainder=Quantity;

    NumberOfPageWrites=1;

    if(Remainder>=SRAMPageSize)
    {
        Remainder-=SRAMPageSize;

        while(Remainder>=SRAMPageSize)
        {
            NumberOfPageWrites++;

            Remainder-=SRAMPageSize;
        }
    }// </editor-fold>

    // Make Sure the RAM is in Page Wirte
    SRAMWriteStatusReg(SRAMPageMode);

    // Chip select the RAM
    mPORTDClearBits(BIT_9);

    //Send Write command to SRAM along with address
    SRAMCommand(StartAddress,SRAMWrite);

    // <editor-fold defaultstate="collapsed" desc="Send Data to be written to SRAM">
    while(NumberOfPageWrites)
    {
        for(WriteCnt = 0;WriteCnt < SRAMPageSize;WriteCnt++)
        {
                WriteSPI(0x00);
                //while(!SPI_Rx_Buf_Full);

                //Read Dummy Data
                ReadData =ReadSPI();
        }

        NumberOfPageWrites--;
        mPORTDSetBits(BIT_9);

        if(NumberOfPageWrites!=0)
        {
            // Make Sure the RAM is in Page Wirte
            SRAMWriteStatusReg(SRAMPageMode);

            mPORTDClearBits(BIT_9);

            StartAddress+=SRAMPageSize;
            //Send Write command to SRAM along with address
            SRAMCommand(StartAddress,SRAMWrite);
        }

    }

    if(Remainder>0)
    {
        mPORTDClearBits(BIT_9);

        StartAddress+=SRAMPageSize;
        //Send Write command to SRAM along with address
        SRAMCommand(StartAddress,SRAMWrite);

        for(WriteCnt = 0;WriteCnt < SRAMPageSize;WriteCnt++)
        {
                WriteSPI(0x00);
                //while(!SPI_Rx_Buf_Full);

                //Read Dummy Data
                ReadData =ReadSPI();
        }
    }// </editor-fold>

    //Un-chip select it
    mPORTDSetBits(BIT_9);
    return(WriteCnt);			//Return no# of bytes written to SRAM
}// </editor-fold>
// <editor-fold defaultstate="collapsed" desc="Read a Page worth of Data from the Start">
unsigned char SRAMReadPageDataFromStart(UINT8 BAtchNumber,UINT8 Quantity,UINT8 InstanceNo,unsigned char *ReadData)
{
    unsigned char ReadCnt;
    UINT8 NumberOfPageWrites;
    UINT16 Remainder;
    UINT32 StartAddress;

    StartAddress=StartAddressCalculation(BAtchNumber,InstanceNo);

    // <editor-fold defaultstate="collapsed" desc="Work Out how many 32 Byte Page writes we have to do">
    Remainder=Quantity;

    NumberOfPageWrites=1;

    if(Remainder>SRAMPageSize)
    {
        Remainder-=SRAMPageSize;

        while(Remainder>=SRAMPageSize)
        {
            NumberOfPageWrites++;

            Remainder-=SRAMPageSize;
        }
    }// </editor-fold>

    SRAMWriteStatusReg(SRAMPageMode);
    mPORTDClearBits(BIT_9);

    //Send Read command to SRAM along with address
    SRAMCommand(StartAddress,SRAMRead);


    // <editor-fold defaultstate="collapsed" desc="Send dummy data so SRAM can put desired Data read from SRAM">
    while(NumberOfPageWrites)
    {
        for(ReadCnt = 0; ReadCnt < SRAMPageSize; ReadCnt++)
        {
                WriteSPI(DummyByte);
                //while(!SPI_Rx_Buf_Full);
                *ReadData++ =ReadSPI();
        }

        NumberOfPageWrites--;
        mPORTDSetBits(BIT_9);

        if(NumberOfPageWrites!=0)
        {
            mPORTDClearBits(BIT_9);

            StartAddress+=SRAMPageSize;

            //Send Read command to SRAM along with address
            SRAMCommand(StartAddress,SRAMRead);
        }
    }

    if(Remainder>0)
    {
        mPORTDClearBits(BIT_9);

        StartAddress+=SRAMPageSize;

            //Send Read command to SRAM along with address
        SRAMCommand(StartAddress,SRAMRead);

        for(ReadCnt = 0; ReadCnt < Remainder; ReadCnt++)
        {
                WriteSPI(DummyByte);
                //while(!SPI_Rx_Buf_Full);
                *ReadData++ =ReadSPI();
        }
    }
    // </editor-fold>

    mPORTDSetBits(BIT_9);
    return(ReadCnt);			//Return no# of bytes read from SRAM
}// </editor-fold>
// <editor-fold defaultstate="collapsed" desc="Read Data from a specific Address">
unsigned char SRAMReadByteFromLocation(UINT8 BAtchNumber,UINT8 InstanceNo,UINT8 ByteNumber)
{
    unsigned char ReadData;
    UINT32 StartAddress;

    StartAddress=StartAddressCalculation(BAtchNumber,InstanceNo);

    StartAddress+=ByteNumber;

    SRAMWriteStatusReg(SRAMByteMode);

    mPORTDClearBits(BIT_9);
    //Send Read command to SRAM along with address
    SRAMCommand(StartAddress,SRAMRead);
    //Send dummy data so SRAM can put desired Data read from SRAM
    WriteSPI(DummyByte);
//            while(!SPI_Rx_Buf_Full);
    ReadData =ReadSPI();
    mPORTDSetBits(BIT_9);

    return(ReadData);
}// </editor-fold>
// <editor-fold defaultstate="collapsed" desc="Write data to a Specific Location">
char SRAMWriteByteFromLocation(UINT8 BAtchNumber,UINT8 InstanceNo,UINT8 ByteNumber,UINT8 WriteData)
{
    UINT32 StartAddress;

    StartAddress=StartAddressCalculation(BAtchNumber,InstanceNo);
    StartAddress+=ByteNumber;

    SRAMWriteStatusReg(SRAMByteMode);

    mPORTDClearBits(BIT_9);
    //Send Write command to SRAM along with address
    SRAMCommand(StartAddress,SRAMWrite);
    //Send Data to be written to SRAM
    WriteSPI(WriteData);
    //while(!SPI_Rx_Buf_Full);
    WriteData =ReadSPI();

    mPORTDSetBits(BIT_9);
    return(0);			//Return non -ve number indicating success
}// </editor-fold>
// <editor-fold defaultstate="collapsed" desc="Calculate the Start address">
UINT32 StartAddressCalculation(UINT8 BAtchNumber,UINT8 InstanceNo)
{
    UINT32 InitialStartAddress,OffsetFromStartAddress;

    InitialStartAddress=0;
    OffsetFromStartAddress=0;

    // <editor-fold defaultstate="collapsed" desc="work out the offset from the initial start based on the instance number and the amount of space allocated">
    InstanceNo-=1;
    OffsetFromStartAddress=InstanceNo;

    OffsetFromStartAddress*=(AllocatedSpace+AllocatedSpace+AllocatedSpace);

    if(BAtchNumber==RamTypeBatch2)
    {
        OffsetFromStartAddress+=AllocatedSpace;
    }
    else if(BAtchNumber==RamTypeBatch3)
    {
        OffsetFromStartAddress+=AllocatedSpace;
        OffsetFromStartAddress+=AllocatedSpace;
    }
    // </editor-fold>

    InitialStartAddress+=OffsetFromStartAddress;

    return InitialStartAddress;
}// </editor-fold>

unsigned char SRAMWritePage(UINT32 Address, unsigned char *WriteData)
{
	unsigned char ReadData,WriteCnt;
	SRAMWriteStatusReg(SRAMPageMode);
	//Send Write command to SRAM along with address
//	mPORTFClearBits(BIT_2);
	mPORTDClearBits(BIT_9);
	SRAMCommand(Address,SRAMWrite);
	//Send Data to be written to SRAM
	for(WriteCnt = 0;WriteCnt < SRAMPageSize;WriteCnt++)
	{
		WriteSPI(*WriteData++);
		//while(!SPI_Rx_Buf_Full);
		ReadData =ReadSPI();
	}
//	mPORTFSetBits(BIT_2);
	mPORTDSetBits(BIT_9);
	return(WriteCnt);			//Return no# of bytes written to SRAM
}

unsigned char SRAMReadPage(UINT32 Address,unsigned char *ReadData)
{
	unsigned char ReadCnt;
	SRAMWriteStatusReg(SRAMPageMode);
	//Send Read command to SRAM along with address
//	mPORTFClearBits(BIT_2);
	mPORTDClearBits(BIT_9);
	SRAMCommand(Address,SRAMRead);
	//Send dummy data so SRAM can put desired Data read from SRAM
	for(ReadCnt = 0; ReadCnt < SRAMPageSize; ReadCnt++)
	{
		WriteSPI(DummyByte);
		//while(!SPI_Rx_Buf_Full);
		*ReadData++ =ReadSPI();
	}
//	mPORTFSetBits(BIT_2);
	mPORTDSetBits(BIT_9);
	return(ReadCnt);			//Return no# of bytes read from SRAM
}

char SRAMWriteSeq(UINT32 Address, unsigned char *WriteData,unsigned int WriteCnt)
{
	unsigned char DummyRead;
	SRAMWriteStatusReg(SRAMSeqMode);
	//Send Write command to SRAM along with address
//	mPORTFClearBits(BIT_2);
	mPORTDClearBits(BIT_9);
	SRAMCommand(Address,SRAMWrite);
	//Send Data to be written to SRAM
	for(;WriteCnt > 0;WriteCnt--)
	{
		WriteSPI(*WriteData++);
		//while(!SPI_Rx_Buf_Full);
		DummyRead =ReadSPI();
	}
//	mPORTFSetBits(BIT_2);
	mPORTDSetBits(BIT_9);
	return(0);			//Return non -ve nuber indicating success
}

char SRAMReadSeq(UINT32 Address,unsigned char *ReadData,unsigned int ReadCnt)
{
	//SRAMWriteStatusReg(SRAMSeqMode);
	//Send Read command to SRAM along with address
//	mPORTFClearBits(BIT_2);
	mPORTDClearBits(BIT_9);
	SRAMCommand(Address,SRAMRead);
	//Send dummy data so SRAM can put desired Data read from SRAM
	for(; ReadCnt > 0; ReadCnt--)
	{
		WriteSPI(DummyByte);
		//while(!SPI_Rx_Buf_Full);
		*ReadData++ =ReadSPI();
	}
//	mPORTFSetBits(BIT_2);
	mPORTDSetBits(BIT_9);
	return(0);			//Return non -ve nuber indicating success
}


