unit fp_raptor2;

interface

uses
  ctypes;

const
  {$IFDEF Linux}
  libraptor2 = 'raptor2';
  {$ENDIF}

  {$IFDEF Windows}
  libraptor2 = 'raptor2.dll'; // ????
  {$ENDIF}


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
Praptor_uri=type Pointer;
  var
    raptor_short_copyright_string : Pchar;cvar;external libraptor2;
    raptor_copyright_string : Pchar;cvar;external libraptor2;
    raptor_version_string : Pchar;cvar;external libraptor2;
    raptor_version_major : dword;cvar;external libraptor2;
    raptor_version_minor : dword;cvar;external libraptor2;
    raptor_version_release : dword;cvar;external libraptor2;
    raptor_version_decimal : dword;cvar;external libraptor2;
    raptor_license_string : Pchar;cvar;external libraptor2;
    raptor_home_url_string : Pchar;cvar;external libraptor2;
    raptor_xml_namespace_uri : Pbyte;cvar;external libraptor2;
    raptor_rdf_namespace_uri : Pbyte;cvar;external libraptor2;
    raptor_rdf_namespace_uri_len : dword;cvar;external libraptor2;
    raptor_rdf_schema_namespace_uri : Pbyte;cvar;external libraptor2;
    raptor_rdf_schema_namespace_uri_len : dword;cvar;external libraptor2;
    raptor_xmlschema_datatypes_namespace_uri : Pbyte;cvar;external libraptor2;
    raptor_owl_namespace_uri : Pbyte;cvar;external libraptor2;
    raptor_xml_literal_datatype_uri_string : Pbyte;cvar;external libraptor2;
    raptor_xml_literal_datatype_uri_string_len : dword;cvar;external libraptor2;
type
              Praptor_world=type Pointer;
               Praptor_parser=type Pointer;
                   Praptor_serializer=type Pointer;
            Praptor_www=type Pointer;
                 Praptor_iostream=type Pointer;
                    Praptor_xml_element=type Pointer;
                   Praptor_xml_writer=type Pointer;
              Praptor_qname=type Pointer;
                  Praptor_namespace=type Pointer;
                        Praptor_namespace_stack=type Pointer;
             Praptor_sax2=type Pointer;

  Traptor_type_q = record
      mime_type : Pchar;
      mime_type_len : Tsize_t;
      q : byte;
    end;
  Praptor_type_q = ^Traptor_type_q;

  Praptor_syntax_bitflags = ^Traptor_syntax_bitflags;
  Traptor_syntax_bitflags =  Longint;
  Const
    RAPTOR_SYNTAX_NEED_BASE_URI = 1;
type
  Traptor_syntax_description = record
      names : ^Pchar;
      names_count : dword;
      _label : Pchar;
      mime_types : Praptor_type_q;
      mime_types_count : dword;
      uri_strings : ^Pchar;
      uri_strings_count : dword;
      flags : dword;
    end;
  Praptor_syntax_description = ^Traptor_syntax_description;
type
  Praptor_term_type = ^Traptor_term_type;
  Traptor_term_type =  Longint;
  Const
    RAPTOR_TERM_TYPE_UNKNOWN = 0;
    RAPTOR_TERM_TYPE_URI = 1;
    RAPTOR_TERM_TYPE_LITERAL = 2;
    RAPTOR_TERM_TYPE_BLANK = 4;
type
  Praptor_locator = ^Traptor_locator;
  Traptor_locator = record
      uri : Praptor_uri;
      file_ : Pchar;
      line : longint;
      column : longint;
      byte : longint;
    end;
type
  Praptor_option = ^Traptor_option;
  Traptor_option =  Longint;
  Const
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
      _string : Pbyte;
      string_len : dword;
      datatype : Praptor_uri;
      language : Pbyte;
      language_len : byte;
    end;
  Praptor_term_literal_value = ^Traptor_term_literal_value;

  Traptor_term_blank_value = record
      _string : Pbyte;
      string_len : dword;
    end;
  Praptor_term_blank_value = ^Traptor_term_blank_value;

  Traptor_term_value = record
      case longint of
        0 : ( uri : Praptor_uri );
        1 : ( literal : Traptor_term_literal_value );
        2 : ( blank : Traptor_term_blank_value );
      end;
  Praptor_term_value = ^Traptor_term_value;

  Traptor_term = record
      world : Praptor_world;
      usage : longint;
      _type : Traptor_term_type;
      value : Traptor_term_value;
    end;
  Praptor_term = ^Traptor_term;

  Traptor_statement = record
      world : Praptor_world;
      usage : longint;
      subject : Praptor_term;
      predicate : Praptor_term;
      object : Praptor_term;
      graph : Praptor_term;
    end;
  Praptor_statement = ^Traptor_statement;
type
  Praptor_log_level = ^Traptor_log_level;
  Traptor_log_level =  Longint;
  Const
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
  Traptor_domain =  Longint;
  Const
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
      code : longint;
      domain : Traptor_domain;
      level : Traptor_log_level;
      locator : Praptor_locator;
      text : Pchar;
    end;
  Praptor_log_message = ^Traptor_log_message;

  Traptor_log_handler = procedure (user_data:pointer; message:Praptor_log_message);cdecl;
  Traptor_statement_handler = procedure (user_data:pointer; statement:Praptor_statement);cdecl;
type
  Praptor_graph_mark_flags = ^Traptor_graph_mark_flags;
  Traptor_graph_mark_flags =  Longint;
  Const
    RAPTOR_GRAPH_MARK_START = 1;
    RAPTOR_GRAPH_MARK_DECLARED = 2;
type
  Traptor_graph_mark_handler = procedure (user_data:pointer; graph:Praptor_uri; flags:longint);cdecl;
  Traptor_generate_bnodeid_handler = function (user_data:pointer; user_bnodeid:Pbyte):Pbyte;cdecl;
  Traptor_namespace_handler = procedure (user_data:pointer; nspace:Praptor_namespace);cdecl;
  Traptor_www_write_bytes_handler = procedure (www:Praptor_www; userdata:pointer; ptr:pointer; size:Tsize_t; nmemb:Tsize_t);cdecl;
  Traptor_www_content_type_handler = procedure (www:Praptor_www; userdata:pointer; content_type:Pchar);cdecl;
  Traptor_www_final_uri_handler = procedure (www:Praptor_www; userdata:pointer; final_uri:Praptor_uri);cdecl;
  Traptor_uri_filter_func = function (user_data:pointer; uri:Praptor_uri):longint;cdecl;
type
  Praptor_world_flag = ^Traptor_world_flag;
  Traptor_world_flag =  Longint;
  Const
    RAPTOR_WORLD_FLAG_LIBXML_GENERIC_ERROR_SAVE = 1;
    RAPTOR_WORLD_FLAG_LIBXML_STRUCTURED_ERROR_SAVE = 2;
    RAPTOR_WORLD_FLAG_URI_INTERNING = 3;
    RAPTOR_WORLD_FLAG_WWW_SKIP_INIT_FINISH = 4;
type
  Traptor_data_compare_arg_handler = function (data1:pointer; data2:pointer; user_data:pointer):longint;cdecl;
  Traptor_data_compare_handler = function (data1:pointer; data2:pointer):longint;cdecl;
  Traptor_data_malloc_handler = function (size:Tsize_t):pointer;cdecl;
  Traptor_data_free_handler = procedure (data:pointer);cdecl;
  Traptor_data_context_free_handler = procedure (context:pointer; obj:pointer);cdecl;
  Traptor_data_print_handler = function (object:pointer; fh:PFILE):longint;cdecl;
  Traptor_data_context_print_handler = function (context:pointer; obj:pointer; fh:PFILE):longint;cdecl;

function raptor_new_world : longint;

function raptor_new_world_internal(version_decimal:dword):Praptor_world;cdecl;external libraptor2;
function raptor_world_open(world:Praptor_world):longint;cdecl;external libraptor2;
procedure raptor_free_world(world:Praptor_world);cdecl;external libraptor2;
function raptor_world_set_libxslt_security_preferences(world:Praptor_world; security_preferences:pointer):longint;cdecl;external libraptor2;
function raptor_world_set_flag(world:Praptor_world; flag:Traptor_world_flag; value:longint):longint;cdecl;external libraptor2;
function raptor_world_set_log_handler(world:Praptor_world; user_data:pointer; handler:Traptor_log_handler):longint;cdecl;external libraptor2;
procedure raptor_world_set_generate_bnodeid_handler(world:Praptor_world; user_data:pointer; handler:Traptor_generate_bnodeid_handler);cdecl;external libraptor2;
function raptor_world_generate_bnodeid(world:Praptor_world):Pbyte;cdecl;external libraptor2;
procedure raptor_world_set_generate_bnodeid_parameters(world:Praptor_world; prefix:Pchar; base:longint);cdecl;external libraptor2;
function raptor_log_level_get_label(level:Traptor_log_level):Pchar;cdecl;external libraptor2;
function raptor_domain_get_label(domain:Traptor_domain):Pchar;cdecl;external libraptor2;
function raptor_world_is_parser_name(world:Praptor_world; name:Pchar):longint;cdecl;external libraptor2;
function raptor_world_guess_parser_name(world:Praptor_world; uri:Praptor_uri; mime_type:Pchar; buffer:Pbyte; len:Tsize_t; 
           identifier:Pbyte):Pchar;cdecl;external libraptor2;
