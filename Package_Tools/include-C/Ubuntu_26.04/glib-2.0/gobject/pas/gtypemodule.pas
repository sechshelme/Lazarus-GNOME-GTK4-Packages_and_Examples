unit gtypemodule;

interface

uses
  fp_glib;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GObject - GLib Type, Object, Parameter and Signal Library
 * Copyright (C) 2000 Red Hat, Inc.
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __G_TYPE_MODULE_H__}
{$define __G_TYPE_MODULE_H__}
{$if !defined (__GLIB_GOBJECT_H_INSIDE__) && !defined (GOBJECT_COMPILATION)}
{$error "Only <glib-object.h> can be included directly."}
{$endif}
{$include <gobject/gobject.h>}
{$include <gobject/genums.h>}
type

{< public > }
type
  PGTypeModule = ^TGTypeModule;
  TGTypeModule = record
      parent_instance : TGObject;
      use_count : Tguint;
      type_infos : PGSList;
      interface_infos : PGSList;
      name : Pgchar;
    end;

{*
 * GTypeModuleClass:
 * @parent_class: the parent class
 * @load: loads the module and registers one or more types using
 *  g_type_module_register_type().
 * @unload: unloads the module
 * 
 * In order to implement dynamic loading of types based on #GTypeModule, 
 * the @load and @unload functions in #GTypeModuleClass must be implemented.
  }
{< public > }
{< private > }
{ Padding for future expansion  }
  PGTypeModuleClass = ^TGTypeModuleClass;
  TGTypeModuleClass = record
      parent_class : TGObjectClass;
      load : function (module:PGTypeModule):Tgboolean;cdecl;
      unload : procedure (module:PGTypeModule);cdecl;
      reserved1 : procedure ;cdecl;
      reserved2 : procedure ;cdecl;
      reserved3 : procedure ;cdecl;
      reserved4 : procedure ;cdecl;
    end;

{*
 * G_IMPLEMENT_INTERFACE_DYNAMIC:
 * @TYPE_IFACE: The #GType of the interface to add
 * @iface_init: The interface init function
 *
 * A convenience macro to ease interface addition in the @_C_ section
 * of G_DEFINE_DYNAMIC_TYPE_EXTENDED().
 *
 * See G_DEFINE_DYNAMIC_TYPE_EXTENDED() for an example.
 *
 * Note that this macro can only be used together with the
 * G_DEFINE_DYNAMIC_TYPE_EXTENDED macros, since it depends on variable
 * names from that macro.
 *
 * Since: 2.24
  }
{*
 * G_ADD_PRIVATE_DYNAMIC:
 * @TypeName: the name of the type in CamelCase
 *
 * A convenience macro to ease adding private data to instances of a new dynamic
 * type in the @_C_ section of G_DEFINE_DYNAMIC_TYPE_EXTENDED().
 *
 * See G_ADD_PRIVATE() for details, it is similar but for static types.
 *
 * Note that this macro can only be used together with the
 * G_DEFINE_DYNAMIC_TYPE_EXTENDED macros, since it depends on variable
 * names from that macro.
 *
 * Since: 2.38
  }

function g_type_module_get_type:TGType;cdecl;external libgobject2_0;
function g_type_module_use(module:PGTypeModule):Tgboolean;cdecl;external libgobject2_0;
procedure g_type_module_unuse(module:PGTypeModule);cdecl;external libgobject2_0;
procedure g_type_module_set_name(module:PGTypeModule; name:Pgchar);cdecl;external libgobject2_0;
function g_type_module_register_type(module:PGTypeModule; parent_type:TGType; type_name:Pgchar; type_info:PGTypeInfo; flags:TGTypeFlags):TGType;cdecl;external libgobject2_0;
procedure g_type_module_add_interface(module:PGTypeModule; instance_type:TGType; interface_type:TGType; interface_info:PGInterfaceInfo);cdecl;external libgobject2_0;
function g_type_module_register_enum(module:PGTypeModule; name:Pgchar; const_static_values:PGEnumValue):TGType;cdecl;external libgobject2_0;
function g_type_module_register_flags(module:PGTypeModule; name:Pgchar; const_static_values:PGFlagsValue):TGType;cdecl;external libgobject2_0;
{$endif}
{ __G_TYPE_MODULE_H__  }

// === Konventiert am: 25-6-26 15:16:10 ===

function G_TYPE_TYPE_MODULE : TGType;
function G_TYPE_MODULE(obj : Pointer) : PGTypeModule;
function G_TYPE_MODULE_CLASS(klass : Pointer) : PGTypeModuleClass;
function G_IS_TYPE_MODULE(obj : Pointer) : Tgboolean;
function G_IS_TYPE_MODULE_CLASS(klass : Pointer) : Tgboolean;
function G_TYPE_MODULE_GET_CLASS(obj : Pointer) : PGTypeModuleClass;

implementation

function G_TYPE_TYPE_MODULE : TGType;
  begin
    G_TYPE_TYPE_MODULE:=g_type_module_get_type;
  end;

function G_TYPE_MODULE(obj : Pointer) : PGTypeModule;
begin
  Result := PGTypeModule(g_type_check_instance_cast(obj, G_TYPE_TYPE_MODULE));
end;

function G_TYPE_MODULE_CLASS(klass : Pointer) : PGTypeModuleClass;
begin
  Result := PGTypeModuleClass(g_type_check_class_cast(klass, G_TYPE_TYPE_MODULE));
end;

function G_IS_TYPE_MODULE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_TYPE_MODULE);
end;

function G_IS_TYPE_MODULE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_TYPE_MODULE);
end;

function G_TYPE_MODULE_GET_CLASS(obj : Pointer) : PGTypeModuleClass;
begin
  Result := PGTypeModuleClass(PGTypeInstance(obj)^.g_class);
end;



end.
