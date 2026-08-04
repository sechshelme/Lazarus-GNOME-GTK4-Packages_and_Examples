
unit spelling_language_info;
interface

{
  Automatically converted by H2Pas 1.0.0 from spelling_language_info.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    spelling_language_info.h
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
PSpellingLanguageInfo  = ^SpellingLanguageInfo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * spelling-language-info.h
 *
 * Copyright 2021-2023 Christian Hergert <chergert@redhat.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(LIBSPELLING_INSIDE) && !defined(LIBSPELLING_COMPILATION)}
{$error "Only <libspelling.h> can be included directly."}
{$endif}
{$include <glib-object.h>}
{$include "spelling-version-macros.h"}

{ was #define dname def_expr }
function SPELLING_TYPE_LANGUAGE_INFO : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (SpellingLanguageInfo, spelling_language_info, SPELLING, LANGUAGE_INFO, GObject) }
(* Const before type ignored *)
function spelling_language_info_get_group(self:PSpellingLanguageInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function spelling_language_info_get_name(self:PSpellingLanguageInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function spelling_language_info_get_code(self:PSpellingLanguageInfo):Pchar;cdecl;external;

implementation

{ was #define dname def_expr }
function SPELLING_TYPE_LANGUAGE_INFO : longint; { return type might be wrong }
  begin
    SPELLING_TYPE_LANGUAGE_INFO:=spelling_language_info_get_type;
  end;


end.
