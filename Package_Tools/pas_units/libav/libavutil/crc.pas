unit crc;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * copyright (c) 2006 Michael Niedermayer <michaelni@gmx.at>
 *
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
{*
 * @file
 * @ingroup lavu_crc32
 * Public header for CRC hash function implementation.
  }
{$ifndef AVUTIL_CRC_H}
{$define AVUTIL_CRC_H}
{$include <stdint.h>}
{$include <stddef.h>}
{$include "attributes.h"}
{*
 * @defgroup lavu_crc32 CRC
 * @ingroup lavu_hash
 * CRC (Cyclic Redundancy Check) hash function implementation.
 *
 * This module supports numerous CRC polynomials, in addition to the most
 * widely used CRC-32-IEEE. See @ref AVCRCId for a list of available
 * polynomials.
 *
 * @
  }
type
  PAVCRC = ^TAVCRC;
  TAVCRC = Tuint32_t;
{< reversed bitorder version of AV_CRC_32_IEEE  }
{< reversed bitorder version of AV_CRC_16_ANSI  }
{< Not part of public API! Do not use outside libavutil.  }

  PAVCRCId = ^TAVCRCId;
  TAVCRCId =  Longint;
  Const
    AV_CRC_8_ATM = 0;
    AV_CRC_16_ANSI = 1;
    AV_CRC_16_CCITT = 2;
    AV_CRC_32_IEEE = 3;
    AV_CRC_32_IEEE_LE = 4;
    AV_CRC_16_ANSI_LE = 5;
    AV_CRC_24_IEEE = 6;
    AV_CRC_8_EBU = 7;
    AV_CRC_MAX = 8;
;
{*
 * Initialize a CRC table.
 * @param ctx must be an array of size sizeof(AVCRC)*257 or sizeof(AVCRC)*1024
 * @param le If 1, the lowest bit represents the coefficient for the highest
 *           exponent of the corresponding polynomial (both for poly and
 *           actual CRC).
 *           If 0, you must swap the CRC parameter and the result of av_crc
 *           if you need the standard representation (can be simplified in
 *           most cases to e.g. bswap16):
 *           av_bswap32(crc << (32-bits))
 * @param bits number of bits for the CRC
 * @param poly generator polynomial without the x**bits coefficient, in the
 *             representation as specified by le
 * @param ctx_size size of ctx in bytes
 * @return <0 on failure
  }

function av_crc_init(ctx:PAVCRC; le:longint; bits:longint; poly:Tuint32_t; ctx_size:longint):longint;cdecl;external libavutil;
{*
 * Get an initialized standard CRC table.
 * @param crc_id ID of a standard CRC
 * @return a pointer to the CRC table or NULL on failure
  }
function av_crc_get_table(crc_id:TAVCRCId):PAVCRC;cdecl;external libavutil;
{*
 * Calculate the CRC of a block.
 * @param ctx initialized AVCRC array (see av_crc_init())
 * @param crc CRC of previous blocks if any or initial value for CRC
 * @param buffer buffer whose CRC to calculate
 * @param length length of the buffer
 * @return CRC updated with the data from the given block
 *
 * @see av_crc_init() "le" parameter
  }
function av_crc(ctx:PAVCRC; crc:Tuint32_t; buffer:Puint8_t; length:Tsize_t):Tuint32_t;cdecl;external libavutil;
{*
 * @
  }
{$endif}
{ AVUTIL_CRC_H  }

// === Konventiert am: 14-12-25 17:00:22 ===


implementation



end.
