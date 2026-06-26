unit gdbusobjectskeleton;

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
{$ifndef __G_DBUS_OBJECT_SKELETON_H__}
{$define __G_DBUS_OBJECT_SKELETON_H__}
{$include <gio/giotypes.h>}

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_OBJECT_SKELETON(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_OBJECT_SKELETON_CLASS(klass : longint) : longint;

type
{< private > }
  PGDBusObjectSkeleton = ^TGDBusObjectSkeleton;
  TGDBusObjectSkeleton = record
      parent_instance : TGObject;
      priv : PGDBusObjectSkeletonPrivate;
    end;

{*
 * GDBusObjectSkeletonClass:
 * @parent_class: The parent class.
 * @authorize_method: Signal class handler for the #GDBusObjectSkeleton::authorize-method signal.
 *
 * Class structure for #GDBusObjectSkeleton.
 *
 * Since: 2.30
  }
{ Signals  }
{< private > }
  PGDBusObjectSkeletonClass = ^TGDBusObjectSkeletonClass;
  TGDBusObjectSkeletonClass = record
      parent_class : TGObjectClass;
      authorize_method : function (object:PGDBusObjectSkeleton; interface_:PGDBusInterfaceSkeleton; invocation:PGDBusMethodInvocation):Tgboolean;cdecl;
      padding : array[0..7] of Tgpointer;
    end;


function g_dbus_object_skeleton_get_type:TGType;cdecl;external libgio2;
function g_dbus_object_skeleton_new(object_path:Pgchar):PGDBusObjectSkeleton;cdecl;external libgio2;
procedure g_dbus_object_skeleton_flush(object:PGDBusObjectSkeleton);cdecl;external libgio2;
procedure g_dbus_object_skeleton_add_interface(object:PGDBusObjectSkeleton; interface_:PGDBusInterfaceSkeleton);cdecl;external libgio2;
procedure g_dbus_object_skeleton_remove_interface(object:PGDBusObjectSkeleton; interface_:PGDBusInterfaceSkeleton);cdecl;external libgio2;
procedure g_dbus_object_skeleton_remove_interface_by_name(object:PGDBusObjectSkeleton; interface_name:Pgchar);cdecl;external libgio2;
procedure g_dbus_object_skeleton_set_object_path(object:PGDBusObjectSkeleton; object_path:Pgchar);cdecl;external libgio2;
{$endif}
{ __G_DBUS_OBJECT_SKELETON_H  }

// === Konventiert am: 26-6-26 19:18:53 ===

function G_TYPE_DBUS_OBJECT_SKELETON : TGType;
function G_DBUS_OBJECT_SKELETON(obj : Pointer) : PGDBusObjectSkeleton;
function G_DBUS_OBJECT_SKELETON_CLASS(klass : Pointer) : PGDBusObjectSkeletonClass;
function G_DBUS_OBJECT_SKELETON_GET_CLASS(obj : Pointer) : PGDBusObjectSkeletonClass;

implementation

function G_TYPE_DBUS_OBJECT_SKELETON : TGType;
  begin
    G_TYPE_DBUS_OBJECT_SKELETON:=g_dbus_object_skeleton_get_type;
  end;

function G_DBUS_OBJECT_SKELETON(obj : Pointer) : PGDBusObjectSkeleton;
begin
  Result := PGDBusObjectSkeleton(g_type_check_instance_cast(obj, G_TYPE_DBUS_OBJECT_SKELETON));
end;

function G_DBUS_OBJECT_SKELETON_CLASS(klass : Pointer) : PGDBusObjectSkeletonClass;
begin
  Result := PGDBusObjectSkeletonClass(g_type_check_class_cast(klass, G_TYPE_DBUS_OBJECT_SKELETON));
end;

function G_DBUS_OBJECT_SKELETON_GET_CLASS(obj : Pointer) : PGDBusObjectSkeletonClass;
begin
  Result := PGDBusObjectSkeletonClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_OBJECT_SKELETON(obj : longint) : longint;
begin
  G_IS_DBUS_OBJECT_SKELETON:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_DBUS_OBJECT_SKELETON);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_OBJECT_SKELETON_CLASS(klass : longint) : longint;
begin
  G_IS_DBUS_OBJECT_SKELETON_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_DBUS_OBJECT_SKELETON);
end;


end.
