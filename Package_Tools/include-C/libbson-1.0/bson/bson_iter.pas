unit bson_iter;

interface

uses
  fp_bson, bson_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function bson_iter_value(iter: Pbson_iter_t): Pbson_value_t; cdecl; external libbson;
procedure bson_iter_array(iter: Pbson_iter_t; array_len: Puint32_t; arr: PPuint8_t); cdecl; external libbson;
procedure bson_iter_binary(iter: Pbson_iter_t; subtype: Pbson_subtype_t; binary_len: Puint32_t; binary: PPuint8_t); cdecl; external libbson;
function bson_iter_code(iter: Pbson_iter_t; length: Puint32_t): pchar; cdecl; external libbson;
function bson_iter_codewscope(iter: Pbson_iter_t; length: Puint32_t; scope_len: Puint32_t; scope: PPuint8_t): pchar; cdecl; external libbson;
procedure bson_iter_dbpointer(iter: Pbson_iter_t; collection_len: Puint32_t; collection: PPchar; oid: PPbson_oid_t); cdecl; external libbson;
procedure bson_iter_document(iter: Pbson_iter_t; document_len: Puint32_t; document: PPuint8_t); cdecl; external libbson;
function bson_iter_double(iter: Pbson_iter_t): double; cdecl; external libbson;
function bson_iter_as_double(iter: Pbson_iter_t): double; cdecl; external libbson;
function bson_iter_init(iter: Pbson_iter_t; bson: Pbson_t): Boolean; cdecl; external libbson;
function bson_iter_init_from_data(iter: Pbson_iter_t; data: Puint8_t; length: Tsize_t): Boolean; cdecl; external libbson;
function bson_iter_init_find(iter: Pbson_iter_t; bson: Pbson_t; key: pchar): Boolean; cdecl; external libbson;
function bson_iter_init_find_w_len(iter: Pbson_iter_t; bson: Pbson_t; key: pchar; keylen: longint): Boolean; cdecl; external libbson;
function bson_iter_init_find_case(iter: Pbson_iter_t; bson: Pbson_t; key: pchar): Boolean; cdecl; external libbson;
function bson_iter_init_from_data_at_offset(iter: Pbson_iter_t; data: Puint8_t; length: Tsize_t; offset: Tuint32_t; keylen: Tuint32_t): Boolean; cdecl; external libbson;
function bson_iter_int32(iter: Pbson_iter_t): Tint32_t; cdecl; external libbson;
function bson_iter_int64(iter: Pbson_iter_t): Tint64_t; cdecl; external libbson;
function bson_iter_as_int64(iter: Pbson_iter_t): Tint64_t; cdecl; external libbson;
function bson_iter_find(iter: Pbson_iter_t; key: pchar): Boolean; cdecl; external libbson;
function bson_iter_find_w_len(iter: Pbson_iter_t; key: pchar; keylen: longint): Boolean; cdecl; external libbson;
function bson_iter_find_case(iter: Pbson_iter_t; key: pchar): Boolean; cdecl; external libbson;
function bson_iter_find_descendant(iter: Pbson_iter_t; dotkey: pchar; descendant: Pbson_iter_t): Boolean; cdecl; external libbson;
function bson_iter_next(iter: Pbson_iter_t): Boolean; cdecl; external libbson;
function bson_iter_oid(iter: Pbson_iter_t): Pbson_oid_t; cdecl; external libbson;
function bson_iter_decimal128(iter: Pbson_iter_t; dec: Pbson_decimal128_t): Boolean; cdecl; external libbson;
function bson_iter_key(iter: Pbson_iter_t): pchar; cdecl; external libbson;
function bson_iter_key_len(iter: Pbson_iter_t): Tuint32_t; cdecl; external libbson;
function bson_iter_utf8(iter: Pbson_iter_t; length: Puint32_t): pchar; cdecl; external libbson;
function bson_iter_dup_utf8(iter: Pbson_iter_t; length: Puint32_t): pchar; cdecl; external libbson;
function bson_iter_date_time(iter: Pbson_iter_t): Tint64_t; cdecl; external libbson;
function bson_iter_time_t(iter: Pbson_iter_t): Ttime_t; cdecl; external libbson;
procedure bson_iter_timeval(iter: Pbson_iter_t; tv: Ptimeval); cdecl; external libbson;
procedure bson_iter_timestamp(iter: Pbson_iter_t; timestamp: Puint32_t; increment: Puint32_t); cdecl; external libbson;
function bson_iter_bool(iter: Pbson_iter_t): Boolean; cdecl; external libbson;
function bson_iter_as_bool(iter: Pbson_iter_t): Boolean; cdecl; external libbson;
function bson_iter_regex(iter: Pbson_iter_t; options: PPchar): pchar; cdecl; external libbson;
function bson_iter_symbol(iter: Pbson_iter_t; length: Puint32_t): pchar; cdecl; external libbson;
function bson_iter_type(iter: Pbson_iter_t): Tbson_type_t; cdecl; external libbson;
function bson_iter_recurse(iter: Pbson_iter_t; child: Pbson_iter_t): Boolean; cdecl; external libbson;
procedure bson_iter_overwrite_int32(iter: Pbson_iter_t; value: Tint32_t); cdecl; external libbson;
procedure bson_iter_overwrite_int64(iter: Pbson_iter_t; value: Tint64_t); cdecl; external libbson;
procedure bson_iter_overwrite_double(iter: Pbson_iter_t; value: double); cdecl; external libbson;
procedure bson_iter_overwrite_decimal128(iter: Pbson_iter_t; value: Pbson_decimal128_t); cdecl; external libbson;
procedure bson_iter_overwrite_bool(iter: Pbson_iter_t; value: Boolean); cdecl; external libbson;
procedure bson_iter_overwrite_oid(iter: Pbson_iter_t; value: Pbson_oid_t); cdecl; external libbson;
procedure bson_iter_overwrite_timestamp(iter: Pbson_iter_t; timestamp: Tuint32_t; increment: Tuint32_t); cdecl; external libbson;
procedure bson_iter_overwrite_date_time(iter: Pbson_iter_t; value: Tint64_t); cdecl; external libbson;
function bson_iter_visit_all(iter: Pbson_iter_t; visitor: Pbson_visitor_t; data: pointer): Boolean; cdecl; external libbson;
function bson_iter_offset(iter: Pbson_iter_t): Tuint32_t; cdecl; external libbson;

// === Konventiert am: 17-5-26 16:53:48 ===


implementation



end.
