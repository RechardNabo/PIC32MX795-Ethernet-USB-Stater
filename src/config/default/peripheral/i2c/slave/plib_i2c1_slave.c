/*******************************************************************************
  Inter-Integrated Circuit (I2C) Library
  Source File

  Company:
    Microchip Technology Inc.

  File Name:
    plib_i2c1_slave.c

  Summary:
    I2C PLIB Slave Implementation file

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
#include "plib_i2c1_slave.h"

#include "peripheral/i2c/slave/plib_i2c1_slave_local.h"
// *****************************************************************************
// *****************************************************************************
// Section: Global Data
// *****************************************************************************
// *****************************************************************************
#define I2C1_SLAVE_DATA_SETUP_TIME_CORE_TIMER_CNTS          1
#define I2C1_SLAVE_RISE_TIME_CORE_TIMER_CNTS                4

volatile static I2C_SLAVE_OBJ i2c1SlaveObj;

void I2C1_SlaveInitialize(void)
{

    I2C1CONSET = (_I2C1CON_STREN_MASK | _I2C1CON_A10M_MASK );

    I2C1ADD = 0x54;

    I2C1MSK = 0x00;

    /* Clear slave interrupt flag */
    IFS0CLR = _IFS0_I2C1SIF_MASK;

    /* Clear fault interrupt flag */
    IFS0CLR = _IFS0_I2C1BIF_MASK;

    /* Enable the I2C Slave interrupt */
    IEC0SET = _IEC0_I2C1SIE_MASK;

    /* Enable the I2C Bus collision interrupt */
    IEC0SET = _IEC0_I2C1BIE_MASK;

    i2c1SlaveObj.callback = NULL;

}

static void I2C1_SlaveRiseAndSetupTime(uint8_t sdaState)
{
    uint32_t startCount, endCount;

    if (sdaState == 0U)
    {
        endCount = I2C1_SLAVE_DATA_SETUP_TIME_CORE_TIMER_CNTS;
    }
    else
    {
        endCount = I2C1_SLAVE_DATA_SETUP_TIME_CORE_TIMER_CNTS + I2C1_SLAVE_RISE_TIME_CORE_TIMER_CNTS;
    }

    startCount =_CP0_GET_COUNT();

    while((_CP0_GET_COUNT()- startCount) < endCount)
    {
           /* Wait for timeout */
    }
}

/* I2C slave state machine */
static void I2C1_SlaveTransferSM(void)
{
    uint32_t i2c_addr;
    uint8_t sdaValue = 0U;
    uintptr_t context = i2c1SlaveObj.context;

    /* ACK the slave interrupt */
    IFS0CLR = _IFS0_I2C1SIF_MASK;

    if ((I2C1STAT & _I2C1STAT_D_A_MASK) == 0U)
    {
        if ((I2C1STAT & _I2C1STAT_RBF_MASK) != 0U)
        {
            /* Received I2C address must be read out */
            i2c_addr = I2C1RCV;
            (void)i2c_addr;

            if ((I2C1STAT & _I2C1STAT_ADD10_MASK) != 0U)
            {
                /* Notify that a address match event has occurred */
                if (i2c1SlaveObj.callback != NULL)
                {
                    (void)i2c1SlaveObj.callback(I2C_SLAVE_TRANSFER_EVENT_ADDR_MATCH, context);

                    if ((I2C1STAT & _I2C1STAT_R_W_MASK) != 0U)
                    {
                        /* I2C master wants to read */
                        if ((I2C1STAT & _I2C1STAT_TBF_MASK) == 0U)
                        {
                            /* In the callback, slave must write to transmit register by calling I2Cx_WriteByte() */
                            (void)i2c1SlaveObj.callback(I2C_SLAVE_TRANSFER_EVENT_TX_READY, context);

                            sdaValue = (i2c1SlaveObj.lastByteWritten & 0x80U);
                            I2C1_SlaveRiseAndSetupTime(sdaValue);
                        }
                    }
                }
            }
        /* Data written by the application; release the clock stretch */
        I2C1CONSET = _I2C1CON_SCLREL_MASK;
        }
    }
    else
    {
        /* Master reads from slave, slave transmits */
        if ((I2C1STAT & _I2C1STAT_R_W_MASK) != 0U)
        {
            if (((I2C1STAT & (_I2C1STAT_TBF_MASK | _I2C1STAT_ACKSTAT_MASK))  == 0U))
            {
                if (i2c1SlaveObj.callback != NULL)
                {
                    /* I2C master wants to read. In the callback, slave must write to transmit register */
                    (void)i2c1SlaveObj.callback(I2C_SLAVE_TRANSFER_EVENT_TX_READY, context);

                    sdaValue = (i2c1SlaveObj.lastByteWritten & 0x80U);
                }

                I2C1_SlaveRiseAndSetupTime(sdaValue);

                /* Data written by the application; release the clock stretch */
                I2C1CONSET = _I2C1CON_SCLREL_MASK;
            }
        }
        /* Master writes to slave, slave receives */
        else
        {
            if ((I2C1STAT & _I2C1STAT_RBF_MASK) != 0U)
            {
                if (i2c1SlaveObj.callback != NULL)
                {
                    /* I2C master wants to write. In the callback, slave must read data by calling I2Cx_ReadByte()  */
                    (void)i2c1SlaveObj.callback(I2C_SLAVE_TRANSFER_EVENT_RX_READY, context);
                }
                /* Data read by the application; release the clock stretch */
                I2C1CONSET = _I2C1CON_SCLREL_MASK;
            }
        }
    }
}

