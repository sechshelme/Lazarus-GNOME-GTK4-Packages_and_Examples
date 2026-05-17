unit mongoc_stream_buffered;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_mongoc, mongoc_stream;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$IFDEF read_function}
function mongoc_stream_buffered_new(base_stream:Pmongoc_stream_t; buffer_size:Tsize_t):Pmongoc_stream_t;cdecl;external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:14:43 ===


implementation



end.
