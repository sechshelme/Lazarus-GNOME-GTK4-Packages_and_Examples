unit wayland_server_core;

interface

uses
  fp_wayland, wayland_client_protocol, wayland_util;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  WL_EVENT_READABLE = $01;
  WL_EVENT_WRITABLE = $02;
  WL_EVENT_HANGUP = $04;
  WL_EVENT_ERROR = $08;

type
  Twl_event_loop_fd_func_t = function(fd: longint; mask: Tuint32_t; data: pointer): longint; cdecl;
  Twl_event_loop_timer_func_t = function(data: pointer): longint; cdecl;
  Twl_event_loop_signal_func_t = function(signal_number: longint; data: pointer): longint; cdecl;
  Twl_event_loop_idle_func_t = procedure(data: pointer); cdecl;

  Pwl_event_loop = type Pointer;
  Pwl_event_source = type Pointer;
  Pwl_shm_buffer = type Pointer;
  Pwl_protocol_logger = type Pointer;

type
  Pwl_listener = ^Twl_listener;

  Twl_notify_func_t = procedure(listener: Pwl_listener; data: pointer); cdecl;

  Twl_listener = record
    link: Twl_list;
    notify: Twl_notify_func_t;
  end;

  Twl_signal = record
    listener_list: Twl_list;
  end;
  Pwl_signal = ^Twl_signal;

function wl_event_loop_create: Pwl_event_loop; cdecl; external libwayland_server;
procedure wl_event_loop_destroy(loop: Pwl_event_loop); cdecl; external libwayland_server;
function wl_event_loop_add_fd(loop: Pwl_event_loop; fd: longint; mask: Tuint32_t; func: Twl_event_loop_fd_func_t; data: pointer): Pwl_event_source; cdecl; external libwayland_server;
function wl_event_source_fd_update(source: Pwl_event_source; mask: Tuint32_t): longint; cdecl; external libwayland_server;
function wl_event_loop_add_timer(loop: Pwl_event_loop; func: Twl_event_loop_timer_func_t; data: pointer): Pwl_event_source; cdecl; external libwayland_server;
function wl_event_loop_add_signal(loop: Pwl_event_loop; signal_number: longint; func: Twl_event_loop_signal_func_t; data: pointer): Pwl_event_source; cdecl; external libwayland_server;
function wl_event_source_timer_update(source: Pwl_event_source; ms_delay: longint): longint; cdecl; external libwayland_server;
function wl_event_source_remove(source: Pwl_event_source): longint; cdecl; external libwayland_server;
procedure wl_event_source_check(source: Pwl_event_source); cdecl; external libwayland_server;
function wl_event_loop_dispatch(loop: Pwl_event_loop; timeout: longint): longint; cdecl; external libwayland_server;
procedure wl_event_loop_dispatch_idle(loop: Pwl_event_loop); cdecl; external libwayland_server;
function wl_event_loop_add_idle(loop: Pwl_event_loop; func: Twl_event_loop_idle_func_t; data: pointer): Pwl_event_source; cdecl; external libwayland_server;
function wl_event_loop_get_fd(loop: Pwl_event_loop): longint; cdecl; external libwayland_server;

procedure wl_event_loop_add_destroy_listener(loop: Pwl_event_loop; listener: Pwl_listener); cdecl; external libwayland_server;
function wl_event_loop_get_destroy_listener(loop: Pwl_event_loop; notify: Twl_notify_func_t): Pwl_listener; cdecl; external libwayland_server;
function wl_display_create: Pwl_display; cdecl; external libwayland_server;
procedure wl_display_destroy(display: Pwl_display); cdecl; external libwayland_server;
function wl_display_get_event_loop(display: Pwl_display): Pwl_event_loop; cdecl; external libwayland_server;
function wl_display_add_socket(display: Pwl_display; name: pchar): longint; cdecl; external libwayland_server;
function wl_display_add_socket_auto(display: Pwl_display): pchar; cdecl; external libwayland_server;
function wl_display_add_socket_fd(display: Pwl_display; sock_fd: longint): longint; cdecl; external libwayland_server;
procedure wl_display_terminate(display: Pwl_display); cdecl; external libwayland_server;
procedure wl_display_run(display: Pwl_display); cdecl; external libwayland_server;
procedure wl_display_flush_clients(display: Pwl_display); cdecl; external libwayland_server;
procedure wl_display_destroy_clients(display: Pwl_display); cdecl; external libwayland_server;

