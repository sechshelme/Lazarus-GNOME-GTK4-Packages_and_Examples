{$IFDEF read_interface}

type
  Tstorage_register_func = procedure(para1: Plibrdf_storage_factory);

function librdf_storage_register_factory(world: Plibrdf_world; name: pchar; _label: pchar; factory: Tstorage_register_func): longint; cdecl; external librdf;
function librdf_storage_enumerate(world: Plibrdf_world; counter: dword; name: PPchar; _label: PPchar): longint; cdecl; external librdf;
function librdf_new_storage(world: Plibrdf_world; storage_name: pchar; name: pchar; options_string: pchar): Plibrdf_storage; cdecl; external librdf;
function librdf_new_storage_with_options(world: Plibrdf_world; storage_name: pchar; name: pchar; options: Plibrdf_hash): Plibrdf_storage; cdecl; external librdf;
function librdf_new_storage_from_storage(old_storage: Plibrdf_storage): Plibrdf_storage; cdecl; external librdf;
function librdf_new_storage_from_factory(world: Plibrdf_world; factory: Plibrdf_storage_factory; name: pchar; options: Plibrdf_hash): Plibrdf_storage; cdecl; external librdf;
procedure librdf_free_storage(storage: Plibrdf_storage); cdecl; external librdf;
procedure librdf_storage_add_reference(storage: Plibrdf_storage); cdecl; external librdf;
procedure librdf_storage_remove_reference(storage: Plibrdf_storage); cdecl; external librdf;
procedure librdf_storage_set_instance(storage: Plibrdf_storage; instance: Tlibrdf_storage_instance); cdecl; external librdf;
function librdf_storage_get_instance(storage: Plibrdf_storage): Tlibrdf_storage_instance; cdecl; external librdf;
function librdf_storage_get_world(storage: Plibrdf_storage): Plibrdf_world; cdecl; external librdf;
function librdf_storage_open(storage: Plibrdf_storage; model: Plibrdf_model): longint; cdecl; external librdf;
function librdf_storage_close(storage: Plibrdf_storage): longint; cdecl; external librdf;
function librdf_storage_size(storage: Plibrdf_storage): longint; cdecl; external librdf;
function librdf_storage_add_statement(storage: Plibrdf_storage; statement: Plibrdf_statement): longint; cdecl; external librdf;
function librdf_storage_add_statements(storage: Plibrdf_storage; statement_stream: Plibrdf_stream): longint; cdecl; external librdf;
function librdf_storage_remove_statement(storage: Plibrdf_storage; statement: Plibrdf_statement): longint; cdecl; external librdf;
function librdf_storage_contains_statement(storage: Plibrdf_storage; statement: Plibrdf_statement): longint; cdecl; external librdf;
function librdf_storage_serialise(storage: Plibrdf_storage): Plibrdf_stream; cdecl; external librdf;
function librdf_storage_find_statements(storage: Plibrdf_storage; statement: Plibrdf_statement): Plibrdf_stream; cdecl; external librdf;
function librdf_storage_find_statements_with_options(storage: Plibrdf_storage; statement: Plibrdf_statement; context_node: Plibrdf_node; options: Plibrdf_hash): Plibrdf_stream; cdecl; external librdf;
function librdf_storage_get_sources(storage: Plibrdf_storage; arc: Plibrdf_node; target: Plibrdf_node): Plibrdf_iterator; cdecl; external librdf;
function librdf_storage_get_arcs(storage: Plibrdf_storage; source: Plibrdf_node; target: Plibrdf_node): Plibrdf_iterator; cdecl; external librdf;
function librdf_storage_get_targets(storage: Plibrdf_storage; source: Plibrdf_node; arc: Plibrdf_node): Plibrdf_iterator; cdecl; external librdf;
function librdf_storage_get_arcs_in(storage: Plibrdf_storage; node: Plibrdf_node): Plibrdf_iterator; cdecl; external librdf;
function librdf_storage_get_arcs_out(storage: Plibrdf_storage; node: Plibrdf_node): Plibrdf_iterator; cdecl; external librdf;
function librdf_storage_has_arc_in(storage: Plibrdf_storage; node: Plibrdf_node; _property: Plibrdf_node): longint; cdecl; external librdf;
function librdf_storage_has_arc_out(storage: Plibrdf_storage; node: Plibrdf_node; _property: Plibrdf_node): longint; cdecl; external librdf;
function librdf_storage_context_add_statement(storage: Plibrdf_storage; context: Plibrdf_node; statement: Plibrdf_statement): longint; cdecl; external librdf;
function librdf_storage_context_add_statements(storage: Plibrdf_storage; context: Plibrdf_node; stream: Plibrdf_stream): longint; cdecl; external librdf;
function librdf_storage_context_remove_statement(storage: Plibrdf_storage; context: Plibrdf_node; statement: Plibrdf_statement): longint; cdecl; external librdf;
function librdf_storage_context_remove_statements(storage: Plibrdf_storage; context: Plibrdf_node): longint; cdecl; external librdf;
function librdf_storage_context_as_stream(storage: Plibrdf_storage; context: Plibrdf_node): Plibrdf_stream; cdecl; external librdf;
function librdf_storage_context_serialise(storage: Plibrdf_storage; context: Plibrdf_node): Plibrdf_stream; cdecl; external librdf; deprecated;
function librdf_storage_supports_query(storage: Plibrdf_storage; query: Plibrdf_query): longint; cdecl; external librdf;
function librdf_storage_query_execute(storage: Plibrdf_storage; query: Plibrdf_query): Plibrdf_query_results; cdecl; external librdf;
function librdf_storage_sync(storage: Plibrdf_storage): longint; cdecl; external librdf;
function librdf_storage_find_statements_in_context(storage: Plibrdf_storage; statement: Plibrdf_statement; context_node: Plibrdf_node): Plibrdf_stream; cdecl; external librdf;
function librdf_storage_get_contexts(storage: Plibrdf_storage): Plibrdf_iterator; cdecl; external librdf;
function librdf_storage_get_feature(storage: Plibrdf_storage; feature: Plibrdf_uri): Plibrdf_node; cdecl; external librdf;
function librdf_storage_set_feature(storage: Plibrdf_storage; feature: Plibrdf_uri; value: Plibrdf_node): longint; cdecl; external librdf;
function librdf_storage_transaction_start(storage: Plibrdf_storage): longint; cdecl; external librdf;
function librdf_storage_transaction_start_with_handle(storage: Plibrdf_storage; handle: pointer): longint; cdecl; external librdf;
function librdf_storage_transaction_commit(storage: Plibrdf_storage): longint; cdecl; external librdf;
function librdf_storage_transaction_rollback(storage: Plibrdf_storage): longint; cdecl; external librdf;
function librdf_storage_transaction_get_handle(storage: Plibrdf_storage): pointer; cdecl; external librdf;

// === Konventiert am: 27-11-25 17:39:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
