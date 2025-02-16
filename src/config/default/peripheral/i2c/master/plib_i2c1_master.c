/*******************************************************************************
  Inter-Integrated Circuit (I2C) Library
  Source File

  Company:
    Microchip Technology Inc.

  File Name:
    plib_i2c1_master.c

  Summary:
    I2C PLIB Master Mode Implementation file

  Description:
    This file defines the interface to the I2C peripheral library.
    This library provides access to and control of the associated peripheral
    instance.

*******************************************************************************/
// DOM-IGNORE-BEGIN
/*******************************************************************************
* Copyright (C) 2018-2019 Microchip Technology Inc. and its subsidiaries.
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

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include "device.h"
#include "plib_i2c1_master.h"

#include "peripheral/i2c/master/plib_i2c1_master_local.h"
// *****************************************************************************
// *****************************************************************************
// Section: Global Data
// *****************************************************************************
// *****************************************************************************
#define NOP asm(" NOP")


volatile static I2C_OBJ i2c1MasterObj;


void I2C1_MasterInitialize(void)
{
    /* Disable the I2C Master interrupt */
    IEC0CLR = _IEC0_I2C1MIE_MASK;

    /* Disable the I2C Bus collision interrupt */
    IEC0CLR = _IEC0_I2C1BIE_MASK;

    I2C1BRG = 78;


    /* Clear master interrupt flag */
    IFS0CLR = _IFS0_I2C1MIF_MASK;

    /* Clear fault interrupt flag */
    IFS0CLR = _IFS0_I2C1BIF_MASK;


    /* Set the initial state of the I2C state machine */
    i2c1MasterObj.state = I2C_STATE_IDLE;
}

