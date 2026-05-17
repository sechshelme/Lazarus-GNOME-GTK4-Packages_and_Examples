{$IFDEF read_interface}


function bson_get_major_version: longint; cdecl; external libbson;
function bson_get_minor_version: longint; cdecl; external libbson;
function bson_get_micro_version: longint; cdecl; external libbson;
function bson_get_version: pchar; cdecl; external libbson;
function bson_check_version(required_major: longint; required_minor: longint; required_micro: longint): Boolean; cdecl; external libbson;

// === Konventiert am: 17-5-26 16:53:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
