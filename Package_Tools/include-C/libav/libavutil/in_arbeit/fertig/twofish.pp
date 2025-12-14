
unit twofish;
interface

{
  Automatically converted by H2Pas 1.0.0 from twofish.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    twofish.h
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
PAVTWOFISH  = ^AVTWOFISH;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * An implementation of the TwoFish algorithm
 * Copyright (c) 2015 Supraja Meedinti
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
{$ifndef AVUTIL_TWOFISH_H}
{$define AVUTIL_TWOFISH_H}
{$include <stdint.h>}
{*
  * @file
  * @brief Public header for libavutil TWOFISH algorithm
  * @defgroup lavu_twofish TWOFISH
  * @ingroup lavu_crypto
  * @
   }
(* Const before type ignored *)
  var
    av_twofish_size : longint;cvar;external;
type
  PAVTWOFISH = ^TAVTWOFISH;
  TAVTWOFISH = record
      {undefined structure}
    end;

{*
  * Allocate an AVTWOFISH context
  * To free the struct: av_free(ptr)
   }

function av_twofish_alloc:PAVTWOFISH;cdecl;external;
{*
  * Initialize an AVTWOFISH context.
  *
  * @param ctx an AVTWOFISH context
  * @param key a key of size ranging from 1 to 32 bytes used for encryption/decryption
  * @param key_bits number of keybits: 128, 192, 256 If less than the required, padded with zeroes to nearest valid value; return value is 0 if key_bits is 128/192/256, -1 if less than 0, 1 otherwise
  }
(* Const before type ignored *)
function av_twofish_init(ctx:PAVTWOFISH; key:Puint8_t; key_bits:longint):longint;cdecl;external;
{*
  * Encrypt or decrypt a buffer using a previously initialized context
  *
  * @param ctx an AVTWOFISH context
  * @param dst destination array, can be equal to src
  * @param src source array, can be equal to dst
  * @param count number of 16 byte blocks
  * @param iv initialization vector for CBC mode, NULL for ECB mode
  * @param decrypt 0 for encryption, 1 for decryption
  }
(* Const before type ignored *)
procedure av_twofish_crypt(ctx:PAVTWOFISH; dst:Puint8_t; src:Puint8_t; count:longint; iv:Puint8_t; 
            decrypt:longint);cdecl;external;
{*
 * @
  }
{$endif}
{ AVUTIL_TWOFISH_H  }

implementation


end.
