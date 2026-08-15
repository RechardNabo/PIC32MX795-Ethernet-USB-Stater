/*******************************************************************************
  Cache Peripheral Library Header

  File Name:
    plib_cache.h

  Summary:
    Cache PLIB stub for PIC32MX (no data cache).

  Description:
    PIC32MX795F512L does not have a configurable data cache. This file
    provides stub definitions so the cache system service compiles.

  Remarks:
    This header should not define any prototypes or data definitions.
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
* EXPRESS, IMPLIED, OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
* WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
* PARTICULAR PURPOSE.
*******************************************************************************/
// DOM-IGNORE-END

#ifndef PLIB_CACHE_H
#define PLIB_CACHE_H

// DOM-IGNORE-BEGIN
#ifdef __cplusplus
extern "C" {
#endif
// DOM-IGNORE-END

#include <stdint.h>
#include <stddef.h>

typedef enum
{
    CACHE_DISABLE = 0,
    CACHE_ENABLE  = 1
} CACHE_COHERENCY;

static inline CACHE_COHERENCY CACHE_CacheCoherencyGet(void)
{
    return CACHE_DISABLE;
}

static inline void CACHE_DataCacheClean(uint32_t addr, size_t size)
{
    (void)addr;
    (void)size;
}

static inline void CACHE_DataCacheInvalidate(uint32_t addr, size_t size)
{
    (void)addr;
    (void)size;
}

static inline void CACHE_InstructionCacheFlush(void)
{
    /* No-op for PIC32MX */
}

// DOM-IGNORE-BEGIN
#ifdef __cplusplus
}
#endif
// DOM-IGNORE-END

#endif // PLIB_CACHE_H
