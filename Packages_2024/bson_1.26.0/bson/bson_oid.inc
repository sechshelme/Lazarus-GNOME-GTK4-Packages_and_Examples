{$IFDEF read_interface}


function bson_oid_compare(oid1: Pbson_oid_t; oid2: Pbson_oid_t): longint; cdecl; external libbson;
procedure bson_oid_copy(src: Pbson_oid_t; dst: Pbson_oid_t); cdecl; external libbson;
function bson_oid_equal(oid1: Pbson_oid_t; oid2: Pbson_oid_t): Boolean; cdecl; external libbson;
function bson_oid_is_valid(str: pchar; length: Tsize_t): Boolean; cdecl; external libbson;
function bson_oid_get_time_t(oid: Pbson_oid_t): Ttime_t; cdecl; external libbson;
function bson_oid_hash(oid: Pbson_oid_t): Tuint32_t; cdecl; external libbson;
procedure bson_oid_init(oid: Pbson_oid_t; context: Pbson_context_t); cdecl; external libbson;
procedure bson_oid_init_from_data(oid: Pbson_oid_t; data: Puint8_t); cdecl; external libbson;
procedure bson_oid_init_from_string(oid: Pbson_oid_t; str: pchar); cdecl; external libbson;
procedure bson_oid_init_sequence(oid: Pbson_oid_t; context: Pbson_context_t); cdecl; external libbson; deprecated;
procedure bson_oid_to_string(oid: Pbson_oid_t; str: pchar); cdecl; external libbson;

// === Konventiert am: 17-5-26 16:53:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
