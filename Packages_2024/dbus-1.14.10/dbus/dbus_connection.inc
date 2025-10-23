{$IFDEF read_interface}


type
  PDBusWatch = type Pointer;
  PDBusTimeout = type Pointer;
  PDBusPreallocatedSend = type Pointer;
  PDBusPendingCall = type Pointer;
  PPDBusPendingCall = ^PDBusPendingCall;
  PDBusConnection = type Pointer;

  PDBusWatchFlags = ^TDBusWatchFlags;
  TDBusWatchFlags = longint;

const
  DBUS_WATCH_READABLE = 1 shl 0;
  DBUS_WATCH_WRITABLE = 1 shl 1;
  DBUS_WATCH_ERROR = 1 shl 2;
  DBUS_WATCH_HANGUP = 1 shl 3;

type
  PDBusDispatchStatus = ^TDBusDispatchStatus;
  TDBusDispatchStatus = longint;

const
  DBUS_DISPATCH_DATA_REMAINS = 0;
  DBUS_DISPATCH_COMPLETE = 1;
  DBUS_DISPATCH_NEED_MEMORY = 2;

type
  TDBusAddWatchFunction = function(watch: PDBusWatch; data: pointer): Tdbus_bool_t; cdecl;
  TDBusWatchToggledFunction = procedure(watch: PDBusWatch; data: pointer); cdecl;
  TDBusRemoveWatchFunction = procedure(watch: PDBusWatch; data: pointer); cdecl;
  TDBusAddTimeoutFunction = function(timeout: PDBusTimeout; data: pointer): Tdbus_bool_t; cdecl;
  TDBusTimeoutToggledFunction = procedure(timeout: PDBusTimeout; data: pointer); cdecl;
  TDBusRemoveTimeoutFunction = procedure(timeout: PDBusTimeout; data: pointer); cdecl;
  TDBusDispatchStatusFunction = procedure(connection: PDBusConnection; new_status: TDBusDispatchStatus; data: pointer); cdecl;
  TDBusWakeupMainFunction = procedure(data: pointer); cdecl;
  TDBusAllowUnixUserFunction = function(connection: PDBusConnection; uid: dword; data: pointer): Tdbus_bool_t; cdecl;
  TDBusAllowWindowsUserFunction = function(connection: PDBusConnection; user_sid: pchar; data: pointer): Tdbus_bool_t; cdecl;
  TDBusPendingCallNotifyFunction = procedure(pending: PDBusPendingCall; user_data: pointer); cdecl;
  TDBusHandleMessageFunction = function(connection: PDBusConnection; message: PDBusMessage; user_data: pointer): TDBusHandlerResult; cdecl;

function dbus_connection_open(address: pchar; error: PDBusError): PDBusConnection; cdecl; external libdbus_1;
function dbus_connection_open_private(address: pchar; error: PDBusError): PDBusConnection; cdecl; external libdbus_1;
function dbus_connection_ref(connection: PDBusConnection): PDBusConnection; cdecl; external libdbus_1;
procedure dbus_connection_unref(connection: PDBusConnection); cdecl; external libdbus_1;
procedure dbus_connection_close(connection: PDBusConnection); cdecl; external libdbus_1;
function dbus_connection_get_is_connected(connection: PDBusConnection): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_connection_get_is_authenticated(connection: PDBusConnection): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_connection_get_is_anonymous(connection: PDBusConnection): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_connection_get_server_id(connection: PDBusConnection): pchar; cdecl; external libdbus_1;
function dbus_connection_can_send_type(connection: PDBusConnection; _type: longint): Tdbus_bool_t; cdecl; external libdbus_1;
procedure dbus_connection_set_exit_on_disconnect(connection: PDBusConnection; exit_on_disconnect: Tdbus_bool_t); cdecl; external libdbus_1;
procedure dbus_connection_flush(connection: PDBusConnection); cdecl; external libdbus_1;
function dbus_connection_read_write_dispatch(connection: PDBusConnection; timeout_milliseconds: longint): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_connection_read_write(connection: PDBusConnection; timeout_milliseconds: longint): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_connection_borrow_message(connection: PDBusConnection): PDBusMessage; cdecl; external libdbus_1;
procedure dbus_connection_return_message(connection: PDBusConnection; message: PDBusMessage); cdecl; external libdbus_1;
procedure dbus_connection_steal_borrowed_message(connection: PDBusConnection; message: PDBusMessage); cdecl; external libdbus_1;
function dbus_connection_pop_message(connection: PDBusConnection): PDBusMessage; cdecl; external libdbus_1;
function dbus_connection_get_dispatch_status(connection: PDBusConnection): TDBusDispatchStatus; cdecl; external libdbus_1;
function dbus_connection_dispatch(connection: PDBusConnection): TDBusDispatchStatus; cdecl; external libdbus_1;
function dbus_connection_has_messages_to_send(connection: PDBusConnection): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_connection_send(connection: PDBusConnection; message: PDBusMessage; client_serial: Pdbus_uint32_t): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_connection_send_with_reply(connection: PDBusConnection; message: PDBusMessage; pending_return: PPDBusPendingCall; timeout_milliseconds: longint): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_connection_send_with_reply_and_block(connection: PDBusConnection; message: PDBusMessage; timeout_milliseconds: longint; error: PDBusError): PDBusMessage; cdecl; external libdbus_1;
function dbus_connection_set_watch_functions(connection: PDBusConnection; add_function: TDBusAddWatchFunction; remove_function: TDBusRemoveWatchFunction; toggled_function: TDBusWatchToggledFunction; data: pointer;
  free_data_function: TDBusFreeFunction): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_connection_set_timeout_functions(connection: PDBusConnection; add_function: TDBusAddTimeoutFunction; remove_function: TDBusRemoveTimeoutFunction; toggled_function: TDBusTimeoutToggledFunction; data: pointer;
  free_data_function: TDBusFreeFunction): Tdbus_bool_t; cdecl; external libdbus_1;
