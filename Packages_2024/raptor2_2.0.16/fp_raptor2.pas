unit fp_raptor2;

interface

uses
  ctypes;

const
  {$IFDEF Linux}
  libraptor2 = 'raptor2';
  {$ENDIF}

  {$IFDEF Windows}
  libraptor2 = 'libraptor2-0.dll'; 
  {$ENDIF}

type
  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  PFILE = type Pointer;

  Tva_list = Pointer; // ????


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  RAPTOR_V2_AVAILABLE = 1;
  RAPTOR_VERSION = 20016;
  RAPTOR_VERSION_STRING_ = '2.0.16';
  RAPTOR_VERSION_MAJOR_ = 2;
  RAPTOR_VERSION_MINOR_ = 0;
  RAPTOR_VERSION_RELEASE_ = 16;

type
  Praptor_uri = type Pointer;

var
  raptor_short_copyright_string: pchar; cvar;external libraptor2;
  raptor_copyright_string: pchar; cvar;external libraptor2;
  raptor_version_string: pchar; cvar;external libraptor2;
  raptor_version_major: dword; cvar;external libraptor2;
  raptor_version_minor: dword; cvar;external libraptor2;
  raptor_version_release: dword; cvar;external libraptor2;
  raptor_version_decimal: dword; cvar;external libraptor2;
  raptor_license_string: pchar; cvar;external libraptor2;
  raptor_home_url_string: pchar; cvar;external libraptor2;
  raptor_xml_namespace_uri: pbyte; cvar;external libraptor2;
  raptor_rdf_namespace_uri: pbyte; cvar;external libraptor2;
  raptor_rdf_namespace_uri_len: dword; cvar;external libraptor2;
  raptor_rdf_schema_namespace_uri: pbyte; cvar;external libraptor2;
  raptor_rdf_schema_namespace_uri_len: dword; cvar;external libraptor2;
  raptor_xmlschema_datatypes_namespace_uri: pbyte; cvar;external libraptor2;
  raptor_owl_namespace_uri: pbyte; cvar;external libraptor2;
  raptor_xml_literal_datatype_uri_string: pbyte; cvar;external libraptor2;
  raptor_xml_literal_datatype_uri_string_len: dword; cvar;external libraptor2;

type
  Praptor_world = type Pointer;
  Praptor_parser = type Pointer;
  Praptor_serializer = type Pointer;
  Praptor_www = type Pointer;
  Praptor_iostream = type Pointer;
  Praptor_xml_element = type Pointer;
  Praptor_xml_writer = type Pointer;
  Praptor_qname = type Pointer;
  PPraptor_qname = ^Praptor_qname;
  Praptor_namespace = type Pointer;
  Praptor_namespace_stack = type Pointer;
  Praptor_sax2 = type Pointer;

  Traptor_type_q = record
    mime_type: pchar;
    mime_type_len: Tsize_t;
    q: byte;
  end;
  Praptor_type_q = ^Traptor_type_q;

  Praptor_syntax_bitflags = ^Traptor_syntax_bitflags;
  Traptor_syntax_bitflags = longint;

const
  RAPTOR_SYNTAX_NEED_BASE_URI = 1;

type
  Traptor_syntax_description = record
    names: ^pchar;
    names_count: dword;
    _label: pchar;
    mime_types: Praptor_type_q;
    mime_types_count: dword;
    uri_strings: ^pchar;
    uri_strings_count: dword;
    flags: dword;
  end;
  Praptor_syntax_description = ^Traptor_syntax_description;

type
  Praptor_term_type = ^Traptor_term_type;
  Traptor_term_type = longint;

const
  RAPTOR_TERM_TYPE_UNKNOWN = 0;
  RAPTOR_TERM_TYPE_URI = 1;
  RAPTOR_TERM_TYPE_LITERAL = 2;
  RAPTOR_TERM_TYPE_BLANK = 4;

type
  Praptor_locator = ^Traptor_locator;

  Traptor_locator = record
    uri: Praptor_uri;
    file_: pchar;
    line: longint;
    column: longint;
    byte: longint;
  end;

type
  Praptor_option = ^Traptor_option;
  Traptor_option = longint;

const
  RAPTOR_OPTION_SCANNING = 0;
  RAPTOR_OPTION_ALLOW_NON_NS_ATTRIBUTES = 1;
  RAPTOR_OPTION_ALLOW_OTHER_PARSETYPES = 2;
  RAPTOR_OPTION_ALLOW_BAGID = 3;
  RAPTOR_OPTION_ALLOW_RDF_TYPE_RDF_LIST = 4;
  RAPTOR_OPTION_NORMALIZE_LANGUAGE = 5;
  RAPTOR_OPTION_NON_NFC_FATAL = 6;
  RAPTOR_OPTION_WARN_OTHER_PARSETYPES = 7;
  RAPTOR_OPTION_CHECK_RDF_ID = 8;
  RAPTOR_OPTION_RELATIVE_URIS = 9;
  RAPTOR_OPTION_WRITER_AUTO_INDENT = 10;
  RAPTOR_OPTION_WRITER_AUTO_EMPTY = 11;
  RAPTOR_OPTION_WRITER_INDENT_WIDTH = 12;
  RAPTOR_OPTION_WRITER_XML_VERSION = 13;
  RAPTOR_OPTION_WRITER_XML_DECLARATION = 14;
  RAPTOR_OPTION_NO_NET = 15;
  RAPTOR_OPTION_RESOURCE_BORDER = 16;
  RAPTOR_OPTION_LITERAL_BORDER = 17;
  RAPTOR_OPTION_BNODE_BORDER = 18;
  RAPTOR_OPTION_RESOURCE_FILL = 19;
  RAPTOR_OPTION_LITERAL_FILL = 20;
  RAPTOR_OPTION_BNODE_FILL = 21;
  RAPTOR_OPTION_HTML_TAG_SOUP = 22;
  RAPTOR_OPTION_MICROFORMATS = 23;
  RAPTOR_OPTION_HTML_LINK = 24;
  RAPTOR_OPTION_WWW_TIMEOUT = 25;
  RAPTOR_OPTION_WRITE_BASE_URI = 26;
  RAPTOR_OPTION_WWW_HTTP_CACHE_CONTROL = 27;
  RAPTOR_OPTION_WWW_HTTP_USER_AGENT = 28;
  RAPTOR_OPTION_JSON_CALLBACK = 29;
  RAPTOR_OPTION_JSON_EXTRA_DATA = 30;
  RAPTOR_OPTION_RSS_TRIPLES = 31;
  RAPTOR_OPTION_ATOM_ENTRY_URI = 32;
  RAPTOR_OPTION_PREFIX_ELEMENTS = 33;
  RAPTOR_OPTION_STRICT = 34;
  RAPTOR_OPTION_WWW_CERT_FILENAME = 35;
  RAPTOR_OPTION_WWW_CERT_TYPE = 36;
  RAPTOR_OPTION_WWW_CERT_PASSPHRASE = 37;
  RAPTOR_OPTION_NO_FILE = 38;
  RAPTOR_OPTION_WWW_SSL_VERIFY_PEER = 39;
  RAPTOR_OPTION_WWW_SSL_VERIFY_HOST = 40;
  RAPTOR_OPTION_LOAD_EXTERNAL_ENTITIES = 41;
  RAPTOR_OPTION_LAST = RAPTOR_OPTION_LOAD_EXTERNAL_ENTITIES;

type
  Traptor_term_literal_value = record
    _string: pbyte;
    string_len: dword;
    datatype: Praptor_uri;
    language: pbyte;
    language_len: byte;
  end;
  Praptor_term_literal_value = ^Traptor_term_literal_value;

  Traptor_term_blank_value = record
    _string: pbyte;
    string_len: dword;
  end;
  Praptor_term_blank_value = ^Traptor_term_blank_value;

  Traptor_term_value = record
    case longint of
      0: (uri: Praptor_uri);
      1: (literal: Traptor_term_literal_value);
      2: (blank: Traptor_term_blank_value);
  end;
  Praptor_term_value = ^Traptor_term_value;

  Traptor_term = record
    world: Praptor_world;
    usage: longint;
    _type: Traptor_term_type;
    value: Traptor_term_value;
  end;
  Praptor_term = ^Traptor_term;

  Traptor_statement = record
    world: Praptor_world;
    usage: longint;
    subject: Praptor_term;
    predicate: Praptor_term;
    obj: Praptor_term;
    graph: Praptor_term;
  end;
  Praptor_statement = ^Traptor_statement;

