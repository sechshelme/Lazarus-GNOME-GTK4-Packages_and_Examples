unit bcon;

interface

uses
  fp_bson, bson_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  BCON_STACK_MAX = 100;

type
  Pbcon_type_t = ^Tbcon_type_t;
  Tbcon_type_t = longint;

const
  BCON_TYPE_UTF8 = 0;
  BCON_TYPE_DOUBLE = 1;
  BCON_TYPE_DOCUMENT = 2;
  BCON_TYPE_ARRAY = 3;
  BCON_TYPE_BIN = 4;
  BCON_TYPE_UNDEFINED = 5;
  BCON_TYPE_OID = 6;
  BCON_TYPE_BOOL = 7;
  BCON_TYPE_DATE_TIME = 8;
  BCON_TYPE_NULL = 9;
  BCON_TYPE_REGEX = 10;
  BCON_TYPE_DBPOINTER = 11;
  BCON_TYPE_CODE = 12;
  BCON_TYPE_SYMBOL = 13;
  BCON_TYPE_CODEWSCOPE = 14;
  BCON_TYPE_INT32 = 15;
  BCON_TYPE_TIMESTAMP = 16;
  BCON_TYPE_INT64 = 17;
  BCON_TYPE_DECIMAL128 = 18;
  BCON_TYPE_MAXKEY = 19;
  BCON_TYPE_MINKEY = 20;
  BCON_TYPE_BCON = 21;
  BCON_TYPE_ARRAY_START = 22;
  BCON_TYPE_ARRAY_END = 23;
  BCON_TYPE_DOC_START = 24;
  BCON_TYPE_DOC_END = 25;
  BCON_TYPE_END = 26;
  BCON_TYPE_RAW = 27;
  BCON_TYPE_SKIP = 28;
  BCON_TYPE_ITER = 29;
  BCON_TYPE_ERROR = 30;

type
  Tbcon_append_ctx_frame = record
    i: longint;
    is_array: Boolean;
    bson: Tbson_t;
  end;
  Pbcon_append_ctx_frame = ^Tbcon_append_ctx_frame;

  Tbcon_append_ctx_frame_t = Tbcon_append_ctx_frame;
  Pbcon_append_ctx_frame_t = ^Tbcon_append_ctx_frame_t;

  Tbcon_extract_ctx_frame = record
    i: longint;
    is_array: Boolean;
    iter: Tbson_iter_t;
  end;
  Pbcon_extract_ctx_frame = ^Tbcon_extract_ctx_frame;

  Tbcon_extract_ctx_frame_t = Tbcon_extract_ctx_frame;
  Pbcon_extract_ctx_frame_t = ^Tbcon_extract_ctx_frame_t;

  Tbcon_append_ctx_t = record
    stack: array[0..(BCON_STACK_MAX) - 1] of Tbcon_append_ctx_frame_t;
    n: longint;
  end;
  Pbcon_append_ctx_t = ^Tbcon_append_ctx_t;

  Tbcon_extract_ctx_t = record
    stack: array[0..(BCON_STACK_MAX) - 1] of Tbcon_extract_ctx_frame_t;
    n: longint;
  end;
  Pbcon_extract_ctx_t = ^Tbcon_extract_ctx_t;

procedure bcon_append(bson: Pbson_t; args: array of const); cdecl; external libbson;
procedure bcon_append(bson: Pbson_t); cdecl; external libbson;
procedure bcon_append_ctx(bson: Pbson_t; ctx: Pbcon_append_ctx_t; args: array of const); cdecl; external libbson;
procedure bcon_append_ctx(bson: Pbson_t; ctx: Pbcon_append_ctx_t); cdecl; external libbson;
procedure bcon_append_ctx_va(bson: Pbson_t; ctx: Pbcon_append_ctx_t; va: Pva_list); cdecl; external libbson;
procedure bcon_append_ctx_init(ctx: Pbcon_append_ctx_t); cdecl; external libbson;
procedure bcon_extract_ctx_init(ctx: Pbcon_extract_ctx_t); cdecl; external libbson;
procedure bcon_extract_ctx(bson: Pbson_t; ctx: Pbcon_extract_ctx_t; args: array of const); cdecl; external libbson;
procedure bcon_extract_ctx(bson: Pbson_t; ctx: Pbcon_extract_ctx_t); cdecl; external libbson;
function bcon_extract_ctx_va(bson: Pbson_t; ctx: Pbcon_extract_ctx_t; ap: Pva_list): Boolean; cdecl; external libbson;
function bcon_extract(bson: Pbson_t; args: array of const): Boolean; cdecl; external libbson;
function bcon_extract(bson: Pbson_t): Boolean; cdecl; external libbson;
function bcon_extract_va(bson: Pbson_t; ctx: Pbcon_extract_ctx_t; args: array of const): Boolean; cdecl; external libbson;
function bcon_extract_va(bson: Pbson_t; ctx: Pbcon_extract_ctx_t): Boolean; cdecl; external libbson;
function bcon_new(unused: pointer; args: array of const): Pbson_t; cdecl; external libbson;
function bcon_new(unused: pointer): Pbson_t; cdecl; external libbson;
function bson_bcon_magic: pchar; cdecl; external libbson;
function bson_bcone_magic: pchar; cdecl; external libbson;

// === Konventiert am: 17-5-26 16:54:06 ===


implementation



end.
