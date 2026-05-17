unit mongoc_stream_tls_openssl;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_mongoc, mongoc_stream,mongoc_ssl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
function mongoc_stream_tls_openssl_new(base_stream: Pmongoc_stream_t; host: pchar; opt: Pmongoc_ssl_opt_t; client: longint): Pmongoc_stream_t; cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:14:24 ===


implementation



end.
