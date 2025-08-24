unit util;

interface

uses
  fp_event;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tev_uint64_t = uint64;
  Pev_uint64_t = ^Tev_uint64_t;

  Tev_int64_t = int64;
  Pev_int64_t = ^Tev_int64_t;

  Tev_uint32_t = uint32;
  Pev_uint32_t = ^Tev_uint32_t;

  Tev_int32_t = int32;
  Pev_int32_t = ^Tev_int32_t;

  Tev_uint16_t = uint16;
  Pev_uint16_t = ^Tev_uint16_t;

  Tev_int16_t = int16;
  Pev_int16_t = ^Tev_int16_t;

  Tev_uint8_t = uint8;
  Pev_uint8_t = ^Tev_uint8_t;

  Tev_int8_t = int8;
  Pev_int8_t = ^Tev_int8_t;

  Tev_uintptr_t = PtrUInt;
  Pev_uintptr_t = ^Tev_uintptr_t;

  Tev_intptr_t = PtrInt;
  Pev_intptr_t = ^Tev_intptr_t;

  Tev_ssize_t = SizeInt;
  Pev_ssize_t = ^Tev_ssize_t;

  Tev_off_t = Tev_int64_t;

const
  EV_UINT64_MAX = High(uint64);
  EV_UINT32_MAX = High(uint32);
  EV_UINT16_MAX = High(uint16);
  EV_UINT8_MAX = High(uint8);

  EV_INT64_MAX = High(int64);
  EV_INT64_MIN = Low(int64);

  EV_INT32_MAX = High(int32);
  EV_INT32_MIN = Low(int32);

  EV_INT16_MAX = High(int16);
  EV_INT16_MIN = Low(int16);

  EV_INT8_MAX = High(int8);
  EV_INT8_MIN = Low(int8);

const
  EV_SIZE_MAX = EV_UINT64_MAX;
  EV_SSIZE_MAX = EV_INT64_MAX;

const
  EV_SSIZE_MIN = (-(EV_SSIZE_MAX)) - 1;

type
  Tev_socklen_t = uint32;
  Tevutil_socket_t = longint;
  Pevutil_socket_t = ^Tevutil_socket_t;

type
  Pevutil_monotonic_timer = type Pointer;

const
  EV_MONOT_PRECISE = 1;
  EV_MONOT_FALLBACK = 2;

function evutil_date_rfc1123(date: pchar; datelen: Tsize_t; tm: Ptm): longint; cdecl; external libevent;
function evutil_monotonic_timer_new: Pevutil_monotonic_timer; cdecl; external libevent;
procedure evutil_monotonic_timer_free(timer: Pevutil_monotonic_timer); cdecl; external libevent;
function evutil_configure_monotonic_time(timer: Pevutil_monotonic_timer; flags: longint): longint; cdecl; external libevent;
function evutil_gettime_monotonic(timer: Pevutil_monotonic_timer; tp: Ptimeval): longint; cdecl; external libevent;
function evutil_socketpair(d: longint; _type: longint; protocol: longint; sv: Pevutil_socket_t): longint; cdecl; external libevent;
function evutil_make_socket_nonblocking(sock: Tevutil_socket_t): longint; cdecl; external libevent;
function evutil_make_listen_socket_reuseable(sock: Tevutil_socket_t): longint; cdecl; external libevent;
function evutil_make_listen_socket_reuseable_port(sock: Tevutil_socket_t): longint; cdecl; external libevent;
function evutil_make_listen_socket_ipv6only(sock: Tevutil_socket_t): longint; cdecl; external libevent;
function evutil_make_socket_closeonexec(sock: Tevutil_socket_t): longint; cdecl; external libevent;
function evutil_closesocket(sock: Tevutil_socket_t): longint; cdecl; external libevent;
function evutil_make_tcp_listen_socket_deferred(sock: Tevutil_socket_t): longint; cdecl; external libevent;

{$ifdef windows}
function evutil_socket_geterror(sock: Tevutil_socket_t): longint; cdecl; external libevent;
function evutil_socket_error_to_string(errcode: longint): pchar; cdecl; external libevent;
{$endif}

