{$IFDEF read_interface}


const
  BSON_MAX_SIZE: Tsize_t = (1 shl 31) - 1;


function bson_new: Pbson_t; cdecl; external libbson;
function bson_new_from_json(data: Puint8_t; len: Tssize_t; error: Pbson_error_t): Pbson_t; cdecl; external libbson;
function bson_init_from_json(bson: Pbson_t; data: pchar; len: Tssize_t; error: Pbson_error_t): Boolean; cdecl; external libbson;
function bson_init_static(b: Pbson_t; data: Puint8_t; length: Tsize_t): Boolean; cdecl; external libbson;
procedure bson_init(b: Pbson_t); cdecl; external libbson;
procedure bson_reinit(b: Pbson_t); cdecl; external libbson;
function bson_new_from_data(data: Puint8_t; length: Tsize_t): Pbson_t; cdecl; external libbson;
function bson_new_from_buffer(buf: PPuint8_t; buf_len: Psize_t; realloc_func: Tbson_realloc_func; realloc_func_ctx: pointer): Pbson_t; cdecl; external libbson;
function bson_sized_new(size: Tsize_t): Pbson_t; cdecl; external libbson;
function bson_copy(bson: Pbson_t): Pbson_t; cdecl; external libbson;
procedure bson_copy_to(src: Pbson_t; dst: Pbson_t); cdecl; external libbson;
procedure bson_copy_to_excluding(src: Pbson_t; dst: Pbson_t; first_exclude: pchar); cdecl; varargs; external libbson; deprecated;
procedure bson_copy_to_excluding_noinit(src: Pbson_t; dst: Pbson_t; first_exclude: pchar); cdecl; varargs; external libbson;
procedure bson_copy_to_excluding_noinit_va(src: Pbson_t; dst: Pbson_t; first_exclude: pchar; args: Tva_list); cdecl; external libbson;
procedure bson_destroy(bson: Pbson_t); cdecl; external libbson;
function bson_reserve_buffer(bson: Pbson_t; size: Tuint32_t): Puint8_t; cdecl; external libbson;
function bson_steal(dst: Pbson_t; src: Pbson_t): Boolean; cdecl; external libbson;
function bson_destroy_with_steal(bson: Pbson_t; steal: Boolean; length: Puint32_t): Puint8_t; cdecl; external libbson;
function bson_get_data(bson: Pbson_t): Puint8_t; cdecl; external libbson;
function bson_count_keys(bson: Pbson_t): Tuint32_t; cdecl; external libbson;
function bson_has_field(bson: Pbson_t; key: pchar): Boolean; cdecl; external libbson;
function bson_compare(bson: Pbson_t; other: Pbson_t): longint; cdecl; external libbson;
function bson_equal(bson: Pbson_t; other: Pbson_t): Boolean; cdecl; external libbson;
function bson_validate(bson: Pbson_t; flags: Tbson_validate_flags_t; offset: Psize_t): Boolean; cdecl; external libbson;
function bson_validate_with_error(bson: Pbson_t; flags: Tbson_validate_flags_t; error: Pbson_error_t): Boolean; cdecl; external libbson;
function bson_as_json_with_opts(bson: Pbson_t; length: Psize_t; opts: Pbson_json_opts_t): pchar; cdecl; external libbson;
function bson_as_canonical_extended_json(bson: Pbson_t; length: Psize_t): pchar; cdecl; external libbson;
function bson_as_json(bson: Pbson_t; length: Psize_t): pchar; cdecl; external libbson;
function bson_as_relaxed_extended_json(bson: Pbson_t; length: Psize_t): pchar; cdecl; external libbson;
function bson_array_as_json(bson: Pbson_t; length: Psize_t): pchar; cdecl; external libbson;
function bson_array_as_relaxed_extended_json(bson: Pbson_t; length: Psize_t): pchar; cdecl; external libbson;
function bson_array_as_canonical_extended_json(bson: Pbson_t; length: Psize_t): pchar; cdecl; external libbson;

type
  Pbson_array_builder_t = type Pointer;
  PPbson_array_builder_t = ^Pbson_array_builder_t;

function bson_array_builder_new: Pbson_array_builder_t; cdecl; external libbson;
function bson_array_builder_build(bab: Pbson_array_builder_t; out_: Pbson_t): Boolean; cdecl; external libbson;
procedure bson_array_builder_destroy(bab: Pbson_array_builder_t); cdecl; external libbson;
function bson_append_value(bson: Pbson_t; key: pchar; key_length: longint; value: Pbson_value_t): Boolean; cdecl; external libbson;

