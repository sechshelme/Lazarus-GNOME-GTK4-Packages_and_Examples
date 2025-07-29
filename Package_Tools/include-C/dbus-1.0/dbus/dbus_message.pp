
unit dbus_message;
interface

{
  Automatically converted by H2Pas 1.0.0 from dbus_message.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    dbus_message.h
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
PDBusError  = ^DBusError;
PDBusMessage  = ^DBusMessage;
PDBusMessageIter  = ^DBusMessageIter;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-  }
{ dbus-message.h DBusMessage object
 *
 * Copyright (C) 2002, 2003, 2005 Red Hat Inc.
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
{$ifndef DBUS_MESSAGE_H}
{$define DBUS_MESSAGE_H}
{$include <dbus/dbus-macros.h>}
{$include <dbus/dbus-types.h>}
{$include <dbus/dbus-arch-deps.h>}
{$include <dbus/dbus-memory.h>}
{$include <dbus/dbus-errors.h>}
{$include <stdarg.h>}
{*
 * @addtogroup DBusMessage
 * @
  }
type
{*
 * Opaque type representing a message iterator. Can be copied by value and
 * allocated on the stack.
 *
 * A DBusMessageIter usually contains no allocated memory. However, there
 * is one special case: after a successful call to
 * dbus_message_iter_open_container(), the caller is responsible for calling
 * either dbus_message_iter_close_container() or
 * dbus_message_iter_abandon_container() exactly once, with the same pair
 * of iterators.
  }
{*
 * DBusMessageIter struct; contains no public fields. 
  }
{*< Don't use this  }
{*< Don't use this  }
{*< Don't use this  }
{*< Don't use this  }
{*< Don't use this  }
{*< Don't use this  }
{*< Don't use this  }
{*< Don't use this  }
{*< Don't use this  }
{*< Don't use this  }
{*< Don't use this  }
{*< Don't use this  }
{*< Don't use this  }
{*< Don't use this  }
  PDBusMessageIter = ^TDBusMessageIter;
  TDBusMessageIter = record
      dummy1 : pointer;
      dummy2 : pointer;
      dummy3 : Tdbus_uint32_t;
      dummy4 : longint;
      dummy5 : longint;
      dummy6 : longint;
      dummy7 : longint;
      dummy8 : longint;
      dummy9 : longint;
      dummy10 : longint;
      dummy11 : longint;
      pad1 : longint;
      pad2 : pointer;
      pad3 : pointer;
    end;

{*
 * A message iterator for which dbus_message_iter_abandon_container_if_open()
 * is the only valid operation.
  }
{ xxxxxxxxxxxxxxxxx
#define DBUS_MESSAGE_ITER_INIT_CLOSED \
 \
  NULL, 
  NULL, 
  0, 
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  NULL,
  NULL 

 }

function dbus_message_new(message_type:longint):PDBusMessage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function dbus_message_new_method_call(bus_name:Pchar; path:Pchar; iface:Pchar; method:Pchar):PDBusMessage;cdecl;external;
function dbus_message_new_method_return(method_call:PDBusMessage):PDBusMessage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function dbus_message_new_signal(path:Pchar; iface:Pchar; name:Pchar):PDBusMessage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function dbus_message_new_error(reply_to:PDBusMessage; error_name:Pchar; error_message:Pchar):PDBusMessage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function dbus_message_new_error_printf(reply_to:PDBusMessage; error_name:Pchar; error_format:Pchar; args:array of const):PDBusMessage;cdecl;external;
function dbus_message_new_error_printf(reply_to:PDBusMessage; error_name:Pchar; error_format:Pchar):PDBusMessage;cdecl;external;
(* Const before type ignored *)
function dbus_message_copy(message:PDBusMessage):PDBusMessage;cdecl;external;
function dbus_message_ref(message:PDBusMessage):PDBusMessage;cdecl;external;
procedure dbus_message_unref(message:PDBusMessage);cdecl;external;
function dbus_message_get_type(message:PDBusMessage):longint;cdecl;external;
(* Const before type ignored *)
function dbus_message_set_path(message:PDBusMessage; object_path:Pchar):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_message_get_path(message:PDBusMessage):Pchar;cdecl;external;
(* Const before type ignored *)
function dbus_message_has_path(message:PDBusMessage; object_path:Pchar):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_message_set_interface(message:PDBusMessage; iface:Pchar):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_message_get_interface(message:PDBusMessage):Pchar;cdecl;external;
(* Const before type ignored *)
function dbus_message_has_interface(message:PDBusMessage; iface:Pchar):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_message_set_member(message:PDBusMessage; member:Pchar):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_message_get_member(message:PDBusMessage):Pchar;cdecl;external;
(* Const before type ignored *)
function dbus_message_has_member(message:PDBusMessage; member:Pchar):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_message_set_error_name(message:PDBusMessage; name:Pchar):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_message_get_error_name(message:PDBusMessage):Pchar;cdecl;external;
(* Const before type ignored *)
function dbus_message_set_destination(message:PDBusMessage; destination:Pchar):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_message_get_destination(message:PDBusMessage):Pchar;cdecl;external;
(* Const before type ignored *)
function dbus_message_set_sender(message:PDBusMessage; sender:Pchar):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_message_get_sender(message:PDBusMessage):Pchar;cdecl;external;
(* Const before type ignored *)
function dbus_message_get_signature(message:PDBusMessage):Pchar;cdecl;external;
procedure dbus_message_set_no_reply(message:PDBusMessage; no_reply:Tdbus_bool_t);cdecl;external;
function dbus_message_get_no_reply(message:PDBusMessage):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function dbus_message_is_method_call(message:PDBusMessage; iface:Pchar; method:Pchar):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function dbus_message_is_signal(message:PDBusMessage; iface:Pchar; signal_name:Pchar):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_message_is_error(message:PDBusMessage; error_name:Pchar):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_message_has_destination(message:PDBusMessage; bus_name:Pchar):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_message_has_sender(message:PDBusMessage; unique_bus_name:Pchar):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_message_has_signature(message:PDBusMessage; signature:Pchar):Tdbus_bool_t;cdecl;external;
function dbus_message_get_serial(message:PDBusMessage):Tdbus_uint32_t;cdecl;external;
procedure dbus_message_set_serial(message:PDBusMessage; serial:Tdbus_uint32_t);cdecl;external;
function dbus_message_set_reply_serial(message:PDBusMessage; reply_serial:Tdbus_uint32_t):Tdbus_bool_t;cdecl;external;
function dbus_message_get_reply_serial(message:PDBusMessage):Tdbus_uint32_t;cdecl;external;
procedure dbus_message_set_auto_start(message:PDBusMessage; auto_start:Tdbus_bool_t);cdecl;external;
function dbus_message_get_auto_start(message:PDBusMessage):Tdbus_bool_t;cdecl;external;
function dbus_message_get_path_decomposed(message:PDBusMessage; path:PPPchar):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_message_get_container_instance(message:PDBusMessage):Pchar;cdecl;external;
(* Const before type ignored *)
function dbus_message_set_container_instance(message:PDBusMessage; object_path:Pchar):Tdbus_bool_t;cdecl;external;
function dbus_message_append_args(message:PDBusMessage; first_arg_type:longint; args:array of const):Tdbus_bool_t;cdecl;external;
function dbus_message_append_args(message:PDBusMessage; first_arg_type:longint):Tdbus_bool_t;cdecl;external;
function dbus_message_append_args_valist(message:PDBusMessage; first_arg_type:longint; var_args:Tva_list):Tdbus_bool_t;cdecl;external;
function dbus_message_get_args(message:PDBusMessage; error:PDBusError; first_arg_type:longint; args:array of const):Tdbus_bool_t;cdecl;external;
function dbus_message_get_args(message:PDBusMessage; error:PDBusError; first_arg_type:longint):Tdbus_bool_t;cdecl;external;
function dbus_message_get_args_valist(message:PDBusMessage; error:PDBusError; first_arg_type:longint; var_args:Tva_list):Tdbus_bool_t;cdecl;external;
function dbus_message_contains_unix_fds(message:PDBusMessage):Tdbus_bool_t;cdecl;external;
procedure dbus_message_iter_init_closed(iter:PDBusMessageIter);cdecl;external;
function dbus_message_iter_init(message:PDBusMessage; iter:PDBusMessageIter):Tdbus_bool_t;cdecl;external;
function dbus_message_iter_has_next(iter:PDBusMessageIter):Tdbus_bool_t;cdecl;external;
function dbus_message_iter_next(iter:PDBusMessageIter):Tdbus_bool_t;cdecl;external;
function dbus_message_iter_get_signature(iter:PDBusMessageIter):Pchar;cdecl;external;
function dbus_message_iter_get_arg_type(iter:PDBusMessageIter):longint;cdecl;external;
function dbus_message_iter_get_element_type(iter:PDBusMessageIter):longint;cdecl;external;
procedure dbus_message_iter_recurse(iter:PDBusMessageIter; sub:PDBusMessageIter);cdecl;external;
procedure dbus_message_iter_get_basic(iter:PDBusMessageIter; value:pointer);cdecl;external;
function dbus_message_iter_get_element_count(iter:PDBusMessageIter):longint;cdecl;external;
{$ifndef DBUS_DISABLE_DEPRECATED}
{ This function returns the wire protocol size of the array in bytes,
 * you do not want to know that probably
  }
{DBUS_DEPRECATED }
function dbus_message_iter_get_array_len(iter:PDBusMessageIter):longint;cdecl;external;
{$endif}

procedure dbus_message_iter_get_fixed_array(iter:PDBusMessageIter; value:pointer; n_elements:Plongint);cdecl;external;
procedure dbus_message_iter_init_append(message:PDBusMessage; iter:PDBusMessageIter);cdecl;external;
(* Const before type ignored *)
function dbus_message_iter_append_basic(iter:PDBusMessageIter; _type:longint; value:pointer):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_message_iter_append_fixed_array(iter:PDBusMessageIter; element_type:longint; value:pointer; n_elements:longint):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_message_iter_open_container(iter:PDBusMessageIter; _type:longint; contained_signature:Pchar; sub:PDBusMessageIter):Tdbus_bool_t;cdecl;external;
function dbus_message_iter_close_container(iter:PDBusMessageIter; sub:PDBusMessageIter):Tdbus_bool_t;cdecl;external;
procedure dbus_message_iter_abandon_container(iter:PDBusMessageIter; sub:PDBusMessageIter);cdecl;external;
procedure dbus_message_iter_abandon_container_if_open(iter:PDBusMessageIter; sub:PDBusMessageIter);cdecl;external;
procedure dbus_message_lock(message:PDBusMessage);cdecl;external;
function dbus_set_error_from_message(error:PDBusError; message:PDBusMessage):Tdbus_bool_t;cdecl;external;
function dbus_message_allocate_data_slot(slot_p:Pdbus_int32_t):Tdbus_bool_t;cdecl;external;
procedure dbus_message_free_data_slot(slot_p:Pdbus_int32_t);cdecl;external;
function dbus_message_set_data(message:PDBusMessage; slot:Tdbus_int32_t; data:pointer; free_data_func:TDBusFreeFunction):Tdbus_bool_t;cdecl;external;
function dbus_message_get_data(message:PDBusMessage; slot:Tdbus_int32_t):pointer;cdecl;external;
(* Const before type ignored *)
function dbus_message_type_from_string(type_str:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function dbus_message_type_to_string(_type:longint):Pchar;cdecl;external;
function dbus_message_marshal(msg:PDBusMessage; marshalled_data_p:PPchar; len_p:Plongint):Tdbus_bool_t;cdecl;external;
(* Const before type ignored *)
function dbus_message_demarshal(str:Pchar; len:longint; error:PDBusError):PDBusMessage;cdecl;external;
(* Const before type ignored *)
function dbus_message_demarshal_bytes_needed(str:Pchar; len:longint):longint;cdecl;external;
procedure dbus_message_set_allow_interactive_authorization(message:PDBusMessage; allow:Tdbus_bool_t);cdecl;external;
function dbus_message_get_allow_interactive_authorization(message:PDBusMessage):Tdbus_bool_t;cdecl;external;
{*
 * Clear a variable or struct member that contains a #DBusMessage.
 * If it does not contain #NULL, the message that was previously
 * there is unreferenced with dbus_message_unref().
 *
 * This is very similar to dbus_clear_connection(): see that function
 * for more details.
 *
 * @param pointer_to_message A pointer to a variable or struct member.
 * pointer_to_message must not be #NULL, but *pointer_to_message
 * may be #NULL.
  }
{ xxxxxxxxxxxxxxxxxxxxxx
static inline void
dbus_clear_message (DBusMessage **pointer_to_message)

  _dbus_clear_pointer_impl (DBusMessage, pointer_to_message,
                            dbus_message_unref);

 }
{* @  }
{$endif}
{ DBUS_MESSAGE_H  }

implementation


end.
