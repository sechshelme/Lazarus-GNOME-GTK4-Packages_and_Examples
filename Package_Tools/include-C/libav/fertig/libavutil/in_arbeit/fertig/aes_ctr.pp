
unit aes_ctr;
interface

{
  Automatically converted by H2Pas 1.0.0 from aes_ctr.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    aes_ctr.h
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
PAVAESCTR  = ^AVAESCTR;
Puint8_t  = ^uint8_t;
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

function av_aes_ctr_alloc:PAVAESCTR;cdecl;external;
{*
 * Initialize an AVAESCTR context.
 *
 * @param a The AVAESCTR context to initialize
 * @param key encryption key, must have a length of AES_CTR_KEY_SIZE
  }
(* Const before type ignored *)
function av_aes_ctr_init(a:PAVAESCTR; key:Puint8_t):longint;cdecl;external;
{*
 * Release an AVAESCTR context.
 *
 * @param a The AVAESCTR context
  }
procedure av_aes_ctr_free(a:PAVAESCTR);cdecl;external;
{*
 * Process a buffer using a previously initialized context.
 *
 * @param a The AVAESCTR context
 * @param dst destination array, can be equal to src
 * @param src source array, can be equal to dst
 * @param size the size of src and dst
  }
(* Const before type ignored *)
procedure av_aes_ctr_crypt(a:PAVAESCTR; dst:Puint8_t; src:Puint8_t; size:longint);cdecl;external;
{*
 * Get the current iv
  }
(* Const before type ignored *)
function av_aes_ctr_get_iv(a:PAVAESCTR):Puint8_t;cdecl;external;
{*
 * Generate a random iv
  }
procedure av_aes_ctr_set_random_iv(a:PAVAESCTR);cdecl;external;
{*
 * Forcefully change the 8-byte iv
  }
(* Const before type ignored *)
procedure av_aes_ctr_set_iv(a:PAVAESCTR; iv:Puint8_t);cdecl;external;
{*
 * Forcefully change the "full" 16-byte iv, including the counter
  }
(* Const before type ignored *)
procedure av_aes_ctr_set_full_iv(a:PAVAESCTR; iv:Puint8_t);cdecl;external;
{*
 * Increment the top 64 bit of the iv (performed after each frame)
  }
procedure av_aes_ctr_increment_iv(a:PAVAESCTR);cdecl;external;
{*
 * @
  }
{$endif}
{ AVUTIL_AES_CTR_H  }

implementation


end.