function raptor_world_is_serializer_name(world:Praptor_world; name:Pchar):longint;cdecl;external libraptor2;
function raptor_world_get_parsers_count(world:Praptor_world):longint;cdecl;external libraptor2;
function raptor_world_get_serializers_count(world:Praptor_world):longint;cdecl;external libraptor2;
function raptor_world_get_parser_description(world:Praptor_world; counter:dword):Praptor_syntax_description;cdecl;external libraptor2;
function raptor_world_get_serializer_description(world:Praptor_world; counter:dword):Praptor_syntax_description;cdecl;external libraptor2;
function raptor_syntax_description_validate(desc:Praptor_syntax_description):longint;cdecl;external libraptor2;
function raptor_world_get_option_from_uri(world:Praptor_world; uri:Praptor_uri):Traptor_option;cdecl;external libraptor2;
function raptor_new_term_from_uri(world:Praptor_world; uri:Praptor_uri):Praptor_term;cdecl;external libraptor2;
function raptor_new_term_from_counted_uri_string(world:Praptor_world; uri_string:Pbyte; length:Tsize_t):Praptor_term;cdecl;external libraptor2;
function raptor_new_term_from_uri_string(world:Praptor_world; uri_string:Pbyte):Praptor_term;cdecl;external libraptor2;
function raptor_new_term_from_literal(world:Praptor_world; literal:Pbyte; datatype:Praptor_uri; language:Pbyte):Praptor_term;cdecl;external libraptor2;
function raptor_new_term_from_counted_literal(world:Praptor_world; literal:Pbyte; literal_len:Tsize_t; datatype:Praptor_uri; language:Pbyte; 
           language_len:byte):Praptor_term;cdecl;external libraptor2;
function raptor_new_term_from_blank(world:Praptor_world; blank:Pbyte):Praptor_term;cdecl;external libraptor2;
function raptor_new_term_from_counted_blank(world:Praptor_world; blank:Pbyte; length:Tsize_t):Praptor_term;cdecl;external libraptor2;
function raptor_new_term_from_counted_string(world:Praptor_world; _string:Pbyte; length:Tsize_t):Praptor_term;cdecl;external libraptor2;
function raptor_term_copy(term:Praptor_term):Praptor_term;cdecl;external libraptor2;
function raptor_term_compare(t1:Praptor_term; t2:Praptor_term):longint;cdecl;external libraptor2;
function raptor_term_equals(t1:Praptor_term; t2:Praptor_term):longint;cdecl;external libraptor2;
procedure raptor_free_term(term:Praptor_term);cdecl;external libraptor2;
function raptor_term_to_counted_string(term:Praptor_term; len_p:Psize_t):Pbyte;cdecl;external libraptor2;
function raptor_term_to_string(term:Praptor_term):Pbyte;cdecl;external libraptor2;
function raptor_term_escaped_write(term:Praptor_term; flags:dword; iostr:Praptor_iostream):longint;cdecl;external libraptor2;
function raptor_term_ntriples_write(term:Praptor_term; iostr:Praptor_iostream):longint;cdecl;external libraptor2;de
function raptor_uri_turtle_write(world:Praptor_world; iostr:Praptor_iostream; uri:Praptor_uri; nstack:Praptor_namespace_stack; base_uri:Praptor_uri):longint;cdecl;external libraptor2;
function raptor_term_turtle_write(iostr:Praptor_iostream; term:Praptor_term; nstack:Praptor_namespace_stack; base_uri:Praptor_uri):longint;cdecl;external libraptor2;
function raptor_uri_to_turtle_counted_string(world:Praptor_world; uri:Praptor_uri; nstack:Praptor_namespace_stack; base_uri:Praptor_uri; len_p:Psize_t):Pbyte;cdecl;external libraptor2;
function raptor_uri_to_turtle_string(world:Praptor_world; uri:Praptor_uri; nstack:Praptor_namespace_stack; base_uri:Praptor_uri):Pbyte;cdecl;external libraptor2;
function raptor_term_to_turtle_counted_string(term:Praptor_term; nstack:Praptor_namespace_stack; base_uri:Praptor_uri; len_p:Psize_t):Pbyte;cdecl;external libraptor2;
function raptor_term_to_turtle_string(term:Praptor_term; nstack:Praptor_namespace_stack; base_uri:Praptor_uri):Pbyte;cdecl;external libraptor2;
{ Statement Class  }
procedure raptor_statement_init(statement:Praptor_statement; world:Praptor_world);cdecl;external libraptor2;
procedure raptor_statement_clear(statement:Praptor_statement);cdecl;external libraptor2;
function raptor_new_statement(world:Praptor_world):Praptor_statement;cdecl;external libraptor2;
function raptor_new_statement_from_nodes(world:Praptor_world; subject:Praptor_term; predicate:Praptor_term; object:Praptor_term; graph:Praptor_term):Praptor_statement;cdecl;external libraptor2;
function raptor_statement_copy(statement:Praptor_statement):Praptor_statement;cdecl;external libraptor2;
procedure raptor_free_statement(statement:Praptor_statement);cdecl;external libraptor2;
function raptor_statement_print(statement:Praptor_statement; stream:PFILE):longint;cdecl;external libraptor2;
function raptor_statement_print_as_ntriples(statement:Praptor_statement; stream:PFILE):longint;cdecl;external libraptor2;
function raptor_statement_compare(s1:Praptor_statement; s2:Praptor_statement):longint;cdecl;external libraptor2;
function raptor_statement_equals(s1:Praptor_statement; s2:Praptor_statement):longint;cdecl;external libraptor2;
{ Parser Class  }
function raptor_new_parser(world:Praptor_world; name:Pchar):Praptor_parser;cdecl;external libraptor2;
function raptor_new_parser_for_content(world:Praptor_world; uri:Praptor_uri; mime_type:Pchar; buffer:Pbyte; len:Tsize_t; 
           identifier:Pbyte):Praptor_parser;cdecl;external libraptor2;
