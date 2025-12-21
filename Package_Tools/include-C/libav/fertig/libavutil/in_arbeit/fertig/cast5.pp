
unit cast5;
interface

{
  Automatically converted by H2Pas 1.0.0 from cast5.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cast5.h
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
PAVCAST5  = ^AVCAST5;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * An implementation of the CAST128 algorithm as mentioned in RFC2144
 * Copyright (c) 2014 Supraja Meedinti
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
{$ifndef AVUTIL_CAST5_H}
{$define AVUTIL_CAST5_H}
{$include <stdint.h>}
{*
  * @file
  * @brief Public header for libavutil CAST5 algorithm
  * @defgroup lavu_cast5 CAST5
  * @ingroup lavu_crypto
  * @
   }
(* Const before type ignored *)
  var
    av_cast5_size : longint;cvar;external;
type
  PAVCAST5 = ^TAVCAST5;
  TAVCAST5 = record
      {undefined structure}
    end;

{*
  * Allocate an AVCAST5 context
  * To free the struct: av_free(ptr)
   }

function av_cast5_alloc:PAVCAST5;cdecl;external;
{*
  * Initialize an AVCAST5 context.
  *
  * @param ctx an AVCAST5 context
  * @param key a key of 5,6,...16 bytes used for encryption/decryption
  * @param key_bits number of keybits: possible are 40,48,...,128
  * @return 0 on success, less than 0 on failure
  }
(* Const before type ignored *)
function av_cast5_init(ctx:PAVCAST5; key:Puint8_t; key_bits:longint):longint;cdecl;external;
{*
  * Encrypt or decrypt a buffer using a previously initialized context, ECB mode only
  *
  * @param ctx an AVCAST5 context
  * @param dst destination array, can be equal to src
  * @param src source array, can be equal to dst
  * @param count number of 8 byte blocks
  * @param decrypt 0 for encryption, 1 for decryption
  }
(* Const before type ignored *)
procedure av_cast5_crypt(ctx:PAVCAST5; dst:Puint8_t; src:Puint8_t; count:longint; decrypt:longint);cdecl;external;
{*
  * Encrypt or decrypt a buffer using a previously initialized context
  *
  * @param ctx an AVCAST5 context
  * @param dst destination array, can be equal to src
  * @param src source array, can be equal to dst
  * @param count number of 8 byte blocks
  * @param iv initialization vector for CBC mode, NULL for ECB mode
  * @param decrypt 0 for encryption, 1 for decryption
  }
(* Const before type ignored *)
procedure av_cast5_crypt2(ctx:PAVCAST5; dst:Puint8_t; src:Puint8_t; count:longint; iv:Puint8_t; 
            decrypt:longint);cdecl;external;
{*
 * @
  }
{$endif}
{ AVUTIL_CAST5_H  }

implementation


end.
