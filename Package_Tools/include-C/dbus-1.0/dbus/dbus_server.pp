
unit dbus_server;
interface

{
  Automatically converted by H2Pas 1.0.0 from dbus_server.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    dbus_server.h
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
Pchar  = ^char;
Pdbus_int32_t  = ^dbus_int32_t;
PDBusConnection  = ^DBusConnection;
PDBusError  = ^DBusError;
PDBusServer  = ^DBusServer;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-  }
{ dbus-server.h DBusServer object
 *
 * Copyright (C) 2002, 2003  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
  }
{$if !defined (DBUS_INSIDE_DBUS_H) && !defined (DBUS_COMPILATION)}
{$error "Only <dbus/dbus.h> can be included directly, this file may disappear or change contents."}
{$endif}
{$ifndef DBUS_SERVER_H}
{$define DBUS_SERVER_H}
{$include <dbus/dbus-errors.h>}
{$include <dbus/dbus-macros.h>}
{$include <dbus/dbus-message.h>}
{$include <dbus/dbus-connection.h>}
{$include <dbus/dbus-protocol.h>}
{*
 * @addtogroup DBusServer
 * @
  }
type
{* Called when a new connection to the server is available. Must reference and save the new
 * connection, or close the new connection. Set with dbus_server_set_new_connection_function().
  }

  TDBusNewConnectionFunction = procedure (server:PDBusServer; new_connection:PDBusConnection; data:pointer);cdecl;
(* Const before type ignored *)

function dbus_server_listen(address:Pchar; error:PDBusError):PDBusServer;cdecl;external;
function dbus_server_ref(server:PDBusServer):PDBusServer;cdecl;external;
procedure dbus_server_unref(server:PDBusServer);cdecl;external;
procedure dbus_server_disconnect(server:PDBusServer);cdecl;external;
function dbus_server_get_is_connected(server:PDBusServer):Tdbus_bool_t;cdecl;external;
function dbus_server_get_address(server:PDBusServer):Pchar;cdecl;external;
function dbus_server_get_id(server:PDBusServer):Pchar;cdecl;external;
procedure dbus_server_set_new_connection_function(server:PDBusServer; _function:TDBusNewConnectionFunction; data:pointer; free_data_function:TDBusFreeFunction);cdecl;external;
function dbus_server_set_watch_functions(server:PDBusServer; add_function:TDBusAddWatchFunction; remove_function:TDBusRemoveWatchFunction; toggled_function:TDBusWatchToggledFunction; data:pointer; 
           free_data_function:TDBusFreeFunction):Tdbus_bool_t;cdecl;external;
function dbus_server_set_timeout_functions(server:PDBusServer; add_function:TDBusAddTimeoutFunction; remove_function:TDBusRemoveTimeoutFunction; toggled_function:TDBusTimeoutToggledFunction; data:pointer; 
           free_data_function:TDBusFreeFunction):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_server_set_auth_mechanisms(server:PDBusServer; mechanisms:PPchar):Tdbus_bool_t;cdecl;external;
function dbus_server_allocate_data_slot(slot_p:Pdbus_int32_t):Tdbus_bool_t;cdecl;external;
procedure dbus_server_free_data_slot(slot_p:Pdbus_int32_t);cdecl;external;
function dbus_server_set_data(server:PDBusServer; slot:longint; data:pointer; free_data_func:TDBusFreeFunction):Tdbus_bool_t;cdecl;external;
function dbus_server_get_data(server:PDBusServer; slot:longint):pointer;cdecl;external;
{*
 * Clear a variable or struct member that contains a #DBusServer.
 * If it does not contain #NULL, the server that was previously
 * there is unreferenced with dbus_server_unref().
 *
 * This is very similar to dbus_clear_connection(): see that function
 * for more details.
 *
 * @param pointer_to_server A pointer to a variable or struct member.
 * pointer_to_server must not be #NULL, but *pointer_to_server
 * may be #NULL.
  }
{ xxxxxxxxxxxxxxxxxxxxx
static inline void
dbus_clear_server (DBusServer **pointer_to_server)

  _dbus_clear_pointer_impl (DBusServer, pointer_to_server, dbus_server_unref);

 }
{* @  }
{$endif}
{ DBUS_SERVER_H  }

implementation


end.
