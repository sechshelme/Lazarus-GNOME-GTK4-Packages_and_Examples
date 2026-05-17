unit mongoc_change_stream;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_mongoc;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  Pmongoc_change_stream_t = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
procedure mongoc_change_stream_destroy(para1: Pmongoc_change_stream_t); cdecl; external libmongoc;
function mongoc_change_stream_get_resume_token(para1: Pmongoc_change_stream_t): Pbson_t; cdecl; external libmongoc;
function mongoc_change_stream_next(para1: Pmongoc_change_stream_t; para2: PPbson_t): Boolean; cdecl; external libmongoc;
function mongoc_change_stream_error_document(para1: Pmongoc_change_stream_t; para2: Pbson_error_t; para3: PPbson_t): Boolean; cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:16:29 ===


implementation



end.
