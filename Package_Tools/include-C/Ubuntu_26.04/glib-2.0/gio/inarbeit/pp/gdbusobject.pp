
unit gdbusobject;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdbusobject.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdbusobject.h
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
PGDBusObjectIface  = ^GDBusObjectIface;
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
{$ifndef __G_DBUS_OBJECT_H__}
{$define __G_DBUS_OBJECT_H__}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_DBUS_OBJECT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_OBJECT(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_OBJECT(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_OBJECT_GET_IFACE(o : longint) : longint;

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
(* Const before type ignored *)
(* Const before type ignored *)
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


function g_dbus_object_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_dbus_object_get_object_path(object:PGDBusObject):Pgchar;cdecl;external;
function g_dbus_object_get_interfaces(object:PGDBusObject):PGList;cdecl;external;
(* Const before type ignored *)
function g_dbus_object_get_interface(object:PGDBusObject; interface_name:Pgchar):PGDBusInterface;cdecl;external;
{$endif}
{ __G_DBUS_OBJECT_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_DBUS_OBJECT : longint; { return type might be wrong }
  begin
    G_TYPE_DBUS_OBJECT:=g_dbus_object_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_OBJECT(o : longint) : longint;
begin
  G_DBUS_OBJECT:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_DBUS_OBJECT,GDBusObject);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_DBUS_OBJECT(o : longint) : longint;
begin
  G_IS_DBUS_OBJECT:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_DBUS_OBJECT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_DBUS_OBJECT_GET_IFACE(o : longint) : longint;
begin
  G_DBUS_OBJECT_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(o,G_TYPE_DBUS_OBJECT,GDBusObjectIface);
end;


end.
