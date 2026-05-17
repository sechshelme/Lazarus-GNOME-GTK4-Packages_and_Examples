unit mongoc_matcher;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_mongoc;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  Pmongoc_matcher_t = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function mongoc_matcher_new(query: Pbson_t; error: Pbson_error_t): Pmongoc_matcher_t; cdecl; external libmongoc; deprecated;
function mongoc_matcher_match(matcher: Pmongoc_matcher_t; document: Pbson_t): Boolean; cdecl; external libmongoc; deprecated;
procedure mongoc_matcher_destroy(matcher: Pmongoc_matcher_t); cdecl; external libmongoc; deprecated;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:15:17 ===


implementation



end.
