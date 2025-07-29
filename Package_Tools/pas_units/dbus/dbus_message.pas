unit dbus_message;

interface

uses
  fp_dbus, lib_dbus_arch_deps, dbus_types, dbus_errors, dbus_memory;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PDBusMessage = type Pointer;

  TDBusMessageIter = record
    dummy1: pointer;
    dummy2: pointer;
    dummy3: Tdbus_uint32_t;
    dummy4: longint;
    dummy5: longint;
    dummy6: longint;
    dummy7: longint;
    dummy8: longint;
    dummy9: longint;
    dummy10: longint;
    dummy11: longint;
    pad1: longint;
    pad2: pointer;
    pad3: pointer;
  end;
  PDBusMessageIter = ^TDBusMessageIter;

const
  DBUS_MESSAGE_ITER_INIT_CLOSED_: TDBusMessageIter = (
    dummy1: nil;
    dummy2: nil;
    dummy3: 0;
    dummy4: 0;
    dummy5: 0;
    dummy6: 0;
    dummy7: 0;
    dummy8: 0;
    dummy9: 0;
    dummy10: 0;
    dummy11: 0;
    pad1: 0;
    pad2: nil;
    pad3: nil);

function dbus_message_new(message_type: longint): PDBusMessage; cdecl; external libdbus_1;
function dbus_message_new_method_call(bus_name: pchar; path: pchar; iface: pchar; method: pchar): PDBusMessage; cdecl; external libdbus_1;
function dbus_message_new_method_return(method_call: PDBusMessage): PDBusMessage; cdecl; external libdbus_1;
function dbus_message_new_signal(path: pchar; iface: pchar; name: pchar): PDBusMessage; cdecl; external libdbus_1;
function dbus_message_new_error(reply_to: PDBusMessage; error_name: pchar; error_message: pchar): PDBusMessage; cdecl; external libdbus_1;
function dbus_message_new_error_printf(reply_to: PDBusMessage; error_name: pchar; error_format: pchar; args: array of const): PDBusMessage; cdecl; external libdbus_1;
function dbus_message_new_error_printf(reply_to: PDBusMessage; error_name: pchar; error_format: pchar): PDBusMessage; cdecl; external libdbus_1;
function dbus_message_copy(message: PDBusMessage): PDBusMessage; cdecl; external libdbus_1;
function dbus_message_ref(message: PDBusMessage): PDBusMessage; cdecl; external libdbus_1;
procedure dbus_message_unref(message: PDBusMessage); cdecl; external libdbus_1;
function dbus_message_get_type(message: PDBusMessage): longint; cdecl; external libdbus_1;
function dbus_message_set_path(message: PDBusMessage; object_path: pchar): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_get_path(message: PDBusMessage): pchar; cdecl; external libdbus_1;
function dbus_message_has_path(message: PDBusMessage; object_path: pchar): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_set_interface(message: PDBusMessage; iface: pchar): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_get_interface(message: PDBusMessage): pchar; cdecl; external libdbus_1;
function dbus_message_has_interface(message: PDBusMessage; iface: pchar): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_set_member(message: PDBusMessage; member: pchar): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_get_member(message: PDBusMessage): pchar; cdecl; external libdbus_1;
function dbus_message_has_member(message: PDBusMessage; member: pchar): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_set_error_name(message: PDBusMessage; name: pchar): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_get_error_name(message: PDBusMessage): pchar; cdecl; external libdbus_1;
function dbus_message_set_destination(message: PDBusMessage; destination: pchar): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_get_destination(message: PDBusMessage): pchar; cdecl; external libdbus_1;
function dbus_message_set_sender(message: PDBusMessage; sender: pchar): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_get_sender(message: PDBusMessage): pchar; cdecl; external libdbus_1;
function dbus_message_get_signature(message: PDBusMessage): pchar; cdecl; external libdbus_1;
procedure dbus_message_set_no_reply(message: PDBusMessage; no_reply: Tdbus_bool_t); cdecl; external libdbus_1;
function dbus_message_get_no_reply(message: PDBusMessage): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_is_method_call(message: PDBusMessage; iface: pchar; method: pchar): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_is_signal(message: PDBusMessage; iface: pchar; signal_name: pchar): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_is_error(message: PDBusMessage; error_name: pchar): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_has_destination(message: PDBusMessage; bus_name: pchar): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_has_sender(message: PDBusMessage; unique_bus_name: pchar): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_has_signature(message: PDBusMessage; signature: pchar): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_get_serial(message: PDBusMessage): Tdbus_uint32_t; cdecl; external libdbus_1;
procedure dbus_message_set_serial(message: PDBusMessage; serial: Tdbus_uint32_t); cdecl; external libdbus_1;
function dbus_message_set_reply_serial(message: PDBusMessage; reply_serial: Tdbus_uint32_t): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_get_reply_serial(message: PDBusMessage): Tdbus_uint32_t; cdecl; external libdbus_1;
procedure dbus_message_set_auto_start(message: PDBusMessage; auto_start: Tdbus_bool_t); cdecl; external libdbus_1;
function dbus_message_get_auto_start(message: PDBusMessage): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_get_path_decomposed(message: PDBusMessage; path: PPPchar): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_get_container_instance(message: PDBusMessage): pchar; cdecl; external libdbus_1;
function dbus_message_set_container_instance(message: PDBusMessage; object_path: pchar): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_append_args(message: PDBusMessage; first_arg_type: longint): Tdbus_bool_t; cdecl; varargs; external libdbus_1;
function dbus_message_append_args_valist(message: PDBusMessage; first_arg_type: longint; var_args: Tva_list): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_get_args(message: PDBusMessage; error: PDBusError; first_arg_type: longint): Tdbus_bool_t; cdecl; varargs; external libdbus_1;
function dbus_message_get_args_valist(message: PDBusMessage; error: PDBusError; first_arg_type: longint; var_args: Tva_list): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_contains_unix_fds(message: PDBusMessage): Tdbus_bool_t; cdecl; external libdbus_1;
procedure dbus_message_iter_init_closed(iter: PDBusMessageIter); cdecl; external libdbus_1;
function dbus_message_iter_init(message: PDBusMessage; iter: PDBusMessageIter): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_iter_has_next(iter: PDBusMessageIter): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_iter_next(iter: PDBusMessageIter): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_iter_get_signature(iter: PDBusMessageIter): pchar; cdecl; external libdbus_1;
function dbus_message_iter_get_arg_type(iter: PDBusMessageIter): longint; cdecl; external libdbus_1;
function dbus_message_iter_get_element_type(iter: PDBusMessageIter): longint; cdecl; external libdbus_1;
procedure dbus_message_iter_recurse(iter: PDBusMessageIter; sub: PDBusMessageIter); cdecl; external libdbus_1;
procedure dbus_message_iter_get_basic(iter: PDBusMessageIter; value: pointer); cdecl; external libdbus_1;
function dbus_message_iter_get_element_count(iter: PDBusMessageIter): longint; cdecl; external libdbus_1;
function dbus_message_iter_get_array_len(iter: PDBusMessageIter): longint; cdecl; external libdbus_1; deprecated;
procedure dbus_message_iter_get_fixed_array(iter: PDBusMessageIter; value: pointer; n_elements: Plongint); cdecl; external libdbus_1;
procedure dbus_message_iter_init_append(message: PDBusMessage; iter: PDBusMessageIter); cdecl; external libdbus_1;
function dbus_message_iter_append_basic(iter: PDBusMessageIter; _type: longint; value: pointer): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_iter_append_fixed_array(iter: PDBusMessageIter; element_type: longint; value: pointer; n_elements: longint): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_iter_open_container(iter: PDBusMessageIter; _type: longint; contained_signature: pchar; sub: PDBusMessageIter): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_iter_close_container(iter: PDBusMessageIter; sub: PDBusMessageIter): Tdbus_bool_t; cdecl; external libdbus_1;
procedure dbus_message_iter_abandon_container(iter: PDBusMessageIter; sub: PDBusMessageIter); cdecl; external libdbus_1;
procedure dbus_message_iter_abandon_container_if_open(iter: PDBusMessageIter; sub: PDBusMessageIter); cdecl; external libdbus_1;
procedure dbus_message_lock(message: PDBusMessage); cdecl; external libdbus_1;
function dbus_set_error_from_message(error: PDBusError; message: PDBusMessage): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_allocate_data_slot(slot_p: Pdbus_int32_t): Tdbus_bool_t; cdecl; external libdbus_1;
procedure dbus_message_free_data_slot(slot_p: Pdbus_int32_t); cdecl; external libdbus_1;
function dbus_message_set_data(message: PDBusMessage; slot: Tdbus_int32_t; data: pointer; free_data_func: TDBusFreeFunction): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_get_data(message: PDBusMessage; slot: Tdbus_int32_t): pointer; cdecl; external libdbus_1;
function dbus_message_type_from_string(type_str: pchar): longint; cdecl; external libdbus_1;
function dbus_message_type_to_string(_type: longint): pchar; cdecl; external libdbus_1;
function dbus_message_marshal(msg: PDBusMessage; marshalled_data_p: PPchar; len_p: Plongint): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_message_demarshal(str: pchar; len: longint; error: PDBusError): PDBusMessage; cdecl; external libdbus_1;
function dbus_message_demarshal_bytes_needed(str: pchar; len: longint): longint; cdecl; external libdbus_1;
procedure dbus_message_set_allow_interactive_authorization(message: PDBusMessage; allow: Tdbus_bool_t); cdecl; external libdbus_1;
function dbus_message_get_allow_interactive_authorization(message: PDBusMessage): Tdbus_bool_t; cdecl; external libdbus_1;

// === Konventiert am: 29-7-25 15:07:07 ===


implementation



end.
