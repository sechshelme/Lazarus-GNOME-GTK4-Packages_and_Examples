
unit gdbusobjectmanager;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdbusobjectmanager.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdbusobjectmanager.h
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
Pgchar  = ^gchar;
PGDBusInterface  = ^GDBusInterface;
PGDBusObject  = ^GDBusObject;
PGDBusObjectManager  = ^GDBusObjectManager;
PGDBusObjectManagerIface  = ^GDBusObjectManagerIface;
PGList  = ^GList;
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
{$ifndef __G_DBUS_OBJECT_MANAGER_H__}
{$define __G_DBUS_OBJECT_MANAGER_H__}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_DBUS_OBJECT_MANAGER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_OBJECT_MANAGER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_OBJECT_MANAGER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_OBJECT_MANAGER_GET_IFACE(o : longint) : longint;

type
{*
 * GDBusObjectManagerIface:
 * @parent_iface: The parent interface.
 * @get_object_path: Virtual function for g_dbus_object_manager_get_object_path().
 * @get_objects: Virtual function for g_dbus_object_manager_get_objects().
 * @get_object: Virtual function for g_dbus_object_manager_get_object().
 * @get_interface: Virtual function for g_dbus_object_manager_get_interface().
 * @object_added: Signal handler for the #GDBusObjectManager::object-added signal.
 * @object_removed: Signal handler for the #GDBusObjectManager::object-removed signal.
 * @interface_added: Signal handler for the #GDBusObjectManager::interface-added signal.
 * @interface_removed: Signal handler for the #GDBusObjectManager::interface-removed signal.
 *
 * Base type for D-Bus object managers.
 *
 * Since: 2.30
  }
{ Virtual Functions  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ Signals  }
  PGDBusObjectManagerIface = ^TGDBusObjectManagerIface;
  TGDBusObjectManagerIface = record
      parent_iface : TGTypeInterface;
      get_object_path : function (manager:PGDBusObjectManager):Pgchar;cdecl;
      get_objects : function (manager:PGDBusObjectManager):PGList;cdecl;
      get_object : function (manager:PGDBusObjectManager; object_path:Pgchar):PGDBusObject;cdecl;
      get_interface : function (manager:PGDBusObjectManager; object_path:Pgchar; interface_name:Pgchar):PGDBusInterface;cdecl;
      object_added : procedure (manager:PGDBusObjectManager; object:PGDBusObject);cdecl;
      object_removed : procedure (manager:PGDBusObjectManager; object:PGDBusObject);cdecl;
      interface_added : procedure (manager:PGDBusObjectManager; object:PGDBusObject; interface_:PGDBusInterface);cdecl;
      interface_removed : procedure (manager:PGDBusObjectManager; object:PGDBusObject; interface_:PGDBusInterface);cdecl;
    end;


function g_dbus_object_manager_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_dbus_object_manager_get_object_path(manager:PGDBusObjectManager):Pgchar;cdecl;external;
function g_dbus_object_manager_get_objects(manager:PGDBusObjectManager):PGList;cdecl;external;
(* Const before type ignored *)
function g_dbus_object_manager_get_object(manager:PGDBusObjectManager; object_path:Pgchar):PGDBusObject;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_dbus_object_manager_get_interface(manager:PGDBusObjectManager; object_path:Pgchar; interface_name:Pgchar):PGDBusInterface;cdecl;external;
{$endif}
{ __G_DBUS_OBJECT_MANAGER_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_DBUS_OBJECT_MANAGER : longint; { return type might be wrong }
  begin
    G_TYPE_DBUS_OBJECT_MANAGER:=g_dbus_object_manager_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_OBJECT_MANAGER(o : longint) : longint;
begin
  G_DBUS_OBJECT_MANAGER:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_DBUS_OBJECT_MANAGER,GDBusObjectManager);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_OBJECT_MANAGER(o : longint) : longint;
begin
  G_IS_DBUS_OBJECT_MANAGER:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_DBUS_OBJECT_MANAGER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_OBJECT_MANAGER_GET_IFACE(o : longint) : longint;
begin
  G_DBUS_OBJECT_MANAGER_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(o,G_TYPE_DBUS_OBJECT_MANAGER,GDBusObjectManagerIface);
end;


end.
