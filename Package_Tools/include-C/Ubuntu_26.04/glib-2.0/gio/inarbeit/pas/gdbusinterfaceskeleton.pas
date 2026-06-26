unit gdbusinterfaceskeleton;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDBus - GLib D-Bus Library
 *
 * Copyright (C) 2008-2010 Red Hat, Inc.
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
 *
 * Author: David Zeuthen <davidz@redhat.com>
  }
{$ifndef __G_DBUS_INTERFACE_SKELETON_H__}
{$define __G_DBUS_INTERFACE_SKELETON_H__}
{$include <gio/gdbusconnection.h>}
{$include <gio/giotypes.h>}

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_INTERFACE_SKELETON(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_INTERFACE_SKELETON_CLASS(klass : longint) : longint;

type
{< private > }
  PGDBusInterfaceSkeleton = ^TGDBusInterfaceSkeleton;
  TGDBusInterfaceSkeleton = record
      parent_instance : TGObject;
      priv : PGDBusInterfaceSkeletonPrivate;
    end;

{*
 * GDBusInterfaceSkeletonClass:
 * @parent_class: The parent class.
 * @get_info: Returns a #GDBusInterfaceInfo. See g_dbus_interface_skeleton_get_info() for details.
 * @get_vtable: Returns a #GDBusInterfaceVTable. See g_dbus_interface_skeleton_get_vtable() for details.
 * @get_properties: Returns a #GVariant with all properties. See g_dbus_interface_skeleton_get_properties().
 * @flush: Emits outstanding changes, if any. See g_dbus_interface_skeleton_flush().
 * @method_dispatch: Dispatches a method invocation. (Since: 2.88)
 * @g_authorize_method: Signal class handler for the #GDBusInterfaceSkeleton::g-authorize-method signal.
 *
 * Class structure for #GDBusInterfaceSkeleton.
 *
 * Since: 2.30
  }
{ Virtual Functions  }
{< private > }
{< public > }
{ Signals  }
{< private > }
  PGDBusInterfaceSkeletonClass = ^TGDBusInterfaceSkeletonClass;
  TGDBusInterfaceSkeletonClass = record
      parent_class : TGObjectClass;
      get_info : function (interface_:PGDBusInterfaceSkeleton):PGDBusInterfaceInfo;cdecl;
      get_vtable : function (interface_:PGDBusInterfaceSkeleton):PGDBusInterfaceVTable;cdecl;
      get_properties : function (interface_:PGDBusInterfaceSkeleton):PGVariant;cdecl;
      flush : procedure (interface_:PGDBusInterfaceSkeleton);cdecl;
      method_dispatch : procedure (interface_:PGDBusInterfaceSkeleton; method_call_func:TGDBusInterfaceMethodCallFunc; invocation:PGDBusMethodInvocation; flags:TGDBusInterfaceSkeletonFlags; object:PGDBusObject);cdecl;
      vfunc_padding : array[0..6] of Tgpointer;
      g_authorize_method : function (interface_:PGDBusInterfaceSkeleton; invocation:PGDBusMethodInvocation):Tgboolean;cdecl;
      signal_padding : array[0..7] of Tgpointer;
    end;


function g_dbus_interface_skeleton_get_type:TGType;cdecl;external libgio2;
function g_dbus_interface_skeleton_get_flags(interface_:PGDBusInterfaceSkeleton):TGDBusInterfaceSkeletonFlags;cdecl;external libgio2;
procedure g_dbus_interface_skeleton_set_flags(interface_:PGDBusInterfaceSkeleton; flags:TGDBusInterfaceSkeletonFlags);cdecl;external libgio2;
function g_dbus_interface_skeleton_get_info(interface_:PGDBusInterfaceSkeleton):PGDBusInterfaceInfo;cdecl;external libgio2;
function g_dbus_interface_skeleton_get_vtable(interface_:PGDBusInterfaceSkeleton):PGDBusInterfaceVTable;cdecl;external libgio2;
function g_dbus_interface_skeleton_get_properties(interface_:PGDBusInterfaceSkeleton):PGVariant;cdecl;external libgio2;
procedure g_dbus_interface_skeleton_flush(interface_:PGDBusInterfaceSkeleton);cdecl;external libgio2;
function g_dbus_interface_skeleton_export(interface_:PGDBusInterfaceSkeleton; connection:PGDBusConnection; object_path:Pgchar; error:PPGError):Tgboolean;cdecl;external libgio2;
procedure g_dbus_interface_skeleton_unexport(interface_:PGDBusInterfaceSkeleton);cdecl;external libgio2;
procedure g_dbus_interface_skeleton_unexport_from_connection(interface_:PGDBusInterfaceSkeleton; connection:PGDBusConnection);cdecl;external libgio2;
function g_dbus_interface_skeleton_get_connection(interface_:PGDBusInterfaceSkeleton):PGDBusConnection;cdecl;external libgio2;
function g_dbus_interface_skeleton_get_connections(interface_:PGDBusInterfaceSkeleton):PGList;cdecl;external libgio2;
function g_dbus_interface_skeleton_has_connection(interface_:PGDBusInterfaceSkeleton; connection:PGDBusConnection):Tgboolean;cdecl;external libgio2;
function g_dbus_interface_skeleton_get_object_path(interface_:PGDBusInterfaceSkeleton):Pgchar;cdecl;external libgio2;
{$endif}
{ __G_DBUS_INTERFACE_SKELETON_H  }

// === Konventiert am: 26-6-26 16:42:47 ===

function G_TYPE_DBUS_INTERFACE_SKELETON : TGType;
function G_DBUS_INTERFACE_SKELETON(obj : Pointer) : PGDBusInterfaceSkeleton;
function G_DBUS_INTERFACE_SKELETON_CLASS(klass : Pointer) : PGDBusInterfaceSkeletonClass;
function G_DBUS_INTERFACE_SKELETON_GET_CLASS(obj : Tgboolean) : longint;

implementation

function G_TYPE_DBUS_INTERFACE_SKELETON : TGType;
  begin
    G_TYPE_DBUS_INTERFACE_SKELETON:=g_dbus_interface_skeleton_get_type;
  end;

function G_DBUS_INTERFACE_SKELETON(obj : Pointer) : PGDBusInterfaceSkeleton;
begin
  Result := PGDBusInterfaceSkeleton(g_type_check_instance_cast(obj, G_TYPE_DBUS_INTERFACE_SKELETON));
end;

function G_DBUS_INTERFACE_SKELETON_CLASS(klass : Pointer) : PGDBusInterfaceSkeletonClass;
begin
  Result := PGDBusInterfaceSkeletonClass(g_type_check_class_cast(klass, G_TYPE_DBUS_INTERFACE_SKELETON));
end;

function G_DBUS_INTERFACE_SKELETON_GET_CLASS(obj : Tgboolean) : longint;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_DBUS_INTERFACE_SKELETON);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_INTERFACE_SKELETON(obj : longint) : longint;
begin
  G_IS_DBUS_INTERFACE_SKELETON:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_DBUS_INTERFACE_SKELETON);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_INTERFACE_SKELETON_CLASS(klass : longint) : longint;
begin
  G_IS_DBUS_INTERFACE_SKELETON_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_DBUS_INTERFACE_SKELETON);
end;


end.
