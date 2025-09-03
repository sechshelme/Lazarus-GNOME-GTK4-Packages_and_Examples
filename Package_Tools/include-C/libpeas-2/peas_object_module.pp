
unit peas_object_module;
interface

{
  Automatically converted by H2Pas 1.0.0 from peas_object_module.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    peas_object_module.h
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
PGModule  = ^GModule;
PGObject  = ^GObject;
PGParameter  = ^GParameter;
PPeasFactoryFunc  = ^PeasFactoryFunc;
PPeasObjectModule  = ^PeasObjectModule;
PPeasObjectModuleClass  = ^PeasObjectModuleClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * peas-object-module.h
 * This file is part of libpeas
 *
 * Copyright (C) 2003 Marco Pesenti Gritti
 * Copyright (C) 2003, 2004 Christian Persch
 * Copyright (C) 2005-2007 Paolo Maggi
 * Copyright (C) 2008 Jesse van den Kieboom
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
{$include <gmodule.h>}
{$include "peas-version-macros.h"}

{ was #define dname def_expr }
function PEAS_TYPE_OBJECT_MODULE : longint; { return type might be wrong }

{ G_DECLARE_DERIVABLE_TYPE (PeasObjectModule, peas_object_module, PEAS, OBJECT_MODULE, GTypeModule) }
{*
 * PeasFactoryFunc:
 * @n_parameters: The number of paramteters.
 * @parameters: (array length=n_parameters): The parameters.
 * @user_data: Optional data to be passed to the function, or %NULL.
 *
 * A #PeasFactoryFunc is a factory function which will instanciate a new
 * extension of a given type. [ctor@GObject.Object.newv] is such a function.
 *
 * It is used with [method@ObjectModule.register_extension_factory].
 *
 * Returns: (transfer full): The created object.
  }
type
  PPeasFactoryFunc = ^TPeasFactoryFunc;
  TPeasFactoryFunc = function (n_parameters:Tguint; parameters:PGParameter; user_data:Tgpointer):PGObject;cdecl;
{*
 * PeasObjectModuleClass:
 * @parent_class: The parent class.
 *
 * The class structure for #PeasObjectModule.
  }
{< private > }
  PPeasObjectModuleClass = ^TPeasObjectModuleClass;
  TPeasObjectModuleClass = record
      parent_class : TGTypeModuleClass;cdecl;
      _reserved : array[0..7] of Tgpointer;
    end;

(* Const before type ignored *)
(* Const before type ignored *)

function peas_object_module_new(module_name:Pchar; path:Pchar; resident:Tgboolean):PPeasObjectModule;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function peas_object_module_new_full(module_name:Pchar; path:Pchar; resident:Tgboolean; local_linkage:Tgboolean):PPeasObjectModule;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function peas_object_module_new_embedded(module_name:Pchar; symbol:Pchar):PPeasObjectModule;cdecl;external;
{ xxxxxxxxxxxG_GNUC_BEGIN_IGNORE_DEPRECATIONS }
function peas_object_module_create_object(module:PPeasObjectModule; exten_type:TGType; n_parameters:Tguint; parameters:PGParameter):PGObject;cdecl;external;
{ xxxxxxxxxxxxxxG_GNUC_END_IGNORE_DEPRECATIONS }
function peas_object_module_provides_object(module:PPeasObjectModule; exten_type:TGType):Tgboolean;cdecl;external;
(* Const before type ignored *)
function peas_object_module_get_path(module:PPeasObjectModule):Pchar;cdecl;external;
(* Const before type ignored *)
function peas_object_module_get_module_name(module:PPeasObjectModule):Pchar;cdecl;external;
(* Const before type ignored *)
function peas_object_module_get_symbol(module:PPeasObjectModule):Pchar;cdecl;external;
function peas_object_module_get_library(module:PPeasObjectModule):PGModule;cdecl;external;
procedure peas_object_module_register_extension_factory(module:PPeasObjectModule; exten_type:TGType; factory_func:TPeasFactoryFunc; user_data:Tgpointer; destroy_func:TGDestroyNotify);cdecl;external;
procedure peas_object_module_register_extension_type(module:PPeasObjectModule; exten_type:TGType; impl_type:TGType);cdecl;external;

implementation

{ was #define dname def_expr }
function PEAS_TYPE_OBJECT_MODULE : longint; { return type might be wrong }
  begin
    PEAS_TYPE_OBJECT_MODULE:=peas_object_module_get_type;
  end;


end.
