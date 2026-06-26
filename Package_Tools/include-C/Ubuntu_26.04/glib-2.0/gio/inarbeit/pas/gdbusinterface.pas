unit gdbusinterface;

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
{$ifndef __G_DBUS_INTERFACE_H__}
{$define __G_DBUS_INTERFACE_H__}
{$include <gio/giotypes.h>}

type
{*
 * GDBusInterfaceIface:
 * @parent_iface: The parent interface.
 * @get_info: Returns a #GDBusInterfaceInfo. See g_dbus_interface_get_info().
 * @get_object: Gets the enclosing #GDBusObject. See g_dbus_interface_get_object().
 * @set_object: Sets the enclosing #GDBusObject. See g_dbus_interface_set_object().
 * @dup_object: Gets a reference to the enclosing #GDBusObject. See g_dbus_interface_dup_object(). Added in 2.32.
 *
 * Base type for D-Bus interfaces.
 *
 * Since: 2.30
  }
{ Virtual Functions  }
  PGDBusInterfaceIface = ^TGDBusInterfaceIface;
  TGDBusInterfaceIface = record
      parent_iface : TGTypeInterface;
      get_info : function (interface_:PGDBusInterface):PGDBusInterfaceInfo;cdecl;
      get_object : function (interface_:PGDBusInterface):PGDBusObject;cdecl;
      set_object : procedure (interface_:PGDBusInterface; object:PGDBusObject);cdecl;
      dup_object : function (interface_:PGDBusInterface):PGDBusObject;cdecl;
    end;


function g_dbus_interface_get_type:TGType;cdecl;external libgio2;
function g_dbus_interface_get_info(interface_:PGDBusInterface):PGDBusInterfaceInfo;cdecl;external libgio2;
function g_dbus_interface_get_object(interface_:PGDBusInterface):PGDBusObject;cdecl;external libgio2;
procedure g_dbus_interface_set_object(interface_:PGDBusInterface; object:PGDBusObject);cdecl;external libgio2;
function g_dbus_interface_dup_object(interface_:PGDBusInterface):PGDBusObject;cdecl;external libgio2;
{$endif}
{ __G_DBUS_INTERFACE_H__  }

// === Konventiert am: 26-6-26 16:43:03 ===

function G_TYPE_DBUS_INTERFACE : TGType;
function G_DBUS_INTERFACE(obj : Pointer) : PGDBusInterface;
function G_IS_DBUS_INTERFACE(obj : Pointer) : Tgboolean;
function G_DBUS_INTERFACE_GET_IFACE(obj : Pointer) : PGDBusInterfaceIface;

implementation

function G_TYPE_DBUS_INTERFACE : TGType;
  begin
    G_TYPE_DBUS_INTERFACE:=g_dbus_interface_get_type;
  end;

function G_DBUS_INTERFACE(obj : Pointer) : PGDBusInterface;
begin
  Result := PGDBusInterface(g_type_check_instance_cast(obj, G_TYPE_DBUS_INTERFACE));
end;

function G_IS_DBUS_INTERFACE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_DBUS_INTERFACE);
end;

function G_DBUS_INTERFACE_GET_IFACE(obj : Pointer) : PGDBusInterfaceIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_DBUS_INTERFACE);
end;



end.
