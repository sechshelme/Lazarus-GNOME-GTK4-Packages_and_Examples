
unit spelling_provider;
interface

{
  Automatically converted by H2Pas 1.0.0 from spelling_provider.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    spelling_provider.h
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
PGPtrArray  = ^GPtrArray;
PSpellingLanguage  = ^SpellingLanguage;
PSpellingProvider  = ^SpellingProvider;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * spelling-provider.h
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
function SPELLING_TYPE_PROVIDER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SPELLING_PROVIDER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SPELLING_PROVIDER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SPELLING_IS_PROVIDER(obj : longint) : longint;

type

function spelling_provider_get_type:TGType;cdecl;external;
function spelling_provider_get_default:PSpellingProvider;cdecl;external;
(* Const before type ignored *)
function spelling_provider_get_default_code(self:PSpellingProvider):Pchar;cdecl;external;
(* Const before type ignored *)
function spelling_provider_get_display_name(self:PSpellingProvider):Pchar;cdecl;external;
(* Const before type ignored *)
function spelling_provider_supports_language(self:PSpellingProvider; language:Pchar):Tgboolean;cdecl;external;
function spelling_provider_list_languages(self:PSpellingProvider):PGPtrArray;cdecl;external;
(* Const before type ignored *)
function spelling_provider_get_language(self:PSpellingProvider; language:Pchar):PSpellingLanguage;cdecl;external;
{G_DEFINE_AUTOPTR_CLEANUP_FUNC  (SpellingProvider, g_object_unref) }

implementation

{ was #define dname def_expr }
function SPELLING_TYPE_PROVIDER : longint; { return type might be wrong }
  begin
    SPELLING_TYPE_PROVIDER:=spelling_provider_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SPELLING_PROVIDER(obj : longint) : longint;
begin
  SPELLING_PROVIDER:=G_TYPE_CHECK_INSTANCE_CAST(obj,SPELLING_TYPE_PROVIDER,SpellingProvider);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SPELLING_PROVIDER_CLASS(klass : longint) : longint;
begin
  SPELLING_PROVIDER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,SPELLING_TYPE_PROVIDER,SpellingProviderClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SPELLING_IS_PROVIDER(obj : longint) : longint;
begin
  SPELLING_IS_PROVIDER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,SPELLING_TYPE_PROVIDER);
end;


end.
