/*******************************************************************************
  Inter-Integrated Circuit (I2C) Library
  Source File

  Company:
    Microchip Technology Inc.

  File Name:
    plib_i2c2_master_slave.c

  Summary:
    I2C PLIB Master Slave Common Implementation file

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
#include "interrupts.h"
#include "plib_i2c2_master_slave.h"
#include "peripheral/i2c/master/plib_i2c2_master_local.h"
#include "peripheral/i2c/slave/plib_i2c2_slave_local.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global Data
// *****************************************************************************
// *****************************************************************************
void I2C2_Initialize(void)
{
    /* Turn off the I2C module */
    I2C2CONCLR = _I2C2CON_ON_MASK;
    
    I2C2_MasterInitialize();
    
    I2C2_SlaveInitialize();
    

    I2C2CONSET = _I2C2CON_DISSLW_MASK;

    
    /* Turn on the I2C module */
    I2C2CONSET = _I2C2CON_ON_MASK;
}

void __attribute__((used)) I2C_2_InterruptHandler(void)
{
    uint32_t iec_bus_reg = IEC1;
    uint32_t iec_master_slave_reg = IEC1;
    if (((IFS1 & _IFS1_I2C2BIF_MASK) != 0U) &&
         ((iec_bus_reg & _IEC1_I2C2BIE_MASK) != 0U))
    {
        /* Clear the bus collision error status bit */
        I2C2STATCLR = _I2C2STAT_BCL_MASK;
        
        /* ACK the bus interrupt */
        IFS1CLR = _IFS1_I2C2BIF_MASK;
    
        I2C2_MasterBUS_InterruptHandler();
    
        I2C2_SlaveBUS_InterruptHandler();
    }
    else if (((IFS1 & _IFS1_I2C2MIF_MASK) != 0U) &&
             ((iec_master_slave_reg & _IEC1_I2C2MIE_MASK) != 0U))
    {
        I2C2_MASTER_InterruptHandler();
    }
    else if (((IFS1 & _IFS1_I2C2SIF_MASK) != 0U) &&
             ((iec_master_slave_reg & _IEC1_I2C2SIE_MASK) != 0U))
    {
        I2C2_SLAVE_InterruptHandler();
    }
    else
    {
        /* Do Nothing */
    }
}