type
  Praptor_log_level = ^Traptor_log_level;
  Traptor_log_level = longint;

const
  RAPTOR_LOG_LEVEL_NONE = 0;
  RAPTOR_LOG_LEVEL_TRACE = 1;
  RAPTOR_LOG_LEVEL_DEBUG = 2;
  RAPTOR_LOG_LEVEL_INFO = 3;
  RAPTOR_LOG_LEVEL_WARN = 4;
  RAPTOR_LOG_LEVEL_ERROR = 5;
  RAPTOR_LOG_LEVEL_FATAL = 6;
  RAPTOR_LOG_LEVEL_LAST = RAPTOR_LOG_LEVEL_FATAL;

type
  Praptor_domain = ^Traptor_domain;
  Traptor_domain = longint;

const
  RAPTOR_DOMAIN_NONE = 0;
  RAPTOR_DOMAIN_IOSTREAM = 1;
  RAPTOR_DOMAIN_NAMESPACE = 2;
  RAPTOR_DOMAIN_PARSER = 3;
  RAPTOR_DOMAIN_QNAME = 4;
  RAPTOR_DOMAIN_SAX2 = 5;
  RAPTOR_DOMAIN_SERIALIZER = 6;
  RAPTOR_DOMAIN_TERM = 7;
  RAPTOR_DOMAIN_TURTLE_WRITER = 8;
  RAPTOR_DOMAIN_URI = 9;
  RAPTOR_DOMAIN_WORLD = 10;
  RAPTOR_DOMAIN_WWW = 11;
  RAPTOR_DOMAIN_XML_WRITER = 12;
  RAPTOR_DOMAIN_LAST = RAPTOR_DOMAIN_XML_WRITER;

type
  Traptor_log_message = record
    code: longint;
    domain: Traptor_domain;
    level: Traptor_log_level;
    locator: Praptor_locator;
    text: pchar;
  end;
  Praptor_log_message = ^Traptor_log_message;

  Traptor_log_handler = procedure(user_data: pointer; message: Praptor_log_message); cdecl;
  Traptor_statement_handler = procedure(user_data: pointer; statement: Praptor_statement); cdecl;

type
  Praptor_graph_mark_flags = ^Traptor_graph_mark_flags;
  Traptor_graph_mark_flags = longint;

const
  RAPTOR_GRAPH_MARK_START = 1;
  RAPTOR_GRAPH_MARK_DECLARED = 2;

type
  Traptor_graph_mark_handler = procedure(user_data: pointer; graph: Praptor_uri; flags: longint); cdecl;
  Traptor_generate_bnodeid_handler = function(user_data: pointer; user_bnodeid: pbyte): pbyte; cdecl;
  Traptor_namespace_handler = procedure(user_data: pointer; nspace: Praptor_namespace); cdecl;
  Traptor_www_write_bytes_handler = procedure(www: Praptor_www; userdata: pointer; ptr: pointer; size: Tsize_t; nmemb: Tsize_t); cdecl;
  Traptor_www_content_type_handler = procedure(www: Praptor_www; userdata: pointer; content_type: pchar); cdecl;
  Traptor_www_final_uri_handler = procedure(www: Praptor_www; userdata: pointer; final_uri: Praptor_uri); cdecl;
  Traptor_uri_filter_func = function(user_data: pointer; uri: Praptor_uri): longint; cdecl;

type
  Praptor_world_flag = ^Traptor_world_flag;
  Traptor_world_flag = longint;

const
  RAPTOR_WORLD_FLAG_LIBXML_GENERIC_ERROR_SAVE = 1;
  RAPTOR_WORLD_FLAG_LIBXML_STRUCTURED_ERROR_SAVE = 2;
  RAPTOR_WORLD_FLAG_URI_INTERNING = 3;
  RAPTOR_WORLD_FLAG_WWW_SKIP_INIT_FINISH = 4;

type
  Traptor_data_compare_arg_handler = function(data1: pointer; data2: pointer; user_data: pointer): longint; cdecl;
  Traptor_data_compare_handler = function(data1: pointer; data2: pointer): longint; cdecl;
  Traptor_data_malloc_handler = function(size: Tsize_t): pointer; cdecl;
  Traptor_data_free_handler = procedure(data: pointer); cdecl;
  Traptor_data_context_free_handler = procedure(context: pointer; obj: pointer); cdecl;
  Traptor_data_print_handler = function(obj: pointer; fh: PFILE): longint; cdecl;
  Traptor_data_context_print_handler = function(context: pointer; obj: pointer; fh: PFILE): longint; cdecl;

  Praptor_stringbuffer = type Pointer;

function raptor_new_world: Praptor_world;

function raptor_new_world_internal(version_decimal: dword): Praptor_world; cdecl; external libraptor2;
function raptor_world_open(world: Praptor_world): longint; cdecl; external libraptor2;
procedure raptor_free_world(world: Praptor_world); cdecl; external libraptor2;
function raptor_world_set_libxslt_security_preferences(world: Praptor_world; security_preferences: pointer): longint; cdecl; external libraptor2;
function raptor_world_set_flag(world: Praptor_world; flag: Traptor_world_flag; value: longint): longint; cdecl; external libraptor2;
function raptor_world_set_log_handler(world: Praptor_world; user_data: pointer; handler: Traptor_log_handler): longint; cdecl; external libraptor2;
procedure raptor_world_set_generate_bnodeid_handler(world: Praptor_world; user_data: pointer; handler: Traptor_generate_bnodeid_handler); cdecl; external libraptor2;
function raptor_world_generate_bnodeid(world: Praptor_world): pbyte; cdecl; external libraptor2;
procedure raptor_world_set_generate_bnodeid_parameters(world: Praptor_world; prefix: pchar; base: longint); cdecl; external libraptor2;
function raptor_log_level_get_label(level: Traptor_log_level): pchar; cdecl; external libraptor2;
function raptor_domain_get_label(domain: Traptor_domain): pchar; cdecl; external libraptor2;
function raptor_world_is_parser_name(world: Praptor_world; name: pchar): longint; cdecl; external libraptor2;
function raptor_world_guess_parser_name(world: Praptor_world; uri: Praptor_uri; mime_type: pchar; buffer: pbyte; len: Tsize_t;
  identifier: pbyte): pchar; cdecl; external libraptor2;
function raptor_world_is_serializer_name(world: Praptor_world; name: pchar): longint; cdecl; external libraptor2;
function raptor_world_get_parsers_count(world: Praptor_world): longint; cdecl; external libraptor2;
function raptor_world_get_serializers_count(world: Praptor_world): longint; cdecl; external libraptor2;
function raptor_world_get_parser_description(world: Praptor_world; counter: dword): Praptor_syntax_description; cdecl; external libraptor2;
function raptor_world_get_serializer_description(world: Praptor_world; counter: dword): Praptor_syntax_description; cdecl; external libraptor2;
function raptor_syntax_description_validate(desc: Praptor_syntax_description): longint; cdecl; external libraptor2;
function raptor_world_get_option_from_uri(world: Praptor_world; uri: Praptor_uri): Traptor_option; cdecl; external libraptor2;
function raptor_new_term_from_uri(world: Praptor_world; uri: Praptor_uri): Praptor_term; cdecl; external libraptor2;
function raptor_new_term_from_counted_uri_string(world: Praptor_world; uri_string: pbyte; length: Tsize_t): Praptor_term; cdecl; external libraptor2;
function raptor_new_term_from_uri_string(world: Praptor_world; uri_string: pbyte): Praptor_term; cdecl; external libraptor2;
function raptor_new_term_from_literal(world: Praptor_world; literal: pbyte; datatype: Praptor_uri; language: pbyte): Praptor_term; cdecl; external libraptor2;
function raptor_new_term_from_counted_literal(world: Praptor_world; literal: pbyte; literal_len: Tsize_t; datatype: Praptor_uri; language: pbyte;
  language_len: byte): Praptor_term; cdecl; external libraptor2;
