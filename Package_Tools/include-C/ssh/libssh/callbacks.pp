
unit callbacks;
interface

{
  Automatically converted by H2Pas 1.0.0 from callbacks.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    callbacks.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Pssh_callbacks  = ^ssh_callbacks;
Pssh_callbacks_struct  = ^ssh_callbacks_struct;
Pssh_channel_callbacks  = ^ssh_channel_callbacks;
Pssh_channel_callbacks_struct  = ^ssh_channel_callbacks_struct;
Pssh_key_struct  = ^ssh_key_struct;
Pssh_packet_callback  = ^ssh_packet_callback;
Pssh_packet_callbacks  = ^ssh_packet_callbacks;
Pssh_packet_callbacks_struct  = ^ssh_packet_callbacks_struct;
Pssh_server_callbacks  = ^ssh_server_callbacks;
Pssh_server_callbacks_struct  = ^ssh_server_callbacks_struct;
Pssh_socket_callbacks  = ^ssh_socket_callbacks;
Pssh_socket_callbacks_struct  = ^ssh_socket_callbacks_struct;
Pssh_string  = ^ssh_string;
Pssh_threads_callbacks_struct  = ^ssh_threads_callbacks_struct;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of the SSH Library
 *
 * Copyright (c) 2009 Aris Adamantiadis <aris@0xbadc0de.be>
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
{ callback.h
 * This file includes the public declarations for the libssh callback mechanism
  }
{$ifndef _SSH_CALLBACK_H}
{$define _SSH_CALLBACK_H}
{$include <libssh/libssh.h>}
{$include <string.h>}
{ C++ extern C conditionnal removed }
{*
 * @defgroup libssh_callbacks The libssh callbacks
 * @ingroup libssh
 *
 * Callback which can be replaced in libssh.
 *
 * @
  }
{* @internal
 * @brief callback to process simple codes
 * @param code value to transmit
 * @param user Userdata to pass in callback
  }
type

  Tssh_callback_int = procedure (code:longint; user:pointer);cdecl;
{* @internal
 * @brief callback for data received messages.
 * @param data data retrieved from the socket or stream
 * @param len number of bytes available from this stream
 * @param user user-supplied pointer sent along with all callback messages
 * @returns number of bytes processed by the callee. The remaining bytes will
 * be sent in the next callback message, when more data is available.
  }
(* Const before type ignored *)

  Tssh_callback_data = function (data:pointer; len:Tsize_t; user:pointer):Tsize_t;cdecl;

  Tssh_callback_int_int = procedure (code:longint; errno_code:longint; user:pointer);cdecl;

  Tssh_message_callback = function (para1:Tssh_session; message:Tssh_message; user:pointer):longint;cdecl;

  Tssh_channel_callback_int = function (channel:Tssh_channel; code:longint; user:pointer):longint;cdecl;

  Tssh_channel_callback_data = function (channel:Tssh_channel; code:longint; data:pointer; len:Tsize_t; user:pointer):longint;cdecl;
{*
 * @brief SSH log callback. All logging messages will go through this callback
 * @param session Current session handler
 * @param priority Priority of the log, the smaller being the more important
 * @param message the actual message
 * @param userdata Userdata to be passed to the callback function.
  }
(* Const before type ignored *)

  Tssh_log_callback = procedure (session:Tssh_session; priority:longint; message:Pchar; userdata:pointer);cdecl;
{*
 * @brief SSH log callback.
 *
 * All logging messages will go through this callback.
 *
 * @param priority  Priority of the log, the smaller being the more important.
 *
 * @param function  The function name calling the logging functions.
 *
 * @param buffer   The actual message
 *
 * @param userdata Userdata to be passed to the callback function.
  }
(* Const before type ignored *)
(* Const before type ignored *)

  Tssh_logging_callback = procedure (priority:longint; _function:Pchar; buffer:Pchar; userdata:pointer);cdecl;
{*
 * @brief SSH Connection status callback.
 * @param session Current session handler
 * @param status Percentage of connection status, going from 0.0 to 1.0
 * once connection is done.
 * @param userdata Userdata to be passed to the callback function.
  }

  Tssh_status_callback = procedure (session:Tssh_session; status:single; userdata:pointer);cdecl;
{*
 * @brief SSH global request callback. All global request will go through this
 * callback.
 * @param session Current session handler
 * @param message the actual message
 * @param userdata Userdata to be passed to the callback function.
  }

  Tssh_global_request_callback = procedure (session:Tssh_session; message:Tssh_message; userdata:pointer);cdecl;
{*
 * @brief Handles an SSH new channel open X11 request. This happens when the server
 * sends back an X11 connection attempt. This is a client-side API
 * @param session current session handler
 * @param userdata Userdata to be passed to the callback function.
 * @param originator_address    IP address of the machine who sent the request
 * @param originator_port   port number of the machine who sent the request
 * @returns a valid ssh_channel handle if the request is to be allowed
 * @returns NULL if the request should not be allowed
 * @warning The channel pointer returned by this callback must be closed by the application.
  }
(* Const before type ignored *)

