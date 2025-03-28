/*******************************************************************************
  Input Capture (ICAP2) Peripheral Library (PLIB)

  Company:
    Microchip Technology Inc.

  File Name:
    plib_icap2.c

  Summary:
    ICAP2 Source File

  Description:
    None

*******************************************************************************/

/*******************************************************************************
* Copyright (C) 2019 Microchip Technology Inc. and its subsidiaries.
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
#include "plib_icap2.h"
#include "interrupts.h"

volatile static ICAP_OBJECT icap2Obj;
// *****************************************************************************

// *****************************************************************************
// Section: ICAP2 Implementation
// *****************************************************************************
// *****************************************************************************


void ICAP2_Initialize (void)
{
    /*Setup IC2CON    */
    /*ICM     = 1        */
    /*ICI     = 0        */
    /*ICTMR = 0*/
    /*C32     = 0        */
    /*FEDGE = 0        */
    /*SIDL     = false    */

    IC2CON = 0x1;


        IEC0SET = _IEC0_IC2IE_MASK;
}


void ICAP2_Enable (void)
{
    IC2CONSET = _IC2CON_ON_MASK;
}


void ICAP2_Disable (void)
{
    IC2CONCLR = _IC2CON_ON_MASK;
}

uint16_t ICAP2_CaptureBufferRead (void)
{
    return (uint16_t)IC2BUF;
}



void ICAP2_CallbackRegister(ICAP_CALLBACK callback, uintptr_t context)
{
    icap2Obj.callback = callback;
    icap2Obj.context = context;
}

void __attribute__((used)) INPUT_CAPTURE_2_InterruptHandler(void)
{
    uint32_t iec_reg_read = IEC0;
    uint32_t error_reg_read = IEC1;
    uintptr_t context = icap2Obj.context; 
    if( (icap2Obj.callback != NULL))
    {
        icap2Obj.callback(context);
    }
    if (((IFS0 & _IFS0_IC2IF_MASK) != 0U) &&
        ((iec_reg_read & _IEC0_IC2IE_MASK) != 0U))
    {
        IFS0CLR = _IFS0_IC2IF_MASK;    //Clear IRQ flag
    }
    if (((IFS1 & _IFS1_IC2EIF_MASK) != 0U) &&
        ((error_reg_read & _IEC1_IC2EIE_MASK) != 0U))
    {
        IFS1CLR = _IFS1_IC2EIF_MASK;    //Clear IRQ flag
    }

}


bool ICAP2_ErrorStatusGet (void)
{
    bool status = false;
    status = (((IC2CON >> ICAP_STATUS_OVERFLOW) & 0x1U) != 0U);
    return status;
}
