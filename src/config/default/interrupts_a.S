/*******************************************************************************
  System Interrupts File

  Company:
    Microchip Technology Inc.

  File Name:
    interrupt_a.S

  Summary:
    Raw ISR definitions.

  Description:
    This file maps all the interrupt vectors to their corresponding
    implementations. If a particular module interrupt is used, then its ISR
    definition can be found in corresponding PLIB source file. If a module
    interrupt is not used, then its ISR implementation is mapped to dummy
    handler.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
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
// DOM-IGNORE-END

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <xc.h>
#include "ISR_Support.h"

   .extern  TIMER_2_Handler

   .section .vector_8,code, keep
   .equ     __vector_dispatch_8, IntVectorTIMER_2_Handler
   .global  __vector_dispatch_8
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorTIMER_2_Handler

IntVectorTIMER_2_Handler:
    la    $26,  _TIMER_2_Handler
    jr    $26
    nop
    .end    IntVectorTIMER_2_Handler

   .section .TIMER_2_Handler_vector_text, code, keep
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  _TIMER_2_Handler

_TIMER_2_Handler:
    # Bare-metal ISR wrapper — does NOT use FreeRTOS portSAVE_CONTEXT/
    # portRESTORE_CONTEXT macros, which require vTaskStartScheduler() to have
    # been called. Saves/restores registers on the current stack and returns
    # with eret. Same layout as the USB bare-metal wrapper (132 bytes).
    mfc0    k0, _CP0_EPC
    addiu   sp, sp, -132
    sw      k0, 124(sp)

    mfc0    k1, _CP0_STATUS
    sw      k1, 128(sp)

    sw      ra, 120(sp)
    sw      s8, 116(sp)
    sw      s6, 44(sp)
    sw      s5, 40(sp)
    sw      t9, 112(sp)
    sw      t8, 108(sp)
    sw      t7, 104(sp)
    sw      t6, 100(sp)
    sw      t5, 96(sp)
    sw      t4, 92(sp)
    sw      t3, 88(sp)
    sw      t2, 84(sp)
    sw      t1, 80(sp)
    sw      t0, 76(sp)
    sw      a3, 72(sp)
    sw      a2, 68(sp)
    sw      a1, 64(sp)
    sw      a0, 60(sp)
    sw      v1, 56(sp)
    sw      v0, 52(sp)
    sw      $1, 16(sp)

    mfhi    k0
    sw      k0, 12(sp)
    mflo    k0
    sw      k0, 8(sp)

    la      s6, TIMER_2_Handler
    jalr    s6
    nop

    lw      k0, 8(sp)
    mtlo    k0
    lw      k0, 12(sp)
    mthi    k0

    lw      $1, 16(sp)
    lw      v0, 52(sp)
    lw      v1, 56(sp)
    lw      a0, 60(sp)
    lw      a1, 64(sp)
    lw      a2, 68(sp)
    lw      a3, 72(sp)
    lw      t0, 76(sp)
    lw      t1, 80(sp)
    lw      t2, 84(sp)
    lw      t3, 88(sp)
    lw      t4, 92(sp)
    lw      t5, 96(sp)
    lw      t6, 100(sp)
    lw      t7, 104(sp)
    lw      t8, 108(sp)
    lw      t9, 112(sp)
    lw      s8, 116(sp)
    lw      ra, 120(sp)
    lw      s5, 40(sp)
    lw      s6, 44(sp)

    di
    ehb
    lw      k0, 124(sp)
    mtc0    k0, _CP0_EPC
    lw      k1, 128(sp)
    lui     k0, 0xFFFF
    ori     k0, k0, 0xE3FF
    and     k1, k1, k0
    mtc0    k1, _CP0_STATUS
    addiu   sp, sp, 132
    ehb
    eret
    nop
    .end    _TIMER_2_Handler
   .extern  TIMER_3_Handler

   .section .vector_12,code, keep
   .equ     __vector_dispatch_12, IntVectorTIMER_3_Handler
   .global  __vector_dispatch_12
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorTIMER_3_Handler

IntVectorTIMER_3_Handler:
    la    $26,  _TIMER_3_Handler
    jr    $26
    nop
    .end    IntVectorTIMER_3_Handler

   .section .TIMER_3_Handler_vector_text, code, keep
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  _TIMER_3_Handler

_TIMER_3_Handler:
    # Bare-metal ISR wrapper � does NOT use FreeRTOS portSAVE_CONTEXT/
    # portRESTORE_CONTEXT macros, which require vTaskStartScheduler() to have
    # been called. Saves/restores registers on the current stack and returns
    # with eret. Same layout as the USB bare-metal wrapper (132 bytes).
    mfc0    k0, _CP0_EPC
    addiu   sp, sp, -132
    sw      k0, 124(sp)

    mfc0    k1, _CP0_STATUS
    sw      k1, 128(sp)

    sw      ra, 120(sp)
    sw      s8, 116(sp)
    sw      s6, 44(sp)
    sw      s5, 40(sp)
    sw      t9, 112(sp)
    sw      t8, 108(sp)
    sw      t7, 104(sp)
    sw      t6, 100(sp)
    sw      t5, 96(sp)
    sw      t4, 92(sp)
    sw      t3, 88(sp)
    sw      t2, 84(sp)
    sw      t1, 80(sp)
    sw      t0, 76(sp)
    sw      a3, 72(sp)
    sw      a2, 68(sp)
    sw      a1, 64(sp)
    sw      a0, 60(sp)
    sw      v1, 56(sp)
    sw      v0, 52(sp)
    sw      $1, 16(sp)

    mfhi    k0
    sw      k0, 12(sp)
    mflo    k0
    sw      k0, 8(sp)

    la      s6, TIMER_3_Handler
    jalr    s6
    nop

    lw      k0, 8(sp)
    mtlo    k0
    lw      k0, 12(sp)
    mthi    k0

    lw      $1, 16(sp)
    lw      v0, 52(sp)
    lw      v1, 56(sp)
    lw      a0, 60(sp)
    lw      a1, 64(sp)
    lw      a2, 68(sp)
    lw      a3, 72(sp)
    lw      t0, 76(sp)
    lw      t1, 80(sp)
    lw      t2, 84(sp)
    lw      t3, 88(sp)
    lw      t4, 92(sp)
    lw      t5, 96(sp)
    lw      t6, 100(sp)
    lw      t7, 104(sp)
    lw      t8, 108(sp)
    lw      t9, 112(sp)
    lw      s8, 116(sp)
    lw      ra, 120(sp)
    lw      s5, 40(sp)
    lw      s6, 44(sp)

    di
    ehb
    lw      k0, 124(sp)
    mtc0    k0, _CP0_EPC
    lw      k1, 128(sp)
    lui     k0, 0xFFFF
    ori     k0, k0, 0xE3FF
    and     k1, k1, k0
    mtc0    k1, _CP0_STATUS
    addiu   sp, sp, 132
    ehb
    eret
    nop
    .end    _TIMER_3_Handler
   .extern  UART_1_Handler

   .section .vector_24,code, keep
   .equ     __vector_dispatch_24, IntVectorUART_1_Handler
   .global  __vector_dispatch_24
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorUART_1_Handler

IntVectorUART_1_Handler:
    la    $26,  _UART_1_Handler
    jr    $26
    nop
    .end    IntVectorUART_1_Handler

   .section .UART_1_Handler_vector_text, code, keep
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  _UART_1_Handler

_UART_1_Handler:
    # Bare-metal ISR wrapper � does NOT use FreeRTOS portSAVE_CONTEXT/
    # portRESTORE_CONTEXT macros, which require vTaskStartScheduler() to have
    # been called. Saves/restores registers on the current stack and returns
    # with eret. Same layout as the USB bare-metal wrapper (132 bytes).
    mfc0    k0, _CP0_EPC
    addiu   sp, sp, -132
    sw      k0, 124(sp)

    mfc0    k1, _CP0_STATUS
    sw      k1, 128(sp)

    sw      ra, 120(sp)
    sw      s8, 116(sp)
    sw      s6, 44(sp)
    sw      s5, 40(sp)
    sw      t9, 112(sp)
    sw      t8, 108(sp)
    sw      t7, 104(sp)
    sw      t6, 100(sp)
    sw      t5, 96(sp)
    sw      t4, 92(sp)
    sw      t3, 88(sp)
    sw      t2, 84(sp)
    sw      t1, 80(sp)
    sw      t0, 76(sp)
    sw      a3, 72(sp)
    sw      a2, 68(sp)
    sw      a1, 64(sp)
    sw      a0, 60(sp)
    sw      v1, 56(sp)
    sw      v0, 52(sp)
    sw      $1, 16(sp)

    mfhi    k0
    sw      k0, 12(sp)
    mflo    k0
    sw      k0, 8(sp)

    la      s6, UART_1_Handler
    jalr    s6
    nop

    lw      k0, 8(sp)
    mtlo    k0
    lw      k0, 12(sp)
    mthi    k0

    lw      $1, 16(sp)
    lw      v0, 52(sp)
    lw      v1, 56(sp)
    lw      a0, 60(sp)
    lw      a1, 64(sp)
    lw      a2, 68(sp)
    lw      a3, 72(sp)
    lw      t0, 76(sp)
    lw      t1, 80(sp)
    lw      t2, 84(sp)
    lw      t3, 88(sp)
    lw      t4, 92(sp)
    lw      t5, 96(sp)
    lw      t6, 100(sp)
    lw      t7, 104(sp)
    lw      t8, 108(sp)
    lw      t9, 112(sp)
    lw      s8, 116(sp)
    lw      ra, 120(sp)
    lw      s5, 40(sp)
    lw      s6, 44(sp)

    di
    ehb
    lw      k0, 124(sp)
    mtc0    k0, _CP0_EPC
    lw      k1, 128(sp)
    lui     k0, 0xFFFF
    ori     k0, k0, 0xE3FF
    and     k1, k1, k0
    mtc0    k1, _CP0_STATUS
    addiu   sp, sp, 132
    ehb
    eret
    nop
    .end    _UART_1_Handler
   .extern  DMA_0_Handler

   .section .vector_36,code, keep
   .equ     __vector_dispatch_36, IntVectorDMA_0_Handler
   .global  __vector_dispatch_36
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorDMA_0_Handler

IntVectorDMA_0_Handler:
    la    $26,  _DMA_0_Handler
    jr    $26
    nop
    .end    IntVectorDMA_0_Handler

   .section .DMA_0_Handler_vector_text, code, keep
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  _DMA_0_Handler

_DMA_0_Handler:
    # Bare-metal ISR wrapper � does NOT use FreeRTOS portSAVE_CONTEXT/
    # portRESTORE_CONTEXT macros, which require vTaskStartScheduler() to have
    # been called. Saves/restores registers on the current stack and returns
    # with eret. Same layout as the USB bare-metal wrapper (132 bytes).
    mfc0    k0, _CP0_EPC
    addiu   sp, sp, -132
    sw      k0, 124(sp)

    mfc0    k1, _CP0_STATUS
    sw      k1, 128(sp)

    sw      ra, 120(sp)
    sw      s8, 116(sp)
    sw      s6, 44(sp)
    sw      s5, 40(sp)
    sw      t9, 112(sp)
    sw      t8, 108(sp)
    sw      t7, 104(sp)
    sw      t6, 100(sp)
    sw      t5, 96(sp)
    sw      t4, 92(sp)
    sw      t3, 88(sp)
    sw      t2, 84(sp)
    sw      t1, 80(sp)
    sw      t0, 76(sp)
    sw      a3, 72(sp)
    sw      a2, 68(sp)
    sw      a1, 64(sp)
    sw      a0, 60(sp)
    sw      v1, 56(sp)
    sw      v0, 52(sp)
    sw      $1, 16(sp)

    mfhi    k0
    sw      k0, 12(sp)
    mflo    k0
    sw      k0, 8(sp)

    la      s6, DMA_0_Handler
    jalr    s6
    nop

    lw      k0, 8(sp)
    mtlo    k0
    lw      k0, 12(sp)
    mthi    k0

    lw      $1, 16(sp)
    lw      v0, 52(sp)
    lw      v1, 56(sp)
    lw      a0, 60(sp)
    lw      a1, 64(sp)
    lw      a2, 68(sp)
    lw      a3, 72(sp)
    lw      t0, 76(sp)
    lw      t1, 80(sp)
    lw      t2, 84(sp)
    lw      t3, 88(sp)
    lw      t4, 92(sp)
    lw      t5, 96(sp)
    lw      t6, 100(sp)
    lw      t7, 104(sp)
    lw      t8, 108(sp)
    lw      t9, 112(sp)
    lw      s8, 116(sp)
    lw      ra, 120(sp)
    lw      s5, 40(sp)
    lw      s6, 44(sp)

    di
    ehb
    lw      k0, 124(sp)
    mtc0    k0, _CP0_EPC
    lw      k1, 128(sp)
    lui     k0, 0xFFFF
    ori     k0, k0, 0xE3FF
    and     k1, k1, k0
    mtc0    k1, _CP0_STATUS
    addiu   sp, sp, 132
    ehb
    eret
    nop
    .end    _DMA_0_Handler
   .extern  DMA_1_Handler

   .section .vector_37,code, keep
   .equ     __vector_dispatch_37, IntVectorDMA_1_Handler
   .global  __vector_dispatch_37
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorDMA_1_Handler

IntVectorDMA_1_Handler:
    la    $26,  _DMA_1_Handler
    jr    $26
    nop
    .end    IntVectorDMA_1_Handler

   .section .DMA_1_Handler_vector_text, code, keep
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  _DMA_1_Handler

_DMA_1_Handler:
    # Bare-metal ISR wrapper � does NOT use FreeRTOS portSAVE_CONTEXT/
    # portRESTORE_CONTEXT macros, which require vTaskStartScheduler() to have
    # been called. Saves/restores registers on the current stack and returns
    # with eret. Same layout as the USB bare-metal wrapper (132 bytes).
    mfc0    k0, _CP0_EPC
    addiu   sp, sp, -132
    sw      k0, 124(sp)

    mfc0    k1, _CP0_STATUS
    sw      k1, 128(sp)

    sw      ra, 120(sp)
    sw      s8, 116(sp)
    sw      s6, 44(sp)
    sw      s5, 40(sp)
    sw      t9, 112(sp)
    sw      t8, 108(sp)
    sw      t7, 104(sp)
    sw      t6, 100(sp)
    sw      t5, 96(sp)
    sw      t4, 92(sp)
    sw      t3, 88(sp)
    sw      t2, 84(sp)
    sw      t1, 80(sp)
    sw      t0, 76(sp)
    sw      a3, 72(sp)
    sw      a2, 68(sp)
    sw      a1, 64(sp)
    sw      a0, 60(sp)
    sw      v1, 56(sp)
    sw      v0, 52(sp)
    sw      $1, 16(sp)

    mfhi    k0
    sw      k0, 12(sp)
    mflo    k0
    sw      k0, 8(sp)

    la      s6, DMA_1_Handler
    jalr    s6
    nop

    lw      k0, 8(sp)
    mtlo    k0
    lw      k0, 12(sp)
    mthi    k0

    lw      $1, 16(sp)
    lw      v0, 52(sp)
    lw      v1, 56(sp)
    lw      a0, 60(sp)
    lw      a1, 64(sp)
    lw      a2, 68(sp)
    lw      a3, 72(sp)
    lw      t0, 76(sp)
    lw      t1, 80(sp)
    lw      t2, 84(sp)
    lw      t3, 88(sp)
    lw      t4, 92(sp)
    lw      t5, 96(sp)
    lw      t6, 100(sp)
    lw      t7, 104(sp)
    lw      t8, 108(sp)
    lw      t9, 112(sp)
    lw      s8, 116(sp)
    lw      ra, 120(sp)
    lw      s5, 40(sp)
    lw      s6, 44(sp)

    di
    ehb
    lw      k0, 124(sp)
    mtc0    k0, _CP0_EPC
    lw      k1, 128(sp)
    lui     k0, 0xFFFF
    ori     k0, k0, 0xE3FF
    and     k1, k1, k0
    mtc0    k1, _CP0_STATUS
    addiu   sp, sp, 132
    ehb
    eret
    nop
    .end    _DMA_1_Handler
   .extern  DMA_2_Handler

   .section .vector_38,code, keep
   .equ     __vector_dispatch_38, IntVectorDMA_2_Handler
   .global  __vector_dispatch_38
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorDMA_2_Handler

IntVectorDMA_2_Handler:
    la    $26,  _DMA_2_Handler
    jr    $26
    nop
    .end    IntVectorDMA_2_Handler

   .section .DMA_2_Handler_vector_text, code, keep
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  _DMA_2_Handler

_DMA_2_Handler:
    # Bare-metal ISR wrapper � does NOT use FreeRTOS portSAVE_CONTEXT/
    # portRESTORE_CONTEXT macros, which require vTaskStartScheduler() to have
    # been called. Saves/restores registers on the current stack and returns
    # with eret. Same layout as the USB bare-metal wrapper (132 bytes).
    mfc0    k0, _CP0_EPC
    addiu   sp, sp, -132
    sw      k0, 124(sp)

    mfc0    k1, _CP0_STATUS
    sw      k1, 128(sp)

    sw      ra, 120(sp)
    sw      s8, 116(sp)
    sw      s6, 44(sp)
    sw      s5, 40(sp)
    sw      t9, 112(sp)
    sw      t8, 108(sp)
    sw      t7, 104(sp)
    sw      t6, 100(sp)
    sw      t5, 96(sp)
    sw      t4, 92(sp)
    sw      t3, 88(sp)
    sw      t2, 84(sp)
    sw      t1, 80(sp)
    sw      t0, 76(sp)
    sw      a3, 72(sp)
    sw      a2, 68(sp)
    sw      a1, 64(sp)
    sw      a0, 60(sp)
    sw      v1, 56(sp)
    sw      v0, 52(sp)
    sw      $1, 16(sp)

    mfhi    k0
    sw      k0, 12(sp)
    mflo    k0
    sw      k0, 8(sp)

    la      s6, DMA_2_Handler
    jalr    s6
    nop

    lw      k0, 8(sp)
    mtlo    k0
    lw      k0, 12(sp)
    mthi    k0

    lw      $1, 16(sp)
    lw      v0, 52(sp)
    lw      v1, 56(sp)
    lw      a0, 60(sp)
    lw      a1, 64(sp)
    lw      a2, 68(sp)
    lw      a3, 72(sp)
    lw      t0, 76(sp)
    lw      t1, 80(sp)
    lw      t2, 84(sp)
    lw      t3, 88(sp)
    lw      t4, 92(sp)
    lw      t5, 96(sp)
    lw      t6, 100(sp)
    lw      t7, 104(sp)
    lw      t8, 108(sp)
    lw      t9, 112(sp)
    lw      s8, 116(sp)
    lw      ra, 120(sp)
    lw      s5, 40(sp)
    lw      s6, 44(sp)

    di
    ehb
    lw      k0, 124(sp)
    mtc0    k0, _CP0_EPC
    lw      k1, 128(sp)
    lui     k0, 0xFFFF
    ori     k0, k0, 0xE3FF
    and     k1, k1, k0
    mtc0    k1, _CP0_STATUS
    addiu   sp, sp, 132
    ehb
    eret
    nop
    .end    _DMA_2_Handler
   .extern  DMA_3_Handler

   .section .vector_39,code, keep
   .equ     __vector_dispatch_39, IntVectorDMA_3_Handler
   .global  __vector_dispatch_39
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorDMA_3_Handler

IntVectorDMA_3_Handler:
    la    $26,  _DMA_3_Handler
    jr    $26
    nop
    .end    IntVectorDMA_3_Handler

   .section .DMA_3_Handler_vector_text, code, keep
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  _DMA_3_Handler

_DMA_3_Handler:
    # Bare-metal ISR wrapper � does NOT use FreeRTOS portSAVE_CONTEXT/
    # portRESTORE_CONTEXT macros, which require vTaskStartScheduler() to have
    # been called. Saves/restores registers on the current stack and returns
    # with eret. Same layout as the USB bare-metal wrapper (132 bytes).
    mfc0    k0, _CP0_EPC
    addiu   sp, sp, -132
    sw      k0, 124(sp)

    mfc0    k1, _CP0_STATUS
    sw      k1, 128(sp)

    sw      ra, 120(sp)
    sw      s8, 116(sp)
    sw      s6, 44(sp)
    sw      s5, 40(sp)
    sw      t9, 112(sp)
    sw      t8, 108(sp)
    sw      t7, 104(sp)
    sw      t6, 100(sp)
    sw      t5, 96(sp)
    sw      t4, 92(sp)
    sw      t3, 88(sp)
    sw      t2, 84(sp)
    sw      t1, 80(sp)
    sw      t0, 76(sp)
    sw      a3, 72(sp)
    sw      a2, 68(sp)
    sw      a1, 64(sp)
    sw      a0, 60(sp)
    sw      v1, 56(sp)
    sw      v0, 52(sp)
    sw      $1, 16(sp)

    mfhi    k0
    sw      k0, 12(sp)
    mflo    k0
    sw      k0, 8(sp)

    la      s6, DMA_3_Handler
    jalr    s6
    nop

    lw      k0, 8(sp)
    mtlo    k0
    lw      k0, 12(sp)
    mthi    k0

    lw      $1, 16(sp)
    lw      v0, 52(sp)
    lw      v1, 56(sp)
    lw      a0, 60(sp)
    lw      a1, 64(sp)
    lw      a2, 68(sp)
    lw      a3, 72(sp)
    lw      t0, 76(sp)
    lw      t1, 80(sp)
    lw      t2, 84(sp)
    lw      t3, 88(sp)
    lw      t4, 92(sp)
    lw      t5, 96(sp)
    lw      t6, 100(sp)
    lw      t7, 104(sp)
    lw      t8, 108(sp)
    lw      t9, 112(sp)
    lw      s8, 116(sp)
    lw      ra, 120(sp)
    lw      s5, 40(sp)
    lw      s6, 44(sp)

    di
    ehb
    lw      k0, 124(sp)
    mtc0    k0, _CP0_EPC
    lw      k1, 128(sp)
    lui     k0, 0xFFFF
    ori     k0, k0, 0xE3FF
    and     k1, k1, k0
    mtc0    k1, _CP0_STATUS
    addiu   sp, sp, 132
    ehb
    eret
    nop
    .end    _DMA_3_Handler
   .extern  DMA_4_Handler

   .section .vector_40,code, keep
   .equ     __vector_dispatch_40, IntVectorDMA_4_Handler
   .global  __vector_dispatch_40
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorDMA_4_Handler

IntVectorDMA_4_Handler:
    la    $26,  _DMA_4_Handler
    jr    $26
    nop
    .end    IntVectorDMA_4_Handler

   .section .DMA_4_Handler_vector_text, code, keep
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  _DMA_4_Handler

_DMA_4_Handler:
    # Bare-metal ISR wrapper � does NOT use FreeRTOS portSAVE_CONTEXT/
    # portRESTORE_CONTEXT macros, which require vTaskStartScheduler() to have
    # been called. Saves/restores registers on the current stack and returns
    # with eret. Same layout as the USB bare-metal wrapper (132 bytes).
    mfc0    k0, _CP0_EPC
    addiu   sp, sp, -132
    sw      k0, 124(sp)

    mfc0    k1, _CP0_STATUS
    sw      k1, 128(sp)

    sw      ra, 120(sp)
    sw      s8, 116(sp)
    sw      s6, 44(sp)
    sw      s5, 40(sp)
    sw      t9, 112(sp)
    sw      t8, 108(sp)
    sw      t7, 104(sp)
    sw      t6, 100(sp)
    sw      t5, 96(sp)
    sw      t4, 92(sp)
    sw      t3, 88(sp)
    sw      t2, 84(sp)
    sw      t1, 80(sp)
    sw      t0, 76(sp)
    sw      a3, 72(sp)
    sw      a2, 68(sp)
    sw      a1, 64(sp)
    sw      a0, 60(sp)
    sw      v1, 56(sp)
    sw      v0, 52(sp)
    sw      $1, 16(sp)

    mfhi    k0
    sw      k0, 12(sp)
    mflo    k0
    sw      k0, 8(sp)

    la      s6, DMA_4_Handler
    jalr    s6
    nop

    lw      k0, 8(sp)
    mtlo    k0
    lw      k0, 12(sp)
    mthi    k0

    lw      $1, 16(sp)
    lw      v0, 52(sp)
    lw      v1, 56(sp)
    lw      a0, 60(sp)
    lw      a1, 64(sp)
    lw      a2, 68(sp)
    lw      a3, 72(sp)
    lw      t0, 76(sp)
    lw      t1, 80(sp)
    lw      t2, 84(sp)
    lw      t3, 88(sp)
    lw      t4, 92(sp)
    lw      t5, 96(sp)
    lw      t6, 100(sp)
    lw      t7, 104(sp)
    lw      t8, 108(sp)
    lw      t9, 112(sp)
    lw      s8, 116(sp)
    lw      ra, 120(sp)
    lw      s5, 40(sp)
    lw      s6, 44(sp)

    di
    ehb
    lw      k0, 124(sp)
    mtc0    k0, _CP0_EPC
    lw      k1, 128(sp)
    lui     k0, 0xFFFF
    ori     k0, k0, 0xE3FF
    and     k1, k1, k0
    mtc0    k1, _CP0_STATUS
    addiu   sp, sp, 132
    ehb
    eret
    nop
    .end    _DMA_4_Handler
   .extern  DMA_5_Handler

   .section .vector_41,code, keep
   .equ     __vector_dispatch_41, IntVectorDMA_5_Handler
   .global  __vector_dispatch_41
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorDMA_5_Handler

IntVectorDMA_5_Handler:
    la    $26,  _DMA_5_Handler
    jr    $26
    nop
    .end    IntVectorDMA_5_Handler

   .section .DMA_5_Handler_vector_text, code, keep
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  _DMA_5_Handler

_DMA_5_Handler:
    # Bare-metal ISR wrapper � does NOT use FreeRTOS portSAVE_CONTEXT/
    # portRESTORE_CONTEXT macros, which require vTaskStartScheduler() to have
    # been called. Saves/restores registers on the current stack and returns
    # with eret. Same layout as the USB bare-metal wrapper (132 bytes).
    mfc0    k0, _CP0_EPC
    addiu   sp, sp, -132
    sw      k0, 124(sp)

    mfc0    k1, _CP0_STATUS
    sw      k1, 128(sp)

    sw      ra, 120(sp)
    sw      s8, 116(sp)
    sw      s6, 44(sp)
    sw      s5, 40(sp)
    sw      t9, 112(sp)
    sw      t8, 108(sp)
    sw      t7, 104(sp)
    sw      t6, 100(sp)
    sw      t5, 96(sp)
    sw      t4, 92(sp)
    sw      t3, 88(sp)
    sw      t2, 84(sp)
    sw      t1, 80(sp)
    sw      t0, 76(sp)
    sw      a3, 72(sp)
    sw      a2, 68(sp)
    sw      a1, 64(sp)
    sw      a0, 60(sp)
    sw      v1, 56(sp)
    sw      v0, 52(sp)
    sw      $1, 16(sp)

    mfhi    k0
    sw      k0, 12(sp)
    mflo    k0
    sw      k0, 8(sp)

    la      s6, DMA_5_Handler
    jalr    s6
    nop

    lw      k0, 8(sp)
    mtlo    k0
    lw      k0, 12(sp)
    mthi    k0

    lw      $1, 16(sp)
    lw      v0, 52(sp)
    lw      v1, 56(sp)
    lw      a0, 60(sp)
    lw      a1, 64(sp)
    lw      a2, 68(sp)
    lw      a3, 72(sp)
    lw      t0, 76(sp)
    lw      t1, 80(sp)
    lw      t2, 84(sp)
    lw      t3, 88(sp)
    lw      t4, 92(sp)
    lw      t5, 96(sp)
    lw      t6, 100(sp)
    lw      t7, 104(sp)
    lw      t8, 108(sp)
    lw      t9, 112(sp)
    lw      s8, 116(sp)
    lw      ra, 120(sp)
    lw      s5, 40(sp)
    lw      s6, 44(sp)

    di
    ehb
    lw      k0, 124(sp)
    mtc0    k0, _CP0_EPC
    lw      k1, 128(sp)
    lui     k0, 0xFFFF
    ori     k0, k0, 0xE3FF
    and     k1, k1, k0
    mtc0    k1, _CP0_STATUS
    addiu   sp, sp, 132
    ehb
    eret
    nop
    .end    _DMA_5_Handler
   .extern  DMA_6_Handler

   .section .vector_42,code, keep
   .equ     __vector_dispatch_42, IntVectorDMA_6_Handler
   .global  __vector_dispatch_42
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorDMA_6_Handler

IntVectorDMA_6_Handler:
    la    $26,  _DMA_6_Handler
    jr    $26
    nop
    .end    IntVectorDMA_6_Handler

   .section .DMA_6_Handler_vector_text, code, keep
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  _DMA_6_Handler

_DMA_6_Handler:
    # Bare-metal ISR wrapper � does NOT use FreeRTOS portSAVE_CONTEXT/
    # portRESTORE_CONTEXT macros, which require vTaskStartScheduler() to have
    # been called. Saves/restores registers on the current stack and returns
    # with eret. Same layout as the USB bare-metal wrapper (132 bytes).
    mfc0    k0, _CP0_EPC
    addiu   sp, sp, -132
    sw      k0, 124(sp)

    mfc0    k1, _CP0_STATUS
    sw      k1, 128(sp)

    sw      ra, 120(sp)
    sw      s8, 116(sp)
    sw      s6, 44(sp)
    sw      s5, 40(sp)
    sw      t9, 112(sp)
    sw      t8, 108(sp)
    sw      t7, 104(sp)
    sw      t6, 100(sp)
    sw      t5, 96(sp)
    sw      t4, 92(sp)
    sw      t3, 88(sp)
    sw      t2, 84(sp)
    sw      t1, 80(sp)
    sw      t0, 76(sp)
    sw      a3, 72(sp)
    sw      a2, 68(sp)
    sw      a1, 64(sp)
    sw      a0, 60(sp)
    sw      v1, 56(sp)
    sw      v0, 52(sp)
    sw      $1, 16(sp)

    mfhi    k0
    sw      k0, 12(sp)
    mflo    k0
    sw      k0, 8(sp)

    la      s6, DMA_6_Handler
    jalr    s6
    nop

    lw      k0, 8(sp)
    mtlo    k0
    lw      k0, 12(sp)
    mthi    k0

    lw      $1, 16(sp)
    lw      v0, 52(sp)
    lw      v1, 56(sp)
    lw      a0, 60(sp)
    lw      a1, 64(sp)
    lw      a2, 68(sp)
    lw      a3, 72(sp)
    lw      t0, 76(sp)
    lw      t1, 80(sp)
    lw      t2, 84(sp)
    lw      t3, 88(sp)
    lw      t4, 92(sp)
    lw      t5, 96(sp)
    lw      t6, 100(sp)
    lw      t7, 104(sp)
    lw      t8, 108(sp)
    lw      t9, 112(sp)
    lw      s8, 116(sp)
    lw      ra, 120(sp)
    lw      s5, 40(sp)
    lw      s6, 44(sp)

    di
    ehb
    lw      k0, 124(sp)
    mtc0    k0, _CP0_EPC
    lw      k1, 128(sp)
    lui     k0, 0xFFFF
    ori     k0, k0, 0xE3FF
    and     k1, k1, k0
    mtc0    k1, _CP0_STATUS
    addiu   sp, sp, 132
    ehb
    eret
    nop
    .end    _DMA_6_Handler
   .extern  DMA_7_Handler

   .section .vector_43,code, keep
   .equ     __vector_dispatch_43, IntVectorDMA_7_Handler
   .global  __vector_dispatch_43
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorDMA_7_Handler

IntVectorDMA_7_Handler:
    la    $26,  _DMA_7_Handler
    jr    $26
    nop
    .end    IntVectorDMA_7_Handler

   .section .DMA_7_Handler_vector_text, code, keep
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  _DMA_7_Handler

_DMA_7_Handler:
    # Bare-metal ISR wrapper � does NOT use FreeRTOS portSAVE_CONTEXT/
    # portRESTORE_CONTEXT macros, which require vTaskStartScheduler() to have
    # been called. Saves/restores registers on the current stack and returns
    # with eret. Same layout as the USB bare-metal wrapper (132 bytes).
    mfc0    k0, _CP0_EPC
    addiu   sp, sp, -132
    sw      k0, 124(sp)

    mfc0    k1, _CP0_STATUS
    sw      k1, 128(sp)

    sw      ra, 120(sp)
    sw      s8, 116(sp)
    sw      s6, 44(sp)
    sw      s5, 40(sp)
    sw      t9, 112(sp)
    sw      t8, 108(sp)
    sw      t7, 104(sp)
    sw      t6, 100(sp)
    sw      t5, 96(sp)
    sw      t4, 92(sp)
    sw      t3, 88(sp)
    sw      t2, 84(sp)
    sw      t1, 80(sp)
    sw      t0, 76(sp)
    sw      a3, 72(sp)
    sw      a2, 68(sp)
    sw      a1, 64(sp)
    sw      a0, 60(sp)
    sw      v1, 56(sp)
    sw      v0, 52(sp)
    sw      $1, 16(sp)

    mfhi    k0
    sw      k0, 12(sp)
    mflo    k0
    sw      k0, 8(sp)

    la      s6, DMA_7_Handler
    jalr    s6
    nop

    lw      k0, 8(sp)
    mtlo    k0
    lw      k0, 12(sp)
    mthi    k0

    lw      $1, 16(sp)
    lw      v0, 52(sp)
    lw      v1, 56(sp)
    lw      a0, 60(sp)
    lw      a1, 64(sp)
    lw      a2, 68(sp)
    lw      a3, 72(sp)
    lw      t0, 76(sp)
    lw      t1, 80(sp)
    lw      t2, 84(sp)
    lw      t3, 88(sp)
    lw      t4, 92(sp)
    lw      t5, 96(sp)
    lw      t6, 100(sp)
    lw      t7, 104(sp)
    lw      t8, 108(sp)
    lw      t9, 112(sp)
    lw      s8, 116(sp)
    lw      ra, 120(sp)
    lw      s5, 40(sp)
    lw      s6, 44(sp)

    di
    ehb
    lw      k0, 124(sp)
    mtc0    k0, _CP0_EPC
    lw      k1, 128(sp)
    lui     k0, 0xFFFF
    ori     k0, k0, 0xE3FF
    and     k1, k1, k0
    mtc0    k1, _CP0_STATUS
    addiu   sp, sp, 132
    ehb
    eret
    nop
    .end    _DMA_7_Handler
   .extern  USB_1_Handler

   .section .vector_45,code, keep
   .equ     __vector_dispatch_45, IntVectorUSB_1_Handler
   .global  __vector_dispatch_45
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorUSB_1_Handler

IntVectorUSB_1_Handler:
    la    $26,  _USB_1_Handler
    jr    $26
    nop
    .end    IntVectorUSB_1_Handler

   .section .USB_1_Handler_vector_text, code, keep
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  _USB_1_Handler

# Bare-metal USB ISR wrapper — does NOT use FreeRTOS portSAVE_CONTEXT/
# portRESTORE_CONTEXT macros, which require vTaskStartScheduler() to have
# been called (they access xISRStackTop and uxSavedTaskStackPointer).
# Since main() runs a bare-metal loop without the FreeRTOS scheduler,
# we save/restore registers on the current stack and return with eret.
# Context layout matches portSAVE_CONTEXT (132 bytes) for compatibility.
_USB_1_Handler:
    # Save EPC (return address) before anything else
    mfc0    k0, _CP0_EPC
    addiu   sp, sp, -132
    sw      k0, 124(sp)

    # Save status register
    mfc0    k1, _CP0_STATUS
    sw      k1, 128(sp)

    # Save all general-purpose registers that the C handler may clobber
    sw      ra, 120(sp)
    sw      s8, 116(sp)
    sw      s6, 44(sp)
    sw      s5, 40(sp)
    sw      t9, 112(sp)
    sw      t8, 108(sp)
    sw      t7, 104(sp)
    sw      t6, 100(sp)
    sw      t5, 96(sp)
    sw      t4, 92(sp)
    sw      t3, 88(sp)
    sw      t2, 84(sp)
    sw      t1, 80(sp)
    sw      t0, 76(sp)
    sw      a3, 72(sp)
    sw      a2, 68(sp)
    sw      a1, 64(sp)
    sw      a0, 60(sp)
    sw      v1, 56(sp)
    sw      v0, 52(sp)
    sw      $1, 16(sp)             # at register

    # Save hi/lo registers
    mfhi    k0
    sw      k0, 12(sp)
    mflo    k0
    sw      k0, 8(sp)

    # Call the C handler (USB_1_Handler in interrupts.c)
    la      s6, USB_1_Handler
    jalr    s6
    nop

    # Restore hi/lo registers
    lw      k0, 8(sp)
    mtlo    k0
    lw      k0, 12(sp)
    mthi    k0

    # Restore general-purpose registers
    lw      $1, 16(sp)
    lw      v0, 52(sp)
    lw      v1, 56(sp)
    lw      a0, 60(sp)
    lw      a1, 64(sp)
    lw      a2, 68(sp)
    lw      a3, 72(sp)
    lw      t0, 76(sp)
    lw      t1, 80(sp)
    lw      t2, 84(sp)
    lw      t3, 88(sp)
    lw      t4, 92(sp)
    lw      t5, 96(sp)
    lw      t6, 100(sp)
    lw      t7, 104(sp)
    lw      t8, 108(sp)
    lw      t9, 112(sp)
    lw      s8, 116(sp)
    lw      ra, 120(sp)
    lw      s5, 40(sp)
    lw      s6, 44(sp)

    # Restore EPC and STATUS, then return from interrupt
    di
    ehb
    lw      k0, 124(sp)            # EPC
    lw      k1, 128(sp)            # STATUS
    mtc0    k0, _CP0_EPC
    mtc0    k1, _CP0_STATUS
    addiu   sp, sp, 132
    ehb
    eret
    nop
    .end    _USB_1_Handler
   .extern  ETH_Handler

   .section .vector_48,code, keep
   .equ     __vector_dispatch_48, IntVectorETH_Handler
   .global  __vector_dispatch_48
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  IntVectorETH_Handler

IntVectorETH_Handler:
    la    $26,  _ETH_Handler
    jr    $26
    nop
    .end    IntVectorETH_Handler

   .section .ETH_Handler_vector_text, code, keep
   .set     nomicromips
   .set     noreorder
   .set     nomips16
   .set     noat
   .ent  _ETH_Handler

_ETH_Handler:
    # Bare-metal ISR wrapper — does NOT use FreeRTOS portSAVE_CONTEXT/
    # portRESTORE_CONTEXT macros, which require vTaskStartScheduler() to have
    # been called. Saves/restores registers on the current stack and returns
    # with eret. Same layout as the USB bare-metal wrapper (132 bytes).
    mfc0    k0, _CP0_EPC
    addiu   sp, sp, -132
    sw      k0, 124(sp)

    mfc0    k1, _CP0_STATUS
    sw      k1, 128(sp)

    sw      ra, 120(sp)
    sw      s8, 116(sp)
    sw      s6, 44(sp)
    sw      s5, 40(sp)
    sw      t9, 112(sp)
    sw      t8, 108(sp)
    sw      t7, 104(sp)
    sw      t6, 100(sp)
    sw      t5, 96(sp)
    sw      t4, 92(sp)
    sw      t3, 88(sp)
    sw      t2, 84(sp)
    sw      t1, 80(sp)
    sw      t0, 76(sp)
    sw      a3, 72(sp)
    sw      a2, 68(sp)
    sw      a1, 64(sp)
    sw      a0, 60(sp)
    sw      v1, 56(sp)
    sw      v0, 52(sp)
    sw      $1, 16(sp)

    mfhi    k0
    sw      k0, 12(sp)
    mflo    k0
    sw      k0, 8(sp)

    la      s6, ETH_Handler
    jalr    s6
    nop

    lw      k0, 8(sp)
    mtlo    k0
    lw      k0, 12(sp)
    mthi    k0

    lw      $1, 16(sp)
    lw      v0, 52(sp)
    lw      v1, 56(sp)
    lw      a0, 60(sp)
    lw      a1, 64(sp)
    lw      a2, 68(sp)
    lw      a3, 72(sp)
    lw      t0, 76(sp)
    lw      t1, 80(sp)
    lw      t2, 84(sp)
    lw      t3, 88(sp)
    lw      t4, 92(sp)
    lw      t5, 96(sp)
    lw      t6, 100(sp)
    lw      t7, 104(sp)
    lw      t8, 108(sp)
    lw      t9, 112(sp)
    lw      s8, 116(sp)
    lw      ra, 120(sp)
    lw      s5, 40(sp)
    lw      s6, 44(sp)

    di
    ehb
    lw      k0, 124(sp)
    mtc0    k0, _CP0_EPC
    lw      k1, 128(sp)
    lui     k0, 0xFFFF
    ori     k0, k0, 0xE3FF
    and     k1, k1, k0
    mtc0    k1, _CP0_STATUS
    addiu   sp, sp, 132
    ehb
    eret
    nop
    .end    _ETH_Handler

