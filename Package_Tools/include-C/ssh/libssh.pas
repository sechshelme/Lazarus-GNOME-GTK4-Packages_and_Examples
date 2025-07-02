unit libssh;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of the SSH Library
 *
 * Copyright (c) 2003-2023 by Aris Adamantiadis and the libssh team
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
{$ifndef _LIBSSH_H}
{$define _LIBSSH_H}
{$include <libssh/libssh_version.h>}
{$include <stdarg.h>}
{$ifdef _MSC_VER}
{ Visual Studio hasn't inttypes.h so it doesn't know uint32_t  }
type
  Pint32_t = ^Tint32_t;
  Tint32_t = longint;

  Puint32_t = ^Tuint32_t;
  Tuint32_t = dword;

  Puint16_t = ^Tuint16_t;
  Tuint16_t = word;

  Puint8_t = ^Tuint8_t;
  Tuint8_t = byte;

  Puint64_t = ^Tuint64_t;
  Tuint64_t = qword;

  Pmode_t = ^Tmode_t;
  Tmode_t = longint;
{$else}
{ _MSC_VER  }
{$include <unistd.h>}
{$include <inttypes.h>}
{$include <sys/types.h>}
{$endif}
{ _MSC_VER  }
{$ifdef _WIN32}
{$include <winsock2.h>}
{$else}
{ _WIN32  }
{$include <sys/select.h> /* for fd_set * */}
{$include <netdb.h>}
{$endif}
{ _WIN32  }
{ GCC have printf type attribute check.   }
{ C++ extern C conditionnal removed }
type
  Pssh_counter_struct = ^Tssh_counter_struct;
  Tssh_counter_struct = record
      in_bytes : Tuint64_t;
      out_bytes : Tuint64_t;
      in_packets : Tuint64_t;
      out_packets : Tuint64_t;
    end;


  Pssh_counter = ^Tssh_counter;
  Tssh_counter = Pssh_counter_struct;

  Pssh_agent = ^Tssh_agent;
  Tssh_agent = Pssh_agent_struct;

  Pssh_buffer = ^Tssh_buffer;
  Tssh_buffer = Pssh_buffer_struct;

  Pssh_channel = ^Tssh_channel;
  Tssh_channel = Pssh_channel_struct;

  Pssh_message = ^Tssh_message;
  Tssh_message = Pssh_message_struct;

  Pssh_pcap_file = ^Tssh_pcap_file;
  Tssh_pcap_file = Pssh_pcap_file_struct;

  Pssh_key = ^Tssh_key;
  Tssh_key = Pssh_key_struct;

  Pssh_scp = ^Tssh_scp;
  Tssh_scp = Pssh_scp_struct;

  Pssh_session = ^Tssh_session;
  Tssh_session = Pssh_session_struct;

  Pssh_string = ^Tssh_string;
  Tssh_string = Pssh_string_struct;

  Pssh_event = ^Tssh_event;
  Tssh_event = Pssh_event_struct;

  Pssh_connector = ^Tssh_connector;
  Tssh_connector = Pssh_connector_struct;

  Pssh_gssapi_creds = ^Tssh_gssapi_creds;
  Tssh_gssapi_creds = pointer;
{ Socket type  }
{$ifdef _WIN32}
{$ifndef socket_t}
type
  Psocket_t = ^Tsocket_t;
  Tsocket_t = TSOCKET;
{$endif}
{ socket_t  }
{$else}
{ _WIN32  }
{$ifndef socket_t}
type
  Psocket_t = ^Tsocket_t;
  Tsocket_t = longint;
{$endif}
{$endif}
{ _WIN32  }

