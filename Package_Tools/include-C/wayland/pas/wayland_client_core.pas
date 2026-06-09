unit wayland_client_core;

interface

uses
  fp_wayland, wayland_util;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pwl_proxy = type Pointer;
  Pwl_display = type Pointer;
  Pwl_event_queue = type Pointer;

const
  WL_MARSHAL_FLAG_DESTROY = 1 shl 0;

procedure wl_event_queue_destroy(queue: Pwl_event_queue); cdecl; external libwayland_client;
function wl_proxy_marshal_flags(proxy: Pwl_proxy; opcode: Tuint32_t; iface: Pwl_interface; version: Tuint32_t; flags: Tuint32_t): Pwl_proxy; cdecl; varargs; external libwayland_client;
function wl_proxy_marshal_array_flags(proxy: Pwl_proxy; opcode: Tuint32_t; iface: Pwl_interface; version: Tuint32_t; flags: Tuint32_t;
  args: Pwl_argument): Pwl_proxy; cdecl; external libwayland_client;
procedure wl_proxy_marshal(p: Pwl_proxy; opcode: Tuint32_t; args: array of const); cdecl; external libwayland_client;
procedure wl_proxy_marshal(p: Pwl_proxy; opcode: Tuint32_t); cdecl; external libwayland_client;
procedure wl_proxy_marshal_array(p: Pwl_proxy; opcode: Tuint32_t; args: Pwl_argument); cdecl; external libwayland_client;
function wl_proxy_create(factory: Pwl_proxy; iface: Pwl_interface): Pwl_proxy; cdecl; external libwayland_client;
function wl_proxy_create_wrapper(proxy: pointer): pointer; cdecl; external libwayland_client;
procedure wl_proxy_wrapper_destroy(proxy_wrapper: pointer); cdecl; external libwayland_client;
function wl_proxy_marshal_constructor(proxy: Pwl_proxy; opcode: Tuint32_t; iface: Pwl_interface; args: array of const): Pwl_proxy; cdecl; external libwayland_client;
function wl_proxy_marshal_constructor(proxy: Pwl_proxy; opcode: Tuint32_t; iface: Pwl_interface): Pwl_proxy; cdecl; external libwayland_client;
function wl_proxy_marshal_constructor_versioned(proxy: Pwl_proxy; opcode: Tuint32_t; iface: Pwl_interface; version: Tuint32_t; args: array of const): Pwl_proxy; cdecl; external libwayland_client;
function wl_proxy_marshal_constructor_versioned(proxy: Pwl_proxy; opcode: Tuint32_t; iface: Pwl_interface; version: Tuint32_t): Pwl_proxy; cdecl; external libwayland_client;
function wl_proxy_marshal_array_constructor(proxy: Pwl_proxy; opcode: Tuint32_t; args: Pwl_argument; iface: Pwl_interface): Pwl_proxy; cdecl; external libwayland_client;
function wl_proxy_marshal_array_constructor_versioned(proxy: Pwl_proxy; opcode: Tuint32_t; args: Pwl_argument; iface: Pwl_interface; version: Tuint32_t): Pwl_proxy; cdecl; external libwayland_client;
procedure wl_proxy_destroy(proxy: Pwl_proxy); cdecl; external libwayland_client;
function wl_proxy_add_listener(proxy: Pwl_proxy; impl: Pprocedure; data: pointer): longint; cdecl; external libwayland_client;
function wl_proxy_get_listener(proxy: Pwl_proxy): pointer; cdecl; external libwayland_client;
function wl_proxy_add_dispatcher(proxy: Pwl_proxy; dispatcher_func: Twl_dispatcher_func_t; dispatcher_data: pointer; data: pointer): longint; cdecl; external libwayland_client;
procedure wl_proxy_set_user_data(proxy: Pwl_proxy; user_data: pointer); cdecl; external libwayland_client;
function wl_proxy_get_user_data(proxy: Pwl_proxy): pointer; cdecl; external libwayland_client;
function wl_proxy_get_version(proxy: Pwl_proxy): Tuint32_t; cdecl; external libwayland_client;
function wl_proxy_get_id(proxy: Pwl_proxy): Tuint32_t; cdecl; external libwayland_client;
procedure wl_proxy_set_tag(proxy: Pwl_proxy; tag: PPchar); cdecl; external libwayland_client;
function wl_proxy_get_tag(proxy: Pwl_proxy): PPchar; cdecl; external libwayland_client;
function wl_proxy_get_class(proxy: Pwl_proxy): pchar; cdecl; external libwayland_client;
procedure wl_proxy_set_queue(proxy: Pwl_proxy; queue: Pwl_event_queue); cdecl; external libwayland_client;
function wl_display_connect(name: pchar): Pwl_display; cdecl; external libwayland_client;
function wl_display_connect_to_fd(fd: longint): Pwl_display; cdecl; external libwayland_client;
procedure wl_display_disconnect(display: Pwl_display); cdecl; external libwayland_client;
function wl_display_get_fd(display: Pwl_display): longint; cdecl; external libwayland_client;
function wl_display_dispatch(display: Pwl_display): longint; cdecl; external libwayland_client;
function wl_display_dispatch_queue(display: Pwl_display; queue: Pwl_event_queue): longint; cdecl; external libwayland_client;
function wl_display_dispatch_queue_pending(display: Pwl_display; queue: Pwl_event_queue): longint; cdecl; external libwayland_client;
function wl_display_dispatch_pending(display: Pwl_display): longint; cdecl; external libwayland_client;
function wl_display_get_error(display: Pwl_display): longint; cdecl; external libwayland_client;
function wl_display_get_protocol_error(display: Pwl_display; iface: PPwl_interface; id: Puint32_t): Tuint32_t; cdecl; external libwayland_client;
function wl_display_flush(display: Pwl_display): longint; cdecl; external libwayland_client;
function wl_display_roundtrip_queue(display: Pwl_display; queue: Pwl_event_queue): longint; cdecl; external libwayland_client;
function wl_display_roundtrip(display: Pwl_display): longint; cdecl; external libwayland_client;
function wl_display_create_queue(display: Pwl_display): Pwl_event_queue; cdecl; external libwayland_client;
function wl_display_prepare_read_queue(display: Pwl_display; queue: Pwl_event_queue): longint; cdecl; external libwayland_client;
function wl_display_prepare_read(display: Pwl_display): longint; cdecl; external libwayland_client;
procedure wl_display_cancel_read(display: Pwl_display); cdecl; external libwayland_client;
function wl_display_read_events(display: Pwl_display): longint; cdecl; external libwayland_client;
procedure wl_log_set_handler_client(handler: Twl_log_func_t); cdecl; external libwayland_client;

// === Konventiert am: 9-6-26 16:43:34 ===


implementation



end.
