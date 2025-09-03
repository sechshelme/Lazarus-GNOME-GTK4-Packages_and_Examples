
unit peas_extension_set;
interface

{
  Automatically converted by H2Pas 1.0.0 from peas_extension_set.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    peas_extension_set.h
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
PGObject  = ^GObject;
PGValue  = ^GValue;
PPeasEngine  = ^PeasEngine;
PPeasExtensionSet  = ^PeasExtensionSet;
PPeasPluginInfo  = ^PeasPluginInfo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * peas-extension-set.h
 * This file is part of libpeas
 *
 * Copyright (C) 2010 - Steve Frécinaux
 *
 * libpeas is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * libpeas is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined (LIBPEAS_INSIDE) && !defined (LIBPEAS_COMPILATION)}
{$error "Only <libpeas.h> can be included directly."}
{$endif}
{$include <glib-object.h>}
{$include "peas-engine.h"}
{$include "peas-version-macros.h"}

{ was #define dname def_expr }
function PEAS_TYPE_EXTENSION_SET : longint; { return type might be wrong }

{ G_DECLARE_FINAL_TYPE (PeasExtensionSet, peas_extension_set, PEAS, EXTENSION_SET, GObject) }
{*
 * PeasExtensionSetForeachFunc:
 * @set: A #PeasExtensionSet.
 * @info: A #PeasPluginInfo.
 * @extension: The extension instance.
 * @data: Optional data passed to the function.
 *
 * This function is passed to [method@ExtensionSet.foreach] and
 * will be called for each extension in @set.
  }
type

  TPeasExtensionSetForeachFunc = procedure (set:PPeasExtensionSet; info:PPeasPluginInfo; extension:PGObject; data:Tgpointer);cdecl;

procedure peas_extension_set_foreach(set:PPeasExtensionSet; func:TPeasExtensionSetForeachFunc; data:Tgpointer);cdecl;external;
function peas_extension_set_get_extension(set:PPeasExtensionSet; info:PPeasPluginInfo):PGObject;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function peas_extension_set_new_with_properties(engine:PPeasEngine; exten_type:TGType; n_properties:Tguint; prop_names:PPchar; prop_values:PGValue):PPeasExtensionSet;cdecl;external;
(* Const before type ignored *)
function peas_extension_set_new_valist(engine:PPeasEngine; exten_type:TGType; first_property:Pchar; var_args:Tva_list):PPeasExtensionSet;cdecl;external;
(* Const before type ignored *)
function peas_extension_set_new(engine:PPeasEngine; exten_type:TGType; first_property:Pchar; args:array of const):PPeasExtensionSet;cdecl;external;
function peas_extension_set_new(engine:PPeasEngine; exten_type:TGType; first_property:Pchar):PPeasExtensionSet;cdecl;external;

implementation

{ was #define dname def_expr }
function PEAS_TYPE_EXTENSION_SET : longint; { return type might be wrong }
  begin
    PEAS_TYPE_EXTENSION_SET:=peas_extension_set_get_type;
  end;


end.
