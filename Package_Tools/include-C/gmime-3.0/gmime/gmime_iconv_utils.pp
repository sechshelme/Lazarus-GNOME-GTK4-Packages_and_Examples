
unit gmime_iconv_utils;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_iconv_utils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_iconv_utils.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-  }
{  GMime
 *  Copyright (C) 2000-2022 Jeffrey Stedfast
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public License
 *  as published by the Free Software Foundation; either version 2.1
 *  of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free
 *  Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
 *  02110-1301, USA.
  }
{$ifndef __GMIME_ICONV_UTILS_H__}
{$define __GMIME_ICONV_UTILS_H__}
{$include <glib.h>}
{$include <sys/types.h>}
{$include <iconv.h>}
(* Const before type ignored *)

function g_mime_iconv_strdup(cd:Ticonv_t; str:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function g_mime_iconv_strndup(cd:Ticonv_t; str:Pchar; n:Tsize_t):Pchar;cdecl;external;
(* Const before type ignored *)
function g_mime_iconv_locale_to_utf8(str:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function g_mime_iconv_locale_to_utf8_length(str:Pchar; n:Tsize_t):Pchar;cdecl;external;
(* Const before type ignored *)
function g_mime_iconv_utf8_to_locale(str:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function g_mime_iconv_utf8_to_locale_length(str:Pchar; n:Tsize_t):Pchar;cdecl;external;
{$endif}
{ __GMIME_ICONV_UTILS_H__  }

implementation


end.