function raptor_new_term_from_blank(world: Praptor_world; blank: pbyte): Praptor_term; cdecl; external libraptor2;
function raptor_new_term_from_counted_blank(world: Praptor_world; blank: pbyte; length: Tsize_t): Praptor_term; cdecl; external libraptor2;
function raptor_new_term_from_counted_string(world: Praptor_world; _string: pbyte; length: Tsize_t): Praptor_term; cdecl; external libraptor2;
function raptor_term_copy(term: Praptor_term): Praptor_term; cdecl; external libraptor2;
function raptor_term_compare(t1: Praptor_term; t2: Praptor_term): longint; cdecl; external libraptor2;
function raptor_term_equals(t1: Praptor_term; t2: Praptor_term): longint; cdecl; external libraptor2;
procedure raptor_free_term(term: Praptor_term); cdecl; external libraptor2;
function raptor_term_to_counted_string(term: Praptor_term; len_p: Psize_t): pbyte; cdecl; external libraptor2;
function raptor_term_to_string(term: Praptor_term): pbyte; cdecl; external libraptor2;
function raptor_term_escaped_write(term: Praptor_term; flags: dword; iostr: Praptor_iostream): longint; cdecl; external libraptor2;
function raptor_term_ntriples_write(term: Praptor_term; iostr: Praptor_iostream): longint; cdecl; external libraptor2; deprecated;
function raptor_uri_turtle_write(world: Praptor_world; iostr: Praptor_iostream; uri: Praptor_uri; nstack: Praptor_namespace_stack; base_uri: Praptor_uri): longint; cdecl; external libraptor2;
function raptor_term_turtle_write(iostr: Praptor_iostream; term: Praptor_term; nstack: Praptor_namespace_stack; base_uri: Praptor_uri): longint; cdecl; external libraptor2;
function raptor_uri_to_turtle_counted_string(world: Praptor_world; uri: Praptor_uri; nstack: Praptor_namespace_stack; base_uri: Praptor_uri; len_p: Psize_t): pbyte; cdecl; external libraptor2;
function raptor_uri_to_turtle_string(world: Praptor_world; uri: Praptor_uri; nstack: Praptor_namespace_stack; base_uri: Praptor_uri): pbyte; cdecl; external libraptor2;
function raptor_term_to_turtle_counted_string(term: Praptor_term; nstack: Praptor_namespace_stack; base_uri: Praptor_uri; len_p: Psize_t): pbyte; cdecl; external libraptor2;
function raptor_term_to_turtle_string(term: Praptor_term; nstack: Praptor_namespace_stack; base_uri: Praptor_uri): pbyte; cdecl; external libraptor2;
procedure raptor_statement_init(statement: Praptor_statement; world: Praptor_world); cdecl; external libraptor2;
procedure raptor_statement_clear(statement: Praptor_statement); cdecl; external libraptor2;
function raptor_new_statement(world: Praptor_world): Praptor_statement; cdecl; external libraptor2;
function raptor_new_statement_from_nodes(world: Praptor_world; subject: Praptor_term; predicate: Praptor_term; obj: Praptor_term; graph: Praptor_term): Praptor_statement; cdecl; external libraptor2;
function raptor_statement_copy(statement: Praptor_statement): Praptor_statement; cdecl; external libraptor2;
procedure raptor_free_statement(statement: Praptor_statement); cdecl; external libraptor2;
function raptor_statement_print(statement: Praptor_statement; stream: PFILE): longint; cdecl; external libraptor2;
function raptor_statement_print_as_ntriples(statement: Praptor_statement; stream: PFILE): longint; cdecl; external libraptor2;
function raptor_statement_compare(s1: Praptor_statement; s2: Praptor_statement): longint; cdecl; external libraptor2;
function raptor_statement_equals(s1: Praptor_statement; s2: Praptor_statement): longint; cdecl; external libraptor2;
function raptor_new_parser(world: Praptor_world; name: pchar): Praptor_parser; cdecl; external libraptor2;
function raptor_new_parser_for_content(world: Praptor_world; uri: Praptor_uri; mime_type: pchar; buffer: pbyte; len: Tsize_t;
  identifier: pbyte): Praptor_parser; cdecl; external libraptor2;