function bson_array_builder_append_value(bab: Pbson_array_builder_t; value: Pbson_value_t): Boolean; cdecl; external libbson;
function bson_append_array(bson: Pbson_t; key: pchar; key_length: longint; arr: Pbson_t): Boolean; cdecl; external libbson;
function bson_array_builder_append_array(bab: Pbson_array_builder_t; arr: Pbson_t): Boolean; cdecl; external libbson;
function bson_append_binary(bson: Pbson_t; key: pchar; key_length: longint; subtype: Tbson_subtype_t; binary: Puint8_t;
  length: Tuint32_t): Boolean; cdecl; external libbson;
function bson_array_builder_append_binary(bab: Pbson_array_builder_t; subtype: Tbson_subtype_t; binary: Puint8_t; length: Tuint32_t): Boolean; cdecl; external libbson;
function bson_append_bool(bson: Pbson_t; key: pchar; key_length: longint; value: Boolean): Boolean; cdecl; external libbson;
function bson_array_builder_append_bool(bab: Pbson_array_builder_t; value: Boolean): Boolean; cdecl; external libbson;
function bson_append_code(bson: Pbson_t; key: pchar; key_length: longint; javascript: pchar): Boolean; cdecl; external libbson;
function bson_array_builder_append_code(bab: Pbson_array_builder_t; javascript: pchar): Boolean; cdecl; external libbson;
function bson_append_code_with_scope(bson: Pbson_t; key: pchar; key_length: longint; javascript: pchar; scope: Pbson_t): Boolean; cdecl; external libbson;
function bson_array_builder_append_code_with_scope(bab: Pbson_array_builder_t; javascript: pchar; scope: Pbson_t): Boolean; cdecl; external libbson;
function bson_append_dbpointer(bson: Pbson_t; key: pchar; key_length: longint; collection: pchar; oid: Pbson_oid_t): Boolean; cdecl; external libbson;
function bson_array_builder_append_dbpointer(bab: Pbson_array_builder_t; collection: pchar; oid: Pbson_oid_t): Boolean; cdecl; external libbson;
function bson_append_double(bson: Pbson_t; key: pchar; key_length: longint; value: double): Boolean; cdecl; external libbson;
function bson_array_builder_append_double(bab: Pbson_array_builder_t; value: double): Boolean; cdecl; external libbson;
function bson_append_document(bson: Pbson_t; key: pchar; key_length: longint; value: Pbson_t): Boolean; cdecl; external libbson;
function bson_array_builder_append_document(bab: Pbson_array_builder_t; value: Pbson_t): Boolean; cdecl; external libbson;
function bson_append_document_begin(bson: Pbson_t; key: pchar; key_length: longint; child: Pbson_t): Boolean; cdecl; external libbson;
function bson_array_builder_append_document_begin(bab: Pbson_array_builder_t; child: Pbson_t): Boolean; cdecl; external libbson;
function bson_append_document_end(bson: Pbson_t; child: Pbson_t): Boolean; cdecl; external libbson;
function bson_array_builder_append_document_end(bab: Pbson_array_builder_t; child: Pbson_t): Boolean; cdecl; external libbson;
function bson_append_array_begin(bson: Pbson_t; key: pchar; key_length: longint; child: Pbson_t): Boolean; cdecl; external libbson;
function bson_append_array_end(bson: Pbson_t; child: Pbson_t): Boolean; cdecl; external libbson;
function bson_append_int32(bson: Pbson_t; key: pchar; key_length: longint; value: Tint32_t): Boolean; cdecl; external libbson;
function bson_array_builder_append_int32(bab: Pbson_array_builder_t; value: Tint32_t): Boolean; cdecl; external libbson;
function bson_append_int64(bson: Pbson_t; key: pchar; key_length: longint; value: Tint64_t): Boolean; cdecl; external libbson;
function bson_array_builder_append_int64(bab: Pbson_array_builder_t; value: Tint64_t): Boolean; cdecl; external libbson;
function bson_append_decimal128(bson: Pbson_t; key: pchar; key_length: longint; value: Pbson_decimal128_t): Boolean; cdecl; external libbson;
function bson_array_builder_append_decimal128(bab: Pbson_array_builder_t; value: Pbson_decimal128_t): Boolean; cdecl; external libbson;
function bson_append_iter(bson: Pbson_t; key: pchar; key_length: longint; iter: Pbson_iter_t): Boolean; cdecl; external libbson;
function bson_array_builder_append_iter(bab: Pbson_array_builder_t; iter: Pbson_iter_t): Boolean; cdecl; external libbson;
function bson_append_minkey(bson: Pbson_t; key: pchar; key_length: longint): Boolean; cdecl; external libbson;
function bson_array_builder_append_minkey(bab: Pbson_array_builder_t): Boolean; cdecl; external libbson;
function bson_append_maxkey(bson: Pbson_t; key: pchar; key_length: longint): Boolean; cdecl; external libbson;
function bson_array_builder_append_maxkey(bab: Pbson_array_builder_t): Boolean; cdecl; external libbson;
function bson_append_null(bson: Pbson_t; key: pchar; key_length: longint): Boolean; cdecl; external libbson;
function bson_array_builder_append_null(bab: Pbson_array_builder_t): Boolean; cdecl; external libbson;
function bson_append_oid(bson: Pbson_t; key: pchar; key_length: longint; oid: Pbson_oid_t): Boolean; cdecl; external libbson;
function bson_array_builder_append_oid(bab: Pbson_array_builder_t; oid: Pbson_oid_t): Boolean; cdecl; external libbson;
function bson_append_regex(bson: Pbson_t; key: pchar; key_length: longint; regex: pchar; options: pchar): Boolean; cdecl; external libbson;
function bson_array_builder_append_regex(bab: Pbson_array_builder_t; regex: pchar; options: pchar): Boolean; cdecl; external libbson;
function bson_append_regex_w_len(bson: Pbson_t; key: pchar; key_length: longint; regex: pchar; regex_length: longint;
  options: pchar): Boolean; cdecl; external libbson;
