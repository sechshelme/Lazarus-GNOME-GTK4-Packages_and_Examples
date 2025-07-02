unit server;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Public include file for server support  }
{
 * This file is part of the SSH Library
 *
 * Copyright (c) 2003-2008 by Aris Adamantiadis
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  }
{*
 * @defgroup libssh_server The libssh server API
 *
 * @
  }
{$ifndef SERVER_H}
{$define SERVER_H}
{$include "libssh/libssh.h"}

const
  SERVERBANNER = CLIENTBANNER;  
{ C++ extern C conditionnal removed }
type
  Tssh_bind_options_e =  Longint;
  Const
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
  Tssh_bind = Pssh_bind_struct;
{ Callback functions  }
{*
 * @brief Incoming connection callback. This callback is called when a ssh_bind
 *        has a new incoming connection.
 * @param sshbind Current sshbind session handler
 * @param userdata Userdata to be passed to the callback function.
  }

  Tssh_bind_incoming_connection_callback = procedure (sshbind:Tssh_bind; userdata:pointer);cdecl;
{*
 * @brief These are the callbacks exported by the ssh_bind structure.
 *
 * They are called by the server module when events appear on the network.
  }
{* DON'T SET THIS use ssh_callbacks_init() instead.  }
{* A new connection is available.  }
  Pssh_bind_callbacks_struct = ^Tssh_bind_callbacks_struct;
  Tssh_bind_callbacks_struct = record
      size : Tsize_t;cdecl;
      incoming_connection : Tssh_bind_incoming_connection_callback;
    end;


  Pssh_bind_callbacks = ^Tssh_bind_callbacks;
  Tssh_bind_callbacks = Pssh_bind_callbacks_struct;
{*
 * @brief Creates a new SSH server bind.
 *
 * @return A newly allocated ssh_bind session pointer.
  }

function ssh_bind_new:Tssh_bind;cdecl;external libssh;
function ssh_bind_options_set(sshbind:Tssh_bind; _type:Tssh_bind_options_e; value:pointer):longint;cdecl;external libssh;
function ssh_bind_options_parse_config(sshbind:Tssh_bind; filename:Pchar):longint;cdecl;external libssh;
{*
 * @brief Start listening to the socket.
 *
 * @param  ssh_bind_o     The ssh server bind to use.
 *
 * @return 0 on success, < 0 on error.
  }
function ssh_bind_listen(ssh_bind_o:Tssh_bind):longint;cdecl;external libssh;
{*
 * @brief Set the callback for this bind.
 *
 * @param[in] sshbind   The bind to set the callback on.
 *
 * @param[in] callbacks An already set up ssh_bind_callbacks instance.
 *
 * @param[in] userdata  A pointer to private data to pass to the callbacks.
 *
 * @return              SSH_OK on success, SSH_ERROR if an error occurred.
 *
 * @code
 *     struct ssh_callbacks_struct cb = 
 *         .userdata = data,
 *         .auth_function = my_auth_function
 *     ;
 *     ssh_callbacks_init(&cb);
 *     ssh_bind_set_callbacks(session, &cb);
 * @endcode
  }
function ssh_bind_set_callbacks(sshbind:Tssh_bind; callbacks:Tssh_bind_callbacks; userdata:pointer):longint;cdecl;external libssh;
{*
 * @brief  Set the session to blocking/nonblocking mode.
 *
 * @param  ssh_bind_o     The ssh server bind to use.
 *
 * @param  blocking     Zero for nonblocking mode.
  }
procedure ssh_bind_set_blocking(ssh_bind_o:Tssh_bind; blocking:longint);cdecl;external libssh;
{*
 * @brief Recover the file descriptor from the session.
 *
 * @param  ssh_bind_o     The ssh server bind to get the fd from.
 *
 * @return The file descriptor.
  }
function ssh_bind_get_fd(ssh_bind_o:Tssh_bind):Tsocket_t;cdecl;external libssh;
{*
 * @brief Set the file descriptor for a session.
 *
 * @param  ssh_bind_o     The ssh server bind to set the fd.
 *
 * @param  fd           The file descriptssh_bind B
  }
procedure ssh_bind_set_fd(ssh_bind_o:Tssh_bind; fd:Tsocket_t);cdecl;external libssh;
{*
 * @brief Allow the file descriptor to accept new sessions.
 *
 * @param  ssh_bind_o     The ssh server bind to use.
  }
procedure ssh_bind_fd_toaccept(ssh_bind_o:Tssh_bind);cdecl;external libssh;
{*
 * @brief Accept an incoming ssh connection and initialize the session.
 *
 * @param  ssh_bind_o     The ssh server bind to accept a connection.
 * @param  session			A preallocated ssh session
 * @see ssh_new
 * @return SSH_OK when a connection is established
  }
function ssh_bind_accept(ssh_bind_o:Tssh_bind; session:Tssh_session):longint;cdecl;external libssh;
{*
 * @brief Accept an incoming ssh connection on the given file descriptor
 *        and initialize the session.
 *
 * @param  ssh_bind_o     The ssh server bind to accept a connection.
 * @param  session        A preallocated ssh session
 * @param  fd             A file descriptor of an already established TCP
 *                          inbound connection
 * @see ssh_new
 * @see ssh_bind_accept
 * @return SSH_OK when a connection is established
  }
function ssh_bind_accept_fd(ssh_bind_o:Tssh_bind; session:Tssh_session; fd:Tsocket_t):longint;cdecl;external libssh;
function ssh_gssapi_get_creds(session:Tssh_session):Tssh_gssapi_creds;cdecl;external libssh;
{*
 * @brief Handles the key exchange and set up encryption
 *
 * @param  session			A connected ssh session
 * @see ssh_bind_accept
 * @return SSH_OK if the key exchange was successful
  }
function ssh_handle_key_exchange(session:Tssh_session):longint;cdecl;external libssh;
{*
 * @brief Initialize the set of key exchange, hostkey, ciphers, MACs, and
 *        compression algorithms for the given ssh_session.
 *
 * The selection of algorithms and keys used are determined by the
 * options that are currently set in the given ssh_session structure.
 * May only be called before the initial key exchange has begun.
 *
 * @param session  The session structure to initialize.
 *
 * @see ssh_handle_key_exchange
 * @see ssh_options_set
 *
 * @return SSH_OK if initialization succeeds.
  }
function ssh_server_init_kex(session:Tssh_session):longint;cdecl;external libssh;
{*
 * @brief Free a ssh servers bind.
 *
 * @param  ssh_bind_o     The ssh server bind to free.
  }
procedure ssh_bind_free(ssh_bind_o:Tssh_bind);cdecl;external libssh;
{*
 * @brief Set the acceptable authentication methods to be sent to the client.
 *
 *
 * @param[in]  session  The server session
 *
 * @param[in]  auth_methods The authentication methods we will support, which
 *                          can be bitwise-or'd.
 *
 *                          Supported methods are:
 *
 *                          SSH_AUTH_METHOD_PASSWORD
 *                          SSH_AUTH_METHOD_PUBLICKEY
 *                          SSH_AUTH_METHOD_HOSTBASED
 *                          SSH_AUTH_METHOD_INTERACTIVE
 *                          SSH_AUTH_METHOD_GSSAPI_MIC
  }
procedure ssh_set_auth_methods(session:Tssh_session; auth_methods:longint);cdecl;external libssh;
{*
 * @brief Send the server's issue-banner to client.
 *
 *
 * @param[in]  session      The server session.
 *
 * @param[in]  banner       The server's banner.
 *
 * @return                  SSH_OK on success, SSH_ERROR on error.
  }
function ssh_send_issue_banner(session:Tssh_session; banner:Tssh_string):longint;cdecl;external libssh;
{*********************************************************
 * SERVER MESSAGING
 ********************************************************* }
{*
 * @brief Reply with a standard reject message.
 *
 * Use this function if you don't know what to respond or if you want to reject
 * a request.
 *
 * @param[in] msg       The message to use for the reply.
 *
 * @return              0 on success, -1 on error.
 *
 * @see ssh_message_get()
  }
function ssh_message_reply_default(msg:Tssh_message):longint;cdecl;external libssh;
{*
 * @brief Get the name of the authenticated user.
 *
 * @param[in] msg       The message to get the username from.
 *
 * @return              The username or NULL if an error occurred.
 *
 * @see ssh_message_get()
 * @see ssh_message_type()
  }
function ssh_message_auth_user(msg:Tssh_message):Pchar;cdecl;external libssh;
{*
 * @brief Get the password of the authenticated user.
 *
 * @param[in] msg       The message to get the password from.
 *
 * @return              The username or NULL if an error occurred.
 *
 * @see ssh_message_get()
 * @see ssh_message_type()
 * @deprecated This function should not be used anymore as there is a
 * callback based server implementation now auth_password_function.
  }
{SSH_DEPRECATED }(* Const before type ignored *)
function ssh_message_auth_password(msg:Tssh_message):Pchar;cdecl;external libssh;
{*
 * @brief Get the publickey of the authenticated user.
 *
 * If you need the key for later user you should duplicate it.
 *
 * @param[in] msg       The message to get the public key from.
 *
 * @return              The public key or NULL.
 *
 * @see ssh_key_dup()
 * @see ssh_key_cmp()
 * @see ssh_message_get()
 * @see ssh_message_type()
 * @deprecated This function should not be used anymore as there is a
 * callback based server implementation auth_pubkey_function.
  }
{SSH_DEPRECATED }function ssh_message_auth_pubkey(msg:Tssh_message):Tssh_key;cdecl;external libssh;
function ssh_message_auth_kbdint_is_response(msg:Tssh_message):longint;cdecl;external libssh;
{*
 * @param[in] msg       The message to get the public key state from.
 *
 * @deprecated This function should not be used anymore as there is a
 * callback based server implementation auth_pubkey_function
  }
{SSH_DEPRECATED }function ssh_message_auth_publickey_state(msg:Tssh_message):Tssh_publickey_state_e;cdecl;external libssh;
function ssh_message_auth_reply_success(msg:Tssh_message; partial:longint):longint;cdecl;external libssh;
function ssh_message_auth_reply_pk_ok(msg:Tssh_message; algo:Tssh_string; pubkey:Tssh_string):longint;cdecl;external libssh;
function ssh_message_auth_reply_pk_ok_simple(msg:Tssh_message):longint;cdecl;external libssh;
function ssh_message_auth_set_methods(msg:Tssh_message; methods:longint):longint;cdecl;external libssh;
function ssh_message_auth_interactive_request(msg:Tssh_message; name:Pchar; instruction:Pchar; num_prompts:dword; prompts:PPchar; 
           echo:Pchar):longint;cdecl;external libssh;
function ssh_message_service_reply_success(msg:Tssh_message):longint;cdecl;external libssh;
function ssh_message_service_service(msg:Tssh_message):Pchar;cdecl;external libssh;
function ssh_message_global_request_reply_success(msg:Tssh_message; bound_port:Tuint16_t):longint;cdecl;external libssh;
procedure ssh_set_message_callback(session:Tssh_session; ssh_bind_message_callback:function (session:Tssh_session; msg:Tssh_message; data:pointer):longint; data:pointer);cdecl;external libssh;
function ssh_execute_message_callbacks(session:Tssh_session):longint;cdecl;external libssh;
function ssh_message_channel_request_open_originator(msg:Tssh_message):Pchar;cdecl;external libssh;
function ssh_message_channel_request_open_originator_port(msg:Tssh_message):longint;cdecl;external libssh;
function ssh_message_channel_request_open_destination(msg:Tssh_message):Pchar;cdecl;external libssh;
function ssh_message_channel_request_open_destination_port(msg:Tssh_message):longint;cdecl;external libssh;
function ssh_message_channel_request_channel(msg:Tssh_message):Tssh_channel;cdecl;external libssh;
{ Replaced by callback based server implementation function channel_pty_request_function }
{SSH_DEPRECATED }(* Const before type ignored *)
function ssh_message_channel_request_pty_term(msg:Tssh_message):Pchar;cdecl;external libssh;
{SSH_DEPRECATED }function ssh_message_channel_request_pty_width(msg:Tssh_message):longint;cdecl;external libssh;
{SSH_DEPRECATED }function ssh_message_channel_request_pty_height(msg:Tssh_message):longint;cdecl;external libssh;
{SSH_DEPRECATED }function ssh_message_channel_request_pty_pxwidth(msg:Tssh_message):longint;cdecl;external libssh;
{SSH_DEPRECATED }function ssh_message_channel_request_pty_pxheight(msg:Tssh_message):longint;cdecl;external libssh;
function ssh_message_channel_request_env_name(msg:Tssh_message):Pchar;cdecl;external libssh;
function ssh_message_channel_request_env_value(msg:Tssh_message):Pchar;cdecl;external libssh;
function ssh_message_channel_request_command(msg:Tssh_message):Pchar;cdecl;external libssh;
function ssh_message_channel_request_subsystem(msg:Tssh_message):Pchar;cdecl;external libssh;
{ Replaced by callback based server implementation function channel_open_request_x11_function }
{SSH_DEPRECATED }function ssh_message_channel_request_x11_single_connection(msg:Tssh_message):longint;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function ssh_message_channel_request_x11_auth_protocol(msg:Tssh_message):Pchar;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function ssh_message_channel_request_x11_auth_cookie(msg:Tssh_message):Pchar;cdecl;external libssh;
{SSH_DEPRECATED }function ssh_message_channel_request_x11_screen_number(msg:Tssh_message):longint;cdecl;external libssh;
function ssh_message_global_request_address(msg:Tssh_message):Pchar;cdecl;external libssh;
function ssh_message_global_request_port(msg:Tssh_message):longint;cdecl;external libssh;
function ssh_channel_open_reverse_forward(channel:Tssh_channel; remotehost:Pchar; remoteport:longint; sourcehost:Pchar; localport:longint):longint;cdecl;external libssh;
function ssh_channel_open_x11(channel:Tssh_channel; orig_addr:Pchar; orig_port:longint):longint;cdecl;external libssh;
function ssh_channel_request_send_exit_status(channel:Tssh_channel; exit_status:longint):longint;cdecl;external libssh;
function ssh_channel_request_send_exit_signal(channel:Tssh_channel; signum:Pchar; core:longint; errmsg:Pchar; lang:Pchar):longint;cdecl;external libssh;
function ssh_send_keepalive(session:Tssh_session):longint;cdecl;external libssh;
{ deprecated functions  }
{SSH_DEPRECATED }function ssh_accept(session:Tssh_session):longint;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function channel_write_stderr(channel:Tssh_channel; data:pointer; len:Tuint32_t):longint;cdecl;external libssh;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ SERVER_H  }
{* @  }

// === Konventiert am: 2-7-25 17:32:29 ===


implementation



end.
