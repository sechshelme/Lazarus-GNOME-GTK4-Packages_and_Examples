{$IFDEF read_interface}


type
  Tmpv_stream_cb_read_fn = function(cookie: pointer; buf: pchar; nbytes: Tuint64_t): Tint64_t; cdecl;
  Tmpv_stream_cb_seek_fn = function(cookie: pointer; offset: Tint64_t): Tint64_t; cdecl;
  Tmpv_stream_cb_size_fn = function(cookie: pointer): Tint64_t; cdecl;
  Tmpv_stream_cb_close_fn = procedure(cookie: pointer); cdecl;
  Tmpv_stream_cb_cancel_fn = procedure(cookie: pointer); cdecl;

  Tmpv_stream_cb_info = record
    cookie: pointer;
    read_fn: Tmpv_stream_cb_read_fn;
    seek_fn: Tmpv_stream_cb_seek_fn;
    size_fn: Tmpv_stream_cb_size_fn;
    close_fn: Tmpv_stream_cb_close_fn;
    cancel_fn: Tmpv_stream_cb_cancel_fn;
  end;
  Pmpv_stream_cb_info = ^Tmpv_stream_cb_info;

  Tmpv_stream_cb_open_ro_fn = function(user_data: pointer; uri: pchar; info: Pmpv_stream_cb_info): longint; cdecl;

function mpv_stream_cb_add_ro(ctx: Pmpv_handle; protocol: pchar; user_data: pointer; open_fn: Tmpv_stream_cb_open_ro_fn): longint; cdecl; external libmpv;

// === Konventiert am: 25-1-26 13:13:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