procedure raptor_free_parser(parser: Praptor_parser); cdecl; external libraptor2;
procedure raptor_parser_set_statement_handler(parser: Praptor_parser; user_data: pointer; handler: Traptor_statement_handler); cdecl; external libraptor2;
procedure raptor_parser_set_graph_mark_handler(parser: Praptor_parser; user_data: pointer; handler: Traptor_graph_mark_handler); cdecl; external libraptor2;
procedure raptor_parser_set_namespace_handler(parser: Praptor_parser; user_data: pointer; handler: Traptor_namespace_handler); cdecl; external libraptor2;
procedure raptor_parser_set_uri_filter(parser: Praptor_parser; filter: Traptor_uri_filter_func; user_data: pointer); cdecl; external libraptor2;
function raptor_parser_get_locator(rdf_parser: Praptor_parser): Praptor_locator; cdecl; external libraptor2;
function raptor_parser_parse_start(rdf_parser: Praptor_parser; uri: Praptor_uri): longint; cdecl; external libraptor2;
function raptor_parser_parse_chunk(rdf_parser: Praptor_parser; buffer: PChar; len: Tsize_t; is_end: longint): longint; cdecl; external libraptor2;
function raptor_parser_parse_file_stream(rdf_parser: Praptor_parser; stream: PFILE; filename: pchar; base_uri: Praptor_uri): longint; cdecl; external libraptor2;
function raptor_parser_parse_file(rdf_parser: Praptor_parser; uri: Praptor_uri; base_uri: Praptor_uri): longint; cdecl; external libraptor2;
function raptor_parser_parse_uri(rdf_parser: Praptor_parser; uri: Praptor_uri; base_uri: Praptor_uri): longint; cdecl; external libraptor2;
function raptor_parser_parse_uri_with_connection(rdf_parser: Praptor_parser; uri: Praptor_uri; base_uri: Praptor_uri; connection: pointer): longint; cdecl; external libraptor2;
function raptor_parser_parse_iostream(rdf_parser: Praptor_parser; iostr: Praptor_iostream; base_uri: Praptor_uri): longint; cdecl; external libraptor2;
procedure raptor_parser_parse_abort(rdf_parser: Praptor_parser); cdecl; external libraptor2;
function raptor_parser_get_name(rdf_parser: Praptor_parser): pchar; cdecl; external libraptor2;
function raptor_parser_get_description(rdf_parser: Praptor_parser): Praptor_syntax_description; cdecl; external libraptor2;
function raptor_parser_set_option(parser: Praptor_parser; option: Traptor_option; _string: pchar; integer: longint): longint; cdecl; external libraptor2;
function raptor_parser_get_option(parser: Praptor_parser; option: Traptor_option; string_p: PPchar; integer_p: Plongint): longint; cdecl; external libraptor2;
function raptor_parser_get_accept_header(rdf_parser: Praptor_parser): pchar; cdecl; external libraptor2;
function raptor_parser_get_world(rdf_parser: Praptor_parser): Praptor_world; cdecl; external libraptor2;
function raptor_parser_get_graph(rdf_parser: Praptor_parser): Praptor_uri; cdecl; external libraptor2;
function raptor_locator_print(locator: Praptor_locator; stream: PFILE): longint; cdecl; external libraptor2;
function raptor_locator_format(buffer: pchar; length: Tsize_t; locator: Praptor_locator): longint; cdecl; external libraptor2;
function raptor_locator_line(locator: Praptor_locator): longint; cdecl; external libraptor2;
function raptor_locator_column(locator: Praptor_locator): longint; cdecl; external libraptor2;
function raptor_locator_byte(locator: Praptor_locator): longint; cdecl; external libraptor2;
function raptor_locator_file(locator: Praptor_locator): pchar; cdecl; external libraptor2;
function raptor_locator_uri(locator: Praptor_locator): pchar; cdecl; external libraptor2;
function raptor_new_serializer(world: Praptor_world; name: pchar): Praptor_serializer; cdecl; external libraptor2;
procedure raptor_free_serializer(rdf_serializer: Praptor_serializer); cdecl; external libraptor2;
function raptor_serializer_start_to_iostream(rdf_serializer: Praptor_serializer; uri: Praptor_uri; iostream: Praptor_iostream): longint; cdecl; external libraptor2;
function raptor_serializer_start_to_filename(rdf_serializer: Praptor_serializer; filename: pchar): longint; cdecl; external libraptor2;
function raptor_serializer_start_to_string(rdf_serializer: Praptor_serializer; uri: Praptor_uri; string_p: Ppointer; length_p: Psize_t): longint; cdecl; external libraptor2;
function raptor_serializer_start_to_file_handle(rdf_serializer: Praptor_serializer; uri: Praptor_uri; fh: PFILE): longint; cdecl; external libraptor2;
function raptor_serializer_set_namespace(rdf_serializer: Praptor_serializer; uri: Praptor_uri; prefix: pbyte): longint; cdecl; external libraptor2;
function raptor_serializer_set_namespace_from_namespace(rdf_serializer: Praptor_serializer; nspace: Praptor_namespace): longint; cdecl; external libraptor2;
function raptor_serializer_serialize_statement(rdf_serializer: Praptor_serializer; statement: Praptor_statement): longint; cdecl; external libraptor2;
function raptor_serializer_serialize_end(rdf_serializer: Praptor_serializer): longint; cdecl; external libraptor2;
function raptor_serializer_get_iostream(serializer: Praptor_serializer): Praptor_iostream; cdecl; external libraptor2;
function raptor_serializer_get_locator(rdf_serializer: Praptor_serializer): Praptor_locator; cdecl; external libraptor2;
function raptor_serializer_flush(rdf_serializer: Praptor_serializer): longint; cdecl; external libraptor2;
function raptor_serializer_get_description(rdf_serializer: Praptor_serializer): Praptor_syntax_description; cdecl; external libraptor2;
function raptor_serializer_set_option(serializer: Praptor_serializer; option: Traptor_option; _string: pchar; integer: longint): longint; cdecl; external libraptor2;
function raptor_serializer_get_option(serializer: Praptor_serializer; option: Traptor_option; string_p: PPchar; integer_p: Plongint): longint; cdecl; external libraptor2;
function raptor_serializer_get_world(rdf_serializer: Praptor_serializer): Praptor_world; cdecl; external libraptor2;
procedure raptor_free_memory(ptr: pointer); cdecl; external libraptor2;
function raptor_alloc_memory(size: Tsize_t): pointer; cdecl; external libraptor2;
function raptor_calloc_memory(nmemb: Tsize_t; size: Tsize_t): pointer; cdecl; external libraptor2;
function raptor_new_uri_from_counted_string(world: Praptor_world; uri_string: pbyte; length: Tsize_t): Praptor_uri; cdecl; external libraptor2;
function raptor_new_uri(world: Praptor_world; uri_string: PChar): Praptor_uri; cdecl; external libraptor2;
function raptor_new_uri_from_uri_local_name(world: Praptor_world; uri: Praptor_uri; local_name: pbyte): Praptor_uri; cdecl; external libraptor2;
function raptor_new_uri_relative_to_base(world: Praptor_world; base_uri: Praptor_uri; uri_string: pbyte): Praptor_uri; cdecl; external libraptor2;
function raptor_new_uri_relative_to_base_counted(world: Praptor_world; base_uri: Praptor_uri; uri_string: pbyte; uri_len: Tsize_t): Praptor_uri; cdecl; external libraptor2;
function raptor_new_uri_from_id(world: Praptor_world; base_uri: Praptor_uri; id: pbyte): Praptor_uri; cdecl; external libraptor2;
function raptor_new_uri_from_uri_or_file_string(world: Praptor_world; base_uri: Praptor_uri; uri_or_file_string: pbyte): Praptor_uri; cdecl; external libraptor2;
function raptor_new_uri_for_rdf_concept(world: Praptor_world; name: pbyte): Praptor_uri; cdecl; external libraptor2;
function raptor_new_uri_for_xmlbase(old_uri: Praptor_uri): Praptor_uri; cdecl; external libraptor2;
function raptor_new_uri_for_retrieval(old_uri: Praptor_uri): Praptor_uri; cdecl; external libraptor2;
procedure raptor_free_uri(uri: Praptor_uri); cdecl; external libraptor2;
function raptor_uri_equals(uri1: Praptor_uri; uri2: Praptor_uri): longint; cdecl; external libraptor2;
function raptor_uri_compare(uri1: Praptor_uri; uri2: Praptor_uri): longint; cdecl; external libraptor2;
function raptor_uri_copy(uri: Praptor_uri): Praptor_uri; cdecl; external libraptor2;
function raptor_uri_as_string(uri: Praptor_uri): pbyte; cdecl; external libraptor2;
function raptor_uri_as_counted_string(uri: Praptor_uri; len_p: Psize_t): pbyte; cdecl; external libraptor2;
function raptor_uri_to_relative_counted_uri_string(base_uri: Praptor_uri; reference_uri: Praptor_uri; length_p: Psize_t): pbyte; cdecl; external libraptor2;
function raptor_uri_to_relative_uri_string(base_uri: Praptor_uri; reference_uri: Praptor_uri): pbyte; cdecl; external libraptor2;
function raptor_uri_print(uri: Praptor_uri; stream: PFILE): longint; cdecl; external libraptor2;
function raptor_uri_to_counted_string(uri: Praptor_uri; len_p: Psize_t): pbyte; cdecl; external libraptor2;
function raptor_uri_to_string(uri: Praptor_uri): pbyte; cdecl; external libraptor2;
function raptor_uri_get_world(uri: Praptor_uri): Praptor_world; cdecl; external libraptor2;
function raptor_uri_file_exists(uri: Praptor_uri): longint; cdecl; external libraptor2;
function raptor_uri_escaped_write(uri: Praptor_uri; base_uri: Praptor_uri; flags: dword; iostr: Praptor_iostream): longint; cdecl; external libraptor2;
function raptor_xml_escape_string_any(world: Praptor_world; _string: pbyte; len: Tsize_t; buffer: pbyte; length: Tsize_t;
  quote: char; xml_version: longint): longint; cdecl; external libraptor2;
function raptor_xml_escape_string_any_write(_string: pbyte; len: Tsize_t; quote: char; xml_version: longint; iostr: Praptor_iostream): longint; cdecl; external libraptor2;
function raptor_xml_escape_string(world: Praptor_world; _string: pbyte; len: Tsize_t; buffer: pbyte; length: Tsize_t;
  quote: char): longint; cdecl; external libraptor2;
function raptor_xml_escape_string_write(_string: pbyte; len: Tsize_t; quote: char; iostr: Praptor_iostream): longint; cdecl; external libraptor2;
function raptor_xml_name_check(_string: pbyte; length: Tsize_t; xml_version: longint): longint; cdecl; external libraptor2;
function raptor_vsnprintf(format: pchar; arguments: Tva_list): pchar; cdecl; external libraptor2; deprecated;
function raptor_vsnprintf2(buffer: pchar; size: Tsize_t; format: pchar; arguments: Tva_list): longint; cdecl; external libraptor2;
function raptor_snprintf(buffer: pchar; size: Tsize_t; format: pchar; args: array of const): longint; cdecl; external libraptor2;
function raptor_snprintf(buffer: pchar; size: Tsize_t; format: pchar): longint; cdecl; external libraptor2;
function raptor_vasprintf(ret: PPchar; format: pchar; arguments: Tva_list): longint; cdecl; external libraptor2;
function raptor_uri_resolve_uri_reference(base_uri: pbyte; reference_uri: pbyte; buffer: pbyte; length: Tsize_t): Tsize_t; cdecl; external libraptor2;
function raptor_uri_counted_filename_to_uri_string(filename: pchar; filename_len: Tsize_t): pbyte; cdecl; external libraptor2;
function raptor_uri_filename_to_uri_string(filename: pchar): pbyte; cdecl; external libraptor2;
function raptor_uri_filename_exists(path: pbyte): longint; cdecl; external libraptor2;
function raptor_uri_uri_string_to_filename(uri_string: pbyte): pchar; cdecl; external libraptor2;
function raptor_uri_uri_string_to_filename_fragment(uri_string: pbyte; fragment_p: PPbyte): pchar; cdecl; external libraptor2;
function raptor_uri_uri_string_is_file_uri(uri_string: pbyte): longint; cdecl; external libraptor2;
function raptor_stringbuffer_append_uri_escaped_counted_string(sb: Praptor_stringbuffer; _string: pchar; length: Tsize_t; space_is_plus: longint): longint; cdecl; external libraptor2;
function raptor_uri_uri_string_to_counted_filename_fragment(uri_string: pbyte; len_p: Psize_t; fragment_p: PPbyte; fragment_len_p: Psize_t): pchar; cdecl; external libraptor2;
function raptor_uri_uri_string_is_absolute(uri_string: pbyte): longint; cdecl; external libraptor2;

