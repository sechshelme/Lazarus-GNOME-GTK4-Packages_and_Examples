
unit peer;
interface

{
  Automatically converted by H2Pas 1.0.0 from peer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    peer.h
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
Plongint  = ^longint;
Prist_congestion_control_mode  = ^rist_congestion_control_mode;
Prist_connection_status  = ^rist_connection_status;
Prist_ctx  = ^rist_ctx;
Prist_peer  = ^rist_peer;
Prist_peer_config  = ^rist_peer_config;
Prist_recovery_mode  = ^rist_recovery_mode;
Prist_timing_mode  = ^rist_timing_mode;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2020, VideoLAN and librist authors
 * Copyright © 2019-2020 SipRadius LLC
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-2-Clause
  }
{$ifndef LIBRIST_PEER_H}
{$define LIBRIST_PEER_H}
{$include "common.h"}
{$include "headers.h"}
{$include "librist_config.h"}
{$include <stdint.h>}
{ C++ extern C conditionnal removed }
type
  Prist_peer = ^Trist_peer;
  Trist_peer = record
      {undefined structure}
    end;

{ Default peer config values  }

const
  RIST_DEFAULT_VIRT_SRC_PORT = 1971;  
  RIST_DEFAULT_VIRT_DST_PORT = 1968;  
  RIST_DEFAULT_RECOVERY_MODE = RIST_RECOVERY_MODE_TIME;  
  RIST_DEFAULT_RECOVERY_MAXBITRATE = 100000;  
  RIST_DEFAULT_RECOVERY_MAXBITRATE_RETURN = 0;  
  RIST_DEFAULT_RECOVERY_LENGTH_MIN = 1000;  
  RIST_DEFAULT_RECOVERY_LENGTH_MAX = 1000;  
  RIST_DEFAULT_RECOVERY_REORDER_BUFFER = 15;  
  RIST_DEFAULT_RECOVERY_RTT_MIN = 5;  
  RIST_DEFAULT_RECOVERY_RTT_MAX = 500;  
  RIST_DEFAULT_CONGESTION_CONTROL_MODE = RIST_CONGESTION_CONTROL_MODE_NORMAL;  
  RIST_DEFAULT_MIN_RETRIES = 6;  
  RIST_DEFAULT_MAX_RETRIES = 20;  
  RIST_DEFAULT_VERBOSE_LEVEL = RIST_LOG_INFO;  
  RIST_DEFAULT_PROFILE = RIST_PROFILE_MAIN;  
  RIST_DEFAULT_SESSION_TIMEOUT = 2000;  
  RIST_DEFAULT_KEEPALIVE_INTERVAL = 1000;  
  RIST_DEFAULT_TIMING_MODE = RIST_TIMING_MODE_SOURCE;  
type
  Trist_timing_mode =  Longint;
  Const
    RIST_TIMING_MODE_SOURCE = 0;
    RIST_TIMING_MODE_ARRIVAL = 1;
    RIST_TIMING_MODE_RTC = 2;

type
  Trist_recovery_mode =  Longint;
  Const
    RIST_RECOVERY_MODE_UNCONFIGURED = 0;
    RIST_RECOVERY_MODE_DISABLED = 1;
    RIST_RECOVERY_MODE_TIME = 2;

type
  Trist_congestion_control_mode =  Longint;
  Const
    RIST_CONGESTION_CONTROL_MODE_OFF = 0;
    RIST_CONGESTION_CONTROL_MODE_NORMAL = 1;
    RIST_CONGESTION_CONTROL_MODE_AGGRESSIVE = 2;

  RIST_PEER_CONFIG_VERSION = 0;  
{ Communication parameters  }
{ If a value of 0 is specified for address family, the library }
{ will parse the address and populate all communication parameters. }
{ Alternatively, use either AF_INET or AF_INET6 and address will be }
{ treated like an IP address or hostname }
{ The virtual destination port is not used for simple profile  }
{ Recovery options  }
{ kbps  }
{ kbps  }
{ ms  }
{ ms  }
{ ms  }
{ ms  }
{ ms  }
{ Load balancing weight (use 0 for duplication)  }
{ Encryption  }
{ Compression (sender only as receiver is auto detect)  }
{ cname identifier for rtcp packets  }
{ Congestion control  }
{ Connection options  }
type
  Prist_peer_config = ^Trist_peer_config;
  Trist_peer_config = record
      version : longint;
      address_family : longint;
      initiate_conn : longint;
      address : array[0..(RIST_MAX_STRING_LONG)-1] of char;
      miface : array[0..(RIST_MAX_STRING_SHORT)-1] of char;
      physical_port : Tuint16_t;
      virt_dst_port : Tuint16_t;
      recovery_mode : Trist_recovery_mode;
      recovery_maxbitrate : Tuint32_t;
      recovery_maxbitrate_return : Tuint32_t;
      recovery_length_min : Tuint32_t;
      recovery_length_max : Tuint32_t;
      recovery_reorder_buffer : Tuint32_t;
      recovery_rtt_min : Tuint32_t;
      recovery_rtt_max : Tuint32_t;
      weight : Tuint32_t;
      secret : array[0..(RIST_MAX_STRING_SHORT)-1] of char;
      key_size : longint;
      key_rotation : Tuint32_t;
      compression : longint;
      cname : array[0..(RIST_MAX_STRING_SHORT)-1] of char;
      congestion_control_mode : Trist_congestion_control_mode;
      min_retries : Tuint32_t;
      max_retries : Tuint32_t;
      session_timeout : Tuint32_t;
      keepalive_interval : Tuint32_t;
      timing_mode : Tuint32_t;
      srp_username : array[0..(RIST_MAX_STRING_LONG)-1] of char;
      srp_password : array[0..(RIST_MAX_STRING_LONG)-1] of char;
    end;