  Tssh_channel_open_request_x11_callback = function (session:Tssh_session; originator_address:Pchar; originator_port:longint; userdata:pointer):Tssh_channel;cdecl;
{*
 * @brief Handles an SSH new channel open "auth-agent" request. This happens when the server
 * sends back an "auth-agent" connection attempt. This is a client-side API
 * @param session current session handler
 * @param userdata Userdata to be passed to the callback function.
 * @returns a valid ssh_channel handle if the request is to be allowed
 * @returns NULL if the request should not be allowed
 * @warning The channel pointer returned by this callback must be closed by the application.
  }

  Tssh_channel_open_request_auth_agent_callback = function (session:Tssh_session; userdata:pointer):Tssh_channel;cdecl;
{*
 * The structure to replace libssh functions with appropriate callbacks.
  }
{* DON'T SET THIS use ssh_callbacks_init() instead.  }
{*
   * User-provided data. User is free to set anything he wants here
    }
{*
   * This functions will be called if e.g. a keyphrase is needed.
    }
{*
   * This function will be called each time a loggable event happens.
    }
{*
   * This function gets called during connection time to indicate the
   * percentage of connection steps completed.
    }
{*
   * This function will be called each time a global request is received.
    }
{* This function will be called when an incoming X11 request is received.
    }
{* This function will be called when an incoming "auth-agent" request is received.
    }
  Pssh_callbacks_struct = ^Tssh_callbacks_struct;
  Tssh_callbacks_struct = record
      size : Tsize_t;cdecl;
      userdata : pointer;
      auth_function : Tssh_auth_callback;
      log_function : Tssh_log_callback;
      connect_status_function : procedure (userdata:pointer; status:single);cdecl;
      global_request_function : Tssh_global_request_callback;
      channel_open_request_x11_function : Tssh_channel_open_request_x11_callback;
      channel_open_request_auth_agent_function : Tssh_channel_open_request_auth_agent_callback;
    end;


  Pssh_callbacks = ^Tssh_callbacks;
  Tssh_callbacks = Pssh_callbacks_struct;
{* These are callbacks used specifically in SSH servers.
  }
{*
 * @brief SSH authentication callback.
 * @param session Current session handler
 * @param user User that wants to authenticate
 * @param password Password used for authentication
 * @param userdata Userdata to be passed to the callback function.
 * @returns SSH_AUTH_SUCCESS Authentication is accepted.
 * @returns SSH_AUTH_PARTIAL Partial authentication, more authentication means are needed.
 * @returns SSH_AUTH_DENIED Authentication failed.
  }
(* Const before type ignored *)
(* Const before type ignored *)

  Tssh_auth_password_callback = function (session:Tssh_session; user:Pchar; password:Pchar; userdata:pointer):longint;cdecl;
{*
 * @brief SSH authentication callback. Tries to authenticates user with the "none" method
 * which is anonymous or passwordless.
 * @param session Current session handler
 * @param user User that wants to authenticate
 * @param userdata Userdata to be passed to the callback function.
 * @returns SSH_AUTH_SUCCESS Authentication is accepted.
 * @returns SSH_AUTH_PARTIAL Partial authentication, more authentication means are needed.
 * @returns SSH_AUTH_DENIED Authentication failed.
  }
(* Const before type ignored *)

  Tssh_auth_none_callback = function (session:Tssh_session; user:Pchar; userdata:pointer):longint;cdecl;
{*
 * @brief SSH authentication callback. Tries to authenticates user with the "gssapi-with-mic" method
 * @param session Current session handler
 * @param user Username of the user (can be spoofed)
 * @param principal Authenticated principal of the user, including realm.
 * @param userdata Userdata to be passed to the callback function.
 * @returns SSH_AUTH_SUCCESS Authentication is accepted.
 * @returns SSH_AUTH_PARTIAL Partial authentication, more authentication means are needed.
 * @returns SSH_AUTH_DENIED Authentication failed.
 * @warning Implementations should verify that parameter user matches in some way the principal.
 * user and principal can be different. Only the latter is guaranteed to be safe.
  }
(* Const before type ignored *)
(* Const before type ignored *)

  Tssh_auth_gssapi_mic_callback = function (session:Tssh_session; user:Pchar; principal:Pchar; userdata:pointer):longint;cdecl;
{*
 * @brief SSH authentication callback.
 * @param session Current session handler
 * @param user User that wants to authenticate
 * @param pubkey public key used for authentication
 * @param signature_state SSH_PUBLICKEY_STATE_NONE if the key is not signed (simple public key probe),
 *							SSH_PUBLICKEY_STATE_VALID if the signature is valid. Others values should be
 *							replied with a SSH_AUTH_DENIED.
 * @param userdata Userdata to be passed to the callback function.
 * @returns SSH_AUTH_SUCCESS Authentication is accepted.
 * @returns SSH_AUTH_PARTIAL Partial authentication, more authentication means are needed.
 * @returns SSH_AUTH_DENIED Authentication failed.
  }
(* Const before type ignored *)

  Tssh_auth_pubkey_callback = function (session:Tssh_session; user:Pchar; pubkey:Pssh_key_struct; signature_state:char; userdata:pointer):longint;cdecl;
{*
 * @brief Handles an SSH service request
 * @param session current session handler
 * @param service name of the service (e.g. "ssh-userauth") requested
 * @param userdata Userdata to be passed to the callback function.
 * @returns 0 if the request is to be allowed
 * @returns -1 if the request should not be allowed
  }
(* Const before type ignored *)

  Tssh_service_request_callback = function (session:Tssh_session; service:Pchar; userdata:pointer):longint;cdecl;
{*
 * @brief Handles an SSH new channel open session request
 * @param session current session handler
 * @param userdata Userdata to be passed to the callback function.
 * @returns a valid ssh_channel handle if the request is to be allowed
 * @returns NULL if the request should not be allowed
 * @warning The channel pointer returned by this callback must be closed by the application.
  }

  Tssh_channel_open_request_session_callback = function (session:Tssh_session; userdata:pointer):Tssh_channel;cdecl;
{
 * @brief handle the beginning of a GSSAPI authentication, server side.
 * @param session current session handler
 * @param user the username of the client
 * @param n_oid number of available oids
 * @param oids OIDs provided by the client
 * @returns an ssh_string containing the chosen OID, that's supported by both
 * client and server.
 * @warning It is not necessary to fill this callback in if libssh is linked
 * with libgssapi.
  }
(* Const before type ignored *)

  Tssh_gssapi_select_oid_callback = function (session:Tssh_session; user:Pchar; n_oid:longint; oids:Pssh_string; userdata:pointer):Tssh_string;cdecl;
{
 * @brief handle the negotiation of a security context, server side.
 * @param session current session handler
 * @param[in] input_token input token provided by client
 * @param[out] output_token output of the gssapi accept_sec_context method,
 *				NULL after completion.
 * @returns SSH_OK if the token was generated correctly or accept_sec_context
 * returned GSS_S_COMPLETE
 * @returns SSH_ERROR in case of error
 * @warning It is not necessary to fill this callback in if libssh is linked
 * with libgssapi.
  }

  Tssh_gssapi_accept_sec_ctx_callback = function (session:Tssh_session; input_token:Tssh_string; output_token:Pssh_string; userdata:pointer):longint;cdecl;
{
 * @brief Verify and authenticates a MIC, server side.
 * @param session current session handler
 * @param[in] mic input mic to be verified provided by client
 * @param[in] mic_buffer buffer of data to be signed.
 * @param[in] mic_buffer_size size of mic_buffer
 * @returns SSH_OK if the MIC was authenticated correctly
 * @returns SSH_ERROR in case of error
 * @warning It is not necessary to fill this callback in if libssh is linked
 * with libgssapi.
  }

  Tssh_gssapi_verify_mic_callback = function (session:Tssh_session; mic:Tssh_string; mic_buffer:pointer; mic_buffer_size:Tsize_t; userdata:pointer):longint;cdecl;
{*
 * This structure can be used to implement a libssh server, with appropriate callbacks.
  }
{* DON'T SET THIS use ssh_callbacks_init() instead.  }
{*
   * User-provided data. User is free to set anything he wants here
    }
{* This function gets called when a client tries to authenticate through
   * password method.
    }
{* This function gets called when a client tries to authenticate through
   * none method.
    }
{* This function gets called when a client tries to authenticate through
   * gssapi-mic method.
    }
{* this function gets called when a client tries to authenticate or offer
   * a public key.
    }
{* This functions gets called when a service request is issued by the
   * client
    }
{* This functions gets called when a new channel request is issued by
   * the client
    }
{* This function will be called when a new gssapi authentication is attempted.
    }
{* This function will be called when a gssapi token comes in.
    }
{ This function will be called when a MIC needs to be verified.
    }
  Pssh_server_callbacks_struct = ^Tssh_server_callbacks_struct;
  Tssh_server_callbacks_struct = record
      size : Tsize_t;cdecl;
      userdata : pointer;
      auth_password_function : Tssh_auth_password_callback;
      auth_none_function : Tssh_auth_none_callback;
      auth_gssapi_mic_function : Tssh_auth_gssapi_mic_callback;
      auth_pubkey_function : Tssh_auth_pubkey_callback;
      service_request_function : Tssh_service_request_callback;
      channel_open_request_session_function : Tssh_channel_open_request_session_callback;
      gssapi_select_oid_function : Tssh_gssapi_select_oid_callback;
      gssapi_accept_sec_ctx_function : Tssh_gssapi_accept_sec_ctx_callback;
      gssapi_verify_mic_function : Tssh_gssapi_verify_mic_callback;
    end;


  Pssh_server_callbacks = ^Tssh_server_callbacks;
  Tssh_server_callbacks = Pssh_server_callbacks_struct;
{*
 * @brief Set the session server callback functions.
 *
 * This functions sets the callback structure to use your own callback
 * functions for user authentication, new channels and requests.
 *
 * Note, that the structure is not copied to the session structure so it needs
 * to be valid for the whole session lifetime.
 *
 * @code
 * struct ssh_server_callbacks_struct cb = 
 *   .userdata = data,
 *   .auth_password_function = my_auth_function
 * ;
 * ssh_callbacks_init(&cb);
 * ssh_set_server_callbacks(session, &cb);
 * @endcode
 *
 * @param  session      The session to set the callback structure.
 *
 * @param  cb           The callback structure itself.
 *
 * @return SSH_OK on success, SSH_ERROR on error.
  }

function ssh_set_server_callbacks(session:Tssh_session; cb:Tssh_server_callbacks):longint;cdecl;external;
{*
 * These are the callbacks exported by the socket structure
 * They are called by the socket module when a socket event appears
  }
{*
   * User-provided data. User is free to set anything he wants here
    }
{*
	 * This function will be called each time data appears on socket. The data
	 * not consumed will appear on the next data event.
	  }
{* This function will be called each time a controlflow state changes, i.e.
   * the socket is available for reading or writing.
    }
{* This function will be called each time an exception appears on socket. An
   * exception can be a socket problem (timeout, ...) or an end-of-file.
    }
{* This function is called when the ssh_socket_connect was used on the socket
   * on nonblocking state, and the connection succeeded.
    }
type
  Pssh_socket_callbacks_struct = ^Tssh_socket_callbacks_struct;
  Tssh_socket_callbacks_struct = record
      userdata : pointer;
      data : Tssh_callback_data;
      controlflow : Tssh_callback_int;
      exception : Tssh_callback_int_int;
      connected : Tssh_callback_int_int;
    end;


  Pssh_socket_callbacks = ^Tssh_socket_callbacks;
  Tssh_socket_callbacks = Pssh_socket_callbacks_struct;

const
  SSH_SOCKET_FLOW_WRITEWILLBLOCK = 1;  
  SSH_SOCKET_FLOW_WRITEWONTBLOCK = 2;  
  SSH_SOCKET_EXCEPTION_EOF = 1;  
  SSH_SOCKET_EXCEPTION_ERROR = 2;  
  SSH_SOCKET_CONNECTED_OK = 1;  
  SSH_SOCKET_CONNECTED_ERROR = 2;  
  SSH_SOCKET_CONNECTED_TIMEOUT = 3;  
{*
 * @brief Initializes an ssh_callbacks_struct
 * A call to this macro is mandatory when you have set a new
 * ssh_callback_struct structure. Its goal is to maintain the binary
 * compatibility with future versions of libssh as the structure
 * evolves with time.
  }
{
xxxxxxxxxxxxxxxxxxxxx
#define ssh_callbacks_init(p) do \
	(p)->size=sizeof(*(p)); \
 while(0);
 }
{*
 * @internal
 * @brief tests if a callback can be called without crash
 *  verifies that the struct size if big enough
 *  verifies that the callback pointer exists
 * @param p callback pointer
 * @param c callback name
 * @returns nonzero if callback can be called
  }
{
xxxxxxxxxxxxxxxxxxxxx
#define ssh_callbacks_exists(p,c) (\
  (p != NULL) && ( (char *)&((p)-> c) < (char *)(p) + (p)->size ) && \
  ((p)-> c != NULL) \
  )
 }
{*
 * @internal
 *
 * @brief Iterate through a list of callback structures
 *
 * This tests for their validity and executes them. The userdata argument is
 * automatically passed through.
 *
 * @param list     list of callbacks
 *
 * @param cbtype   type of the callback
 *
 * @param c        callback name
 *
 * @param va_args parameters to be passed
  }
{
xxxxxxxxxxxxxxxxxxxxx
#define ssh_callbacks_execute_list(list, cbtype, c, ...)      \
    do                                                       \
        struct ssh_iterator *i = ssh_list_get_iterator(list); \
        cbtype cb;                                            \
        while (i != NULL)                                    \
            cb = ssh_iterator_value(cbtype, i);               \
            if (ssh_callbacks_exists(cb, c))                  \
                cb-> c (__VA_ARGS__, cb->userdata);           \
            i = i->next;                                      \
                                                             \
     while(0)
 }
{*
 * @internal
 *
 * @brief iterate through a list of callback structures.
 *
 * This tests for their validity and give control back to the calling code to
 * execute them. Caller can decide to break the loop or continue executing the
 * callbacks with different parameters
 *
 * @code
 * ssh_callbacks_iterate(channel->callbacks, ssh_channel_callbacks,
 *                     channel_eof_function)
 *     rc = ssh_callbacks_iterate_exec(session, channel);
 *     if (rc != SSH_OK)
 *         break;
 *     
 * 
 * ssh_callbacks_iterate_end();
 * @endcode
  }
{
xxxxxxxxxxxxxxxxxxxxx
#define ssh_callbacks_iterate(_cb_list, _cb_type, _cb_name)           \
    do                                                               \
        struct ssh_iterator *_cb_i = ssh_list_get_iterator(_cb_list); \
        _cb_type _cb;                                                 \
        for (; _cb_i != NULL; _cb_i = _cb_i->next)                   \
            _cb = ssh_iterator_value(_cb_type, _cb_i);                \
            if (ssh_callbacks_exists(_cb, _cb_name))

#define ssh_callbacks_iterate_exec(_cb_name, ...) \
                _cb->_cb_name(__VA_ARGS__, _cb->userdata)

#define ssh_callbacks_iterate_end() \
                                   \
     while(0)
  }
{* @brief Prototype for a packet callback, to be called when a new packet arrives
 * @param session The current session of the packet
 * @param type packet type (see ssh2.h)
 * @param packet buffer containing the packet, excluding size, type and padding fields
 * @param user user argument to the callback
 * and are called each time a packet shows up
 * @returns SSH_PACKET_USED Packet was parsed and used
 * @returns SSH_PACKET_NOT_USED Packet was not used or understood, processing must continue
  }
type

  Tssh_packet_callback = function (session:Tssh_session; _type:Tuint8_t; packet:Tssh_buffer; user:pointer):longint;cdecl;
{* return values for a ssh_packet_callback  }
{* Packet was used and should not be parsed by another callback  }

const
  SSH_PACKET_USED = 1;  
{* Packet was not used and should be passed to any other callback
 * available  }
  SSH_PACKET_NOT_USED = 2;  
{* @brief This macro declares a packet callback handler
 * @code
 * SSH_PACKET_CALLBACK(mycallback)
 * ...
 * 
 * @endcode
  }
{#define SSH_PACKET_CALLBACK(name) \ }
{	int name (ssh_session session, uint8_t type, ssh_buffer packet, void *user) }
{* Index of the first packet type being handled  }
{* Number of packets being handled by this callback struct  }
{* A pointer to n_callbacks packet callbacks  }
{*
   * User-provided data. User is free to set anything he wants here
    }
type
  Pssh_packet_callbacks_struct = ^Tssh_packet_callbacks_struct;
  Tssh_packet_callbacks_struct = record
      start : Tuint8_t;cdecl;
      n_callbacks : Tuint8_t;
      callbacks : Pssh_packet_callback;
      user : pointer;
    end;


  Pssh_packet_callbacks = ^Tssh_packet_callbacks;
  Tssh_packet_callbacks = Pssh_packet_callbacks_struct;
{*
 * @brief Set the session callback functions.
 *
 * This functions sets the callback structure to use your own callback
 * functions for auth, logging and status.
 *
 * Note, that the callback structure is not copied into the session so it needs
 * to be valid for the whole session lifetime.
 *
 * @code
 * struct ssh_callbacks_struct cb = 
 *   .userdata = data,
 *   .auth_function = my_auth_function
 * ;
 * ssh_callbacks_init(&cb);
 * ssh_set_callbacks(session, &cb);
 * @endcode
 *
 * @param  session      The session to set the callback structure.
 *
 * @param  cb           The callback structure itself.
 *
 * @return SSH_OK on success, SSH_ERROR on error.
  }

function ssh_set_callbacks(session:Tssh_session; cb:Tssh_callbacks):longint;cdecl;external;
{*
 * @brief SSH channel data callback. Called when data is available on a channel
 * @param session Current session handler
 * @param channel the actual channel
 * @param data the data that has been read on the channel
 * @param len the length of the data
 * @param is_stderr is 0 for stdout or 1 for stderr
 * @param userdata Userdata to be passed to the callback function.
 * @returns number of bytes processed by the callee. The remaining bytes will
 * be sent in the next callback message, when more data is available.
  }
type

  Tssh_channel_data_callback = function (session:Tssh_session; channel:Tssh_channel; data:pointer; len:Tuint32_t; is_stderr:longint; 
               userdata:pointer):longint;cdecl;
{*
 * @brief SSH channel eof callback. Called when a channel receives EOF
 * @param session Current session handler
 * @param channel the actual channel
 * @param userdata Userdata to be passed to the callback function.
  }

  Tssh_channel_eof_callback = procedure (session:Tssh_session; channel:Tssh_channel; userdata:pointer);cdecl;
{*
 * @brief SSH channel close callback. Called when a channel is closed by remote peer
 * @param session Current session handler
 * @param channel the actual channel
 * @param userdata Userdata to be passed to the callback function.
  }

  Tssh_channel_close_callback = procedure (session:Tssh_session; channel:Tssh_channel; userdata:pointer);cdecl;
{*
 * @brief SSH channel signal callback. Called when a channel has received a signal
 * @param session Current session handler
 * @param channel the actual channel
 * @param signal the signal name (without the SIG prefix)
 * @param userdata Userdata to be passed to the callback function.
  }
(* Const before type ignored *)

  Tssh_channel_signal_callback = procedure (session:Tssh_session; channel:Tssh_channel; signal:Pchar; userdata:pointer);cdecl;
{*
 * @brief SSH channel exit status callback. Called when a channel has received an exit status
 * @param session Current session handler
 * @param channel the actual channel
 * @param exit_status Exit status of the ran command
 * @param userdata Userdata to be passed to the callback function.
  }

  Tssh_channel_exit_status_callback = procedure (session:Tssh_session; channel:Tssh_channel; exit_status:longint; userdata:pointer);cdecl;
{*
 * @brief SSH channel exit signal callback. Called when a channel has received an exit signal
 * @param session Current session handler
 * @param channel the actual channel
 * @param signal the signal name (without the SIG prefix)
 * @param core a boolean telling whether a core has been dumped or not
 * @param errmsg the description of the exception
 * @param lang the language of the description (format: RFC 3066)
 * @param userdata Userdata to be passed to the callback function.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  Tssh_channel_exit_signal_callback = procedure (session:Tssh_session; channel:Tssh_channel; signal:Pchar; core:longint; errmsg:Pchar; 
                lang:Pchar; userdata:pointer);cdecl;
{*
 * @brief SSH channel PTY request from a client.
 * @param session the session
 * @param channel the channel
 * @param term The type of terminal emulation
 * @param width width of the terminal, in characters
 * @param height height of the terminal, in characters
 * @param pxwidth width of the terminal, in pixels
 * @param pwheight height of the terminal, in pixels
 * @param userdata Userdata to be passed to the callback function.
 * @returns 0 if the pty request is accepted
 * @returns -1 if the request is denied
  }
(* Const before type ignored *)

  Tssh_channel_pty_request_callback = function (session:Tssh_session; channel:Tssh_channel; term:Pchar; width:longint; height:longint; 
               pxwidth:longint; pwheight:longint; userdata:pointer):longint;cdecl;
{*
 * @brief SSH channel Shell request from a client.
 * @param session the session
 * @param channel the channel
 * @param userdata Userdata to be passed to the callback function.
 * @returns 0 if the shell request is accepted
 * @returns 1 if the request is denied
  }

  Tssh_channel_shell_request_callback = function (session:Tssh_session; channel:Tssh_channel; userdata:pointer):longint;cdecl;
{*
 * @brief SSH auth-agent-request from the client. This request is
 * sent by a client when agent forwarding is available.
 * Server is free to ignore this callback, no answer is expected.
 * @param session the session
 * @param channel the channel
 * @param userdata Userdata to be passed to the callback function.
  }

  Tssh_channel_auth_agent_req_callback = procedure (session:Tssh_session; channel:Tssh_channel; userdata:pointer);cdecl;
{*
 * @brief SSH X11 request from the client. This request is
 * sent by a client when X11 forwarding is requested(and available).
 * Server is free to ignore this callback, no answer is expected.
 * @param session the session
 * @param channel the channel
 * @param single_connection If true, only one channel should be forwarded
 * @param auth_protocol The X11 authentication method to be used
 * @param auth_cookie   Authentication cookie encoded hexadecimal
 * @param screen_number Screen number
 * @param userdata Userdata to be passed to the callback function.
  }
(* Const before type ignored *)
(* Const before type ignored *)

  Tssh_channel_x11_req_callback = procedure (session:Tssh_session; channel:Tssh_channel; single_connection:longint; auth_protocol:Pchar; auth_cookie:Pchar; 
                screen_number:Tuint32_t; userdata:pointer);cdecl;
{*
 * @brief SSH channel PTY windows change (terminal size) from a client.
 * @param session the session
 * @param channel the channel
 * @param width width of the terminal, in characters
 * @param height height of the terminal, in characters
 * @param pxwidth width of the terminal, in pixels
 * @param pwheight height of the terminal, in pixels
 * @param userdata Userdata to be passed to the callback function.
 * @returns 0 if the pty request is accepted
 * @returns -1 if the request is denied
  }

  Tssh_channel_pty_window_change_callback = function (session:Tssh_session; channel:Tssh_channel; width:longint; height:longint; pxwidth:longint; 
               pwheight:longint; userdata:pointer):longint;cdecl;
{*
 * @brief SSH channel Exec request from a client.
 * @param session the session
 * @param channel the channel
 * @param command the shell command to be executed
 * @param userdata Userdata to be passed to the callback function.
 * @returns 0 if the exec request is accepted
 * @returns 1 if the request is denied
  }
(* Const before type ignored *)

  Tssh_channel_exec_request_callback = function (session:Tssh_session; channel:Tssh_channel; command:Pchar; userdata:pointer):longint;cdecl;
{*
 * @brief SSH channel environment request from a client.
 * @param session the session
 * @param channel the channel
 * @param env_name name of the environment value to be set
 * @param env_value value of the environment value to be set
 * @param userdata Userdata to be passed to the callback function.
 * @returns 0 if the env request is accepted
 * @returns 1 if the request is denied
 * @warning some environment variables can be dangerous if changed (e.g.
 * 			LD_PRELOAD) and should not be fulfilled.
  }
(* Const before type ignored *)
(* Const before type ignored *)

  Tssh_channel_env_request_callback = function (session:Tssh_session; channel:Tssh_channel; env_name:Pchar; env_value:Pchar; userdata:pointer):longint;cdecl;
{*
 * @brief SSH channel subsystem request from a client.
 * @param session the session
 * @param channel the channel
 * @param subsystem the subsystem required
 * @param userdata Userdata to be passed to the callback function.
 * @returns 0 if the subsystem request is accepted
 * @returns 1 if the request is denied
  }
(* Const before type ignored *)

  Tssh_channel_subsystem_request_callback = function (session:Tssh_session; channel:Tssh_channel; subsystem:Pchar; userdata:pointer):longint;cdecl;
{*
 * @brief SSH channel write will not block (flow control).
 *
 * @param session the session
 *
 * @param channel the channel
 *
 * @param[in] bytes size of the remote window in bytes. Writing as much data
 *            will not block.
 *
 * @param[in] userdata Userdata to be passed to the callback function.
 *
 * @returns 0 default return value (other return codes may be added in future).
  }

  Tssh_channel_write_wontblock_callback = function (session:Tssh_session; channel:Tssh_channel; bytes:Tuint32_t; userdata:pointer):longint;cdecl;
{* DON'T SET THIS use ssh_callbacks_init() instead.  }
{*
   * User-provided data. User is free to set anything he wants here
    }
{*
   * This functions will be called when there is data available.
    }
{*
   * This functions will be called when the channel has received an EOF.
    }
{*
   * This functions will be called when the channel has been closed by remote
    }
{*
   * This functions will be called when a signal has been received
    }
{*
   * This functions will be called when an exit status has been received
    }
{*
   * This functions will be called when an exit signal has been received
    }
{*
   * This function will be called when a client requests a PTY
    }
{*
   * This function will be called when a client requests a shell
    }
{* This function will be called when a client requests agent
   * authentication forwarding.
    }
{* This function will be called when a client requests X11
   * forwarding.
    }
{* This function will be called when a client requests a
   * window change.
    }
{* This function will be called when a client requests a
   * command execution.
    }
{* This function will be called when a client requests an environment
   * variable to be set.
    }
{* This function will be called when a client requests a subsystem
   * (like sftp).
    }
{* This function will be called when the channel write is guaranteed
   * not to block.
    }
  Pssh_channel_callbacks_struct = ^Tssh_channel_callbacks_struct;
  Tssh_channel_callbacks_struct = record
      size : Tsize_t;cdecl;
      userdata : pointer;
      channel_data_function : Tssh_channel_data_callback;
      channel_eof_function : Tssh_channel_eof_callback;
      channel_close_function : Tssh_channel_close_callback;
      channel_signal_function : Tssh_channel_signal_callback;
      channel_exit_status_function : Tssh_channel_exit_status_callback;
      channel_exit_signal_function : Tssh_channel_exit_signal_callback;
      channel_pty_request_function : Tssh_channel_pty_request_callback;
      channel_shell_request_function : Tssh_channel_shell_request_callback;
      channel_auth_agent_req_function : Tssh_channel_auth_agent_req_callback;
      channel_x11_req_function : Tssh_channel_x11_req_callback;
      channel_pty_window_change_function : Tssh_channel_pty_window_change_callback;
      channel_exec_request_function : Tssh_channel_exec_request_callback;
      channel_env_request_function : Tssh_channel_env_request_callback;
      channel_subsystem_request_function : Tssh_channel_subsystem_request_callback;
      channel_write_wontblock_function : Tssh_channel_write_wontblock_callback;
    end;


  Pssh_channel_callbacks = ^Tssh_channel_callbacks;
  Tssh_channel_callbacks = Pssh_channel_callbacks_struct;
{*
 * @brief Set the channel callback functions.
 *
 * This functions sets the callback structure to use your own callback
 * functions for channel data and exceptions.
 *
 * Note, that the structure is not copied to the channel structure so it needs
 * to be valid as for the whole life of the channel or until it is removed with
 * ssh_remove_channel_callbacks().
 *
 * @code
 * struct ssh_channel_callbacks_struct cb = 
 *   .userdata = data,
 *   .channel_data_function = my_channel_data_function
 * ;
 * ssh_callbacks_init(&cb);
 * ssh_set_channel_callbacks(channel, &cb);
 * @endcode
 *
 * @param  channel      The channel to set the callback structure.
 *
 * @param  cb           The callback structure itself.
 *
 * @return SSH_OK on success, SSH_ERROR on error.
 * @warning this function will not replace existing callbacks but set the
 *          new one atop of them.
  }

function ssh_set_channel_callbacks(channel:Tssh_channel; cb:Tssh_channel_callbacks):longint;cdecl;external;
{*
 * @brief Add channel callback functions
 *
 * This function will add channel callback functions to the channel callback
 * list.
 * Callbacks missing from a callback structure will be probed in the next
 * on the list.
 *
 * @param  channel      The channel to set the callback structure.
 *
 * @param  cb           The callback structure itself.
 *
 * @return SSH_OK on success, SSH_ERROR on error.
 *
 * @see ssh_set_channel_callbacks
  }
function ssh_add_channel_callbacks(channel:Tssh_channel; cb:Tssh_channel_callbacks):longint;cdecl;external;
{*
 * @brief Remove a channel callback.
 *
 * The channel has been added with ssh_add_channel_callbacks or
 * ssh_set_channel_callbacks in this case.
 *
 * @param channel  The channel to remove the callback structure from.
 *
 * @param cb       The callback structure to remove
 *
 * @returns SSH_OK on success, SSH_ERROR on error.
  }
function ssh_remove_channel_callbacks(channel:Tssh_channel; cb:Tssh_channel_callbacks):longint;cdecl;external;
{* @  }
{* @addtogroup libssh_threads
 * @
  }
type

  Tssh_thread_callback = function (lock:Ppointer):longint;cdecl;

  Tssh_thread_id_callback = function (para1:pointer):dword;cdecl;
(* Const before type ignored *)
  Pssh_threads_callbacks_struct = ^Tssh_threads_callbacks_struct;
  Tssh_threads_callbacks_struct = record
      _type : Pchar;cdecl;
      mutex_init : Tssh_thread_callback;
      mutex_destroy : Tssh_thread_callback;
      mutex_lock : Tssh_thread_callback;
      mutex_unlock : Tssh_thread_callback;
      thread_id : Tssh_thread_id_callback;
    end;

{*
 * @brief Set the thread callbacks structure.
 *
 * This is necessary if your program is using libssh in a multithreaded fashion.
 * This function must be called first, outside of any threading context (in your
 * main() function for instance), before you call ssh_init().
 *
 * @param[in] cb   A pointer to a ssh_threads_callbacks_struct structure, which
 *                 contains the different callbacks to be set.
 *
 * @returns        Always returns SSH_OK.
 *
 * @see ssh_threads_callbacks_struct
 * @see SSH_THREADS_PTHREAD
 * @bug libgcrypt 1.6 and bigger backend does not support custom callback.
 *      Using anything else than pthreads here will fail.
  }

function ssh_threads_set_callbacks(cb:Pssh_threads_callbacks_struct):longint;cdecl;external;
{*
 * @brief Returns a pointer to the appropriate callbacks structure for the
 * environment, to be used with ssh_threads_set_callbacks.
 *
 * @returns A pointer to a ssh_threads_callbacks_struct to be used with
 * ssh_threads_set_callbacks.
 *
 * @see ssh_threads_set_callbacks
  }
function ssh_threads_get_default:Pssh_threads_callbacks_struct;cdecl;external;
{*
 * @brief Returns a pointer on the pthread threads callbacks, to be used with
 * ssh_threads_set_callbacks.
 *
 * @see ssh_threads_set_callbacks
  }
function ssh_threads_get_pthread:Pssh_threads_callbacks_struct;cdecl;external;
{*
 * @brief Get the noop threads callbacks structure
 *
 * This can be used with ssh_threads_set_callbacks. These callbacks do nothing
 * and are being used by default.
 *
 * @return Always returns a valid pointer to the noop callbacks structure.
 *
 * @see ssh_threads_set_callbacks
  }
function ssh_threads_get_noop:Pssh_threads_callbacks_struct;cdecl;external;
{*
 * @brief Set the logging callback function.
 *
 * @param[in]  cb  The callback to set.
 *
 * @return         0 on success, < 0 on error.
  }
function ssh_set_log_callback(cb:Tssh_logging_callback):longint;cdecl;external;
{*
 * @brief Get the pointer to the logging callback function.
 *
 * @return The pointer the the callback or NULL if none set.
  }
function ssh_get_log_callback:Tssh_logging_callback;cdecl;external;
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}
{_SSH_CALLBACK_H  }
{ @  }

implementation


end.