function raptor_new_www(world: Praptor_world): Praptor_www; cdecl; external libraptor2;
function raptor_new_www_with_connection(world: Praptor_world; connection: pointer): Praptor_www; cdecl; external libraptor2;
procedure raptor_free_www(www: Praptor_www); cdecl; external libraptor2;
function raptor_www_set_ssl_cert_options(www: Praptor_www; cert_filename: pchar; cert_type: pchar; cert_passphrase: pchar): longint; cdecl; external libraptor2;
function raptor_www_set_ssl_verify_options(www: Praptor_www; verify_peer: longint; verify_host: longint): longint; cdecl; external libraptor2;
function raptor_www_set_user_agent2(www: Praptor_www; user_agent: pchar; user_agent_len: Tsize_t): longint; cdecl; external libraptor2;
procedure raptor_www_set_user_agent(www: Praptor_www; user_agent: pchar); cdecl; external libraptor2; deprecated;
function raptor_www_set_proxy2(www: Praptor_www; proxy: pchar; proxy_len: Tsize_t): longint; cdecl; external libraptor2;
procedure raptor_www_set_proxy(www: Praptor_www; proxy: pchar); cdecl; external libraptor2; deprecated;
function raptor_www_set_http_accept2(www: Praptor_www; value: pchar; value_len: Tsize_t): longint; cdecl; external libraptor2;
procedure raptor_www_set_http_accept(www: Praptor_www; value: pchar); cdecl; external libraptor2; deprecated;
procedure raptor_www_set_write_bytes_handler(www: Praptor_www; handler: Traptor_www_write_bytes_handler; user_data: pointer); cdecl; external libraptor2;
procedure raptor_www_set_content_type_handler(www: Praptor_www; handler: Traptor_www_content_type_handler; user_data: pointer); cdecl; external libraptor2;
procedure raptor_www_set_final_uri_handler(www: Praptor_www; handler: Traptor_www_final_uri_handler; user_data: pointer); cdecl; external libraptor2;
procedure raptor_www_set_uri_filter(www: Praptor_www; filter: Traptor_uri_filter_func; user_data: pointer); cdecl; external libraptor2;
procedure raptor_www_set_connection_timeout(www: Praptor_www; timeout: longint); cdecl; external libraptor2;
function raptor_www_set_http_cache_control(www: Praptor_www; cache_control: pchar): longint; cdecl; external libraptor2;
function raptor_www_fetch(www: Praptor_www; uri: Praptor_uri): longint; cdecl; external libraptor2;
function raptor_www_fetch_to_string(www: Praptor_www; uri: Praptor_uri; string_p: Ppointer; length_p: Psize_t; malloc_handler: Traptor_data_malloc_handler): longint; cdecl; external libraptor2;
function raptor_www_get_connection(www: Praptor_www): pointer; cdecl; external libraptor2;
procedure raptor_www_abort(www: Praptor_www; reason: pchar); cdecl; external libraptor2;
function raptor_www_get_final_uri(www: Praptor_www): Praptor_uri; cdecl; external libraptor2;
function raptor_new_qname(nstack: Praptor_namespace_stack; name: pbyte; value: pbyte): Praptor_qname; cdecl; external libraptor2;
function raptor_new_qname_from_namespace_local_name(world: Praptor_world; ns: Praptor_namespace; local_name: pbyte; value: pbyte): Praptor_qname; cdecl; external libraptor2;
function raptor_qname_copy(qname: Praptor_qname): Praptor_qname; cdecl; external libraptor2;
procedure raptor_free_qname(name: Praptor_qname); cdecl; external libraptor2;
function raptor_qname_equal(name1: Praptor_qname; name2: Praptor_qname): longint; cdecl; external libraptor2;
function raptor_qname_to_counted_name(qname: Praptor_qname; length_p: Psize_t): pbyte; cdecl; external libraptor2;
function raptor_qname_get_namespace(name: Praptor_qname): Praptor_namespace; cdecl; external libraptor2;
function raptor_qname_get_local_name(name: Praptor_qname): pbyte; cdecl; external libraptor2;
function raptor_qname_get_value(name: Praptor_qname): pbyte; cdecl; external libraptor2;
function raptor_qname_get_counted_value(name: Praptor_qname; length_p: Psize_t): pbyte; cdecl; external libraptor2;
function raptor_qname_write(qname: Praptor_qname; iostr: Praptor_iostream): longint; cdecl; external libraptor2;
function raptor_qname_string_to_uri(nstack: Praptor_namespace_stack; name: pbyte; name_len: Tsize_t): Praptor_uri; cdecl; external libraptor2;
function raptor_qname_format_as_xml(qname: Praptor_qname; length_p: Psize_t): pbyte; cdecl; external libraptor2;
function raptor_new_namespace_from_uri(nstack: Praptor_namespace_stack; prefix: pbyte; ns_uri: Praptor_uri; depth: longint): Praptor_namespace; cdecl; external libraptor2;
function raptor_new_namespaces(world: Praptor_world; defaults: longint): Praptor_namespace_stack; cdecl; external libraptor2;
function raptor_namespaces_init(world: Praptor_world; nstack: Praptor_namespace_stack; defaults: longint): longint; cdecl; external libraptor2;
procedure raptor_namespaces_clear(nstack: Praptor_namespace_stack); cdecl; external libraptor2;
procedure raptor_free_namespaces(nstack: Praptor_namespace_stack); cdecl; external libraptor2;
procedure raptor_namespaces_start_namespace(nstack: Praptor_namespace_stack; nspace: Praptor_namespace); cdecl; external libraptor2;
function raptor_namespaces_start_namespace_full(nstack: Praptor_namespace_stack; prefix: pbyte; ns_uri_string: pbyte; depth: longint): longint; cdecl; external libraptor2;
procedure raptor_namespaces_end_for_depth(nstack: Praptor_namespace_stack; depth: longint); cdecl; external libraptor2;
function raptor_namespaces_get_default_namespace(nstack: Praptor_namespace_stack): Praptor_namespace; cdecl; external libraptor2;
function raptor_namespaces_find_namespace(nstack: Praptor_namespace_stack; prefix: pbyte; prefix_length: longint): Praptor_namespace; cdecl; external libraptor2;
function raptor_namespaces_find_namespace_by_uri(nstack: Praptor_namespace_stack; ns_uri: Praptor_uri): Praptor_namespace; cdecl; external libraptor2;
function raptor_namespaces_namespace_in_scope(nstack: Praptor_namespace_stack; nspace: Praptor_namespace): longint; cdecl; external libraptor2;
function raptor_new_qname_from_namespace_uri(nstack: Praptor_namespace_stack; uri: Praptor_uri; xml_version: longint): Praptor_qname; cdecl; external libraptor2;
function raptor_new_namespace(nstack: Praptor_namespace_stack; prefix: pbyte; ns_uri_string: pbyte; depth: longint): Praptor_namespace; cdecl; external libraptor2;
procedure raptor_free_namespace(ns: Praptor_namespace); cdecl; external libraptor2;
function raptor_namespace_stack_start_namespace(nstack: Praptor_namespace_stack; ns: Praptor_namespace; new_depth: longint): longint; cdecl; external libraptor2;
function raptor_namespace_get_uri(ns: Praptor_namespace): Praptor_uri; cdecl; external libraptor2;
function raptor_namespace_get_prefix(ns: Praptor_namespace): pbyte; cdecl; external libraptor2;
function raptor_namespace_get_counted_prefix(ns: Praptor_namespace; length_p: Psize_t): pbyte; cdecl; external libraptor2;
function raptor_namespace_format_as_xml(ns: Praptor_namespace; length_p: Psize_t): pbyte; cdecl; external libraptor2;
function raptor_namespace_write(ns: Praptor_namespace; iostr: Praptor_iostream): longint; cdecl; external libraptor2;
function raptor_xml_namespace_string_parse(_string: pbyte; prefix: PPbyte; uri_string: PPbyte): longint; cdecl; external libraptor2;

type
  Praptor_sequence = type Pointer;

