
  {$IFDEF read_struct}
type
  Tmongoc_optional_t = record
    value: boolean;
    is_set: boolean;
  end;
  Pmongoc_optional_t = ^Tmongoc_optional_t;
  {$ENDIF read_struct}

{$IFDEF read_function}
procedure mongoc_optional_init(opt: Pmongoc_optional_t); cdecl; external libmongoc;
function mongoc_optional_is_set(opt: Pmongoc_optional_t): boolean; cdecl; external libmongoc;
function mongoc_optional_value(opt: Pmongoc_optional_t): boolean; cdecl; external libmongoc;
procedure mongoc_optional_set_value(opt: Pmongoc_optional_t; val: boolean); cdecl; external libmongoc;
procedure mongoc_optional_copy(source: Pmongoc_optional_t; copy: Pmongoc_optional_t); cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:15:09 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
