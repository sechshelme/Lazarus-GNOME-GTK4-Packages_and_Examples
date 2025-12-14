unit blowfish;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Blowfish algorithm
 * Copyright (c) 2012 Samuel Pitoiset
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
{$ifndef AVUTIL_BLOWFISH_H}
{$define AVUTIL_BLOWFISH_H}
{$include <stdint.h>}
{*
 * @defgroup lavu_blowfish Blowfish
 * @ingroup lavu_crypto
 * @
  }

const
  AV_BF_ROUNDS = 16;  
type
  PAVBlowfish = ^TAVBlowfish;
  TAVBlowfish = record
      p : array[0..(AV_BF_ROUNDS+2)-1] of Tuint32_t;
      s : array[0..3] of array[0..255] of Tuint32_t;
    end;
{*
 * Allocate an AVBlowfish context.
  }

function av_blowfish_alloc:PAVBlowfish;cdecl;external libavutil;
{*
 * Initialize an AVBlowfish context.
 *
 * @param ctx an AVBlowfish context
 * @param key a key
 * @param key_len length of the key
  }
procedure av_blowfish_init(ctx:PAVBlowfish; key:Puint8_t; key_len:longint);cdecl;external libavutil;
{*
 * Encrypt or decrypt a buffer using a previously initialized context.
 *
 * @param ctx an AVBlowfish context
 * @param xl left four bytes halves of input to be encrypted
 * @param xr right four bytes halves of input to be encrypted
 * @param decrypt 0 for encryption, 1 for decryption
  }
procedure av_blowfish_crypt_ecb(ctx:PAVBlowfish; xl:Puint32_t; xr:Puint32_t; decrypt:longint);cdecl;external libavutil;
{*
 * Encrypt or decrypt a buffer using a previously initialized context.
 *
 * @param ctx an AVBlowfish context
 * @param dst destination array, can be equal to src
 * @param src source array, can be equal to dst
 * @param count number of 8 byte blocks
 * @param iv initialization vector for CBC mode, if NULL ECB will be used
 * @param decrypt 0 for encryption, 1 for decryption
  }
procedure av_blowfish_crypt(ctx:PAVBlowfish; dst:Puint8_t; src:Puint8_t; count:longint; iv:Puint8_t; 
            decrypt:longint);cdecl;external libavutil;
{*
 * @
  }
{$endif}
{ AVUTIL_BLOWFISH_H  }

// === Konventiert am: 14-12-25 15:59:50 ===


implementation



end.