/* I2C state machine */
static void I2C1_MasterTransferSM(void)
{
    uint8_t tempVar = 0;
    bool isScanInProgress = false;
    IFS0CLR = _IFS0_I2C1MIF_MASK;

    switch (i2c1MasterObj.state)
    {
        case I2C_STATE_START_CONDITION:
            /* Generate Start Condition */
            I2C1CONSET = _I2C1CON_SEN_MASK;
            IEC0SET = _IEC0_I2C1MIE_MASK;
            IEC0SET = _IEC0_I2C1BIE_MASK;
            i2c1MasterObj.state = I2C_STATE_ADDR_BYTE_1_SEND;
            break;

        case I2C_STATE_ADDR_BYTE_1_SEND:
            /* Is transmit buffer full? */
            if ((I2C1STAT & _I2C1STAT_TBF_MASK) == 0U)
            {
                if (i2c1MasterObj.address > 0x007FU)
                {
                    tempVar = (((volatile uint8_t*)&i2c1MasterObj.address)[1] << 1);
                    /* Transmit the MSB 2 bits of the 10-bit slave address, with R/W = 0 */
                    I2C1TRN = (uint32_t)( 0xF0U | (uint32_t)tempVar);

                    i2c1MasterObj.state = I2C_STATE_ADDR_BYTE_2_SEND;
                }
                else
                {
                    /* 8-bit addressing mode */
                    I2C_TRANSFER_TYPE transferType = i2c1MasterObj.transferType;

                    I2C1TRN = (((uint32_t)i2c1MasterObj.address << 1) | transferType);

                    if (i2c1MasterObj.transferType == I2C_TRANSFER_TYPE_WRITE)
                    {
                        i2c1MasterObj.state = I2C_STATE_WRITE;
                    }
                    else
                    {
                        i2c1MasterObj.state = I2C_STATE_READ;
                    }
                }
            }
            break;

        case I2C_STATE_ADDR_BYTE_2_SEND:
            /* Transmit the 2nd byte of the 10-bit slave address */
            if ((I2C1STAT & _I2C1STAT_ACKSTAT_MASK) == 0U)
            {
                if ((I2C1STAT & _I2C1STAT_TBF_MASK) == 0U)
                {
                    /* Transmit the remaining 8-bits of the 10-bit address */
                    I2C1TRN = i2c1MasterObj.address;

                    if (i2c1MasterObj.transferType == I2C_TRANSFER_TYPE_WRITE)
                    {
                        i2c1MasterObj.state = I2C_STATE_WRITE;
                    }
                    else
                    {
                        i2c1MasterObj.state = I2C_STATE_READ_10BIT_MODE;
                    }
                }
            }
            else
            {
                /* NAK received. Generate Stop Condition. */
                i2c1MasterObj.error = I2C_ERROR_NACK;
                I2C1CONSET = _I2C1CON_PEN_MASK;
                i2c1MasterObj.state = I2C_STATE_WAIT_STOP_CONDITION_COMPLETE;
            }
            break;

        case I2C_STATE_READ_10BIT_MODE:
            if ((I2C1STAT & _I2C1STAT_ACKSTAT_MASK) == 0U)
            {
                /* Generate repeated start condition */
                I2C1CONSET = _I2C1CON_RSEN_MASK;
                i2c1MasterObj.state = I2C_STATE_ADDR_BYTE_1_SEND_10BIT_ONLY;
            }
            else
            {
                /* NAK received. Generate Stop Condition. */
                i2c1MasterObj.error = I2C_ERROR_NACK;
                I2C1CONSET = _I2C1CON_PEN_MASK;
                i2c1MasterObj.state = I2C_STATE_WAIT_STOP_CONDITION_COMPLETE;
            }
            break;

        case I2C_STATE_ADDR_BYTE_1_SEND_10BIT_ONLY:
            /* Is transmit buffer full? */
            if ((I2C1STAT & _I2C1STAT_TBF_MASK) == 0U)
            {
                tempVar = (((volatile uint8_t*)&i2c1MasterObj.address)[1] << 1);
                /* Transmit the first byte of the 10-bit slave address, with R/W = 1 */
                I2C1TRN = (uint32_t)( 0xF1U | (uint32_t)tempVar);
                i2c1MasterObj.state = I2C_STATE_READ;
            }
            else
            {
                /* NAK received. Generate Stop Condition. */
                i2c1MasterObj.error = I2C_ERROR_NACK;
                I2C1CONSET = _I2C1CON_PEN_MASK;
                i2c1MasterObj.state = I2C_STATE_WAIT_STOP_CONDITION_COMPLETE;
            }
            break;

        case I2C_STATE_WRITE:
            if ((I2C1STAT & _I2C1STAT_ACKSTAT_MASK) == 0U)
            {
                size_t writeCount = i2c1MasterObj.writeCount;

                /* ACK received */
                if (writeCount < i2c1MasterObj.writeSize)
                {
                    if ((I2C1STAT & _I2C1STAT_TBF_MASK) == 0U)
                    {
                        /* Transmit the data from writeBuffer[] */
                        I2C1TRN = i2c1MasterObj.writeBuffer[writeCount];
                        i2c1MasterObj.writeCount++;
                    }
                }
                else
                {
                    size_t readSize = i2c1MasterObj.readSize;

                    if (i2c1MasterObj.readCount < readSize)
                    {
                        /* Generate repeated start condition */
                        I2C1CONSET = _I2C1CON_RSEN_MASK;

                        i2c1MasterObj.transferType = I2C_TRANSFER_TYPE_READ;

                        if (i2c1MasterObj.address > 0x007FU)
                        {
                            /* Send the I2C slave address with R/W = 1 */
                            i2c1MasterObj.state = I2C_STATE_ADDR_BYTE_1_SEND_10BIT_ONLY;
                        }
                        else
                        {
                            /* Send the I2C slave address with R/W = 1 */
                            i2c1MasterObj.state = I2C_STATE_ADDR_BYTE_1_SEND;
                        }

                    }
                    else
                    {
                        /* Transfer Complete. Generate Stop Condition */
                        I2C1CONSET = _I2C1CON_PEN_MASK;
                        i2c1MasterObj.state = I2C_STATE_WAIT_STOP_CONDITION_COMPLETE;
                    }
                }
            }
            else
            {
                /* NAK received. Generate Stop Condition. */
                i2c1MasterObj.error = I2C_ERROR_NACK;
                I2C1CONSET = _I2C1CON_PEN_MASK;
                i2c1MasterObj.state = I2C_STATE_WAIT_STOP_CONDITION_COMPLETE;
            }
            break;

        case I2C_STATE_READ:
            if ((I2C1STAT & _I2C1STAT_ACKSTAT_MASK) == 0U)
            {
                /* Slave ACK'd the device address. Enable receiver. */
                I2C1CONSET = _I2C1CON_RCEN_MASK;
                i2c1MasterObj.state = I2C_STATE_READ_BYTE;
            }
            else
            {
                /* NAK received. Generate Stop Condition. */
                i2c1MasterObj.error = I2C_ERROR_NACK;
                I2C1CONSET = _I2C1CON_PEN_MASK;
                i2c1MasterObj.state = I2C_STATE_WAIT_STOP_CONDITION_COMPLETE;
            }
            break;

        case I2C_STATE_READ_BYTE:
            /* Data received from the slave */
            if ((I2C1STAT & _I2C1STAT_RBF_MASK) != 0U)
            {
                size_t readCount = i2c1MasterObj.readCount;
                uint8_t readByte = (uint8_t)I2C1RCV;

                i2c1MasterObj.readBuffer[readCount] = readByte;
                readCount++;
                if (readCount == i2c1MasterObj.readSize)
                {
                    /* Send NAK */
                    I2C1CONSET = _I2C1CON_ACKDT_MASK;
                    I2C1CONSET = _I2C1CON_ACKEN_MASK;
                }
                else
                {
                    /* Send ACK */
                    I2C1CONCLR = _I2C1CON_ACKDT_MASK;
                    I2C1CONSET = _I2C1CON_ACKEN_MASK;
                }

                i2c1MasterObj.readCount = readCount;

                i2c1MasterObj.state = I2C_STATE_WAIT_ACK_COMPLETE;
            }
            break;

        case I2C_STATE_WAIT_ACK_COMPLETE:
            {
                size_t readSize = i2c1MasterObj.readSize;
                /* ACK or NAK sent to the I2C slave */


                if (i2c1MasterObj.readCount < readSize)
                {
                    /* Enable receiver */
                    I2C1CONSET = _I2C1CON_RCEN_MASK;
                    i2c1MasterObj.state = I2C_STATE_READ_BYTE;
                }
                else
                {
                    /* Generate Stop Condition */
                    I2C1CONSET = _I2C1CON_PEN_MASK;
                    i2c1MasterObj.state = I2C_STATE_WAIT_STOP_CONDITION_COMPLETE;
                }
            }
            break;

        case I2C_STATE_WAIT_STOP_CONDITION_COMPLETE:
            i2c1MasterObj.state = I2C_STATE_IDLE;
            IEC0CLR = _IEC0_I2C1MIE_MASK;
            IEC0CLR = _IEC0_I2C1BIE_MASK;

            isScanInProgress = i2c1MasterObj.busScanInProgress;

            if ((i2c1MasterObj.callback != NULL) && (isScanInProgress == false))
            {
                uintptr_t context = i2c1MasterObj.context;

                i2c1MasterObj.callback(context);
            }
            break;

        default:
                 /* Do Nothing */
            break;
    }
}

