
unit des;
interface

{
  Automatically converted by H2Pas 1.0.0 from des.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    des.h
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
PAVDES  = ^AVDES;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * DES encryption/decryption
 * Copyright (c) 2007 Reimar Doeffinger
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
{$ifndef AVUTIL_DES_H}
{$define AVUTIL_DES_H}
{$include <stdint.h>}
{*
 * @defgroup lavu_des DES
 * @ingroup lavu_crypto
 * @
  }
type
  PAVDES = ^TAVDES;
  TAVDES = record
      round_keys : array[0..2] of array[0..15] of Tuint64_t;
      triple_des : longint;
    end;
{*
 * Allocate an AVDES context.
  }

function av_des_alloc:PAVDES;cdecl;external;
{*
 * @brief Initializes an AVDES context.
 *
 * @param d pointer to a AVDES structure to initialize
 * @param key pointer to the key to use
 * @param key_bits must be 64 or 192
 * @param decrypt 0 for encryption/CBC-MAC, 1 for decryption
 * @return zero on success, negative value otherwise
  }
(* Const before type ignored *)
function av_des_init(d:PAVDES; key:Puint8_t; key_bits:longint; decrypt:longint):longint;cdecl;external;
{*
 * @brief Encrypts / decrypts using the DES algorithm.
 *
 * @param d pointer to the AVDES structure
 * @param dst destination array, can be equal to src, must be 8-byte aligned
 * @param src source array, can be equal to dst, must be 8-byte aligned, may be NULL
 * @param count number of 8 byte blocks
 * @param iv initialization vector for CBC mode, if NULL then ECB will be used,
 *           must be 8-byte aligned
 * @param decrypt 0 for encryption, 1 for decryption
  }
(* Const before type ignored *)
procedure av_des_crypt(d:PAVDES; dst:Puint8_t; src:Puint8_t; count:longint; iv:Puint8_t; 
            decrypt:longint);cdecl;external;
{*
 * @brief Calculates CBC-MAC using the DES algorithm.
 *
 * @param d pointer to the AVDES structure
 * @param dst destination array, can be equal to src, must be 8-byte aligned
 * @param src source array, can be equal to dst, must be 8-byte aligned, may be NULL
 * @param count number of 8 byte blocks
  }
(* Const before type ignored *)
procedure av_des_mac(d:PAVDES; dst:Puint8_t; src:Puint8_t; count:longint);cdecl;external;
{*
 * @
  }
{$endif}
{ AVUTIL_DES_H  }

implementation


end.
