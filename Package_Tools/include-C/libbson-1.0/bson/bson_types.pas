unit bson_types;

interface

uses
  fp_bson;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pbson_unichar_t = ^Tbson_unichar_t;
  Tbson_unichar_t = Tuint32_t;

type
  Pbson_context_flags_t = ^Tbson_context_flags_t;
  Tbson_context_flags_t = longint;

const
  BSON_CONTEXT_NONE = 0;
  BSON_CONTEXT_THREAD_SAFE = 1 shl 0;
  BSON_CONTEXT_DISABLE_HOST_CACHE = 1 shl 1;
  BSON_CONTEXT_DISABLE_PID_CACHE = 1 shl 2;
  BSON_CONTEXT_USE_TASK_ID = 1 shl 3;

type
  Pbson_context_t = type Pointer;
  Pbson_json_opts_t = type Pointer;

  Tbson_t = record
    flags: Tuint32_t;
    len: Tuint32_t;
    padding: array[0..119] of Tuint8_t;
  end;
  Pbson_t = ^Tbson_t;
  PPbson_t = ^Pbson_t;

  Tbson_oid_t = record
    bytes: array[0..11] of Tuint8_t;
  end;
  Pbson_oid_t = ^Tbson_oid_t;
  PPbson_oid_t = ^Pbson_oid_t;

  Tbson_decimal128_t = record
    low: Tuint64_t;
    high: Tuint64_t;
  end;
  Pbson_decimal128_t = ^Tbson_decimal128_t;

type
  Pbson_validate_flags_t = ^Tbson_validate_flags_t;
  Tbson_validate_flags_t = longint;

const
  BSON_VALIDATE_NONE = 0;
  BSON_VALIDATE_UTF8 = 1 shl 0;
  BSON_VALIDATE_DOLLAR_KEYS = 1 shl 1;
  BSON_VALIDATE_DOT_KEYS = 1 shl 2;
  BSON_VALIDATE_UTF8_ALLOW_NULL = 1 shl 3;
  BSON_VALIDATE_EMPTY_KEYS = 1 shl 4;

type
  Pbson_type_t = ^Tbson_type_t;
  Tbson_type_t = longint;

const
  BSON_TYPE_EOD = $00;
  BSON_TYPE_DOUBLE = $01;
  BSON_TYPE_UTF8 = $02;
  BSON_TYPE_DOCUMENT = $03;
  BSON_TYPE_ARRAY = $04;
  BSON_TYPE_BINARY = $05;
  BSON_TYPE_UNDEFINED = $06;
  BSON_TYPE_OID = $07;
  BSON_TYPE_BOOL = $08;
  BSON_TYPE_DATE_TIME = $09;
  BSON_TYPE_NULL = $0A;
  BSON_TYPE_REGEX = $0B;
  BSON_TYPE_DBPOINTER = $0C;
  BSON_TYPE_CODE = $0D;
  BSON_TYPE_SYMBOL = $0E;
  BSON_TYPE_CODEWSCOPE = $0F;
  BSON_TYPE_INT32 = $10;
  BSON_TYPE_TIMESTAMP = $11;
  BSON_TYPE_INT64 = $12;
  BSON_TYPE_DECIMAL128 = $13;
  BSON_TYPE_MAXKEY = $7F;
  BSON_TYPE_MINKEY = $FF;

type
  Pbson_subtype_t = ^Tbson_subtype_t;
  Tbson_subtype_t = longint;

const
  BSON_SUBTYPE_BINARY = $00;
  BSON_SUBTYPE_FUNCTION = $01;
  BSON_SUBTYPE_BINARY_DEPRECATED = $02;
  BSON_SUBTYPE_UUID_DEPRECATED = $03;
  BSON_SUBTYPE_UUID = $04;
  BSON_SUBTYPE_MD5 = $05;
  BSON_SUBTYPE_ENCRYPTED = $06;
  BSON_SUBTYPE_COLUMN = $07;
  BSON_SUBTYPE_SENSITIVE = $08;
  BSON_SUBTYPE_USER = $80;

