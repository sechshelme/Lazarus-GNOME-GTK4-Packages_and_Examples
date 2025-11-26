{$IFDEF read_interface}


type
  Tssh_callback_int = procedure(code: longint; user: pointer); cdecl;
  Tssh_callback_data = function(data: pointer; len: Tsize_t; user: pointer): Tsize_t; cdecl;
  Tssh_callback_int_int = procedure(code: longint; errno_code: longint; user: pointer); cdecl;
  Tssh_message_callback = function(para1: Tssh_session; message: Tssh_message; user: pointer): longint; cdecl;
  Tssh_channel_callback_int = function(channel: Tssh_channel; code: longint; user: pointer): longint; cdecl;
  Tssh_channel_callback_data = function(channel: Tssh_channel; code: longint; data: pointer; len: Tsize_t; user: pointer): longint; cdecl;
  Tssh_log_callback = procedure(session: Tssh_session; priority: longint; message: pchar; userdata: pointer); cdecl;
  Tssh_logging_callback = procedure(priority: longint; _function: pchar; buffer: pchar; userdata: pointer); cdecl;
  Tssh_status_callback = procedure(session: Tssh_session; status: single; userdata: pointer); cdecl;
  Tssh_global_request_callback = procedure(session: Tssh_session; message: Tssh_message; userdata: pointer); cdecl;
  Tssh_channel_open_request_x11_callback = function(session: Tssh_session; originator_address: pchar; originator_port: longint; userdata: pointer): Tssh_channel; cdecl;
  Tssh_channel_open_request_auth_agent_callback = function(session: Tssh_session; userdata: pointer): Tssh_channel; cdecl;

  Tssh_callbacks = record
    size: Tsize_t;
    userdata: pointer;
    auth_function: Tssh_auth_callback;
    log_function: Tssh_log_callback;
    connect_status_function: procedure(userdata: pointer; status: single); cdecl;
    global_request_function: Tssh_global_request_callback;
    channel_open_request_x11_function: Tssh_channel_open_request_x11_callback;
    channel_open_request_auth_agent_function: Tssh_channel_open_request_auth_agent_callback;
  end;
  Pssh_callbacks = ^Tssh_callbacks;

  Tssh_auth_password_callback = function(session: Tssh_session; user: pchar; password: pchar; userdata: pointer): longint; cdecl;
  Tssh_auth_none_callback = function(session: Tssh_session; user: pchar; userdata: pointer): longint; cdecl;
  Tssh_auth_gssapi_mic_callback = function(session: Tssh_session; user: pchar; principal: pchar; userdata: pointer): longint; cdecl;
  Tssh_auth_pubkey_callback = function(session: Tssh_session; user: pchar; pubkey: Pssh_key_struct; signature_state: char; userdata: pointer): longint; cdecl;
  Tssh_service_request_callback = function(session: Tssh_session; service: pchar; userdata: pointer): longint; cdecl;
  Tssh_channel_open_request_session_callback = function(session: Tssh_session; userdata: pointer): Tssh_channel; cdecl;
  Tssh_gssapi_select_oid_callback = function(session: Tssh_session; user: pchar; n_oid: longint; oids: Pssh_string; userdata: pointer): Tssh_string; cdecl;
  Tssh_gssapi_accept_sec_ctx_callback = function(session: Tssh_session; input_token: Tssh_string; output_token: Pssh_string; userdata: pointer): longint; cdecl;
  Tssh_gssapi_verify_mic_callback = function(session: Tssh_session; mic: Tssh_string; mic_buffer: pointer; mic_buffer_size: Tsize_t; userdata: pointer): longint; cdecl;

  Tssh_server_callbacks = record
    size: Tsize_t;
    userdata: pointer;
    auth_password_function: Tssh_auth_password_callback;
    auth_none_function: Tssh_auth_none_callback;
    auth_gssapi_mic_function: Tssh_auth_gssapi_mic_callback;
    auth_pubkey_function: Tssh_auth_pubkey_callback;
    service_request_function: Tssh_service_request_callback;
    channel_open_request_session_function: Tssh_channel_open_request_session_callback;
    gssapi_select_oid_function: Tssh_gssapi_select_oid_callback;
    gssapi_accept_sec_ctx_function: Tssh_gssapi_accept_sec_ctx_callback;
    gssapi_verify_mic_function: Tssh_gssapi_verify_mic_callback;
  end;
  Pssh_server_callbacks = ^Tssh_server_callbacks;