function raptor_new_sequence(free_handler: Traptor_data_free_handler; print_handler: Traptor_data_print_handler): Praptor_sequence; cdecl; external libraptor2;
function raptor_new_sequence_with_context(free_handler: Traptor_data_context_free_handler; print_handler: Traptor_data_context_print_handler; handler_context: pointer): Praptor_sequence; cdecl; external libraptor2;
procedure raptor_free_sequence(seq: Praptor_sequence); cdecl; external libraptor2;
function raptor_sequence_size(seq: Praptor_sequence): longint; cdecl; external libraptor2;
function raptor_sequence_set_at(seq: Praptor_sequence; idx: longint; data: pointer): longint; cdecl; external libraptor2;
function raptor_sequence_push(seq: Praptor_sequence; data: pointer): longint; cdecl; external libraptor2;
function raptor_sequence_shift(seq: Praptor_sequence; data: pointer): longint; cdecl; external libraptor2;
function raptor_sequence_get_at(seq: Praptor_sequence; idx: longint): pointer; cdecl; external libraptor2;
function raptor_sequence_pop(seq: Praptor_sequence): pointer; cdecl; external libraptor2;
function raptor_sequence_unshift(seq: Praptor_sequence): pointer; cdecl; external libraptor2;
function raptor_sequence_delete_at(seq: Praptor_sequence; idx: longint): pointer; cdecl; external libraptor2;
procedure raptor_sequence_sort(seq: Praptor_sequence; compare: Traptor_data_compare_handler); cdecl; external libraptor2;
procedure raptor_sequence_sort_r(seq: Praptor_sequence; compare: Traptor_data_compare_arg_handler; user_data: pointer); cdecl; external libraptor2;
function raptor_sequence_swap(seq: Praptor_sequence; i: longint; j: longint): longint; cdecl; external libraptor2;
function raptor_sequence_reverse(seq: Praptor_sequence; start_index: longint; length: longint): longint; cdecl; external libraptor2;
function raptor_sequence_next_permutation(seq: Praptor_sequence; compare: Traptor_data_compare_handler): longint; cdecl; external libraptor2;
function raptor_sequence_print(seq: Praptor_sequence; fh: PFILE): longint; cdecl; external libraptor2;
function raptor_sequence_join(dest: Praptor_sequence; src: Praptor_sequence): longint; cdecl; external libraptor2;

type
  Praptor_unichar = ^Traptor_unichar;
  Traptor_unichar = dword;

function raptor_unicode_utf8_string_put_char(c: Traptor_unichar; output: pbyte; length: Tsize_t): longint; cdecl; external libraptor2;
function raptor_unicode_utf8_string_get_char(input: pbyte; length: Tsize_t; output: Praptor_unichar): longint; cdecl; external libraptor2;
function raptor_unicode_is_xml11_namestartchar(c: Traptor_unichar): longint; cdecl; external libraptor2;
function raptor_unicode_is_xml10_namestartchar(c: Traptor_unichar): longint; cdecl; external libraptor2;
function raptor_unicode_is_xml11_namechar(c: Traptor_unichar): longint; cdecl; external libraptor2;
function raptor_unicode_is_xml10_namechar(c: Traptor_unichar): longint; cdecl; external libraptor2;
function raptor_unicode_check_utf8_string(_string: pbyte; length: Tsize_t): longint; cdecl; external libraptor2;
function raptor_unicode_utf8_strlen(_string: pbyte; length: Tsize_t): longint; cdecl; external libraptor2;
function raptor_unicode_utf8_substr(dest: pbyte; dest_length_p: Psize_t; src: pbyte; src_length: Tsize_t; startingLoc: longint;
  length: longint): Tsize_t; cdecl; external libraptor2;
function raptor_new_stringbuffer: Praptor_stringbuffer; cdecl; external libraptor2;
procedure raptor_free_stringbuffer(stringbuffer: Praptor_stringbuffer); cdecl; external libraptor2;
function raptor_stringbuffer_append_counted_string(stringbuffer: Praptor_stringbuffer; _string: pbyte; length: Tsize_t; do_copy: longint): longint; cdecl; external libraptor2;
function raptor_stringbuffer_append_string(stringbuffer: Praptor_stringbuffer; _string: pbyte; do_copy: longint): longint; cdecl; external libraptor2;
function raptor_stringbuffer_append_decimal(stringbuffer: Praptor_stringbuffer; integer: longint): longint; cdecl; external libraptor2;
function raptor_stringbuffer_append_hexadecimal(stringbuffer: Praptor_stringbuffer; hex: longint): longint; cdecl; external libraptor2;
function raptor_stringbuffer_append_stringbuffer(stringbuffer: Praptor_stringbuffer; append: Praptor_stringbuffer): longint; cdecl; external libraptor2;
function raptor_stringbuffer_prepend_counted_string(stringbuffer: Praptor_stringbuffer; _string: pbyte; length: Tsize_t; do_copy: longint): longint; cdecl; external libraptor2;
function raptor_stringbuffer_prepend_string(stringbuffer: Praptor_stringbuffer; _string: pbyte; do_copy: longint): longint; cdecl; external libraptor2;
function raptor_stringbuffer_as_string(stringbuffer: Praptor_stringbuffer): pbyte; cdecl; external libraptor2;
function raptor_stringbuffer_length(stringbuffer: Praptor_stringbuffer): Tsize_t; cdecl; external libraptor2;
function raptor_stringbuffer_copy_to_string(stringbuffer: Praptor_stringbuffer; _string: pbyte; length: Tsize_t): longint; cdecl; external libraptor2;

type
  Traptor_iostream_init_func = function(context: pointer): longint; cdecl;
  Traptor_iostream_finish_func = procedure(context: pointer); cdecl;
  Traptor_iostream_write_byte_func = function(context: pointer; byte: longint): longint; cdecl;
  Traptor_iostream_write_bytes_func = function(context: pointer; ptr: pointer; size: Tsize_t; nmemb: Tsize_t): longint; cdecl;
  Traptor_iostream_write_end_func = function(context: pointer): longint; cdecl;
  Traptor_iostream_read_bytes_func = function(context: pointer; ptr: pointer; size: Tsize_t; nmemb: Tsize_t): longint; cdecl;
  Traptor_iostream_read_eof_func = function(context: pointer): longint; cdecl;

  Traptor_iostream_handler = record
    version: longint;
    init: Traptor_iostream_init_func;
    finish: Traptor_iostream_finish_func;
    write_byte: Traptor_iostream_write_byte_func;
    write_bytes: Traptor_iostream_write_bytes_func;
    write_end: Traptor_iostream_write_end_func;
    read_bytes: Traptor_iostream_read_bytes_func;
    read_eof: Traptor_iostream_read_eof_func;
  end;
  Praptor_iostream_handler = ^Traptor_iostream_handler;

function raptor_new_iostream_from_handler(world: Praptor_world; user_data: pointer; handler: Praptor_iostream_handler): Praptor_iostream; cdecl; external libraptor2;
function raptor_new_iostream_to_sink(world: Praptor_world): Praptor_iostream; cdecl; external libraptor2;
function raptor_new_iostream_to_filename(world: Praptor_world; filename: pchar): Praptor_iostream; cdecl; external libraptor2;
function raptor_new_iostream_to_file_handle(world: Praptor_world; handle: PFILE): Praptor_iostream; cdecl; external libraptor2;
function raptor_new_iostream_to_string(world: Praptor_world; string_p: Ppointer; length_p: Psize_t; malloc_handler: Traptor_data_malloc_handler): Praptor_iostream; cdecl; external libraptor2;
function raptor_new_iostream_from_sink(world: Praptor_world): Praptor_iostream; cdecl; external libraptor2;
function raptor_new_iostream_from_filename(world: Praptor_world; filename: pchar): Praptor_iostream; cdecl; external libraptor2;
function raptor_new_iostream_from_file_handle(world: Praptor_world; handle: PFILE): Praptor_iostream; cdecl; external libraptor2;
function raptor_new_iostream_from_string(world: Praptor_world; _string: pointer; length: Tsize_t): Praptor_iostream; cdecl; external libraptor2;
procedure raptor_free_iostream(iostr: Praptor_iostream); cdecl; external libraptor2;
function raptor_iostream_write_bytes(ptr: pointer; size: Tsize_t; nmemb: Tsize_t; iostr: Praptor_iostream): longint; cdecl; external libraptor2;
function raptor_iostream_write_byte(byte: longint; iostr: Praptor_iostream): longint; cdecl; external libraptor2;
function raptor_iostream_write_end(iostr: Praptor_iostream): longint; cdecl; external libraptor2;
function raptor_iostream_string_write(_string: pointer; iostr: Praptor_iostream): longint; cdecl; external libraptor2;
function raptor_iostream_counted_string_write(_string: pointer; len: Tsize_t; iostr: Praptor_iostream): longint; cdecl; external libraptor2;
function raptor_iostream_tell(iostr: Praptor_iostream): dword; cdecl; external libraptor2;
function raptor_iostream_decimal_write(integer: longint; iostr: Praptor_iostream): longint; cdecl; external libraptor2;
function raptor_iostream_hexadecimal_write(integer: dword; width: longint; iostr: Praptor_iostream): longint; cdecl; external libraptor2;
function raptor_stringbuffer_write(sb: Praptor_stringbuffer; iostr: Praptor_iostream): longint; cdecl; external libraptor2;
function raptor_uri_write(uri: Praptor_uri; iostr: Praptor_iostream): longint; cdecl; external libraptor2;
function raptor_iostream_read_bytes(ptr: pointer; size: Tsize_t; nmemb: Tsize_t; iostr: Praptor_iostream): longint; cdecl; external libraptor2;
function raptor_iostream_read_eof(iostr: Praptor_iostream): longint; cdecl; external libraptor2;

