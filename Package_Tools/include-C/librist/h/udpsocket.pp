
unit udpsocket;
interface

{
  Automatically converted by H2Pas 1.0.0 from udpsocket.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    udpsocket.h
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
Pevsocket_ctx  = ^evsocket_ctx;
Pevsocket_event  = ^evsocket_event;
Plongint  = ^longint;
Psockaddr  = ^sockaddr;
Psocklen_t  = ^socklen_t;
Pudpsocket_url_param  = ^udpsocket_url_param;
Pudpsocket_url_param_t  = ^udpsocket_url_param_t;
Puint16_t  = ^uint16_t;
Puint32_t  = ^uint32_t;
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
{$ifndef UDPSOCKET_H}
{$define UDPSOCKET_H}
{$include <stdlib.h>}
{$include <stdint.h>}
{$include <string.h>}
{$include <stdio.h>}
{$include "common.h"}
{ TODO: check errno on windows  }
{$include <errno.h>}

const
  UDPSOCKET_MAX_HOPS = 32;  
{ Windows  }
{$ifdef _WIN32}
{$include <winsock2.h>}
{$define _WINSOCKAPI_}
{$include <windows.h>}
{$include <ws2tcpip.h>}

const
  AF_LOCAL = AF_UNSPEC;  
type
  Psocklen_t = ^Tsocklen_t;
  Tsocklen_t = longint;
{ POSIX  }
{$else}
{$include <sys/types.h>}
{$include <sys/socket.h>}
{$include <netdb.h>}
{$include <unistd.h>}
{$include <arpa/inet.h>}
{$include <netinet/in.h>}
{$include <netinet/ip.h>}
{$include <netinet/ip6.h>}
{$include <net/if.h>}
{$include <poll.h>}
{$endif}
{ Windows / POSIX  }
{ C++ extern C conditionnal removed }
{** Public API ** }

const
  UDPSOCKET_SOCK_BUFSIZE = 1048576;  
type
  Pudpsocket_url_param = ^Tudpsocket_url_param;
  Tudpsocket_url_param = record
      key : Pchar;
      val : Pchar;
    end;
  Tudpsocket_url_param_t = Tudpsocket_url_param;
  Pudpsocket_url_param_t = ^Tudpsocket_url_param_t;
{ Open a udp socket of family [af]
 *
 * Returns: socket descriptor, -1 for error (errno is set)
 *
  }

function udpsocket_open(af:Tuint16_t):longint;cdecl;external;
{ Open a udp socket and binds it to local [host] + [port].
 *
 * binds to multicast interface [mciface], (if not NULL).
 *
 * Returns: socket descriptor, -1 for error (errno is set)
 * (In case of gai_error, -1 is returned, errno is not set, check gai_error)
 *
  }
(* Const before type ignored *)
(* Const before type ignored *)
function udpsocket_open_bind(host:Pchar; port:Tuint16_t; mciface:Pchar):longint;cdecl;external;
{
 * Try to set RX buffer to 1Mbyte and fallback to 256Kbytes if that fails
 * Returns -1 on error, 0 on success.
  }
function udpsocket_set_optimal_buffer_size(sd:longint):longint;cdecl;external;
{
 * Try to set TX buffer to 1Mbyte and fallback to 256Kbytes if that fails
 * Returns -1 on error, 0 on success.
  }
function udpsocket_set_optimal_buffer_send_size(sd:longint):longint;cdecl;external;
{
 * Explicitly set RX buffer size for [sd] to [bufsize], in bytes.
 * Returns -1 on error, 0 on success.
  }
function udpsocket_set_buffer_size(sd:longint; bufsize:Tuint32_t):longint;cdecl;external;
{
 * Explicitly set TX buffer size for [sd] to [bufsize], in bytes.
 * Returns -1 on error, 0 on success.
  }
function udpsocket_set_buffer_send_size(sd:longint; bufsize:Tuint32_t):longint;cdecl;external;
{
 *
 * Retrieve current RX buffer size for [sd].
 * Returns 0 on error, current RX bufsize on success.
  }
function udpsocket_get_buffer_size(sd:longint):Tuint32_t;cdecl;external;
{
 *
 * Retrieve current TX buffer size for [sd].
 * Returns 0 on error, current TX bufsize on success.
  }
function udpsocket_get_buffer_send_size(sd:longint):Tuint32_t;cdecl;external;
{
 * Explicitly set the mcast interface for the socket [sd] to [mciface] for address
 * family [family].
 * Returns 0 on success, -1 on error (errno is set accordingly).
  }
(* Const before type ignored *)
function udpsocket_set_mcast_iface(sd:longint; mciface:Pchar; family:Tuint16_t):longint;cdecl;external;
{ Open a udp socket and connect it to remote [host] + [port].
 *
 * binds to multicast interface [mciface], (if not NULL).
 *
 * Returns: socket descriptor, -1 for error (errno is set)
 * (In case of gai_error, -1 is returned, errno is not set, check gai_error)
 *
  }
(* Const before type ignored *)
(* Const before type ignored *)
function udpsocket_open_connect(host:Pchar; port:Tuint16_t; mciface:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function udpsocket_resolve_host(host:Pchar; port:Tuint16_t; addr:Psockaddr):longint;cdecl;external;
function udpsocket_set_nonblocking(sd:longint):longint;cdecl;external;
(* Const before type ignored *)
function udpsocket_send(sd:longint; buf:pointer; size:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function udpsocket_send_nonblocking(sd:longint; buf:pointer; size:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function udpsocket_sendto(sd:longint; buf:pointer; size:Tsize_t; host:Pchar; port:Tuint16_t):longint;cdecl;external;
function udpsocket_recv(sd:longint; buf:pointer; size:Tsize_t):longint;cdecl;external;
function udpsocket_recvfrom(sd:longint; buf:pointer; size:Tsize_t; flags:longint; addr:Psockaddr; 
           addr_len:Psocklen_t):longint;cdecl;external;
function udpsocket_close(sd:longint):longint;cdecl;external;
function udpsocket_parse_url(url:Pchar; address:Pchar; address_maxlen:longint; port:Puint16_t; local:Plongint):longint;cdecl;external;
(* Const before type ignored *)
function udpsocket_parse_url_parameters(url:Pchar; params:Pudpsocket_url_param_t; max_params:longint; clean_url_len:Puint32_t):longint;cdecl;external;
{ evsocket related functions  }
const
  EVSOCKET_EV_READ = POLLIN;  
  EVSOCKET_EV_WRITE = POLLOUT;  
type
  Pevsocket_event = ^Tevsocket_event;
  Tevsocket_event = record
      {undefined structure}
    end;

  Pevsocket_ctx = ^Tevsocket_ctx;
  Tevsocket_ctx = record
      {undefined structure}
    end;

{*
 * @brief Initialize the evsocket context.
 *
 * Use this API to initialize the evsocket context.
 *
 * @return the evsocket context, NULL for OOM error
  }

function evsocket_create:Pevsocket_ctx;cdecl;external;
{*
 * @brief Start the master socket event processing loop
 *
 * Use this API to start the main loop for socket event processing
 *
 * @param ctx evsocket context
 * @param timeout How long to wait for socket events (ms), 0 for no wait, -1 for infinite
 * @return void
  }
procedure evsocket_loop(ctx:Pevsocket_ctx; timeout:longint);cdecl;external;
{*
 * @brief Signal the master socket event processing loop to stop
 *
 * Use this API to stop the main loop for socket event processing
 *
 * @param ctx evsocket context
 * @return void
  }
procedure evsocket_loop_stop(ctx:Pevsocket_ctx);cdecl;external;
{*
 * @brief Process pending socket events
 *
 * Use this API to process pending socket events
 *
 * @param ctx evsocket context
 * @param timeout How long to wait for socket events (ms), 0 for no wait, -1 for infinite
 * @param max_events Maximum number of events to process
 * @return void
  }
function evsocket_loop_single(ctx:Pevsocket_ctx; timeout:longint; max_events:longint):longint;cdecl;external;
{*
 * @brief Destroy the evsocket context.
 *
 * Use this API to destroy the evsocket context (full cleanup is performed).
 *
 * @return void
  }
procedure evsocket_destroy(ctx:Pevsocket_ctx);cdecl;external;
{*
 * @brief Add a new socket event handler
 *
 * Use this API to add a new socket event handler
 *
 * @param ctx evsocket context
 * @param callback pointer to the callback function to process the event
 * @param err_callback pointer to the err_callback function to process poll errors
 * @param arg the extra argument passed to the `callback` or `err_callback` functions
 * @return void
  }
function evsocket_addevent(ctx:Pevsocket_ctx; fd:longint; events:smallint; callback:procedure (ctx:Pevsocket_ctx; fd:longint; revents:smallint; arg:pointer); err_callback:procedure (ctx:Pevsocket_ctx; fd:longint; revents:smallint; arg:pointer); 
           arg:pointer):Pevsocket_event;cdecl;external;
{*
 * @brief Delete a socket event handler
 *
 * Use this API to delete an existing socket event handler
 *
 * @param ctx evsocket context
 * @param e evsocket_event object pointer for the event handler to delete
 * @return void
  }
procedure evsocket_delevent(ctx:Pevsocket_ctx; e:Pevsocket_event);cdecl;external;
{*
 * @brief Retrieve the evsocket event handler count.
 *
 * Use this API to retrieve the number of active evsocket event handlers.
 *
 * @param ctx evsocket context
 * @return number of active event handlers
  }
function evsocket_geteventcount(ctx:Pevsocket_ctx):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ ifndef UDPSOCKET_H  }

implementation


end.