type
  Pwl_client = type Pointer;
  Twl_global_bind_func_t = procedure(client: Pwl_client; data: pointer; version: Tuint32_t; id: Tuint32_t); cdecl;

function wl_display_get_serial(display: Pwl_display): Tuint32_t; cdecl; external libwayland_server;
function wl_display_next_serial(display: Pwl_display): Tuint32_t; cdecl; external libwayland_server;
procedure wl_display_add_destroy_listener(display: Pwl_display; listener: Pwl_listener); cdecl; external libwayland_server;
procedure wl_display_add_client_created_listener(display: Pwl_display; listener: Pwl_listener); cdecl; external libwayland_server;
function wl_display_get_destroy_listener(display: Pwl_display; notify: Twl_notify_func_t): Pwl_listener; cdecl; external libwayland_server;
function wl_global_create(display: Pwl_display; iface: Pwl_interface; version: longint; data: pointer; bind: Twl_global_bind_func_t): Pwl_global; cdecl; external libwayland_server;
procedure wl_global_remove(global: Pwl_global); cdecl; external libwayland_server;
procedure wl_global_destroy(global: Pwl_global); cdecl; external libwayland_server;

type

  Twl_display_global_filter_func_t = function(client: Pwl_client; global: Pwl_global; data: pointer): boolean; cdecl;

procedure wl_display_set_global_filter(display: Pwl_display; filter: Twl_display_global_filter_func_t; data: pointer); cdecl; external libwayland_server;
function wl_global_get_interface(global: Pwl_global): Pwl_interface; cdecl; external libwayland_server;
function wl_global_get_name(global: Pwl_global; client: Pwl_client): Tuint32_t; cdecl; external libwayland_server;
function wl_global_get_version(global: Pwl_global): Tuint32_t; cdecl; external libwayland_server;
function wl_global_get_display(global: Pwl_global): Pwl_display; cdecl; external libwayland_server;
function wl_global_get_user_data(global: Pwl_global): pointer; cdecl; external libwayland_server;
procedure wl_global_set_user_data(global: Pwl_global; data: pointer); cdecl; external libwayland_server;
function wl_client_create(display: Pwl_display; fd: longint): Pwl_client; cdecl; external libwayland_server;
function wl_display_get_client_list(display: Pwl_display): Pwl_list; cdecl; external libwayland_server;
function wl_client_get_link(client: Pwl_client): Pwl_list; cdecl; external libwayland_server;
function wl_client_from_link(link: Pwl_list): Pwl_client; cdecl; external libwayland_server;
procedure wl_client_destroy(client: Pwl_client); cdecl; external libwayland_server;
procedure wl_client_flush(client: Pwl_client); cdecl; external libwayland_server;
procedure wl_client_get_credentials(client: Pwl_client; pid: Ppid_t; uid: Puid_t; gid: Pgid_t); cdecl; external libwayland_server;
function wl_client_get_fd(client: Pwl_client): longint; cdecl; external libwayland_server;
procedure wl_client_add_destroy_listener(client: Pwl_client; listener: Pwl_listener); cdecl; external libwayland_server;
function wl_client_get_destroy_listener(client: Pwl_client; notify: Twl_notify_func_t): Pwl_listener; cdecl; external libwayland_server;
procedure wl_client_add_destroy_late_listener(client: Pwl_client; listener: Pwl_listener); cdecl; external libwayland_server;
function wl_client_get_destroy_late_listener(client: Pwl_client; notify: Twl_notify_func_t): Pwl_listener; cdecl; external libwayland_server;
function wl_client_get_object(client: Pwl_client; id: Tuint32_t): Pwl_resource; cdecl; external libwayland_server;
procedure wl_client_post_no_memory(client: Pwl_client); cdecl; external libwayland_server;
procedure wl_client_post_implementation_error(client: Pwl_client; msg: pchar; args: array of const); cdecl; external libwayland_server;
procedure wl_client_post_implementation_error(client: Pwl_client; msg: pchar); cdecl; external libwayland_server;
procedure wl_client_add_resource_created_listener(client: Pwl_client; listener: Pwl_listener); cdecl; external libwayland_server;

