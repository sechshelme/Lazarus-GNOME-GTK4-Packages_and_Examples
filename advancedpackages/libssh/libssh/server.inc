{$IFDEF read_interface}



type
  Tssh_bind_options_e = longint;

const
  SSH_BIND_OPTIONS_BINDADDR = 0;
  SSH_BIND_OPTIONS_BINDPORT = 1;
  SSH_BIND_OPTIONS_BINDPORT_STR = 2;
  SSH_BIND_OPTIONS_HOSTKEY = 3;
  SSH_BIND_OPTIONS_DSAKEY = 4;
  SSH_BIND_OPTIONS_RSAKEY = 5;
  SSH_BIND_OPTIONS_BANNER = 6;
  SSH_BIND_OPTIONS_LOG_VERBOSITY = 7;
  SSH_BIND_OPTIONS_LOG_VERBOSITY_STR = 8;
  SSH_BIND_OPTIONS_ECDSAKEY = 9;
  SSH_BIND_OPTIONS_IMPORT_KEY = 10;
  SSH_BIND_OPTIONS_KEY_EXCHANGE = 11;
  SSH_BIND_OPTIONS_CIPHERS_C_S = 12;
  SSH_BIND_OPTIONS_CIPHERS_S_C = 13;
  SSH_BIND_OPTIONS_HMAC_C_S = 14;
  SSH_BIND_OPTIONS_HMAC_S_C = 15;
  SSH_BIND_OPTIONS_CONFIG_DIR = 16;
  SSH_BIND_OPTIONS_PUBKEY_ACCEPTED_KEY_TYPES = 17;
  SSH_BIND_OPTIONS_HOSTKEY_ALGORITHMS = 18;
  SSH_BIND_OPTIONS_PROCESS_CONFIG = 19;
  SSH_BIND_OPTIONS_MODULI = 20;
  SSH_BIND_OPTIONS_RSA_MIN_SIZE = 21;

type
  Pssh_bind = ^Tssh_bind;
  Tssh_bind = Pointer; //  Pssh_bind_struct;

  Tssh_bind_incoming_connection_callback = procedure(sshbind: Tssh_bind; userdata: pointer); cdecl;

  Tssh_bind_callbacks = record
    size: Tsize_t;
    incoming_connection: Tssh_bind_incoming_connection_callback;
  end;
  Pssh_bind_callbacks = ^Tssh_bind_callbacks;

function ssh_bind_new: Tssh_bind; cdecl; external libssh;
function ssh_bind_options_set(sshbind: Tssh_bind; _type: Tssh_bind_options_e; value: pointer): longint; cdecl; external libssh;
function ssh_bind_options_parse_config(sshbind: Tssh_bind; filename: pchar): longint; cdecl; external libssh;
function ssh_bind_listen(ssh_bind_o: Tssh_bind): longint; cdecl; external libssh;
function ssh_bind_set_callbacks(sshbind: Tssh_bind; callbacks: Pssh_bind_callbacks; userdata: pointer): longint; cdecl; external libssh;
procedure ssh_bind_set_blocking(ssh_bind_o: Tssh_bind; blocking: longint); cdecl; external libssh;
function ssh_bind_get_fd(ssh_bind_o: Tssh_bind): Tsocket_t; cdecl; external libssh;
procedure ssh_bind_set_fd(ssh_bind_o: Tssh_bind; fd: Tsocket_t); cdecl; external libssh;
procedure ssh_bind_fd_toaccept(ssh_bind_o: Tssh_bind); cdecl; external libssh;
function ssh_bind_accept(ssh_bind_o: Tssh_bind; session: Tssh_session): longint; cdecl; external libssh;
function ssh_bind_accept_fd(ssh_bind_o: Tssh_bind; session: Tssh_session; fd: Tsocket_t): longint; cdecl; external libssh;
function ssh_gssapi_get_creds(session: Tssh_session): Tssh_gssapi_creds; cdecl; external libssh;
function ssh_handle_key_exchange(session: Tssh_session): longint; cdecl; external libssh;
function ssh_server_init_kex(session: Tssh_session): longint; cdecl; external libssh;
procedure ssh_bind_free(ssh_bind_o: Tssh_bind); cdecl; external libssh;
procedure ssh_set_auth_methods(session: Tssh_session; auth_methods: longint); cdecl; external libssh;
function ssh_send_issue_banner(session: Tssh_session; banner: Tssh_string): longint; cdecl; external libssh;
function ssh_message_reply_default(msg: Tssh_message): longint; cdecl; external libssh;
function ssh_message_auth_user(msg: Tssh_message): pchar; cdecl; external libssh;
function ssh_message_auth_password(msg: Tssh_message): pchar; cdecl; external libssh; deprecated;
function ssh_message_auth_pubkey(msg: Tssh_message): Tssh_key; cdecl; external libssh; deprecated;
function ssh_message_auth_kbdint_is_response(msg: Tssh_message): longint; cdecl; external libssh;
function ssh_message_auth_publickey_state(msg: Tssh_message): Tssh_publickey_state_e; cdecl; external libssh; deprecated;
function ssh_message_auth_reply_success(msg: Tssh_message; partial: longint): longint; cdecl; external libssh;
function ssh_message_auth_reply_pk_ok(msg: Tssh_message; algo: Tssh_string; pubkey: Tssh_string): longint; cdecl; external libssh;
function ssh_message_auth_reply_pk_ok_simple(msg: Tssh_message): longint; cdecl; external libssh;
function ssh_message_auth_set_methods(msg: Tssh_message; methods: longint): longint; cdecl; external libssh;
function ssh_message_auth_interactive_request(msg: Tssh_message; name: pchar; instruction: pchar; num_prompts: dword; prompts: PPchar; echo: pchar): longint; cdecl; external libssh;
function ssh_message_service_reply_success(msg: Tssh_message): longint; cdecl; external libssh;
function ssh_message_service_service(msg: Tssh_message): pchar; cdecl; external libssh;
function ssh_message_global_request_reply_success(msg: Tssh_message; bound_port: Tuint16_t): longint; cdecl; external libssh;

