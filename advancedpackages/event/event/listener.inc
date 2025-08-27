{$IFDEF read_interface}


type
  Pevconnlistener = type Pointer;
  Tevconnlistener_cb = procedure(para1: Pevconnlistener; para2: Tevutil_socket_t; para3: Psockaddr; socklen: longint; para5: pointer); cdecl;
  Tevconnlistener_errorcb = procedure(para1: Pevconnlistener; para2: pointer); cdecl;

const
  LEV_OPT_LEAVE_SOCKETS_BLOCKING = 1 shl 0;
  LEV_OPT_CLOSE_ON_FREE = 1 shl 1;
  LEV_OPT_CLOSE_ON_EXEC = 1 shl 2;
  LEV_OPT_REUSEABLE = 1 shl 3;
  LEV_OPT_THREADSAFE = 1 shl 4;
  LEV_OPT_DISABLED = 1 shl 5;
  LEV_OPT_DEFERRED_ACCEPT = 1 shl 6;
  LEV_OPT_REUSEABLE_PORT = 1 shl 7;
  LEV_OPT_BIND_IPV6ONLY = 1 shl 8;

function evconnlistener_new(base: Pevent_base; cb: Tevconnlistener_cb; ptr: pointer; flags: dword; backlog: longint;
  fd: Tevutil_socket_t): Pevconnlistener; cdecl; external libevent;
function evconnlistener_new_bind(base: Pevent_base; cb: Tevconnlistener_cb; ptr: pointer; flags: dword; backlog: longint;
  sa: Psockaddr; socklen: longint): Pevconnlistener; cdecl; external libevent;
procedure evconnlistener_free(lev: Pevconnlistener); cdecl; external libevent;
function evconnlistener_enable(lev: Pevconnlistener): longint; cdecl; external libevent;
function evconnlistener_disable(lev: Pevconnlistener): longint; cdecl; external libevent;
function evconnlistener_get_base(lev: Pevconnlistener): Pevent_base; cdecl; external libevent;
function evconnlistener_get_fd(lev: Pevconnlistener): Tevutil_socket_t; cdecl; external libevent;
procedure evconnlistener_set_cb(lev: Pevconnlistener; cb: Tevconnlistener_cb; arg: pointer); cdecl; external libevent;
procedure evconnlistener_set_error_cb(lev: Pevconnlistener; errorcb: Tevconnlistener_errorcb); cdecl; external libevent;

// === Konventiert am: 26-8-25 19:37:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
