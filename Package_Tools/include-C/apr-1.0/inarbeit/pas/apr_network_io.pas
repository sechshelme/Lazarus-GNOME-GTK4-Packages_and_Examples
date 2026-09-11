unit apr_network_io;

interface

uses
  fp_apr, apr, apr_errno, apr_time, apr_want;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  APR_MAX_SECS_TO_LINGER = 30;
  APRMAXHOSTLEN = 256;
  APR_ANYADDR = '0.0.0.0';

const
  APR_SO_LINGER = 1;
  APR_SO_KEEPALIVE = 2;
  APR_SO_DEBUG = 4;
  APR_SO_NONBLOCK = 8;
  APR_SO_REUSEADDR = 16;
  APR_SO_SNDBUF = 64;
  APR_SO_RCVBUF = 128;
  APR_SO_DISCONNECTED = 256;
  APR_TCP_NODELAY = 512;
  APR_TCP_NOPUSH = 1024;
  APR_RESET_NODELAY = 2048;
  APR_INCOMPLETE_READ = 4096;
  APR_INCOMPLETE_WRITE = 8192;
  APR_IPV6_V6ONLY = 16384;
  APR_TCP_DEFER_ACCEPT = 32768;
  APR_SO_BROADCAST = 65536;
  APR_SO_FREEBIND = 131072;

type
  Papr_shutdown_how_e = ^Tapr_shutdown_how_e;
  Tapr_shutdown_how_e = longint;
const
  APR_SHUTDOWN_READ = 0;
  APR_SHUTDOWN_WRITE = 1;
  APR_SHUTDOWN_READWRITE = 2;

const
  APR_IPV4_ADDR_OK = $01;
  APR_IPV6_ADDR_OK = $02;

type
  Pin_addr = ^Tin_addr;
  Tin_addr = record
    s_addr: Tapr_uint32_t;
  end;

const
  APR_INADDR_NONE = $ffffffff;

const
  APR_UNSPEC = 0;
  APR_INET = 2;
  APR_INET6 = 10;
  APR_UNIX = 1;

const
  APR_PROTO_TCP = 6;
  APR_PROTO_UDP = 17;
  APR_PROTO_SCTP = 132;

type
  Papr_interface_e = ^Tapr_interface_e;
  Tapr_interface_e = longint;
const
  APR_LOCAL = 0;
  APR_REMOTE = 1;

type
  Papr_socket_t = type Pointer;
  PPapr_socket_t = ^Papr_socket_t;

  Papr_ipsubnet_t = type Pointer;
  PPapr_ipsubnet_t = ^Papr_ipsubnet_t;

  Papr_port_t = ^Tapr_port_t;
  Tapr_port_t = Tapr_uint16_t;

type
  PPapr_sockaddr_t = ^Papr_sockaddr_t;
  Papr_sockaddr_t = type Pointer;

const
  APR_SENDFILE_DISCONNECT_SOCKET = 1;

type
  Papr_hdtr_t = ^Tapr_hdtr_t;
  Tapr_hdtr_t = record
    headers: Piovec;
    numheaders: longint;
    trailers: Piovec;
    numtrailers: longint;
  end;

