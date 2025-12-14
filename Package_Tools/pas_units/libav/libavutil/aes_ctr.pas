unit aes_ctr;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * AES-CTR cipher
 * Copyright (c) 2015 Eran Kornblau <erankor at gmail dot com>
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
{$ifndef AVUTIL_AES_CTR_H}
{$define AVUTIL_AES_CTR_H}
{*
 * @defgroup lavu_aes_ctr AES-CTR
 * @ingroup lavu_crypto
 * @
  }
{$include <stdint.h>}
{$include "attributes.h"}

const
  AES_CTR_KEY_SIZE = 16;  
  AES_CTR_IV_SIZE = 8;  
type
  PAVAESCTR = ^TAVAESCTR;
  TAVAESCTR = record
      {undefined structure}
    end;

{*
 * Allocate an AVAESCTR context.
  }

function av_aes_ctr_alloc:PAVAESCTR;cdecl;external libavutil;
{*
 * Initialize an AVAESCTR context.
 *
 * @param a The AVAESCTR context to initialize
 * @param key encryption key, must have a length of AES_CTR_KEY_SIZE
  }
function av_aes_ctr_init(a:PAVAESCTR; key:Puint8_t):longint;cdecl;external libavutil;
{*
 * Release an AVAESCTR context.
 *
 * @param a The AVAESCTR context
  }
procedure av_aes_ctr_free(a:PAVAESCTR);cdecl;external libavutil;
{*
 * Process a buffer using a previously initialized context.
 *
 * @param a The AVAESCTR context
 * @param dst destination array, can be equal to src
 * @param src source array, can be equal to dst
 * @param size the size of src and dst
  }
procedure av_aes_ctr_crypt(a:PAVAESCTR; dst:Puint8_t; src:Puint8_t; size:longint);cdecl;external libavutil;
{*
 * Get the current iv
  }
function av_aes_ctr_get_iv(a:PAVAESCTR):Puint8_t;cdecl;external libavutil;
{*
 * Generate a random iv
  }
procedure av_aes_ctr_set_random_iv(a:PAVAESCTR);cdecl;external libavutil;
{*
 * Forcefully change the 8-byte iv
  }
procedure av_aes_ctr_set_iv(a:PAVAESCTR; iv:Puint8_t);cdecl;external libavutil;
{*
 * Forcefully change the "full" 16-byte iv, including the counter
  }
procedure av_aes_ctr_set_full_iv(a:PAVAESCTR; iv:Puint8_t);cdecl;external libavutil;
{*
 * Increment the top 64 bit of the iv (performed after each frame)
  }
procedure av_aes_ctr_increment_iv(a:PAVAESCTR);cdecl;external libavutil;
{*
 * @
  }
{$endif}
{ AVUTIL_AES_CTR_H  }

// === Konventiert am: 14-12-25 15:59:35 ===


implementation



end.
