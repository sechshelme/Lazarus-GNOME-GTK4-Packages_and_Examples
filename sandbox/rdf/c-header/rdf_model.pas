unit rdf_model;

interface

uses
  fp_rdf, rdf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function librdf_model_enumerate(world: Plibrdf_world; counter: dword; name: PPchar; _label: PPchar): longint; cdecl; external librdf;
function librdf_new_model(world: Plibrdf_world; storage: Plibrdf_storage; options_string: pchar): Plibrdf_model; cdecl; external librdf;
function librdf_new_model_with_options(world: Plibrdf_world; storage: Plibrdf_storage; options: Plibrdf_hash): Plibrdf_model; cdecl; external librdf;
function librdf_new_model_from_model(model: Plibrdf_model): Plibrdf_model; cdecl; external librdf;
procedure librdf_free_model(model: Plibrdf_model); cdecl; external librdf;
function librdf_model_size(model: Plibrdf_model): longint; cdecl; external librdf;
function librdf_model_add(model: Plibrdf_model; subject: Plibrdf_node; predicate: Plibrdf_node; obj: Plibrdf_node): longint; cdecl; external librdf;
function librdf_model_add_string_literal_statement(model: Plibrdf_model; subject: Plibrdf_node; predicate: Plibrdf_node; literal: pbyte; xml_language: pchar;
  is_wf_xml: longint): longint; cdecl; external librdf;
function librdf_model_add_typed_literal_statement(model: Plibrdf_model; subject: Plibrdf_node; predicate: Plibrdf_node; literal: pbyte; xml_language: pchar;
  datatype_uri: Plibrdf_uri): longint; cdecl; external librdf;
function librdf_model_add_statement(model: Plibrdf_model; statement: Plibrdf_statement): longint; cdecl; external librdf;
function librdf_model_add_statements(model: Plibrdf_model; statement_stream: Plibrdf_stream): longint; cdecl; external librdf;
function librdf_model_remove_statement(model: Plibrdf_model; statement: Plibrdf_statement): longint; cdecl; external librdf;
function librdf_model_contains_statement(model: Plibrdf_model; statement: Plibrdf_statement): longint; cdecl; external librdf;
function librdf_model_has_arc_in(model: Plibrdf_model; node: Plibrdf_node; _property: Plibrdf_node): longint; cdecl; external librdf;
function librdf_model_has_arc_out(model: Plibrdf_model; node: Plibrdf_node; _property: Plibrdf_node): longint; cdecl; external librdf;
function librdf_model_as_stream(model: Plibrdf_model): Plibrdf_stream; cdecl; external librdf;
function librdf_model_serialise(model: Plibrdf_model): Plibrdf_stream; cdecl; external librdf; deprecated;
function librdf_model_find_statements(model: Plibrdf_model; statement: Plibrdf_statement): Plibrdf_stream; cdecl; external librdf;

const
  LIBRDF_MODEL_FIND_OPTION_MATCH_SUBSTRING_LITERAL = 'http://feature.librdf.org/model-find-match-substring-literal';