procedure dbus_connection_set_wakeup_main_function(connection: PDBusConnection; wakeup_main_function: TDBusWakeupMainFunction; data: pointer; free_data_function: TDBusFreeFunction); cdecl; external libdbus_1;
procedure dbus_connection_set_dispatch_status_function(connection: PDBusConnection; _function: TDBusDispatchStatusFunction; data: pointer; free_data_function: TDBusFreeFunction); cdecl; external libdbus_1;
function dbus_connection_get_unix_user(connection: PDBusConnection; uid: Pdword): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_connection_get_unix_process_id(connection: PDBusConnection; pid: Pdword): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_connection_get_adt_audit_session_data(connection: PDBusConnection; data: Ppointer; data_size: Pdbus_int32_t): Tdbus_bool_t; cdecl; external libdbus_1;
procedure dbus_connection_set_unix_user_function(connection: PDBusConnection; _function: TDBusAllowUnixUserFunction; data: pointer; free_data_function: TDBusFreeFunction); cdecl; external libdbus_1;
function dbus_connection_get_windows_user(connection: PDBusConnection; windows_sid_p: PPchar): Tdbus_bool_t; cdecl; external libdbus_1;
procedure dbus_connection_set_windows_user_function(connection: PDBusConnection; _function: TDBusAllowWindowsUserFunction; data: pointer; free_data_function: TDBusFreeFunction); cdecl; external libdbus_1;
procedure dbus_connection_set_allow_anonymous(connection: PDBusConnection; value: Tdbus_bool_t); cdecl; external libdbus_1;
procedure dbus_connection_set_route_peer_messages(connection: PDBusConnection; value: Tdbus_bool_t); cdecl; external libdbus_1;
function dbus_connection_add_filter(connection: PDBusConnection; _function: TDBusHandleMessageFunction; user_data: pointer; free_data_function: TDBusFreeFunction): Tdbus_bool_t; cdecl; external libdbus_1;
procedure dbus_connection_remove_filter(connection: PDBusConnection; _function: TDBusHandleMessageFunction; user_data: pointer); cdecl; external libdbus_1;
function dbus_connection_allocate_data_slot(slot_p: Pdbus_int32_t): Tdbus_bool_t; cdecl; external libdbus_1;
procedure dbus_connection_free_data_slot(slot_p: Pdbus_int32_t); cdecl; external libdbus_1;
function dbus_connection_set_data(connection: PDBusConnection; slot: Tdbus_int32_t; data: pointer; free_data_func: TDBusFreeFunction): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_connection_get_data(connection: PDBusConnection; slot: Tdbus_int32_t): pointer; cdecl; external libdbus_1;
procedure dbus_connection_set_change_sigpipe(will_modify_sigpipe: Tdbus_bool_t); cdecl; external libdbus_1;
procedure dbus_connection_set_max_message_size(connection: PDBusConnection; size: longint); cdecl; external libdbus_1;
function dbus_connection_get_max_message_size(connection: PDBusConnection): longint; cdecl; external libdbus_1;
procedure dbus_connection_set_max_received_size(connection: PDBusConnection; size: longint); cdecl; external libdbus_1;
function dbus_connection_get_max_received_size(connection: PDBusConnection): longint; cdecl; external libdbus_1;
procedure dbus_connection_set_max_message_unix_fds(connection: PDBusConnection; n: longint); cdecl; external libdbus_1;
function dbus_connection_get_max_message_unix_fds(connection: PDBusConnection): longint; cdecl; external libdbus_1;
procedure dbus_connection_set_max_received_unix_fds(connection: PDBusConnection; n: longint); cdecl; external libdbus_1;
function dbus_connection_get_max_received_unix_fds(connection: PDBusConnection): longint; cdecl; external libdbus_1;
function dbus_connection_get_outgoing_size(connection: PDBusConnection): longint; cdecl; external libdbus_1;
function dbus_connection_get_outgoing_unix_fds(connection: PDBusConnection): longint; cdecl; external libdbus_1;
function dbus_connection_preallocate_send(connection: PDBusConnection): PDBusPreallocatedSend; cdecl; external libdbus_1;
procedure dbus_connection_free_preallocated_send(connection: PDBusConnection; preallocated: PDBusPreallocatedSend); cdecl; external libdbus_1;
procedure dbus_connection_send_preallocated(connection: PDBusConnection; preallocated: PDBusPreallocatedSend; message: PDBusMessage; client_serial: Pdbus_uint32_t); cdecl; external libdbus_1;

