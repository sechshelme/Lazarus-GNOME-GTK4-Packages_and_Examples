unit intreadwrite;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
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
  }
{$ifndef AVUTIL_INTREADWRITE_H}
{$define AVUTIL_INTREADWRITE_H}
{$include <stdint.h>}
{$include "libavutil/avconfig.h"}
{$include "attributes.h"}
{$include "bswap.h"}
type
  Pav_alias64 = ^Tav_alias64;
  Tav_alias64 = record
      case longint of
        0 : ( u64 : Tuint64_t );
        1 : ( u32 : array[0..1] of Tuint32_t );
        2 : ( u16 : array[0..3] of Tuint16_t );
        3 : ( u8 : array[0..7] of Tuint8_t );
        4 : ( f64 : Tdouble );
        5 : ( f32 : array[0..1] of single );
      end;

  Pav_alias32 = ^Tav_alias32;
  Tav_alias32 = record
      case longint of
        0 : ( u32 : Tuint32_t );
        1 : ( u16 : array[0..1] of Tuint16_t );
        2 : ( u8 : array[0..3] of Tuint8_t );
        3 : ( f32 : single );
      end;

  Pav_alias16 = ^Tav_alias16;
  Tav_alias16 = record
      case longint of
        0 : ( u16 : Tuint16_t );
        1 : ( u8 : array[0..1] of Tuint8_t );
      end;
{
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
  }
{$ifdef HAVE_AV_CONFIG_H}
{$include "config.h"}
{$if   ARCH_ARM}
{$include "arm/intreadwrite.h"}
(*** was #elif ****){$else ARCH_AVR32}
{$include "avr32/intreadwrite.h"}
(*** was #elif ****){$else ARCH_MIPS}
{$include "mips/intreadwrite.h"}
(*** was #elif ****){$else ARCH_PPC}
{$include "ppc/intreadwrite.h"}
(*** was #elif ****){$else ARCH_X86}
{$include "x86/intreadwrite.h"}
{$endif}
{$endif}
{ HAVE_AV_CONFIG_H  }
{
 * Map AV_RNXX <-> AV_R[BL]XX for all variants provided by per-arch headers.
  }
{
 * Define AV_[RW]N helper macros to simplify definitions not provided
 * by per-arch headers.
  }
{$if defined(__GNUC__) || defined(__clang__)}
type
  Punaligned_64 = ^Tunaligned_64;
  Tunaligned_64 = record
      case longint of
        0 : ( l : Tuint64_t );
      end;

  Punaligned_32 = ^Tunaligned_32;
  Tunaligned_32 = record
      case longint of
        0 : ( l : Tuint32_t );
      end;

  Punaligned_16 = ^Tunaligned_16;
  Tunaligned_16 = record
      case longint of
        0 : ( l : Tuint16_t );
      end;


// === Konventiert am: 14-12-25 17:31:27 ===


implementation



end.
