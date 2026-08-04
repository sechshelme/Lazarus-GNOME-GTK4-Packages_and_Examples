
unit spelling_text_buffer_adapter;
interface

{
  Automatically converted by H2Pas 1.0.0 from spelling_text_buffer_adapter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    spelling_text_buffer_adapter.h
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
PGMenuModel  = ^GMenuModel;
PGtkSourceBuffer  = ^GtkSourceBuffer;
PGtkTextTag  = ^GtkTextTag;
PSpellingChecker  = ^SpellingChecker;
PSpellingTextBufferAdapter  = ^SpellingTextBufferAdapter;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * spelling-text-buffer-adapter.h
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
{$include <gtksourceview/gtksource.h>}
{$include "spelling-types.h"}
{$include "spelling-version-macros.h"}

{ was #define dname def_expr }
function SPELLING_TYPE_TEXT_BUFFER_ADAPTER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (SpellingTextBufferAdapter, spelling_text_buffer_adapter, SPELLING, TEXT_BUFFER_ADAPTER, GObject) }
function spelling_text_buffer_adapter_new(buffer:PGtkSourceBuffer; checker:PSpellingChecker):PSpellingTextBufferAdapter;cdecl;external;
function spelling_text_buffer_adapter_get_buffer(self:PSpellingTextBufferAdapter):PGtkSourceBuffer;cdecl;external;
function spelling_text_buffer_adapter_get_enabled(self:PSpellingTextBufferAdapter):Tgboolean;cdecl;external;
procedure spelling_text_buffer_adapter_set_enabled(self:PSpellingTextBufferAdapter; enabled:Tgboolean);cdecl;external;
function spelling_text_buffer_adapter_get_checker(self:PSpellingTextBufferAdapter):PSpellingChecker;cdecl;external;
procedure spelling_text_buffer_adapter_set_checker(self:PSpellingTextBufferAdapter; checker:PSpellingChecker);cdecl;external;
(* Const before type ignored *)
function spelling_text_buffer_adapter_get_language(self:PSpellingTextBufferAdapter):Pchar;cdecl;external;
(* Const before type ignored *)
procedure spelling_text_buffer_adapter_set_language(self:PSpellingTextBufferAdapter; language:Pchar);cdecl;external;
procedure spelling_text_buffer_adapter_invalidate_all(self:PSpellingTextBufferAdapter);cdecl;external;
function spelling_text_buffer_adapter_get_tag(self:PSpellingTextBufferAdapter):PGtkTextTag;cdecl;external;
function spelling_text_buffer_adapter_get_menu_model(self:PSpellingTextBufferAdapter):PGMenuModel;cdecl;external;

implementation

{ was #define dname def_expr }
function SPELLING_TYPE_TEXT_BUFFER_ADAPTER : longint; { return type might be wrong }
  begin
    SPELLING_TYPE_TEXT_BUFFER_ADAPTER:=spelling_text_buffer_adapter_get_type;
  end;


end.