procedure raptor_free_parser(parser:Praptor_parser);cdecl;external libraptor2;
{ methods  }
{ Handlers  }
procedure raptor_parser_set_statement_handler(parser:Praptor_parser; user_data:pointer; handler:Traptor_statement_handler);cdecl;external libraptor2;
procedure raptor_parser_set_graph_mark_handler(parser:Praptor_parser; user_data:pointer; handler:Traptor_graph_mark_handler);cdecl;external libraptor2;
procedure raptor_parser_set_namespace_handler(parser:Praptor_parser; user_data:pointer; handler:Traptor_namespace_handler);cdecl;external libraptor2;
procedure raptor_parser_set_uri_filter(parser:Praptor_parser; filter:Traptor_uri_filter_func; user_data:pointer);cdecl;external libraptor2;
function raptor_parser_get_locator(rdf_parser:Praptor_parser):Praptor_locator;cdecl;external libraptor2;
{ Parsing functions  }
function raptor_parser_parse_start(rdf_parser:Praptor_parser; uri:Praptor_uri):longint;cdecl;external libraptor2;
function raptor_parser_parse_chunk(rdf_parser:Praptor_parser; buffer:Pbyte; len:Tsize_t; is_end:longint):longint;cdecl;external libraptor2;
function raptor_parser_parse_file_stream(rdf_parser:Praptor_parser; stream:PFILE; filename:Pchar; base_uri:Praptor_uri):longint;cdecl;external libraptor2;
function raptor_parser_parse_file(rdf_parser:Praptor_parser; uri:Praptor_uri; base_uri:Praptor_uri):longint;cdecl;external libraptor2;
function raptor_parser_parse_uri(rdf_parser:Praptor_parser; uri:Praptor_uri; base_uri:Praptor_uri):longint;cdecl;external libraptor2;
function raptor_parser_parse_uri_with_connection(rdf_parser:Praptor_parser; uri:Praptor_uri; base_uri:Praptor_uri; connection:pointer):longint;cdecl;external libraptor2;
function raptor_parser_parse_iostream(rdf_parser:Praptor_parser; iostr:Praptor_iostream; base_uri:Praptor_uri):longint;cdecl;external libraptor2;
procedure raptor_parser_parse_abort(rdf_parser:Praptor_parser);cdecl;external libraptor2;
function raptor_parser_get_name(rdf_parser:Praptor_parser):Pchar;cdecl;external libraptor2;
function raptor_parser_get_description(rdf_parser:Praptor_parser):Praptor_syntax_description;cdecl;external libraptor2;
{ parser option methods  }
function raptor_parser_set_option(parser:Praptor_parser; option:Traptor_option; _string:Pchar; integer:longint):longint;cdecl;external libraptor2;
function raptor_parser_get_option(parser:Praptor_parser; option:Traptor_option; string_p:PPchar; integer_p:Plongint):longint;cdecl;external libraptor2;
{ parser utility methods  }
function raptor_parser_get_accept_header(rdf_parser:Praptor_parser):Pchar;cdecl;external libraptor2;
function raptor_parser_get_world(rdf_parser:Praptor_parser):Praptor_world;cdecl;external libraptor2;
function raptor_parser_get_graph(rdf_parser:Praptor_parser):Praptor_uri;cdecl;external libraptor2;
{ Locator Class  }
{ methods  }
function raptor_locator_print(locator:Praptor_locator; stream:PFILE):longint;cdecl;external libraptor2;
function raptor_locator_format(buffer:Pchar; length:Tsize_t; locator:Praptor_locator):longint;cdecl;external libraptor2;
function raptor_locator_line(locator:Praptor_locator):longint;cdecl;external libraptor2;
function raptor_locator_column(locator:Praptor_locator):longint;cdecl;external libraptor2;
function raptor_locator_byte(locator:Praptor_locator):longint;cdecl;external libraptor2;
function raptor_locator_file(locator:Praptor_locator):Pchar;cdecl;external libraptor2;
function raptor_locator_uri(locator:Praptor_locator):Pchar;cdecl;external libraptor2;
{ Serializer Class  }
function raptor_new_serializer(world:Praptor_world; name:Pchar):Praptor_serializer;cdecl;external libraptor2;
procedure raptor_free_serializer(rdf_serializer:Praptor_serializer);cdecl;external libraptor2;
{ methods  }
function raptor_serializer_start_to_iostream(rdf_serializer:Praptor_serializer; uri:Praptor_uri; iostream:Praptor_iostream):longint;cdecl;external libraptor2;
function raptor_serializer_start_to_filename(rdf_serializer:Praptor_serializer; filename:Pchar):longint;cdecl;external libraptor2;
function raptor_serializer_start_to_string(rdf_serializer:Praptor_serializer; uri:Praptor_uri; string_p:Ppointer; length_p:Psize_t):longint;cdecl;external libraptor2;
function raptor_serializer_start_to_file_handle(rdf_serializer:Praptor_serializer; uri:Praptor_uri; fh:PFILE):longint;cdecl;external libraptor2;
function raptor_serializer_set_namespace(rdf_serializer:Praptor_serializer; uri:Praptor_uri; prefix:Pbyte):longint;cdecl;external libraptor2;
function raptor_serializer_set_namespace_from_namespace(rdf_serializer:Praptor_serializer; nspace:Praptor_namespace):longint;cdecl;external libraptor2;
function raptor_serializer_serialize_statement(rdf_serializer:Praptor_serializer; statement:Praptor_statement):longint;cdecl;external libraptor2;
function raptor_serializer_serialize_end(rdf_serializer:Praptor_serializer):longint;cdecl;external libraptor2;
function raptor_serializer_get_iostream(serializer:Praptor_serializer):Praptor_iostream;cdecl;external libraptor2;
function raptor_serializer_get_locator(rdf_serializer:Praptor_serializer):Praptor_locator;cdecl;external libraptor2;
function raptor_serializer_flush(rdf_serializer:Praptor_serializer):longint;cdecl;external libraptor2;
function raptor_serializer_get_description(rdf_serializer:Praptor_serializer):Praptor_syntax_description;cdecl;external libraptor2;
{ serializer option methods  }
function raptor_serializer_set_option(serializer:Praptor_serializer; option:Traptor_option; _string:Pchar; integer:longint):longint;cdecl;external libraptor2;
function raptor_serializer_get_option(serializer:Praptor_serializer; option:Traptor_option; string_p:PPchar; integer_p:Plongint):longint;cdecl;external libraptor2;
{ utility methods  }
function raptor_serializer_get_world(rdf_serializer:Praptor_serializer):Praptor_world;cdecl;external libraptor2;
{ memory functions  }
procedure raptor_free_memory(ptr:pointer);cdecl;external libraptor2;
function raptor_alloc_memory(size:Tsize_t):pointer;cdecl;external libraptor2;
function raptor_calloc_memory(nmemb:Tsize_t; size:Tsize_t):pointer;cdecl;external libraptor2;
{ URI Class  }
function raptor_new_uri_from_counted_string(world:Praptor_world; uri_string:Pbyte; length:Tsize_t):Praptor_uri;cdecl;external libraptor2;
function raptor_new_uri(world:Praptor_world; uri_string:Pbyte):Praptor_uri;cdecl;external libraptor2;
function raptor_new_uri_from_uri_local_name(world:Praptor_world; uri:Praptor_uri; local_name:Pbyte):Praptor_uri;cdecl;external libraptor2;
function raptor_new_uri_relative_to_base(world:Praptor_world; base_uri:Praptor_uri; uri_string:Pbyte):Praptor_uri;cdecl;external libraptor2;
function raptor_new_uri_relative_to_base_counted(world:Praptor_world; base_uri:Praptor_uri; uri_string:Pbyte; uri_len:Tsize_t):Praptor_uri;cdecl;external libraptor2;
function raptor_new_uri_from_id(world:Praptor_world; base_uri:Praptor_uri; id:Pbyte):Praptor_uri;cdecl;external libraptor2;
function raptor_new_uri_from_uri_or_file_string(world:Praptor_world; base_uri:Praptor_uri; uri_or_file_string:Pbyte):Praptor_uri;cdecl;external libraptor2;
function raptor_new_uri_for_rdf_concept(world:Praptor_world; name:Pbyte):Praptor_uri;cdecl;external libraptor2;
function raptor_new_uri_for_xmlbase(old_uri:Praptor_uri):Praptor_uri;cdecl;external libraptor2;
function raptor_new_uri_for_retrieval(old_uri:Praptor_uri):Praptor_uri;cdecl;external libraptor2;
procedure raptor_free_uri(uri:Praptor_uri);cdecl;external libraptor2;
{ methods  }
function raptor_uri_equals(uri1:Praptor_uri; uri2:Praptor_uri):longint;cdecl;external libraptor2;
function raptor_uri_compare(uri1:Praptor_uri; uri2:Praptor_uri):longint;cdecl;external libraptor2;
function raptor_uri_copy(uri:Praptor_uri):Praptor_uri;cdecl;external libraptor2;
function raptor_uri_as_string(uri:Praptor_uri):Pbyte;cdecl;external libraptor2;
function raptor_uri_as_counted_string(uri:Praptor_uri; len_p:Psize_t):Pbyte;cdecl;external libraptor2;
function raptor_uri_to_relative_counted_uri_string(base_uri:Praptor_uri; reference_uri:Praptor_uri; length_p:Psize_t):Pbyte;cdecl;external libraptor2;
function raptor_uri_to_relative_uri_string(base_uri:Praptor_uri; reference_uri:Praptor_uri):Pbyte;cdecl;external libraptor2;
function raptor_uri_print(uri:Praptor_uri; stream:PFILE):longint;cdecl;external libraptor2;
function raptor_uri_to_counted_string(uri:Praptor_uri; len_p:Psize_t):Pbyte;cdecl;external libraptor2;
function raptor_uri_to_string(uri:Praptor_uri):Pbyte;cdecl;external libraptor2;
function raptor_uri_get_world(uri:Praptor_uri):Praptor_world;cdecl;external libraptor2;
function raptor_uri_file_exists(uri:Praptor_uri):longint;cdecl;external libraptor2;
function raptor_uri_escaped_write(uri:Praptor_uri; base_uri:Praptor_uri; flags:dword; iostr:Praptor_iostream):longint;cdecl;external libraptor2;
{ XML utility functions  }
function raptor_xml_escape_string_any(world:Praptor_world; _string:Pbyte; len:Tsize_t; buffer:Pbyte; length:Tsize_t; 
           quote:char; xml_version:longint):longint;cdecl;external libraptor2;
