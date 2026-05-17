{$IFDEF read_interface}


function bson_utf8_validate(utf8: pchar; utf8_len: Tsize_t; allow_null: Boolean): Boolean; cdecl; external libbson;
function bson_utf8_escape_for_json(utf8: pchar; utf8_len: Tssize_t): pchar; cdecl; external libbson;
function bson_utf8_get_char(utf8: pchar): Tbson_unichar_t; cdecl; external libbson;
function bson_utf8_next_char(utf8: pchar): pchar; cdecl; external libbson;
procedure bson_utf8_from_unichar(unichar: Tbson_unichar_t; utf8: pchar; len: Puint32_t); cdecl; external libbson;

// === Konventiert am: 17-5-26 16:53:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
