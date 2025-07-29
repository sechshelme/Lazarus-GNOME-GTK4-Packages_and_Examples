
unit dbus_connection;
interface

{
  Automatically converted by H2Pas 1.0.0 from dbus_connection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    dbus_connection.h
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
Pdbus_uint32_t  = ^dbus_uint32_t;
PDBusConnection  = ^DBusConnection;
PDBusDispatchStatus  = ^DBusDispatchStatus;
PDBusError  = ^DBusError;
PDBusMessage  = ^DBusMessage;
PDBusObjectPathVTable  = ^DBusObjectPathVTable;
PDBusPendingCall  = ^DBusPendingCall;
PDBusPreallocatedSend  = ^DBusPreallocatedSend;
PDBusTimeout  = ^DBusTimeout;
PDBusWatch  = ^DBusWatch;
PDBusWatchFlags  = ^DBusWatchFlags;
Pdword  = ^dword;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-  }
{ dbus-connection.h DBusConnection object
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
{$ifndef DBUS_CONNECTION_H}
{$define DBUS_CONNECTION_H}
{$include <dbus/dbus-errors.h>}
{$include <dbus/dbus-macros.h>}
{$include <dbus/dbus-memory.h>}
{$include <dbus/dbus-message.h>}
{$include <dbus/dbus-shared.h>}
{*
 * @addtogroup DBusConnection
 * @
  }
{ documented in dbus-watch.c  }
type
{ documented in dbus-timeout.c  }
{* Opaque type representing preallocated resources so a message can be sent without further memory allocation.  }
{* Opaque type representing a method call that has not yet received a reply.  }
{* Opaque type representing a connection to a remote application and associated incoming/outgoing message queues.  }
{* Set of functions that must be implemented to handle messages sent to a particular object path.  }
{*
 * Indicates the status of a #DBusWatch.
  }
{*< As in POLLIN  }
{*< As in POLLOUT  }
{*< As in POLLERR (can't watch for
                                 *   this, but can be present in
                                 *   current state passed to
                                 *   dbus_watch_handle()).
                                  }
{*< As in POLLHUP (can't watch for
                                 *   it, but can be present in current
                                 *   state passed to
                                 *   dbus_watch_handle()).
                                  }
{ Internal to libdbus, there is also _DBUS_WATCH_NVAL in dbus-watch.h  }

  PDBusWatchFlags = ^TDBusWatchFlags;
  TDBusWatchFlags =  Longint;
  Const
    DBUS_WATCH_READABLE = 1 shl 0;
    DBUS_WATCH_WRITABLE = 1 shl 1;
    DBUS_WATCH_ERROR = 1 shl 2;
    DBUS_WATCH_HANGUP = 1 shl 3;
;
{*
 * Indicates the status of incoming data on a #DBusConnection. This determines whether
 * dbus_connection_dispatch() needs to be called.
  }
{*< There is more data to potentially convert to messages.  }
{*< All currently available data has been processed.  }
{*< More memory is needed to continue.  }
type
  PDBusDispatchStatus = ^TDBusDispatchStatus;
  TDBusDispatchStatus =  Longint;
  Const
    DBUS_DISPATCH_DATA_REMAINS = 0;
    DBUS_DISPATCH_COMPLETE = 1;
    DBUS_DISPATCH_NEED_MEMORY = 2;
;
{* Called when libdbus needs a new watch to be monitored by the main
 * loop. Returns #FALSE if it lacks enough memory to add the
 * watch. Set by dbus_connection_set_watch_functions() or
 * dbus_server_set_watch_functions().
  }
type

  TDBusAddWatchFunction = function (watch:PDBusWatch; data:pointer):Tdbus_bool_t;cdecl;
{* Called when dbus_watch_get_enabled() may return a different value
 *  than it did before.  Set by dbus_connection_set_watch_functions()
 *  or dbus_server_set_watch_functions().
  }

  TDBusWatchToggledFunction = procedure (watch:PDBusWatch; data:pointer);cdecl;
{* Called when libdbus no longer needs a watch to be monitored by the
 * main loop. Set by dbus_connection_set_watch_functions() or
 * dbus_server_set_watch_functions().
  }

  TDBusRemoveWatchFunction = procedure (watch:PDBusWatch; data:pointer);cdecl;
{* Called when libdbus needs a new timeout to be monitored by the main
 * loop. Returns #FALSE if it lacks enough memory to add the
 * watch. Set by dbus_connection_set_timeout_functions() or
 * dbus_server_set_timeout_functions().
  }

  TDBusAddTimeoutFunction = function (timeout:PDBusTimeout; data:pointer):Tdbus_bool_t;cdecl;
{* Called when dbus_timeout_get_enabled() may return a different
 * value than it did before.
 * Set by dbus_connection_set_timeout_functions() or
 * dbus_server_set_timeout_functions().
  }

  TDBusTimeoutToggledFunction = procedure (timeout:PDBusTimeout; data:pointer);cdecl;
{* Called when libdbus no longer needs a timeout to be monitored by the
 * main loop. Set by dbus_connection_set_timeout_functions() or
 * dbus_server_set_timeout_functions().
  }

  TDBusRemoveTimeoutFunction = procedure (timeout:PDBusTimeout; data:pointer);cdecl;
{* Called when the return value of dbus_connection_get_dispatch_status()
 * may have changed. Set with dbus_connection_set_dispatch_status_function().
  }

  TDBusDispatchStatusFunction = procedure (connection:PDBusConnection; new_status:TDBusDispatchStatus; data:pointer);cdecl;
{*
 * Called when the main loop's thread should be notified that there's now work
 * to do. Set with dbus_connection_set_wakeup_main_function().
  }

  TDBusWakeupMainFunction = procedure (data:pointer);cdecl;
{*
 * Called during authentication to check whether the given UNIX user
 * ID is allowed to connect, if the client tried to auth as a UNIX
 * user ID. Normally on Windows this would never happen. Set with
 * dbus_connection_set_unix_user_function().
  }
  TDBusAllowUnixUserFunction = function (connection:PDBusConnection; uid:dword; data:pointer):Tdbus_bool_t;cdecl;
{*
 * Called during authentication to check whether the given Windows user
 * ID is allowed to connect, if the client tried to auth as a Windows
 * user ID. Normally on UNIX this would never happen. Set with
 * dbus_connection_set_windows_user_function().
  }(* Const before type ignored *)

  TDBusAllowWindowsUserFunction = function (connection:PDBusConnection; user_sid:Pchar; data:pointer):Tdbus_bool_t;cdecl;
{*
 * Called when a pending call now has a reply available. Set with
 * dbus_pending_call_set_notify().
  }

  TDBusPendingCallNotifyFunction = procedure (pending:PDBusPendingCall; user_data:pointer);cdecl;
{*
 * Called when a message needs to be handled. The result indicates whether or
 * not more handlers should be run. Set with dbus_connection_add_filter().
  }

  TDBusHandleMessageFunction = function (connection:PDBusConnection; message:PDBusMessage; user_data:pointer):TDBusHandlerResult;cdecl;
(* Const before type ignored *)

function dbus_connection_open(address:Pchar; error:PDBusError):PDBusConnection;cdecl;external;
(* Const before type ignored *)
function dbus_connection_open_private(address:Pchar; error:PDBusError):PDBusConnection;cdecl;external;
function dbus_connection_ref(connection:PDBusConnection):PDBusConnection;cdecl;external;
procedure dbus_connection_unref(connection:PDBusConnection);cdecl;external;
procedure dbus_connection_close(connection:PDBusConnection);cdecl;external;
function dbus_connection_get_is_connected(connection:PDBusConnection):Tdbus_bool_t;cdecl;external;
function dbus_connection_get_is_authenticated(connection:PDBusConnection):Tdbus_bool_t;cdecl;external;
function dbus_connection_get_is_anonymous(connection:PDBusConnection):Tdbus_bool_t;cdecl;external;
function dbus_connection_get_server_id(connection:PDBusConnection):Pchar;cdecl;external;
function dbus_connection_can_send_type(connection:PDBusConnection; _type:longint):Tdbus_bool_t;cdecl;external;
procedure dbus_connection_set_exit_on_disconnect(connection:PDBusConnection; exit_on_disconnect:Tdbus_bool_t);cdecl;external;
procedure dbus_connection_flush(connection:PDBusConnection);cdecl;external;
function dbus_connection_read_write_dispatch(connection:PDBusConnection; timeout_milliseconds:longint):Tdbus_bool_t;cdecl;external;
function dbus_connection_read_write(connection:PDBusConnection; timeout_milliseconds:longint):Tdbus_bool_t;cdecl;external;
function dbus_connection_borrow_message(connection:PDBusConnection):PDBusMessage;cdecl;external;
procedure dbus_connection_return_message(connection:PDBusConnection; message:PDBusMessage);cdecl;external;
procedure dbus_connection_steal_borrowed_message(connection:PDBusConnection; message:PDBusMessage);cdecl;external;
function dbus_connection_pop_message(connection:PDBusConnection):PDBusMessage;cdecl;external;
function dbus_connection_get_dispatch_status(connection:PDBusConnection):TDBusDispatchStatus;cdecl;external;
function dbus_connection_dispatch(connection:PDBusConnection):TDBusDispatchStatus;cdecl;external;
function dbus_connection_has_messages_to_send(connection:PDBusConnection):Tdbus_bool_t;cdecl;external;
function dbus_connection_send(connection:PDBusConnection; message:PDBusMessage; client_serial:Pdbus_uint32_t):Tdbus_bool_t;cdecl;external;
function dbus_connection_send_with_reply(connection:PDBusConnection; message:PDBusMessage; pending_return:PPDBusPendingCall; timeout_milliseconds:longint):Tdbus_bool_t;cdecl;external;
function dbus_connection_send_with_reply_and_block(connection:PDBusConnection; message:PDBusMessage; timeout_milliseconds:longint; error:PDBusError):PDBusMessage;cdecl;external;
function dbus_connection_set_watch_functions(connection:PDBusConnection; add_function:TDBusAddWatchFunction; remove_function:TDBusRemoveWatchFunction; toggled_function:TDBusWatchToggledFunction; data:pointer; 
           free_data_function:TDBusFreeFunction):Tdbus_bool_t;cdecl;external;
function dbus_connection_set_timeout_functions(connection:PDBusConnection; add_function:TDBusAddTimeoutFunction; remove_function:TDBusRemoveTimeoutFunction; toggled_function:TDBusTimeoutToggledFunction; data:pointer; 
           free_data_function:TDBusFreeFunction):Tdbus_bool_t;cdecl;external;
procedure dbus_connection_set_wakeup_main_function(connection:PDBusConnection; wakeup_main_function:TDBusWakeupMainFunction; data:pointer; free_data_function:TDBusFreeFunction);cdecl;external;
procedure dbus_connection_set_dispatch_status_function(connection:PDBusConnection; _function:TDBusDispatchStatusFunction; data:pointer; free_data_function:TDBusFreeFunction);cdecl;external;
function dbus_connection_get_unix_user(connection:PDBusConnection; uid:Pdword):Tdbus_bool_t;cdecl;external;
function dbus_connection_get_unix_process_id(connection:PDBusConnection; pid:Pdword):Tdbus_bool_t;cdecl;external;
function dbus_connection_get_adt_audit_session_data(connection:PDBusConnection; data:Ppointer; data_size:Pdbus_int32_t):Tdbus_bool_t;cdecl;external;
procedure dbus_connection_set_unix_user_function(connection:PDBusConnection; _function:TDBusAllowUnixUserFunction; data:pointer; free_data_function:TDBusFreeFunction);cdecl;external;
function dbus_connection_get_windows_user(connection:PDBusConnection; windows_sid_p:PPchar):Tdbus_bool_t;cdecl;external;
procedure dbus_connection_set_windows_user_function(connection:PDBusConnection; _function:TDBusAllowWindowsUserFunction; data:pointer; free_data_function:TDBusFreeFunction);cdecl;external;
procedure dbus_connection_set_allow_anonymous(connection:PDBusConnection; value:Tdbus_bool_t);cdecl;external;
procedure dbus_connection_set_route_peer_messages(connection:PDBusConnection; value:Tdbus_bool_t);cdecl;external;
{ Filters  }
function dbus_connection_add_filter(connection:PDBusConnection; _function:TDBusHandleMessageFunction; user_data:pointer; free_data_function:TDBusFreeFunction):Tdbus_bool_t;cdecl;external;
procedure dbus_connection_remove_filter(connection:PDBusConnection; _function:TDBusHandleMessageFunction; user_data:pointer);cdecl;external;
{ Other  }
function dbus_connection_allocate_data_slot(slot_p:Pdbus_int32_t):Tdbus_bool_t;cdecl;external;
procedure dbus_connection_free_data_slot(slot_p:Pdbus_int32_t);cdecl;external;
function dbus_connection_set_data(connection:PDBusConnection; slot:Tdbus_int32_t; data:pointer; free_data_func:TDBusFreeFunction):Tdbus_bool_t;cdecl;external;
function dbus_connection_get_data(connection:PDBusConnection; slot:Tdbus_int32_t):pointer;cdecl;external;
procedure dbus_connection_set_change_sigpipe(will_modify_sigpipe:Tdbus_bool_t);cdecl;external;
procedure dbus_connection_set_max_message_size(connection:PDBusConnection; size:longint);cdecl;external;
function dbus_connection_get_max_message_size(connection:PDBusConnection):longint;cdecl;external;
procedure dbus_connection_set_max_received_size(connection:PDBusConnection; size:longint);cdecl;external;
function dbus_connection_get_max_received_size(connection:PDBusConnection):longint;cdecl;external;
procedure dbus_connection_set_max_message_unix_fds(connection:PDBusConnection; n:longint);cdecl;external;
function dbus_connection_get_max_message_unix_fds(connection:PDBusConnection):longint;cdecl;external;
procedure dbus_connection_set_max_received_unix_fds(connection:PDBusConnection; n:longint);cdecl;external;
function dbus_connection_get_max_received_unix_fds(connection:PDBusConnection):longint;cdecl;external;
function dbus_connection_get_outgoing_size(connection:PDBusConnection):longint;cdecl;external;
function dbus_connection_get_outgoing_unix_fds(connection:PDBusConnection):longint;cdecl;external;
function dbus_connection_preallocate_send(connection:PDBusConnection):PDBusPreallocatedSend;cdecl;external;
procedure dbus_connection_free_preallocated_send(connection:PDBusConnection; preallocated:PDBusPreallocatedSend);cdecl;external;
procedure dbus_connection_send_preallocated(connection:PDBusConnection; preallocated:PDBusPreallocatedSend; message:PDBusMessage; client_serial:Pdbus_uint32_t);cdecl;external;
{ Object tree functionality  }
{*
 * Called when a #DBusObjectPathVTable is unregistered (or its connection is freed).
 * Found in #DBusObjectPathVTable.
  }
type

  TDBusObjectPathUnregisterFunction = procedure (connection:PDBusConnection; user_data:pointer);cdecl;
{*
 * Called when a message is sent to a registered object path. Found in
 * #DBusObjectPathVTable which is registered with dbus_connection_register_object_path()
 * or dbus_connection_register_fallback().
  }

  TDBusObjectPathMessageFunction = function (connection:PDBusConnection; message:PDBusMessage; user_data:pointer):TDBusHandlerResult;cdecl;
{*
 * Virtual table that must be implemented to handle a portion of the
 * object path hierarchy. Attach the vtable to a particular path using
 * dbus_connection_register_object_path() or
 * dbus_connection_register_fallback().
  }
{*< Function to unregister this handler  }
{*< Function to handle messages  }
{*< Reserved for future expansion  }
{*< Reserved for future expansion  }
{*< Reserved for future expansion  }
{*< Reserved for future expansion  }
  PDBusObjectPathVTable = ^TDBusObjectPathVTable;
  TDBusObjectPathVTable = record
      unregister_function : TDBusObjectPathUnregisterFunction;cdecl;
      message_function : TDBusObjectPathMessageFunction;
      dbus_internal_pad1 : procedure (para1:pointer);cdecl;
      dbus_internal_pad2 : procedure (para1:pointer);cdecl;
      dbus_internal_pad3 : procedure (para1:pointer);cdecl;
      dbus_internal_pad4 : procedure (para1:pointer);cdecl;
    end;

(* Const before type ignored *)
(* Const before type ignored *)

function dbus_connection_try_register_object_path(connection:PDBusConnection; path:Pchar; vtable:PDBusObjectPathVTable; user_data:pointer; error:PDBusError):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function dbus_connection_register_object_path(connection:PDBusConnection; path:Pchar; vtable:PDBusObjectPathVTable; user_data:pointer):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function dbus_connection_try_register_fallback(connection:PDBusConnection; path:Pchar; vtable:PDBusObjectPathVTable; user_data:pointer; error:PDBusError):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function dbus_connection_register_fallback(connection:PDBusConnection; path:Pchar; vtable:PDBusObjectPathVTable; user_data:pointer):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_connection_unregister_object_path(connection:PDBusConnection; path:Pchar):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_connection_get_object_path_data(connection:PDBusConnection; path:Pchar; data_p:Ppointer):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_connection_list_registered(connection:PDBusConnection; parent_path:Pchar; child_entries:PPPchar):Tdbus_bool_t;cdecl;external;
function dbus_connection_get_unix_fd(connection:PDBusConnection; fd:Plongint):Tdbus_bool_t;cdecl;external;
function dbus_connection_get_socket(connection:PDBusConnection; fd:Plongint):Tdbus_bool_t;cdecl;external;
{*
 * Clear a variable or struct member that contains a #DBusConnection.
 * If it does not contain #NULL, the connection that was previously
 * there is unreferenced with dbus_connection_unref().
 *
 * For example, this function and the similar functions for
 * other reference-counted types can be used in code like this:
 *
 * @code
 * DBusConnection *conn = NULL;
 * struct  ...; DBusMessage *m; ...  *larger_structure = ...;
 *
 * ... code that might set conn or m to be non-NULL ...
 *
 * dbus_clear_connection (&conn);
 * dbus_clear_message (&larger_structure->m);
 * @endcode
 *
 * @param pointer_to_connection A pointer to a variable or struct member.
 * pointer_to_connection must not be #NULL, but *pointer_to_connection
 * may be #NULL.
  }
{ xxxxxxxxxxxxxxxxxxxxxxxxxx
static inline void
dbus_clear_connection (DBusConnection **pointer_to_connection)

  _dbus_clear_pointer_impl (DBusConnection, pointer_to_connection,
                            dbus_connection_unref);

 }
{* @  }
{*
 * @addtogroup DBusWatch
 * @
  }
{$ifndef DBUS_DISABLE_DEPRECATED}
{DBUS_DEPRECATED }
function dbus_watch_get_fd(watch:PDBusWatch):longint;cdecl;external;
{$endif}

function dbus_watch_get_unix_fd(watch:PDBusWatch):longint;cdecl;external;
function dbus_watch_get_socket(watch:PDBusWatch):longint;cdecl;external;
function dbus_watch_get_flags(watch:PDBusWatch):dword;cdecl;external;
function dbus_watch_get_data(watch:PDBusWatch):pointer;cdecl;external;
procedure dbus_watch_set_data(watch:PDBusWatch; data:pointer; free_data_function:TDBusFreeFunction);cdecl;external;
function dbus_watch_handle(watch:PDBusWatch; flags:dword):Tdbus_bool_t;cdecl;external;
function dbus_watch_get_enabled(watch:PDBusWatch):Tdbus_bool_t;cdecl;external;
{* @  }
{*
 * @addtogroup DBusTimeout
 * @
  }
function dbus_timeout_get_interval(timeout:PDBusTimeout):longint;cdecl;external;
function dbus_timeout_get_data(timeout:PDBusTimeout):pointer;cdecl;external;
procedure dbus_timeout_set_data(timeout:PDBusTimeout; data:pointer; free_data_function:TDBusFreeFunction);cdecl;external;
function dbus_timeout_handle(timeout:PDBusTimeout):Tdbus_bool_t;cdecl;external;
function dbus_timeout_get_enabled(timeout:PDBusTimeout):Tdbus_bool_t;cdecl;external;
{* @  }
{$endif}
{ DBUS_CONNECTION_H  }

implementation


end.