function raptor_xml_escape_string_any_write(_string:Pbyte; len:Tsize_t; quote:char; xml_version:longint; iostr:Praptor_iostream):longint;cdecl;external libraptor2;
function raptor_xml_escape_string(world:Praptor_world; _string:Pbyte; len:Tsize_t; buffer:Pbyte; length:Tsize_t; 
           quote:char):longint;cdecl;external libraptor2;
function raptor_xml_escape_string_write(_string:Pbyte; len:Tsize_t; quote:char; iostr:Praptor_iostream):longint;cdecl;external libraptor2;
function raptor_xml_name_check(_string:Pbyte; length:Tsize_t; xml_version:longint):longint;cdecl;external libraptor2;
{ portable vsnprintf utility function  }
{ RAPTOR_DEPRECATED }
function raptor_vsnprintf(format:Pchar; arguments:Tva_list):Pchar;cdecl;external libraptor2;
function raptor_vsnprintf2(buffer:Pchar; size:Tsize_t; format:Pchar; arguments:Tva_list):longint;cdecl;external libraptor2;
function raptor_snprintf(buffer:Pchar; size:Tsize_t; format:Pchar; args:array of const):longint;cdecl;external libraptor2;
function raptor_snprintf(buffer:Pchar; size:Tsize_t; format:Pchar):longint;cdecl;external libraptor2;
function raptor_vasprintf(ret:PPchar; format:Pchar; arguments:Tva_list):longint;cdecl;external libraptor2;
{ RFC2396 URI resolving functions  }
function raptor_uri_resolve_uri_reference(base_uri:Pbyte; reference_uri:Pbyte; buffer:Pbyte; length:Tsize_t):Tsize_t;cdecl;external libraptor2;
{ URI String utility functions  }
function raptor_uri_counted_filename_to_uri_string(filename:Pchar; filename_len:Tsize_t):Pbyte;cdecl;external libraptor2;
function raptor_uri_filename_to_uri_string(filename:Pchar):Pbyte;cdecl;external libraptor2;
function raptor_uri_filename_exists(path:Pbyte):longint;cdecl;external libraptor2;
function raptor_uri_uri_string_to_filename(uri_string:Pbyte):Pchar;cdecl;external libraptor2;
function raptor_uri_uri_string_to_filename_fragment(uri_string:Pbyte; fragment_p:PPbyte):Pchar;cdecl;external libraptor2;
function raptor_uri_uri_string_is_file_uri(uri_string:Pbyte):longint;cdecl;external libraptor2;
function raptor_stringbuffer_append_uri_escaped_counted_string(sb:Praptor_stringbuffer; _string:Pchar; length:Tsize_t; space_is_plus:longint):longint;cdecl;external libraptor2;
function raptor_uri_uri_string_to_counted_filename_fragment(uri_string:Pbyte; len_p:Psize_t; fragment_p:PPbyte; fragment_len_p:Psize_t):Pchar;cdecl;external libraptor2;
function raptor_uri_uri_string_is_absolute(uri_string:Pbyte):longint;cdecl;external libraptor2;
{*
 * RAPTOR_RDF_MS_URI:
 *
 * RDF Namespace URI (rdf:).
 *
 * Copy with raptor_uri_copy() to use.
  }
const
  RAPTOR_RDF_MS_URI = raptor_rdf_namespace_uri;  
{*
 * RAPTOR_RDF_SCHEMA_URI:
 *
 * RDF Schema Namespace URI (rdfs:).
 *
 * Copy with raptor_uri_copy() to use.
  }
  RAPTOR_RDF_SCHEMA_URI = raptor_rdf_schema_namespace_uri;  
{*
 * RAPTOR_XMLSCHEMA_DATATYPES_URI:
 *
 * XML Schema Datatypes URI (xsd:).
 *
 * Copy with raptor_uri_copy() to use.
  }
  RAPTOR_XMLSCHEMA_DATATYPES_URI = raptor_xmlschema_datatypes_namespace_uri;  
{*
 * RAPTOR_OWL_URI:
 *
 * OWL Namespace URI (owl:).
 *
 * Copy with raptor_uri_copy() to use.
  }
  RAPTOR_OWL_URI = raptor_owl_namespace_uri;  
{ raptor_www  }

function raptor_new_www(world:Praptor_world):Praptor_www;cdecl;external libraptor2;
function raptor_new_www_with_connection(world:Praptor_world; connection:pointer):Praptor_www;cdecl;external libraptor2;
procedure raptor_free_www(www:Praptor_www);cdecl;external libraptor2;
function raptor_www_set_ssl_cert_options(www:Praptor_www; cert_filename:Pchar; cert_type:Pchar; cert_passphrase:Pchar):longint;cdecl;external libraptor2;
function raptor_www_set_ssl_verify_options(www:Praptor_www; verify_peer:longint; verify_host:longint):longint;cdecl;external libraptor2;
function raptor_www_set_user_agent2(www:Praptor_www; user_agent:Pchar; user_agent_len:Tsize_t):longint;cdecl;external libraptor2;
{ RAPTOR_DEPRECATED }
procedure raptor_www_set_user_agent(www:Praptor_www; user_agent:Pchar);cdecl;external libraptor2;
function raptor_www_set_proxy2(www:Praptor_www; proxy:Pchar; proxy_len:Tsize_t):longint;cdecl;external libraptor2;
{ RAPTOR_DEPRECATED }
procedure raptor_www_set_proxy(www:Praptor_www; proxy:Pchar);cdecl;external libraptor2;
function raptor_www_set_http_accept2(www:Praptor_www; value:Pchar; value_len:Tsize_t):longint;cdecl;external libraptor2;
{ RAPTOR_DEPRECATED }
procedure raptor_www_set_http_accept(www:Praptor_www; value:Pchar);cdecl;external libraptor2;
procedure raptor_www_set_write_bytes_handler(www:Praptor_www; handler:Traptor_www_write_bytes_handler; user_data:pointer);cdecl;external libraptor2;
procedure raptor_www_set_content_type_handler(www:Praptor_www; handler:Traptor_www_content_type_handler; user_data:pointer);cdecl;external libraptor2;
procedure raptor_www_set_final_uri_handler(www:Praptor_www; handler:Traptor_www_final_uri_handler; user_data:pointer);cdecl;external libraptor2;
procedure raptor_www_set_uri_filter(www:Praptor_www; filter:Traptor_uri_filter_func; user_data:pointer);cdecl;external libraptor2;
procedure raptor_www_set_connection_timeout(www:Praptor_www; timeout:longint);cdecl;external libraptor2;
function raptor_www_set_http_cache_control(www:Praptor_www; cache_control:Pchar):longint;cdecl;external libraptor2;
function raptor_www_fetch(www:Praptor_www; uri:Praptor_uri):longint;cdecl;external libraptor2;
function raptor_www_fetch_to_string(www:Praptor_www; uri:Praptor_uri; string_p:Ppointer; length_p:Psize_t; malloc_handler:Traptor_data_malloc_handler):longint;cdecl;external libraptor2;
function raptor_www_get_connection(www:Praptor_www):pointer;cdecl;external libraptor2;
procedure raptor_www_abort(www:Praptor_www; reason:Pchar);cdecl;external libraptor2;
function raptor_www_get_final_uri(www:Praptor_www):Praptor_uri;cdecl;external libraptor2;
{ XML QNames Class  }
function raptor_new_qname(nstack:Praptor_namespace_stack; name:Pbyte; value:Pbyte):Praptor_qname;cdecl;external libraptor2;
function raptor_new_qname_from_namespace_local_name(world:Praptor_world; ns:Praptor_namespace; local_name:Pbyte; value:Pbyte):Praptor_qname;cdecl;external libraptor2;
{ methods  }
function raptor_qname_copy(qname:Praptor_qname):Praptor_qname;cdecl;external libraptor2;
procedure raptor_free_qname(name:Praptor_qname);cdecl;external libraptor2;
function raptor_qname_equal(name1:Praptor_qname; name2:Praptor_qname):longint;cdecl;external libraptor2;
function raptor_qname_to_counted_name(qname:Praptor_qname; length_p:Psize_t):Pbyte;cdecl;external libraptor2;
function raptor_qname_get_namespace(name:Praptor_qname):Praptor_namespace;cdecl;external libraptor2;
function raptor_qname_get_local_name(name:Praptor_qname):Pbyte;cdecl;external libraptor2;
function raptor_qname_get_value(name:Praptor_qname):Pbyte;cdecl;external libraptor2;
function raptor_qname_get_counted_value(name:Praptor_qname; length_p:Psize_t):Pbyte;cdecl;external libraptor2;
function raptor_qname_write(qname:Praptor_qname; iostr:Praptor_iostream):longint;cdecl;external libraptor2;
{ QName String utility functions  }
function raptor_qname_string_to_uri(nstack:Praptor_namespace_stack; name:Pbyte; name_len:Tsize_t):Praptor_uri;cdecl;external libraptor2;
function raptor_qname_format_as_xml(qname:Praptor_qname; length_p:Psize_t):Pbyte;cdecl;external libraptor2;
{ XML Namespaces Stack class  }
function raptor_new_namespace_from_uri(nstack:Praptor_namespace_stack; prefix:Pbyte; ns_uri:Praptor_uri; depth:longint):Praptor_namespace;cdecl;external libraptor2;
function raptor_new_namespaces(world:Praptor_world; defaults:longint):Praptor_namespace_stack;cdecl;external libraptor2;
function raptor_namespaces_init(world:Praptor_world; nstack:Praptor_namespace_stack; defaults:longint):longint;cdecl;external libraptor2;
procedure raptor_namespaces_clear(nstack:Praptor_namespace_stack);cdecl;external libraptor2;
procedure raptor_free_namespaces(nstack:Praptor_namespace_stack);cdecl;external libraptor2;
{ methods  }
procedure raptor_namespaces_start_namespace(nstack:Praptor_namespace_stack; nspace:Praptor_namespace);cdecl;external libraptor2;
function raptor_namespaces_start_namespace_full(nstack:Praptor_namespace_stack; prefix:Pbyte; ns_uri_string:Pbyte; depth:longint):longint;cdecl;external libraptor2;
procedure raptor_namespaces_end_for_depth(nstack:Praptor_namespace_stack; depth:longint);cdecl;external libraptor2;
function raptor_namespaces_get_default_namespace(nstack:Praptor_namespace_stack):Praptor_namespace;cdecl;external libraptor2;
function raptor_namespaces_find_namespace(nstack:Praptor_namespace_stack; prefix:Pbyte; prefix_length:longint):Praptor_namespace;cdecl;external libraptor2;
function raptor_namespaces_find_namespace_by_uri(nstack:Praptor_namespace_stack; ns_uri:Praptor_uri):Praptor_namespace;cdecl;external libraptor2;
function raptor_namespaces_namespace_in_scope(nstack:Praptor_namespace_stack; nspace:Praptor_namespace):longint;cdecl;external libraptor2;
function raptor_new_qname_from_namespace_uri(nstack:Praptor_namespace_stack; uri:Praptor_uri; xml_version:longint):Praptor_qname;cdecl;external libraptor2;
{ XML Namespace Class  }
function raptor_new_namespace(nstack:Praptor_namespace_stack; prefix:Pbyte; ns_uri_string:Pbyte; depth:longint):Praptor_namespace;cdecl;external libraptor2;
procedure raptor_free_namespace(ns:Praptor_namespace);cdecl;external libraptor2;
function raptor_namespace_stack_start_namespace(nstack:Praptor_namespace_stack; ns:Praptor_namespace; new_depth:longint):longint;cdecl;external libraptor2;
function raptor_namespace_get_uri(ns:Praptor_namespace):Praptor_uri;cdecl;external libraptor2;
function raptor_namespace_get_prefix(ns:Praptor_namespace):Pbyte;cdecl;external libraptor2;
function raptor_namespace_get_counted_prefix(ns:Praptor_namespace; length_p:Psize_t):Pbyte;cdecl;external libraptor2;
function raptor_namespace_format_as_xml(ns:Praptor_namespace; length_p:Psize_t):Pbyte;cdecl;external libraptor2;
function raptor_namespace_write(ns:Praptor_namespace; iostr:Praptor_iostream):longint;cdecl;external libraptor2;
{ namespace string utility function  }
function raptor_xml_namespace_string_parse(_string:Pbyte; prefix:PPbyte; uri_string:PPbyte):longint;cdecl;external libraptor2;
{ Sequence class  }
{*
 * raptor_sequence:
 *
 * Raptor sequence class
  }