void I2C1_SlaveCallbackRegister(I2C_SLAVE_CALLBACK callback, uintptr_t contextHandle)
{
    if (callback != NULL)
    {
        i2c1SlaveObj.callback = callback;
        i2c1SlaveObj.context = contextHandle;
    }
}

bool I2C1_SlaveIsBusy(void)
{
    return ((I2C1STAT & _I2C1STAT_S_MASK) != 0U);
}

uint8_t I2C1_SlaveReadByte(void)
{
    uint8_t readByte = (uint8_t)I2C1RCV;
    return readByte;
}

void I2C1_SlaveWriteByte(uint8_t wrByte)
{
    if ((I2C1STAT & _I2C1STAT_TBF_MASK) == 0U)
    {
        I2C1TRN = wrByte;
        i2c1SlaveObj.lastByteWritten = wrByte;
    }
}

I2C_SLAVE_TRANSFER_DIR I2C1_SlaveTransferDirGet(void)
{
    return ((I2C1STAT & _I2C1STAT_R_W_MASK) != 0U) ? I2C_SLAVE_TRANSFER_DIR_READ : I2C_SLAVE_TRANSFER_DIR_WRITE;
}

I2C_SLAVE_ACK_STATUS I2C1_SlaveLastByteAckStatusGet(void)
{
    return ((I2C1STAT & _I2C1STAT_ACKSTAT_MASK) != 0U) ? I2C_SLAVE_ACK_STATUS_RECEIVED_NAK : I2C_SLAVE_ACK_STATUS_RECEIVED_ACK;
}

I2C_SLAVE_ERROR I2C1_SlaveErrorGet(void)
{
    I2C_SLAVE_ERROR error;

    error = i2c1SlaveObj.error;
    i2c1SlaveObj.error = I2C_SLAVE_ERROR_NONE;

    return error;
}




void I2C1_SlaveBUS_InterruptHandler(void)
{    
    i2c1SlaveObj.error = I2C_SLAVE_ERROR_BUS_COLLISION;

    if (i2c1SlaveObj.callback != NULL)
    {
        uintptr_t context = i2c1SlaveObj.context;

        (void) i2c1SlaveObj.callback(I2C_SLAVE_TRANSFER_EVENT_ERROR, context);
    }
}

void __attribute__((used)) I2C1_SLAVE_InterruptHandler(void)
{
    I2C1_SlaveTransferSM();
}

