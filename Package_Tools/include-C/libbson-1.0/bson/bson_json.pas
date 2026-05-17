unit bson_json;

interface

uses
  fp_bson, bson_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pbson_json_reader_t = type Pointer;

type
  Pbson_json_error_code_t = ^Tbson_json_error_code_t;
  Tbson_json_error_code_t = longint;

const
  BSON_JSON_ERROR_READ_CORRUPT_JS = 1;
  BSON_JSON_ERROR_READ_INVALID_PARAM = 2;
  BSON_JSON_ERROR_READ_CB_FAILURE = 3;

const
  BSON_MAX_LEN_UNLIMITED = -(1);

type
  Pbson_json_mode_t = ^Tbson_json_mode_t;
  Tbson_json_mode_t = longint;

const
  BSON_JSON_MODE_LEGACY = 0;
  BSON_JSON_MODE_CANONICAL = 1;
  BSON_JSON_MODE_RELAXED = 2;

function bson_json_opts_new(mode: Tbson_json_mode_t; max_len: Tint32_t): Pbson_json_opts_t; cdecl; external libbson;
procedure bson_json_opts_destroy(opts: Pbson_json_opts_t); cdecl; external libbson;
procedure bson_json_opts_set_outermost_array(opts: Pbson_json_opts_t; is_outermost_array: Boolean); cdecl; external libbson;

type
  Tbson_json_reader_cb = function(handle: pointer; buf: Puint8_t; count: Tsize_t): Tssize_t; cdecl;
  Tbson_json_destroy_cb = procedure(handle: pointer); cdecl;

function bson_json_reader_new(data: pointer; cb: Tbson_json_reader_cb; dcb: Tbson_json_destroy_cb; allow_multiple: Boolean; buf_size: Tsize_t): Pbson_json_reader_t; cdecl; external libbson;
function bson_json_reader_new_from_fd(fd: longint; close_on_destroy: Boolean): Pbson_json_reader_t; cdecl; external libbson;
function bson_json_reader_new_from_file(filename: pchar; error: Pbson_error_t): Pbson_json_reader_t; cdecl; external libbson;
procedure bson_json_reader_destroy(reader: Pbson_json_reader_t); cdecl; external libbson;
function bson_json_reader_read(reader: Pbson_json_reader_t; bson: Pbson_t; error: Pbson_error_t): longint; cdecl; external libbson;
function bson_json_data_reader_new(allow_multiple: Boolean; size: Tsize_t): Pbson_json_reader_t; cdecl; external libbson;
procedure bson_json_data_reader_ingest(reader: Pbson_json_reader_t; data: Puint8_t; len: Tsize_t); cdecl; external libbson;

// === Konventiert am: 17-5-26 16:53:46 ===


implementation



end.