{*
 * @brief Populate a preallocated peer_config structure with library default values
 *
 * @return 0 on success or non-zero on error.
  }

function rist_peer_config_defaults_set(peer_config:Prist_peer_config):longint;cdecl;external;
{*
 * @brief Parses rist url for peer config data (encryption, compression, etc)
 *
 * Use this API to parse a generic URL string and turn it into a meaninful peer_config structure
 *
 * @param url a pointer to a url to be parsed, i.e. rist://myserver.net:1234?buffer=100&cname=hello
 * @param[out] peer_config a pointer to a the rist_peer_config structure (NULL is allowed).
 * When passing NULL, the library will allocate a new rist_peer_config structure with the latest
 * default values and it expects the application to free it when it is done using it.
 * @return 0 on success or non-zero on error. The value returned is actually the number
 * of parameters that are valid
  }
{xxxxxxxRIST_DEPRECATED  }
(* Const before type ignored *)
(* Const before type ignored *)
function rist_parse_address(url:Pchar; peer_config:PPrist_peer_config):longint;cdecl;external;
(* Const before type ignored *)
function rist_parse_address2(url:Pchar; peer_config:PPrist_peer_config):longint;cdecl;external;
{*
 * @brief Free the rist_peer_config structure memory allocation
 *
 * @return 0 on success or non-zero on error.
  }
{%%xxxxxxxxxxRIST_DEPRECATED  }
(* Const before type ignored *)
function rist_peer_config_free(peer_config:PPrist_peer_config):longint;cdecl;external;
function rist_peer_config_free2(peer_config:PPrist_peer_config):longint;cdecl;external;
{*
 * @brief Add a peer to the RIST session
 *
 * One sender can send data to multiple peers.
 *
 * @param ctx RIST context
 * @param[out] peer Store the new peer pointer
 * @param config a pointer to the struct rist_peer_config, which contains
 *        the configuration parameters for the peer endpoint.
 * @return 0 on success, -1 in case of error.
  }
(* Const before type ignored *)
function rist_peer_create(ctx:Prist_ctx; peer:PPrist_peer; config:Prist_peer_config):longint;cdecl;external;
{*
 * @brief Removes a peer from the RIST session.
 *
 * @param ctx RIST context
 * @param peer a pointer to the struct rist_peer, which
 *        points to the peer endpoint.
 * @return 0 on success, -1 in case of error.
  }
function rist_peer_destroy(ctx:Prist_ctx; peer:Prist_peer):longint;cdecl;external;
{*
 * @brief Set the weight of a given peer.
 *
 * @param ctx RIST context
 * @param peer The peer to set the weight for
 * @param weight The weight to assign to the peer
 * @return 0 on success, -1 in case of error.
  }
(* Const before type ignored *)
function rist_peer_weight_set(ctx:Prist_ctx; peer:Prist_peer; weight:Tuint32_t):longint;cdecl;external;
function rist_peer_get_socket(peer:Prist_peer; socket:Plongint; socket_extra:Plongint):longint;cdecl;external;
type
  Trist_connection_status =  Longint;
  Const
    RIST_CONNECTION_ESTABLISHED = 0;
    RIST_CONNECTION_TIMED_OUT = 1;
    RIST_CLIENT_CONNECTED = 2;
    RIST_CLIENT_TIMED_OUT = 3;

{*
 * @brief Connection status callback function
 *
 * Optional calling application provided function for receiving connection status changes for peers.
 *
 * @param arg optional user data set via rist_connection_status_callback_set
 * @param peer peer associated with the event
 * @param rist_peer_connection_status status value
 * @return void.
  }
type

  Tconnection_status_callback_t = procedure (arg:pointer; peer:Prist_peer; peer_connection_status:Trist_connection_status);cdecl;
{*
 * @brief Set callback for receiving connection status change events
 *
 * @param ctx RIST context
 * @param connection_status_callback_t Callback function that will be called.
 * @param arg extra arguments for callback function
  }

function rist_connection_status_callback_set(ctx:Prist_ctx; para2:Tconnection_status_callback_t; arg:pointer):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
type

  Trist_auth_handler_connect_cb = function (arg:pointer; conn_ip:Pchar; conn_port:Tuint16_t; local_ip:Pchar; local_port:Tuint16_t; 
               peer:Prist_peer):longint;cdecl;

  Trist_auth_handler_disconnect_cb = function (arg:pointer; peer:Prist_peer):longint;cdecl;
{*
 * @brief Assign dynamic authentication handler
 *
 * Whenever a new peer is connected, @a connect_cb is called.
 * Whenever a new peer is disconnected, @a disconn_cb is called.
 *
 * @param ctx RIST context
 * @param connect_cb A pointer to the function that will be called when a new peer
 * connects. Return 0 or -1 to authorize or decline (NULL function pointer is valid)
 * @param disconn_cb A pointer to the function that will be called when a new peer
 * is marked as dead (NULL function pointer is valid)
 * @param arg is an the extra argument passed to the `conn_cb` and `disconn_cb`
  }

function rist_auth_handler_set(ctx:Prist_ctx; connect_cb:Trist_auth_handler_connect_cb; disconnect_cb:Trist_auth_handler_disconnect_cb; arg:pointer):longint;cdecl;external;
(* Const before type ignored *)
function rist_peer_get_id(peer:Prist_peer):Tuint32_t;cdecl;external;
{$if HAVE_SRP_SUPPORT}
{
	@brief Update the shared passphrase for the peer
 }
(* Const before type ignored *)

function rist_peer_update_secret(peer:Prist_peer; password:Pchar):longint;cdecl;external;
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBRIST_PEER_H  }

implementation


end.
