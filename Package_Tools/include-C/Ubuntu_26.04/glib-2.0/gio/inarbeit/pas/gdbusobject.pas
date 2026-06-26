unit gdbusobject;

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
{$ifndef __G_DBUS_OBJECT_H__}
{$define __G_DBUS_OBJECT_H__}
{$include <gio/giotypes.h>}

type
{*
 * GDBusObjectIface:
 * @parent_iface: The parent interface.
 * @get_object_path: Returns the object path. See g_dbus_object_get_object_path().
 * @get_interfaces: Returns all interfaces. See g_dbus_object_get_interfaces().
 * @get_interface: Returns an interface by name. See g_dbus_object_get_interface().
 * @interface_added: Signal handler for the #GDBusObject::interface-added signal.
 * @interface_removed: Signal handler for the #GDBusObject::interface-removed signal.
 *
 * Base object type for D-Bus objects.
 *
 * Since: 2.30
  }
{ Virtual Functions  }
{ Signals  }
  PGDBusObjectIface = ^TGDBusObjectIface;
  TGDBusObjectIface = record
      parent_iface : TGTypeInterface;
      get_object_path : function (object:PGDBusObject):Pgchar;cdecl;
      get_interfaces : function (object:PGDBusObject):PGList;cdecl;
      get_interface : function (object:PGDBusObject; interface_name:Pgchar):PGDBusInterface;cdecl;
      interface_added : procedure (object:PGDBusObject; interface_:PGDBusInterface);cdecl;
      interface_removed : procedure (object:PGDBusObject; interface_:PGDBusInterface);cdecl;
    end;


function g_dbus_object_get_type:TGType;cdecl;external libgio2;
function g_dbus_object_get_object_path(object:PGDBusObject):Pgchar;cdecl;external libgio2;
function g_dbus_object_get_interfaces(object:PGDBusObject):PGList;cdecl;external libgio2;
function g_dbus_object_get_interface(object:PGDBusObject; interface_name:Pgchar):PGDBusInterface;cdecl;external libgio2;
{$endif}
{ __G_DBUS_OBJECT_H__  }

// === Konventiert am: 26-6-26 16:49:08 ===

function G_TYPE_DBUS_OBJECT : TGType;
function G_DBUS_OBJECT(obj : Pointer) : PGDBusObject;
function G_IS_DBUS_OBJECT(obj : Pointer) : Tgboolean;
function G_DBUS_OBJECT_GET_IFACE(obj : Pointer) : PGDBusObjectIface;

implementation

function G_TYPE_DBUS_OBJECT : TGType;
  begin
    G_TYPE_DBUS_OBJECT:=g_dbus_object_get_type;
  end;

function G_DBUS_OBJECT(obj : Pointer) : PGDBusObject;
begin
  Result := PGDBusObject(g_type_check_instance_cast(obj, G_TYPE_DBUS_OBJECT));
end;

function G_IS_DBUS_OBJECT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_DBUS_OBJECT);
end;

function G_DBUS_OBJECT_GET_IFACE(obj : Pointer) : PGDBusObjectIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_DBUS_OBJECT);
end;



end.