function evutil_strtoll(s: pchar; endptr: PPchar; base: longint): Tev_int64_t; cdecl; external libevent;

type
  Ptimezone = type Pointer;

function evutil_gettimeofday(tv: Ptimeval; tz: Ptimezone): longint; cdecl; external libevent;
function evutil_snprintf(buf: pchar; buflen: Tsize_t; format: pchar): longint; cdecl; varargs; external libevent;
function evutil_vsnprintf(buf: pchar; buflen: Tsize_t; format: pchar; ap: Tva_list): longint; cdecl; external libevent;
function evutil_inet_ntop(af: longint; src: pointer; dst: pchar; len: Tsize_t): pchar; cdecl; external libevent;
function evutil_inet_pton_scope(af: longint; src: pchar; dst: pointer; indexp: Pdword): longint; cdecl; external libevent;
function evutil_inet_pton(af: longint; src: pchar; dst: pointer): longint; cdecl; external libevent;

type
  Psockaddr = type Pointer;

function evutil_parse_sockaddr_port(str: pchar; out_: Psockaddr; outlen: Plongint): longint; cdecl; external libevent;
function evutil_sockaddr_cmp(sa1: Psockaddr; sa2: Psockaddr; include_port: longint): longint; cdecl; external libevent;
function evutil_ascii_strcasecmp(str1: pchar; str2: pchar): longint; cdecl; external libevent;
function evutil_ascii_strncasecmp(str1: pchar; str2: pchar; n: Tsize_t): longint; cdecl; external libevent;

type
  PPevutil_addrinfo = ^Pevutil_addrinfo;
  Pevutil_addrinfo = ^Tevutil_addrinfo;

  Tevutil_addrinfo = record
    ai_flags: longint;
    ai_family: longint;
    ai_socktype: longint;
    ai_protocol: longint;
    ai_addrlen: Tsize_t;
    ai_canonname: pchar;
    ai_addr: Psockaddr;
    ai_next: Pevutil_addrinfo;
  end;

const
  EVUTIL_EAI_ADDRFAMILY = -(901);
  EVUTIL_EAI_AGAIN = -(902);
  EVUTIL_EAI_BADFLAGS = -(903);
  EVUTIL_EAI_FAIL = -(904);
  EVUTIL_EAI_FAMILY = -(905);
  EVUTIL_EAI_MEMORY = -(906);
  EVUTIL_EAI_NODATA = -(907);
  EVUTIL_EAI_NONAME = -(908);
  EVUTIL_EAI_SERVICE = -(909);
  EVUTIL_EAI_SOCKTYPE = -(910);
  EVUTIL_EAI_SYSTEM = -(911);
  EVUTIL_EAI_CANCEL = -(90001);
  EVUTIL_AI_PASSIVE = $1000;
  EVUTIL_AI_CANONNAME = $2000;
  EVUTIL_AI_NUMERICHOST = $4000;
  EVUTIL_AI_NUMERICSERV = $8000;
  EVUTIL_AI_V4MAPPED = $10000;
  EVUTIL_AI_ALL = $20000;
  EVUTIL_AI_ADDRCONFIG = $40000;

function evutil_getaddrinfo(nodename: pchar; servname: pchar; hints_in: Pevutil_addrinfo; res: PPevutil_addrinfo): longint; cdecl; external libevent;
procedure evutil_freeaddrinfo(ai: Pevutil_addrinfo); cdecl; external libevent;
function evutil_gai_strerror(err: longint): pchar; cdecl; external libevent;
procedure evutil_secure_rng_get_bytes(buf: pointer; n: Tsize_t); cdecl; external libevent;
function evutil_secure_rng_init: longint; cdecl; external libevent;
function evutil_secure_rng_set_urandom_device_file(fname: pchar): longint; cdecl; external libevent;
procedure evutil_secure_rng_add_bytes(dat: pchar; datlen: Tsize_t); cdecl; external libevent;


implementation




end.