type
  Traptor_sequence_s = Traptor_sequence;
{ Sequence Class  }

function raptor_new_sequence(free_handler:Traptor_data_free_handler; print_handler:Traptor_data_print_handler):Praptor_sequence;cdecl;external libraptor2;
function raptor_new_sequence_with_context(free_handler:Traptor_data_context_free_handler; print_handler:Traptor_data_context_print_handler; handler_context:pointer):Praptor_sequence;cdecl;external libraptor2;
procedure raptor_free_sequence(seq:Praptor_sequence);cdecl;external libraptor2;
{ methods  }
function raptor_sequence_size(seq:Praptor_sequence):longint;cdecl;external libraptor2;
function raptor_sequence_set_at(seq:Praptor_sequence; idx:longint; data:pointer):longint;cdecl;external libraptor2;
function raptor_sequence_push(seq:Praptor_sequence; data:pointer):longint;cdecl;external libraptor2;
function raptor_sequence_shift(seq:Praptor_sequence; data:pointer):longint;cdecl;external libraptor2;
function raptor_sequence_get_at(seq:Praptor_sequence; idx:longint):pointer;cdecl;external libraptor2;
function raptor_sequence_pop(seq:Praptor_sequence):pointer;cdecl;external libraptor2;
function raptor_sequence_unshift(seq:Praptor_sequence):pointer;cdecl;external libraptor2;
function raptor_sequence_delete_at(seq:Praptor_sequence; idx:longint):pointer;cdecl;external libraptor2;
procedure raptor_sequence_sort(seq:Praptor_sequence; compare:Traptor_data_compare_handler);cdecl;external libraptor2;
procedure raptor_sequence_sort_r(seq:Praptor_sequence; compare:Traptor_data_compare_arg_handler; user_data:pointer);cdecl;external libraptor2;
function raptor_sequence_swap(seq:Praptor_sequence; i:longint; j:longint):longint;cdecl;external libraptor2;
function raptor_sequence_reverse(seq:Praptor_sequence; start_index:longint; length:longint):longint;cdecl;external libraptor2;
function raptor_sequence_next_permutation(seq:Praptor_sequence; compare:Traptor_data_compare_handler):longint;cdecl;external libraptor2;
{ helper for printing sequences of strings  }function raptor_sequence_print(seq:Praptor_sequence; fh:PFILE):longint;cdecl;external libraptor2;
function raptor_sequence_join(dest:Praptor_sequence; src:Praptor_sequence):longint;cdecl;external libraptor2;
{ Unicode and UTF8  }
{*
 * raptor_unichar:
 *
 * raptor Unicode codepoint
  }
type
  Praptor_unichar = ^Traptor_unichar;
  Traptor_unichar = dword;

function raptor_unicode_utf8_string_put_char(c:Traptor_unichar; output:Pbyte; length:Tsize_t):longint;cdecl;external libraptor2;
function raptor_unicode_utf8_string_get_char(input:Pbyte; length:Tsize_t; output:Praptor_unichar):longint;cdecl;external libraptor2;
function raptor_unicode_is_xml11_namestartchar(c:Traptor_unichar):longint;cdecl;external libraptor2;
function raptor_unicode_is_xml10_namestartchar(c:Traptor_unichar):longint;cdecl;external libraptor2;
function raptor_unicode_is_xml11_namechar(c:Traptor_unichar):longint;cdecl;external libraptor2;
function raptor_unicode_is_xml10_namechar(c:Traptor_unichar):longint;cdecl;external libraptor2;
function raptor_unicode_check_utf8_string(_string:Pbyte; length:Tsize_t):longint;cdecl;external libraptor2;
function raptor_unicode_utf8_strlen(_string:Pbyte; length:Tsize_t):longint;cdecl;external libraptor2;
function raptor_unicode_utf8_substr(dest:Pbyte; dest_length_p:Psize_t; src:Pbyte; src_length:Tsize_t; startingLoc:longint; 
           length:longint):Tsize_t;cdecl;external libraptor2;
{ Stringbuffer Class  }
function raptor_new_stringbuffer:Praptor_stringbuffer;cdecl;external libraptor2;
procedure raptor_free_stringbuffer(stringbuffer:Praptor_stringbuffer);cdecl;external libraptor2;
{ methods  }
function raptor_stringbuffer_append_counted_string(stringbuffer:Praptor_stringbuffer; _string:Pbyte; length:Tsize_t; do_copy:longint):longint;cdecl;external libraptor2;
function raptor_stringbuffer_append_string(stringbuffer:Praptor_stringbuffer; _string:Pbyte; do_copy:longint):longint;cdecl;external libraptor2;
function raptor_stringbuffer_append_decimal(stringbuffer:Praptor_stringbuffer; integer:longint):longint;cdecl;external libraptor2;
function raptor_stringbuffer_append_hexadecimal(stringbuffer:Praptor_stringbuffer; hex:longint):longint;cdecl;external libraptor2;
function raptor_stringbuffer_append_stringbuffer(stringbuffer:Praptor_stringbuffer; append:Praptor_stringbuffer):longint;cdecl;external libraptor2;
function raptor_stringbuffer_prepend_counted_string(stringbuffer:Praptor_stringbuffer; _string:Pbyte; length:Tsize_t; do_copy:longint):longint;cdecl;external libraptor2;
function raptor_stringbuffer_prepend_string(stringbuffer:Praptor_stringbuffer; _string:Pbyte; do_copy:longint):longint;cdecl;external libraptor2;
function raptor_stringbuffer_as_string(stringbuffer:Praptor_stringbuffer):Pbyte;cdecl;external libraptor2;
function raptor_stringbuffer_length(stringbuffer:Praptor_stringbuffer):Tsize_t;cdecl;external libraptor2;
function raptor_stringbuffer_copy_to_string(stringbuffer:Praptor_stringbuffer; _string:Pbyte; length:Tsize_t):longint;cdecl;external libraptor2;
{*
 * raptor_iostream_init_func:
 * @context: stream context data
 *
 * Handler function for #raptor_iostream initialising.
 *
 * Return value: non-0 on failure.
  }
