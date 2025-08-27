{$IFDEF read_interface}


type
  Pssl_st = type Pointer;

type
  Tbufferevent_ssl_state = longint;

const
  BUFFEREVENT_SSL_OPEN = 0;
  BUFFEREVENT_SSL_CONNECTING = 1;
  BUFFEREVENT_SSL_ACCEPTING = 2;

function bufferevent_openssl_filter_new(base: Pevent_base; underlying: Pbufferevent; ssl: Pssl_st; state: Tbufferevent_ssl_state; options: longint): Pbufferevent; cdecl; external libevent;
function bufferevent_openssl_socket_new(base: Pevent_base; fd: Tevutil_socket_t; ssl: Pssl_st; state: Tbufferevent_ssl_state; options: longint): Pbufferevent; cdecl; external libevent;
function bufferevent_openssl_get_allow_dirty_shutdown(bev: Pbufferevent): longint; cdecl; external libevent;
procedure bufferevent_openssl_set_allow_dirty_shutdown(bev: Pbufferevent; allow_dirty_shutdown: longint); cdecl; external libevent;
function bufferevent_openssl_get_ssl(bufev: Pbufferevent): Pssl_st; cdecl; external libevent;
function bufferevent_ssl_renegotiate(bev: Pbufferevent): longint; cdecl; external libevent;
function bufferevent_get_openssl_error(bev: Pbufferevent): dword; cdecl; external libevent;

// === Konventiert am: 26-8-25 17:43:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