type
  Twl_client_for_each_resource_iterator_func_t = function(resource: Pwl_resource; user_data: pointer): Twl_iterator_result; cdecl;

procedure wl_client_for_each_resource(client: Pwl_client; iterator: Twl_client_for_each_resource_iterator_func_t; user_data: pointer); cdecl; external libwayland_server;
procedure wl_signal_emit_mutable(signal: Pwl_signal; data: pointer); cdecl; external libwayland_server;

type
  Twl_resource_destroy_func_t = procedure(resource: Pwl_resource); cdecl;

procedure wl_resource_post_event(resource: Pwl_resource; opcode: Tuint32_t); cdecl; varargs; external libwayland_server;
procedure wl_resource_post_event_array(resource: Pwl_resource; opcode: Tuint32_t; args: Pwl_argument); cdecl; external libwayland_server;
procedure wl_resource_queue_event(resource: Pwl_resource; opcode: Tuint32_t; args: array of const); cdecl; external libwayland_server;
procedure wl_resource_queue_event(resource: Pwl_resource; opcode: Tuint32_t); cdecl; external libwayland_server;
procedure wl_resource_queue_event_array(resource: Pwl_resource; opcode: Tuint32_t; args: Pwl_argument); cdecl; external libwayland_server;
procedure wl_resource_post_error(resource: Pwl_resource; code: Tuint32_t; msg: pchar; args: array of const); cdecl; external libwayland_server;
procedure wl_resource_post_error(resource: Pwl_resource; code: Tuint32_t; msg: pchar); cdecl; external libwayland_server;
procedure wl_resource_post_no_memory(resource: Pwl_resource); cdecl; external libwayland_server;
function wl_client_get_display(client: Pwl_client): Pwl_display; cdecl; external libwayland_server;
function wl_resource_create(client: Pwl_client; iface: Pwl_interface; version: longint; id: Tuint32_t): Pwl_resource; cdecl; external libwayland_server;
procedure wl_resource_set_implementation(resource: Pwl_resource; impl: pointer; data: pointer; destroy: Twl_resource_destroy_func_t); cdecl; external libwayland_server;
procedure wl_resource_set_dispatcher(resource: Pwl_resource; dispatcher: Twl_dispatcher_func_t; impl: pointer; data: pointer; destroy: Twl_resource_destroy_func_t); cdecl; external libwayland_server;
procedure wl_resource_destroy(resource: Pwl_resource); cdecl; external libwayland_server;
function wl_resource_get_id(resource: Pwl_resource): Tuint32_t; cdecl; external libwayland_server;
function wl_resource_get_link(resource: Pwl_resource): Pwl_list; cdecl; external libwayland_server;
function wl_resource_from_link(resource: Pwl_list): Pwl_resource; cdecl; external libwayland_server;
function wl_resource_find_for_client(list: Pwl_list; client: Pwl_client): Pwl_resource; cdecl; external libwayland_server;
function wl_resource_get_client(resource: Pwl_resource): Pwl_client; cdecl; external libwayland_server;
procedure wl_resource_set_user_data(resource: Pwl_resource; data: pointer); cdecl; external libwayland_server;
function wl_resource_get_user_data(resource: Pwl_resource): pointer; cdecl; external libwayland_server;
function wl_resource_get_version(resource: Pwl_resource): longint; cdecl; external libwayland_server;
procedure wl_resource_set_destructor(resource: Pwl_resource; destroy: Twl_resource_destroy_func_t); cdecl; external libwayland_server;
function wl_resource_instance_of(resource: Pwl_resource; iface: Pwl_interface; impl: pointer): longint; cdecl; external libwayland_server;
function wl_resource_get_class(resource: Pwl_resource): pchar; cdecl; external libwayland_server;
procedure wl_resource_add_destroy_listener(resource: Pwl_resource; listener: Pwl_listener); cdecl; external libwayland_server;
function wl_resource_get_destroy_listener(resource: Pwl_resource; notify: Twl_notify_func_t): Pwl_listener; cdecl; external libwayland_server;
function wl_shm_buffer_get(resource: Pwl_resource): Pwl_shm_buffer; cdecl; external libwayland_server;
procedure wl_shm_buffer_begin_access(buffer: Pwl_shm_buffer); cdecl; external libwayland_server;
procedure wl_shm_buffer_end_access(buffer: Pwl_shm_buffer); cdecl; external libwayland_server;
function wl_shm_buffer_get_data(buffer: Pwl_shm_buffer): pointer; cdecl; external libwayland_server;
function wl_shm_buffer_get_stride(buffer: Pwl_shm_buffer): Tint32_t; cdecl; external libwayland_server;
function wl_shm_buffer_get_format(buffer: Pwl_shm_buffer): Tuint32_t; cdecl; external libwayland_server;
function wl_shm_buffer_get_width(buffer: Pwl_shm_buffer): Tint32_t; cdecl; external libwayland_server;
function wl_shm_buffer_get_height(buffer: Pwl_shm_buffer): Tint32_t; cdecl; external libwayland_server;
function wl_shm_buffer_ref_pool(buffer: Pwl_shm_buffer): Pwl_shm_pool; cdecl; external libwayland_server;
procedure wl_shm_pool_unref(pool: Pwl_shm_pool); cdecl; external libwayland_server;
function wl_display_init_shm(display: Pwl_display): longint; cdecl; external libwayland_server;
function wl_display_add_shm_format(display: Pwl_display; format: Tuint32_t): Puint32_t; cdecl; external libwayland_server;
function wl_shm_buffer_create(client: Pwl_client; id: Tuint32_t; width: Tint32_t; height: Tint32_t; stride: Tint32_t;
  format: Tuint32_t): Pwl_shm_buffer; cdecl; external libwayland_server;