type

  Traptor_iostream_init_func = function (context:pointer):longint;cdecl;
{*
 * raptor_iostream_finish_func:
 * @context: stream context data
 *
 * Handler function for #raptor_iostream terminating.
 *
  }

  Traptor_iostream_finish_func = procedure (context:pointer);cdecl;
{*
 * raptor_iostream_write_byte_func
 * @context: stream context data
 * @byte: byte to write
 *
 * Handler function for implementing raptor_iostream_write_byte().
 *
 * Return value: non-0 on failure.
  }

  Traptor_iostream_write_byte_func = function (context:pointer; byte:longint):longint;cdecl;
{*
 * raptor_iostream_write_bytes_func:
 * @context: stream context data
 * @ptr: pointer to bytes to write
 * @size: size of item
 * @nmemb: number of items
 *
 * Handler function for implementing raptor_iostream_write_bytes().
 *
 * Return value: non-0 on failure.
  }

  Traptor_iostream_write_bytes_func = function (context:pointer; ptr:pointer; size:Tsize_t; nmemb:Tsize_t):longint;cdecl;
{*
 * raptor_iostream_write_end_func:
 * @context: stream context data
 *
 * Handler function for implementing raptor_iostream_write_end().
 *
 * Return value: non-0 on failure.
  }

  Traptor_iostream_write_end_func = function (context:pointer):longint;cdecl;
{*
 * raptor_iostream_read_bytes_func:
 * @context: stream context data
 * @ptr: pointer to buffer to read into
 * @size: size of buffer
 * @nmemb: number of items
 *
 * Handler function for implementing raptor_iostream_read_bytes().
 *
 * Return value: number of items read, 0 or < @size on EOF, <0 on failure
  }

  Traptor_iostream_read_bytes_func = function (context:pointer; ptr:pointer; size:Tsize_t; nmemb:Tsize_t):longint;cdecl;
{*
 * raptor_iostream_read_eof_func:
 * @context: stream context data
 *
 * Handler function for implementing raptor_iostream_read_eof().
 *
 * Return value: non-0 if EOF
  }

  Traptor_iostream_read_eof_func = function (context:pointer):longint;cdecl;
{*
 * raptor_iostream_handler:
 * @version: interface version.  Presently 1 or 2.
 * @init:  initialisation handler - optional, called at most once (V1)
 * @finish: finishing handler -  optional, called at most once (V1)
 * @write_byte: write byte handler - required (for writing) (V1)
 * @write_bytes: write bytes handler - required (for writing) (V1)
 * @write_end: write end handler - optional (for writing), called at most once (V1)
 * @read_bytes: read bytes handler - required (for reading) (V2)
 * @read_eof: read EOF handler - required (for reading) (V2)
 *
 * I/O stream implementation handler structure.
 * 
  }
{ V1 functions  }
{ V2 functions  }

  Praptor_iostream_handler = ^Traptor_iostream_handler;
  Traptor_iostream_handler = record
      version : longint;
      init : Traptor_iostream_init_func;
      finish : Traptor_iostream_finish_func;
      write_byte : Traptor_iostream_write_byte_func;
      write_bytes : Traptor_iostream_write_bytes_func;
      write_end : Traptor_iostream_write_end_func;
      read_bytes : Traptor_iostream_read_bytes_func;
      read_eof : Traptor_iostream_read_eof_func;
    end;
{ I/O Stream Class  }

function raptor_new_iostream_from_handler(world:Praptor_world; user_data:pointer; handler:Praptor_iostream_handler):Praptor_iostream;cdecl;external libraptor2;
function raptor_new_iostream_to_sink(world:Praptor_world):Praptor_iostream;cdecl;external libraptor2;
function raptor_new_iostream_to_filename(world:Praptor_world; filename:Pchar):Praptor_iostream;cdecl;external libraptor2;
function raptor_new_iostream_to_file_handle(world:Praptor_world; handle:PFILE):Praptor_iostream;cdecl;external libraptor2;
function raptor_new_iostream_to_string(world:Praptor_world; string_p:Ppointer; length_p:Psize_t; malloc_handler:Traptor_data_malloc_handler):Praptor_iostream;cdecl;external libraptor2;
function raptor_new_iostream_from_sink(world:Praptor_world):Praptor_iostream;cdecl;external libraptor2;
function raptor_new_iostream_from_filename(world:Praptor_world; filename:Pchar):Praptor_iostream;cdecl;external libraptor2;
function raptor_new_iostream_from_file_handle(world:Praptor_world; handle:PFILE):Praptor_iostream;cdecl;external libraptor2;
function raptor_new_iostream_from_string(world:Praptor_world; _string:pointer; length:Tsize_t):Praptor_iostream;cdecl;external libraptor2;
procedure raptor_free_iostream(iostr:Praptor_iostream);cdecl;external libraptor2;
function raptor_iostream_write_bytes(ptr:pointer; size:Tsize_t; nmemb:Tsize_t; iostr:Praptor_iostream):longint;cdecl;external libraptor2;
function raptor_iostream_write_byte(byte:longint; iostr:Praptor_iostream):longint;cdecl;external libraptor2;
function raptor_iostream_write_end(iostr:Praptor_iostream):longint;cdecl;external libraptor2;
function raptor_iostream_string_write(_string:pointer; iostr:Praptor_iostream):longint;cdecl;external libraptor2;
function raptor_iostream_counted_string_write(_string:pointer; len:Tsize_t; iostr:Praptor_iostream):longint;cdecl;external libraptor2;
function raptor_iostream_tell(iostr:Praptor_iostream):dword;cdecl;external libraptor2;
function raptor_iostream_decimal_write(integer:longint; iostr:Praptor_iostream):longint;cdecl;external libraptor2;
function raptor_iostream_hexadecimal_write(integer:dword; width:longint; iostr:Praptor_iostream):longint;cdecl;external libraptor2;
function raptor_stringbuffer_write(sb:Praptor_stringbuffer; iostr:Praptor_iostream):longint;cdecl;external libraptor2;
function raptor_uri_write(uri:Praptor_uri; iostr:Praptor_iostream):longint;cdecl;external libraptor2;
function raptor_iostream_read_bytes(ptr:pointer; size:Tsize_t; nmemb:Tsize_t; iostr:Praptor_iostream):longint;cdecl;external libraptor2;
function raptor_iostream_read_eof(iostr:Praptor_iostream):longint;cdecl;external libraptor2;
{ I/O Stream utility functions  }
{*
 * raptor_escaped_write_bitflags:
 * @RAPTOR_ESCAPED_WRITE_BITFLAG_BS_ESCAPES_BF   : Allow \b \f,
 * @RAPTOR_ESCAPED_WRITE_BITFLAG_BS_ESCAPES_TNRU : Allow \t \n \r \u \U
 * @RAPTOR_ESCAPED_WRITE_BITFLAG_UTF8            : Use UTF-8 instead of \u \U for U+0080 or larger (will always use \u for U+0000..U+001F and U+007F)
 * @RAPTOR_ESCAPED_WRITE_BITFLAG_SPARQL_URI_ESCAPES: Must escape #x00-#x20<>\"|^` in URIs
 * @RAPTOR_ESCAPED_WRITE_NTRIPLES_LITERAL: N-Triples literal
 * @RAPTOR_ESCAPED_WRITE_NTRIPLES_URI: N-Triples URI
 * @RAPTOR_ESCAPED_WRITE_SPARQL_LITERAL: SPARQL literal: allows raw UTF8 for printable literals
 * @RAPTOR_ESCAPED_WRITE_SPARQL_LONG_LITERAL: SPARQL long literal: no BS-escapes allowed
 * @RAPTOR_ESCAPED_WRITE_SPARQL_URI: SPARQL uri: have to escape certain characters 
 * @RAPTOR_ESCAPED_WRITE_TURTLE_URI: Turtle 2013 URIs (like SPARQL)
 * @RAPTOR_ESCAPED_WRITE_TURTLE_LITERAL: Turtle 2013 literals (like SPARQL)
 * @RAPTOR_ESCAPED_WRITE_TURTLE_LONG_LITERAL: Turtle 2013 long literals (like SPARQL)
 * @RAPTOR_ESCAPED_WRITE_JSON_LITERAL: JSON literals: UTF-8 plus \b \f \t \r \n, \uXXXX only, no \U
 *
 * Bit flags for raptor_string_escaped_write() and friends.
  }
{ N-Triples - favour writing \u, \U over UTF8  }
{ SPARQL literal: allows raw UTF8 for printable literals  }
{ SPARQL long literal: no BS-escapes allowed  }
{ SPARQL uri: have to escape certain characters  }
{ Turtle (2013) escapes are like SPARQL  }
{ JSON literals: UTF-8 plus \b \f \t \r \n \uXXXX  }
type
  Praptor_escaped_write_bitflags = ^Traptor_escaped_write_bitflags;
  Traptor_escaped_write_bitflags =  Longint;
  Const
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
;

