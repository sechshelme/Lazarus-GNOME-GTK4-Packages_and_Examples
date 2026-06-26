
unit gdbusinterface;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdbusinterface.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdbusinterface.h
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
PGDBusInterface  = ^GDBusInterface;
PGDBusInterfaceIface  = ^GDBusInterfaceIface;
PGDBusInterfaceInfo  = ^GDBusInterfaceInfo;
PGDBusObject  = ^GDBusObject;
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

{ was #define dname def_expr }
function G_TYPE_DBUS_INTERFACE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_INTERFACE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_INTERFACE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_INTERFACE_GET_IFACE(o : longint) : longint;

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


function g_dbus_interface_get_type:TGType;cdecl;external;
function g_dbus_interface_get_info(interface_:PGDBusInterface):PGDBusInterfaceInfo;cdecl;external;
function g_dbus_interface_get_object(interface_:PGDBusInterface):PGDBusObject;cdecl;external;
procedure g_dbus_interface_set_object(interface_:PGDBusInterface; object:PGDBusObject);cdecl;external;
function g_dbus_interface_dup_object(interface_:PGDBusInterface):PGDBusObject;cdecl;external;
{$endif}
{ __G_DBUS_INTERFACE_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_DBUS_INTERFACE : longint; { return type might be wrong }
  begin
    G_TYPE_DBUS_INTERFACE:=g_dbus_interface_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_INTERFACE(o : longint) : longint;
begin
  G_DBUS_INTERFACE:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_DBUS_INTERFACE,GDBusInterface);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_INTERFACE(o : longint) : longint;
begin
  G_IS_DBUS_INTERFACE:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_DBUS_INTERFACE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_INTERFACE_GET_IFACE(o : longint) : longint;
begin
  G_DBUS_INTERFACE_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(o,G_TYPE_DBUS_INTERFACE,GDBusInterfaceIface);
end;


end.
