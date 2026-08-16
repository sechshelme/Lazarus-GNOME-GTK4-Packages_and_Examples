
unit fp_iconv;
interface

{
  Automatically converted by H2Pas 1.0.0 from fp_iconv.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fp_iconv.h
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
Pchar  = ^char;
Piconv_t  = ^iconv_t;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 1997-2024 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <https://www.gnu.org/licenses/>.   }
{$ifndef _ICONV_H}

const
  _ICONV_H = 1;  
{$include <features.h>}
{$define __need_size_t}
{$include <stddef.h>}
{ Identifier for conversion method from one codeset to another.   }
type
  Piconv_t = ^Ticonv_t;
  Ticonv_t = pointer;
{ Free resources allocated for descriptor CD for code conversion.

   This function is a possible cancellation point and therefore not
   marked with __THROW.   }

function iconv_close(__cd:Ticonv_t):longint;cdecl;external;
{ Allocate descriptor for code conversion from codeset FROMCODE to
   codeset TOCODE.

   This function is a possible cancellation point and therefore not
   marked with __THROW.   }
(* Const before type ignored *)
(* Const before type ignored *)
function iconv_open(__tocode:Pchar; __fromcode:Pchar):Ticonv_t;cdecl;external;
{ Convert at most *INBYTESLEFT bytes from *INBUF according to the
   code conversion algorithm specified by CD and place up to
   *OUTBYTESLEFT bytes in buffer at *OUTBUF.   }
function iconv(__cd:Ticonv_t; __inbuf:PPchar; __inbytesleft:Psize_t; __outbuf:PPchar; __outbytesleft:Psize_t):Tsize_t;cdecl;external;
{$endif}
{ iconv.h  }

implementation


end.
