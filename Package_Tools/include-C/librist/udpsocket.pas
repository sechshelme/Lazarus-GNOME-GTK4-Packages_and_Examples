unit udpsocket;

interface

uses
  fp_rist;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  UDPSOCKET_MAX_HOPS = 32;

const
  AF_LOCAL = AF_UNSPEC;
type
  Psocklen_t = ^Tsocklen_t;
  Tsocklen_t = longint;

const
  UDPSOCKET_SOCK_BUFSIZE = 1048576;

type
  Pudpsocket_url_param = ^Tudpsocket_url_param;
  Tudpsocket_url_param = record
    key: pchar;
    val: pchar;
  end;
  Tudpsocket_url_param_t = Tudpsocket_url_param;
  Pudpsocket_url_param_t = ^Tudpsocket_url_param_t;

function udpsocket_open(af: Tuint16_t): longint; cdecl; external librist;
function udpsocket_open_bind(host: pchar; port: Tuint16_t; mciface: pchar): longint; cdecl; external librist;
function udpsocket_set_optimal_buffer_size(sd: longint): longint; cdecl; external librist;
function udpsocket_set_optimal_buffer_send_size(sd: longint): longint; cdecl; external librist;
function udpsocket_set_buffer_size(sd: longint; bufsize: Tuint32_t): longint; cdecl; external librist;
function udpsocket_set_buffer_send_size(sd: longint; bufsize: Tuint32_t): longint; cdecl; external librist;
function udpsocket_get_buffer_size(sd: longint): Tuint32_t; cdecl; external librist;
function udpsocket_get_buffer_send_size(sd: longint): Tuint32_t; cdecl; external librist;
function udpsocket_set_mcast_iface(sd: longint; mciface: pchar; family: Tuint16_t): longint; cdecl; external librist;
function udpsocket_open_connect(host: pchar; port: Tuint16_t; mciface: pchar): longint; cdecl; external librist;
function udpsocket_resolve_host(host: pchar; port: Tuint16_t; addr: Psockaddr): longint; cdecl; external librist;
function udpsocket_set_nonblocking(sd: longint): longint; cdecl; external librist;
function udpsocket_send(sd: longint; buf: pointer; size: Tsize_t): longint; cdecl; external librist;
function udpsocket_send_nonblocking(sd: longint; buf: pointer; size: Tsize_t): longint; cdecl; external librist;
function udpsocket_sendto(sd: longint; buf: pointer; size: Tsize_t; host: pchar; port: Tuint16_t): longint; cdecl; external librist;
function udpsocket_recv(sd: longint; buf: pointer; size: Tsize_t): longint; cdecl; external librist;
function udpsocket_recvfrom(sd: longint; buf: pointer; size: Tsize_t; flags: longint; addr: Psockaddr;
  addr_len: Psocklen_t): longint; cdecl; external librist;
function udpsocket_close(sd: longint): longint; cdecl; external librist;
function udpsocket_parse_url(url: pchar; address: pchar; address_maxlen: longint; port: Puint16_t; local: Plongint): longint; cdecl; external librist;
function udpsocket_parse_url_parameters(url: pchar; params: Pudpsocket_url_param_t; max_params: longint; clean_url_len: Puint32_t): longint; cdecl; external librist;

const
  EVSOCKET_EV_READ = POLLIN;
  EVSOCKET_EV_WRITE = POLLOUT;

type
  Pevsocket_event = type Pointer;
  Pevsocket_ctx = type Pointer;

function evsocket_create: Pevsocket_ctx; cdecl; external librist;
procedure evsocket_loop(ctx: Pevsocket_ctx; timeout: longint); cdecl; external librist;
procedure evsocket_loop_stop(ctx: Pevsocket_ctx); cdecl; external librist;
function evsocket_loop_single(ctx: Pevsocket_ctx; timeout: longint; max_events: longint): longint; cdecl; external librist;
procedure evsocket_destroy(ctx: Pevsocket_ctx); cdecl; external librist;

type
  Taddevent_func = procedure(ctx: Pevsocket_ctx; fd: longint; revents: smallint; arg: pointer); cdecl;

function evsocket_addevent(ctx: Pevsocket_ctx; fd: longint; events: smallint; callback: Taddevent_func; err_callback: Taddevent_func; arg: pointer): Pevsocket_event; cdecl; external librist;
procedure evsocket_delevent(ctx: Pevsocket_ctx; e: Pevsocket_event); cdecl; external librist;
function evsocket_geteventcount(ctx: Pevsocket_ctx): longint; cdecl; external librist;

// === Konventiert am: 15-8-26 19:16:42 ===


implementation



end.