function bson_array_builder_append_regex_w_len(bab: Pbson_array_builder_t; regex: pchar; regex_length: longint; options: pchar): Boolean; cdecl; external libbson;
function bson_append_utf8(bson: Pbson_t; key: pchar; key_length: longint; value: pchar; length: longint): Boolean; cdecl; external libbson;
function bson_array_builder_append_utf8(bab: Pbson_array_builder_t; value: pchar; length: longint): Boolean; cdecl; external libbson;
function bson_append_symbol(bson: Pbson_t; key: pchar; key_length: longint; value: pchar; length: longint): Boolean; cdecl; external libbson;
function bson_array_builder_append_symbol(bab: Pbson_array_builder_t; value: pchar; length: longint): Boolean; cdecl; external libbson;
function bson_append_time_t(bson: Pbson_t; key: pchar; key_length: longint; value: Ttime_t): Boolean; cdecl; external libbson;
function bson_array_builder_append_time_t(bab: Pbson_array_builder_t; value: Ttime_t): Boolean; cdecl; external libbson;
function bson_append_timeval(bson: Pbson_t; key: pchar; key_length: longint; value: Ptimeval): Boolean; cdecl; external libbson;
function bson_array_builder_append_timeval(bab: Pbson_array_builder_t; value: Ptimeval): Boolean; cdecl; external libbson;
function bson_append_date_time(bson: Pbson_t; key: pchar; key_length: longint; value: Tint64_t): Boolean; cdecl; external libbson;
function bson_array_builder_append_date_time(bab: Pbson_array_builder_t; value: Tint64_t): Boolean; cdecl; external libbson;
function bson_append_now_utc(bson: Pbson_t; key: pchar; key_length: longint): Boolean; cdecl; external libbson;
function bson_array_builder_append_now_utc(bab: Pbson_array_builder_t): Boolean; cdecl; external libbson;
function bson_append_timestamp(bson: Pbson_t; key: pchar; key_length: longint; timestamp: Tuint32_t; increment: Tuint32_t): Boolean; cdecl; external libbson;
function bson_array_builder_append_timestamp(bab: Pbson_array_builder_t; timestamp: Tuint32_t; increment: Tuint32_t): Boolean; cdecl; external libbson;
function bson_append_undefined(bson: Pbson_t; key: pchar; key_length: longint): Boolean; cdecl; external libbson;
function bson_array_builder_append_undefined(bab: Pbson_array_builder_t): Boolean; cdecl; external libbson;
function bson_concat(dst: Pbson_t; src: Pbson_t): Boolean; cdecl; external libbson;
function bson_append_array_builder_begin(bson: Pbson_t; key: pchar; key_length: longint; child: PPbson_array_builder_t): Boolean; cdecl; external libbson;
function bson_array_builder_append_array_builder_begin(bab: Pbson_array_builder_t; child: PPbson_array_builder_t): Boolean; cdecl; external libbson;
function bson_append_array_builder_end(bson: Pbson_t; child: Pbson_array_builder_t): Boolean; cdecl; external libbson;
function bson_array_builder_append_array_builder_end(bab: Pbson_array_builder_t; child: Pbson_array_builder_t): Boolean; cdecl; external libbson;

// === Konventiert am: 17-5-26 16:54:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
