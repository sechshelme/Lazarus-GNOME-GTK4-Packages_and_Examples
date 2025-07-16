unit sd_bus;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{$ifndef foosdbushfoo}
{$define foosdbushfoo}
{**
  systemd is free software; you can redistribute it and/or modify it
  under the terms of the GNU Lesser General Public License as published by
  the Free Software Foundation; either version 2.1 of the License, or
  (at your option) any later version.

  systemd is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public License
  along with systemd; If not, see <https://www.gnu.org/licenses/>.
** }
{$include <inttypes.h>}
{$include <stdarg.h>}
{$include <stdio.h>}
{$include <sys/types.h>}
{$include <sys/uio.h>}
{$include "sd-event.h"}
{$include "sd-id128.h"}
{$include "_sd-common.h"}

{ was #define dname def_expr }
function SD_BUS_DEFAULT : Psd_bus;  

{ was #define dname def_expr }
function SD_BUS_DEFAULT_USER : Psd_bus;  

{ was #define dname def_expr }
function SD_BUS_DEFAULT_SYSTEM : Psd_bus;  

{ Types  }
type

  Psd_bus_error = ^Tsd_bus_error;
  Tsd_bus_error = record
      name : Pchar;
      message : Pchar;
      _need_free : longint;
    end;

  Psd_bus_error_map = ^Tsd_bus_error_map;
  Tsd_bus_error_map = record
      name : Pchar;
      code : longint;
    end;
{ Flags  }
{ special flag, if on sd-bus will augment creds struct, in a potentially race-full way.  }
  Txxxxxxx =  Longint;
  Const
    SD_BUS_CREDS_PID = 1 shl 0;
    SD_BUS_CREDS_TID = 1 shl 1;
    SD_BUS_CREDS_PPID = 1 shl 2;
    SD_BUS_CREDS_UID = 1 shl 3;
    SD_BUS_CREDS_EUID = 1 shl 4;
    SD_BUS_CREDS_SUID = 1 shl 5;
    SD_BUS_CREDS_FSUID = 1 shl 6;
    SD_BUS_CREDS_GID = 1 shl 7;
    SD_BUS_CREDS_EGID = 1 shl 8;
    SD_BUS_CREDS_SGID = 1 shl 9;
    SD_BUS_CREDS_FSGID = 1 shl 10;
    SD_BUS_CREDS_SUPPLEMENTARY_GIDS = 1 shl 11;
    SD_BUS_CREDS_COMM = 1 shl 12;
    SD_BUS_CREDS_TID_COMM = 1 shl 13;
    SD_BUS_CREDS_EXE = 1 shl 14;
    SD_BUS_CREDS_CMDLINE = 1 shl 15;
    SD_BUS_CREDS_CGROUP = 1 shl 16;
    SD_BUS_CREDS_UNIT = 1 shl 17;
    SD_BUS_CREDS_SLICE = 1 shl 18;
    SD_BUS_CREDS_USER_UNIT = 1 shl 19;
    SD_BUS_CREDS_USER_SLICE = 1 shl 20;
    SD_BUS_CREDS_SESSION = 1 shl 21;
    SD_BUS_CREDS_OWNER_UID = 1 shl 22;
    SD_BUS_CREDS_EFFECTIVE_CAPS = 1 shl 23;
    SD_BUS_CREDS_PERMITTED_CAPS = 1 shl 24;
    SD_BUS_CREDS_INHERITABLE_CAPS = 1 shl 25;
    SD_BUS_CREDS_BOUNDING_CAPS = 1 shl 26;
    SD_BUS_CREDS_SELINUX_CONTEXT = 1 shl 27;
    SD_BUS_CREDS_AUDIT_SESSION_ID = 1 shl 28;
    SD_BUS_CREDS_AUDIT_LOGIN_UID = 1 shl 29;
    SD_BUS_CREDS_TTY = 1 shl 30;
    SD_BUS_CREDS_UNIQUE_NAME = 1 shl 31;
    SD_BUS_CREDS_WELL_KNOWN_NAMES = 1 shl 32;
    SD_BUS_CREDS_DESCRIPTION = 1 shl 33;
    SD_BUS_CREDS_AUGMENT = 1 shl 63;
    _SD_BUS_CREDS_ALL = (1 shl 34)-1;

type
  Txxxxxxx =  Longint;
  Const
    SD_BUS_NAME_REPLACE_EXISTING = 1 shl 0;
    SD_BUS_NAME_ALLOW_REPLACEMENT = 1 shl 1;
    SD_BUS_NAME_QUEUE = 1 shl 2;

type
  Txxxxxx =  Longint;
  Const
    SD_BUS_MESSAGE_DUMP_WITH_HEADER = 1 shl 0;
    SD_BUS_MESSAGE_DUMP_SUBTREE_ONLY = 1 shl 1;
    _SD_BUS_MESSAGE_DUMP_KNOWN_FLAGS = SD_BUS_MESSAGE_DUMP_WITH_HEADER or SD_BUS_MESSAGE_DUMP_SUBTREE_ONLY;

{ Callbacks  }
type

  Tsd_bus_message_handler_t = function (m:Psd_bus_message; userdata:pointer; ret_error:Psd_bus_error):longint;cdecl;

  Tsd_bus_property_get_t = function (bus:Psd_bus; path:Pchar; interface:Pchar; _property:Pchar; reply:Psd_bus_message; 
               userdata:pointer; ret_error:Psd_bus_error):longint;cdecl;

  Tsd_bus_property_set_t = function (bus:Psd_bus; path:Pchar; interface:Pchar; _property:Pchar; value:Psd_bus_message; 
               userdata:pointer; ret_error:Psd_bus_error):longint;cdecl;

  Tsd_bus_object_find_t = function (bus:Psd_bus; path:Pchar; interface:Pchar; userdata:pointer; ret_found:Ppointer; 
               ret_error:Psd_bus_error):longint;cdecl;

  Tsd_bus_node_enumerator_t = function (bus:Psd_bus; prefix:Pchar; userdata:pointer; ret_nodes:PPPchar; ret_error:Psd_bus_error):longint;cdecl;

  Tsd_bus_track_handler_t = function (track:Psd_bus_track; userdata:pointer):longint;cdecl;

  Psd_bus_destroy_t = ^Tsd_bus_destroy_t;
  Tsd_bus_destroy_t = Tsd_destroy_t;
{$include "sd-bus-protocol.h"}
{$include "sd-bus-vtable.h"}
{ Naming  }

function sd_bus_interface_name_is_valid(p:Pchar):longint;cdecl;external libsystemd;
function sd_bus_service_name_is_valid(p:Pchar):longint;cdecl;external libsystemd;
function sd_bus_member_name_is_valid(p:Pchar):longint;cdecl;external libsystemd;
function sd_bus_object_path_is_valid(p:Pchar):longint;cdecl;external libsystemd;
{ Connections  }
function sd_bus_default(ret:PPsd_bus):longint;cdecl;external libsystemd;
function sd_bus_default_user(ret:PPsd_bus):longint;cdecl;external libsystemd;
function sd_bus_default_system(ret:PPsd_bus):longint;cdecl;external libsystemd;
function sd_bus_open(ret:PPsd_bus):longint;cdecl;external libsystemd;
function sd_bus_open_with_description(ret:PPsd_bus; description:Pchar):longint;cdecl;external libsystemd;
function sd_bus_open_user(ret:PPsd_bus):longint;cdecl;external libsystemd;
function sd_bus_open_user_with_description(ret:PPsd_bus; description:Pchar):longint;cdecl;external libsystemd;
function sd_bus_open_user_machine(ret:PPsd_bus; machine:Pchar):longint;cdecl;external libsystemd;
function sd_bus_open_system(ret:PPsd_bus):longint;cdecl;external libsystemd;
function sd_bus_open_system_with_description(ret:PPsd_bus; description:Pchar):longint;cdecl;external libsystemd;
function sd_bus_open_system_remote(ret:PPsd_bus; host:Pchar):longint;cdecl;external libsystemd;
function sd_bus_open_system_machine(ret:PPsd_bus; machine:Pchar):longint;cdecl;external libsystemd;
function sd_bus_new(ret:PPsd_bus):longint;cdecl;external libsystemd;
function sd_bus_set_address(bus:Psd_bus; address:Pchar):longint;cdecl;external libsystemd;
function sd_bus_set_fd(bus:Psd_bus; input_fd:longint; output_fd:longint):longint;cdecl;external libsystemd;
function sd_bus_set_exec(bus:Psd_bus; path:Pchar; argv:PPchar):longint;cdecl;external libsystemd;
function sd_bus_get_address(bus:Psd_bus; address:PPchar):longint;cdecl;external libsystemd;
function sd_bus_set_bus_client(bus:Psd_bus; b:longint):longint;cdecl;external libsystemd;
function sd_bus_is_bus_client(bus:Psd_bus):longint;cdecl;external libsystemd;
function sd_bus_set_server(bus:Psd_bus; b:longint; bus_id:Tsd_id128_t):longint;cdecl;external libsystemd;
function sd_bus_is_server(bus:Psd_bus):longint;cdecl;external libsystemd;
function sd_bus_set_anonymous(bus:Psd_bus; b:longint):longint;cdecl;external libsystemd;
function sd_bus_is_anonymous(bus:Psd_bus):longint;cdecl;external libsystemd;
function sd_bus_set_trusted(bus:Psd_bus; b:longint):longint;cdecl;external libsystemd;
function sd_bus_is_trusted(bus:Psd_bus):longint;cdecl;external libsystemd;
function sd_bus_set_monitor(bus:Psd_bus; b:longint):longint;cdecl;external libsystemd;
function sd_bus_is_monitor(bus:Psd_bus):longint;cdecl;external libsystemd;
function sd_bus_set_description(bus:Psd_bus; description:Pchar):longint;cdecl;external libsystemd;
function sd_bus_get_description(bus:Psd_bus; description:PPchar):longint;cdecl;external libsystemd;
function sd_bus_negotiate_creds(bus:Psd_bus; b:longint; creds_mask:Tuint64_t):longint;cdecl;external libsystemd;
function sd_bus_negotiate_timestamp(bus:Psd_bus; b:longint):longint;cdecl;external libsystemd;
function sd_bus_negotiate_fds(bus:Psd_bus; b:longint):longint;cdecl;external libsystemd;
function sd_bus_can_send(bus:Psd_bus; _type:char):longint;cdecl;external libsystemd;
function sd_bus_get_creds_mask(bus:Psd_bus; creds_mask:Puint64_t):longint;cdecl;external libsystemd;
function sd_bus_set_allow_interactive_authorization(bus:Psd_bus; b:longint):longint;cdecl;external libsystemd;
function sd_bus_get_allow_interactive_authorization(bus:Psd_bus):longint;cdecl;external libsystemd;
function sd_bus_set_exit_on_disconnect(bus:Psd_bus; b:longint):longint;cdecl;external libsystemd;
function sd_bus_get_exit_on_disconnect(bus:Psd_bus):longint;cdecl;external libsystemd;
function sd_bus_set_close_on_exit(bus:Psd_bus; b:longint):longint;cdecl;external libsystemd;
function sd_bus_get_close_on_exit(bus:Psd_bus):longint;cdecl;external libsystemd;
function sd_bus_set_watch_bind(bus:Psd_bus; b:longint):longint;cdecl;external libsystemd;
function sd_bus_get_watch_bind(bus:Psd_bus):longint;cdecl;external libsystemd;
function sd_bus_set_connected_signal(bus:Psd_bus; b:longint):longint;cdecl;external libsystemd;
function sd_bus_get_connected_signal(bus:Psd_bus):longint;cdecl;external libsystemd;
function sd_bus_set_sender(bus:Psd_bus; sender:Pchar):longint;cdecl;external libsystemd;
function sd_bus_get_sender(bus:Psd_bus; ret:PPchar):longint;cdecl;external libsystemd;
function sd_bus_start(bus:Psd_bus):longint;cdecl;external libsystemd;
{_sd_deprecated_ }function sd_bus_try_close(bus:Psd_bus):longint;cdecl;external libsystemd;
procedure sd_bus_close(bus:Psd_bus);cdecl;external libsystemd;
function sd_bus_ref(bus:Psd_bus):Psd_bus;cdecl;external libsystemd;
function sd_bus_unref(bus:Psd_bus):Psd_bus;cdecl;external libsystemd;
function sd_bus_close_unref(bus:Psd_bus):Psd_bus;cdecl;external libsystemd;
function sd_bus_flush_close_unref(bus:Psd_bus):Psd_bus;cdecl;external libsystemd;
procedure sd_bus_default_flush_close;cdecl;external libsystemd;
function sd_bus_is_open(bus:Psd_bus):longint;cdecl;external libsystemd;
function sd_bus_is_ready(bus:Psd_bus):longint;cdecl;external libsystemd;
function sd_bus_get_bus_id(bus:Psd_bus; id:Psd_id128_t):longint;cdecl;external libsystemd;
function sd_bus_get_scope(bus:Psd_bus; scope:PPchar):longint;cdecl;external libsystemd;
function sd_bus_get_tid(bus:Psd_bus; tid:Ppid_t):longint;cdecl;external libsystemd;
function sd_bus_get_owner_creds(bus:Psd_bus; creds_mask:Tuint64_t; ret:PPsd_bus_creds):longint;cdecl;external libsystemd;
function sd_bus_send(bus:Psd_bus; m:Psd_bus_message; cookie:Puint64_t):longint;cdecl;external libsystemd;
function sd_bus_send_to(bus:Psd_bus; m:Psd_bus_message; destination:Pchar; cookie:Puint64_t):longint;cdecl;external libsystemd;
function sd_bus_call(bus:Psd_bus; m:Psd_bus_message; usec:Tuint64_t; ret_error:Psd_bus_error; reply:PPsd_bus_message):longint;cdecl;external libsystemd;
function sd_bus_call_async(bus:Psd_bus; slot:PPsd_bus_slot; m:Psd_bus_message; callback:Tsd_bus_message_handler_t; userdata:pointer; 
           usec:Tuint64_t):longint;cdecl;external libsystemd;
function sd_bus_get_fd(bus:Psd_bus):longint;cdecl;external libsystemd;
function sd_bus_get_events(bus:Psd_bus):longint;cdecl;external libsystemd;
function sd_bus_get_timeout(bus:Psd_bus; timeout_usec:Puint64_t):longint;cdecl;external libsystemd;
function sd_bus_process(bus:Psd_bus; r:PPsd_bus_message):longint;cdecl;external libsystemd;
{_sd_deprecated_ }function sd_bus_process_priority(bus:Psd_bus; max_priority:Tint64_t; r:PPsd_bus_message):longint;cdecl;external libsystemd;
function sd_bus_wait(bus:Psd_bus; timeout_usec:Tuint64_t):longint;cdecl;external libsystemd;
function sd_bus_flush(bus:Psd_bus):longint;cdecl;external libsystemd;
function sd_bus_enqueue_for_read(bus:Psd_bus; m:Psd_bus_message):longint;cdecl;external libsystemd;
function sd_bus_get_current_slot(bus:Psd_bus):Psd_bus_slot;cdecl;external libsystemd;
function sd_bus_get_current_message(bus:Psd_bus):Psd_bus_message;cdecl;external libsystemd;
function sd_bus_get_current_handler(bus:Psd_bus):Tsd_bus_message_handler_t;cdecl;external libsystemd;
function sd_bus_get_current_userdata(bus:Psd_bus):pointer;cdecl;external libsystemd;
function sd_bus_attach_event(bus:Psd_bus; e:Psd_event; priority:longint):longint;cdecl;external libsystemd;
function sd_bus_detach_event(bus:Psd_bus):longint;cdecl;external libsystemd;
function sd_bus_get_event(bus:Psd_bus):Psd_event;cdecl;external libsystemd;
function sd_bus_get_n_queued_read(bus:Psd_bus; ret:Puint64_t):longint;cdecl;external libsystemd;
function sd_bus_get_n_queued_write(bus:Psd_bus; ret:Puint64_t):longint;cdecl;external libsystemd;
function sd_bus_set_method_call_timeout(bus:Psd_bus; usec:Tuint64_t):longint;cdecl;external libsystemd;
function sd_bus_get_method_call_timeout(bus:Psd_bus; ret:Puint64_t):longint;cdecl;external libsystemd;
function sd_bus_add_filter(bus:Psd_bus; slot:PPsd_bus_slot; callback:Tsd_bus_message_handler_t; userdata:pointer):longint;cdecl;external libsystemd;
function sd_bus_add_match(bus:Psd_bus; slot:PPsd_bus_slot; match:Pchar; callback:Tsd_bus_message_handler_t; userdata:pointer):longint;cdecl;external libsystemd;
function sd_bus_add_match_async(bus:Psd_bus; slot:PPsd_bus_slot; match:Pchar; callback:Tsd_bus_message_handler_t; install_callback:Tsd_bus_message_handler_t; 
           userdata:pointer):longint;cdecl;external libsystemd;
function sd_bus_add_object(bus:Psd_bus; slot:PPsd_bus_slot; path:Pchar; callback:Tsd_bus_message_handler_t; userdata:pointer):longint;cdecl;external libsystemd;
function sd_bus_add_fallback(bus:Psd_bus; slot:PPsd_bus_slot; prefix:Pchar; callback:Tsd_bus_message_handler_t; userdata:pointer):longint;cdecl;external libsystemd;
function sd_bus_add_object_vtable(bus:Psd_bus; slot:PPsd_bus_slot; path:Pchar; interface:Pchar; vtable:Psd_bus_vtable; 
           userdata:pointer):longint;cdecl;external libsystemd;
function sd_bus_add_fallback_vtable(bus:Psd_bus; slot:PPsd_bus_slot; prefix:Pchar; interface:Pchar; vtable:Psd_bus_vtable; 
           find:Tsd_bus_object_find_t; userdata:pointer):longint;cdecl;external libsystemd;
function sd_bus_add_node_enumerator(bus:Psd_bus; slot:PPsd_bus_slot; path:Pchar; callback:Tsd_bus_node_enumerator_t; userdata:pointer):longint;cdecl;external libsystemd;
function sd_bus_add_object_manager(bus:Psd_bus; slot:PPsd_bus_slot; path:Pchar):longint;cdecl;external libsystemd;
{ Slot object  }
function sd_bus_slot_ref(slot:Psd_bus_slot):Psd_bus_slot;cdecl;external libsystemd;
function sd_bus_slot_unref(slot:Psd_bus_slot):Psd_bus_slot;cdecl;external libsystemd;
function sd_bus_slot_get_bus(slot:Psd_bus_slot):Psd_bus;cdecl;external libsystemd;
function sd_bus_slot_get_userdata(slot:Psd_bus_slot):pointer;cdecl;external libsystemd;
function sd_bus_slot_set_userdata(slot:Psd_bus_slot; userdata:pointer):pointer;cdecl;external libsystemd;
function sd_bus_slot_set_description(slot:Psd_bus_slot; description:Pchar):longint;cdecl;external libsystemd;
function sd_bus_slot_get_description(slot:Psd_bus_slot; description:PPchar):longint;cdecl;external libsystemd;
function sd_bus_slot_get_floating(slot:Psd_bus_slot):longint;cdecl;external libsystemd;
function sd_bus_slot_set_floating(slot:Psd_bus_slot; b:longint):longint;cdecl;external libsystemd;
function sd_bus_slot_set_destroy_callback(s:Psd_bus_slot; callback:Tsd_bus_destroy_t):longint;cdecl;external libsystemd;
function sd_bus_slot_get_destroy_callback(s:Psd_bus_slot; callback:Psd_bus_destroy_t):longint;cdecl;external libsystemd;
function sd_bus_slot_get_current_message(slot:Psd_bus_slot):Psd_bus_message;cdecl;external libsystemd;
function sd_bus_slot_get_current_handler(slot:Psd_bus_slot):Tsd_bus_message_handler_t;cdecl;external libsystemd;
function sd_bus_slot_get_current_userdata(slot:Psd_bus_slot):pointer;cdecl;external libsystemd;
{ Message object  }
function sd_bus_message_new(bus:Psd_bus; m:PPsd_bus_message; _type:Tuint8_t):longint;cdecl;external libsystemd;
function sd_bus_message_new_signal(bus:Psd_bus; m:PPsd_bus_message; path:Pchar; interface:Pchar; member:Pchar):longint;cdecl;external libsystemd;
function sd_bus_message_new_signal_to(bus:Psd_bus; m:PPsd_bus_message; destination:Pchar; path:Pchar; interface:Pchar; 
           member:Pchar):longint;cdecl;external libsystemd;
function sd_bus_message_new_method_call(bus:Psd_bus; m:PPsd_bus_message; destination:Pchar; path:Pchar; interface:Pchar; 
           member:Pchar):longint;cdecl;external libsystemd;
function sd_bus_message_new_method_return(call:Psd_bus_message; m:PPsd_bus_message):longint;cdecl;external libsystemd;
function sd_bus_message_new_method_error(call:Psd_bus_message; m:PPsd_bus_message; e:Psd_bus_error):longint;cdecl;external libsystemd;
function sd_bus_message_new_method_errorf(call:Psd_bus_message; m:PPsd_bus_message; name:Pchar; format:Pchar; args:array of const):longint;cdecl;external libsystemd;
function sd_bus_message_new_method_errorf(call:Psd_bus_message; m:PPsd_bus_message; name:Pchar; format:Pchar):longint;cdecl;external libsystemd;
function sd_bus_message_new_method_errno(call:Psd_bus_message; m:PPsd_bus_message; error:longint; e:Psd_bus_error):longint;cdecl;external libsystemd;
function sd_bus_message_new_method_errnof(call:Psd_bus_message; m:PPsd_bus_message; error:longint; format:Pchar; args:array of const):longint;cdecl;external libsystemd;
function sd_bus_message_new_method_errnof(call:Psd_bus_message; m:PPsd_bus_message; error:longint; format:Pchar):longint;cdecl;external libsystemd;
function sd_bus_message_ref(m:Psd_bus_message):Psd_bus_message;cdecl;external libsystemd;
function sd_bus_message_unref(m:Psd_bus_message):Psd_bus_message;cdecl;external libsystemd;
function sd_bus_message_seal(m:Psd_bus_message; cookie:Tuint64_t; timeout_usec:Tuint64_t):longint;cdecl;external libsystemd;
function sd_bus_message_get_type(m:Psd_bus_message; _type:Puint8_t):longint;cdecl;external libsystemd;
function sd_bus_message_get_cookie(m:Psd_bus_message; cookie:Puint64_t):longint;cdecl;external libsystemd;
function sd_bus_message_get_reply_cookie(m:Psd_bus_message; cookie:Puint64_t):longint;cdecl;external libsystemd;
{_sd_deprecated_ }function sd_bus_message_get_priority(m:Psd_bus_message; priority:Pint64_t):longint;cdecl;external libsystemd;
function sd_bus_message_get_expect_reply(m:Psd_bus_message):longint;cdecl;external libsystemd;
function sd_bus_message_get_auto_start(m:Psd_bus_message):longint;cdecl;external libsystemd;
function sd_bus_message_get_allow_interactive_authorization(m:Psd_bus_message):longint;cdecl;external libsystemd;
function sd_bus_message_get_signature(m:Psd_bus_message; complete:longint):Pchar;cdecl;external libsystemd;
function sd_bus_message_get_path(m:Psd_bus_message):Pchar;cdecl;external libsystemd;
function sd_bus_message_get_interface(m:Psd_bus_message):Pchar;cdecl;external libsystemd;
function sd_bus_message_get_member(m:Psd_bus_message):Pchar;cdecl;external libsystemd;
function sd_bus_message_get_destination(m:Psd_bus_message):Pchar;cdecl;external libsystemd;
function sd_bus_message_get_sender(m:Psd_bus_message):Pchar;cdecl;external libsystemd;
function sd_bus_message_get_error(m:Psd_bus_message):Psd_bus_error;cdecl;external libsystemd;
function sd_bus_message_get_errno(m:Psd_bus_message):longint;cdecl;external libsystemd;
function sd_bus_message_get_monotonic_usec(m:Psd_bus_message; usec:Puint64_t):longint;cdecl;external libsystemd;
function sd_bus_message_get_realtime_usec(m:Psd_bus_message; usec:Puint64_t):longint;cdecl;external libsystemd;
function sd_bus_message_get_seqnum(m:Psd_bus_message; seqnum:Puint64_t):longint;cdecl;external libsystemd;
function sd_bus_message_get_bus(m:Psd_bus_message):Psd_bus;cdecl;external libsystemd;
function sd_bus_message_get_creds(m:Psd_bus_message):Psd_bus_creds;cdecl;external libsystemd;
{ do not unref the result  }
function sd_bus_message_is_signal(m:Psd_bus_message; interface:Pchar; member:Pchar):longint;cdecl;external libsystemd;
function sd_bus_message_is_method_call(m:Psd_bus_message; interface:Pchar; member:Pchar):longint;cdecl;external libsystemd;
function sd_bus_message_is_method_error(m:Psd_bus_message; name:Pchar):longint;cdecl;external libsystemd;
function sd_bus_message_is_empty(m:Psd_bus_message):longint;cdecl;external libsystemd;
function sd_bus_message_has_signature(m:Psd_bus_message; signature:Pchar):longint;cdecl;external libsystemd;
function sd_bus_message_set_expect_reply(m:Psd_bus_message; b:longint):longint;cdecl;external libsystemd;
function sd_bus_message_set_auto_start(m:Psd_bus_message; b:longint):longint;cdecl;external libsystemd;
function sd_bus_message_set_allow_interactive_authorization(m:Psd_bus_message; b:longint):longint;cdecl;external libsystemd;
function sd_bus_message_set_destination(m:Psd_bus_message; destination:Pchar):longint;cdecl;external libsystemd;
function sd_bus_message_set_sender(m:Psd_bus_message; sender:Pchar):longint;cdecl;external libsystemd;
{_sd_deprecated_ }function sd_bus_message_set_priority(m:Psd_bus_message; priority:Tint64_t):longint;cdecl;external libsystemd;
function sd_bus_message_append(m:Psd_bus_message; types:Pchar; args:array of const):longint;cdecl;external libsystemd;
function sd_bus_message_append(m:Psd_bus_message; types:Pchar):longint;cdecl;external libsystemd;
function sd_bus_message_appendv(m:Psd_bus_message; types:Pchar; ap:Tva_list):longint;cdecl;external libsystemd;
function sd_bus_message_append_basic(m:Psd_bus_message; _type:char; p:pointer):longint;cdecl;external libsystemd;
function sd_bus_message_append_array(m:Psd_bus_message; _type:char; ptr:pointer; size:Tsize_t):longint;cdecl;external libsystemd;
function sd_bus_message_append_array_space(m:Psd_bus_message; _type:char; size:Tsize_t; ptr:Ppointer):longint;cdecl;external libsystemd;
function sd_bus_message_append_array_iovec(m:Psd_bus_message; _type:char; iov:Piovec; n:dword):longint;cdecl;external libsystemd;
function sd_bus_message_append_array_memfd(m:Psd_bus_message; _type:char; memfd:longint; offset:Tuint64_t; size:Tuint64_t):longint;cdecl;external libsystemd;
function sd_bus_message_append_string_space(m:Psd_bus_message; size:Tsize_t; s:PPchar):longint;cdecl;external libsystemd;
function sd_bus_message_append_string_iovec(m:Psd_bus_message; iov:Piovec; n:dword):longint;cdecl;external libsystemd;
function sd_bus_message_append_string_memfd(m:Psd_bus_message; memfd:longint; offset:Tuint64_t; size:Tuint64_t):longint;cdecl;external libsystemd;
function sd_bus_message_append_strv(m:Psd_bus_message; l:PPchar):longint;cdecl;external libsystemd;
function sd_bus_message_open_container(m:Psd_bus_message; _type:char; contents:Pchar):longint;cdecl;external libsystemd;
function sd_bus_message_close_container(m:Psd_bus_message):longint;cdecl;external libsystemd;
function sd_bus_message_copy(m:Psd_bus_message; source:Psd_bus_message; all:longint):longint;cdecl;external libsystemd;
function sd_bus_message_read(m:Psd_bus_message; types:Pchar; args:array of const):longint;cdecl;external libsystemd;
function sd_bus_message_read(m:Psd_bus_message; types:Pchar):longint;cdecl;external libsystemd;
function sd_bus_message_readv(m:Psd_bus_message; types:Pchar; ap:Tva_list):longint;cdecl;external libsystemd;
function sd_bus_message_read_basic(m:Psd_bus_message; _type:char; p:pointer):longint;cdecl;external libsystemd;
function sd_bus_message_read_array(m:Psd_bus_message; _type:char; ptr:Ppointer; size:Psize_t):longint;cdecl;external libsystemd;
function sd_bus_message_read_strv(m:Psd_bus_message; l:PPPchar):longint;cdecl;external libsystemd;
{ free the result!  }
function sd_bus_message_read_strv_extend(m:Psd_bus_message; l:PPPchar):longint;cdecl;external libsystemd;
function sd_bus_message_skip(m:Psd_bus_message; types:Pchar):longint;cdecl;external libsystemd;
function sd_bus_message_enter_container(m:Psd_bus_message; _type:char; contents:Pchar):longint;cdecl;external libsystemd;
function sd_bus_message_exit_container(m:Psd_bus_message):longint;cdecl;external libsystemd;
function sd_bus_message_peek_type(m:Psd_bus_message; _type:Pchar; contents:PPchar):longint;cdecl;external libsystemd;
function sd_bus_message_verify_type(m:Psd_bus_message; _type:char; contents:Pchar):longint;cdecl;external libsystemd;
function sd_bus_message_at_end(m:Psd_bus_message; complete:longint):longint;cdecl;external libsystemd;
function sd_bus_message_rewind(m:Psd_bus_message; complete:longint):longint;cdecl;external libsystemd;
function sd_bus_message_sensitive(m:Psd_bus_message):longint;cdecl;external libsystemd;
function sd_bus_message_dump(m:Psd_bus_message; f:PFILE; flags:Tuint64_t):longint;cdecl;external libsystemd;
{ Bus management  }
function sd_bus_get_unique_name(bus:Psd_bus; unique:PPchar):longint;cdecl;external libsystemd;
function sd_bus_request_name(bus:Psd_bus; name:Pchar; flags:Tuint64_t):longint;cdecl;external libsystemd;
function sd_bus_request_name_async(bus:Psd_bus; ret_slot:PPsd_bus_slot; name:Pchar; flags:Tuint64_t; callback:Tsd_bus_message_handler_t; 
           userdata:pointer):longint;cdecl;external libsystemd;
function sd_bus_release_name(bus:Psd_bus; name:Pchar):longint;cdecl;external libsystemd;
function sd_bus_release_name_async(bus:Psd_bus; ret_slot:PPsd_bus_slot; name:Pchar; callback:Tsd_bus_message_handler_t; userdata:pointer):longint;cdecl;external libsystemd;
function sd_bus_list_names(bus:Psd_bus; acquired:PPPchar; activatable:PPPchar):longint;cdecl;external libsystemd;
{ free the results  }
function sd_bus_get_name_creds(bus:Psd_bus; name:Pchar; mask:Tuint64_t; creds:PPsd_bus_creds):longint;cdecl;external libsystemd;
{ unref the result!  }
function sd_bus_get_name_machine_id(bus:Psd_bus; name:Pchar; machine:Psd_id128_t):longint;cdecl;external libsystemd;
{ Convenience calls  }
function sd_bus_message_send(m:Psd_bus_message):longint;cdecl;external libsystemd;
function sd_bus_call_methodv(bus:Psd_bus; destination:Pchar; path:Pchar; interface:Pchar; member:Pchar; 
           ret_error:Psd_bus_error; reply:PPsd_bus_message; types:Pchar; ap:Tva_list):longint;cdecl;external libsystemd;
function sd_bus_call_method(bus:Psd_bus; destination:Pchar; path:Pchar; interface:Pchar; member:Pchar; 
           ret_error:Psd_bus_error; reply:PPsd_bus_message; types:Pchar; args:array of const):longint;cdecl;external libsystemd;
function sd_bus_call_method(bus:Psd_bus; destination:Pchar; path:Pchar; interface:Pchar; member:Pchar; 
           ret_error:Psd_bus_error; reply:PPsd_bus_message; types:Pchar):longint;cdecl;external libsystemd;
function sd_bus_call_method_asyncv(bus:Psd_bus; slot:PPsd_bus_slot; destination:Pchar; path:Pchar; interface:Pchar; 
           member:Pchar; callback:Tsd_bus_message_handler_t; userdata:pointer; types:Pchar; ap:Tva_list):longint;cdecl;external libsystemd;
function sd_bus_call_method_async(bus:Psd_bus; slot:PPsd_bus_slot; destination:Pchar; path:Pchar; interface:Pchar; 
           member:Pchar; callback:Tsd_bus_message_handler_t; userdata:pointer; types:Pchar; args:array of const):longint;cdecl;external libsystemd;
function sd_bus_call_method_async(bus:Psd_bus; slot:PPsd_bus_slot; destination:Pchar; path:Pchar; interface:Pchar; 
           member:Pchar; callback:Tsd_bus_message_handler_t; userdata:pointer; types:Pchar):longint;cdecl;external libsystemd;
function sd_bus_get_property(bus:Psd_bus; destination:Pchar; path:Pchar; interface:Pchar; member:Pchar; 
           ret_error:Psd_bus_error; reply:PPsd_bus_message; _type:Pchar):longint;cdecl;external libsystemd;
function sd_bus_get_property_trivial(bus:Psd_bus; destination:Pchar; path:Pchar; interface:Pchar; member:Pchar; 
           ret_error:Psd_bus_error; _type:char; ret_ptr:pointer):longint;cdecl;external libsystemd;
function sd_bus_get_property_string(bus:Psd_bus; destination:Pchar; path:Pchar; interface:Pchar; member:Pchar; 
           ret_error:Psd_bus_error; ret:PPchar):longint;cdecl;external libsystemd;
{ free the result!  }
function sd_bus_get_property_strv(bus:Psd_bus; destination:Pchar; path:Pchar; interface:Pchar; member:Pchar; 
           ret_error:Psd_bus_error; ret:PPPchar):longint;cdecl;external libsystemd;
{ free the result!  }
function sd_bus_set_propertyv(bus:Psd_bus; destination:Pchar; path:Pchar; interface:Pchar; member:Pchar; 
           ret_error:Psd_bus_error; _type:Pchar; ap:Tva_list):longint;cdecl;external libsystemd;
function sd_bus_set_property(bus:Psd_bus; destination:Pchar; path:Pchar; interface:Pchar; member:Pchar; 
           ret_error:Psd_bus_error; _type:Pchar; args:array of const):longint;cdecl;external libsystemd;
function sd_bus_set_property(bus:Psd_bus; destination:Pchar; path:Pchar; interface:Pchar; member:Pchar; 
           ret_error:Psd_bus_error; _type:Pchar):longint;cdecl;external libsystemd;
function sd_bus_reply_method_returnv(call:Psd_bus_message; types:Pchar; ap:Tva_list):longint;cdecl;external libsystemd;
function sd_bus_reply_method_return(call:Psd_bus_message; types:Pchar; args:array of const):longint;cdecl;external libsystemd;
function sd_bus_reply_method_return(call:Psd_bus_message; types:Pchar):longint;cdecl;external libsystemd;
function sd_bus_reply_method_error(call:Psd_bus_message; e:Psd_bus_error):longint;cdecl;external libsystemd;
function sd_bus_reply_method_errorfv(call:Psd_bus_message; name:Pchar; format:Pchar; ap:Tva_list):longint;cdecl;external libsystemd;
function sd_bus_reply_method_errorf(call:Psd_bus_message; name:Pchar; format:Pchar; args:array of const):longint;cdecl;external libsystemd;
function sd_bus_reply_method_errorf(call:Psd_bus_message; name:Pchar; format:Pchar):longint;cdecl;external libsystemd;
function sd_bus_reply_method_errno(call:Psd_bus_message; error:longint; e:Psd_bus_error):longint;cdecl;external libsystemd;
function sd_bus_reply_method_errnofv(call:Psd_bus_message; error:longint; format:Pchar; ap:Tva_list):longint;cdecl;external libsystemd;
function sd_bus_reply_method_errnof(call:Psd_bus_message; error:longint; format:Pchar; args:array of const):longint;cdecl;external libsystemd;
function sd_bus_reply_method_errnof(call:Psd_bus_message; error:longint; format:Pchar):longint;cdecl;external libsystemd;
function sd_bus_emit_signalv(bus:Psd_bus; path:Pchar; interface:Pchar; member:Pchar; types:Pchar; 
           ap:Tva_list):longint;cdecl;external libsystemd;
function sd_bus_emit_signal(bus:Psd_bus; path:Pchar; interface:Pchar; member:Pchar; types:Pchar; 
           args:array of const):longint;cdecl;external libsystemd;
function sd_bus_emit_signal(bus:Psd_bus; path:Pchar; interface:Pchar; member:Pchar; types:Pchar):longint;cdecl;external libsystemd;
function sd_bus_emit_signal_tov(bus:Psd_bus; destination:Pchar; path:Pchar; interface:Pchar; member:Pchar; 
           types:Pchar; ap:Tva_list):longint;cdecl;external libsystemd;
function sd_bus_emit_signal_to(bus:Psd_bus; destination:Pchar; path:Pchar; interface:Pchar; member:Pchar; 
           types:Pchar; args:array of const):longint;cdecl;external libsystemd;
function sd_bus_emit_signal_to(bus:Psd_bus; destination:Pchar; path:Pchar; interface:Pchar; member:Pchar; 
           types:Pchar):longint;cdecl;external libsystemd;
function sd_bus_emit_properties_changed_strv(bus:Psd_bus; path:Pchar; interface:Pchar; names:PPchar):longint;cdecl;external libsystemd;
function sd_bus_emit_properties_changed(bus:Psd_bus; path:Pchar; interface:Pchar; name:Pchar; args:array of const):longint;cdecl;external libsystemd;
function sd_bus_emit_properties_changed(bus:Psd_bus; path:Pchar; interface:Pchar; name:Pchar):longint;cdecl;external libsystemd;
function sd_bus_emit_object_added(bus:Psd_bus; path:Pchar):longint;cdecl;external libsystemd;
function sd_bus_emit_object_removed(bus:Psd_bus; path:Pchar):longint;cdecl;external libsystemd;
function sd_bus_emit_interfaces_added_strv(bus:Psd_bus; path:Pchar; interfaces:PPchar):longint;cdecl;external libsystemd;
function sd_bus_emit_interfaces_added(bus:Psd_bus; path:Pchar; interface:Pchar; args:array of const):longint;cdecl;external libsystemd;
function sd_bus_emit_interfaces_added(bus:Psd_bus; path:Pchar; interface:Pchar):longint;cdecl;external libsystemd;
function sd_bus_emit_interfaces_removed_strv(bus:Psd_bus; path:Pchar; interfaces:PPchar):longint;cdecl;external libsystemd;
function sd_bus_emit_interfaces_removed(bus:Psd_bus; path:Pchar; interface:Pchar; args:array of const):longint;cdecl;external libsystemd;
function sd_bus_emit_interfaces_removed(bus:Psd_bus; path:Pchar; interface:Pchar):longint;cdecl;external libsystemd;
function sd_bus_query_sender_creds(m:Psd_bus_message; mask:Tuint64_t; creds:PPsd_bus_creds):longint;cdecl;external libsystemd;
function sd_bus_query_sender_privilege(m:Psd_bus_message; capability:longint):longint;cdecl;external libsystemd;
function sd_bus_match_signal(bus:Psd_bus; ret:PPsd_bus_slot; sender:Pchar; path:Pchar; interface:Pchar; 
           member:Pchar; callback:Tsd_bus_message_handler_t; userdata:pointer):longint;cdecl;external libsystemd;
function sd_bus_match_signal_async(bus:Psd_bus; ret:PPsd_bus_slot; sender:Pchar; path:Pchar; interface:Pchar; 
           member:Pchar; match_callback:Tsd_bus_message_handler_t; add_callback:Tsd_bus_message_handler_t; userdata:pointer):longint;cdecl;external libsystemd;
{ Credential handling  }
function sd_bus_creds_new_from_pid(ret:PPsd_bus_creds; pid:Tpid_t; creds_mask:Tuint64_t):longint;cdecl;external libsystemd;
function sd_bus_creds_ref(c:Psd_bus_creds):Psd_bus_creds;cdecl;external libsystemd;
function sd_bus_creds_unref(c:Psd_bus_creds):Psd_bus_creds;cdecl;external libsystemd;
function sd_bus_creds_get_mask(c:Psd_bus_creds):Tuint64_t;cdecl;external libsystemd;
function sd_bus_creds_get_augmented_mask(c:Psd_bus_creds):Tuint64_t;cdecl;external libsystemd;
function sd_bus_creds_get_pid(c:Psd_bus_creds; pid:Ppid_t):longint;cdecl;external libsystemd;
function sd_bus_creds_get_ppid(c:Psd_bus_creds; ppid:Ppid_t):longint;cdecl;external libsystemd;
function sd_bus_creds_get_tid(c:Psd_bus_creds; tid:Ppid_t):longint;cdecl;external libsystemd;
function sd_bus_creds_get_uid(c:Psd_bus_creds; uid:Puid_t):longint;cdecl;external libsystemd;
function sd_bus_creds_get_euid(c:Psd_bus_creds; euid:Puid_t):longint;cdecl;external libsystemd;
function sd_bus_creds_get_suid(c:Psd_bus_creds; suid:Puid_t):longint;cdecl;external libsystemd;
function sd_bus_creds_get_fsuid(c:Psd_bus_creds; fsuid:Puid_t):longint;cdecl;external libsystemd;
function sd_bus_creds_get_gid(c:Psd_bus_creds; gid:Pgid_t):longint;cdecl;external libsystemd;
function sd_bus_creds_get_egid(c:Psd_bus_creds; egid:Pgid_t):longint;cdecl;external libsystemd;
function sd_bus_creds_get_sgid(c:Psd_bus_creds; sgid:Pgid_t):longint;cdecl;external libsystemd;
function sd_bus_creds_get_fsgid(c:Psd_bus_creds; fsgid:Pgid_t):longint;cdecl;external libsystemd;
function sd_bus_creds_get_supplementary_gids(c:Psd_bus_creds; gids:PPgid_t):longint;cdecl;external libsystemd;
function sd_bus_creds_get_comm(c:Psd_bus_creds; comm:PPchar):longint;cdecl;external libsystemd;
function sd_bus_creds_get_tid_comm(c:Psd_bus_creds; comm:PPchar):longint;cdecl;external libsystemd;
function sd_bus_creds_get_exe(c:Psd_bus_creds; exe:PPchar):longint;cdecl;external libsystemd;
function sd_bus_creds_get_cmdline(c:Psd_bus_creds; cmdline:PPPchar):longint;cdecl;external libsystemd;
function sd_bus_creds_get_cgroup(c:Psd_bus_creds; cgroup:PPchar):longint;cdecl;external libsystemd;
function sd_bus_creds_get_unit(c:Psd_bus_creds; unit:PPchar):longint;cdecl;external libsystemd;
function sd_bus_creds_get_slice(c:Psd_bus_creds; slice:PPchar):longint;cdecl;external libsystemd;
function sd_bus_creds_get_user_unit(c:Psd_bus_creds; unit:PPchar):longint;cdecl;external libsystemd;
function sd_bus_creds_get_user_slice(c:Psd_bus_creds; slice:PPchar):longint;cdecl;external libsystemd;
function sd_bus_creds_get_session(c:Psd_bus_creds; session:PPchar):longint;cdecl;external libsystemd;
function sd_bus_creds_get_owner_uid(c:Psd_bus_creds; uid:Puid_t):longint;cdecl;external libsystemd;
function sd_bus_creds_has_effective_cap(c:Psd_bus_creds; capability:longint):longint;cdecl;external libsystemd;
function sd_bus_creds_has_permitted_cap(c:Psd_bus_creds; capability:longint):longint;cdecl;external libsystemd;
function sd_bus_creds_has_inheritable_cap(c:Psd_bus_creds; capability:longint):longint;cdecl;external libsystemd;
function sd_bus_creds_has_bounding_cap(c:Psd_bus_creds; capability:longint):longint;cdecl;external libsystemd;
function sd_bus_creds_get_selinux_context(c:Psd_bus_creds; context:PPchar):longint;cdecl;external libsystemd;
function sd_bus_creds_get_audit_session_id(c:Psd_bus_creds; sessionid:Puint32_t):longint;cdecl;external libsystemd;
function sd_bus_creds_get_audit_login_uid(c:Psd_bus_creds; loginuid:Puid_t):longint;cdecl;external libsystemd;
function sd_bus_creds_get_tty(c:Psd_bus_creds; tty:PPchar):longint;cdecl;external libsystemd;
function sd_bus_creds_get_unique_name(c:Psd_bus_creds; name:PPchar):longint;cdecl;external libsystemd;
function sd_bus_creds_get_well_known_names(c:Psd_bus_creds; names:PPPchar):longint;cdecl;external libsystemd;
function sd_bus_creds_get_description(c:Psd_bus_creds; name:PPchar):longint;cdecl;external libsystemd;
{ Error structures  }
{#define SD_BUS_ERROR_MAKE_CONST(name, message) ((const sd_bus_error) (name), (message), 0) }
{#define SD_BUS_ERROR_NULL SD_BUS_ERROR_MAKE_CONST(NULL, NULL) }
procedure sd_bus_error_free(e:Psd_bus_error);cdecl;external libsystemd;
function sd_bus_error_set(e:Psd_bus_error; name:Pchar; message:Pchar):longint;cdecl;external libsystemd;
function sd_bus_error_setf(e:Psd_bus_error; name:Pchar; format:Pchar; args:array of const):longint;cdecl;external libsystemd;
function sd_bus_error_setf(e:Psd_bus_error; name:Pchar; format:Pchar):longint;cdecl;external libsystemd;
function sd_bus_error_setfv(e:Psd_bus_error; name:Pchar; format:Pchar; ap:Tva_list):longint;cdecl;external libsystemd;
function sd_bus_error_set_const(e:Psd_bus_error; name:Pchar; message:Pchar):longint;cdecl;external libsystemd;
function sd_bus_error_set_errno(e:Psd_bus_error; error:longint):longint;cdecl;external libsystemd;
function sd_bus_error_set_errnof(e:Psd_bus_error; error:longint; format:Pchar; args:array of const):longint;cdecl;external libsystemd;
function sd_bus_error_set_errnof(e:Psd_bus_error; error:longint; format:Pchar):longint;cdecl;external libsystemd;
function sd_bus_error_set_errnofv(e:Psd_bus_error; error:longint; format:Pchar; ap:Tva_list):longint;cdecl;external libsystemd;
function sd_bus_error_get_errno(e:Psd_bus_error):longint;cdecl;external libsystemd;
function sd_bus_error_copy(dest:Psd_bus_error; e:Psd_bus_error):longint;cdecl;external libsystemd;
function sd_bus_error_move(dest:Psd_bus_error; e:Psd_bus_error):longint;cdecl;external libsystemd;
function sd_bus_error_is_set(e:Psd_bus_error):longint;cdecl;external libsystemd;
function sd_bus_error_has_name(e:Psd_bus_error; name:Pchar):longint;cdecl;external libsystemd;
function sd_bus_error_has_names_sentinel(e:Psd_bus_error; args:array of const):longint;cdecl;external libsystemd;
function sd_bus_error_has_names_sentinel(e:Psd_bus_error):longint;cdecl;external libsystemd;
function sd_bus_error_add_map(map:Psd_bus_error_map):longint;cdecl;external libsystemd;
{ Auxiliary macros  }
{ Label escaping  }
function sd_bus_path_encode(prefix:Pchar; external_id:Pchar; ret_path:PPchar):longint;cdecl;external libsystemd;
function sd_bus_path_encode_many(out:PPchar; path_template:Pchar; args:array of const):longint;cdecl;external libsystemd;
function sd_bus_path_encode_many(out:PPchar; path_template:Pchar):longint;cdecl;external libsystemd;
function sd_bus_path_decode(path:Pchar; prefix:Pchar; ret_external_id:PPchar):longint;cdecl;external libsystemd;
function sd_bus_path_decode_many(path:Pchar; path_template:Pchar; args:array of const):longint;cdecl;external libsystemd;
function sd_bus_path_decode_many(path:Pchar; path_template:Pchar):longint;cdecl;external libsystemd;
{ Tracking peers  }
function sd_bus_track_new(bus:Psd_bus; track:PPsd_bus_track; handler:Tsd_bus_track_handler_t; userdata:pointer):longint;cdecl;external libsystemd;
function sd_bus_track_ref(track:Psd_bus_track):Psd_bus_track;cdecl;external libsystemd;
function sd_bus_track_unref(track:Psd_bus_track):Psd_bus_track;cdecl;external libsystemd;
function sd_bus_track_get_bus(track:Psd_bus_track):Psd_bus;cdecl;external libsystemd;
function sd_bus_track_get_userdata(track:Psd_bus_track):pointer;cdecl;external libsystemd;
function sd_bus_track_set_userdata(track:Psd_bus_track; userdata:pointer):pointer;cdecl;external libsystemd;
function sd_bus_track_add_sender(track:Psd_bus_track; m:Psd_bus_message):longint;cdecl;external libsystemd;
function sd_bus_track_remove_sender(track:Psd_bus_track; m:Psd_bus_message):longint;cdecl;external libsystemd;
function sd_bus_track_add_name(track:Psd_bus_track; name:Pchar):longint;cdecl;external libsystemd;
function sd_bus_track_remove_name(track:Psd_bus_track; name:Pchar):longint;cdecl;external libsystemd;
function sd_bus_track_set_recursive(track:Psd_bus_track; b:longint):longint;cdecl;external libsystemd;
function sd_bus_track_get_recursive(track:Psd_bus_track):longint;cdecl;external libsystemd;
function sd_bus_track_count(track:Psd_bus_track):dword;cdecl;external libsystemd;
function sd_bus_track_count_sender(track:Psd_bus_track; m:Psd_bus_message):longint;cdecl;external libsystemd;
function sd_bus_track_count_name(track:Psd_bus_track; name:Pchar):longint;cdecl;external libsystemd;
function sd_bus_track_contains(track:Psd_bus_track; name:Pchar):Pchar;cdecl;external libsystemd;
function sd_bus_track_first(track:Psd_bus_track):Pchar;cdecl;external libsystemd;
function sd_bus_track_next(track:Psd_bus_track):Pchar;cdecl;external libsystemd;
function sd_bus_track_set_destroy_callback(s:Psd_bus_track; callback:Tsd_bus_destroy_t):longint;cdecl;external libsystemd;
function sd_bus_track_get_destroy_callback(s:Psd_bus_track; ret:Psd_bus_destroy_t):longint;cdecl;external libsystemd;
{ Define helpers so that __attribute__((cleanup(sd_bus_unrefp))) and similar may be used.  }
{
_SD_DEFINE_POINTER_CLEANUP_FUNC(sd_bus, sd_bus_unref);
_SD_DEFINE_POINTER_CLEANUP_FUNC(sd_bus, sd_bus_close_unref);
_SD_DEFINE_POINTER_CLEANUP_FUNC(sd_bus, sd_bus_flush_close_unref);
_SD_DEFINE_POINTER_CLEANUP_FUNC(sd_bus_slot, sd_bus_slot_unref);
_SD_DEFINE_POINTER_CLEANUP_FUNC(sd_bus_message, sd_bus_message_unref);
_SD_DEFINE_POINTER_CLEANUP_FUNC(sd_bus_creds, sd_bus_creds_unref);
_SD_DEFINE_POINTER_CLEANUP_FUNC(sd_bus_track, sd_bus_track_unref);
 }
{$endif}

// === Konventiert am: 16-7-25 19:03:29 ===


implementation


{ was #define dname def_expr }
function SD_BUS_DEFAULT : Psd_bus;
  begin
    SD_BUS_DEFAULT:=Psd_bus(1);
  end;

{ was #define dname def_expr }
function SD_BUS_DEFAULT_USER : Psd_bus;
  begin
    SD_BUS_DEFAULT_USER:=Psd_bus(2);
  end;

{ was #define dname def_expr }
function SD_BUS_DEFAULT_SYSTEM : Psd_bus;
  begin
    SD_BUS_DEFAULT_SYSTEM:=Psd_bus(3);
  end;


end.