function ssh_set_server_callbacks(session: Tssh_session; cb: Pssh_server_callbacks): longint; cdecl; external libssh;

type
  Tssh_socket_callbacks = record
    userdata: pointer;
    data: Tssh_callback_data;
    controlflow: Tssh_callback_int;
    exception: Tssh_callback_int_int;
    connected: Tssh_callback_int_int;
  end;
  Pssh_socket_callbacks = ^Tssh_socket_callbacks;

const
  SSH_SOCKET_FLOW_WRITEWILLBLOCK = 1;
  SSH_SOCKET_FLOW_WRITEWONTBLOCK = 2;
  SSH_SOCKET_EXCEPTION_EOF = 1;
  SSH_SOCKET_EXCEPTION_ERROR = 2;
  SSH_SOCKET_CONNECTED_OK = 1;
  SSH_SOCKET_CONNECTED_ERROR = 2;
  SSH_SOCKET_CONNECTED_TIMEOUT = 3;

type
  Tssh_packet_callback = function(session: Tssh_session; _type: Tuint8_t; packet: Tssh_buffer; user: pointer): longint; cdecl;
  Pssh_packet_callback = ^Tssh_packet_callback;

const
  SSH_PACKET_USED = 1;
  SSH_PACKET_NOT_USED = 2;

type
  Tssh_packet_callbacks = record
    start: Tuint8_t;
    n_callbacks: Tuint8_t;
    callbacks: Pssh_packet_callback;
    user: pointer;
  end;
  Pssh_packet_callbacks = ^Tssh_packet_callbacks;

function ssh_set_callbacks(session: Tssh_session; cb: Pssh_callbacks): longint; cdecl; external libssh;

