{$IFDEF read_interface}


function bson_get_monotonic_time: Tint64_t; cdecl; external libbson;
function bson_gettimeofday(tv: Ptimeval): longint; cdecl; external libbson;

// === Konventiert am: 17-5-26 16:54:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
