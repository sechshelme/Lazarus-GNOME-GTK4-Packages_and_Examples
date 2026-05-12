
unit mongoc_socket;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_socket.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_socket.h
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
Paddrinfo  = ^addrinfo;
Pchar  = ^char;
Pmongoc_iovec_t  = ^mongoc_iovec_t;
Pmongoc_socket_poll_t  = ^mongoc_socket_poll_t;
Pmongoc_socket_t  = ^mongoc_socket_t;
Pmongoc_socklen_t  = ^mongoc_socklen_t;
Psockaddr  = ^sockaddr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2014 MongoDB, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
  }
{$include "mongoc-prelude.h"}
{$ifndef MONGOC_SOCKET_H}
{$define MONGOC_SOCKET_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
{$include "mongoc-config.h"}
{$ifdef _WIN32}
{$include <winsock2.h>}
{$include <ws2tcpip.h>}
{$else}
{$include <arpa/inet.h>}
{$include <poll.h>}
{$include <netdb.h>}
{$include <netinet/in.h>}
{$include <netinet/tcp.h>}
{$include <sys/types.h>}
{$include <sys/socket.h>}
{$include <sys/uio.h>}
{$include <sys/un.h>}
{$endif}
{$if defined(_AIX) && !defined(MONGOC_HAVE_SS_FAMILY)}

const
  ss_family = __ss_family;  
{$endif}
{$include "mongoc-iovec.h"}
type
  Pmongoc_socklen_t = ^Tmongoc_socklen_t;
  Tmongoc_socklen_t = TMONGOC_SOCKET_ARG3;

  Pmongoc_socket_poll_t = ^Tmongoc_socket_poll_t;
  Tmongoc_socket_poll_t = record
      socket : Pmongoc_socket_t;
      events : longint;
      revents : longint;
    end;

function mongoc_socket_accept(sock:Pmongoc_socket_t; expire_at:Tint64_t):Pmongoc_socket_t;cdecl;external;
(* Const before type ignored *)
function mongoc_socket_bind(sock:Pmongoc_socket_t; addr:Psockaddr; addrlen:Tmongoc_socklen_t):longint;cdecl;external;
function mongoc_socket_close(socket:Pmongoc_socket_t):longint;cdecl;external;
(* Const before type ignored *)
function mongoc_socket_connect(sock:Pmongoc_socket_t; addr:Psockaddr; addrlen:Tmongoc_socklen_t; expire_at:Tint64_t):longint;cdecl;external;
function mongoc_socket_getnameinfo(sock:Pmongoc_socket_t):Pchar;cdecl;external;
procedure mongoc_socket_destroy(sock:Pmongoc_socket_t);cdecl;external;
function mongoc_socket_errno(sock:Pmongoc_socket_t):longint;cdecl;external;
function mongoc_socket_getsockname(sock:Pmongoc_socket_t; addr:Psockaddr; addrlen:Pmongoc_socklen_t):longint;cdecl;external;
function mongoc_socket_listen(sock:Pmongoc_socket_t; backlog:dword):longint;cdecl;external;
function mongoc_socket_new(domain:longint; _type:longint; protocol:longint):Pmongoc_socket_t;cdecl;external;
function mongoc_socket_recv(sock:Pmongoc_socket_t; buf:pointer; buflen:Tsize_t; flags:longint; expire_at:Tint64_t):Tssize_t;cdecl;external;
(* Const before type ignored *)
function mongoc_socket_setsockopt(sock:Pmongoc_socket_t; level:longint; optname:longint; optval:pointer; optlen:Tmongoc_socklen_t):longint;cdecl;external;
(* Const before type ignored *)
function mongoc_socket_send(sock:Pmongoc_socket_t; buf:pointer; buflen:Tsize_t; expire_at:Tint64_t):Tssize_t;cdecl;external;
function mongoc_socket_sendv(sock:Pmongoc_socket_t; iov:Pmongoc_iovec_t; iovcnt:Tsize_t; expire_at:Tint64_t):Tssize_t;cdecl;external;
function mongoc_socket_check_closed(sock:Pmongoc_socket_t):Tbool;cdecl;external;
procedure mongoc_socket_inet_ntop(rp:Paddrinfo; buf:Pchar; buflen:Tsize_t);cdecl;external;
function mongoc_socket_poll(sds:Pmongoc_socket_poll_t; nsds:Tsize_t; timeout:Tint32_t):Tssize_t;cdecl;external;
{$endif}
{ MONGOC_SOCKET_H  }

implementation


end.
