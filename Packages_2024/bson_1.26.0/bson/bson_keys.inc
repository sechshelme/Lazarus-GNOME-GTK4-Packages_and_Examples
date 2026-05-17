{$IFDEF read_interface}


function bson_uint32_to_string(value: Tuint32_t; strptr: PPchar; str: pchar; size: Tsize_t): Tsize_t; cdecl; external libbson;

// === Konventiert am: 17-5-26 16:53:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
