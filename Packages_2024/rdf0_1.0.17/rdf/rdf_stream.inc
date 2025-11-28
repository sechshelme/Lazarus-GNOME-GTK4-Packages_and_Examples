{$IFDEF read_interface}


type
  Tlibrdf_stream_map_handler = function(stream: Plibrdf_stream; map_context: pointer; item: Plibrdf_statement): Plibrdf_statement; cdecl;
  Tlibrdf_stream_map_free_context_handler = procedure(map_context: pointer); cdecl;

type
  Plibrdf_stream_get_method_flags = ^Tlibrdf_stream_get_method_flags;
  Tlibrdf_stream_get_method_flags = longint;

const
  LIBRDF_STREAM_GET_METHOD_GET_OBJECT = LIBRDF_ITERATOR_GET_METHOD_GET_OBJECT;
  LIBRDF_STREAM_GET_METHOD_GET_CONTEXT = LIBRDF_ITERATOR_GET_METHOD_GET_CONTEXT;

type
  Tnew_stream_proc1 = function(para1: pointer): longint; cdecl;
  Tnew_stream_proc2 = function(para1: pointer; para2: longint): pointer; cdecl;
  Tnew_stream_proc3 = procedure(para1: pointer); cdecl;

function librdf_new_stream(world: Plibrdf_world; context: pointer; is_end_method: Tnew_stream_proc1; next_method: Tnew_stream_proc1; get_method: Tnew_stream_proc2;
  finished_method: Tnew_stream_proc3): Plibrdf_stream; cdecl; external librdf;
function librdf_new_stream_from_node_iterator(iterator: Plibrdf_iterator; statement: Plibrdf_statement; field: Tlibrdf_statement_part): Plibrdf_stream; cdecl; external librdf;
procedure librdf_free_stream(stream: Plibrdf_stream); cdecl; external librdf;
function librdf_stream_end(stream: Plibrdf_stream): longint; cdecl; external librdf;
function librdf_stream_next(stream: Plibrdf_stream): longint; cdecl; external librdf;
function librdf_stream_get_object(stream: Plibrdf_stream): Plibrdf_statement; cdecl; external librdf;
function librdf_stream_get_context2(stream: Plibrdf_stream): Plibrdf_node; cdecl; external librdf;
function librdf_stream_get_context(stream: Plibrdf_stream): pointer; cdecl; external librdf; deprecated;
function librdf_stream_add_map(stream: Plibrdf_stream; map_function: Tlibrdf_stream_map_handler; free_context: Tlibrdf_stream_map_free_context_handler; map_context: pointer): longint; cdecl; external librdf;
procedure librdf_stream_print(stream: Plibrdf_stream; fh: PFILE); cdecl; external librdf; deprecated;
function librdf_stream_write(stream: Plibrdf_stream; iostr: Praptor_iostream): longint; cdecl; external librdf;
function librdf_new_empty_stream(world: Plibrdf_world): Plibrdf_stream; cdecl; external librdf;

// === Konventiert am: 27-11-25 17:39:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
