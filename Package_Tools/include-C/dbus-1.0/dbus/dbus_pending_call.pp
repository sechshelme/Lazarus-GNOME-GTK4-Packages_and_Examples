
unit dbus_pending_call;
interface

{
  Automatically converted by H2Pas 1.0.0 from dbus_pending_call.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    dbus_pending_call.h
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
Pdbus_int32_t  = ^dbus_int32_t;
PDBusMessage  = ^DBusMessage;
PDBusPendingCall  = ^DBusPendingCall;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-  }
{ dbus-pending-call.h Object representing a call in progress.
 *
 * Copyright (C) 2002, 2003 Red Hat Inc.
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
{$ifndef DBUS_PENDING_CALL_H}
{$define DBUS_PENDING_CALL_H}
{$include <dbus/dbus-macros.h>}
{$include <dbus/dbus-types.h>}
{$include <dbus/dbus-connection.h>}
{*
 * @addtogroup DBusPendingCall
 * @
  }

{ was #define dname def_expr }
function DBUS_TIMEOUT_INFINITE : longint;  

const
  DBUS_TIMEOUT_USE_DEFAULT = -(1);  

function dbus_pending_call_ref(pending:PDBusPendingCall):PDBusPendingCall;cdecl;external;
procedure dbus_pending_call_unref(pending:PDBusPendingCall);cdecl;external;
function dbus_pending_call_set_notify(pending:PDBusPendingCall; _function:TDBusPendingCallNotifyFunction; user_data:pointer; free_user_data:TDBusFreeFunction):Tdbus_bool_t;cdecl;external;
procedure dbus_pending_call_cancel(pending:PDBusPendingCall);cdecl;external;
function dbus_pending_call_get_completed(pending:PDBusPendingCall):Tdbus_bool_t;cdecl;external;
function dbus_pending_call_steal_reply(pending:PDBusPendingCall):PDBusMessage;cdecl;external;
procedure dbus_pending_call_block(pending:PDBusPendingCall);cdecl;external;
function dbus_pending_call_allocate_data_slot(slot_p:Pdbus_int32_t):Tdbus_bool_t;cdecl;external;
procedure dbus_pending_call_free_data_slot(slot_p:Pdbus_int32_t);cdecl;external;
function dbus_pending_call_set_data(pending:PDBusPendingCall; slot:Tdbus_int32_t; data:pointer; free_data_func:TDBusFreeFunction):Tdbus_bool_t;cdecl;external;
function dbus_pending_call_get_data(pending:PDBusPendingCall; slot:Tdbus_int32_t):pointer;cdecl;external;
{*
 * Clear a variable or struct member that contains a #DBusPendingCall.
 * If it does not contain #NULL, the pending call that was previously
 * there is unreferenced with dbus_pending_call_unref().
 *
 * This is very similar to dbus_clear_connection(): see that function
 * for more details.
 *
 * @param pointer_to_pending_call A pointer to a variable or struct member.
 * pointer_to_pending_call must not be #NULL, but *pointer_to_pending_call
 * may be #NULL.
  }
{ xxxxxxxxxxxxxxxx
static inline void
dbus_clear_pending_call (DBusPendingCall **pointer_to_pending_call)

  _dbus_clear_pointer_impl (DBusPendingCall, pointer_to_pending_call,
                            dbus_pending_call_unref);

 }
{* @  }
{$endif}
{ DBUS_PENDING_CALL_H  }

implementation

{ was #define dname def_expr }
function DBUS_TIMEOUT_INFINITE : longint;
  begin
    DBUS_TIMEOUT_INFINITE:=longint($7fffffff);
  end;


end.