function librdf_model_find_statements_with_options(model: Plibrdf_model; statement: Plibrdf_statement; context_node: Plibrdf_node; options: Plibrdf_hash): Plibrdf_stream; cdecl; external librdf;
function librdf_model_get_sources(model: Plibrdf_model; arc: Plibrdf_node; target: Plibrdf_node): Plibrdf_iterator; cdecl; external librdf;
function librdf_model_get_arcs(model: Plibrdf_model; source: Plibrdf_node; target: Plibrdf_node): Plibrdf_iterator; cdecl; external librdf;
function librdf_model_get_targets(model: Plibrdf_model; source: Plibrdf_node; arc: Plibrdf_node): Plibrdf_iterator; cdecl; external librdf;
function librdf_model_get_source(model: Plibrdf_model; arc: Plibrdf_node; target: Plibrdf_node): Plibrdf_node; cdecl; external librdf;
function librdf_model_get_arc(model: Plibrdf_model; source: Plibrdf_node; target: Plibrdf_node): Plibrdf_node; cdecl; external librdf;
function librdf_model_get_target(model: Plibrdf_model; source: Plibrdf_node; arc: Plibrdf_node): Plibrdf_node; cdecl; external librdf;
function librdf_model_get_arcs_in(model: Plibrdf_model; node: Plibrdf_node): Plibrdf_iterator; cdecl; external librdf;
function librdf_model_get_arcs_out(model: Plibrdf_model; node: Plibrdf_node): Plibrdf_iterator; cdecl; external librdf;
function librdf_model_add_submodel(model: Plibrdf_model; sub_model: Plibrdf_model): longint; cdecl; external librdf;
function librdf_model_remove_submodel(model: Plibrdf_model; sub_model: Plibrdf_model): longint; cdecl; external librdf;
procedure librdf_model_print(model: Plibrdf_model; fh: PFILE); cdecl; external librdf; deprecated;
function librdf_model_write(model: Plibrdf_model; iostr: Praptor_iostream): longint; cdecl; external librdf;
function librdf_model_context_add_statement(model: Plibrdf_model; context: Plibrdf_node; statement: Plibrdf_statement): longint; cdecl; external librdf;
function librdf_model_context_add_statements(model: Plibrdf_model; context: Plibrdf_node; stream: Plibrdf_stream): longint; cdecl; external librdf;
function librdf_model_context_remove_statement(model: Plibrdf_model; context: Plibrdf_node; statement: Plibrdf_statement): longint; cdecl; external librdf;
function librdf_model_context_remove_statements(model: Plibrdf_model; context: Plibrdf_node): longint; cdecl; external librdf;
function librdf_model_context_as_stream(model: Plibrdf_model; context: Plibrdf_node): Plibrdf_stream; cdecl; external librdf;
function librdf_model_context_serialize(model: Plibrdf_model; context: Plibrdf_node): Plibrdf_stream; cdecl; external librdf; deprecated;
function librdf_model_contains_context(model: Plibrdf_model; context: Plibrdf_node): longint; cdecl; external librdf;
function librdf_model_supports_contexts(model: Plibrdf_model): longint; cdecl; external librdf;
function librdf_model_query_execute(model: Plibrdf_model; query: Plibrdf_query): Plibrdf_query_results; cdecl; external librdf;
function librdf_model_sync(model: Plibrdf_model): longint; cdecl; external librdf;
function librdf_model_get_storage(model: Plibrdf_model): Plibrdf_storage; cdecl; external librdf;
function librdf_model_load(model: Plibrdf_model; uri: Plibrdf_uri; name: pchar; mime_type: pchar; type_uri: Plibrdf_uri): longint; cdecl; external librdf;
function librdf_model_to_counted_string(model: Plibrdf_model; uri: Plibrdf_uri; name: pchar; mime_type: pchar; type_uri: Plibrdf_uri;
  string_length_p: Psize_t): pbyte; cdecl; external librdf;
function librdf_model_to_string(model: Plibrdf_model; uri: Plibrdf_uri; name: pchar; mime_type: pchar; type_uri: Plibrdf_uri): pbyte; cdecl; external librdf;
function librdf_model_find_statements_in_context(model: Plibrdf_model; statement: Plibrdf_statement; context_node: Plibrdf_node): Plibrdf_stream; cdecl; external librdf;
function librdf_model_get_contexts(model: Plibrdf_model): Plibrdf_iterator; cdecl; external librdf;
function librdf_model_transaction_start(model: Plibrdf_model): longint; cdecl; external librdf;
function librdf_model_transaction_start_with_handle(model: Plibrdf_model; handle: pointer): longint; cdecl; external librdf;
function librdf_model_transaction_commit(model: Plibrdf_model): longint; cdecl; external librdf;
function librdf_model_transaction_rollback(model: Plibrdf_model): longint; cdecl; external librdf;
function librdf_model_transaction_get_handle(model: Plibrdf_model): pointer; cdecl; external librdf;

const
  LIBRDF_MODEL_FEATURE_CONTEXTS = 'http://feature.librdf.org/model-contexts';

function librdf_model_get_feature(model: Plibrdf_model; feature: Plibrdf_uri): Plibrdf_node; cdecl; external librdf;
function librdf_model_set_feature(model: Plibrdf_model; feature: Plibrdf_uri; value: Plibrdf_node): longint; cdecl; external librdf;

// === Konventiert am: 27-11-25 17:39:27 ===


implementation



end.