function raptor_string_ntriples_write(_string:Pbyte; len:Tsize_t; delim:char; iostr:Praptor_iostream):longint;cdecl;external libraptor2;
function raptor_bnodeid_ntriples_write(bnodeid:Pbyte; len:Tsize_t; iostr:Praptor_iostream):longint;cdecl;external libraptor2;
{ RAPTOR_DEPRECATED }
function raptor_string_python_write(_string:Pbyte; len:Tsize_t; delim:char; mode:dword; iostr:Praptor_iostream):longint;cdecl;external libraptor2;
function raptor_statement_ntriples_write(statement:Praptor_statement; iostr:Praptor_iostream; write_graph_term:longint):longint;cdecl;external libraptor2;
function raptor_string_escaped_write(_string:Pbyte; len:Tsize_t; delim:char; flags:dword; iostr:Praptor_iostream):longint;cdecl;external libraptor2;
{ Parser and Serializer options  }
{*
 * raptor_option_value_type:
 * @RAPTOR_OPTION_VALUE_TYPE_BOOL: Boolean integer value. Non-0 is true
 * @RAPTOR_OPTION_VALUE_TYPE_INT: Decimal integer value
 * @RAPTOR_OPTION_VALUE_TYPE_STRING: String value
 * @RAPTOR_OPTION_VALUE_TYPE_URI: URI String value.
 * @RAPTOR_OPTION_VALUE_TYPE_LAST: internal
 *
 * Option value types.
  }
type
  Praptor_option_value_type = ^Traptor_option_value_type;
  Traptor_option_value_type =  Longint;
  Const
    RAPTOR_OPTION_VALUE_TYPE_BOOL = 0;
    RAPTOR_OPTION_VALUE_TYPE_INT = 1;
    RAPTOR_OPTION_VALUE_TYPE_STRING = 2;
    RAPTOR_OPTION_VALUE_TYPE_URI = 3;
    RAPTOR_OPTION_VALUE_TYPE_LAST = RAPTOR_OPTION_VALUE_TYPE_URI;
;
{*
 * raptor_option_description:
 * @domain: domain ID
 * @option: option ID
 * @value_type: data type of option value
 * @name: short name for option
 * @name_len: length of @name
 * @label: description of option
 * @uri: URI identifying option
 *
 * Description of an option for a domain.
  }
type
  Praptor_option_description = ^Traptor_option_description;
  Traptor_option_description = record
      domain : Traptor_domain;
      option : Traptor_option;
      value_type : Traptor_option_value_type;
      name : Pchar;
      name_len : Tsize_t;
      _label : Pchar;
      uri : Praptor_uri;
    end;

function raptor_option_get_count:dword;cdecl;external libraptor2;
function raptor_option_get_value_type_label(_type:Traptor_option_value_type):Pchar;cdecl;external libraptor2;
procedure raptor_free_option_description(option_description:Praptor_option_description);cdecl;external libraptor2;
function raptor_world_get_option_description(world:Praptor_world; domain:Traptor_domain; option:Traptor_option):Praptor_option_description;cdecl;external libraptor2;
{ SAX2 element Class (raptor_xml_element)  }
function raptor_new_xml_element(name:Praptor_qname; xml_language:Pbyte; xml_base:Praptor_uri):Praptor_xml_element;cdecl;external libraptor2;
function raptor_new_xml_element_from_namespace_local_name(ns:Praptor_namespace; name:Pbyte; xml_language:Pbyte; xml_base:Praptor_uri):Praptor_xml_element;cdecl;external libraptor2;
procedure raptor_free_xml_element(element:Praptor_xml_element);cdecl;external libraptor2;
{ methods  }
function raptor_xml_element_get_name(xml_element:Praptor_xml_element):Praptor_qname;cdecl;external libraptor2;
procedure raptor_xml_element_set_attributes(xml_element:Praptor_xml_element; attributes:PPraptor_qname; count:longint);cdecl;external libraptor2;
function raptor_xml_element_get_attributes(xml_element:Praptor_xml_element):^Praptor_qname;cdecl;external libraptor2;
function raptor_xml_element_get_attributes_count(xml_element:Praptor_xml_element):longint;cdecl;external libraptor2;
function raptor_xml_element_declare_namespace(xml_element:Praptor_xml_element; nspace:Praptor_namespace):longint;cdecl;external libraptor2;
function raptor_xml_element_write(element:Praptor_xml_element; nstack:Praptor_namespace_stack; is_empty:longint; is_end:longint; depth:longint; 
           iostr:Praptor_iostream):longint;cdecl;external libraptor2;
function raptor_xml_element_is_empty(xml_element:Praptor_xml_element):longint;cdecl;external libraptor2;
function raptor_xml_element_get_language(xml_element:Praptor_xml_element):Pbyte;cdecl;external libraptor2;
{ XML Writer Class (raptor_xml_writer)  }
function raptor_new_xml_writer(world:Praptor_world; nstack:Praptor_namespace_stack; iostr:Praptor_iostream):Praptor_xml_writer;cdecl;external libraptor2;
procedure raptor_free_xml_writer(xml_writer:Praptor_xml_writer);cdecl;external libraptor2;
{ methods  }
procedure raptor_xml_writer_empty_element(xml_writer:Praptor_xml_writer; element:Praptor_xml_element);cdecl;external libraptor2;
procedure raptor_xml_writer_start_element(xml_writer:Praptor_xml_writer; element:Praptor_xml_element);cdecl;external libraptor2;
procedure raptor_xml_writer_end_element(xml_writer:Praptor_xml_writer; element:Praptor_xml_element);cdecl;external libraptor2;
procedure raptor_xml_writer_newline(xml_writer:Praptor_xml_writer);cdecl;external libraptor2;
procedure raptor_xml_writer_cdata(xml_writer:Praptor_xml_writer; s:Pbyte);cdecl;external libraptor2;
procedure raptor_xml_writer_cdata_counted(xml_writer:Praptor_xml_writer; s:Pbyte; len:dword);cdecl;external libraptor2;
procedure raptor_xml_writer_raw(xml_writer:Praptor_xml_writer; s:Pbyte);cdecl;external libraptor2;
procedure raptor_xml_writer_raw_counted(xml_writer:Praptor_xml_writer; s:Pbyte; len:dword);cdecl;external libraptor2;
procedure raptor_xml_writer_comment(xml_writer:Praptor_xml_writer; s:Pbyte);cdecl;external libraptor2;
procedure raptor_xml_writer_comment_counted(xml_writer:Praptor_xml_writer; s:Pbyte; len:dword);cdecl;external libraptor2;
procedure raptor_xml_writer_flush(xml_writer:Praptor_xml_writer);cdecl;external libraptor2;
function raptor_xml_writer_set_option(xml_writer:Praptor_xml_writer; option:Traptor_option; _string:Pchar; integer:longint):longint;cdecl;external libraptor2;
function raptor_xml_writer_get_option(xml_writer:Praptor_xml_writer; option:Traptor_option; string_p:PPchar; integer_p:Plongint):longint;cdecl;external libraptor2;
function raptor_xml_writer_get_depth(xml_writer:Praptor_xml_writer):longint;cdecl;external libraptor2;
{*
 * raptor_sax2_start_element_handler:
 * @user_data: user data
 * @xml_element: XML element
 *
 * SAX2 start element handler
  }
