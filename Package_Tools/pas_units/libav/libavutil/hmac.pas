unit hmac;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2012 Martin Storsjo
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
{$ifndef AVUTIL_HMAC_H}
{$define AVUTIL_HMAC_H}
{$include <stdint.h>}
{*
 * @defgroup lavu_hmac HMAC
 * @ingroup lavu_crypto
 * @
  }
type
  TAVHMACType =  Longint;
  Const
    AV_HMAC_MD5 = 0;
    AV_HMAC_SHA1 = 1;
    AV_HMAC_SHA224 = 2;
    AV_HMAC_SHA256 = 3;
    AV_HMAC_SHA384 = 4;
    AV_HMAC_SHA512 = 5;

type
{*
 * Allocate an AVHMAC context.
 * @param type The hash function used for the HMAC.
  }

function av_hmac_alloc(_type:TAVHMACType):PAVHMAC;cdecl;external libavutil;
{*
 * Free an AVHMAC context.
 * @param ctx The context to free, may be NULL
  }
procedure av_hmac_free(ctx:PAVHMAC);cdecl;external libavutil;
{*
 * Initialize an AVHMAC context with an authentication key.
 * @param ctx    The HMAC context
 * @param key    The authentication key
 * @param keylen The length of the key, in bytes
  }
procedure av_hmac_init(ctx:PAVHMAC; key:Puint8_t; keylen:dword);cdecl;external libavutil;
{*
 * Hash data with the HMAC.
 * @param ctx  The HMAC context
 * @param data The data to hash
 * @param len  The length of the data, in bytes
  }
procedure av_hmac_update(ctx:PAVHMAC; data:Puint8_t; len:dword);cdecl;external libavutil;
{*
 * Finish hashing and output the HMAC digest.
 * @param ctx    The HMAC context
 * @param out    The output buffer to write the digest into
 * @param outlen The length of the out buffer, in bytes
 * @return       The number of bytes written to out, or a negative error code.
  }
function av_hmac_final(ctx:PAVHMAC; out:Puint8_t; outlen:dword):longint;cdecl;external libavutil;
{*
 * Hash an array of data with a key.
 * @param ctx    The HMAC context
 * @param data   The data to hash
 * @param len    The length of the data, in bytes
 * @param key    The authentication key
 * @param keylen The length of the key, in bytes
 * @param out    The output buffer to write the digest into
 * @param outlen The length of the out buffer, in bytes
 * @return       The number of bytes written to out, or a negative error code.
  }
function av_hmac_calc(ctx:PAVHMAC; data:Puint8_t; len:dword; key:Puint8_t; keylen:dword; 
           out:Puint8_t; outlen:dword):longint;cdecl;external libavutil;
{*
 * @
  }
{$endif}
{ AVUTIL_HMAC_H  }

// === Konventiert am: 14-12-25 17:15:19 ===


implementation



end.
