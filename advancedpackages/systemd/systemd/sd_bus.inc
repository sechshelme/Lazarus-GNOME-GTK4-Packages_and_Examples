{$IFDEF read_interface}

type
  Psd_event = type Pointer;
  PPsd_event = ^Psd_event;

  Psd_bus = type Pointer;
  PPsd_bus = ^Psd_bus;
  Psd_bus_message = type Pointer;
  PPsd_bus_message = ^Psd_bus_message;
  Psd_bus_slot = type Pointer;
  PPsd_bus_slot = ^Psd_bus_slot;
  Psd_bus_creds = type Pointer;
  PPsd_bus_creds = ^Psd_bus_creds;
  Psd_bus_track = type Pointer;
  PPsd_bus_track = ^Psd_bus_track;

const
  SD_BUS_DEFAULT_ = Psd_bus(1);
  SD_BUS_DEFAULT_USER_ = Psd_bus(2);
  SD_BUS_DEFAULT_SYSTEM_ = Psd_bus(3);

type
  Tsd_bus_error = record
    name: pchar;
    message: pchar;
    _need_free: longint;
  end;
  Psd_bus_error = ^Tsd_bus_error;

  Tsd_bus_error_map = record
    name: pchar;
    code: longint;
  end;
  Psd_bus_error_map = ^Tsd_bus_error_map;

const
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
  _SD_BUS_CREDS_ALL = (1 shl 34) - 1;

const
  SD_BUS_NAME_REPLACE_EXISTING = 1 shl 0;
  SD_BUS_NAME_ALLOW_REPLACEMENT = 1 shl 1;
  SD_BUS_NAME_QUEUE = 1 shl 2;

const
  SD_BUS_MESSAGE_DUMP_WITH_HEADER = 1 shl 0;
  SD_BUS_MESSAGE_DUMP_SUBTREE_ONLY = 1 shl 1;
  _SD_BUS_MESSAGE_DUMP_KNOWN_FLAGS = SD_BUS_MESSAGE_DUMP_WITH_HEADER or SD_BUS_MESSAGE_DUMP_SUBTREE_ONLY;

type
  Tsd_bus_message_handler_t = function(m: Psd_bus_message; userdata: pointer; ret_error: Psd_bus_error): longint; cdecl;
  Tsd_bus_property_get_t = function(bus: Psd_bus; path: pchar; iface: pchar; _property: pchar; reply: Psd_bus_message; userdata: pointer; ret_error: Psd_bus_error): longint; cdecl;
  Tsd_bus_property_set_t = function(bus: Psd_bus; path: pchar; iface: pchar; _property: pchar; value: Psd_bus_message; userdata: pointer; ret_error: Psd_bus_error): longint; cdecl;
  Tsd_bus_object_find_t = function(bus: Psd_bus; path: pchar; iface: pchar; userdata: pointer; ret_found: Ppointer; ret_error: Psd_bus_error): longint; cdecl;
  Tsd_bus_node_enumerator_t = function(bus: Psd_bus; prefix: pchar; userdata: pointer; ret_nodes: PPPchar; ret_error: Psd_bus_error): longint; cdecl;
  Tsd_bus_track_handler_t = function(track: Psd_bus_track; userdata: pointer): longint; cdecl;

  Tsd_bus_destroy_t = Tsd_destroy_t;
  Psd_bus_destroy_t = Psd_destroy_t;

type
  Psd_bus_vtable = ^Tsd_bus_vtable;
  Tsd_bus_vtable = bitpacked record
      type_: AnsiChar;
      flags: 0..1 shl (64 - 8) - 1;
      case Integer of
        0: (start: record
              element_size: Tsize_t;
              features: UInt64;
              vtable_format_reference: ^UInt32;
            end);
        1: ( _end: record
               _reserved: Tsize_t;
             end);
        2: (method: record
              member: PAnsiChar;
              signature: PAnsiChar;
              result_: PAnsiChar;
              handler: Tsd_bus_message_handler_t;
              offset: Tsize_t;
              names: PAnsiChar;
            end);
        3: (signal: record
              member: PAnsiChar;
              signature: PAnsiChar;
              names: PAnsiChar;
            end);
        4: (property_: record
              member: PAnsiChar;
              signature: PAnsiChar;
              get_: Tsd_bus_property_get_t;
              set_: Tsd_bus_property_set_t;
              offset: Tsize_t;
            end);
    end;