static void I2C1_MasterXferStart(void)
{
    I2C1CONSET      = _I2C1CON_SEN_MASK;
    IEC0SET        = _IEC0_I2C1MIE_MASK;
    IEC0SET           = _IEC0_I2C1BIE_MASK;
}

static bool I2C1_MasterXferSetup(
    uint16_t address,
    uint8_t* wdata,
    size_t wlength,
    uint8_t* rdata,
    size_t rlength,
    bool forcedWrite,
    bool smbusReadBlk,
    bool smbusReadPEC
)
{
    bool status = false;
    uint32_t tempVar = I2C1STAT;
    /* State machine must be idle and I2C module should not have detected a start bit on the bus */
    if((i2c1MasterObj.state == I2C_STATE_IDLE) &&
       ((tempVar & _I2C1STAT_S_MASK) == 0U) &&
       ((wdata != NULL && wlength != 0) || (rdata != NULL && rlength != 0)))
    {
        i2c1MasterObj.address             = address;
        i2c1MasterObj.readBuffer          = rdata;
        i2c1MasterObj.readSize            = rlength;
        i2c1MasterObj.writeBuffer         = wdata;
        i2c1MasterObj.writeSize           = wlength;
        i2c1MasterObj.writeCount          = 0;
        i2c1MasterObj.readCount           = 0;
        if (wdata != NULL && wlength != 0)
    {
            i2c1MasterObj.transferType    = I2C_TRANSFER_TYPE_WRITE;
        }
        else
        {
            i2c1MasterObj.transferType    = I2C_TRANSFER_TYPE_READ;
        }
        i2c1MasterObj.error               = I2C_ERROR_NONE;
        i2c1MasterObj.state               = I2C_STATE_ADDR_BYTE_1_SEND;
        i2c1MasterObj.smbusReadBlk        = smbusReadBlk;
        i2c1MasterObj.smbusReadPEC        = smbusReadPEC;
        status = true;
    }
    return status;
    }

