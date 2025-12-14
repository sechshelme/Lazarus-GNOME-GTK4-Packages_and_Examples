unit ripemd;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2007 Michael Niedermayer <michaelni@gmx.at>
 * Copyright (C) 2013 James Almer <jamrial@gmail.com>
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
 * @ingroup lavu_ripemd
 * Public header for RIPEMD hash function implementation.
  }
{$ifndef AVUTIL_RIPEMD_H}
{$define AVUTIL_RIPEMD_H}
{$include <stddef.h>}
{$include <stdint.h>}
{$include "attributes.h"}
{*
 * @defgroup lavu_ripemd RIPEMD
 * @ingroup lavu_hash
 * RIPEMD hash function implementation.
 *
 * @
  }
  var
    av_ripemd_size : longint;cvar;external libavutil;
type
  PAVRIPEMD = ^TAVRIPEMD;
  TAVRIPEMD = record
      {undefined structure}
    end;

{*
 * Allocate an AVRIPEMD context.
  }

function av_ripemd_alloc:PAVRIPEMD;cdecl;external libavutil;
{*
 * Initialize RIPEMD hashing.
 *
 * @param context pointer to the function context (of size av_ripemd_size)
 * @param bits    number of bits in digest (128, 160, 256 or 320 bits)
 * @return        zero if initialization succeeded, -1 otherwise
  }
function av_ripemd_init(context:PAVRIPEMD; bits:longint):longint;cdecl;external libavutil;
{*
 * Update hash value.
 *
 * @param context hash function context
 * @param data    input data to update hash with
 * @param len     input data length
  }
procedure av_ripemd_update(context:PAVRIPEMD; data:Puint8_t; len:Tsize_t);cdecl;external libavutil;
{*
 * Finish hashing and output digest value.
 *
 * @param context hash function context
 * @param digest  buffer where output digest value is stored
  }
procedure av_ripemd_final(context:PAVRIPEMD; digest:Puint8_t);cdecl;external libavutil;
{*
 * @
  }
{$endif}
{ AVUTIL_RIPEMD_H  }

// === Konventiert am: 14-12-25 17:37:11 ===


implementation



end.
