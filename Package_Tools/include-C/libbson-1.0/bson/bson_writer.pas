unit bson_writer;

interface

uses
  fp_bson, bson_types, bson_memory;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pbson_writer_t = type Pointer;

function bson_writer_new(buf: PPuint8_t; buflen: Psize_t; offset: Tsize_t; realloc_func: Tbson_realloc_func; realloc_func_ctx: pointer): Pbson_writer_t; cdecl; external libbson;
procedure bson_writer_destroy(writer: Pbson_writer_t); cdecl; external libbson;
function bson_writer_get_length(writer: Pbson_writer_t): Tsize_t; cdecl; external libbson;
function bson_writer_begin(writer: Pbson_writer_t; bson: PPbson_t): Boolean; cdecl; external libbson;
procedure bson_writer_end(writer: Pbson_writer_t); cdecl; external libbson;
procedure bson_writer_rollback(writer: Pbson_writer_t); cdecl; external libbson;

// === Konventiert am: 17-5-26 16:53:16 ===


implementation



end.
