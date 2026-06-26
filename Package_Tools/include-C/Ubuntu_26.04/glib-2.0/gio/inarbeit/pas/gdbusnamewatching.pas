unit gdbusnamewatching;

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
{$ifndef __G_DBUS_NAME_WATCHING_H__}
{$define __G_DBUS_NAME_WATCHING_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}
{*
 * GBusNameAppearedCallback:
 * @connection: The #GDBusConnection the name is being watched on.
 * @name: The name being watched.
 * @name_owner: Unique name of the owner of the name being watched.
 * @user_data: User data passed to g_bus_watch_name().
 *
 * Invoked when the name being watched is known to have to have an owner.
 *
 * Since: 2.26
  }
type

  TGBusNameAppearedCallback = procedure (connection:PGDBusConnection; name:Pgchar; name_owner:Pgchar; user_data:Tgpointer);cdecl;
{*
 * GBusNameVanishedCallback:
 * @connection: The #GDBusConnection the name is being watched on, or
 *     %NULL.
 * @name: The name being watched.
 * @user_data: User data passed to g_bus_watch_name().
 *
 * Invoked when the name being watched is known not to have to have an owner.
 *
 * This is also invoked when the #GDBusConnection on which the watch was
 * established has been closed.  In that case, @connection will be
 * %NULL.
 *
 * Since: 2.26
  }

  TGBusNameVanishedCallback = procedure (connection:PGDBusConnection; name:Pgchar; user_data:Tgpointer);cdecl;

function g_bus_watch_name(bus_type:TGBusType; name:Pgchar; flags:TGBusNameWatcherFlags; name_appeared_handler:TGBusNameAppearedCallback; name_vanished_handler:TGBusNameVanishedCallback; 
           user_data:Tgpointer; user_data_free_func:TGDestroyNotify):Tguint;cdecl;external libgio2;
function g_bus_watch_name_on_connection(connection:PGDBusConnection; name:Pgchar; flags:TGBusNameWatcherFlags; name_appeared_handler:TGBusNameAppearedCallback; name_vanished_handler:TGBusNameVanishedCallback; 
           user_data:Tgpointer; user_data_free_func:TGDestroyNotify):Tguint;cdecl;external libgio2;
function g_bus_watch_name_with_closures(bus_type:TGBusType; name:Pgchar; flags:TGBusNameWatcherFlags; name_appeared_closure:PGClosure; name_vanished_closure:PGClosure):Tguint;cdecl;external libgio2;
function g_bus_watch_name_on_connection_with_closures(connection:PGDBusConnection; name:Pgchar; flags:TGBusNameWatcherFlags; name_appeared_closure:PGClosure; name_vanished_closure:PGClosure):Tguint;cdecl;external libgio2;
procedure g_bus_unwatch_name(watcher_id:Tguint);cdecl;external libgio2;
{$endif}
{ __G_DBUS_NAME_WATCHING_H__  }

// === Konventiert am: 26-6-26 16:49:16 ===


implementation



end.