type
  Tset_message_callback = function(session: Tssh_session; msg: Tssh_message; data: pointer): longint; cdecl;

procedure ssh_set_message_callback(session: Tssh_session; ssh_bind_message_callback: Tset_message_callback; data: pointer); cdecl; external libssh;
function ssh_execute_message_callbacks(session: Tssh_session): longint; cdecl; external libssh;
function ssh_message_channel_request_open_originator(msg: Tssh_message): pchar; cdecl; external libssh;
function ssh_message_channel_request_open_originator_port(msg: Tssh_message): longint; cdecl; external libssh;
function ssh_message_channel_request_open_destination(msg: Tssh_message): pchar; cdecl; external libssh;
function ssh_message_channel_request_open_destination_port(msg: Tssh_message): longint; cdecl; external libssh;
function ssh_message_channel_request_channel(msg: Tssh_message): Tssh_channel; cdecl; external libssh;
function ssh_message_channel_request_pty_term(msg: Tssh_message): pchar; cdecl; external libssh; deprecated;
function ssh_message_channel_request_pty_width(msg: Tssh_message): longint; cdecl; external libssh; deprecated;
function ssh_message_channel_request_pty_height(msg: Tssh_message): longint; cdecl; external libssh; deprecated;
function ssh_message_channel_request_pty_pxwidth(msg: Tssh_message): longint; cdecl; external libssh; deprecated;
function ssh_message_channel_request_pty_pxheight(msg: Tssh_message): longint; cdecl; external libssh; deprecated;
function ssh_message_channel_request_env_name(msg: Tssh_message): pchar; cdecl; external libssh;
function ssh_message_channel_request_env_value(msg: Tssh_message): pchar; cdecl; external libssh;
function ssh_message_channel_request_command(msg: Tssh_message): pchar; cdecl; external libssh;
function ssh_message_channel_request_subsystem(msg: Tssh_message): pchar; cdecl; external libssh;
function ssh_message_channel_request_x11_single_connection(msg: Tssh_message): longint; cdecl; external libssh; deprecated;
function ssh_message_channel_request_x11_auth_protocol(msg: Tssh_message): pchar; cdecl; external libssh; deprecated;
function ssh_message_channel_request_x11_auth_cookie(msg: Tssh_message): pchar; cdecl; external libssh; deprecated;
function ssh_message_channel_request_x11_screen_number(msg: Tssh_message): longint; cdecl; external libssh; deprecated;
function ssh_message_global_request_address(msg: Tssh_message): pchar; cdecl; external libssh;
function ssh_message_global_request_port(msg: Tssh_message): longint; cdecl; external libssh;
function ssh_channel_open_reverse_forward(channel: Tssh_channel; remotehost: pchar; remoteport: longint; sourcehost: pchar; localport: longint): longint; cdecl; external libssh;
function ssh_channel_request_send_exit_status(channel: Tssh_channel; exit_status: longint): longint; cdecl; external libssh;
function ssh_channel_request_send_exit_signal(channel: Tssh_channel; signum: pchar; core: longint; errmsg: pchar; lang: pchar): longint; cdecl; external libssh;
function ssh_send_keepalive(session: Tssh_session): longint; cdecl; external libssh;
function ssh_accept(session: Tssh_session): longint; cdecl; external libssh; deprecated;
function channel_write_stderr(channel: Tssh_channel; data: pointer; len: Tuint32_t): longint; cdecl; external libssh; deprecated;

// === Konventiert am: 2-7-25 17:32:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