type
  Praptor_escaped_write_bitflags = ^Traptor_escaped_write_bitflags;
  Traptor_escaped_write_bitflags = longint;

const
  RAPTOR_ESCAPED_WRITE_BITFLAG_BS_ESCAPES_BF = 1;
  RAPTOR_ESCAPED_WRITE_BITFLAG_BS_ESCAPES_TNRU = 2;
  RAPTOR_ESCAPED_WRITE_BITFLAG_UTF8 = 4;
  RAPTOR_ESCAPED_WRITE_BITFLAG_SPARQL_URI_ESCAPES = 8;
  RAPTOR_ESCAPED_WRITE_NTRIPLES_LITERAL = RAPTOR_ESCAPED_WRITE_BITFLAG_BS_ESCAPES_TNRU or RAPTOR_ESCAPED_WRITE_BITFLAG_BS_ESCAPES_BF;
  RAPTOR_ESCAPED_WRITE_NTRIPLES_URI = RAPTOR_ESCAPED_WRITE_BITFLAG_SPARQL_URI_ESCAPES;
  RAPTOR_ESCAPED_WRITE_SPARQL_LITERAL = RAPTOR_ESCAPED_WRITE_BITFLAG_UTF8;
  RAPTOR_ESCAPED_WRITE_SPARQL_LONG_LITERAL = RAPTOR_ESCAPED_WRITE_BITFLAG_UTF8;
  RAPTOR_ESCAPED_WRITE_SPARQL_URI = RAPTOR_ESCAPED_WRITE_BITFLAG_UTF8 or RAPTOR_ESCAPED_WRITE_BITFLAG_SPARQL_URI_ESCAPES;
  RAPTOR_ESCAPED_WRITE_TURTLE_URI = RAPTOR_ESCAPED_WRITE_SPARQL_URI;
  RAPTOR_ESCAPED_WRITE_TURTLE_LITERAL = RAPTOR_ESCAPED_WRITE_SPARQL_LITERAL;
  RAPTOR_ESCAPED_WRITE_TURTLE_LONG_LITERAL = RAPTOR_ESCAPED_WRITE_SPARQL_LONG_LITERAL;
  RAPTOR_ESCAPED_WRITE_JSON_LITERAL = (RAPTOR_ESCAPED_WRITE_BITFLAG_BS_ESCAPES_TNRU or RAPTOR_ESCAPED_WRITE_BITFLAG_BS_ESCAPES_BF) or RAPTOR_ESCAPED_WRITE_BITFLAG_UTF8;

function raptor_string_ntriples_write(_string: pbyte; len: Tsize_t; delim: char; iostr: Praptor_iostream): longint; cdecl; external libraptor2;
function raptor_bnodeid_ntriples_write(bnodeid: pbyte; len: Tsize_t; iostr: Praptor_iostream): longint; cdecl; external libraptor2;
function raptor_string_python_write(_string: pbyte; len: Tsize_t; delim: char; mode: dword; iostr: Praptor_iostream): longint; cdecl; external libraptor2; deprecated;
function raptor_statement_ntriples_write(statement: Praptor_statement; iostr: Praptor_iostream; write_graph_term: longint): longint; cdecl; external libraptor2;
function raptor_string_escaped_write(_string: pbyte; len: Tsize_t; delim: char; flags: dword; iostr: Praptor_iostream): longint; cdecl; external libraptor2;

type
  Praptor_option_value_type = ^Traptor_option_value_type;
  Traptor_option_value_type = longint;

const
  RAPTOR_OPTION_VALUE_TYPE_BOOL = 0;
  RAPTOR_OPTION_VALUE_TYPE_INT = 1;
  RAPTOR_OPTION_VALUE_TYPE_STRING = 2;
  RAPTOR_OPTION_VALUE_TYPE_URI = 3;
  RAPTOR_OPTION_VALUE_TYPE_LAST = RAPTOR_OPTION_VALUE_TYPE_URI;

type
  Traptor_option_description = record
    domain: Traptor_domain;
    option: Traptor_option;
    value_type: Traptor_option_value_type;
    name: pchar;
    name_len: Tsize_t;
    _label: pchar;
    uri: Praptor_uri;
  end;
  Praptor_option_description = ^Traptor_option_description;

function raptor_option_get_count: dword; cdecl; external libraptor2;
function raptor_option_get_value_type_label(_type: Traptor_option_value_type): pchar; cdecl; external libraptor2;
procedure raptor_free_option_description(option_description: Praptor_option_description); cdecl; external libraptor2;
function raptor_world_get_option_description(world: Praptor_world; domain: Traptor_domain; option: Traptor_option): Praptor_option_description; cdecl; external libraptor2;
function raptor_new_xml_element(name: Praptor_qname; xml_language: pbyte; xml_base: Praptor_uri): Praptor_xml_element; cdecl; external libraptor2;
function raptor_new_xml_element_from_namespace_local_name(ns: Praptor_namespace; name: pbyte; xml_language: pbyte; xml_base: Praptor_uri): Praptor_xml_element; cdecl; external libraptor2;
procedure raptor_free_xml_element(element: Praptor_xml_element); cdecl; external libraptor2;
function raptor_xml_element_get_name(xml_element: Praptor_xml_element): Praptor_qname; cdecl; external libraptor2;
procedure raptor_xml_element_set_attributes(xml_element: Praptor_xml_element; attributes: PPraptor_qname; count: longint); cdecl; external libraptor2;
function raptor_xml_element_get_attributes(xml_element: Praptor_xml_element): PPraptor_qname; cdecl; external libraptor2;
function raptor_xml_element_get_attributes_count(xml_element: Praptor_xml_element): longint; cdecl; external libraptor2;
function raptor_xml_element_declare_namespace(xml_element: Praptor_xml_element; nspace: Praptor_namespace): longint; cdecl; external libraptor2;
function raptor_xml_element_write(element: Praptor_xml_element; nstack: Praptor_namespace_stack; is_empty: longint; is_end: longint; depth: longint;
  iostr: Praptor_iostream): longint; cdecl; external libraptor2;