type
  Tssh_channel_data_callback = function(session: Tssh_session; channel: Tssh_channel; data: pointer; len: Tuint32_t; is_stderr: longint; userdata: pointer): longint; cdecl;
  Tssh_channel_eof_callback = procedure(session: Tssh_session; channel: Tssh_channel; userdata: pointer); cdecl;
  Tssh_channel_close_callback = procedure(session: Tssh_session; channel: Tssh_channel; userdata: pointer); cdecl;
  Tssh_channel_signal_callback = procedure(session: Tssh_session; channel: Tssh_channel; signal: pchar; userdata: pointer); cdecl;
  Tssh_channel_exit_status_callback = procedure(session: Tssh_session; channel: Tssh_channel; exit_status: longint; userdata: pointer); cdecl;
  Tssh_channel_exit_signal_callback = procedure(session: Tssh_session; channel: Tssh_channel; signal: pchar; core: longint; errmsg: pchar; lang: pchar; userdata: pointer); cdecl;
  Tssh_channel_pty_request_callback = function(session: Tssh_session; channel: Tssh_channel; term: pchar; width: longint; height: longint; pxwidth: longint; pwheight: longint; userdata: pointer): longint; cdecl;
  Tssh_channel_shell_request_callback = function(session: Tssh_session; channel: Tssh_channel; userdata: pointer): longint; cdecl;
  Tssh_channel_auth_agent_req_callback = procedure(session: Tssh_session; channel: Tssh_channel; userdata: pointer); cdecl;
  Tssh_channel_x11_req_callback = procedure(session: Tssh_session; channel: Tssh_channel; single_connection: longint; auth_protocol: pchar; auth_cookie: pchar; screen_number: Tuint32_t; userdata: pointer); cdecl;
  Tssh_channel_pty_window_change_callback = function(session: Tssh_session; channel: Tssh_channel; width: longint; height: longint; pxwidth: longint; pwheight: longint; userdata: pointer): longint; cdecl;
  Tssh_channel_exec_request_callback = function(session: Tssh_session; channel: Tssh_channel; command: pchar; userdata: pointer): longint; cdecl;
  Tssh_channel_env_request_callback = function(session: Tssh_session; channel: Tssh_channel; env_name: pchar; env_value: pchar; userdata: pointer): longint; cdecl;
  Tssh_channel_subsystem_request_callback = function(session: Tssh_session; channel: Tssh_channel; subsystem: pchar; userdata: pointer): longint; cdecl;
  Tssh_channel_write_wontblock_callback = function(session: Tssh_session; channel: Tssh_channel; bytes: Tuint32_t; userdata: pointer): longint; cdecl;

  Tssh_channel_callbacks = record
    size: Tsize_t;
    userdata: pointer;
    channel_data_function: Tssh_channel_data_callback;
    channel_eof_function: Tssh_channel_eof_callback;
    channel_close_function: Tssh_channel_close_callback;
    channel_signal_function: Tssh_channel_signal_callback;
    channel_exit_status_function: Tssh_channel_exit_status_callback;
    channel_exit_signal_function: Tssh_channel_exit_signal_callback;
    channel_pty_request_function: Tssh_channel_pty_request_callback;
    channel_shell_request_function: Tssh_channel_shell_request_callback;
    channel_auth_agent_req_function: Tssh_channel_auth_agent_req_callback;
    channel_x11_req_function: Tssh_channel_x11_req_callback;
    channel_pty_window_change_function: Tssh_channel_pty_window_change_callback;
    channel_exec_request_function: Tssh_channel_exec_request_callback;
    channel_env_request_function: Tssh_channel_env_request_callback;
    channel_subsystem_request_function: Tssh_channel_subsystem_request_callback;
    channel_write_wontblock_function: Tssh_channel_write_wontblock_callback;
  end;
  Pssh_channel_callbacks = ^Tssh_channel_callbacks;

function ssh_set_channel_callbacks(channel: Tssh_channel; cb: Pssh_channel_callbacks): longint; cdecl; external libssh;
function ssh_add_channel_callbacks(channel: Tssh_channel; cb: Pssh_channel_callbacks): longint; cdecl; external libssh;
function ssh_remove_channel_callbacks(channel: Tssh_channel; cb: Pssh_channel_callbacks): longint; cdecl; external libssh;

type
  Tssh_thread_callback = function(lock: Ppointer): longint; cdecl;
  Tssh_thread_id_callback = function(para1: pointer): dword; cdecl;

  Tssh_threads_callbacks = record
    _type: pchar;
    mutex_init: Tssh_thread_callback;
    mutex_destroy: Tssh_thread_callback;
    mutex_lock: Tssh_thread_callback;
    mutex_unlock: Tssh_thread_callback;
    thread_id: Tssh_thread_id_callback;
  end;
  Pssh_threads_callbacks = ^Tssh_threads_callbacks;

function ssh_threads_set_callbacks(cb: Pssh_threads_callbacks): longint; cdecl; external libssh;
function ssh_threads_get_default: Pssh_threads_callbacks; cdecl; external libssh;
function ssh_threads_get_pthread: Pssh_threads_callbacks; cdecl; external libssh;
function ssh_threads_get_noop: Pssh_threads_callbacks; cdecl; external libssh;
function ssh_set_log_callback(cb: Tssh_logging_callback): longint; cdecl; external libssh;
function ssh_get_log_callback: Tssh_logging_callback; cdecl; external libssh;

// === Konventiert am: 2-7-25 17:32:15 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
