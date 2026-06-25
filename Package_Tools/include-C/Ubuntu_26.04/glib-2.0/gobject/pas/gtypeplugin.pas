unit gtypeplugin;

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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __G_TYPE_PLUGIN_H__}
{$define __G_TYPE_PLUGIN_H__}
{$if !defined (__GLIB_GOBJECT_H_INSIDE__) && !defined (GOBJECT_COMPILATION)}
{$error "Only <glib-object.h> can be included directly."}
{$endif}
{$include	<gobject/gtype.h>}
{ --- type macros ---  }

{ --- typedefs & structures ---  }
type
{*
 * GTypePluginUse:
 * @plugin: the #GTypePlugin whose use count should be increased
 * 
 * The type of the @use_plugin function of #GTypePluginClass, which gets called
 * to increase the use count of @plugin.
  }

  TGTypePluginUse = procedure (plugin:PGTypePlugin);cdecl;
{*
 * GTypePluginUnuse:
 * @plugin: the #GTypePlugin whose use count should be decreased
 * 
 * The type of the @unuse_plugin function of #GTypePluginClass.
  }

  TGTypePluginUnuse = procedure (plugin:PGTypePlugin);cdecl;
{*
 * GTypePluginCompleteTypeInfo:
 * @plugin: the #GTypePlugin
 * @g_type: the #GType whose info is completed
 * @info: the #GTypeInfo struct to fill in
 * @value_table: the #GTypeValueTable to fill in
 * 
 * The type of the @complete_type_info function of #GTypePluginClass.
  }

  TGTypePluginCompleteTypeInfo = procedure (plugin:PGTypePlugin; g_type:TGType; info:PGTypeInfo; value_table:PGTypeValueTable);cdecl;
{*
 * GTypePluginCompleteInterfaceInfo:
 * @plugin: the #GTypePlugin
 * @instance_type: the #GType of an instantiatable type to which the interface
 *  is added
 * @interface_type: the #GType of the interface whose info is completed
 * @info: the #GInterfaceInfo to fill in
 * 
 * The type of the @complete_interface_info function of #GTypePluginClass.
  }

  TGTypePluginCompleteInterfaceInfo = procedure (plugin:PGTypePlugin; instance_type:TGType; interface_type:TGType; info:PGInterfaceInfo);cdecl;
{*
 * GTypePluginClass:
 * @use_plugin: Increases the use count of the plugin.
 * @unuse_plugin: Decreases the use count of the plugin.
 * @complete_type_info: Fills in the #GTypeInfo and 
 *  #GTypeValueTable structs for the type. The structs are initialized
 *  with `memset(s, 0, sizeof (s))` before calling this function.
 * @complete_interface_info: Fills in missing parts of the #GInterfaceInfo 
 *  for the interface. The structs is initialized with
 *  `memset(s, 0, sizeof (s))` before calling this function.
 * 
 * The #GTypePlugin interface is used by the type system in order to handle
 * the lifecycle of dynamically loaded types.
  }
{< private > }
{< public > }
  PGTypePluginClass = ^TGTypePluginClass;
  TGTypePluginClass = record
      base_iface : TGTypeInterface;cdecl;
      use_plugin : TGTypePluginUse;
      unuse_plugin : TGTypePluginUnuse;
      complete_type_info : TGTypePluginCompleteTypeInfo;
      complete_interface_info : TGTypePluginCompleteInterfaceInfo;
    end;

{ --- prototypes ---  }

function g_type_plugin_get_type:TGType;cdecl;external libgobject2_0;
procedure g_type_plugin_use(plugin:PGTypePlugin);cdecl;external libgobject2_0;
procedure g_type_plugin_unuse(plugin:PGTypePlugin);cdecl;external libgobject2_0;
procedure g_type_plugin_complete_type_info(plugin:PGTypePlugin; g_type:TGType; info:PGTypeInfo; value_table:PGTypeValueTable);cdecl;external libgobject2_0;
procedure g_type_plugin_complete_interface_info(plugin:PGTypePlugin; instance_type:TGType; interface_type:TGType; info:PGInterfaceInfo);cdecl;external libgobject2_0;
{$endif}
{ __G_TYPE_PLUGIN_H__  }

// === Konventiert am: 25-6-26 15:15:17 ===

function G_TYPE_TYPE_PLUGIN : TGType;
function G_TYPE_PLUGIN(obj : Pointer) : PGTypePlugin;
function G_TYPE_PLUGIN_CLASS(klass : Pointer) : PGTypePluginClass;
function G_IS_TYPE_PLUGIN(obj : Pointer) : Tgboolean;
function G_IS_TYPE_PLUGIN_CLASS(klass : Pointer) : Tgboolean;
function G_TYPE_PLUGIN_GET_CLASS(obj : Pointer) : PGTypePluginClass;

implementation

function G_TYPE_TYPE_PLUGIN : TGType;
  begin
    G_TYPE_TYPE_PLUGIN:=g_type_plugin_get_type;
  end;

function G_TYPE_PLUGIN(obj : Pointer) : PGTypePlugin;
begin
  Result := PGTypePlugin(g_type_check_instance_cast(obj, G_TYPE_TYPE_PLUGIN));
end;

function G_TYPE_PLUGIN_CLASS(klass : Pointer) : PGTypePluginClass;
begin
  Result := PGTypePluginClass(g_type_check_class_cast(klass, G_TYPE_TYPE_PLUGIN));
end;

function G_IS_TYPE_PLUGIN(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_TYPE_PLUGIN);
end;

function G_IS_TYPE_PLUGIN_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_TYPE_PLUGIN);
end;

function G_TYPE_PLUGIN_GET_CLASS(obj : Pointer) : PGTypePluginClass;
begin
  Result := PGTypePluginClass(PGTypeInstance(obj)^.g_class);
end;



end.