function sd_bus_interface_name_is_valid(p: pchar): longint; cdecl; external libsystemd;
function sd_bus_service_name_is_valid(p: pchar): longint; cdecl; external libsystemd;
function sd_bus_member_name_is_valid(p: pchar): longint; cdecl; external libsystemd;
function sd_bus_object_path_is_valid(p: pchar): longint; cdecl; external libsystemd;
function sd_bus_default(ret: PPsd_bus): longint; cdecl; external libsystemd;
function sd_bus_default_user(ret: PPsd_bus): longint; cdecl; external libsystemd;
function sd_bus_default_system(ret: PPsd_bus): longint; cdecl; external libsystemd;
function sd_bus_open(ret: PPsd_bus): longint; cdecl; external libsystemd;
function sd_bus_open_with_description(ret: PPsd_bus; description: pchar): longint; cdecl; external libsystemd;
function sd_bus_open_user(ret: PPsd_bus): longint; cdecl; external libsystemd;
function sd_bus_open_user_with_description(ret: PPsd_bus; description: pchar): longint; cdecl; external libsystemd;
function sd_bus_open_user_machine(ret: PPsd_bus; machine: pchar): longint; cdecl; external libsystemd;
function sd_bus_open_system(ret: PPsd_bus): longint; cdecl; external libsystemd;
function sd_bus_open_system_with_description(ret: PPsd_bus; description: pchar): longint; cdecl; external libsystemd;
function sd_bus_open_system_remote(ret: PPsd_bus; host: pchar): longint; cdecl; external libsystemd;
function sd_bus_open_system_machine(ret: PPsd_bus; machine: pchar): longint; cdecl; external libsystemd;
function sd_bus_new(ret: PPsd_bus): longint; cdecl; external libsystemd;
function sd_bus_set_address(bus: Psd_bus; address: pchar): longint; cdecl; external libsystemd;
function sd_bus_set_fd(bus: Psd_bus; input_fd: longint; output_fd: longint): longint; cdecl; external libsystemd;
function sd_bus_set_exec(bus: Psd_bus; path: pchar; argv: PPchar): longint; cdecl; external libsystemd;
function sd_bus_get_address(bus: Psd_bus; address: PPchar): longint; cdecl; external libsystemd;
function sd_bus_set_bus_client(bus: Psd_bus; b: longint): longint; cdecl; external libsystemd;
function sd_bus_is_bus_client(bus: Psd_bus): longint; cdecl; external libsystemd;
function sd_bus_set_server(bus: Psd_bus; b: longint; bus_id: Tsd_id128_t): longint; cdecl; external libsystemd;
function sd_bus_is_server(bus: Psd_bus): longint; cdecl; external libsystemd;
function sd_bus_set_anonymous(bus: Psd_bus; b: longint): longint; cdecl; external libsystemd;
function sd_bus_is_anonymous(bus: Psd_bus): longint; cdecl; external libsystemd;
function sd_bus_set_trusted(bus: Psd_bus; b: longint): longint; cdecl; external libsystemd;
function sd_bus_is_trusted(bus: Psd_bus): longint; cdecl; external libsystemd;
function sd_bus_set_monitor(bus: Psd_bus; b: longint): longint; cdecl; external libsystemd;
function sd_bus_is_monitor(bus: Psd_bus): longint; cdecl; external libsystemd;
function sd_bus_set_description(bus: Psd_bus; description: pchar): longint; cdecl; external libsystemd;
function sd_bus_get_description(bus: Psd_bus; description: PPchar): longint; cdecl; external libsystemd;
function sd_bus_negotiate_creds(bus: Psd_bus; b: longint; creds_mask: uint64): longint; cdecl; external libsystemd;
function sd_bus_negotiate_timestamp(bus: Psd_bus; b: longint): longint; cdecl; external libsystemd;
function sd_bus_negotiate_fds(bus: Psd_bus; b: longint): longint; cdecl; external libsystemd;
function sd_bus_can_send(bus: Psd_bus; _type: char): longint; cdecl; external libsystemd;
function sd_bus_get_creds_mask(bus: Psd_bus; creds_mask: Puint64): longint; cdecl; external libsystemd;
function sd_bus_set_allow_interactive_authorization(bus: Psd_bus; b: longint): longint; cdecl; external libsystemd;
function sd_bus_get_allow_interactive_authorization(bus: Psd_bus): longint; cdecl; external libsystemd;
function sd_bus_set_exit_on_disconnect(bus: Psd_bus; b: longint): longint; cdecl; external libsystemd;
function sd_bus_get_exit_on_disconnect(bus: Psd_bus): longint; cdecl; external libsystemd;
function sd_bus_set_close_on_exit(bus: Psd_bus; b: longint): longint; cdecl; external libsystemd;
function sd_bus_get_close_on_exit(bus: Psd_bus): longint; cdecl; external libsystemd;
function sd_bus_set_watch_bind(bus: Psd_bus; b: longint): longint; cdecl; external libsystemd;
function sd_bus_get_watch_bind(bus: Psd_bus): longint; cdecl; external libsystemd;
function sd_bus_set_connected_signal(bus: Psd_bus; b: longint): longint; cdecl; external libsystemd;
function sd_bus_get_connected_signal(bus: Psd_bus): longint; cdecl; external libsystemd;
function sd_bus_set_sender(bus: Psd_bus; sender: pchar): longint; cdecl; external libsystemd;
function sd_bus_get_sender(bus: Psd_bus; ret: PPchar): longint; cdecl; external libsystemd;
function sd_bus_start(bus: Psd_bus): longint; cdecl; external libsystemd;
function sd_bus_try_close(bus: Psd_bus): longint; cdecl; external libsystemd; deprecated;
procedure sd_bus_close(bus: Psd_bus); cdecl; external libsystemd;
function sd_bus_ref(bus: Psd_bus): Psd_bus; cdecl; external libsystemd;
function sd_bus_unref(bus: Psd_bus): Psd_bus; cdecl; external libsystemd;
function sd_bus_close_unref(bus: Psd_bus): Psd_bus; cdecl; external libsystemd;
function sd_bus_flush_close_unref(bus: Psd_bus): Psd_bus; cdecl; external libsystemd;
procedure sd_bus_default_flush_close; cdecl; external libsystemd;
function sd_bus_is_open(bus: Psd_bus): longint; cdecl; external libsystemd;
function sd_bus_is_ready(bus: Psd_bus): longint; cdecl; external libsystemd;
function sd_bus_get_bus_id(bus: Psd_bus; id: Psd_id128_t): longint; cdecl; external libsystemd;
function sd_bus_get_scope(bus: Psd_bus; scope: PPchar): longint; cdecl; external libsystemd;
function sd_bus_get_tid(bus: Psd_bus; tid: Ppid_t): longint; cdecl; external libsystemd;
function sd_bus_get_owner_creds(bus: Psd_bus; creds_mask: uint64; ret: PPsd_bus_creds): longint; cdecl; external libsystemd;
function sd_bus_send(bus: Psd_bus; m: Psd_bus_message; cookie: Puint64): longint; cdecl; external libsystemd;
function sd_bus_send_to(bus: Psd_bus; m: Psd_bus_message; destination: pchar; cookie: Puint64): longint; cdecl; external libsystemd;
function sd_bus_call(bus: Psd_bus; m: Psd_bus_message; usec: uint64; ret_error: Psd_bus_error; reply: PPsd_bus_message): longint; cdecl; external libsystemd;
function sd_bus_call_async(bus: Psd_bus; slot: PPsd_bus_slot; m: Psd_bus_message; callback: Tsd_bus_message_handler_t; userdata: pointer; usec: uint64): longint; cdecl; external libsystemd;
function sd_bus_get_fd(bus: Psd_bus): longint; cdecl; external libsystemd;
function sd_bus_get_events(bus: Psd_bus): longint; cdecl; external libsystemd;
function sd_bus_get_timeout(bus: Psd_bus; timeout_usec: Puint64): longint; cdecl; external libsystemd;
function sd_bus_process(bus: Psd_bus; r: PPsd_bus_message): longint; cdecl; external libsystemd;
function sd_bus_process_priority(bus: Psd_bus; max_priority: int64; r: PPsd_bus_message): longint; cdecl; external libsystemd; deprecated;
function sd_bus_wait(bus: Psd_bus; timeout_usec: uint64): longint; cdecl; external libsystemd;
function sd_bus_flush(bus: Psd_bus): longint; cdecl; external libsystemd;
function sd_bus_enqueue_for_read(bus: Psd_bus; m: Psd_bus_message): longint; cdecl; external libsystemd;
function sd_bus_get_current_slot(bus: Psd_bus): Psd_bus_slot; cdecl; external libsystemd;
function sd_bus_get_current_message(bus: Psd_bus): Psd_bus_message; cdecl; external libsystemd;
function sd_bus_get_current_handler(bus: Psd_bus): Tsd_bus_message_handler_t; cdecl; external libsystemd;
function sd_bus_get_current_userdata(bus: Psd_bus): pointer; cdecl; external libsystemd;
function sd_bus_attach_event(bus: Psd_bus; e: Psd_event; priority: longint): longint; cdecl; external libsystemd;
function sd_bus_detach_event(bus: Psd_bus): longint; cdecl; external libsystemd;
function sd_bus_get_event(bus: Psd_bus): Psd_event; cdecl; external libsystemd;
function sd_bus_get_n_queued_read(bus: Psd_bus; ret: Puint64): longint; cdecl; external libsystemd;
function sd_bus_get_n_queued_write(bus: Psd_bus; ret: Puint64): longint; cdecl; external libsystemd;
function sd_bus_set_method_call_timeout(bus: Psd_bus; usec: uint64): longint; cdecl; external libsystemd;
function sd_bus_get_method_call_timeout(bus: Psd_bus; ret: Puint64): longint; cdecl; external libsystemd;
function sd_bus_add_filter(bus: Psd_bus; slot: PPsd_bus_slot; callback: Tsd_bus_message_handler_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_bus_add_match(bus: Psd_bus; slot: PPsd_bus_slot; match: pchar; callback: Tsd_bus_message_handler_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_bus_add_match_async(bus: Psd_bus; slot: PPsd_bus_slot; match: pchar; callback: Tsd_bus_message_handler_t; install_callback: Tsd_bus_message_handler_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_bus_add_object(bus: Psd_bus; slot: PPsd_bus_slot; path: pchar; callback: Tsd_bus_message_handler_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_bus_add_fallback(bus: Psd_bus; slot: PPsd_bus_slot; prefix: pchar; callback: Tsd_bus_message_handler_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_bus_add_object_vtable(bus: Psd_bus; slot: PPsd_bus_slot; path: pchar; iface: pchar; vtable: Psd_bus_vtable; userdata: pointer): longint; cdecl; external libsystemd;
function sd_bus_add_fallback_vtable(bus: Psd_bus; slot: PPsd_bus_slot; prefix: pchar; iface: pchar; vtable: Psd_bus_vtable; find: Tsd_bus_object_find_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_bus_add_node_enumerator(bus: Psd_bus; slot: PPsd_bus_slot; path: pchar; callback: Tsd_bus_node_enumerator_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_bus_add_object_manager(bus: Psd_bus; slot: PPsd_bus_slot; path: pchar): longint; cdecl; external libsystemd;
function sd_bus_slot_ref(slot: Psd_bus_slot): Psd_bus_slot; cdecl; external libsystemd;
function sd_bus_slot_unref(slot: Psd_bus_slot): Psd_bus_slot; cdecl; external libsystemd;
function sd_bus_slot_get_bus(slot: Psd_bus_slot): Psd_bus; cdecl; external libsystemd;
function sd_bus_slot_get_userdata(slot: Psd_bus_slot): pointer; cdecl; external libsystemd;
function sd_bus_slot_set_userdata(slot: Psd_bus_slot; userdata: pointer): pointer; cdecl; external libsystemd;
function sd_bus_slot_set_description(slot: Psd_bus_slot; description: pchar): longint; cdecl; external libsystemd;
function sd_bus_slot_get_description(slot: Psd_bus_slot; description: PPchar): longint; cdecl; external libsystemd;
function sd_bus_slot_get_floating(slot: Psd_bus_slot): longint; cdecl; external libsystemd;
function sd_bus_slot_set_floating(slot: Psd_bus_slot; b: longint): longint; cdecl; external libsystemd;
function sd_bus_slot_set_destroy_callback(s: Psd_bus_slot; callback: Tsd_bus_destroy_t): longint; cdecl; external libsystemd;
function sd_bus_slot_get_destroy_callback(s: Psd_bus_slot; callback: Psd_bus_destroy_t): longint; cdecl; external libsystemd;
function sd_bus_slot_get_current_message(slot: Psd_bus_slot): Psd_bus_message; cdecl; external libsystemd;
function sd_bus_slot_get_current_handler(slot: Psd_bus_slot): Tsd_bus_message_handler_t; cdecl; external libsystemd;
function sd_bus_slot_get_current_userdata(slot: Psd_bus_slot): pointer; cdecl; external libsystemd;
function sd_bus_message_new(bus: Psd_bus; m: PPsd_bus_message; _type: uint8): longint; cdecl; external libsystemd;
function sd_bus_message_new_signal(bus: Psd_bus; m: PPsd_bus_message; path: pchar; iface: pchar; member: pchar): longint; cdecl; external libsystemd;
function sd_bus_message_new_signal_to(bus: Psd_bus; m: PPsd_bus_message; destination: pchar; path: pchar; iface: pchar; member: pchar): longint; cdecl; external libsystemd;
function sd_bus_message_new_method_call(bus: Psd_bus; m: PPsd_bus_message; destination: pchar; path: pchar; iface: pchar; member: pchar): longint; cdecl; external libsystemd;
function sd_bus_message_new_method_return(call: Psd_bus_message; m: PPsd_bus_message): longint; cdecl; external libsystemd;
function sd_bus_message_new_method_error(call: Psd_bus_message; m: PPsd_bus_message; e: Psd_bus_error): longint; cdecl; external libsystemd;
function sd_bus_message_new_method_errorf(call: Psd_bus_message; m: PPsd_bus_message; name: pchar; format: pchar): longint; cdecl; varargs; external libsystemd;
function sd_bus_message_new_method_errno(call: Psd_bus_message; m: PPsd_bus_message; error: longint; e: Psd_bus_error): longint; cdecl; external libsystemd;
function sd_bus_message_new_method_errnof(call: Psd_bus_message; m: PPsd_bus_message; error: longint; format: pchar): longint; cdecl; varargs; external libsystemd;
function sd_bus_message_ref(m: Psd_bus_message): Psd_bus_message; cdecl; external libsystemd;
function sd_bus_message_unref(m: Psd_bus_message): Psd_bus_message; cdecl; external libsystemd;
function sd_bus_message_seal(m: Psd_bus_message; cookie: uint64; timeout_usec: uint64): longint; cdecl; external libsystemd;
function sd_bus_message_get_type(m: Psd_bus_message; _type: Puint8): longint; cdecl; external libsystemd;
function sd_bus_message_get_cookie(m: Psd_bus_message; cookie: Puint64): longint; cdecl; external libsystemd;
function sd_bus_message_get_reply_cookie(m: Psd_bus_message; cookie: Puint64): longint; cdecl; external libsystemd;
function sd_bus_message_get_priority(m: Psd_bus_message; priority: Pint64): longint; cdecl; external libsystemd; deprecated;
function sd_bus_message_get_expect_reply(m: Psd_bus_message): longint; cdecl; external libsystemd;
function sd_bus_message_get_auto_start(m: Psd_bus_message): longint; cdecl; external libsystemd;
function sd_bus_message_get_allow_interactive_authorization(m: Psd_bus_message): longint; cdecl; external libsystemd;
function sd_bus_message_get_signature(m: Psd_bus_message; complete: longint): pchar; cdecl; external libsystemd;
function sd_bus_message_get_path(m: Psd_bus_message): pchar; cdecl; external libsystemd;
function sd_bus_message_get_interface(m: Psd_bus_message): pchar; cdecl; external libsystemd;
function sd_bus_message_get_member(m: Psd_bus_message): pchar; cdecl; external libsystemd;
function sd_bus_message_get_destination(m: Psd_bus_message): pchar; cdecl; external libsystemd;
function sd_bus_message_get_sender(m: Psd_bus_message): pchar; cdecl; external libsystemd;
function sd_bus_message_get_error(m: Psd_bus_message): Psd_bus_error; cdecl; external libsystemd;
function sd_bus_message_get_errno(m: Psd_bus_message): longint; cdecl; external libsystemd;
function sd_bus_message_get_monotonic_usec(m: Psd_bus_message; usec: Puint64): longint; cdecl; external libsystemd;
function sd_bus_message_get_realtime_usec(m: Psd_bus_message; usec: Puint64): longint; cdecl; external libsystemd;
function sd_bus_message_get_seqnum(m: Psd_bus_message; seqnum: Puint64): longint; cdecl; external libsystemd;
function sd_bus_message_get_bus(m: Psd_bus_message): Psd_bus; cdecl; external libsystemd;
function sd_bus_message_get_creds(m: Psd_bus_message): Psd_bus_creds; cdecl; external libsystemd;
function sd_bus_message_is_signal(m: Psd_bus_message; iface: pchar; member: pchar): longint; cdecl; external libsystemd;
function sd_bus_message_is_method_call(m: Psd_bus_message; iface: pchar; member: pchar): longint; cdecl; external libsystemd;
function sd_bus_message_is_method_error(m: Psd_bus_message; name: pchar): longint; cdecl; external libsystemd;
function sd_bus_message_is_empty(m: Psd_bus_message): longint; cdecl; external libsystemd;
function sd_bus_message_has_signature(m: Psd_bus_message; signature: pchar): longint; cdecl; external libsystemd;
function sd_bus_message_set_expect_reply(m: Psd_bus_message; b: longint): longint; cdecl; external libsystemd;
function sd_bus_message_set_auto_start(m: Psd_bus_message; b: longint): longint; cdecl; external libsystemd;
function sd_bus_message_set_allow_interactive_authorization(m: Psd_bus_message; b: longint): longint; cdecl; external libsystemd;
function sd_bus_message_set_destination(m: Psd_bus_message; destination: pchar): longint; cdecl; external libsystemd;
function sd_bus_message_set_sender(m: Psd_bus_message; sender: pchar): longint; cdecl; external libsystemd;
function sd_bus_message_set_priority(m: Psd_bus_message; priority: int64): longint; cdecl; external libsystemd; deprecated;
function sd_bus_message_append(m: Psd_bus_message; types: pchar): longint; cdecl; varargs; external libsystemd;
function sd_bus_message_appendv(m: Psd_bus_message; types: pchar; ap: Tva_list): longint; cdecl; external libsystemd;
function sd_bus_message_append_basic(m: Psd_bus_message; _type: char; p: pointer): longint; cdecl; external libsystemd;
function sd_bus_message_append_array(m: Psd_bus_message; _type: char; ptr: pointer; size: Tsize_t): longint; cdecl; external libsystemd;
function sd_bus_message_append_array_space(m: Psd_bus_message; _type: char; size: Tsize_t; ptr: Ppointer): longint; cdecl; external libsystemd;
function sd_bus_message_append_array_iovec(m: Psd_bus_message; _type: char; iov: Piovec; n: dword): longint; cdecl; external libsystemd;
function sd_bus_message_append_array_memfd(m: Psd_bus_message; _type: char; memfd: longint; offset: uint64; size: uint64): longint; cdecl; external libsystemd;
function sd_bus_message_append_string_space(m: Psd_bus_message; size: Tsize_t; s: PPchar): longint; cdecl; external libsystemd;
function sd_bus_message_append_string_iovec(m: Psd_bus_message; iov: Piovec; n: dword): longint; cdecl; external libsystemd;
function sd_bus_message_append_string_memfd(m: Psd_bus_message; memfd: longint; offset: uint64; size: uint64): longint; cdecl; external libsystemd;
function sd_bus_message_append_strv(m: Psd_bus_message; l: PPchar): longint; cdecl; external libsystemd;
function sd_bus_message_open_container(m: Psd_bus_message; _type: char; contents: pchar): longint; cdecl; external libsystemd;
function sd_bus_message_close_container(m: Psd_bus_message): longint; cdecl; external libsystemd;
function sd_bus_message_copy(m: Psd_bus_message; source: Psd_bus_message; all: longint): longint; cdecl; external libsystemd;
function sd_bus_message_read(m: Psd_bus_message; types: pchar): longint; cdecl; varargs; external libsystemd;
function sd_bus_message_readv(m: Psd_bus_message; types: pchar; ap: Tva_list): longint; cdecl; external libsystemd;
function sd_bus_message_read_basic(m: Psd_bus_message; _type: char; p: pointer): longint; cdecl; external libsystemd;
function sd_bus_message_read_array(m: Psd_bus_message; _type: char; ptr: Ppointer; size: Psize_t): longint; cdecl; external libsystemd;
function sd_bus_message_read_strv(m: Psd_bus_message; l: PPPchar): longint; cdecl; external libsystemd;
function sd_bus_message_read_strv_extend(m: Psd_bus_message; l: PPPchar): longint; cdecl; external libsystemd;
function sd_bus_message_skip(m: Psd_bus_message; types: pchar): longint; cdecl; external libsystemd;
function sd_bus_message_enter_container(m: Psd_bus_message; _type: char; contents: pchar): longint; cdecl; external libsystemd;
function sd_bus_message_exit_container(m: Psd_bus_message): longint; cdecl; external libsystemd;
function sd_bus_message_peek_type(m: Psd_bus_message; _type: pchar; contents: PPchar): longint; cdecl; external libsystemd;
function sd_bus_message_verify_type(m: Psd_bus_message; _type: char; contents: pchar): longint; cdecl; external libsystemd;
function sd_bus_message_at_end(m: Psd_bus_message; complete: longint): longint; cdecl; external libsystemd;
function sd_bus_message_rewind(m: Psd_bus_message; complete: longint): longint; cdecl; external libsystemd;
function sd_bus_message_sensitive(m: Psd_bus_message): longint; cdecl; external libsystemd;
function sd_bus_message_dump(m: Psd_bus_message; f: PFILE; flags: uint64): longint; cdecl; external libsystemd;
function sd_bus_get_unique_name(bus: Psd_bus; unique: PPchar): longint; cdecl; external libsystemd;
function sd_bus_request_name(bus: Psd_bus; name: pchar; flags: uint64): longint; cdecl; external libsystemd;
function sd_bus_request_name_async(bus: Psd_bus; ret_slot: PPsd_bus_slot; name: pchar; flags: uint64; callback: Tsd_bus_message_handler_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_bus_release_name(bus: Psd_bus; name: pchar): longint; cdecl; external libsystemd;
function sd_bus_release_name_async(bus: Psd_bus; ret_slot: PPsd_bus_slot; name: pchar; callback: Tsd_bus_message_handler_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_bus_list_names(bus: Psd_bus; acquired: PPPchar; activatable: PPPchar): longint; cdecl; external libsystemd;
function sd_bus_get_name_creds(bus: Psd_bus; name: pchar; mask: uint64; creds: PPsd_bus_creds): longint; cdecl; external libsystemd;
function sd_bus_get_name_machine_id(bus: Psd_bus; name: pchar; machine: Psd_id128_t): longint; cdecl; external libsystemd;
function sd_bus_message_send(m: Psd_bus_message): longint; cdecl; external libsystemd;
function sd_bus_call_methodv(bus: Psd_bus; destination: pchar; path: pchar; iface: pchar; member: pchar; ret_error: Psd_bus_error; reply: PPsd_bus_message; types: pchar; ap: Tva_list): longint; cdecl; external libsystemd;
function sd_bus_call_method(bus: Psd_bus; destination: pchar; path: pchar; iface: pchar; member: pchar; ret_error: Psd_bus_error; reply: PPsd_bus_message; types: pchar): longint; cdecl; varargs; external libsystemd;
function sd_bus_call_method_asyncv(bus: Psd_bus; slot: PPsd_bus_slot; destination: pchar; path: pchar; iface: pchar; member: pchar; callback: Tsd_bus_message_handler_t; userdata: pointer; types: pchar; ap: Tva_list): longint; cdecl; external libsystemd;
function sd_bus_call_method_async(bus: Psd_bus; slot: PPsd_bus_slot; destination: pchar; path: pchar; iface: pchar; member: pchar; callback: Tsd_bus_message_handler_t; userdata: pointer; types: pchar): longint; cdecl; varargs; external libsystemd;
function sd_bus_get_property(bus: Psd_bus; destination: pchar; path: pchar; iface: pchar; member: pchar; ret_error: Psd_bus_error; reply: PPsd_bus_message; _type: pchar): longint; cdecl; external libsystemd;
function sd_bus_get_property_trivial(bus: Psd_bus; destination: pchar; path: pchar; iface: pchar; member: pchar; ret_error: Psd_bus_error; _type: char; ret_ptr: pointer): longint; cdecl; external libsystemd;
function sd_bus_get_property_string(bus: Psd_bus; destination: pchar; path: pchar; iface: pchar; member: pchar; ret_error: Psd_bus_error; ret: PPchar): longint; cdecl; external libsystemd;
function sd_bus_get_property_strv(bus: Psd_bus; destination: pchar; path: pchar; iface: pchar; member: pchar; ret_error: Psd_bus_error; ret: PPPchar): longint; cdecl; external libsystemd;
function sd_bus_set_propertyv(bus: Psd_bus; destination: pchar; path: pchar; iface: pchar; member: pchar; ret_error: Psd_bus_error; _type: pchar; ap: Tva_list): longint; cdecl; external libsystemd;
function sd_bus_set_property(bus: Psd_bus; destination: pchar; path: pchar; iface: pchar; member: pchar; ret_error: Psd_bus_error; _type: pchar): longint; cdecl; varargs; external libsystemd;
function sd_bus_reply_method_returnv(call: Psd_bus_message; types: pchar; ap: Tva_list): longint; cdecl; external libsystemd;
function sd_bus_reply_method_return(call: Psd_bus_message; types: pchar): longint; cdecl; varargs; external libsystemd;
function sd_bus_reply_method_error(call: Psd_bus_message; e: Psd_bus_error): longint; cdecl; external libsystemd;
function sd_bus_reply_method_errorfv(call: Psd_bus_message; name: pchar; format: pchar; ap: Tva_list): longint; cdecl; external libsystemd;
function sd_bus_reply_method_errorf(call: Psd_bus_message; name: pchar; format: pchar): longint; cdecl; varargs; external libsystemd;
function sd_bus_reply_method_errno(call: Psd_bus_message; error: longint; e: Psd_bus_error): longint; cdecl; external libsystemd;
function sd_bus_reply_method_errnofv(call: Psd_bus_message; error: longint; format: pchar; ap: Tva_list): longint; cdecl; external libsystemd;
function sd_bus_reply_method_errnof(call: Psd_bus_message; error: longint; format: pchar): longint; cdecl; varargs; external libsystemd;
function sd_bus_emit_signalv(bus: Psd_bus; path: pchar; iface: pchar; member: pchar; types: pchar; ap: Tva_list): longint; cdecl; external libsystemd;
function sd_bus_emit_signal(bus: Psd_bus; path: pchar; iface: pchar; member: pchar; types: pchar): longint; cdecl; varargs; external libsystemd;
function sd_bus_emit_signal_tov(bus: Psd_bus; destination: pchar; path: pchar; iface: pchar; member: pchar; types: pchar; ap: Tva_list): longint; cdecl; external libsystemd;
function sd_bus_emit_signal_to(bus: Psd_bus; destination: pchar; path: pchar; iface: pchar; member: pchar; types: pchar): longint; cdecl; varargs; external libsystemd;
function sd_bus_emit_properties_changed_strv(bus: Psd_bus; path: pchar; iface: pchar; names: PPchar): longint; cdecl; external libsystemd;
function sd_bus_emit_properties_changed(bus: Psd_bus; path: pchar; iface: pchar; name: pchar): longint; cdecl; varargs; external libsystemd;
function sd_bus_emit_object_added(bus: Psd_bus; path: pchar): longint; cdecl; external libsystemd;
function sd_bus_emit_object_removed(bus: Psd_bus; path: pchar): longint; cdecl; external libsystemd;
function sd_bus_emit_interfaces_added_strv(bus: Psd_bus; path: pchar; interfaces: PPchar): longint; cdecl; external libsystemd;
function sd_bus_emit_interfaces_added(bus: Psd_bus; path: pchar; iface: pchar): longint; cdecl; varargs; external libsystemd;
function sd_bus_emit_interfaces_removed_strv(bus: Psd_bus; path: pchar; interfaces: PPchar): longint; cdecl; external libsystemd;
function sd_bus_emit_interfaces_removed(bus: Psd_bus; path: pchar; iface: pchar): longint; cdecl; varargs; external libsystemd;
function sd_bus_query_sender_creds(m: Psd_bus_message; mask: uint64; creds: PPsd_bus_creds): longint; cdecl; external libsystemd;
function sd_bus_query_sender_privilege(m: Psd_bus_message; capability: longint): longint; cdecl; external libsystemd;
function sd_bus_match_signal(bus: Psd_bus; ret: PPsd_bus_slot; sender: pchar; path: pchar; iface: pchar; member: pchar; callback: Tsd_bus_message_handler_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_bus_match_signal_async(bus: Psd_bus; ret: PPsd_bus_slot; sender: pchar; path: pchar; iface: pchar; member: pchar; match_callback: Tsd_bus_message_handler_t; add_callback: Tsd_bus_message_handler_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_bus_creds_new_from_pid(ret: PPsd_bus_creds; pid: Tpid_t; creds_mask: uint64): longint; cdecl; external libsystemd;
function sd_bus_creds_ref(c: Psd_bus_creds): Psd_bus_creds; cdecl; external libsystemd;
function sd_bus_creds_unref(c: Psd_bus_creds): Psd_bus_creds; cdecl; external libsystemd;
function sd_bus_creds_get_mask(c: Psd_bus_creds): uint64; cdecl; external libsystemd;
function sd_bus_creds_get_augmented_mask(c: Psd_bus_creds): uint64; cdecl; external libsystemd;
function sd_bus_creds_get_pid(c: Psd_bus_creds; pid: Ppid_t): longint; cdecl; external libsystemd;
function sd_bus_creds_get_ppid(c: Psd_bus_creds; ppid: Ppid_t): longint; cdecl; external libsystemd;
function sd_bus_creds_get_tid(c: Psd_bus_creds; tid: Ppid_t): longint; cdecl; external libsystemd;
function sd_bus_creds_get_uid(c: Psd_bus_creds; uid: Puid_t): longint; cdecl; external libsystemd;
function sd_bus_creds_get_euid(c: Psd_bus_creds; euid: Puid_t): longint; cdecl; external libsystemd;
function sd_bus_creds_get_suid(c: Psd_bus_creds; suid: Puid_t): longint; cdecl; external libsystemd;
function sd_bus_creds_get_fsuid(c: Psd_bus_creds; fsuid: Puid_t): longint; cdecl; external libsystemd;
function sd_bus_creds_get_gid(c: Psd_bus_creds; gid: Pgid_t): longint; cdecl; external libsystemd;
function sd_bus_creds_get_egid(c: Psd_bus_creds; egid: Pgid_t): longint; cdecl; external libsystemd;
function sd_bus_creds_get_sgid(c: Psd_bus_creds; sgid: Pgid_t): longint; cdecl; external libsystemd;
function sd_bus_creds_get_fsgid(c: Psd_bus_creds; fsgid: Pgid_t): longint; cdecl; external libsystemd;
function sd_bus_creds_get_supplementary_gids(c: Psd_bus_creds; gids: PPgid_t): longint; cdecl; external libsystemd;
function sd_bus_creds_get_comm(c: Psd_bus_creds; comm: PPchar): longint; cdecl; external libsystemd;
function sd_bus_creds_get_tid_comm(c: Psd_bus_creds; comm: PPchar): longint; cdecl; external libsystemd;
function sd_bus_creds_get_exe(c: Psd_bus_creds; exe: PPchar): longint; cdecl; external libsystemd;
function sd_bus_creds_get_cmdline(c: Psd_bus_creds; cmdline: PPPchar): longint; cdecl; external libsystemd;
function sd_bus_creds_get_cgroup(c: Psd_bus_creds; cgroup: PPchar): longint; cdecl; external libsystemd;
function sd_bus_creds_get_unit(c: Psd_bus_creds; unit_: PPchar): longint; cdecl; external libsystemd;
function sd_bus_creds_get_slice(c: Psd_bus_creds; slice: PPchar): longint; cdecl; external libsystemd;
function sd_bus_creds_get_user_unit(c: Psd_bus_creds; unit_: PPchar): longint; cdecl; external libsystemd;
function sd_bus_creds_get_user_slice(c: Psd_bus_creds; slice: PPchar): longint; cdecl; external libsystemd;
function sd_bus_creds_get_session(c: Psd_bus_creds; session: PPchar): longint; cdecl; external libsystemd;
function sd_bus_creds_get_owner_uid(c: Psd_bus_creds; uid: Puid_t): longint; cdecl; external libsystemd;
function sd_bus_creds_has_effective_cap(c: Psd_bus_creds; capability: longint): longint; cdecl; external libsystemd;
function sd_bus_creds_has_permitted_cap(c: Psd_bus_creds; capability: longint): longint; cdecl; external libsystemd;
function sd_bus_creds_has_inheritable_cap(c: Psd_bus_creds; capability: longint): longint; cdecl; external libsystemd;
function sd_bus_creds_has_bounding_cap(c: Psd_bus_creds; capability: longint): longint; cdecl; external libsystemd;
function sd_bus_creds_get_selinux_context(c: Psd_bus_creds; context: PPchar): longint; cdecl; external libsystemd;
function sd_bus_creds_get_audit_session_id(c: Psd_bus_creds; sessionid: Puint32): longint; cdecl; external libsystemd;
function sd_bus_creds_get_audit_login_uid(c: Psd_bus_creds; loginuid: Puid_t): longint; cdecl; external libsystemd;
function sd_bus_creds_get_tty(c: Psd_bus_creds; tty: PPchar): longint; cdecl; external libsystemd;
function sd_bus_creds_get_unique_name(c: Psd_bus_creds; name: PPchar): longint; cdecl; external libsystemd;
function sd_bus_creds_get_well_known_names(c: Psd_bus_creds; names: PPPchar): longint; cdecl; external libsystemd;
function sd_bus_creds_get_description(c: Psd_bus_creds; name: PPchar): longint; cdecl; external libsystemd;

const
  SD_BUS_ERROR_NULL:Tsd_bus_error =(name: nil;   message: nil;_need_free:0);

procedure sd_bus_error_free(e: Psd_bus_error); cdecl; external libsystemd;
function sd_bus_error_set(e: Psd_bus_error; name: pchar; message: pchar): longint; cdecl; external libsystemd;
function sd_bus_error_setf(e: Psd_bus_error; name: pchar; format: pchar): longint; cdecl; varargs; external libsystemd;
function sd_bus_error_setfv(e: Psd_bus_error; name: pchar; format: pchar; ap: Tva_list): longint; cdecl; external libsystemd;
function sd_bus_error_set_const(e: Psd_bus_error; name: pchar; message: pchar): longint; cdecl; external libsystemd;
function sd_bus_error_set_errno(e: Psd_bus_error; error: longint): longint; cdecl; external libsystemd;
function sd_bus_error_set_errnof(e: Psd_bus_error; error: longint; format: pchar): longint; cdecl; varargs; external libsystemd;
function sd_bus_error_set_errnofv(e: Psd_bus_error; error: longint; format: pchar; ap: Tva_list): longint; cdecl; external libsystemd;
function sd_bus_error_get_errno(e: Psd_bus_error): longint; cdecl; external libsystemd;
function sd_bus_error_copy(dest: Psd_bus_error; e: Psd_bus_error): longint; cdecl; external libsystemd;
function sd_bus_error_move(dest: Psd_bus_error; e: Psd_bus_error): longint; cdecl; external libsystemd;
function sd_bus_error_is_set(e: Psd_bus_error): longint; cdecl; external libsystemd;
function sd_bus_error_has_name(e: Psd_bus_error; name: pchar): longint; cdecl; external libsystemd;
function sd_bus_error_has_names_sentinel(e: Psd_bus_error): longint; cdecl; varargs; external libsystemd;
function sd_bus_error_add_map(map: Psd_bus_error_map): longint; cdecl; external libsystemd;
function sd_bus_path_encode(prefix: pchar; external_id: pchar; ret_path: PPchar): longint; cdecl; external libsystemd;
function sd_bus_path_encode_many(out_: PPchar; path_template: pchar): longint; cdecl; varargs; external libsystemd;
function sd_bus_path_decode(path: pchar; prefix: pchar; ret_external_id: PPchar): longint; cdecl; external libsystemd;
function sd_bus_path_decode_many(path: pchar; path_template: pchar): longint; cdecl; varargs; external libsystemd;
function sd_bus_track_new(bus: Psd_bus; track: PPsd_bus_track; handler: Tsd_bus_track_handler_t; userdata: pointer): longint; cdecl; external libsystemd;
function sd_bus_track_ref(track: Psd_bus_track): Psd_bus_track; cdecl; external libsystemd;
function sd_bus_track_unref(track: Psd_bus_track): Psd_bus_track; cdecl; external libsystemd;
function sd_bus_track_get_bus(track: Psd_bus_track): Psd_bus; cdecl; external libsystemd;
function sd_bus_track_get_userdata(track: Psd_bus_track): pointer; cdecl; external libsystemd;
function sd_bus_track_set_userdata(track: Psd_bus_track; userdata: pointer): pointer; cdecl; external libsystemd;
function sd_bus_track_add_sender(track: Psd_bus_track; m: Psd_bus_message): longint; cdecl; external libsystemd;
function sd_bus_track_remove_sender(track: Psd_bus_track; m: Psd_bus_message): longint; cdecl; external libsystemd;
function sd_bus_track_add_name(track: Psd_bus_track; name: pchar): longint; cdecl; external libsystemd;
function sd_bus_track_remove_name(track: Psd_bus_track; name: pchar): longint; cdecl; external libsystemd;
function sd_bus_track_set_recursive(track: Psd_bus_track; b: longint): longint; cdecl; external libsystemd;
function sd_bus_track_get_recursive(track: Psd_bus_track): longint; cdecl; external libsystemd;
function sd_bus_track_count(track: Psd_bus_track): dword; cdecl; external libsystemd;
function sd_bus_track_count_sender(track: Psd_bus_track; m: Psd_bus_message): longint; cdecl; external libsystemd;
function sd_bus_track_count_name(track: Psd_bus_track; name: pchar): longint; cdecl; external libsystemd;
function sd_bus_track_contains(track: Psd_bus_track; name: pchar): pchar; cdecl; external libsystemd;
function sd_bus_track_first(track: Psd_bus_track): pchar; cdecl; external libsystemd;
function sd_bus_track_next(track: Psd_bus_track): pchar; cdecl; external libsystemd;
function sd_bus_track_set_destroy_callback(s: Psd_bus_track; callback: Tsd_bus_destroy_t): longint; cdecl; external libsystemd;
function sd_bus_track_get_destroy_callback(s: Psd_bus_track; ret: Psd_bus_destroy_t): longint; cdecl; external libsystemd;

// === Konventiert am: 16-7-25 19:03:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
