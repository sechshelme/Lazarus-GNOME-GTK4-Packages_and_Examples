
unit gdbusnameowning;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdbusnameowning.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdbusnameowning.h
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
PGClosure  = ^GClosure;
PGDBusConnection  = ^GDBusConnection;
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
{$ifndef __G_DBUS_NAME_OWNING_H__}
{$define __G_DBUS_NAME_OWNING_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}
{*
 * GBusAcquiredCallback:
 * @connection: the connection to a message bus
 * @name: the name that is requested to be owned
 * @user_data: user data passed to [func@Gio.bus_own_name]
 *
 * Invoked when a connection to a message bus has been obtained.
 *
 * Since: 2.26
  }
(* Const before type ignored *)
type

  TGBusAcquiredCallback = procedure (connection:PGDBusConnection; name:Pgchar; user_data:Tgpointer);cdecl;
{*
 * GBusNameAcquiredCallback:
 * @connection: the connection on which to acquired the name
 * @name: the name being owned
 * @user_data: user data passed to [func@Gio.bus_own_name] or
 *   [func@Gio.bus_own_name_on_connection]
 *
 * Invoked when the name is acquired.
 *
 * Since: 2.26
  }
(* Const before type ignored *)

  TGBusNameAcquiredCallback = procedure (connection:PGDBusConnection; name:Pgchar; user_data:Tgpointer);cdecl;
{*
 * GBusNameLostCallback:
 * @connection: the connect on which to acquire the name or `NULL` if
 *   the connection was disconnected
 * @name: the name being owned
 * @user_data: user data passed to [func@Gio.bus_own_name] or
 *   [func@Gio.bus_own_name_on_connection]
 *
 * Invoked when the name is lost or @connection has been closed.
 *
 * Since: 2.26
  }
(* Const before type ignored *)

  TGBusNameLostCallback = procedure (connection:PGDBusConnection; name:Pgchar; user_data:Tgpointer);cdecl;
(* Const before type ignored *)

function g_bus_own_name(bus_type:TGBusType; name:Pgchar; flags:TGBusNameOwnerFlags; bus_acquired_handler:TGBusAcquiredCallback; name_acquired_handler:TGBusNameAcquiredCallback; 
           name_lost_handler:TGBusNameLostCallback; user_data:Tgpointer; user_data_free_func:TGDestroyNotify):Tguint;cdecl;external;
(* Const before type ignored *)
function g_bus_own_name_on_connection(connection:PGDBusConnection; name:Pgchar; flags:TGBusNameOwnerFlags; name_acquired_handler:TGBusNameAcquiredCallback; name_lost_handler:TGBusNameLostCallback; 
           user_data:Tgpointer; user_data_free_func:TGDestroyNotify):Tguint;cdecl;external;
(* Const before type ignored *)
function g_bus_own_name_with_closures(bus_type:TGBusType; name:Pgchar; flags:TGBusNameOwnerFlags; bus_acquired_closure:PGClosure; name_acquired_closure:PGClosure; 
           name_lost_closure:PGClosure):Tguint;cdecl;external;
(* Const before type ignored *)
function g_bus_own_name_on_connection_with_closures(connection:PGDBusConnection; name:Pgchar; flags:TGBusNameOwnerFlags; name_acquired_closure:PGClosure; name_lost_closure:PGClosure):Tguint;cdecl;external;
procedure g_bus_unown_name(owner_id:Tguint);cdecl;external;
{$endif}
{ __G_DBUS_NAME_OWNING_H__  }

implementation


end.