{ was #define dname def_expr }
function SSH_INVALID_SOCKET : Tsocket_t;  

{ the offsets of methods  }
type
  Tssh_kex_types_e =  Longint;
  Const
    SSH_KEX = 0;
    SSH_HOSTKEYS = 1;
    SSH_CRYPT_C_S = 2;
    SSH_CRYPT_S_C = 3;
    SSH_MAC_C_S = 4;
    SSH_MAC_S_C = 5;
    SSH_COMP_C_S = 6;
    SSH_COMP_S_C = 7;
    SSH_LANG_C_S = 8;
    SSH_LANG_S_C = 9;

  SSH_CRYPT = 2;  
  SSH_MAC = 3;  
  SSH_COMP = 4;  
  SSH_LANG = 5;  
type
  Tssh_auth_e =  Longint;
  Const
    SSH_AUTH_SUCCESS = 0;
    SSH_AUTH_DENIED = 1;
    SSH_AUTH_PARTIAL = 2;
    SSH_AUTH_INFO = 3;
    SSH_AUTH_AGAIN = 4;
    SSH_AUTH_ERROR = -(1);

{ auth flags  }
  SSH_AUTH_METHOD_UNKNOWN = $0000;  
  SSH_AUTH_METHOD_NONE = $0001;  
  SSH_AUTH_METHOD_PASSWORD = $0002;  
  SSH_AUTH_METHOD_PUBLICKEY = $0004;  
  SSH_AUTH_METHOD_HOSTBASED = $0008;  
  SSH_AUTH_METHOD_INTERACTIVE = $0010;  
  SSH_AUTH_METHOD_GSSAPI_MIC = $0020;  
{ messages  }
type
  Tssh_requests_e =  Longint;
  Const
    SSH_REQUEST_AUTH = 1;
    SSH_REQUEST_CHANNEL_OPEN = 2;
    SSH_REQUEST_CHANNEL = 3;
    SSH_REQUEST_SERVICE = 4;
    SSH_REQUEST_GLOBAL = 5;

type
  Tssh_channel_type_e =  Longint;
  Const
    SSH_CHANNEL_UNKNOWN = 0;
    SSH_CHANNEL_SESSION = 1;
    SSH_CHANNEL_DIRECT_TCPIP = 2;
    SSH_CHANNEL_FORWARDED_TCPIP = 3;
    SSH_CHANNEL_X11 = 4;
    SSH_CHANNEL_AUTH_AGENT = 5;

type
  Tssh_channel_requests_e =  Longint;
  Const
    SSH_CHANNEL_REQUEST_UNKNOWN = 0;
    SSH_CHANNEL_REQUEST_PTY = 1;
    SSH_CHANNEL_REQUEST_EXEC = 2;
    SSH_CHANNEL_REQUEST_SHELL = 3;
    SSH_CHANNEL_REQUEST_ENV = 4;
    SSH_CHANNEL_REQUEST_SUBSYSTEM = 5;
    SSH_CHANNEL_REQUEST_WINDOW_CHANGE = 6;
    SSH_CHANNEL_REQUEST_X11 = 7;

type
  Tssh_global_requests_e =  Longint;
  Const
    SSH_GLOBAL_REQUEST_UNKNOWN = 0;
    SSH_GLOBAL_REQUEST_TCPIP_FORWARD = 1;
    SSH_GLOBAL_REQUEST_CANCEL_TCPIP_FORWARD = 2;
    SSH_GLOBAL_REQUEST_KEEPALIVE = 3;

type
  Tssh_publickey_state_e =  Longint;
  Const
    SSH_PUBLICKEY_STATE_ERROR = -(1);
    SSH_PUBLICKEY_STATE_NONE = 0;
    SSH_PUBLICKEY_STATE_VALID = 1;
    SSH_PUBLICKEY_STATE_WRONG = 2;

{ Status flags  }
{* Socket is closed  }
  SSH_CLOSED = $01;  
{* Reading to socket won't block  }
  SSH_READ_PENDING = $02;  
{* Session was closed due to an error  }
  SSH_CLOSED_ERROR = $04;  
{* Output buffer not empty  }
  SSH_WRITE_PENDING = $08;  
type
  Tssh_server_known_e =  Longint;
  Const
    SSH_SERVER_ERROR = -(1);
    SSH_SERVER_NOT_KNOWN = 0;
    SSH_SERVER_KNOWN_OK = 1;
    SSH_SERVER_KNOWN_CHANGED = 2;
    SSH_SERVER_FOUND_OTHER = 3;
    SSH_SERVER_FILE_NOT_FOUND = 4;

{*
     * There had been an error checking the host.
      }
{*
     * The known host file does not exist. The host is thus unknown. File will
     * be created if host key is accepted.
      }
{*
     * The server is unknown. User should confirm the public key hash is
     * correct.
      }
{*
     * The server is known and has not changed.
      }
{*
     * The server key has changed. Either you are under attack or the
     * administrator changed the key. You HAVE to warn the user about a
     * possible attack.
      }
{*
     * The server gave use a key of a type while we had an other type recorded.
     * It is a possible attack.
      }
type
  Tssh_known_hosts_e =  Longint;
  Const
    SSH_KNOWN_HOSTS_ERROR = -(2);
    SSH_KNOWN_HOSTS_NOT_FOUND = -(1);
    SSH_KNOWN_HOSTS_UNKNOWN = 0;
    SSH_KNOWN_HOSTS_OK = 1;
    SSH_KNOWN_HOSTS_CHANGED = 2;
    SSH_KNOWN_HOSTS_OTHER = 3;

{$ifndef MD5_DIGEST_LEN}

const
  MD5_DIGEST_LEN = 16;  
{$endif}
{ errors  }
type
  Tssh_error_types_e =  Longint;
  Const
    SSH_NO_ERROR = 0;
    SSH_REQUEST_DENIED = 1;
    SSH_FATAL = 2;
    SSH_EINTR = 3;

{ some types for keys  }
{ deprecated  }
type
  Tssh_keytypes_e =  Longint;
  Const
    SSH_KEYTYPE_UNKNOWN = 0;
    SSH_KEYTYPE_DSS = 1;
    SSH_KEYTYPE_RSA = 2;
    SSH_KEYTYPE_RSA1 = 3;
    SSH_KEYTYPE_ECDSA = 4;
    SSH_KEYTYPE_ED25519 = 5;
    SSH_KEYTYPE_DSS_CERT01 = 6;
    SSH_KEYTYPE_RSA_CERT01 = 7;
    SSH_KEYTYPE_ECDSA_P256 = 8;
    SSH_KEYTYPE_ECDSA_P384 = 9;
    SSH_KEYTYPE_ECDSA_P521 = 10;
    SSH_KEYTYPE_ECDSA_P256_CERT01 = 11;
    SSH_KEYTYPE_ECDSA_P384_CERT01 = 12;
    SSH_KEYTYPE_ECDSA_P521_CERT01 = 13;
    SSH_KEYTYPE_ED25519_CERT01 = 14;
    SSH_KEYTYPE_SK_ECDSA = 15;
    SSH_KEYTYPE_SK_ECDSA_CERT01 = 16;
    SSH_KEYTYPE_SK_ED25519 = 17;
    SSH_KEYTYPE_SK_ED25519_CERT01 = 18;

type
  Tssh_keycmp_e =  Longint;
  Const
    SSH_KEY_CMP_PUBLIC = 0;
    SSH_KEY_CMP_PRIVATE = 1;

  SSH_ADDRSTRLEN = 46;  
type
  Pssh_knownhosts_entry = ^Tssh_knownhosts_entry;
  Tssh_knownhosts_entry = record
      hostname : Pchar;
      unparsed : Pchar;
      publickey : Tssh_key;
      comment : Pchar;
    end;

{ Error return codes  }
{ No error  }

const
  SSH_OK = 0;  
{ Error of some kind  }
  SSH_ERROR = -(1);  
{ The nonblocking call must be repeated  }
  SSH_AGAIN = -(2);  
{ We have already a eof  }
  SSH_EOF = -(127);  
{*
 * @addtogroup libssh_log
 *
 * @
  }
{* No logging at all
	  }
{* Only warnings
	  }
{* High level protocol information
	  }
{* Lower level protocol infomations, packet level
	  }
{* Every function path
	  }
type
  Txxxxxxx =  Longint;
  Const
    SSH_LOG_NOLOG = 0;
    SSH_LOG_WARNING = 1;
    SSH_LOG_PROTOCOL = 2;
    SSH_LOG_PACKET = 3;
    SSH_LOG_FUNCTIONS = 4;

{* @  }
  SSH_LOG_RARE = SSH_LOG_WARNING;  
{*
 * @name Logging levels
 *
 * @brief Debug levels for logging.
 * @
  }
{* No logging at all  }
  SSH_LOG_NONE = 0;  
{* Show only warnings  }
  SSH_LOG_WARN = 1;  
{* Get some information what's going on  }
  SSH_LOG_INFO = 2;  
{* Get detailed debugging information * }
  SSH_LOG_DEBUG = 3;  
{* Get trace output, packet information, ...  }
  SSH_LOG_TRACE = 4;  
{* @  }
type
  Tssh_options_e =  Longint;
  Const
    SSH_OPTIONS_HOST = 0;
    SSH_OPTIONS_PORT = 1;
    SSH_OPTIONS_PORT_STR = 2;
    SSH_OPTIONS_FD = 3;
    SSH_OPTIONS_USER = 4;
    SSH_OPTIONS_SSH_DIR = 5;
    SSH_OPTIONS_IDENTITY = 6;
    SSH_OPTIONS_ADD_IDENTITY = 7;
    SSH_OPTIONS_KNOWNHOSTS = 8;
    SSH_OPTIONS_TIMEOUT = 9;
    SSH_OPTIONS_TIMEOUT_USEC = 10;
    SSH_OPTIONS_SSH1 = 11;
    SSH_OPTIONS_SSH2 = 12;
    SSH_OPTIONS_LOG_VERBOSITY = 13;
    SSH_OPTIONS_LOG_VERBOSITY_STR = 14;
    SSH_OPTIONS_CIPHERS_C_S = 15;
    SSH_OPTIONS_CIPHERS_S_C = 16;
    SSH_OPTIONS_COMPRESSION_C_S = 17;
    SSH_OPTIONS_COMPRESSION_S_C = 18;
    SSH_OPTIONS_PROXYCOMMAND = 19;
    SSH_OPTIONS_BINDADDR = 20;
    SSH_OPTIONS_STRICTHOSTKEYCHECK = 21;
    SSH_OPTIONS_COMPRESSION = 22;
    SSH_OPTIONS_COMPRESSION_LEVEL = 23;
    SSH_OPTIONS_KEY_EXCHANGE = 24;
    SSH_OPTIONS_HOSTKEYS = 25;
    SSH_OPTIONS_GSSAPI_SERVER_IDENTITY = 26;
    SSH_OPTIONS_GSSAPI_CLIENT_IDENTITY = 27;
    SSH_OPTIONS_GSSAPI_DELEGATE_CREDENTIALS = 28;
    SSH_OPTIONS_HMAC_C_S = 29;
    SSH_OPTIONS_HMAC_S_C = 30;
    SSH_OPTIONS_PASSWORD_AUTH = 31;
    SSH_OPTIONS_PUBKEY_AUTH = 32;
    SSH_OPTIONS_KBDINT_AUTH = 33;
    SSH_OPTIONS_GSSAPI_AUTH = 34;
    SSH_OPTIONS_GLOBAL_KNOWNHOSTS = 35;
    SSH_OPTIONS_NODELAY = 36;
    SSH_OPTIONS_PUBLICKEY_ACCEPTED_TYPES = 37;
    SSH_OPTIONS_PROCESS_CONFIG = 38;
    SSH_OPTIONS_REKEY_DATA = 39;
    SSH_OPTIONS_REKEY_TIME = 40;
    SSH_OPTIONS_RSA_MIN_SIZE = 41;
    SSH_OPTIONS_IDENTITY_AGENT = 42;

{* Code is going to write/create remote files  }
{* Code is going to read remote files  }
type
  Txxxxxxx =  Longint;
  Const
    SSH_SCP_WRITE = 0;
    SSH_SCP_READ = 1;
    SSH_SCP_RECURSIVE = $10;

{* A new directory is going to be pulled  }
{* A new file is going to be pulled  }
{* End of requests  }
{* End of directory  }
{* Warning received  }
type
  Tssh_scp_request_types =  Longint;
  Const
    SSH_SCP_REQUEST_NEWDIR = 1;
    SSH_SCP_REQUEST_NEWFILE = 2;
    SSH_SCP_REQUEST_EOF = 3;
    SSH_SCP_REQUEST_ENDDIR = 4;
    SSH_SCP_REQUEST_WARNING = 5;

{* Only the standard stream of the channel  }
{* Only the exception stream of the channel  }
{* Merge both standard and exception streams  }
type
  Tssh_connector_flags_e =  Longint;
  Const
    SSH_CONNECTOR_STDOUT = 1;
    SSH_CONNECTOR_STDINOUT = 1;
    SSH_CONNECTOR_STDERR = 2;
    SSH_CONNECTOR_BOTH = 3;


function ssh_blocking_flush(session:Tssh_session; timeout:longint):longint;cdecl;external libssh;
function ssh_channel_accept_x11(channel:Tssh_channel; timeout_ms:longint):Tssh_channel;cdecl;external libssh;
function ssh_channel_change_pty_size(channel:Tssh_channel; cols:longint; rows:longint):longint;cdecl;external libssh;
function ssh_channel_close(channel:Tssh_channel):longint;cdecl;external libssh;
procedure ssh_channel_free(channel:Tssh_channel);cdecl;external libssh;
function ssh_channel_get_exit_status(channel:Tssh_channel):longint;cdecl;external libssh;
function ssh_channel_get_session(channel:Tssh_channel):Tssh_session;cdecl;external libssh;
function ssh_channel_is_closed(channel:Tssh_channel):longint;cdecl;external libssh;
function ssh_channel_is_eof(channel:Tssh_channel):longint;cdecl;external libssh;
function ssh_channel_is_open(channel:Tssh_channel):longint;cdecl;external libssh;
function ssh_channel_new(session:Tssh_session):Tssh_channel;cdecl;external libssh;
function ssh_channel_open_auth_agent(channel:Tssh_channel):longint;cdecl;external libssh;
function ssh_channel_open_forward(channel:Tssh_channel; remotehost:Pchar; remoteport:longint; sourcehost:Pchar; localport:longint):longint;cdecl;external libssh;
function ssh_channel_open_forward_unix(channel:Tssh_channel; remotepath:Pchar; sourcehost:Pchar; localport:longint):longint;cdecl;external libssh;
function ssh_channel_open_session(channel:Tssh_channel):longint;cdecl;external libssh;
function ssh_channel_open_x11(channel:Tssh_channel; orig_addr:Pchar; orig_port:longint):longint;cdecl;external libssh;
function ssh_channel_poll(channel:Tssh_channel; is_stderr:longint):longint;cdecl;external libssh;
function ssh_channel_poll_timeout(channel:Tssh_channel; timeout:longint; is_stderr:longint):longint;cdecl;external libssh;
function ssh_channel_read(channel:Tssh_channel; dest:pointer; count:Tuint32_t; is_stderr:longint):longint;cdecl;external libssh;
function ssh_channel_read_timeout(channel:Tssh_channel; dest:pointer; count:Tuint32_t; is_stderr:longint; timeout_ms:longint):longint;cdecl;external libssh;
function ssh_channel_read_nonblocking(channel:Tssh_channel; dest:pointer; count:Tuint32_t; is_stderr:longint):longint;cdecl;external libssh;
function ssh_channel_request_env(channel:Tssh_channel; name:Pchar; value:Pchar):longint;cdecl;external libssh;
function ssh_channel_request_exec(channel:Tssh_channel; cmd:Pchar):longint;cdecl;external libssh;
function ssh_channel_request_pty(channel:Tssh_channel):longint;cdecl;external libssh;
function ssh_channel_request_pty_size(channel:Tssh_channel; term:Pchar; cols:longint; rows:longint):longint;cdecl;external libssh;
function ssh_channel_request_shell(channel:Tssh_channel):longint;cdecl;external libssh;
function ssh_channel_request_send_signal(channel:Tssh_channel; signum:Pchar):longint;cdecl;external libssh;
function ssh_channel_request_send_break(channel:Tssh_channel; length:Tuint32_t):longint;cdecl;external libssh;
function ssh_channel_request_sftp(channel:Tssh_channel):longint;cdecl;external libssh;
function ssh_channel_request_subsystem(channel:Tssh_channel; subsystem:Pchar):longint;cdecl;external libssh;
function ssh_channel_request_x11(channel:Tssh_channel; single_connection:longint; protocol:Pchar; cookie:Pchar; screen_number:longint):longint;cdecl;external libssh;
function ssh_channel_request_auth_agent(channel:Tssh_channel):longint;cdecl;external libssh;
function ssh_channel_send_eof(channel:Tssh_channel):longint;cdecl;external libssh;
procedure ssh_channel_set_blocking(channel:Tssh_channel; blocking:longint);cdecl;external libssh;
procedure ssh_channel_set_counter(channel:Tssh_channel; counter:Tssh_counter);cdecl;external libssh;
function ssh_channel_write(channel:Tssh_channel; data:pointer; len:Tuint32_t):longint;cdecl;external libssh;
function ssh_channel_write_stderr(channel:Tssh_channel; data:pointer; len:Tuint32_t):longint;cdecl;external libssh;
function ssh_channel_window_size(channel:Tssh_channel):Tuint32_t;cdecl;external libssh;
function ssh_basename(path:Pchar):Pchar;cdecl;external libssh;
procedure ssh_clean_pubkey_hash(hash:PPbyte);cdecl;external libssh;
function ssh_connect(session:Tssh_session):longint;cdecl;external libssh;
function ssh_connector_new(session:Tssh_session):Tssh_connector;cdecl;external libssh;
procedure ssh_connector_free(connector:Tssh_connector);cdecl;external libssh;
function ssh_connector_set_in_channel(connector:Tssh_connector; channel:Tssh_channel; flags:Tssh_connector_flags_e):longint;cdecl;external libssh;
function ssh_connector_set_out_channel(connector:Tssh_connector; channel:Tssh_channel; flags:Tssh_connector_flags_e):longint;cdecl;external libssh;
procedure ssh_connector_set_in_fd(connector:Tssh_connector; fd:Tsocket_t);cdecl;external libssh;
procedure ssh_connector_set_out_fd(connector:Tssh_connector; fd:Tsocket_t);cdecl;external libssh;
function ssh_copyright:Pchar;cdecl;external libssh;
procedure ssh_disconnect(session:Tssh_session);cdecl;external libssh;
function ssh_dirname(path:Pchar):Pchar;cdecl;external libssh;
function ssh_finalize:longint;cdecl;external libssh;
{ REVERSE PORT FORWARDING  }
function ssh_channel_open_forward_port(session:Tssh_session; timeout_ms:longint; destination_port:Plongint; originator:PPchar; originator_port:Plongint):Tssh_channel;cdecl;external libssh;
{SSH_DEPRECATED }function ssh_channel_accept_forward(session:Tssh_session; timeout_ms:longint; destination_port:Plongint):Tssh_channel;cdecl;external libssh;
function ssh_channel_cancel_forward(session:Tssh_session; address:Pchar; port:longint):longint;cdecl;external libssh;
function ssh_channel_listen_forward(session:Tssh_session; address:Pchar; port:longint; bound_port:Plongint):longint;cdecl;external libssh;
procedure ssh_free(session:Tssh_session);cdecl;external libssh;
function ssh_get_disconnect_message(session:Tssh_session):Pchar;cdecl;external libssh;
function ssh_get_error(error:pointer):Pchar;cdecl;external libssh;
function ssh_get_error_code(error:pointer):longint;cdecl;external libssh;
function ssh_get_fd(session:Tssh_session):Tsocket_t;cdecl;external libssh;
function ssh_get_hexa(what:Pbyte; len:Tsize_t):Pchar;cdecl;external libssh;
function ssh_get_issue_banner(session:Tssh_session):Pchar;cdecl;external libssh;
function ssh_get_openssh_version(session:Tssh_session):longint;cdecl;external libssh;
function ssh_get_server_publickey(session:Tssh_session; key:Pssh_key):longint;cdecl;external libssh;
type
  Tssh_publickey_hash_type =  Longint;
  Const
    SSH_PUBLICKEY_HASH_SHA1 = 0;
    SSH_PUBLICKEY_HASH_MD5 = 1;
    SSH_PUBLICKEY_HASH_SHA256 = 2;


function ssh_get_publickey_hash(key:Tssh_key; _type:Tssh_publickey_hash_type; hash:PPbyte; hlen:Psize_t):longint;cdecl;external libssh;
{ DEPRECATED FUNCTIONS  }
{SSH_DEPRECATED }function ssh_get_pubkey_hash(session:Tssh_session; hash:PPbyte):longint;cdecl;external libssh;
{SSH_DEPRECATED }function ssh_forward_accept(session:Tssh_session; timeout_ms:longint):Tssh_channel;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function ssh_forward_cancel(session:Tssh_session; address:Pchar; port:longint):longint;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function ssh_forward_listen(session:Tssh_session; address:Pchar; port:longint; bound_port:Plongint):longint;cdecl;external libssh;
{SSH_DEPRECATED }function ssh_get_publickey(session:Tssh_session; key:Pssh_key):longint;cdecl;external libssh;
{SSH_DEPRECATED }function ssh_write_knownhost(session:Tssh_session):longint;cdecl;external libssh;
{SSH_DEPRECATED }function ssh_dump_knownhost(session:Tssh_session):Pchar;cdecl;external libssh;
{SSH_DEPRECATED }function ssh_is_server_known(session:Tssh_session):longint;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
procedure ssh_print_hexa(descr:Pchar; what:Pbyte; len:Tsize_t);cdecl;external libssh;
{SSH_DEPRECATED }function ssh_channel_select(readchans:Pssh_channel; writechans:Pssh_channel; exceptchans:Pssh_channel; timeout:Ptimeval):longint;cdecl;external libssh;
{SSH_DEPRECATED }function ssh_scp_accept_request(scp:Tssh_scp):longint;cdecl;external libssh;
{SSH_DEPRECATED }function ssh_scp_close(scp:Tssh_scp):longint;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function ssh_scp_deny_request(scp:Tssh_scp; reason:Pchar):longint;cdecl;external libssh;
{SSH_DEPRECATED }procedure ssh_scp_free(scp:Tssh_scp);cdecl;external libssh;
{SSH_DEPRECATED }function ssh_scp_init(scp:Tssh_scp):longint;cdecl;external libssh;
{SSH_DEPRECATED }function ssh_scp_leave_directory(scp:Tssh_scp):longint;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function ssh_scp_new(session:Tssh_session; mode:longint; location:Pchar):Tssh_scp;cdecl;external libssh;
{SSH_DEPRECATED }function ssh_scp_pull_request(scp:Tssh_scp):longint;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function ssh_scp_push_directory(scp:Tssh_scp; dirname:Pchar; mode:longint):longint;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function ssh_scp_push_file(scp:Tssh_scp; filename:Pchar; size:Tsize_t; perms:longint):longint;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function ssh_scp_push_file64(scp:Tssh_scp; filename:Pchar; size:Tuint64_t; perms:longint):longint;cdecl;external libssh;
{SSH_DEPRECATED }function ssh_scp_read(scp:Tssh_scp; buffer:pointer; size:Tsize_t):longint;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function ssh_scp_request_get_filename(scp:Tssh_scp):Pchar;cdecl;external libssh;
{SSH_DEPRECATED }function ssh_scp_request_get_permissions(scp:Tssh_scp):longint;cdecl;external libssh;
{SSH_DEPRECATED }function ssh_scp_request_get_size(scp:Tssh_scp):Tsize_t;cdecl;external libssh;
{SSH_DEPRECATED }function ssh_scp_request_get_size64(scp:Tssh_scp):Tuint64_t;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function ssh_scp_request_get_warning(scp:Tssh_scp):Pchar;cdecl;external libssh;
{SSH_DEPRECATED }(* Const before type ignored *)
function ssh_scp_write(scp:Tssh_scp; buffer:pointer; len:Tsize_t):longint;cdecl;external libssh;
function ssh_get_random(where:pointer; len:longint; strong:longint):longint;cdecl;external libssh;
function ssh_get_version(session:Tssh_session):longint;cdecl;external libssh;
function ssh_get_status(session:Tssh_session):longint;cdecl;external libssh;
function ssh_get_poll_flags(session:Tssh_session):longint;cdecl;external libssh;
function ssh_init:longint;cdecl;external libssh;
function ssh_is_blocking(session:Tssh_session):longint;cdecl;external libssh;
function ssh_is_connected(session:Tssh_session):longint;cdecl;external libssh;
{ KNOWN HOSTS  }
procedure ssh_knownhosts_entry_free(entry:Pssh_knownhosts_entry);cdecl;external libssh;
{ xxxxxxxxxxxxx }
{
extern int ssh_known_hosts_parse_line(const char *host,
                                          const char *line,
                                          struct ssh_knownhosts_entry **entry);
extern enum ssh_known_hosts_e ssh_session_has_known_hosts_entry(ssh_session session);

extern int ssh_session_export_known_hosts_entry(ssh_session session,
                                                    char **pentry_string);
extern int ssh_session_update_known_hosts(ssh_session session);

extern enum ssh_known_hosts_e ssh_session_get_known_hosts_entry(ssh_session session,
        struct ssh_knownhosts_entry **pentry);
extern enum ssh_known_hosts_e ssh_session_is_known_server(ssh_session session);

/* LOGGING  }
function ssh_set_log_level(level:longint):longint;cdecl;external libssh;
function ssh_get_log_level:longint;cdecl;external libssh;
function ssh_get_log_userdata:pointer;cdecl;external libssh;
function ssh_set_log_userdata(data:pointer):longint;cdecl;external libssh;
procedure ssh_vlog(verbosity:longint; _function:Pchar; format:Pchar; va:Pva_list);cdecl;external libssh;
procedure _ssh_log(verbosity:longint; _function:Pchar; format:Pchar; args:array of const);cdecl;external libssh;
procedure _ssh_log(verbosity:longint; _function:Pchar; format:Pchar);cdecl;external libssh;
{ legacy  }
{SSH_DEPRECATED }(* Const before type ignored *)
procedure ssh_log(session:Tssh_session; prioriry:longint; format:Pchar; args:array of const);cdecl;external libssh;
procedure ssh_log(session:Tssh_session; prioriry:longint; format:Pchar);cdecl;external libssh;
function ssh_message_channel_request_open_reply_accept(msg:Tssh_message):Tssh_channel;cdecl;external libssh;
function ssh_message_channel_request_open_reply_accept_channel(msg:Tssh_message; chan:Tssh_channel):longint;cdecl;external libssh;
function ssh_message_channel_request_reply_success(msg:Tssh_message):longint;cdecl;external libssh;
procedure ssh_message_free(msg:Tssh_message);cdecl;external libssh;
function ssh_message_get(session:Tssh_session):Tssh_message;cdecl;external libssh;
function ssh_message_subtype(msg:Tssh_message):longint;cdecl;external libssh;
function ssh_message_type(msg:Tssh_message):longint;cdecl;external libssh;
function ssh_mkdir(pathname:Pchar; mode:Tmode_t):longint;cdecl;external libssh;
function ssh_new:Tssh_session;cdecl;external libssh;
function ssh_options_copy(src:Tssh_session; dest:Pssh_session):longint;cdecl;external libssh;
function ssh_options_getopt(session:Tssh_session; argcptr:Plongint; argv:PPchar):longint;cdecl;external libssh;
function ssh_options_parse_config(session:Tssh_session; filename:Pchar):longint;cdecl;external libssh;
function ssh_options_set(session:Tssh_session; _type:Tssh_options_e; value:pointer):longint;cdecl;external libssh;
function ssh_options_get(session:Tssh_session; _type:Tssh_options_e; value:PPchar):longint;cdecl;external libssh;
function ssh_options_get_port(session:Tssh_session; port_target:Pdword):longint;cdecl;external libssh;
function ssh_pcap_file_close(pcap:Tssh_pcap_file):longint;cdecl;external libssh;
procedure ssh_pcap_file_free(pcap:Tssh_pcap_file);cdecl;external libssh;
function ssh_pcap_file_new:Tssh_pcap_file;cdecl;external libssh;
function ssh_pcap_file_open(pcap:Tssh_pcap_file; filename:Pchar):longint;cdecl;external libssh;
{*
 * @addtogroup libssh_auth
 *
 * @
  }
{*
 * @brief SSH authentication callback for password and publickey auth.
 *
 * @param prompt        Prompt to be displayed.
 * @param buf           Buffer to save the password. You should null-terminate it.
 * @param len           Length of the buffer.
 * @param echo          Enable or disable the echo of what you type.
 * @param verify        Should the password be verified?
 * @param userdata      Userdata to be passed to the callback function. Useful
 *                      for GUI applications.
 *
 * @return              0 on success, < 0 on error.
  }
type

  Tssh_auth_callback = function (prompt:Pchar; buf:Pchar; len:Tsize_t; echo:longint; verify:longint; 
               userdata:pointer):longint;cdecl;
{* @  }

function ssh_key_new:Tssh_key;cdecl;external libssh;
procedure ssh_key_free(key:Tssh_key);cdecl;external libssh;
function ssh_key_type(key:Tssh_key):Tssh_keytypes_e;cdecl;external libssh;
function ssh_key_type_to_char(_type:Tssh_keytypes_e):Pchar;cdecl;external libssh;
function ssh_key_type_from_name(name:Pchar):Tssh_keytypes_e;cdecl;external libssh;
function ssh_key_is_public(k:Tssh_key):longint;cdecl;external libssh;
function ssh_key_is_private(k:Tssh_key):longint;cdecl;external libssh;
function ssh_key_cmp(k1:Tssh_key; k2:Tssh_key; what:Tssh_keycmp_e):longint;cdecl;external libssh;
function ssh_key_dup(key:Tssh_key):Tssh_key;cdecl;external libssh;
function ssh_pki_generate(_type:Tssh_keytypes_e; parameter:longint; pkey:Pssh_key):longint;cdecl;external libssh;
function ssh_pki_import_privkey_base64(b64_key:Pchar; passphrase:Pchar; auth_fn:Tssh_auth_callback; auth_data:pointer; pkey:Pssh_key):longint;cdecl;external libssh;
function ssh_pki_export_privkey_base64(privkey:Tssh_key; passphrase:Pchar; auth_fn:Tssh_auth_callback; auth_data:pointer; b64_key:PPchar):longint;cdecl;external libssh;
function ssh_pki_import_privkey_file(filename:Pchar; passphrase:Pchar; auth_fn:Tssh_auth_callback; auth_data:pointer; pkey:Pssh_key):longint;cdecl;external libssh;
function ssh_pki_export_privkey_file(privkey:Tssh_key; passphrase:Pchar; auth_fn:Tssh_auth_callback; auth_data:pointer; filename:Pchar):longint;cdecl;external libssh;
function ssh_pki_copy_cert_to_privkey(cert_key:Tssh_key; privkey:Tssh_key):longint;cdecl;external libssh;
function ssh_pki_import_pubkey_base64(b64_key:Pchar; _type:Tssh_keytypes_e; pkey:Pssh_key):longint;cdecl;external libssh;
function ssh_pki_import_pubkey_file(filename:Pchar; pkey:Pssh_key):longint;cdecl;external libssh;
function ssh_pki_import_cert_base64(b64_cert:Pchar; _type:Tssh_keytypes_e; pkey:Pssh_key):longint;cdecl;external libssh;
function ssh_pki_import_cert_file(filename:Pchar; pkey:Pssh_key):longint;cdecl;external libssh;
function ssh_pki_export_privkey_to_pubkey(privkey:Tssh_key; pkey:Pssh_key):longint;cdecl;external libssh;
function ssh_pki_export_pubkey_base64(key:Tssh_key; b64_key:PPchar):longint;cdecl;external libssh;
function ssh_pki_export_pubkey_file(key:Tssh_key; filename:Pchar):longint;cdecl;external libssh;
function ssh_pki_key_ecdsa_name(key:Tssh_key):Pchar;cdecl;external libssh;
function ssh_get_fingerprint_hash(_type:Tssh_publickey_hash_type; hash:Pbyte; len:Tsize_t):Pchar;cdecl;external libssh;
procedure ssh_print_hash(_type:Tssh_publickey_hash_type; hash:Pbyte; len:Tsize_t);cdecl;external libssh;
function ssh_send_ignore(session:Tssh_session; data:Pchar):longint;cdecl;external libssh;
function ssh_send_debug(session:Tssh_session; message:Pchar; always_display:longint):longint;cdecl;external libssh;
procedure ssh_gssapi_set_creds(session:Tssh_session; creds:Tssh_gssapi_creds);cdecl;external libssh;
function ssh_select(channels:Pssh_channel; outchannels:Pssh_channel; maxfd:Tsocket_t; readfds:Pfd_set; timeout:Ptimeval):longint;cdecl;external libssh;
function ssh_service_request(session:Tssh_session; service:Pchar):longint;cdecl;external libssh;
function ssh_set_agent_channel(session:Tssh_session; channel:Tssh_channel):longint;cdecl;external libssh;
function ssh_set_agent_socket(session:Tssh_session; fd:Tsocket_t):longint;cdecl;external libssh;
procedure ssh_set_blocking(session:Tssh_session; blocking:longint);cdecl;external libssh;
procedure ssh_set_counters(session:Tssh_session; scounter:Tssh_counter; rcounter:Tssh_counter);cdecl;external libssh;
procedure ssh_set_fd_except(session:Tssh_session);cdecl;external libssh;
procedure ssh_set_fd_toread(session:Tssh_session);cdecl;external libssh;
procedure ssh_set_fd_towrite(session:Tssh_session);cdecl;external libssh;
procedure ssh_silent_disconnect(session:Tssh_session);cdecl;external libssh;
function ssh_set_pcap_file(session:Tssh_session; pcapfile:Tssh_pcap_file):longint;cdecl;external libssh;
{ USERAUTH  }
function ssh_userauth_none(session:Tssh_session; username:Pchar):longint;cdecl;external libssh;
function ssh_userauth_list(session:Tssh_session; username:Pchar):longint;cdecl;external libssh;
function ssh_userauth_try_publickey(session:Tssh_session; username:Pchar; pubkey:Tssh_key):longint;cdecl;external libssh;
function ssh_userauth_publickey(session:Tssh_session; username:Pchar; privkey:Tssh_key):longint;cdecl;external libssh;
{$ifndef _WIN32}

function ssh_userauth_agent(session:Tssh_session; username:Pchar):longint;cdecl;external libssh;
{$endif}

function ssh_userauth_publickey_auto_get_current_identity(session:Tssh_session; value:PPchar):longint;cdecl;external libssh;
function ssh_userauth_publickey_auto(session:Tssh_session; username:Pchar; passphrase:Pchar):longint;cdecl;external libssh;
function ssh_userauth_password(session:Tssh_session; username:Pchar; password:Pchar):longint;cdecl;external libssh;
function ssh_userauth_kbdint(session:Tssh_session; user:Pchar; submethods:Pchar):longint;cdecl;external libssh;
function ssh_userauth_kbdint_getinstruction(session:Tssh_session):Pchar;cdecl;external libssh;
function ssh_userauth_kbdint_getname(session:Tssh_session):Pchar;cdecl;external libssh;
function ssh_userauth_kbdint_getnprompts(session:Tssh_session):longint;cdecl;external libssh;
function ssh_userauth_kbdint_getprompt(session:Tssh_session; i:dword; echo:Pchar):Pchar;cdecl;external libssh;
function ssh_userauth_kbdint_getnanswers(session:Tssh_session):longint;cdecl;external libssh;
function ssh_userauth_kbdint_getanswer(session:Tssh_session; i:dword):Pchar;cdecl;external libssh;
function ssh_userauth_kbdint_setanswer(session:Tssh_session; i:dword; answer:Pchar):longint;cdecl;external libssh;
function ssh_userauth_gssapi(session:Tssh_session):longint;cdecl;external libssh;
function ssh_version(req_version:longint):Pchar;cdecl;external libssh;
procedure ssh_string_burn(str:Tssh_string);cdecl;external libssh;
function ssh_string_copy(str:Tssh_string):Tssh_string;cdecl;external libssh;
function ssh_string_data(str:Tssh_string):pointer;cdecl;external libssh;
function ssh_string_fill(str:Tssh_string; data:pointer; len:Tsize_t):longint;cdecl;external libssh;
procedure ssh_string_free(str:Tssh_string);cdecl;external libssh;
function ssh_string_from_char(what:Pchar):Tssh_string;cdecl;external libssh;
function ssh_string_len(str:Tssh_string):Tsize_t;cdecl;external libssh;
function ssh_string_new(size:Tsize_t):Tssh_string;cdecl;external libssh;
function ssh_string_get_char(str:Tssh_string):Pchar;cdecl;external libssh;
function ssh_string_to_char(str:Tssh_string):Pchar;cdecl;external libssh;
procedure ssh_string_free_char(s:Pchar);cdecl;external libssh;
function ssh_getpass(prompt:Pchar; buf:Pchar; len:Tsize_t; echo:longint; verify:longint):longint;cdecl;external libssh;
type

  Tssh_event_callback = function (fd:Tsocket_t; revents:longint; userdata:pointer):longint;cdecl;

function ssh_event_new:Tssh_event;cdecl;external libssh;
function ssh_event_add_fd(event:Tssh_event; fd:Tsocket_t; events:smallint; cb:Tssh_event_callback; userdata:pointer):longint;cdecl;external libssh;
function ssh_event_add_session(event:Tssh_event; session:Tssh_session):longint;cdecl;external libssh;
function ssh_event_add_connector(event:Tssh_event; connector:Tssh_connector):longint;cdecl;external libssh;
function ssh_event_dopoll(event:Tssh_event; timeout:longint):longint;cdecl;external libssh;
function ssh_event_remove_fd(event:Tssh_event; fd:Tsocket_t):longint;cdecl;external libssh;
function ssh_event_remove_session(event:Tssh_event; session:Tssh_session):longint;cdecl;external libssh;
function ssh_event_remove_connector(event:Tssh_event; connector:Tssh_connector):longint;cdecl;external libssh;
procedure ssh_event_free(event:Tssh_event);cdecl;external libssh;
function ssh_get_clientbanner(session:Tssh_session):Pchar;cdecl;external libssh;
function ssh_get_serverbanner(session:Tssh_session):Pchar;cdecl;external libssh;
function ssh_get_kex_algo(session:Tssh_session):Pchar;cdecl;external libssh;
function ssh_get_cipher_in(session:Tssh_session):Pchar;cdecl;external libssh;
function ssh_get_cipher_out(session:Tssh_session):Pchar;cdecl;external libssh;
function ssh_get_hmac_in(session:Tssh_session):Pchar;cdecl;external libssh;
function ssh_get_hmac_out(session:Tssh_session):Pchar;cdecl;external libssh;
function ssh_buffer_new:Tssh_buffer;cdecl;external libssh;
procedure ssh_buffer_free(buffer:Tssh_buffer);cdecl;external libssh;
function ssh_buffer_reinit(buffer:Tssh_buffer):longint;cdecl;external libssh;
function ssh_buffer_add_data(buffer:Tssh_buffer; data:pointer; len:Tuint32_t):longint;cdecl;external libssh;
function ssh_buffer_get_data(buffer:Tssh_buffer; data:pointer; requestedlen:Tuint32_t):Tuint32_t;cdecl;external libssh;
function ssh_buffer_get(buffer:Tssh_buffer):pointer;cdecl;external libssh;
function ssh_buffer_get_len(buffer:Tssh_buffer):Tuint32_t;cdecl;external libssh;
function ssh_session_set_disconnect_message(session:Tssh_session; message:Pchar):longint;cdecl;external libssh;
{$ifndef LIBSSH_LEGACY_0_4}
{$include "libssh/legacy.h"}
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}
{ _LIBSSH_H  }

// === Konventiert am: 2-7-25 17:32:21 ===


implementation


{ was #define dname def_expr }
function SSH_INVALID_SOCKET : Tsocket_t;
  begin
    SSH_INVALID_SOCKET:=Tsocket_t(-(1));
  end;


end.
