unit mongoc_stream_socket;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_mongoc, mongoc_socket, mongoc_stream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  Pmongoc_stream_socket_t = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function mongoc_stream_socket_new(socket: Pmongoc_socket_t): Pmongoc_stream_t; cdecl; external libmongoc;
function mongoc_stream_socket_get_socket(stream: Pmongoc_stream_socket_t): Pmongoc_socket_t; cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:14:33 ===


implementation



end.
