{$IFDEF read_interface}


type
  Tquery_register_proc = procedure(para1: Plibrdf_query_factory); cdecl;

procedure librdf_query_register_factory(world: Plibrdf_world; name: pchar; uri_string: pbyte; factory: Tquery_register_proc); cdecl; external librdf;
function librdf_query_languages_enumerate(world: Plibrdf_world; counter: dword; name: PPchar; uri_string: PPbyte): longint; cdecl; external librdf; deprecated;
function librdf_query_language_get_description(world: Plibrdf_world; counter: dword): Praptor_syntax_description; cdecl; external librdf;
function librdf_new_query(world: Plibrdf_world; name: pchar; uri: Plibrdf_uri; query_string: pbyte; base_uri: Plibrdf_uri): Plibrdf_query; cdecl; external librdf;
function librdf_new_query_from_query(old_query: Plibrdf_query): Plibrdf_query; cdecl; external librdf;
function librdf_new_query_from_factory(world: Plibrdf_world; factory: Plibrdf_query_factory; name: pchar; uri: Plibrdf_uri; query_string: pbyte; base_uri: Plibrdf_uri): Plibrdf_query; cdecl; external librdf;
procedure librdf_free_query(query: Plibrdf_query); cdecl; external librdf;
function librdf_query_execute(query: Plibrdf_query; model: Plibrdf_model): Plibrdf_query_results; cdecl; external librdf;
function librdf_query_get_limit(query: Plibrdf_query): longint; cdecl; external librdf;
function librdf_query_set_limit(query: Plibrdf_query; limit: longint): longint; cdecl; external librdf;
function librdf_query_get_offset(query: Plibrdf_query): longint; cdecl; external librdf;
function librdf_query_set_offset(query: Plibrdf_query; offset: longint): longint; cdecl; external librdf;
function librdf_query_results_as_stream(query_results: Plibrdf_query_results): Plibrdf_stream; cdecl; external librdf;
function librdf_query_results_get_count(query_results: Plibrdf_query_results): longint; cdecl; external librdf;
function librdf_query_results_next(query_results: Plibrdf_query_results): longint; cdecl; external librdf;
function librdf_query_results_finished(query_results: Plibrdf_query_results): longint; cdecl; external librdf;
function librdf_query_results_get_bindings(query_results: Plibrdf_query_results; names: PPPchar; values: PPlibrdf_node): longint; cdecl; external librdf;
function librdf_query_results_get_binding_value(query_results: Plibrdf_query_results; offset: longint): Plibrdf_node; cdecl; external librdf;
function librdf_query_results_get_binding_name(query_results: Plibrdf_query_results; offset: longint): pchar; cdecl; external librdf;
function librdf_query_results_get_binding_value_by_name(query_results: Plibrdf_query_results; name: pchar): Plibrdf_node; cdecl; external librdf;
function librdf_query_results_get_bindings_count(query_results: Plibrdf_query_results): longint; cdecl; external librdf;
function librdf_query_results_to_counted_string(query_results: Plibrdf_query_results; format_uri: Plibrdf_uri; base_uri: Plibrdf_uri; length_p: Psize_t): pbyte; cdecl; external librdf; deprecated;
function librdf_query_results_to_counted_string2(query_results: Plibrdf_query_results; name: pchar; mime_type: pchar; format_uri: Plibrdf_uri; base_uri: Plibrdf_uri;
  length_p: Psize_t): pbyte; cdecl; external librdf;
function librdf_query_results_to_string(query_results: Plibrdf_query_results; format_uri: Plibrdf_uri; base_uri: Plibrdf_uri): pbyte; cdecl; external librdf; deprecated;
function librdf_query_results_to_string2(query_results: Plibrdf_query_results; name: pchar; mime_type: pchar; format_uri: Plibrdf_uri; base_uri: Plibrdf_uri): pbyte; cdecl; external librdf;
function librdf_query_results_to_file_handle(query_results: Plibrdf_query_results; handle: PFILE; format_uri: Plibrdf_uri; base_uri: Plibrdf_uri): longint; cdecl; external librdf; deprecated;
function librdf_query_results_to_file_handle2(query_results: Plibrdf_query_results; handle: PFILE; name: pchar; mime_type: pchar; format_uri: Plibrdf_uri;
  base_uri: Plibrdf_uri): longint; cdecl; external librdf;
function librdf_query_results_to_file(query_results: Plibrdf_query_results; name: pchar; format_uri: Plibrdf_uri; base_uri: Plibrdf_uri): longint; cdecl; external librdf; deprecated;
function librdf_query_results_to_file2(query_results: Plibrdf_query_results; name: pchar; mime_type: pchar; format_uri: Plibrdf_uri; base_uri: Plibrdf_uri): longint; cdecl; external librdf;
procedure librdf_free_query_results(query_results: Plibrdf_query_results); cdecl; external librdf;
function librdf_query_results_is_bindings(query_results: Plibrdf_query_results): longint; cdecl; external librdf;
function librdf_query_results_is_boolean(query_results: Plibrdf_query_results): longint; cdecl; external librdf;
function librdf_query_results_is_graph(query_results: Plibrdf_query_results): longint; cdecl; external librdf;
function librdf_query_results_is_syntax(query_results: Plibrdf_query_results): longint; cdecl; external librdf;
function librdf_query_results_get_boolean(query_results: Plibrdf_query_results): longint; cdecl; external librdf;
function librdf_new_query_results_formatter2(query_results: Plibrdf_query_results; name: pchar; mime_type: pchar; uri: Plibrdf_uri): Plibrdf_query_results_formatter; cdecl; external librdf; deprecated;
function librdf_new_query_results_formatter(query_results: Plibrdf_query_results; name: pchar; uri: Plibrdf_uri): Plibrdf_query_results_formatter; cdecl; external librdf; deprecated;
function librdf_new_query_results_formatter_by_mime_type(query_results: Plibrdf_query_results; mime_type: pchar): Plibrdf_query_results_formatter; cdecl; external librdf;
procedure librdf_free_query_results_formatter(formatter: Plibrdf_query_results_formatter); cdecl; external librdf;
function librdf_query_results_formatter_write(iostr: Praptor_iostream; formatter: Plibrdf_query_results_formatter; query_results: Plibrdf_query_results; base_uri: Plibrdf_uri): longint; cdecl; external librdf;
function librdf_query_results_formats_check(world: Plibrdf_world; name: pchar; uri: Plibrdf_uri; mime_type: pchar): longint; cdecl; external librdf;
function librdf_query_results_formats_enumerate(world: Plibrdf_world; counter: dword; name: PPchar; _label: PPchar; uri_string: PPbyte;
  mime_type: PPchar): longint; cdecl; external librdf; deprecated;
function librdf_query_results_formats_get_description(world: Plibrdf_world; counter: dword): Praptor_syntax_description; cdecl; external librdf;

// === Konventiert am: 27-11-25 17:39:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
