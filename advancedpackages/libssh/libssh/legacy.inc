{$IFDEF read_interface}


type
  Pssh_private_key = ^Tssh_private_key;
  Tssh_private_key = Pointer; //  Pssh_private_key_struct;

  Pssh_public_key = ^Tssh_public_key;
  Tssh_public_key = Pointer; //  Pssh_public_key_struct;

function ssh_auth_list(session: Tssh_session): longint; cdecl; external libssh;
function ssh_userauth_offer_pubkey(session: Tssh_session; username: pchar; _type: longint; publickey: Tssh_string): longint; cdecl; external libssh;
function ssh_userauth_pubkey(session: Tssh_session; username: pchar; publickey: Tssh_string; privatekey: Tssh_private_key): longint; cdecl; external libssh;

{$ifndef WIN32}
function ssh_userauth_agent_pubkey(session: Tssh_session; username: pchar; publickey: Tssh_public_key): longint; cdecl; external libssh;
{$endif}

function ssh_userauth_autopubkey(session: Tssh_session; passphrase: pchar): longint; cdecl; external libssh;
function ssh_userauth_privatekey_file(session: Tssh_session; username: pchar; filename: pchar; passphrase: pchar): longint; cdecl; external libssh;
procedure buffer_free(buffer: Tssh_buffer); cdecl; external libssh; deprecated;
function buffer_get(buffer: Tssh_buffer): pointer; cdecl; external libssh; deprecated;
function buffer_get_len(buffer: Tssh_buffer): Tuint32_t; cdecl; external libssh; deprecated;
function buffer_new: Tssh_buffer; cdecl; external libssh; deprecated;
function channel_accept_x11(channel: Tssh_channel; timeout_ms: longint): Tssh_channel; cdecl; external libssh; deprecated;
function channel_change_pty_size(channel: Tssh_channel; cols: longint; rows: longint): longint; cdecl; external libssh; deprecated;
function channel_forward_accept(session: Tssh_session; timeout_ms: longint): Tssh_channel; cdecl; external libssh; deprecated;
function channel_close(channel: Tssh_channel): longint; cdecl; external libssh; deprecated;
function channel_forward_cancel(session: Tssh_session; address: pchar; port: longint): longint; cdecl; external libssh; deprecated;
function channel_forward_listen(session: Tssh_session; address: pchar; port: longint; bound_port: Plongint): longint; cdecl; external libssh; deprecated;
procedure channel_free(channel: Tssh_channel); cdecl; external libssh; deprecated;
function channel_get_exit_status(channel: Tssh_channel): longint; cdecl; external libssh; deprecated;
function channel_get_session(channel: Tssh_channel): Tssh_session; cdecl; external libssh; deprecated;
function channel_is_closed(channel: Tssh_channel): longint; cdecl; external libssh; deprecated;
function channel_is_eof(channel: Tssh_channel): longint; cdecl; external libssh; deprecated;
function channel_is_open(channel: Tssh_channel): longint; cdecl; external libssh; deprecated;
function channel_new(session: Tssh_session): Tssh_channel; cdecl; external libssh; deprecated;
function channel_open_forward(channel: Tssh_channel; remotehost: pchar; remoteport: longint; sourcehost: pchar; localport: longint): longint; cdecl; external libssh; deprecated;
function channel_open_session(channel: Tssh_channel): longint; cdecl; external libssh; deprecated;
function channel_poll(channel: Tssh_channel; is_stderr: longint): longint; cdecl; external libssh; deprecated;
function channel_read(channel: Tssh_channel; dest: pointer; count: Tuint32_t; is_stderr: longint): longint; cdecl; external libssh; deprecated;
function channel_read_buffer(channel: Tssh_channel; buffer: Tssh_buffer; count: Tuint32_t; is_stderr: longint): longint; cdecl; external libssh; deprecated;
function channel_read_nonblocking(channel: Tssh_channel; dest: pointer; count: Tuint32_t; is_stderr: longint): longint; cdecl; external libssh; deprecated;
function channel_request_env(channel: Tssh_channel; name: pchar; value: pchar): longint; cdecl; external libssh; deprecated;
function channel_request_exec(channel: Tssh_channel; cmd: pchar): longint; cdecl; external libssh; deprecated;
function channel_request_pty(channel: Tssh_channel): longint; cdecl; external libssh; deprecated;
function channel_request_pty_size(channel: Tssh_channel; term: pchar; cols: longint; rows: longint): longint; cdecl; external libssh; deprecated;
function channel_request_shell(channel: Tssh_channel): longint; cdecl; external libssh; deprecated;
function channel_request_send_signal(channel: Tssh_channel; signum: pchar): longint; cdecl; external libssh; deprecated;
function channel_request_sftp(channel: Tssh_channel): longint; cdecl; external libssh; deprecated;
function channel_request_subsystem(channel: Tssh_channel; subsystem: pchar): longint; cdecl; external libssh; deprecated;
function channel_request_x11(channel: Tssh_channel; single_connection: longint; protocol: pchar; cookie: pchar; screen_number: longint): longint; cdecl; external libssh; deprecated;
function channel_send_eof(channel: Tssh_channel): longint; cdecl; external libssh; deprecated;
function channel_select(readchans: Pssh_channel; writechans: Pssh_channel; exceptchans: Pssh_channel; timeout: Ptimeval): longint; cdecl; external libssh; deprecated;
procedure channel_set_blocking(channel: Tssh_channel; blocking: longint); cdecl; external libssh; deprecated;
function channel_write(channel: Tssh_channel; data: pointer; len: Tuint32_t): longint; cdecl; external libssh; deprecated;
procedure privatekey_free(prv: Tssh_private_key); cdecl; external libssh; deprecated;
function privatekey_from_file(session: Tssh_session; filename: pchar; _type: longint; passphrase: pchar): Tssh_private_key; cdecl; external libssh; deprecated;
procedure publickey_free(key: Tssh_public_key); cdecl; external libssh; deprecated;
function ssh_publickey_to_file(session: Tssh_session; file_: pchar; pubkey: Tssh_string; _type: longint): longint; cdecl; external libssh; deprecated;
function publickey_from_file(session: Tssh_session; filename: pchar; _type: Plongint): Tssh_string; cdecl; external libssh; deprecated;
function publickey_from_privatekey(prv: Tssh_private_key): Tssh_public_key; cdecl; external libssh; deprecated;
function publickey_to_string(key: Tssh_public_key): Tssh_string; cdecl; external libssh; deprecated;
function ssh_try_publickey_from_file(session: Tssh_session; keyfile: pchar; publickey: Pssh_string; _type: Plongint): longint; cdecl; external libssh; deprecated;
function ssh_privatekey_type(privatekey: Tssh_private_key): Tssh_keytypes_e; cdecl; external libssh; deprecated;
function ssh_get_pubkey(session: Tssh_session): Tssh_string; cdecl; external libssh;
function ssh_message_retrieve(session: Tssh_session; packettype: Tuint32_t): Tssh_message; cdecl; external libssh;
function ssh_message_auth_publickey(msg: Tssh_message): Tssh_public_key; cdecl; external libssh;
procedure string_burn(str: Tssh_string); cdecl; external libssh; deprecated;
function string_copy(str: Tssh_string): Tssh_string; cdecl; external libssh; deprecated;
function string_data(str: Tssh_string): pointer; cdecl; external libssh; deprecated;
function string_fill(str: Tssh_string; data: pointer; len: Tsize_t): longint; cdecl; external libssh; deprecated;
procedure string_free(str: Tssh_string); cdecl; external libssh; deprecated;
function string_from_char(what: pchar): Tssh_string; cdecl; external libssh; deprecated;
function string_len(str: Tssh_string): Tsize_t; cdecl; external libssh; deprecated;
function string_new(size: Tsize_t): Tssh_string; cdecl; external libssh; deprecated;
function string_to_char(str: Tssh_string): pchar; cdecl; external libssh; deprecated;

// === Konventiert am: 2-7-25 17:32:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
