
unit gmime_charset;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_charset.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_charset.h
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
PGMimeCharset  = ^GMimeCharset;
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
{$ifndef __GMIME_CHARSET_H__}
{$define __GMIME_CHARSET_H__}
{$include <glib.h>}
{$include <sys/types.h>}

procedure g_mime_charset_map_init;cdecl;external;
procedure g_mime_charset_map_shutdown;cdecl;external;
(* Const before type ignored *)
function g_mime_locale_charset:Pchar;cdecl;external;
(* Const before type ignored *)
function g_mime_locale_language:Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_mime_charset_language(charset:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_mime_charset_canon_name(charset:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_mime_charset_iconv_name(charset:Pchar):Pchar;cdecl;external;
{$ifndef GMIME_DISABLE_DEPRECATED}
(* Const before type ignored *)
(* Const before type ignored *)

function g_mime_charset_name(charset:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function g_mime_charset_locale_name:Pchar;cdecl;external;
{$endif}
(* Const before type ignored *)
(* Const before type ignored *)

function g_mime_charset_iso_to_windows(isocharset:Pchar):Pchar;cdecl;external;
type
{*
 * GMimeCharset:
 * @mask: charset mask
 * @level: charset level
 *
 * State used by g_mime_charset_best() and g_mime_charset_best_name().
 * }
  PGMimeCharset = ^TGMimeCharset;
  TGMimeCharset = record
      mask : dword;
      level : dword;
    end;


procedure g_mime_charset_init(charset:PGMimeCharset);cdecl;external;
(* Const before type ignored *)
procedure g_mime_charset_step(charset:PGMimeCharset; inbuf:Pchar; inlen:Tsize_t);cdecl;external;
(* Const before type ignored *)
function g_mime_charset_best_name(charset:PGMimeCharset):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_mime_charset_best(inbuf:Pchar; inlen:Tsize_t):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_mime_charset_can_encode(mask:PGMimeCharset; charset:Pchar; text:Pchar; len:Tsize_t):Tgboolean;cdecl;external;
{$endif}
{ __GMIME_CHARSET_H__  }

implementation


end.
