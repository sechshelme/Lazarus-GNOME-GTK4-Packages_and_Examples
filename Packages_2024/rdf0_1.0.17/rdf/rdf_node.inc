{$IFDEF read_interface}


type
  Plibrdf_node_type = ^Tlibrdf_node_type;
  Tlibrdf_node_type = longint;

const
  LIBRDF_NODE_TYPE_UNKNOWN = RAPTOR_TERM_TYPE_UNKNOWN;
  LIBRDF_NODE_TYPE_RESOURCE = RAPTOR_TERM_TYPE_URI;
  LIBRDF_NODE_TYPE_LITERAL = RAPTOR_TERM_TYPE_LITERAL;
  LIBRDF_NODE_TYPE_BLANK = RAPTOR_TERM_TYPE_BLANK;
  LIBRDF_NODE_TYPE_LAST = LIBRDF_NODE_TYPE_BLANK;

function librdf_new_node(world: Plibrdf_world): Plibrdf_node; cdecl; external librdf;
function librdf_new_node_from_uri_string(world: Plibrdf_world; uri_string: pbyte): Plibrdf_node; cdecl; external librdf;
function librdf_new_node_from_counted_uri_string(world: Plibrdf_world; uri_string: pbyte; len: Tsize_t): Plibrdf_node; cdecl; external librdf;
function librdf_new_node_from_uri(world: Plibrdf_world; uri: Plibrdf_uri): Plibrdf_node; cdecl; external librdf;
function librdf_new_node_from_uri_local_name(world: Plibrdf_world; uri: Plibrdf_uri; local_name: pbyte): Plibrdf_node; cdecl; external librdf;
function librdf_new_node_from_normalised_uri_string(world: Plibrdf_world; uri_string: pbyte; source_uri: Plibrdf_uri; base_uri: Plibrdf_uri): Plibrdf_node; cdecl; external librdf;
function librdf_new_node_from_literal(world: Plibrdf_world; _string: pbyte; xml_language: pchar; is_wf_xml: longint): Plibrdf_node; cdecl; external librdf;
function librdf_new_node_from_typed_literal(world: Plibrdf_world; value: pbyte; xml_language: pchar; datatype_uri: Plibrdf_uri): Plibrdf_node; cdecl; external librdf;
function librdf_new_node_from_typed_counted_literal(world: Plibrdf_world; value: pbyte; value_len: Tsize_t; xml_language: pchar; xml_language_len: Tsize_t;
  datatype_uri: Plibrdf_uri): Plibrdf_node; cdecl; external librdf;
function librdf_new_node_from_blank_identifier(world: Plibrdf_world; identifier: pbyte): Plibrdf_node; cdecl; external librdf;
function librdf_new_node_from_counted_blank_identifier(world: Plibrdf_world; identifier: pbyte; identifier_len: Tsize_t): Plibrdf_node; cdecl; external librdf;
function librdf_new_node_from_node(node: Plibrdf_node): Plibrdf_node; cdecl; external librdf;
procedure librdf_free_node(node: Plibrdf_node); cdecl; external librdf;
function librdf_node_get_uri(node: Plibrdf_node): Plibrdf_uri; cdecl; external librdf;
function librdf_node_get_type(node: Plibrdf_node): Tlibrdf_node_type; cdecl; external librdf;
function librdf_node_get_literal_value(node: Plibrdf_node): pbyte; cdecl; external librdf;
function librdf_node_get_literal_value_as_counted_string(node: Plibrdf_node; len_p: Psize_t): pbyte; cdecl; external librdf;
function librdf_node_get_literal_value_as_latin1(node: Plibrdf_node): pchar; cdecl; external librdf;
function librdf_node_get_literal_value_language(node: Plibrdf_node): pchar; cdecl; external librdf;
function librdf_node_get_literal_value_is_wf_xml(node: Plibrdf_node): longint; cdecl; external librdf;
function librdf_node_get_literal_value_datatype_uri(node: Plibrdf_node): Plibrdf_uri; cdecl; external librdf;
function librdf_node_get_li_ordinal(node: Plibrdf_node): longint; cdecl; external librdf;
function librdf_node_get_blank_identifier(node: Plibrdf_node): pbyte; cdecl; external librdf;
function librdf_node_get_counted_blank_identifier(node: Plibrdf_node; len_p: Psize_t): pbyte; cdecl; external librdf;
function librdf_node_is_resource(node: Plibrdf_node): longint; cdecl; external librdf;
function librdf_node_is_literal(node: Plibrdf_node): longint; cdecl; external librdf;
function librdf_node_is_blank(node: Plibrdf_node): longint; cdecl; external librdf;
function librdf_node_encode(node: Plibrdf_node; buffer: pbyte; length: Tsize_t): Tsize_t; cdecl; external librdf;
function librdf_node_decode(world: Plibrdf_world; size_p: Psize_t; buffer: pbyte; length: Tsize_t): Plibrdf_node; cdecl; external librdf;
function librdf_node_to_string(node: Plibrdf_node): PChar; cdecl; external librdf; deprecated;
function librdf_node_to_counted_string(node: Plibrdf_node; len_p: Psize_t): pbyte; cdecl; external librdf; deprecated;
function librdf_node_write(node: Plibrdf_node; iostr: Praptor_iostream): longint; cdecl; external librdf;
procedure librdf_node_print(node: Plibrdf_node; fh: PFILE); cdecl; external librdf;
function librdf_node_equals(first_node: Plibrdf_node; second_node: Plibrdf_node): longint; cdecl; external librdf;
function librdf_node_static_iterator_create(nodes: PPlibrdf_node; size: longint): Plibrdf_iterator; cdecl; external librdf; deprecated;
function librdf_node_new_static_node_iterator(world: Plibrdf_world; nodes: PPlibrdf_node; size: longint): Plibrdf_iterator; cdecl; external librdf;

// === Konventiert am: 27-11-25 17:39:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
