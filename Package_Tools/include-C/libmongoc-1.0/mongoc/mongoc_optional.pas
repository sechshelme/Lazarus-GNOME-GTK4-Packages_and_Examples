unit mongoc_optional;

interface

uses
  fp_mongoc;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tmongoc_optional_t = record
    value: boolean;
    is_set: boolean;
  end;
  Pmongoc_optional_t = ^Tmongoc_optional_t;

procedure mongoc_optional_init(opt: Pmongoc_optional_t); cdecl; external libmongoc;
function mongoc_optional_is_set(opt: Pmongoc_optional_t): Boolean; cdecl; external libmongoc;
function mongoc_optional_value(opt: Pmongoc_optional_t): Boolean; cdecl; external libmongoc;
procedure mongoc_optional_set_value(opt: Pmongoc_optional_t; val: Boolean); cdecl; external libmongoc;
procedure mongoc_optional_copy(source: Pmongoc_optional_t; copy: Pmongoc_optional_t); cdecl; external libmongoc;

// === Konventiert am: 15-5-26 15:15:09 ===


implementation



end.
