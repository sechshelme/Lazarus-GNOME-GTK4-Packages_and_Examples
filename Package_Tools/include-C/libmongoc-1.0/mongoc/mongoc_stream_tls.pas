unit mongoc_stream_tls;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_mongoc, mongoc_stream, mongoc_ssl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  Pmongoc_stream_tls_t = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function mongoc_stream_tls_handshake(stream: Pmongoc_stream_t; host: pchar; timeout_msec: Tint32_t; events: Plongint; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_stream_tls_handshake_block(stream: Pmongoc_stream_t; host: pchar; timeout_msec: Tint32_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_stream_tls_do_handshake(stream: Pmongoc_stream_t; timeout_msec: Tint32_t): Boolean; cdecl; external libmongoc; deprecated;
function mongoc_stream_tls_check_cert(stream: Pmongoc_stream_t; host: pchar): Boolean; cdecl; external libmongoc; deprecated;
function mongoc_stream_tls_new_with_hostname(base_stream: Pmongoc_stream_t; host: pchar; opt: Pmongoc_ssl_opt_t; client: longint): Pmongoc_stream_t; cdecl; external libmongoc;
function mongoc_stream_tls_new(base_stream: Pmongoc_stream_t; opt: Pmongoc_ssl_opt_t; client: longint): Pmongoc_stream_t; cdecl; external libmongoc; deprecated;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:14:31 ===


implementation



end.
