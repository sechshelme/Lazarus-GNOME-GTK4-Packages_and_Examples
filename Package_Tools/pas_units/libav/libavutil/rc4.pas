unit rc4;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * RC4 encryption/decryption/pseudo-random number generator
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
{$ifndef AVUTIL_RC4_H}
{$define AVUTIL_RC4_H}
{$include <stdint.h>}
{*
 * @defgroup lavu_rc4 RC4
 * @ingroup lavu_crypto
 * @
  }
type
  PAVRC4 = ^TAVRC4;
  TAVRC4 = record
      state : array[0..255] of Tuint8_t;
      x : longint;
      y : longint;
    end;
{*
 * Allocate an AVRC4 context.
  }

function av_rc4_alloc:PAVRC4;cdecl;external libavutil;
{*
 * @brief Initializes an AVRC4 context.
 *
 * @param d pointer to the AVRC4 context
 * @param key buffer containig the key
 * @param key_bits must be a multiple of 8
 * @param decrypt 0 for encryption, 1 for decryption, currently has no effect
 * @return zero on success, negative value otherwise
  }
function av_rc4_init(d:PAVRC4; key:Puint8_t; key_bits:longint; decrypt:longint):longint;cdecl;external libavutil;
{*
 * @brief Encrypts / decrypts using the RC4 algorithm.
 *
 * @param d pointer to the AVRC4 context
 * @param count number of bytes
 * @param dst destination array, can be equal to src
 * @param src source array, can be equal to dst, may be NULL
 * @param iv not (yet) used for RC4, should be NULL
 * @param decrypt 0 for encryption, 1 for decryption, not (yet) used
  }
procedure av_rc4_crypt(d:PAVRC4; dst:Puint8_t; src:Puint8_t; count:longint; iv:Puint8_t; 
            decrypt:longint);cdecl;external libavutil;
{*
 * @
  }
{$endif}
{ AVUTIL_RC4_H  }

// === Konventiert am: 14-12-25 17:37:06 ===


implementation



end.
