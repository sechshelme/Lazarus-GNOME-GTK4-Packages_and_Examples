
unit avdct;
interface

{
  Automatically converted by H2Pas 1.0.0 from avdct.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    avdct.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PAVClass  = ^AVClass;
PAVDCT  = ^AVDCT;
Pint16_t  = ^int16_t;
Puint8_t  = ^uint8_t;
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
{$ifndef AVCODEC_AVDCT_H}
{$define AVCODEC_AVDCT_H}
{$include "libavutil/opt.h"}
{*
 * AVDCT context.
 * @note function pointers can be NULL if the specific features have been
 *       disabled at build time.
  }
(* Const before type ignored *)
{ align 16  }{*
     * IDCT input permutation.
     * Several optimized IDCTs need a permutated input (relative to the
     * normal order of the reference IDCT).
     * This permutation must be performed before the idct_put/add.
     * Note, normally this can be merged with the zigzag/alternate scan<br>
     * An example to avoid confusion:
     * - (->decode coeffs -> zigzag reorder -> dequant -> reference IDCT -> ...)
     * - (x -> reference DCT -> reference IDCT -> x)
     * - (x -> reference DCT -> simple_mmx_perm = idct_permutation
     *    -> simple_idct_mmx -> x)
     * - (-> decode coeffs -> zigzag reorder -> simple_mmx_perm -> dequant
     *    -> simple_idct_mmx -> ...)
      }
{ align 16  }{*
     * DCT algorithm.
     * must use AVOptions to set this field.
      }
{*
     * IDCT algorithm.
     * must use AVOptions to set this field.
      }
{ align 16  }(* Const before type ignored *)
{ align 8  }{ align 16  }(* Const before type ignored *)
type
  PAVDCT = ^TAVDCT;
  TAVDCT = record
      av_class : PAVClass;
      idct : procedure (block:Pint16_t);cdecl;
      idct_permutation : array[0..63] of Tuint8_t;
      fdct : procedure (block:Pint16_t);cdecl;
      dct_algo : longint;
      idct_algo : longint;
      get_pixels : procedure (block:Pint16_t; pixels:Puint8_t; line_size:Tptrdiff_t);cdecl;
      bits_per_sample : longint;
      get_pixels_unaligned : procedure (block:Pint16_t; pixels:Puint8_t; line_size:Tptrdiff_t);cdecl;
    end;
{*
 * Allocates a AVDCT context.
 * This needs to be initialized with avcodec_dct_init() after optionally
 * configuring it with AVOptions.
 *
 * To free it use av_free()
  }

function avcodec_dct_alloc:PAVDCT;cdecl;external;
function avcodec_dct_init(para1:PAVDCT):longint;cdecl;external;
(* Const before type ignored *)
function avcodec_dct_get_class:PAVClass;cdecl;external;
{$endif}
{ AVCODEC_AVDCT_H  }

implementation


end.
