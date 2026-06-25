
unit gtypeplugin;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtypeplugin.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtypeplugin.h
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
PGInterfaceInfo  = ^GInterfaceInfo;
PGTypeInfo  = ^GTypeInfo;
PGTypePlugin  = ^GTypePlugin;
PGTypePluginClass  = ^GTypePluginClass;
PGTypeValueTable  = ^GTypeValueTable;
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

{ was #define dname def_expr }
function G_TYPE_TYPE_PLUGIN : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_PLUGIN(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_PLUGIN_CLASS(vtable : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TYPE_PLUGIN(inst : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TYPE_PLUGIN_CLASS(vtable : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_PLUGIN_GET_CLASS(inst : longint) : longint;

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

function g_type_plugin_get_type:TGType;cdecl;external;
procedure g_type_plugin_use(plugin:PGTypePlugin);cdecl;external;
procedure g_type_plugin_unuse(plugin:PGTypePlugin);cdecl;external;
procedure g_type_plugin_complete_type_info(plugin:PGTypePlugin; g_type:TGType; info:PGTypeInfo; value_table:PGTypeValueTable);cdecl;external;
procedure g_type_plugin_complete_interface_info(plugin:PGTypePlugin; instance_type:TGType; interface_type:TGType; info:PGInterfaceInfo);cdecl;external;
{$endif}
{ __G_TYPE_PLUGIN_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_TYPE_PLUGIN : longint; { return type might be wrong }
  begin
    G_TYPE_TYPE_PLUGIN:=g_type_plugin_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_PLUGIN(inst : longint) : longint;
begin
  G_TYPE_PLUGIN:=G_TYPE_CHECK_INSTANCE_CAST(inst,G_TYPE_TYPE_PLUGIN,GTypePlugin);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_PLUGIN_CLASS(vtable : longint) : longint;
begin
  G_TYPE_PLUGIN_CLASS:=G_TYPE_CHECK_CLASS_CAST(vtable,G_TYPE_TYPE_PLUGIN,GTypePluginClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TYPE_PLUGIN(inst : longint) : longint;
begin
  G_IS_TYPE_PLUGIN:=G_TYPE_CHECK_INSTANCE_TYPE(inst,G_TYPE_TYPE_PLUGIN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TYPE_PLUGIN_CLASS(vtable : longint) : longint;
begin
  G_IS_TYPE_PLUGIN_CLASS:=G_TYPE_CHECK_CLASS_TYPE(vtable,G_TYPE_TYPE_PLUGIN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_PLUGIN_GET_CLASS(inst : longint) : longint;
begin
  G_TYPE_PLUGIN_GET_CLASS:=G_TYPE_INSTANCE_GET_INTERFACE(inst,G_TYPE_TYPE_PLUGIN,GTypePluginClass);
end;


end.