type
  TDBusObjectPathUnregisterFunction = procedure(connection: PDBusConnection; user_data: pointer); cdecl;
  TDBusObjectPathMessageFunction = function(connection: PDBusConnection; message: PDBusMessage; user_data: pointer): TDBusHandlerResult; cdecl;

  TDBusObjectPathVTable = record
    unregister_function: TDBusObjectPathUnregisterFunction;
    message_function: TDBusObjectPathMessageFunction;
    dbus_internal_pad1: procedure(para1: pointer); cdecl;
    dbus_internal_pad2: procedure(para1: pointer); cdecl;
    dbus_internal_pad3: procedure(para1: pointer); cdecl;
    dbus_internal_pad4: procedure(para1: pointer); cdecl;
  end;
  PDBusObjectPathVTable = ^TDBusObjectPathVTable;

function dbus_connection_try_register_object_path(connection: PDBusConnection; path: pchar; vtable: PDBusObjectPathVTable; user_data: pointer; error: PDBusError): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_connection_register_object_path(connection: PDBusConnection; path: pchar; vtable: PDBusObjectPathVTable; user_data: pointer): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_connection_try_register_fallback(connection: PDBusConnection; path: pchar; vtable: PDBusObjectPathVTable; user_data: pointer; error: PDBusError): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_connection_register_fallback(connection: PDBusConnection; path: pchar; vtable: PDBusObjectPathVTable; user_data: pointer): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_connection_unregister_object_path(connection: PDBusConnection; path: pchar): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_connection_get_object_path_data(connection: PDBusConnection; path: pchar; data_p: Ppointer): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_connection_list_registered(connection: PDBusConnection; parent_path: pchar; child_entries: PPPchar): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_connection_get_unix_fd(connection: PDBusConnection; fd: Plongint): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_connection_get_socket(connection: PDBusConnection; fd: Plongint): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_watch_get_fd(watch: PDBusWatch): longint; cdecl; external libdbus_1; deprecated;
function dbus_watch_get_unix_fd(watch: PDBusWatch): longint; cdecl; external libdbus_1;
function dbus_watch_get_socket(watch: PDBusWatch): longint; cdecl; external libdbus_1;
function dbus_watch_get_flags(watch: PDBusWatch): dword; cdecl; external libdbus_1;
function dbus_watch_get_data(watch: PDBusWatch): pointer; cdecl; external libdbus_1;
procedure dbus_watch_set_data(watch: PDBusWatch; data: pointer; free_data_function: TDBusFreeFunction); cdecl; external libdbus_1;
function dbus_watch_handle(watch: PDBusWatch; flags: dword): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_watch_get_enabled(watch: PDBusWatch): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_timeout_get_interval(timeout: PDBusTimeout): longint; cdecl; external libdbus_1;
function dbus_timeout_get_data(timeout: PDBusTimeout): pointer; cdecl; external libdbus_1;
procedure dbus_timeout_set_data(timeout: PDBusTimeout; data: pointer; free_data_function: TDBusFreeFunction); cdecl; external libdbus_1;
function dbus_timeout_handle(timeout: PDBusTimeout): Tdbus_bool_t; cdecl; external libdbus_1;
function dbus_timeout_get_enabled(timeout: PDBusTimeout): Tdbus_bool_t; cdecl; external libdbus_1;

// === Konventiert am: 29-7-25 15:06:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
