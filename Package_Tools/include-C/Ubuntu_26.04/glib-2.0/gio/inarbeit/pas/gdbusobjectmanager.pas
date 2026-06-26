unit gdbusobjectmanager;

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
{$ifndef __G_DBUS_OBJECT_MANAGER_H__}
{$define __G_DBUS_OBJECT_MANAGER_H__}
{$include <gio/giotypes.h>}

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


function g_dbus_object_manager_get_type:TGType;cdecl;external libgio2;
function g_dbus_object_manager_get_object_path(manager:PGDBusObjectManager):Pgchar;cdecl;external libgio2;
function g_dbus_object_manager_get_objects(manager:PGDBusObjectManager):PGList;cdecl;external libgio2;
function g_dbus_object_manager_get_object(manager:PGDBusObjectManager; object_path:Pgchar):PGDBusObject;cdecl;external libgio2;
function g_dbus_object_manager_get_interface(manager:PGDBusObjectManager; object_path:Pgchar; interface_name:Pgchar):PGDBusInterface;cdecl;external libgio2;
{$endif}
{ __G_DBUS_OBJECT_MANAGER_H__  }

// === Konventiert am: 26-6-26 16:49:03 ===

function G_TYPE_DBUS_OBJECT_MANAGER : TGType;
function G_DBUS_OBJECT_MANAGER(obj : Pointer) : PGDBusObjectManager;
function G_IS_DBUS_OBJECT_MANAGER(obj : Pointer) : Tgboolean;
function G_DBUS_OBJECT_MANAGER_GET_IFACE(obj : Pointer) : PGDBusObjectManagerIface;

implementation

function G_TYPE_DBUS_OBJECT_MANAGER : TGType;
  begin
    G_TYPE_DBUS_OBJECT_MANAGER:=g_dbus_object_manager_get_type;
  end;

function G_DBUS_OBJECT_MANAGER(obj : Pointer) : PGDBusObjectManager;
begin
  Result := PGDBusObjectManager(g_type_check_instance_cast(obj, G_TYPE_DBUS_OBJECT_MANAGER));
end;

function G_IS_DBUS_OBJECT_MANAGER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_DBUS_OBJECT_MANAGER);
end;

function G_DBUS_OBJECT_MANAGER_GET_IFACE(obj : Pointer) : PGDBusObjectManagerIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_DBUS_OBJECT_MANAGER);
end;



end.