type

  Traptor_sax2_start_element_handler = procedure (user_data:pointer; xml_element:Praptor_xml_element);cdecl;
{*
 * raptor_sax2_end_element_handler:
 * @user_data: user data
 * @xml_element: XML element
 *
 * SAX2 end element handler
  }

  Traptor_sax2_end_element_handler = procedure (user_data:pointer; xml_element:Praptor_xml_element);cdecl;
{*
 * raptor_sax2_characters_handler:
 * @user_data: user data
 * @xml_element: XML element
 * @s: string
 * @len: string len
 *
 * SAX2 characters handler
  }

  Traptor_sax2_characters_handler = procedure (user_data:pointer; xml_element:Praptor_xml_element; s:Pbyte; len:longint);cdecl;
{*
 * raptor_sax2_cdata_handler:
 * @user_data: user data
 * @xml_element: XML element
 * @s: string
 * @len: string len

 * SAX2 CDATA section handler
  }

  Traptor_sax2_cdata_handler = procedure (user_data:pointer; xml_element:Praptor_xml_element; s:Pbyte; len:longint);cdecl;
{*
 * raptor_sax2_comment_handler:
 * @user_data: user data
 * @xml_element: XML element
 * @s: string
 *
 * SAX2 XML comment handler
  }

  Traptor_sax2_comment_handler = procedure (user_data:pointer; xml_element:Praptor_xml_element; s:Pbyte);cdecl;
{*
 * raptor_sax2_unparsed_entity_decl_handler:
 * @user_data: user data
 * @entityName: entity name
 * @base: base URI
 * @systemId: system ID
 * @publicId: public ID
 * @notationName: notation name
 *
 * SAX2 unparsed entity (NDATA) handler
  }

  Traptor_sax2_unparsed_entity_decl_handler = procedure (user_data:pointer; entityName:Pbyte; base:Pbyte; systemId:Pbyte; publicId:Pbyte; 
                notationName:Pbyte);cdecl;
{*
 * raptor_sax2_external_entity_ref_handler:
 * @user_data: user data
 * @context: context
 * @base: base URI
 * @systemId: system ID
 * @publicId: public ID
 *
 * SAX2 external entity reference handler
 * 
 * Return value: 0 if processing should not continue because of a
 * fatal error in the handling of the external entity.
  }

  Traptor_sax2_external_entity_ref_handler = function (user_data:pointer; context:Pbyte; base:Pbyte; systemId:Pbyte; publicId:Pbyte):longint;cdecl;
{ SAX2 API  }

function raptor_new_sax2(world:Praptor_world; locator:Praptor_locator; user_data:pointer):Praptor_sax2;cdecl;external libraptor2;
procedure raptor_free_sax2(sax2:Praptor_sax2);cdecl;external libraptor2;
{ methods  }
procedure raptor_sax2_set_start_element_handler(sax2:Praptor_sax2; handler:Traptor_sax2_start_element_handler);cdecl;external libraptor2;
procedure raptor_sax2_set_end_element_handler(sax2:Praptor_sax2; handler:Traptor_sax2_end_element_handler);cdecl;external libraptor2;
procedure raptor_sax2_set_characters_handler(sax2:Praptor_sax2; handler:Traptor_sax2_characters_handler);cdecl;external libraptor2;
procedure raptor_sax2_set_cdata_handler(sax2:Praptor_sax2; handler:Traptor_sax2_cdata_handler);cdecl;external libraptor2;
procedure raptor_sax2_set_comment_handler(sax2:Praptor_sax2; handler:Traptor_sax2_comment_handler);cdecl;external libraptor2;
procedure raptor_sax2_set_unparsed_entity_decl_handler(sax2:Praptor_sax2; handler:Traptor_sax2_unparsed_entity_decl_handler);cdecl;external libraptor2;
procedure raptor_sax2_set_external_entity_ref_handler(sax2:Praptor_sax2; handler:Traptor_sax2_external_entity_ref_handler);cdecl;external libraptor2;
procedure raptor_sax2_set_namespace_handler(sax2:Praptor_sax2; handler:Traptor_namespace_handler);cdecl;external libraptor2;
procedure raptor_sax2_set_uri_filter(sax2:Praptor_sax2; filter:Traptor_uri_filter_func; user_data:pointer);cdecl;external libraptor2;
procedure raptor_sax2_parse_start(sax2:Praptor_sax2; base_uri:Praptor_uri);cdecl;external libraptor2;
function raptor_sax2_parse_chunk(sax2:Praptor_sax2; buffer:Pbyte; len:Tsize_t; is_end:longint):longint;cdecl;external libraptor2;
function raptor_sax2_inscope_xml_language(sax2:Praptor_sax2):Pbyte;cdecl;external libraptor2;
function raptor_sax2_inscope_base_uri(sax2:Praptor_sax2):Praptor_uri;cdecl;external libraptor2;
{ AVL Trees  }
{*
 * raptor_avltree:
 *
 * AVL Tree
  }
type
  Traptor_avltree_s = Traptor_avltree;
{*
 * raptor_avltree_iterator:
 *
 * AVL Tree Iterator as created by raptor_new_avltree_iterator()
  }
  Traptor_avltree_iterator_s = Traptor_avltree_iterator;
{*
 * raptor_avltree_visit_handler:
 * @depth: depth of object in tree
 * @data: data object being visited
 * @user_data: user data arg to raptor_avltree_visit()
 *
 * AVL Tree visitor function as given to raptor_avltree_visit()
 *
 * Return value: non-0 to terminate visit early.
  }

  Traptor_avltree_visit_handler = function (depth:longint; data:pointer; user_data:pointer):longint;cdecl;
{*
 * raptor_avltree_bitflags:
 * @RAPTOR_AVLTREE_FLAG_REPLACE_DUPLICATES: If set raptor_avltree_add() will replace any duplicate items. If not set, raptor_avltree_add() will not replace them and will return status >0 when adding a duplicate. (Default is not set)
 *
 * Bit flags for AVL Tree class constructor raptor_new_avltree()
 * }

  Praptor_avltree_bitflags = ^Traptor_avltree_bitflags;
  Traptor_avltree_bitflags =  Longint;
  Const
    RAPTOR_AVLTREE_FLAG_REPLACE_DUPLICATES = 1;
;

function raptor_new_avltree(compare_handler:Traptor_data_compare_handler; free_handler:Traptor_data_free_handler; flags:dword):Praptor_avltree;cdecl;external libraptor2;
procedure raptor_free_avltree(tree:Praptor_avltree);cdecl;external libraptor2;
{ methods  }
function raptor_avltree_add(tree:Praptor_avltree; p_data:pointer):longint;cdecl;external libraptor2;
function raptor_avltree_remove(tree:Praptor_avltree; p_data:pointer):pointer;cdecl;external libraptor2;
function raptor_avltree_delete(tree:Praptor_avltree; p_data:pointer):longint;cdecl;external libraptor2;
procedure raptor_avltree_trim(tree:Praptor_avltree);cdecl;external libraptor2;
function raptor_avltree_search(tree:Praptor_avltree; p_data:pointer):pointer;cdecl;external libraptor2;
function raptor_avltree_visit(tree:Praptor_avltree; visit_handler:Traptor_avltree_visit_handler; user_data:pointer):longint;cdecl;external libraptor2;
function raptor_avltree_size(tree:Praptor_avltree):longint;cdecl;external libraptor2;
procedure raptor_avltree_set_print_handler(tree:Praptor_avltree; print_handler:Traptor_data_print_handler);cdecl;external libraptor2;
function raptor_avltree_print(tree:Praptor_avltree; stream:PFILE):longint;cdecl;external libraptor2;
function raptor_new_avltree_iterator(tree:Praptor_avltree; range:pointer; range_free_handler:Traptor_data_free_handler; direction:longint):Praptor_avltree_iterator;cdecl;external libraptor2;
procedure raptor_free_avltree_iterator(iterator:Praptor_avltree_iterator);cdecl;external libraptor2;
function raptor_avltree_iterator_is_end(iterator:Praptor_avltree_iterator):longint;cdecl;external libraptor2;
function raptor_avltree_iterator_next(iterator:Praptor_avltree_iterator):longint;cdecl;external libraptor2;
function raptor_avltree_iterator_get(iterator:Praptor_avltree_iterator):pointer;cdecl;external libraptor2;
{ utility methods  }
procedure raptor_sort_r(base:pointer; nel:Tsize_t; width:Tsize_t; compar:Traptor_data_compare_arg_handler; user_data:pointer);cdecl;external libraptor2;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 28-11-25 19:22:17 ===


implementation


{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function raptor_new_world : longint;
begin
  raptor_new_world:=raptor_new_world_internal(RAPTOR_VERSION);
end;


end.
