
unit shumate_symbol_event;
interface

{
  Automatically converted by H2Pas 1.0.0 from shumate_symbol_event.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shumate_symbol_event.h
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
PShumateSymbolEvent  = ^ShumateSymbolEvent;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2022 James Westman <james@jwestman.net>
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <https://www.gnu.org/licenses/>.
  }
{$if !defined (__SHUMATE_SHUMATE_H_INSIDE__) && !defined (SHUMATE_COMPILATION)}
{$error "Only <shumate/shumate.h> can be included directly."}
{$endif}
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}

{ was #define dname def_expr }
function SHUMATE_TYPE_SYMBOL_EVENT : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (ShumateSymbolEvent, shumate_symbol_event, SHUMATE, SYMBOL_EVENT, GObject) }
(* Const before type ignored *)
function shumate_symbol_event_get_layer(self:PShumateSymbolEvent):Pchar;cdecl;external;
(* Const before type ignored *)
function shumate_symbol_event_get_source_layer(self:PShumateSymbolEvent):Pchar;cdecl;external;
(* Const before type ignored *)
function shumate_symbol_event_get_feature_id(self:PShumateSymbolEvent):Pchar;cdecl;external;
(* Const before type ignored *)
function shumate_symbol_event_get_keys(self:PShumateSymbolEvent):TGStrv;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function shumate_symbol_event_get_tag(self:PShumateSymbolEvent; tag_name:Pchar):Pchar;cdecl;external;

implementation

{ was #define dname def_expr }
function SHUMATE_TYPE_SYMBOL_EVENT : longint; { return type might be wrong }
  begin
    SHUMATE_TYPE_SYMBOL_EVENT:=shumate_symbol_event_get_type;
  end;


end.
