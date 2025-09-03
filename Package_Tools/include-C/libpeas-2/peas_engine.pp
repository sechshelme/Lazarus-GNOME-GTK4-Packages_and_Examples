
unit peas_engine;
interface

{
  Automatically converted by H2Pas 1.0.0 from peas_engine.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    peas_engine.h
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
PPeasPluginInfo  = ^PeasPluginInfo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * peas-engine.h
 * This file is part of libpeas
 *
 * Copyright (C) 2002-2005 - Paolo Maggi
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
{$include "peas-plugin-info.h"}
{$include "peas-version-macros.h"}

{ was #define dname def_expr }
function PEAS_TYPE_ENGINE : longint; { return type might be wrong }

{ G_DECLARE_FINAL_TYPE (PeasEngine, peas_engine, PEAS, ENGINE, GObject) }
function peas_engine_new:PPeasEngine;cdecl;external;
function peas_engine_new_with_nonglobal_loaders:PPeasEngine;cdecl;external;
function peas_engine_get_default:PPeasEngine;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure peas_engine_add_search_path(engine:PPeasEngine; module_dir:Pchar; data_dir:Pchar);cdecl;external;
(* Const before type ignored *)
procedure peas_engine_enable_loader(engine:PPeasEngine; loader_name:Pchar);cdecl;external;
procedure peas_engine_rescan_plugins(engine:PPeasEngine);cdecl;external;
function peas_engine_dup_loaded_plugins(engine:PPeasEngine):^Pchar;cdecl;external;
(* Const before type ignored *)
procedure peas_engine_set_loaded_plugins(engine:PPeasEngine; plugin_names:PPchar);cdecl;external;
(* Const before type ignored *)
function peas_engine_get_plugin_info(engine:PPeasEngine; plugin_name:Pchar):PPeasPluginInfo;cdecl;external;
function peas_engine_load_plugin(engine:PPeasEngine; info:PPeasPluginInfo):Tgboolean;cdecl;external;
function peas_engine_unload_plugin(engine:PPeasEngine; info:PPeasPluginInfo):Tgboolean;cdecl;external;
procedure peas_engine_garbage_collect(engine:PPeasEngine);cdecl;external;
function peas_engine_provides_extension(engine:PPeasEngine; info:PPeasPluginInfo; extension_type:TGType):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function peas_engine_create_extension_with_properties(engine:PPeasEngine; info:PPeasPluginInfo; extension_type:TGType; n_properties:Tguint; prop_names:PPchar; 
           prop_values:PGValue):PGObject;cdecl;external;
(* Const before type ignored *)
function peas_engine_create_extension_valist(engine:PPeasEngine; info:PPeasPluginInfo; extension_type:TGType; first_property:Pchar; var_args:Tva_list):PGObject;cdecl;external;
(* Const before type ignored *)
function peas_engine_create_extension(engine:PPeasEngine; info:PPeasPluginInfo; extension_type:TGType; first_property:Pchar; args:array of const):PGObject;cdecl;external;
function peas_engine_create_extension(engine:PPeasEngine; info:PPeasPluginInfo; extension_type:TGType; first_property:Pchar):PGObject;cdecl;external;

implementation

{ was #define dname def_expr }
function PEAS_TYPE_ENGINE : longint; { return type might be wrong }
  begin
    PEAS_TYPE_ENGINE:=peas_engine_get_type;
  end;


end.
