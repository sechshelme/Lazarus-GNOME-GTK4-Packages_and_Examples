/*
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

#ifndef AVUTIL_INTREADWRITE_H
#define AVUTIL_INTREADWRITE_H

#include <stdint.h>
#include "libavutil/avconfig.h"
#include "attributes.h"
#include "bswap.h"

typedef union {
    uint64_t u64;
    uint32_t u32[2];
    uint16_t u16[4];
    uint8_t  u8 [8];
    double   f64;
    float    f32[2];
}  av_alias64;

typedef union {
    uint32_t u32;
    uint16_t u16[2];
    uint8_t  u8 [4];
   float    f32;
}  av_alias32;

typedef union {
    uint16_t u16;
    uint8_t  u8 [2];
}  av_alias16;

/*
 * Arch-specific headers can provide any combination of
 * AV_[RW][BLN](16|24|32|48|64) and AV_(COPY|SWAP|ZERO)(64|128) macros.
 * Preprocessor symbols must be defined, even if these are implemented
 * as inline functions.
 *
 * R/W means read/write, B/L/N means big/little/native endianness.
 * The following macros require aligned access, compared to their
 * unaligned variants: AV_(COPY|SWAP|ZERO)(64|128), AV_[RW]N[8-64]A.
 * Incorrect usage may range from abysmal performance to crash
 * depending on the platform.
 *
 * The unaligned variants are AV_[RW][BLN][8-64] and AV_COPY*U.
 */

#ifdef HAVE_AV_CONFIG_H

#include "config.h"

#if   ARCH_ARM
#   include "arm/intreadwrite.h"
#elif ARCH_AVR32
#   include "avr32/intreadwrite.h"
#elif ARCH_MIPS
#   include "mips/intreadwrite.h"
#elif ARCH_PPC
#   include "ppc/intreadwrite.h"
#elif ARCH_X86
#   include "x86/intreadwrite.h"
#endif

#endif /* HAVE_AV_CONFIG_H */

/*
 * Map AV_RNXX <-> AV_R[BL]XX for all variants provided by per-arch headers.
 */


/*
 * Define AV_[RW]N helper macros to simplify definitions not provided
 * by per-arch headers.
 */

#if defined(__GNUC__) || defined(__clang__)

union unaligned_64 { uint64_t l; } ;
union unaligned_32 { uint32_t l; } ;
union unaligned_16 { uint16_t l; } ;


