
unit tea;
interface

{
  Automatically converted by H2Pas 1.0.0 from tea.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    tea.h
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
PAVTEA  = ^AVTEA;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * A 32-bit implementation of the TEA algorithm
 * Copyright (c) 2015 Vesselin Bontchev
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
{$ifndef AVUTIL_TEA_H}
{$define AVUTIL_TEA_H}
{$include <stdint.h>}
{*
 * @file
 * @brief Public header for libavutil TEA algorithm
 * @defgroup lavu_tea TEA
 * @ingroup lavu_crypto
 * @
  }
(* Const before type ignored *)
  var
    av_tea_size : longint;cvar;external;
type
  PAVTEA = ^TAVTEA;
  TAVTEA = record
      {undefined structure}
    end;

{*
  * Allocate an AVTEA context
  * To free the struct: av_free(ptr)
   }

function av_tea_alloc:PAVTEA;cdecl;external;
{*
 * Initialize an AVTEA context.
 *
 * @param ctx an AVTEA context
 * @param key a key of 16 bytes used for encryption/decryption
 * @param rounds the number of rounds in TEA (64 is the "standard")
  }
(* Const before type ignored *)
procedure av_tea_init(ctx:PAVTEA; key:array[0..15] of Tuint8_t; rounds:longint);cdecl;external;
{*
 * Encrypt or decrypt a buffer using a previously initialized context.
 *
 * @param ctx an AVTEA context
 * @param dst destination array, can be equal to src
 * @param src source array, can be equal to dst
 * @param count number of 8 byte blocks
 * @param iv initialization vector for CBC mode, if NULL then ECB will be used
 * @param decrypt 0 for encryption, 1 for decryption
  }
(* Const before type ignored *)
procedure av_tea_crypt(ctx:PAVTEA; dst:Puint8_t; src:Puint8_t; count:longint; iv:Puint8_t; 
            decrypt:longint);cdecl;external;
{*
 * @
  }
{$endif}
{ AVUTIL_TEA_H  }

implementation


end.
