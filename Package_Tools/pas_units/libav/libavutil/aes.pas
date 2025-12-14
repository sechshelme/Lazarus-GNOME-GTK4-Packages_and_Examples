unit aes;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * copyright (c) 2007 Michael Niedermayer <michaelni@gmx.at>
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
{$ifndef AVUTIL_AES_H}
{$define AVUTIL_AES_H}
{$include <stdint.h>}
{$include "attributes.h"}
{*
 * @defgroup lavu_aes AES
 * @ingroup lavu_crypto
 * @
  }
  var
    av_aes_size : longint;cvar;external libavutil;
type
  PAVAES = ^TAVAES;
  TAVAES = record
      {undefined structure}
    end;

{*
 * Allocate an AVAES context.
  }

function av_aes_alloc:PAVAES;cdecl;external libavutil;
{*
 * Initialize an AVAES context.
 *
 * @param a The AVAES context
 * @param key Pointer to the key
 * @param key_bits 128, 192 or 256
 * @param decrypt 0 for encryption, 1 for decryption
  }
function av_aes_init(a:PAVAES; key:Puint8_t; key_bits:longint; decrypt:longint):longint;cdecl;external libavutil;
{*
 * Encrypt or decrypt a buffer using a previously initialized context.
 *
 * @param a The AVAES context
 * @param dst destination array, can be equal to src
 * @param src source array, can be equal to dst
 * @param count number of 16 byte blocks
 * @param iv initialization vector for CBC mode, if NULL then ECB will be used
 * @param decrypt 0 for encryption, 1 for decryption
  }
procedure av_aes_crypt(a:PAVAES; dst:Puint8_t; src:Puint8_t; count:longint; iv:Puint8_t; 
            decrypt:longint);cdecl;external libavutil;
{*
 * @
  }
{$endif}
{ AVUTIL_AES_H  }

// === Konventiert am: 14-12-25 15:59:33 ===


implementation



end.
