{$IFDEF read_interface}


const
  BSON_ERROR_READER_BADFD = 1;

type
  Tbson_reader_read_func_t = function(handle: pointer; buf: pointer; count: Tsize_t): Tssize_t; cdecl;
  Tbson_reader_destroy_func_t = procedure(handle: pointer); cdecl;

function bson_reader_new_from_handle(handle: pointer; rf: Tbson_reader_read_func_t; df: Tbson_reader_destroy_func_t): Pbson_reader_t; cdecl; external libbson;
function bson_reader_new_from_fd(fd: longint; close_on_destroy: Boolean): Pbson_reader_t; cdecl; external libbson;
function bson_reader_new_from_file(path: pchar; error: Pbson_error_t): Pbson_reader_t; cdecl; external libbson;
function bson_reader_new_from_data(data: Puint8_t; length: Tsize_t): Pbson_reader_t; cdecl; external libbson;
procedure bson_reader_destroy(reader: Pbson_reader_t); cdecl; external libbson;
procedure bson_reader_set_read_func(reader: Pbson_reader_t; func: Tbson_reader_read_func_t); cdecl; external libbson;
procedure bson_reader_set_destroy_func(reader: Pbson_reader_t; func: Tbson_reader_destroy_func_t); cdecl; external libbson;
function bson_reader_read(reader: Pbson_reader_t; reached_eof: PBoolean): Pbson_t; cdecl; external libbson;
function bson_reader_tell(reader: Pbson_reader_t): Toff_t; cdecl; external libbson;
procedure bson_reader_reset(reader: Pbson_reader_t); cdecl; external libbson;

// === Konventiert am: 17-5-26 16:53:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