procedure wl_log_set_handler_server(handler: Twl_log_func_t); cdecl; external libwayland_server;

type
  Twl_protocol_logger_type = longint;

const
  WL_PROTOCOL_LOGGER_REQUEST = 0;
  WL_PROTOCOL_LOGGER_EVENT = 1;

type
  Twl_protocol_logger_message = record
    resource: Pwl_resource;
    message_opcode: longint;
    message: Pwl_message;
    arguments_count: longint;
    arguments: Pwl_argument;
  end;
  Pwl_protocol_logger_message = ^Twl_protocol_logger_message;

  Twl_protocol_logger_func_t = procedure(user_data: pointer; direction: Twl_protocol_logger_type; message: Pwl_protocol_logger_message); cdecl;

function wl_display_add_protocol_logger(display: Pwl_display; para2: Twl_protocol_logger_func_t; user_data: pointer): Pwl_protocol_logger; cdecl; external libwayland_server;
procedure wl_protocol_logger_destroy(logger: Pwl_protocol_logger); cdecl; external libwayland_server;

// === Konventiert am: 10-6-26 17:16:01 ===

procedure wl_signal_init(signal: Pwl_signal);
procedure wl_signal_add(signal: Pwl_signal; listener: Pwl_listener);
function wl_signal_get(signal: Pwl_signal; notify: Twl_notify_func_t): Pwl_listener;
procedure wl_signal_emit(signal: Pwl_signal; data: Pointer);


implementation

procedure wl_signal_init(signal: Pwl_signal);
begin
  wl_list_init(@signal^.listener_list);
end;

procedure wl_signal_add(signal: Pwl_signal; listener: Pwl_listener);
begin
  wl_list_insert(signal^.listener_list.prev, @listener^.link);
end;

function wl_signal_get(signal: Pwl_signal; notify: Twl_notify_func_t): Pwl_listener;
var
  curr: Pwl_list;
  l: Pwl_listener;
begin
  curr := signal^.listener_list.next;
  while curr <> @signal^.listener_list do begin
    l := Pwl_listener(Pointer(curr));
    if l^.notify = notify then begin
      exit(l);
    end;
    curr := curr^.next;
  end;
  Result := nil;
end;

procedure wl_signal_emit(signal: Pwl_signal; data: Pointer);
var
  curr, next: Pwl_list;
  l: Pwl_listener;
begin
  curr := signal^.listener_list.next;
  while curr <> @signal^.listener_list do begin
    next := curr^.next;
    l := Pwl_listener(Pointer(curr));
    if Assigned(l^.notify) then begin
      l^.notify(l, data);
    end;
    curr := next;
  end;
end;




end.
