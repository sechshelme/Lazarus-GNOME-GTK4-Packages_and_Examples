

  {$IFDEF read_struct}
type
  Pmongoc_socklen_t = ^Tmongoc_socklen_t;
  Tmongoc_socklen_t = SizeInt;

  Pmongoc_socket_t = type Pointer;

  Tmongoc_socket_poll_t = record
    socket: Pmongoc_socket_t;
    events: longint;
    revents: longint;
  end;
  Pmongoc_socket_poll_t = ^Tmongoc_socket_poll_t;
  {$ENDIF read_struct}

{$IFDEF read_function}
function mongoc_socket_accept(sock: Pmongoc_socket_t; expire_at: Tint64_t): Pmongoc_socket_t; cdecl; external libmongoc;
function mongoc_socket_bind(sock: Pmongoc_socket_t; addr: Psockaddr; addrlen: Tmongoc_socklen_t): longint; cdecl; external libmongoc;
function mongoc_socket_close(socket: Pmongoc_socket_t): longint; cdecl; external libmongoc;
function mongoc_socket_connect(sock: Pmongoc_socket_t; addr: Psockaddr; addrlen: Tmongoc_socklen_t; expire_at: Tint64_t): longint; cdecl; external libmongoc;
function mongoc_socket_getnameinfo(sock: Pmongoc_socket_t): pchar; cdecl; external libmongoc;
procedure mongoc_socket_destroy(sock: Pmongoc_socket_t); cdecl; external libmongoc;
function mongoc_socket_errno(sock: Pmongoc_socket_t): longint; cdecl; external libmongoc;
function mongoc_socket_getsockname(sock: Pmongoc_socket_t; addr: Psockaddr; addrlen: Pmongoc_socklen_t): longint; cdecl; external libmongoc;
function mongoc_socket_listen(sock: Pmongoc_socket_t; backlog: dword): longint; cdecl; external libmongoc;
function mongoc_socket_new(domain: longint; _type: longint; protocol: longint): Pmongoc_socket_t; cdecl; external libmongoc;
function mongoc_socket_recv(sock: Pmongoc_socket_t; buf: pointer; buflen: Tsize_t; flags: longint; expire_at: Tint64_t): Tssize_t; cdecl; external libmongoc;
function mongoc_socket_setsockopt(sock: Pmongoc_socket_t; level: longint; optname: longint; optval: pointer; optlen: Tmongoc_socklen_t): longint; cdecl; external libmongoc;
function mongoc_socket_send(sock: Pmongoc_socket_t; buf: pointer; buflen: Tsize_t; expire_at: Tint64_t): Tssize_t; cdecl; external libmongoc;
function mongoc_socket_sendv(sock: Pmongoc_socket_t; iov: Pmongoc_iovec_t; iovcnt: Tsize_t; expire_at: Tint64_t): Tssize_t; cdecl; external libmongoc;
function mongoc_socket_check_closed(sock: Pmongoc_socket_t): Boolean; cdecl; external libmongoc;
procedure mongoc_socket_inet_ntop(rp: Paddrinfo; buf: pchar; buflen: Tsize_t); cdecl; external libmongoc;
function mongoc_socket_poll(sds: Pmongoc_socket_poll_t; nsds: Tsize_t; timeout: Tint32_t): Tssize_t; cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:14:51 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
