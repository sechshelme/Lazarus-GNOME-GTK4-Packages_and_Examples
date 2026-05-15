unit mongoc_stream;

interface

uses
  fp_mongoc, mongoc_iovec, mongoc_socket;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pmongoc_stream_t = ^Tmongoc_stream_t;
  Pmongoc_stream_poll_t = ^Tmongoc_stream_poll_t;

  Tmongoc_stream_t = record
    _type: longint;
    destroy: procedure(stream: Pmongoc_stream_t); cdecl;
    close: function(stream: Pmongoc_stream_t): longint; cdecl;
    flush: function(stream: Pmongoc_stream_t): longint; cdecl;
    writev: function(stream: Pmongoc_stream_t; iov: Pmongoc_iovec_t; iovcnt: Tsize_t; timeout_msec: Tint32_t): Tssize_t; cdecl;
    readv: function(stream: Pmongoc_stream_t; iov: Pmongoc_iovec_t; iovcnt: Tsize_t; min_bytes: Tsize_t; timeout_msec: Tint32_t): Tssize_t; cdecl;
    setsockopt: function(stream: Pmongoc_stream_t; level: longint; optname: longint; optval: pointer; optlen: Tmongoc_socklen_t): longint; cdecl;
    get_base_stream: function(stream: Pmongoc_stream_t): Pmongoc_stream_t; cdecl;
    check_closed: function(stream: Pmongoc_stream_t): Tbool; cdecl;
    poll: function(streams: Pmongoc_stream_poll_t; nstreams: Tsize_t; timeout: Tint32_t): Tssize_t; cdecl;
    failed: procedure(stream: Pmongoc_stream_t); cdecl;
    timed_out: function(stream: Pmongoc_stream_t): Tbool; cdecl;
    should_retry: function(stream: Pmongoc_stream_t): Tbool; cdecl;
    padding: array[0..2] of pointer;
  end;

  Tmongoc_stream_poll_t = record
    stream: Pmongoc_stream_t;
    events: longint;
    revents: longint;
  end;

function mongoc_stream_get_base_stream(stream: Pmongoc_stream_t): Pmongoc_stream_t; cdecl; external libmongoc;
function mongoc_stream_get_tls_stream(stream: Pmongoc_stream_t): Pmongoc_stream_t; cdecl; external libmongoc;
function mongoc_stream_close(stream: Pmongoc_stream_t): longint; cdecl; external libmongoc;
procedure mongoc_stream_destroy(stream: Pmongoc_stream_t); cdecl; external libmongoc;
procedure mongoc_stream_failed(stream: Pmongoc_stream_t); cdecl; external libmongoc;
function mongoc_stream_flush(stream: Pmongoc_stream_t): longint; cdecl; external libmongoc;
function mongoc_stream_writev(stream: Pmongoc_stream_t; iov: Pmongoc_iovec_t; iovcnt: Tsize_t; timeout_msec: Tint32_t): Tssize_t; cdecl; external libmongoc;
function mongoc_stream_write(stream: Pmongoc_stream_t; buf: pointer; count: Tsize_t; timeout_msec: Tint32_t): Tssize_t; cdecl; external libmongoc;
function mongoc_stream_readv(stream: Pmongoc_stream_t; iov: Pmongoc_iovec_t; iovcnt: Tsize_t; min_bytes: Tsize_t; timeout_msec: Tint32_t): Tssize_t; cdecl; external libmongoc;
function mongoc_stream_read(stream: Pmongoc_stream_t; buf: pointer; count: Tsize_t; min_bytes: Tsize_t; timeout_msec: Tint32_t): Tssize_t; cdecl; external libmongoc;
function mongoc_stream_setsockopt(stream: Pmongoc_stream_t; level: longint; optname: longint; optval: pointer; optlen: Tmongoc_socklen_t): longint; cdecl; external libmongoc;
function mongoc_stream_check_closed(stream: Pmongoc_stream_t): Tbool; cdecl; external libmongoc;
function mongoc_stream_timed_out(stream: Pmongoc_stream_t): Tbool; cdecl; external libmongoc;
function mongoc_stream_should_retry(stream: Pmongoc_stream_t): Tbool; cdecl; external libmongoc;
function mongoc_stream_poll(streams: Pmongoc_stream_poll_t; nstreams: Tsize_t; timeout: Tint32_t): Tssize_t; cdecl; external libmongoc;

// === Konventiert am: 15-5-26 15:14:46 ===


implementation



end.