function raptor_xml_element_is_empty(xml_element: Praptor_xml_element): longint; cdecl; external libraptor2;
function raptor_xml_element_get_language(xml_element: Praptor_xml_element): pbyte; cdecl; external libraptor2;
function raptor_new_xml_writer(world: Praptor_world; nstack: Praptor_namespace_stack; iostr: Praptor_iostream): Praptor_xml_writer; cdecl; external libraptor2;
procedure raptor_free_xml_writer(xml_writer: Praptor_xml_writer); cdecl; external libraptor2;
procedure raptor_xml_writer_empty_element(xml_writer: Praptor_xml_writer; element: Praptor_xml_element); cdecl; external libraptor2;
procedure raptor_xml_writer_start_element(xml_writer: Praptor_xml_writer; element: Praptor_xml_element); cdecl; external libraptor2;
procedure raptor_xml_writer_end_element(xml_writer: Praptor_xml_writer; element: Praptor_xml_element); cdecl; external libraptor2;
procedure raptor_xml_writer_newline(xml_writer: Praptor_xml_writer); cdecl; external libraptor2;
procedure raptor_xml_writer_cdata(xml_writer: Praptor_xml_writer; s: pbyte); cdecl; external libraptor2;
procedure raptor_xml_writer_cdata_counted(xml_writer: Praptor_xml_writer; s: pbyte; len: dword); cdecl; external libraptor2;
procedure raptor_xml_writer_raw(xml_writer: Praptor_xml_writer; s: pbyte); cdecl; external libraptor2;
procedure raptor_xml_writer_raw_counted(xml_writer: Praptor_xml_writer; s: pbyte; len: dword); cdecl; external libraptor2;
procedure raptor_xml_writer_comment(xml_writer: Praptor_xml_writer; s: pbyte); cdecl; external libraptor2;
procedure raptor_xml_writer_comment_counted(xml_writer: Praptor_xml_writer; s: pbyte; len: dword); cdecl; external libraptor2;
procedure raptor_xml_writer_flush(xml_writer: Praptor_xml_writer); cdecl; external libraptor2;
function raptor_xml_writer_set_option(xml_writer: Praptor_xml_writer; option: Traptor_option; _string: pchar; integer: longint): longint; cdecl; external libraptor2;
function raptor_xml_writer_get_option(xml_writer: Praptor_xml_writer; option: Traptor_option; string_p: PPchar; integer_p: Plongint): longint; cdecl; external libraptor2;
function raptor_xml_writer_get_depth(xml_writer: Praptor_xml_writer): longint; cdecl; external libraptor2;

type
  Traptor_sax2_start_element_handler = procedure(user_data: pointer; xml_element: Praptor_xml_element); cdecl;
  Traptor_sax2_end_element_handler = procedure(user_data: pointer; xml_element: Praptor_xml_element); cdecl;
  Traptor_sax2_characters_handler = procedure(user_data: pointer; xml_element: Praptor_xml_element; s: pbyte; len: longint); cdecl;
  Traptor_sax2_cdata_handler = procedure(user_data: pointer; xml_element: Praptor_xml_element; s: pbyte; len: longint); cdecl;
  Traptor_sax2_comment_handler = procedure(user_data: pointer; xml_element: Praptor_xml_element; s: pbyte); cdecl;
  Traptor_sax2_unparsed_entity_decl_handler = procedure(user_data: pointer; entityName: pbyte; base: pbyte; systemId: pbyte; publicId: pbyte; notationName: pbyte); cdecl;
  Traptor_sax2_external_entity_ref_handler = function(user_data: pointer; context: pbyte; base: pbyte; systemId: pbyte; publicId: pbyte): longint; cdecl;

function raptor_new_sax2(world: Praptor_world; locator: Praptor_locator; user_data: pointer): Praptor_sax2; cdecl; external libraptor2;
procedure raptor_free_sax2(sax2: Praptor_sax2); cdecl; external libraptor2;
procedure raptor_sax2_set_start_element_handler(sax2: Praptor_sax2; handler: Traptor_sax2_start_element_handler); cdecl; external libraptor2;
procedure raptor_sax2_set_end_element_handler(sax2: Praptor_sax2; handler: Traptor_sax2_end_element_handler); cdecl; external libraptor2;
procedure raptor_sax2_set_characters_handler(sax2: Praptor_sax2; handler: Traptor_sax2_characters_handler); cdecl; external libraptor2;
procedure raptor_sax2_set_cdata_handler(sax2: Praptor_sax2; handler: Traptor_sax2_cdata_handler); cdecl; external libraptor2;
procedure raptor_sax2_set_comment_handler(sax2: Praptor_sax2; handler: Traptor_sax2_comment_handler); cdecl; external libraptor2;
procedure raptor_sax2_set_unparsed_entity_decl_handler(sax2: Praptor_sax2; handler: Traptor_sax2_unparsed_entity_decl_handler); cdecl; external libraptor2;
procedure raptor_sax2_set_external_entity_ref_handler(sax2: Praptor_sax2; handler: Traptor_sax2_external_entity_ref_handler); cdecl; external libraptor2;
procedure raptor_sax2_set_namespace_handler(sax2: Praptor_sax2; handler: Traptor_namespace_handler); cdecl; external libraptor2;
procedure raptor_sax2_set_uri_filter(sax2: Praptor_sax2; filter: Traptor_uri_filter_func; user_data: pointer); cdecl; external libraptor2;
procedure raptor_sax2_parse_start(sax2: Praptor_sax2; base_uri: Praptor_uri); cdecl; external libraptor2;
function raptor_sax2_parse_chunk(sax2: Praptor_sax2; buffer: pbyte; len: Tsize_t; is_end: longint): longint; cdecl; external libraptor2;
function raptor_sax2_inscope_xml_language(sax2: Praptor_sax2): pbyte; cdecl; external libraptor2;
function raptor_sax2_inscope_base_uri(sax2: Praptor_sax2): Praptor_uri; cdecl; external libraptor2;

type
  Praptor_avltree = type Pointer;
  Praptor_avltree_iterator = type Pointer;

  Traptor_avltree_visit_handler = function(depth: longint; data: pointer; user_data: pointer): longint; cdecl;

type
  Praptor_avltree_bitflags = ^Traptor_avltree_bitflags;
  Traptor_avltree_bitflags = longint;

const
  RAPTOR_AVLTREE_FLAG_REPLACE_DUPLICATES = 1;

function raptor_new_avltree(compare_handler: Traptor_data_compare_handler; free_handler: Traptor_data_free_handler; flags: dword): Praptor_avltree; cdecl; external libraptor2;
procedure raptor_free_avltree(tree: Praptor_avltree); cdecl; external libraptor2;
function raptor_avltree_add(tree: Praptor_avltree; p_data: pointer): longint; cdecl; external libraptor2;
function raptor_avltree_remove(tree: Praptor_avltree; p_data: pointer): pointer; cdecl; external libraptor2;
function raptor_avltree_delete(tree: Praptor_avltree; p_data: pointer): longint; cdecl; external libraptor2;
procedure raptor_avltree_trim(tree: Praptor_avltree); cdecl; external libraptor2;
function raptor_avltree_search(tree: Praptor_avltree; p_data: pointer): pointer; cdecl; external libraptor2;
function raptor_avltree_visit(tree: Praptor_avltree; visit_handler: Traptor_avltree_visit_handler; user_data: pointer): longint; cdecl; external libraptor2;
function raptor_avltree_size(tree: Praptor_avltree): longint; cdecl; external libraptor2;
procedure raptor_avltree_set_print_handler(tree: Praptor_avltree; print_handler: Traptor_data_print_handler); cdecl; external libraptor2;
function raptor_avltree_print(tree: Praptor_avltree; stream: PFILE): longint; cdecl; external libraptor2;
function raptor_new_avltree_iterator(tree: Praptor_avltree; range: pointer; range_free_handler: Traptor_data_free_handler; direction: longint): Praptor_avltree_iterator; cdecl; external libraptor2;
procedure raptor_free_avltree_iterator(iterator: Praptor_avltree_iterator); cdecl; external libraptor2;
function raptor_avltree_iterator_is_end(iterator: Praptor_avltree_iterator): longint; cdecl; external libraptor2;
function raptor_avltree_iterator_next(iterator: Praptor_avltree_iterator): longint; cdecl; external libraptor2;
function raptor_avltree_iterator_get(iterator: Praptor_avltree_iterator): pointer; cdecl; external libraptor2;
procedure raptor_sort_r(base: pointer; nel: Tsize_t; width: Tsize_t; compar: Traptor_data_compare_arg_handler; user_data: pointer); cdecl; external libraptor2;

// === Konventiert am: 28-11-25 19:22:17 ===


implementation


function raptor_new_world: Praptor_world;
begin
  raptor_new_world := raptor_new_world_internal(RAPTOR_VERSION);
end;

// wegen "division_by_zero" in den clibs
{$IF defined(CPUX86) or defined(CPUX64)}
{$asmmode intel}
procedure SetMXCSR;
var
  w2: word = 8064;
begin
  asm
           Ldmxcsr w2
  end;
end;
{$ENDIF}

begin
  {$IF defined(CPUX86) or defined(CPUX64)}
  SetMXCSR;
  {$ENDIF}
end.

end.