void I2C1_MasterCallbackRegister(I2C_CALLBACK callback, uintptr_t contextHandle)
{
    if (callback != NULL)
    {
       i2c1MasterObj.callback = callback;
       i2c1MasterObj.context = contextHandle;
    }
    return;
}

bool I2C1_MasterIsBusy(void)
{
    bool busycheck = false;
    uint32_t tempVar = I2C1CON;
    uint32_t tempVar1 = I2C1STAT;
    if( (i2c1MasterObj.state != I2C_STATE_IDLE ) || ((tempVar & 0x0000001FU) != 0U) ||
        ((tempVar1 & _I2C1STAT_TRSTAT_MASK) != 0U) || (( tempVar1 & _I2C1STAT_S_MASK) != 0U) )
    {
        busycheck = true;
    }
    return busycheck;
    }

bool I2C1_MasterRead(uint16_t address, uint8_t* rdata, size_t rlength)
    {
    bool statusRead = false;
    statusRead = I2C1_MasterXferSetup(address, NULL, 0, rdata, rlength, false, false, false);
    if (statusRead == true)
    {
        I2C1_MasterXferStart();
    }
    return statusRead;
}

bool I2C1_MasterWrite(uint16_t address, uint8_t* wdata, size_t wlength)
{
    bool statusWrite = false;
    statusWrite = I2C1_MasterXferSetup(address, wdata, wlength, NULL, 0, false, false, false);

    if (statusWrite == true)
    {
        I2C1_MasterXferStart();
    }
    return statusWrite;
    }


bool I2C1_MasterWriteRead(uint16_t address, uint8_t* wdata, size_t wlength, uint8_t* rdata, size_t rlength)
{
    bool statusWriteRead = false;
    statusWriteRead = I2C1_MasterXferSetup(address, wdata, wlength, rdata, rlength, false, false, false);

    if (statusWriteRead == true)
    {
        I2C1_MasterXferStart();
    }
    return statusWriteRead;
}