function apr_socket_create(new_sock: PPapr_socket_t; family: longint; _type: longint; protocol: longint; cont: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_socket_shutdown(thesocket: Papr_socket_t; how: Tapr_shutdown_how_e): Tapr_status_t; cdecl; external libapr;
function apr_socket_close(thesocket: Papr_socket_t): Tapr_status_t; cdecl; external libapr;
function apr_socket_bind(sock: Papr_socket_t; sa: Papr_sockaddr_t): Tapr_status_t; cdecl; external libapr;
function apr_socket_listen(sock: Papr_socket_t; backlog: Tapr_int32_t): Tapr_status_t; cdecl; external libapr;
function apr_socket_accept(new_sock: PPapr_socket_t; sock: Papr_socket_t; connection_pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_socket_connect(sock: Papr_socket_t; sa: Papr_sockaddr_t): Tapr_status_t; cdecl; external libapr;
function apr_socket_atreadeof(sock: Papr_socket_t; atreadeof: Plongint): Tapr_status_t; cdecl; external libapr;
function apr_sockaddr_info_get(sa: PPapr_sockaddr_t; hostname: pchar; family: Tapr_int32_t; port: Tapr_port_t; flags: Tapr_int32_t; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_sockaddr_info_copy(dst: PPapr_sockaddr_t; src: Papr_sockaddr_t; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_sockaddr_zone_set(sa: Papr_sockaddr_t; zone_id: pchar): Tapr_status_t; cdecl; external libapr;
function apr_sockaddr_zone_get(sa: Papr_sockaddr_t; name: PPchar; id: Papr_uint32_t; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_getnameinfo(hostname: PPchar; sa: Papr_sockaddr_t; flags: Tapr_int32_t): Tapr_status_t; cdecl; external libapr;
function apr_parse_addr_port(addr: PPchar; scope_id: PPchar; port: Papr_port_t; str: pchar; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_gethostname(buf: pchar; len: longint; cont: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_socket_data_get(data: Ppointer; key: pchar; sock: Papr_socket_t): Tapr_status_t; cdecl; external libapr;
function apr_socket_data_set(sock: Papr_socket_t; data: pointer; key: pchar; cleanup: Pointer): Tapr_status_t; cdecl; external libapr;
function apr_socket_send(sock: Papr_socket_t; buf: pchar; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_socket_sendv(sock: Papr_socket_t; vec: Piovec; nvec: Tapr_int32_t; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_socket_sendto(sock: Papr_socket_t; where: Papr_sockaddr_t; flags: Tapr_int32_t; buf: pchar; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_socket_recvfrom(from: Papr_sockaddr_t; sock: Papr_socket_t; flags: Tapr_int32_t; buf: pchar; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_socket_sendfile(sock: Papr_socket_t; file_: Papr_file_t; hdtr: Papr_hdtr_t; offset: Papr_off_t; len: Papr_size_t;
  flags: Tapr_int32_t): Tapr_status_t; cdecl; external libapr;
function apr_socket_recv(sock: Papr_socket_t; buf: pchar; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_socket_opt_set(sock: Papr_socket_t; opt: Tapr_int32_t; on: Tapr_int32_t): Tapr_status_t; cdecl; external libapr;
function apr_socket_timeout_set(sock: Papr_socket_t; t: Tapr_interval_time_t): Tapr_status_t; cdecl; external libapr;
function apr_socket_opt_get(sock: Papr_socket_t; opt: Tapr_int32_t; on: Papr_int32_t): Tapr_status_t; cdecl; external libapr;
function apr_socket_timeout_get(sock: Papr_socket_t; t: Papr_interval_time_t): Tapr_status_t; cdecl; external libapr;
function apr_socket_atmark(sock: Papr_socket_t; atmark: Plongint): Tapr_status_t; cdecl; external libapr;
function apr_socket_addr_get(sa: PPapr_sockaddr_t; which: Tapr_interface_e; sock: Papr_socket_t): Tapr_status_t; cdecl; external libapr;
function apr_sockaddr_ip_get(addr: PPchar; sockaddr: Papr_sockaddr_t): Tapr_status_t; cdecl; external libapr;
function apr_sockaddr_ip_getbuf(buf: pchar; buflen: Tapr_size_t; sockaddr: Papr_sockaddr_t): Tapr_status_t; cdecl; external libapr;
function apr_sockaddr_equal(addr1: Papr_sockaddr_t; addr2: Papr_sockaddr_t): longint; cdecl; external libapr;
function apr_sockaddr_is_wildcard(addr: Papr_sockaddr_t): longint; cdecl; external libapr;
function apr_socket_type_get(sock: Papr_socket_t; _type: Plongint): Tapr_status_t; cdecl; external libapr;
function apr_getservbyname(sockaddr: Papr_sockaddr_t; servname: pchar): Tapr_status_t; cdecl; external libapr;
function apr_ipsubnet_create(ipsub: PPapr_ipsubnet_t; ipstr: pchar; mask_or_numbits: pchar; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_ipsubnet_test(ipsub: Papr_ipsubnet_t; sa: Papr_sockaddr_t): longint; cdecl; external libapr;
function apr_socket_accept_filter(sock: Papr_socket_t; name: pchar; args: pchar): Tapr_status_t; cdecl; external libapr;
function apr_socket_protocol_get(sock: Papr_socket_t; protocol: Plongint): Tapr_status_t; cdecl; external libapr;

function apr_mcast_join(sock: Papr_socket_t; join: Papr_sockaddr_t; iface: Papr_sockaddr_t; source: Papr_sockaddr_t): Tapr_status_t; cdecl; external libapr;
function apr_mcast_leave(sock: Papr_socket_t; addr: Papr_sockaddr_t; iface: Papr_sockaddr_t; source: Papr_sockaddr_t): Tapr_status_t; cdecl; external libapr;
function apr_mcast_hops(sock: Papr_socket_t; ttl: Tapr_byte_t): Tapr_status_t; cdecl; external libapr;
function apr_mcast_loopback(sock: Papr_socket_t; opt: Tapr_byte_t): Tapr_status_t; cdecl; external libapr;
function apr_mcast_interface(sock: Papr_socket_t; iface: Papr_sockaddr_t): Tapr_status_t; cdecl; external libapr;

// === Konventiert am: 10-9-26 16:37:10 ===


implementation


end.
