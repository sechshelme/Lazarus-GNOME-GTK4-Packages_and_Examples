
unit gcharset;
interface

{
  Automatically converted by H2Pas 1.0.0 from gcharset.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gcharset.h
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
Pgchar  = ^gchar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gcharset.h - Charset functions
 *
 *  Copyright (C) 2011 Red Hat, Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __G_CHARSET_H__}
{$define __G_CHARSET_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}
(* Const before type ignored *)

function g_get_charset(charset:PPchar):Tgboolean;cdecl;external;
function g_get_codeset:Pgchar;cdecl;external;
(* Const before type ignored *)
function g_get_console_charset(charset:PPchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function g_get_language_names:^Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function g_get_language_names_with_category(category_name:Pgchar):^Pgchar;cdecl;external;
(* Const before type ignored *)
function g_get_locale_variants(locale:Pgchar):^Pgchar;cdecl;external;
{$endif}
{ __G_CHARSET_H__  }

implementation


end.