bool I2C1_MasterBusScan(uint16_t start_addr, uint16_t end_addr, void* pDevicesList, uint8_t* nDevicesFound)
{
    uint8_t* pDevList = (uint8_t*)pDevicesList;
    uint8_t nDevFound = 0;

    if (i2c1MasterObj.state != I2C_STATE_IDLE)
    {
        return false;
    }

    if ((pDevicesList == NULL) || (nDevicesFound == NULL))
    {
        return false;
    }

    i2c1MasterObj.busScanInProgress = true;

    *nDevicesFound = 0;

    for (uint16_t dev_addr = start_addr; dev_addr <= end_addr; dev_addr++)
    {
        while (I2C1_MasterWrite(dev_addr, NULL, 0) == false)
        {

        }

        while (i2c1MasterObj.state != I2C_STATE_IDLE)
        {
            /* Wait for the transfer to complete */
        }

        if (i2c1MasterObj.error == I2C_ERROR_NONE)
        {
            /* No error and device responded with an ACK. Add the device to the list of found devices. */
            if (dev_addr > 0x007FU)
            {
                ((uint16_t*)&pDevicesList)[nDevFound] = dev_addr;
            }
            else
            {
                pDevList[nDevFound] = (uint8_t)dev_addr;
            }

            nDevFound += 1;
        }
    }

    *nDevicesFound = nDevFound;

    i2c1MasterObj.busScanInProgress = false;

    return true;
}

I2C_ERROR I2C1_MasterErrorGet(void)
{
    I2C_ERROR error;

    error = i2c1MasterObj.error;
    i2c1MasterObj.error = I2C_ERROR_NONE;

    return error;
}

bool I2C1_MasterTransferSetup(I2C_TRANSFER_SETUP* setup, uint32_t srcClkFreq )
{
    uint32_t baudValue;
    uint32_t i2cClkSpeed;
    float fBaudValue;

    if (setup == NULL)
    {
        return false;
    }

    i2cClkSpeed = setup->clkSpeed;

    /* Maximum I2C clock speed cannot be greater than 1 MHz */
    if (i2cClkSpeed > 1000000U)
    {
        return false;
    }

    if( srcClkFreq == 0U)
    {
        srcClkFreq = 8000000UL;
    }

    fBaudValue = (((float)srcClkFreq / 2.0f) * ((1.0f / (float)i2cClkSpeed) - 0.000000130f)) - 1.0f;
    baudValue = (uint32_t)fBaudValue;

    /* I2CxBRG value cannot be from 0 to 3 or more than the size of the baud rate register */
    if ((baudValue < 4U) || (baudValue > 4095U))
    {
        return false;
    }

    I2C1BRG = baudValue;

    /* Enable slew rate for 400 kHz clock speed; disable for all other speeds */

    if (i2cClkSpeed == 400000U)
    {
        I2C1CONCLR = _I2C1CON_DISSLW_MASK;;
    }
    else
    {
        I2C1CONSET = _I2C1CON_DISSLW_MASK;;
    }

    return true;
}

void I2C1_MasterTransferAbort( void )
{
    i2c1MasterObj.error = I2C_ERROR_NONE;

    // Reset the PLib objects and Interrupts
    i2c1MasterObj.state = I2C_STATE_IDLE;
    IEC0CLR = _IEC0_I2C1MIE_MASK;
    IEC0CLR = _IEC0_I2C1BIE_MASK;

    // Disable and Enable I2C Master
    I2C1CONCLR = _I2C1CON_ON_MASK;
    NOP;NOP;
    I2C1CONSET = _I2C1CON_ON_MASK;
}

void __attribute__((used)) I2C1_MASTER_InterruptHandler(void)
{
    I2C1_MasterTransferSM();
}

void __attribute__((used)) I2C1_MasterBUS_InterruptHandler(void)
{
    i2c1MasterObj.state = I2C_STATE_IDLE;

    i2c1MasterObj.error = I2C_ERROR_BUS_COLLISION;

    if (i2c1MasterObj.callback != NULL)
    {
        uintptr_t context = i2c1MasterObj.context;

        i2c1MasterObj.callback(context);
    }
}

