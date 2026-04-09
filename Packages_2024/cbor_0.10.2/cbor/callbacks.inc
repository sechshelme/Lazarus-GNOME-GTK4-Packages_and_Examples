{$IFDEF read_interface}


type
  Tcbor_int8_callback = procedure(para1: pointer; para2: Tuint8_t); cdecl;
  Tcbor_int16_callback = procedure(para1: pointer; para2: Tuint16_t); cdecl;
  Tcbor_int32_callback = procedure(para1: pointer; para2: Tuint32_t); cdecl;
  Tcbor_int64_callback = procedure(para1: pointer; para2: Tuint64_t); cdecl;
  Tcbor_simple_callback = procedure(para1: pointer); cdecl;
  Tcbor_string_callback = procedure(para1: pointer; para2: Tcbor_data; para3: Tuint64_t); cdecl;
  Tcbor_collection_callback = procedure(para1: pointer; para2: Tuint64_t); cdecl;
  Tcbor_float_callback = procedure(para1: pointer; para2: single); cdecl;
  Tcbor_double_callback = procedure(para1: pointer; para2: double); cdecl;
  Tcbor_bool_callback = procedure(para1: pointer; para2: Tbool); cdecl;

  Tcbor_callbacks = record
    uint8: Tcbor_int8_callback;
    uint16: Tcbor_int16_callback;
    uint32: Tcbor_int32_callback;
    uint64: Tcbor_int64_callback;
    negint64: Tcbor_int64_callback;
    negint32: Tcbor_int32_callback;
    negint16: Tcbor_int16_callback;
    negint8: Tcbor_int8_callback;
    byte_string_start: Tcbor_simple_callback;
    byte_string: Tcbor_string_callback;
    _string: Tcbor_string_callback;
    string_start: Tcbor_simple_callback;
    indef_array_start: Tcbor_simple_callback;
    array_start: Tcbor_collection_callback;
    indef_map_start: Tcbor_simple_callback;
    map_start: Tcbor_collection_callback;
    tag: Tcbor_int64_callback;
    float2: Tcbor_float_callback;
    float4: Tcbor_float_callback;
    float8: Tcbor_double_callback;
    undefined: Tcbor_simple_callback;
    null: Tcbor_simple_callback;
    boolean: Tcbor_bool_callback;
    indef_break: Tcbor_simple_callback;
  end;
  Pcbor_callbacks = ^Tcbor_callbacks;

procedure cbor_null_uint8_callback(para1: pointer; para2: Tuint8_t); cdecl; external libcbor;
procedure cbor_null_uint16_callback(para1: pointer; para2: Tuint16_t); cdecl; external libcbor;
procedure cbor_null_uint32_callback(para1: pointer; para2: Tuint32_t); cdecl; external libcbor;
procedure cbor_null_uint64_callback(para1: pointer; para2: Tuint64_t); cdecl; external libcbor;
procedure cbor_null_negint8_callback(para1: pointer; para2: Tuint8_t); cdecl; external libcbor;
procedure cbor_null_negint16_callback(para1: pointer; para2: Tuint16_t); cdecl; external libcbor;
procedure cbor_null_negint32_callback(para1: pointer; para2: Tuint32_t); cdecl; external libcbor;
procedure cbor_null_negint64_callback(para1: pointer; para2: Tuint64_t); cdecl; external libcbor;
procedure cbor_null_string_callback(para1: pointer; para2: Tcbor_data; para3: Tuint64_t); cdecl; external libcbor;
procedure cbor_null_string_start_callback(para1: pointer); cdecl; external libcbor;
procedure cbor_null_byte_string_callback(para1: pointer; para2: Tcbor_data; para3: Tuint64_t); cdecl; external libcbor;
procedure cbor_null_byte_string_start_callback(para1: pointer); cdecl; external libcbor;
procedure cbor_null_array_start_callback(para1: pointer; para2: Tuint64_t); cdecl; external libcbor;
procedure cbor_null_indef_array_start_callback(para1: pointer); cdecl; external libcbor;
procedure cbor_null_map_start_callback(para1: pointer; para2: Tuint64_t); cdecl; external libcbor;
procedure cbor_null_indef_map_start_callback(para1: pointer); cdecl; external libcbor;
procedure cbor_null_tag_callback(para1: pointer; para2: Tuint64_t); cdecl; external libcbor;
procedure cbor_null_float2_callback(para1: pointer; para2: single); cdecl; external libcbor;
procedure cbor_null_float4_callback(para1: pointer; para2: single); cdecl; external libcbor;
procedure cbor_null_float8_callback(para1: pointer; para2: double); cdecl; external libcbor;
procedure cbor_null_null_callback(para1: pointer); cdecl; external libcbor;
procedure cbor_null_undefined_callback(para1: pointer); cdecl; external libcbor;
procedure cbor_null_boolean_callback(para1: pointer; para2: Tbool); cdecl; external libcbor;
procedure cbor_null_indef_break_callback(para1: pointer); cdecl; external libcbor;

var
  cbor_empty_callbacks: Tcbor_callbacks;cvar;external libcbor;

// === Konventiert am: 9-4-26 17:15:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
