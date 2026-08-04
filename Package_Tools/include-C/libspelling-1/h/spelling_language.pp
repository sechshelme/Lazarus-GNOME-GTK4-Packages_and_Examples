
unit spelling_language;
interface

{
  Automatically converted by H2Pas 1.0.0 from spelling_language.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    spelling_language
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
PSpellingLanguage  = ^SpellingLanguage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * spelling-language.h
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
{$include "spelling-types.h"}
{$include "spelling-version-macros.h"}

{ was #define dname def_expr }
function SPELLING_TYPE_LANGUAGE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SPELLING_LANGUAGE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SPELLING_LANGUAGE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SPELLING_IS_LANGUAGE(obj : longint) : longint;

type

function spelling_language_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function spelling_language_get_code(self:PSpellingLanguage):Pchar;cdecl;external;
(* Const before type ignored *)
function spelling_language_contains_word(self:PSpellingLanguage; word:Pchar; word_len:Tgssize):Tgboolean;cdecl;external;
(* Const before type ignored *)
function spelling_language_list_corrections(self:PSpellingLanguage; word:Pchar; word_len:Tgssize):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure spelling_language_add_word(self:PSpellingLanguage; word:Pchar);cdecl;external;
(* Const before type ignored *)
procedure spelling_language_ignore_word(self:PSpellingLanguage; word:Pchar);cdecl;external;
(* Const before type ignored *)
function spelling_language_get_extra_word_chars(self:PSpellingLanguage):Pchar;cdecl;external;
{G_DEFINE_AUTOPTR_CLEANUP_FUNC  (SpellingLanguage, g_object_unref) }

implementation

{ was #define dname def_expr }
function SPELLING_TYPE_LANGUAGE : longint; { return type might be wrong }
  begin
    SPELLING_TYPE_LANGUAGE:=spelling_language_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SPELLING_LANGUAGE(obj : longint) : longint;
begin
  SPELLING_LANGUAGE:=G_TYPE_CHECK_INSTANCE_CAST(obj,SPELLING_TYPE_LANGUAGE,SpellingLanguage);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SPELLING_LANGUAGE_CLASS(klass : longint) : longint;
begin
  SPELLING_LANGUAGE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,SPELLING_TYPE_LANGUAGE,SpellingLanguageClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SPELLING_IS_LANGUAGE(obj : longint) : longint;
begin
  SPELLING_IS_LANGUAGE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,SPELLING_TYPE_LANGUAGE);
end;


end.