type
  Tbson_value_t = record
    value_type: Tbson_type_t;
    padding: Tint32_t;
    value: record
      case longint of
        0: (v_oid: Tbson_oid_t);
        1: (v_int64: Tint64_t);
        2: (v_int32: Tint32_t);
        3: (v_int8: Tint8_t);
        4: (v_double: double);
        5: (v_bool: Boolean);
        6: (v_datetime: Tint64_t);
        7: (v_timestamp: record
            timestamp: Tuint32_t;
            increment: Tuint32_t;
            end);
        8: (v_utf8: record
            str: pchar;
            len: Tuint32_t;
            end);
        9: (v_doc: record
            data: Puint8_t;
            data_len: Tuint32_t;
            end);
        10: (v_binary: record
            data: Puint8_t;
            data_len: Tuint32_t;
            subtype: Tbson_subtype_t;
            end);
        11: (v_regex: record
            regex: pchar;
            options: pchar;
            end);
        12: (v_dbpointer: record
            collection: pchar;
            collection_len: Tuint32_t;
            oid: Tbson_oid_t;
            end);
        13: (v_code: record
            code: pchar;
            code_len: Tuint32_t;
            end);
        14: (v_codewscope: record
            code: pchar;
            scope_data: Puint8_t;
            code_len: Tuint32_t;
            scope_len: Tuint32_t;
            end);
        15: (v_symbol: record
            symbol: pchar;
            len: Tuint32_t;
            end);
        16: (v_decimal128: Tbson_decimal128_t);
      end;
  end;
  Pbson_value_t = ^Tbson_value_t;

  Tbson_iter_t = record
    raw: Puint8_t;
    len: Tuint32_t;
    off: Tuint32_t;
    _type: Tuint32_t;
    key: Tuint32_t;
    d1: Tuint32_t;
    d2: Tuint32_t;
    d3: Tuint32_t;
    d4: Tuint32_t;
    next_off: Tuint32_t;
    err_off: Tuint32_t;
    value: Tbson_value_t;
  end;
  Pbson_iter_t = ^Tbson_iter_t;

  Tbson_reader_t = record
    _type: Tuint32_t;
  end;
  Pbson_reader_t = ^Tbson_reader_t;

  Tbson_visitor_t = record
    visit_before: function(iter: Pbson_iter_t; key: pchar; data: pointer): Boolean; cdecl;
    visit_after: function(iter: Pbson_iter_t; key: pchar; data: pointer): Boolean; cdecl;
    visit_corrupt: procedure(iter: Pbson_iter_t; data: pointer); cdecl;
    visit_double: function(iter: Pbson_iter_t; key: pchar; v_double: double; data: pointer): Boolean; cdecl;
    visit_utf8: function(iter: Pbson_iter_t; key: pchar; v_utf8_len: Tsize_t; v_utf8: pchar; data: pointer): Boolean; cdecl;
    visit_document: function(iter: Pbson_iter_t; key: pchar; v_document: Pbson_t; data: pointer): Boolean; cdecl;
    visit_array: function(iter: Pbson_iter_t; key: pchar; v_array: Pbson_t; data: pointer): Boolean; cdecl;
    visit_binary: function(iter: Pbson_iter_t; key: pchar; v_subtype: Tbson_subtype_t; v_binary_len: Tsize_t; v_binary: Puint8_t;
      data: pointer): Boolean; cdecl;
    visit_undefined: function(iter: Pbson_iter_t; key: pchar; data: pointer): Boolean; cdecl;
    visit_oid: function(iter: Pbson_iter_t; key: pchar; v_oid: Pbson_oid_t; data: pointer): Boolean; cdecl;
    visit_bool: function(iter: Pbson_iter_t; key: pchar; v_bool: Boolean; data: pointer): Boolean; cdecl;
    visit_date_time: function(iter: Pbson_iter_t; key: pchar; msec_since_epoch: Tint64_t; data: pointer): Boolean; cdecl;
    visit_null: function(iter: Pbson_iter_t; key: pchar; data: pointer): Boolean; cdecl;
    visit_regex: function(iter: Pbson_iter_t; key: pchar; v_regex: pchar; v_options: pchar; data: pointer): Boolean; cdecl;
    visit_dbpointer: function(iter: Pbson_iter_t; key: pchar; v_collection_len: Tsize_t; v_collection: pchar; v_oid: Pbson_oid_t;
      data: pointer): Boolean; cdecl;
    visit_code: function(iter: Pbson_iter_t; key: pchar; v_code_len: Tsize_t; v_code: pchar; data: pointer): Boolean; cdecl;
    visit_symbol: function(iter: Pbson_iter_t; key: pchar; v_symbol_len: Tsize_t; v_symbol: pchar; data: pointer): Boolean; cdecl;
    visit_codewscope: function(iter: Pbson_iter_t; key: pchar; v_code_len: Tsize_t; v_code: pchar; v_scope: Pbson_t;
      data: pointer): Boolean; cdecl;
    visit_int32: function(iter: Pbson_iter_t; key: pchar; v_int32: Tint32_t; data: pointer): Boolean; cdecl;
    visit_timestamp: function(iter: Pbson_iter_t; key: pchar; v_timestamp: Tuint32_t; v_increment: Tuint32_t; data: pointer): Boolean; cdecl;
    visit_int64: function(iter: Pbson_iter_t; key: pchar; v_int64: Tint64_t; data: pointer): Boolean; cdecl;
    visit_maxkey: function(iter: Pbson_iter_t; key: pchar; data: pointer): Boolean; cdecl;
    visit_minkey: function(iter: Pbson_iter_t; key: pchar; data: pointer): Boolean; cdecl;
    visit_unsupported_type: procedure(iter: Pbson_iter_t; key: pchar; type_code: Tuint32_t; data: pointer); cdecl;
    visit_decimal128: function(iter: Pbson_iter_t; key: pchar; v_decimal128: Pbson_decimal128_t; data: pointer): Boolean; cdecl;
    padding: array[0..6] of pointer;
  end;
  Pbson_visitor_t = ^Tbson_visitor_t;

const
  BSON_ERROR_BUFFER_SIZE = 504;

type
  Tbson_error_t = record
    domain: Tuint32_t;
    code: Tuint32_t;
    message: array[0..(BSON_ERROR_BUFFER_SIZE) - 1] of char;
  end;
  Pbson_error_t = ^Tbson_error_t;

  // === Konventiert am: 17-5-26 16:53:28 ===


implementation



end.
