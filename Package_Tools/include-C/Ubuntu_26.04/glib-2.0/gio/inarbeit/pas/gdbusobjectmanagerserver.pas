unit gdbusobjectmanagerserver;

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
{$ifndef __G_DBUS_OBJECT_MANAGER_SERVER_H__}
{$define __G_DBUS_OBJECT_MANAGER_SERVER_H__}
{$include <gio/giotypes.h>}

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_OBJECT_MANAGER_SERVER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_OBJECT_MANAGER_SERVER_CLASS(klass : longint) : longint;

type
{< private > }
  PGDBusObjectManagerServer = ^TGDBusObjectManagerServer;
  TGDBusObjectManagerServer = record
      parent_instance : TGObject;
      priv : PGDBusObjectManagerServerPrivate;
    end;

{*
 * GDBusObjectManagerServerClass:
 * @parent_class: The parent class.
 *
 * Class structure for #GDBusObjectManagerServer.
 *
 * Since: 2.30
  }
{< private > }
  PGDBusObjectManagerServerClass = ^TGDBusObjectManagerServerClass;
  TGDBusObjectManagerServerClass = record
      parent_class : TGObjectClass;
      padding : array[0..7] of Tgpointer;
    end;


function g_dbus_object_manager_server_get_type:TGType;cdecl;external libgio2;
function g_dbus_object_manager_server_new(object_path:Pgchar):PGDBusObjectManagerServer;cdecl;external libgio2;
function g_dbus_object_manager_server_get_connection(manager:PGDBusObjectManagerServer):PGDBusConnection;cdecl;external libgio2;
procedure g_dbus_object_manager_server_set_connection(manager:PGDBusObjectManagerServer; connection:PGDBusConnection);cdecl;external libgio2;
procedure g_dbus_object_manager_server_export(manager:PGDBusObjectManagerServer; object:PGDBusObjectSkeleton);cdecl;external libgio2;
procedure g_dbus_object_manager_server_export_uniquely(manager:PGDBusObjectManagerServer; object:PGDBusObjectSkeleton);cdecl;external libgio2;
function g_dbus_object_manager_server_is_exported(manager:PGDBusObjectManagerServer; object:PGDBusObjectSkeleton):Tgboolean;cdecl;external libgio2;
function g_dbus_object_manager_server_unexport(manager:PGDBusObjectManagerServer; object_path:Pgchar):Tgboolean;cdecl;external libgio2;
{$endif}
{ __G_DBUS_OBJECT_MANAGER_SERVER_H  }

// === Konventiert am: 26-6-26 16:48:38 ===

function G_TYPE_DBUS_OBJECT_MANAGER_SERVER : TGType;
function G_DBUS_OBJECT_MANAGER_SERVER(obj : Pointer) : PGDBusObjectManagerServer;
function G_DBUS_OBJECT_MANAGER_SERVER_CLASS(klass : Pointer) : PGDBusObjectManagerServerClass;
function G_DBUS_OBJECT_MANAGER_SERVER_GET_CLASS(obj : Pointer) : PGDBusObjectManagerServerClass;

implementation

function G_TYPE_DBUS_OBJECT_MANAGER_SERVER : TGType;
  begin
    G_TYPE_DBUS_OBJECT_MANAGER_SERVER:=g_dbus_object_manager_server_get_type;
  end;

function G_DBUS_OBJECT_MANAGER_SERVER(obj : Pointer) : PGDBusObjectManagerServer;
begin
  Result := PGDBusObjectManagerServer(g_type_check_instance_cast(obj, G_TYPE_DBUS_OBJECT_MANAGER_SERVER));
end;

function G_DBUS_OBJECT_MANAGER_SERVER_CLASS(klass : Pointer) : PGDBusObjectManagerServerClass;
begin
  Result := PGDBusObjectManagerServerClass(g_type_check_class_cast(klass, G_TYPE_DBUS_OBJECT_MANAGER_SERVER));
end;

function G_DBUS_OBJECT_MANAGER_SERVER_GET_CLASS(obj : Pointer) : PGDBusObjectManagerServerClass;
begin
  Result := PGDBusObjectManagerServerClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_OBJECT_MANAGER_SERVER(obj : longint) : longint;
begin
  G_IS_DBUS_OBJECT_MANAGER_SERVER:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_DBUS_OBJECT_MANAGER_SERVER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_OBJECT_MANAGER_SERVER_CLASS(klass : longint) : longint;
begin
  G_IS_DBUS_OBJECT_MANAGER_SERVER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_DBUS_OBJECT_MANAGER_SERVER);
end;


end.
