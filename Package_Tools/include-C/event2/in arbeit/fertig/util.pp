
unit util;
interface

{
  Automatically converted by H2Pas 1.0.0 from util.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    util.h
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
Pdword  = ^dword;
Pevutil_addrinfo  = ^evutil_addrinfo;
Pevutil_monotonic_timer  = ^evutil_monotonic_timer;
Plongint  = ^longint;
Psockaddr  = ^sockaddr;
Ptimeval  = ^timeval;
Ptimezone  = ^timezone;
Ptm  = ^tm;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2007-2012 Niels Provos and Nick Mathewson
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  }
{$ifndef EVENT2_UTIL_H_INCLUDED_}
{$define EVENT2_UTIL_H_INCLUDED_}
{* @file event2/util.h

  Common convenience functions for cross-platform portability and
  related socket manipulations.

  }
{$include <event2/visibility.h>}
{ C++ extern C conditionnal removed }
{$include <event2/event-config.h>}
{$ifdef EVENT__HAVE_SYS_TIME_H}
{$include <sys/time.h>}
{$endif}
{$ifdef EVENT__HAVE_STDINT_H}
{$include <stdint.h>}
(*** was #elif ****){$else defined(EVENT__HAVE_INTTYPES_H)}
{$include <inttypes.h>}
{$endif}
{$ifdef EVENT__HAVE_SYS_TYPES_H}
{$include <sys/types.h>}
{$endif}
{$ifdef EVENT__HAVE_STDDEF_H}
{$include <stddef.h>}
{$endif}
{$ifdef _MSC_VER}
{$include <BaseTsd.h>}
{$endif}
{$include <stdarg.h>}
{$ifdef EVENT__HAVE_NETDB_H}
{$include <netdb.h>}
{$endif}
{$ifdef _WIN32}
{$include <winsock2.h>}
{$ifdef EVENT__HAVE_GETADDRINFO}
{ for EAI_* definitions.  }
{$include <ws2tcpip.h>}
{$endif}
{$else}
{$ifdef EVENT__HAVE_ERRNO_H}
{$include <errno.h>}
{$endif}
{$include <sys/socket.h>}
{$endif}
{$include <time.h>}
{ Some openbsd autoconf versions get the name of this macro wrong.  }
{$if defined(EVENT__SIZEOF_VOID__) && !defined(EVENT__SIZEOF_VOID_P)}

const
  EVENT__SIZEOF_VOID_P = EVENT__SIZEOF_VOID__;  
{$endif}
{*
 * @name Standard integer types.
 *
 * Integer type definitions for types that are supposed to be defined in the
 * C99-specified stdint.h.  Shamefully, some platforms do not include
 * stdint.h, so we need to replace it.  (If you are on a platform like this,
 * your C headers are now over 10 years out of date.  You should bug them to
 * do something about this.)
 *
 * We define:
 *
 * <dl>
 *   <dt>ev_uint64_t, ev_uint32_t, ev_uint16_t, ev_uint8_t</dt>
 *      <dd>unsigned integer types of exactly 64, 32, 16, and 8 bits
 *          respectively.</dd>
 *    <dt>ev_int64_t, ev_int32_t, ev_int16_t, ev_int8_t</dt>
 *      <dd>signed integer types of exactly 64, 32, 16, and 8 bits
 *          respectively.</dd>
 *    <dt>ev_uintptr_t, ev_intptr_t</dt>
 *      <dd>unsigned/signed integers large enough
 *      to hold a pointer without loss of bits.</dd>
 *    <dt>ev_ssize_t</dt>
 *      <dd>A signed type of the same size as size_t</dd>
 *    <dt>ev_off_t</dt>
 *      <dd>A signed type typically used to represent offsets within a
 *      (potentially large) file</dd>
 *
 * @
  }
{$ifdef EVENT__HAVE_UINT64_T}

const
  ev_uint64_t = uint64_t;  
  ev_int64_t = int64_t;  
(*** was #elif ****){$else defined(_WIN32)}

const
  ev_uint64_t = qword;  
  ev_int64_t = int64;  
(*** was #elif ****){$else EVENT__SIZEOF_LONG_LONG == 8}

const
  ev_uint64_t = qword;  
  ev_int64_t = int64;  
(*** was #elif ****){$else EVENT__SIZEOF_LONG == 8}

const
  ev_uint64_t = dword;  
  ev_int64_t = longint;  
(*** was #elif ****){$else defined(EVENT_IN_DOXYGEN_)}
{$else}
{$error "No way to define ev_uint64_t"}
{$endif}
{$ifdef EVENT__HAVE_UINT32_T}

const
  ev_uint32_t = uint32_t;  
  ev_int32_t = int32_t;  
(*** was #elif ****){$else defined(_WIN32)}

const
  ev_uint32_t = dword;  
  ev_int32_t = longint;  
(*** was #elif ****){$else EVENT__SIZEOF_LONG == 4}

const
  ev_uint32_t = dword;  
  ev_int32_t = longint;  
(*** was #elif ****){$else EVENT__SIZEOF_INT == 4}

const
  ev_uint32_t = dword;  
  ev_int32_t = longint;  
(*** was #elif ****){$else defined(EVENT_IN_DOXYGEN_)}
{$else}
{$error "No way to define ev_uint32_t"}
{$endif}
{$ifdef EVENT__HAVE_UINT16_T}

const
  ev_uint16_t = uint16_t;  
  ev_int16_t = int16_t;  
(*** was #elif ****){$else defined(_WIN32)}

const
  ev_uint16_t = word;  
  ev_int16_t = smallint;  
(*** was #elif ****){$else EVENT__SIZEOF_INT == 2}

const
  ev_uint16_t = dword;  
  ev_int16_t = longint;  
(*** was #elif ****){$else EVENT__SIZEOF_SHORT == 2}

const
  ev_uint16_t = word;  
  ev_int16_t = smallint;  
(*** was #elif ****){$else defined(EVENT_IN_DOXYGEN_)}
{$else}
{$error "No way to define ev_uint16_t"}
{$endif}
{$ifdef EVENT__HAVE_UINT8_T}

const
  ev_uint8_t = uint8_t;  
  ev_int8_t = int8_t;  
(*** was #elif ****){$else defined(EVENT_IN_DOXYGEN_)}
{$else}

const
  ev_uint8_t = byte;  
  ev_int8_t = char;  
{$endif}
{$ifdef EVENT__HAVE_UINTPTR_T}

const
  ev_uintptr_t = uintptr_t;  
  ev_intptr_t = intptr_t;  
(*** was #elif ****){$else EVENT__SIZEOF_VOID_P <= 4}

const
  ev_uintptr_t = ev_uint32_t;  
  ev_intptr_t = ev_int32_t;  
(*** was #elif ****){$else EVENT__SIZEOF_VOID_P <= 8}

const
  ev_uintptr_t = ev_uint64_t;  
  ev_intptr_t = ev_int64_t;  
(*** was #elif ****){$else defined(EVENT_IN_DOXYGEN_)}
{$else}
{$error "No way to define ev_uintptr_t"}
{$endif}
{$ifdef EVENT__ssize_t}

const
  ev_ssize_t = EVENT__ssize_t;  
{$else}

const
  ev_ssize_t = ssize_t;  
{$endif}
{ Note that we define ev_off_t based on the compile-time size of off_t that
 * we used to build Libevent, and not based on the current size of off_t.
 * (For example, we don't define ev_off_t to off_t.).  We do this because
 * some systems let you build your software with different off_t sizes
 * at runtime, and so putting in any dependency on off_t would risk API
 * mismatch.
  }
{$ifdef _WIN32}

const
  ev_off_t = ev_int64_t;  
(*** was #elif ****){$else EVENT__SIZEOF_OFF_T == 8}

const
  ev_off_t = ev_int64_t;  
(*** was #elif ****){$else EVENT__SIZEOF_OFF_T == 4}

const
  ev_off_t = ev_int32_t;  
(*** was #elif ****){$else defined(EVENT_IN_DOXYGEN_)}
{$else}

const
  ev_off_t = off_t;  
{$endif}
{*@ }
{ Limits for integer types.

   We're making two assumptions here:
     - The compiler does constant folding properly.
     - The platform does signed arithmetic in two's complement.
 }
{*
   @name Limits for integer types

   These macros hold the largest or smallest values possible for the
   ev_[u]int*_t types.

   @
 }
{$ifndef EVENT__HAVE_STDINT_H}

{ was #define dname def_expr }
function EV_UINT64_MAX : longint; { return type might be wrong }

{ was #define dname def_expr }
function EV_INT64_MAX : longint; { return type might be wrong }

const
  EV_INT64_MIN = (-(EV_INT64_MAX))-1;  

{ was #define dname def_expr }
function EV_UINT32_MAX : Tev_uint32_t;  

{ was #define dname def_expr }
function EV_INT32_MAX : Tev_int32_t;  

const
  EV_INT32_MIN = (-(EV_INT32_MAX))-1;  

{ was #define dname def_expr }
function EV_UINT16_MAX : Tev_uint16_t;  

{ was #define dname def_expr }
function EV_INT16_MAX : Tev_int16_t;  

const
  EV_INT16_MIN = (-(EV_INT16_MAX))-1;  
  EV_UINT8_MAX = 255;  
  EV_INT8_MAX = 127;  
  EV_INT8_MIN = (-(EV_INT8_MAX))-1;  
{$else}

const
  EV_UINT64_MAX = UINT64_MAX;  
  EV_INT64_MAX = INT64_MAX;  
  EV_INT64_MIN = INT64_MIN;  
  EV_UINT32_MAX = UINT32_MAX;  
  EV_INT32_MAX = INT32_MAX;  
  EV_INT32_MIN = INT32_MIN;  
  EV_UINT16_MAX = UINT16_MAX;  
  EV_INT16_MIN = INT16_MIN;  
  EV_INT16_MAX = INT16_MAX;  
  EV_UINT8_MAX = UINT8_MAX;  
  EV_INT8_MAX = INT8_MAX;  
  EV_INT8_MIN = INT8_MIN;  
{* @  }
{$endif}
{*
   @name Limits for SIZE_T and SSIZE_T

   @
 }
{$if EVENT__SIZEOF_SIZE_T == 8}

const
  EV_SIZE_MAX = EV_UINT64_MAX;  
  EV_SSIZE_MAX = EV_INT64_MAX;  
(*** was #elif ****){$else EVENT__SIZEOF_SIZE_T == 4}

const
  EV_SIZE_MAX = EV_UINT32_MAX;  
  EV_SSIZE_MAX = EV_INT32_MAX;  
(*** was #elif ****){$else defined(EVENT_IN_DOXYGEN_)}
{$else}
{$error "No way to define SIZE_MAX"}
{$endif}

const
  EV_SSIZE_MIN = (-(EV_SSIZE_MAX))-1;  
{*@ }
{$ifdef _WIN32}
  ev_socklen_t = longint;  
(*** was #elif ****){$else defined(EVENT__socklen_t)}

const
  ev_socklen_t = EVENT__socklen_t;  
{$else}

const
  ev_socklen_t = socklen_t;  
{$endif}
{*
 * A type wide enough to hold the output of "socket()" or "accept()".  On
 * Windows, this is an intptr_t; elsewhere, it is an int.  }
{$ifdef _WIN32}

const
  evutil_socket_t = intptr_t;  
{$else}

const
  evutil_socket_t = longint;  
{$endif}
{*
 * Structure to hold information about a monotonic timer
 *
 * Use this with evutil_configure_monotonic_time() and
 * evutil_gettime_monotonic().
 *
 * This is an opaque structure; you can allocate one using
 * evutil_monotonic_timer_new().
 *
 * @see evutil_monotonic_timer_new(), evutil_monotonic_timer_free(),
 * evutil_configure_monotonic_time(), evutil_gettime_monotonic()
  }
type
  Pevutil_monotonic_timer = ^Tevutil_monotonic_timer;
  Tevutil_monotonic_timer = record
      {undefined structure}
    end;


const
  EV_MONOT_PRECISE = 1;  
  EV_MONOT_FALLBACK = 2;  
{* Format a date string using RFC 1123 format (used in HTTP).
 * If `tm` is NULL, current system's time will be used.
 * The number of characters written will be returned.
 * One should check if the return value is smaller than `datelen` to check if
 * the result is truncated or not.
  }
(* Const before type ignored *)
(* Const before type ignored *)

function evutil_date_rfc1123(date:Pchar; datelen:Tsize_t; tm:Ptm):longint;cdecl;external;
{* Allocate a new struct evutil_monotonic_timer for use with the
 * evutil_configure_monotonic_time() and evutil_gettime_monotonic()
 * functions.  You must configure the timer with
 * evutil_configure_monotonic_time() before using it.
  }
function evutil_monotonic_timer_new:Pevutil_monotonic_timer;cdecl;external;
{* Free a struct evutil_monotonic_timer that was allocated using
 * evutil_monotonic_timer_new().
  }
procedure evutil_monotonic_timer_free(timer:Pevutil_monotonic_timer);cdecl;external;
{* Set up a struct evutil_monotonic_timer; flags can include
 * EV_MONOT_PRECISE and EV_MONOT_FALLBACK.
  }
function evutil_configure_monotonic_time(timer:Pevutil_monotonic_timer; flags:longint):longint;cdecl;external;
{* Query the current monotonic time from a struct evutil_monotonic_timer
 * previously configured with evutil_configure_monotonic_time().  Monotonic
 * time is guaranteed never to run in reverse, but is not necessarily epoch-
 * based, or relative to any other definite point.  Use it to make reliable
 * measurements of elapsed time between events even when the system time
 * may be changed.
 *
 * It is not safe to use this funtion on the same timer from multiple
 * threads.
  }
function evutil_gettime_monotonic(timer:Pevutil_monotonic_timer; tp:Ptimeval):longint;cdecl;external;
{* Create two new sockets that are connected to each other.

    On Unix, this simply calls socketpair().  On Windows, it uses the
    loopback network interface on 127.0.0.1, and only
    AF_INET,SOCK_STREAM are supported.

    (This may fail on some Windows hosts where firewall software has cleverly
    decided to keep 127.0.0.1 from talking to itself.)

    Parameters and return values are as for socketpair()
 }
function evutil_socketpair(d:longint; _type:longint; protocol:longint; sv:array[0..1] of Tevutil_socket_t):longint;cdecl;external;
{* Do platform-specific operations as needed to make a socket nonblocking.

    @param sock The socket to make nonblocking
    @return 0 on success, -1 on failure
  }
function evutil_make_socket_nonblocking(sock:Tevutil_socket_t):longint;cdecl;external;
{* Do platform-specific operations to make a listener socket reusable.

    Specifically, we want to make sure that another program will be able
    to bind this address right after we've closed the listener.

    This differs from Windows's interpretation of "reusable", which
    allows multiple listeners to bind the same address at the same time.

    @param sock The socket to make reusable
    @return 0 on success, -1 on failure
  }
function evutil_make_listen_socket_reuseable(sock:Tevutil_socket_t):longint;cdecl;external;
{* Do platform-specific operations to make a listener port reusable.

    Specifically, we want to make sure that multiple programs which also
    set the same socket option will be able to bind, listen at the same time.

    This is a feature available only to Linux 3.9+

    @param sock The socket to make reusable
    @return 0 on success, -1 on failure
  }
function evutil_make_listen_socket_reuseable_port(sock:Tevutil_socket_t):longint;cdecl;external;
{* Set ipv6 only bind socket option to make listener work only in ipv6 sockets.

    According to RFC3493 and most Linux distributions, default value for the
    sockets is to work in IPv4-mapped mode. In IPv4-mapped mode, it is not possible
    to bind same port from different IPv4 and IPv6 handlers.

    @param sock The socket to make in ipv6only working mode
    @return 0 on success, -1 on failure
  }
function evutil_make_listen_socket_ipv6only(sock:Tevutil_socket_t):longint;cdecl;external;
{* Do platform-specific operations as needed to close a socket upon a
    successful execution of one of the exec*() functions.

    @param sock The socket to be closed
    @return 0 on success, -1 on failure
  }
function evutil_make_socket_closeonexec(sock:Tevutil_socket_t):longint;cdecl;external;
{* Do the platform-specific call needed to close a socket returned from
    socket() or accept().

    @param sock The socket to be closed
    @return 0 on success (whether the operation is supported or not),
            -1 on failure
  }
function evutil_closesocket(sock:Tevutil_socket_t):longint;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EVUTIL_CLOSESOCKET(s : longint) : longint;

{* Do platform-specific operations, if possible, to make a tcp listener
 *  socket defer accept()s until there is data to read.
 *  
 *  Not all platforms support this.  You don't want to do this for every
 *  listener socket: only the ones that implement a protocol where the
 *  client transmits before the server needs to respond.
 *
 *  @param sock The listening socket to to make deferred
 *  @return 0 on success (whether the operation is supported or not),
 *       -1 on failure
 }function evutil_make_tcp_listen_socket_deferred(sock:Tevutil_socket_t):longint;cdecl;external;
{$ifdef _WIN32}
{* Return the most recent socket error.  Not idempotent on all platforms.  }
function evutil_socket_geterror(sock:Tevutil_socket_t):longint;cdecl;external;
{* Convert a socket error to a string.  }
(* Const before type ignored *)
function evutil_socket_error_to_string(errcode:longint):Pchar;cdecl;external;
{*
   @name Socket error functions

   These functions are needed for making programs compatible between
   Windows and Unix-like platforms.

   You see, Winsock handles socket errors differently from the rest of
   the world.  Elsewhere, a socket error is like any other error and is
   stored in errno.  But winsock functions require you to retrieve the
   error with a special function, and don't let you use strerror for
   the error codes.  And handling EWOULDBLOCK is ... different.

   @
 }
{*
 * @name Manipulation macros for struct timeval.
 *
 * We define replacements
 * for timeradd, timersub, timerclear, timercmp, and timerisset.
 *
 * @
  }
{ big-int related functions  }
{* Parse a 64-bit value from a string.  Arguments are as for strtol.  }
(* Const before type ignored *)
function evutil_strtoll(s:Pchar; endptr:PPchar; base:longint):Tev_int64_t;cdecl;external;
{* Replacement for gettimeofday on platforms that lack it.  }
{$ifdef EVENT__HAVE_GETTIMEOFDAY}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function evutil_gettimeofday(tv,tz : longint) : longint;

{$else}
type
  Ptimezone = ^Ttimezone;
  Ttimezone = record
      {undefined structure}
    end;


function evutil_gettimeofday(tv:Ptimeval; tz:Ptimezone):longint;cdecl;external;
{$endif}
{* Replacement for snprintf to get consistent behavior on platforms for
    which the return value of snprintf does not conform to C99.
  }
(* Const before type ignored *)

function evutil_snprintf(buf:Pchar; buflen:Tsize_t; format:Pchar; args:array of const):longint;cdecl;external;
function evutil_snprintf(buf:Pchar; buflen:Tsize_t; format:Pchar):longint;cdecl;external;
{* Replacement for vsnprintf to get consistent behavior on platforms for
    which the return value of snprintf does not conform to C99.
  }
(* Const before type ignored *)
function evutil_vsnprintf(buf:Pchar; buflen:Tsize_t; format:Pchar; ap:Tva_list):longint;cdecl;external;
{* Replacement for inet_ntop for platforms which lack it.  }
(* Const before type ignored *)
(* Const before type ignored *)
function evutil_inet_ntop(af:longint; src:pointer; dst:Pchar; len:Tsize_t):Pchar;cdecl;external;
{* Variation of inet_pton that also parses IPv6 scopes. Public for
    unit tests. No reason to call this directly.
  }
(* Const before type ignored *)
function evutil_inet_pton_scope(af:longint; src:Pchar; dst:pointer; indexp:Pdword):longint;cdecl;external;
{* Replacement for inet_pton for platforms which lack it.  }
(* Const before type ignored *)
function evutil_inet_pton(af:longint; src:Pchar; dst:pointer):longint;cdecl;external;
type
  Psockaddr = ^Tsockaddr;
  Tsockaddr = record
      {undefined structure}
    end;

{* Parse an IPv4 or IPv6 address, with optional port, from a string.

    Recognized formats are:
    - [IPv6Address]:port
    - [IPv6Address]
    - IPv6Address
    - IPv4Address:port
    - IPv4Address

    If no port is specified, the port in the output is set to 0.

    @param str The string to parse.
    @param out A struct sockaddr to hold the result.  This should probably be
       a struct sockaddr_storage.
    @param outlen A pointer to the number of bytes that that 'out' can safely
       hold.  Set to the number of bytes used in 'out' on success.
    @return -1 if the address is not well-formed, if the port is out of range,
       or if out is not large enough to hold the result.  Otherwise returns
       0 on success.
 }
(* Const before type ignored *)

function evutil_parse_sockaddr_port(str:Pchar; out:Psockaddr; outlen:Plongint):longint;cdecl;external;
{* Compare two sockaddrs; return 0 if they are equal, or less than 0 if sa1
 * preceeds sa2, or greater than 0 if sa1 follows sa2.  If include_port is
 * true, consider the port as well as the address.  Only implemented for
 * AF_INET and AF_INET6 addresses. The ordering is not guaranteed to remain
 * the same between Libevent versions.  }
(* Const before type ignored *)
(* Const before type ignored *)
function evutil_sockaddr_cmp(sa1:Psockaddr; sa2:Psockaddr; include_port:longint):longint;cdecl;external;
{* As strcasecmp, but always compares the characters in locale-independent
    ASCII.  That's useful if you're handling data in ASCII-based protocols.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function evutil_ascii_strcasecmp(str1:Pchar; str2:Pchar):longint;cdecl;external;
{* As strncasecmp, but always compares the characters in locale-independent
    ASCII.  That's useful if you're handling data in ASCII-based protocols.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function evutil_ascii_strncasecmp(str1:Pchar; str2:Pchar; n:Tsize_t):longint;cdecl;external;
{ Here we define evutil_addrinfo to the native addrinfo type, or redefine it
 * if this system has no getaddrinfo().  }
{$ifdef EVENT__HAVE_STRUCT_ADDRINFO}
const
  evutil_addrinfo = addrinfo;  
{$else}
{* A definition of struct addrinfo for systems that lack it.

    (This is just an alias for struct addrinfo if the system defines
    struct addrinfo.)
 }
{ AI_PASSIVE, AI_CANONNAME, AI_NUMERICHOST  }
{ PF_xxx  }
{ SOCK_xxx  }
{ 0 or IPPROTO_xxx for IPv4 and IPv6  }
{ length of ai_addr  }
{ canonical name for nodename  }
{ binary address  }
{ next structure in linked list  }
type
  Pevutil_addrinfo = ^Tevutil_addrinfo;
  Tevutil_addrinfo = record
      ai_flags : longint;
      ai_family : longint;
      ai_socktype : longint;
      ai_protocol : longint;
      ai_addrlen : Tsize_t;
      ai_canonname : Pchar;
      ai_addr : Psockaddr;
      ai_next : Pevutil_addrinfo;
    end;

{$endif}
{* @name evutil_getaddrinfo() error codes

    These values are possible error codes for evutil_getaddrinfo() and
    related functions.

    @
 }
{$if defined(EAI_ADDRFAMILY) && defined(EVENT__HAVE_GETADDRINFO)}

const
  EVUTIL_EAI_ADDRFAMILY = EAI_ADDRFAMILY;  
{$else}

const
  EVUTIL_EAI_ADDRFAMILY = -(901);  
{$endif}
{$if defined(EAI_AGAIN) && defined(EVENT__HAVE_GETADDRINFO)}

const
  EVUTIL_EAI_AGAIN = EAI_AGAIN;  
{$else}

const
  EVUTIL_EAI_AGAIN = -(902);  
{$endif}
{$if defined(EAI_BADFLAGS) && defined(EVENT__HAVE_GETADDRINFO)}

const
  EVUTIL_EAI_BADFLAGS = EAI_BADFLAGS;  
{$else}

const
  EVUTIL_EAI_BADFLAGS = -(903);  
{$endif}
{$if defined(EAI_FAIL) && defined(EVENT__HAVE_GETADDRINFO)}

const
  EVUTIL_EAI_FAIL = EAI_FAIL;  
{$else}

const
  EVUTIL_EAI_FAIL = -(904);  
{$endif}
{$if defined(EAI_FAMILY) && defined(EVENT__HAVE_GETADDRINFO)}

const
  EVUTIL_EAI_FAMILY = EAI_FAMILY;  
{$else}

const
  EVUTIL_EAI_FAMILY = -(905);  
{$endif}
{$if defined(EAI_MEMORY) && defined(EVENT__HAVE_GETADDRINFO)}

const
  EVUTIL_EAI_MEMORY = EAI_MEMORY;  
{$else}

const
  EVUTIL_EAI_MEMORY = -(906);  
{$endif}
{ This test is a bit complicated, since some MS SDKs decide to
 * remove NODATA or redefine it to be the same as NONAME, in a
 * fun interpretation of RFC 2553 and RFC 3493.  }
{$if defined(EAI_NODATA) && defined(EVENT__HAVE_GETADDRINFO) && (!defined(EAI_NONAME) || EAI_NODATA != EAI_NONAME)}

const
  EVUTIL_EAI_NODATA = EAI_NODATA;  
{$else}

const
  EVUTIL_EAI_NODATA = -(907);  
{$endif}
{$if defined(EAI_NONAME) && defined(EVENT__HAVE_GETADDRINFO)}

const
  EVUTIL_EAI_NONAME = EAI_NONAME;  
{$else}

const
  EVUTIL_EAI_NONAME = -(908);  
{$endif}
{$if defined(EAI_SERVICE) && defined(EVENT__HAVE_GETADDRINFO)}

const
  EVUTIL_EAI_SERVICE = EAI_SERVICE;  
{$else}

const
  EVUTIL_EAI_SERVICE = -(909);  
{$endif}
{$if defined(EAI_SOCKTYPE) && defined(EVENT__HAVE_GETADDRINFO)}

const
  EVUTIL_EAI_SOCKTYPE = EAI_SOCKTYPE;  
{$else}

const
  EVUTIL_EAI_SOCKTYPE = -(910);  
{$endif}
{$if defined(EAI_SYSTEM) && defined(EVENT__HAVE_GETADDRINFO)}

const
  EVUTIL_EAI_SYSTEM = EAI_SYSTEM;  
{$else}

const
  EVUTIL_EAI_SYSTEM = -(911);  
{$endif}

const
  EVUTIL_EAI_CANCEL = -(90001);  
{$if defined(AI_PASSIVE) && defined(EVENT__HAVE_GETADDRINFO)}

const
  EVUTIL_AI_PASSIVE = AI_PASSIVE;  
{$else}

const
  EVUTIL_AI_PASSIVE = $1000;  
{$endif}
{$if defined(AI_CANONNAME) && defined(EVENT__HAVE_GETADDRINFO)}

const
  EVUTIL_AI_CANONNAME = AI_CANONNAME;  
{$else}

const
  EVUTIL_AI_CANONNAME = $2000;  
{$endif}
{$if defined(AI_NUMERICHOST) && defined(EVENT__HAVE_GETADDRINFO)}

const
  EVUTIL_AI_NUMERICHOST = AI_NUMERICHOST;  
{$else}

const
  EVUTIL_AI_NUMERICHOST = $4000;  
{$endif}
{$if defined(AI_NUMERICSERV) && defined(EVENT__HAVE_GETADDRINFO)}

const
  EVUTIL_AI_NUMERICSERV = AI_NUMERICSERV;  
{$else}

const
  EVUTIL_AI_NUMERICSERV = $8000;  
{$endif}
{$if defined(AI_V4MAPPED) && defined(EVENT__HAVE_GETADDRINFO)}

const
  EVUTIL_AI_V4MAPPED = AI_V4MAPPED;  
{$else}

const
  EVUTIL_AI_V4MAPPED = $10000;  
{$endif}
{$if defined(AI_ALL) && defined(EVENT__HAVE_GETADDRINFO)}

const
  EVUTIL_AI_ALL = AI_ALL;  
{$else}

const
  EVUTIL_AI_ALL = $20000;  
{$endif}
{$if defined(AI_ADDRCONFIG) && defined(EVENT__HAVE_GETADDRINFO)}

const
  EVUTIL_AI_ADDRCONFIG = AI_ADDRCONFIG;  
{$else}

const
  EVUTIL_AI_ADDRCONFIG = $40000;  
{$endif}
{*@ }
type
  Pevutil_addrinfo = ^Tevutil_addrinfo;
  Tevutil_addrinfo = record
      {undefined structure}
    end;

{*
 * This function clones getaddrinfo for systems that don't have it.  For full
 * details, see RFC 3493, section 6.1.
 *
 * Limitations:
 * - When the system has no getaddrinfo, we fall back to gethostbyname_r or
 *   gethostbyname, with their attendant issues.
 * - The AI_V4MAPPED and AI_ALL flags are not currently implemented.
 *
 * For a nonblocking variant, see evdns_getaddrinfo.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function evutil_getaddrinfo(nodename:Pchar; servname:Pchar; hints_in:Pevutil_addrinfo; res:PPevutil_addrinfo):longint;cdecl;external;
{* Release storage allocated by evutil_getaddrinfo or evdns_getaddrinfo.  }
procedure evutil_freeaddrinfo(ai:Pevutil_addrinfo);cdecl;external;
(* Const before type ignored *)
function evutil_gai_strerror(err:longint):Pchar;cdecl;external;
{* Generate n bytes of secure pseudorandom data, and store them in buf.
 *
 * Current versions of Libevent use an ARC4-based random number generator,
 * seeded using the platform's entropy source (/dev/urandom on Unix-like
 * systems; CryptGenRandom on Windows).  This is not actually as secure as it
 * should be: ARC4 is a pretty lousy cipher, and the current implementation
 * provides only rudimentary prediction- and backtracking-resistance.  Don't
 * use this for serious cryptographic applications.
  }
procedure evutil_secure_rng_get_bytes(buf:pointer; n:Tsize_t);cdecl;external;
{*
 * Seed the secure random number generator if needed, and return 0 on
 * success or -1 on failure.
 *
 * It is okay to call this function more than once; it will still return
 * 0 if the RNG has been successfully seeded and -1 if it can't be
 * seeded.
 *
 * Ordinarily you don't need to call this function from your own code;
 * Libevent will seed the RNG itself the first time it needs good random
 * numbers.  You only need to call it if (a) you want to double-check
 * that one of the seeding methods did succeed, or (b) you plan to drop
 * the capability to seed (by chrooting, or dropping capabilities, or
 * whatever), and you want to make sure that seeding happens before your
 * program loses the ability to do it.
  }
function evutil_secure_rng_init:longint;cdecl;external;
{*
 * Set a filename to use in place of /dev/urandom for seeding the secure
 * PRNG. Return 0 on success, -1 on failure.
 *
 * Call this function BEFORE calling any other initialization or RNG
 * functions.
 *
 * (This string will _NOT_ be copied internally. Do not free it while any
 * user of the secure RNG might be running. Don't pass anything other than a
 * real /dev/...random device file here, or you might lose security.)
 *
 * This API is unstable, and might change in a future libevent version.
  }
function evutil_secure_rng_set_urandom_device_file(fname:Pchar):longint;cdecl;external;
{* Seed the random number generator with extra random bytes.

    You should almost never need to call this function; it should be
    sufficient to invoke evutil_secure_rng_init(), or let Libevent take
    care of calling evutil_secure_rng_init() on its own.

    If you call this function as a _replacement_ for the regular
    entropy sources, then you need to be sure that your input
    contains a fairly large amount of strong entropy.  Doing so is
    notoriously hard: most people who try get it wrong.  Watch out!

    @param dat a buffer full of a strong source of random numbers
    @param datlen the number of bytes to read from datlen
  }
(* Const before type ignored *)
procedure evutil_secure_rng_add_bytes(dat:Pchar; datlen:Tsize_t);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ EVENT1_EVUTIL_H_INCLUDED_  }

implementation

{ was #define dname def_expr }
function EV_UINT64_MAX : longint; { return type might be wrong }
  begin
    EV_UINT64_MAX:=((Tev_uint64_t($ffffffff)) shl 32) or $ffffffff;
  end;

{ was #define dname def_expr }
function EV_INT64_MAX : longint; { return type might be wrong }
  begin
    EV_INT64_MAX:=((Tev_int64_t($7fffffff)) shl 32) or $ffffffff;
  end;

{ was #define dname def_expr }
function EV_UINT32_MAX : Tev_uint32_t;
  begin
    EV_UINT32_MAX:=Tev_uint32_t($ffffffff);
  end;

{ was #define dname def_expr }
function EV_INT32_MAX : Tev_int32_t;
  begin
    EV_INT32_MAX:=Tev_int32_t($7fffffff);
  end;

{ was #define dname def_expr }
function EV_UINT16_MAX : Tev_uint16_t;
  begin
    EV_UINT16_MAX:=Tev_uint16_t($ffff);
  end;

{ was #define dname def_expr }
function EV_INT16_MAX : Tev_int16_t;
  begin
    EV_INT16_MAX:=Tev_int16_t($7fff);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function EVUTIL_CLOSESOCKET(s : longint) : longint;
begin
  EVUTIL_CLOSESOCKET:=evutil_closesocket(s);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function evutil_gettimeofday(tv,tz : longint) : longint;
begin
  evutil_gettimeofday:=gettimeofday(tv,tz);
end;


end.
