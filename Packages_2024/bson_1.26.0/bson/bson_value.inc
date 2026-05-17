{$IFDEF read_interface}


procedure bson_value_copy(src: Pbson_value_t; dst: Pbson_value_t); cdecl; external libbson;
procedure bson_value_destroy(value: Pbson_value_t); cdecl; external libbson;

// === Konventiert am: 17-5-26 16:53:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
