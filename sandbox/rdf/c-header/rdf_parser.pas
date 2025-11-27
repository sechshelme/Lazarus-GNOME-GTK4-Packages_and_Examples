unit rdf_parser;

interface

uses
  fp_rdf,rdf;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



procedure librdf_parser_register_factory(world:Plibrdf_world; name:Pchar; _label:Pchar; mime_type:Pchar; uri_string:Pbyte; 
            factory:procedure (para1:Plibrdf_parser_factory));cdecl;external librdf;
{REDLAND_DEPRECATED }
function librdf_parser_enumerate(world:Plibrdf_world; counter:dword; name:PPchar; _label:PPchar):longint;cdecl;external librdf;
function librdf_parser_get_description(world:Plibrdf_world; counter:dword):Praptor_syntax_description;cdecl;external librdf;
function librdf_parser_check_name(world:Plibrdf_world; name:Pchar):longint;cdecl;external librdf;
{ constructor  }
function librdf_new_parser(world:Plibrdf_world; name:Pchar; mime_type:Pchar; type_uri:Plibrdf_uri):Plibrdf_parser;cdecl;external librdf;
function librdf_new_parser_from_factory(world:Plibrdf_world; factory:Plibrdf_parser_factory):Plibrdf_parser;cdecl;external librdf;
{ destructor  }
procedure librdf_free_parser(parser:Plibrdf_parser);cdecl;external librdf;
{ methods  }
function librdf_parser_parse_as_stream(parser:Plibrdf_parser; uri:Plibrdf_uri; base_uri:Plibrdf_uri):Plibrdf_stream;cdecl;external librdf;
function librdf_parser_parse_into_model(parser:Plibrdf_parser; uri:Plibrdf_uri; base_uri:Plibrdf_uri; model:Plibrdf_model):longint;cdecl;external librdf;
function librdf_parser_parse_string_as_stream(parser:Plibrdf_parser; _string:Pbyte; base_uri:Plibrdf_uri):Plibrdf_stream;cdecl;external librdf;
function librdf_parser_parse_string_into_model(parser:Plibrdf_parser; _string:Pbyte; base_uri:Plibrdf_uri; model:Plibrdf_model):longint;cdecl;external librdf;
function librdf_parser_parse_iostream_as_stream(parser:Plibrdf_parser; iostream:Praptor_iostream; base_uri:Plibrdf_uri):Plibrdf_stream;cdecl;external librdf;
function librdf_parser_parse_iostream_into_model(parser:Plibrdf_parser; iostream:Praptor_iostream; base_uri:Plibrdf_uri; model:Plibrdf_model):longint;cdecl;external librdf;
function librdf_parser_parse_file_handle_as_stream(parser:Plibrdf_parser; fh:PFILE; close_fh:longint; base_uri:Plibrdf_uri):Plibrdf_stream;cdecl;external librdf;
function librdf_parser_parse_file_handle_into_model(parser:Plibrdf_parser; fh:PFILE; close_fh:longint; base_uri:Plibrdf_uri; model:Plibrdf_model):longint;cdecl;external librdf;
{ REDLAND_DEPRECATED }
procedure librdf_parser_set_error(parser:Plibrdf_parser; user_data:pointer; error_fn:procedure (user_data:pointer; msg:Pchar; args:array of const));cdecl;external librdf;
procedure librdf_parser_set_error(parser:Plibrdf_parser; user_data:pointer; error_fn:procedure (user_data:pointer; msg:Pchar));cdecl;external librdf;
{ REDLAND_DEPRECATED }
procedure librdf_parser_set_warning(parser:Plibrdf_parser; user_data:pointer; warning_fn:procedure (user_data:pointer; msg:Pchar; args:array of const));cdecl;external librdf;
procedure librdf_parser_set_warning(parser:Plibrdf_parser; user_data:pointer; warning_fn:procedure (user_data:pointer; msg:Pchar));cdecl;external librdf;
function librdf_parser_parse_counted_string_as_stream(parser:Plibrdf_parser; _string:Pbyte; length:Tsize_t; base_uri:Plibrdf_uri):Plibrdf_stream;cdecl;external librdf;
function librdf_parser_parse_counted_string_into_model(parser:Plibrdf_parser; _string:Pbyte; length:Tsize_t; base_uri:Plibrdf_uri; model:Plibrdf_model):longint;cdecl;external librdf;
procedure librdf_parser_set_uri_filter(parser:Plibrdf_parser; filter:Tlibrdf_uri_filter_func; user_data:pointer);cdecl;external librdf;
function librdf_parser_get_uri_filter(parser:Plibrdf_parser; user_data_p:Ppointer):Tlibrdf_uri_filter_func;cdecl;external librdf;
{*
 * LIBRDF_PARSER_FEATURE_ERROR_COUNT:
 *
 * Parser feature URI string for getting the error count of the last parse.
  }
const
  LIBRDF_PARSER_FEATURE_ERROR_COUNT = 'http://feature.librdf.org/parser-error-count';  
{*
 * LIBRDF_PARSER_FEATURE_WARNING_COUNT:
 *
 * Parser feature URI string for getting the warning count of the last parse.
  }
  LIBRDF_PARSER_FEATURE_WARNING_COUNT = 'http://feature.librdf.org/parser-warning-count';  

function librdf_parser_get_feature(parser:Plibrdf_parser; feature:Plibrdf_uri):Plibrdf_node;cdecl;external librdf;
function librdf_parser_set_feature(parser:Plibrdf_parser; feature:Plibrdf_uri; value:Plibrdf_node):longint;cdecl;external librdf;
function librdf_parser_get_accept_header(parser:Plibrdf_parser):Pchar;cdecl;external librdf;
{REDLAND_DEPRECATED }
function librdf_parser_guess_name(mime_type:Pchar; buffer:Pbyte; identifier:Pbyte):Pchar;cdecl;external librdf;
function librdf_parser_guess_name2(world:Plibrdf_world; mime_type:Pchar; buffer:Pbyte; identifier:Pbyte):Pchar;cdecl;external librdf;
function librdf_parser_get_namespaces_seen_prefix(parser:Plibrdf_parser; offset:longint):Pchar;cdecl;external librdf;
function librdf_parser_get_namespaces_seen_uri(parser:Plibrdf_parser; offset:longint):Plibrdf_uri;cdecl;external librdf;
function librdf_parser_get_namespaces_seen_count(parser:Plibrdf_parser):longint;cdecl;external librdf;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 27-11-25 17:39:22 ===


implementation



end.
