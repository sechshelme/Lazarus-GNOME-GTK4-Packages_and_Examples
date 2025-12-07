unit fp_yaml;

interface

const
  {$IFDEF Linux}
  libc = 'c';
  libyaml = 'yaml';
  {$ENDIF}

  {$IFDEF Windows}
  libc = 'msvcrt.dll';
  libyaml = 'libyaml-0-2.dll';
  {$ENDIF}

type
  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  PFILE = type Pointer;

function fopen(filename: pchar; modes: pchar): PFILE; cdecl; external libc;
function fclose(stream: PFILE): longint; cdecl; external libc;


{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


function yaml_get_version_string: pchar; cdecl; external libyaml;
procedure yaml_get_version(major: Plongint; minor: Plongint; patch: Plongint); cdecl; external libyaml;

type
  Pyaml_char_t = ^Tyaml_char_t;
  Tyaml_char_t = AnsiChar;

  Tyaml_version_directive_t = record
    major: longint;
    minor: longint;
  end;
  Pyaml_version_directive_t = ^Tyaml_version_directive_t;

  Tyaml_tag_directive_t = record
    handle: Pyaml_char_t;
    prefix: Pyaml_char_t;
  end;
  Pyaml_tag_directive_t = ^Tyaml_tag_directive_t;

type
  Pyaml_encoding_t = ^Tyaml_encoding_t;
  Tyaml_encoding_t = longint;

const
  YAML_ANY_ENCODING = 0;
  YAML_UTF8_ENCODING = 1;
  YAML_UTF16LE_ENCODING = 2;
  YAML_UTF16BE_ENCODING = 3;

type
  Pyaml_break_t = ^Tyaml_break_t;
  Tyaml_break_t = longint;

const
  YAML_ANY_BREAK = 0;
  YAML_CR_BREAK = 1;
  YAML_LN_BREAK = 2;
  YAML_CRLN_BREAK = 3;

type
  Pyaml_error_type_t = ^Tyaml_error_type_t;
  Tyaml_error_type_t = longint;

const
  YAML_NO_ERROR = 0;
  YAML_MEMORY_ERROR = 1;
  YAML_READER_ERROR = 2;
  YAML_SCANNER_ERROR = 3;
  YAML_PARSER_ERROR = 4;
  YAML_COMPOSER_ERROR = 5;
  YAML_WRITER_ERROR = 6;
  YAML_EMITTER_ERROR = 7;

type
  Pyaml_mark_t = ^Tyaml_mark_t;

  Tyaml_mark_t = record
    index: Tsize_t;
    line: Tsize_t;
    column: Tsize_t;
  end;

type
  Pyaml_scalar_style_t = ^Tyaml_scalar_style_t;
  Tyaml_scalar_style_t = longint;

const
  YAML_ANY_SCALAR_STYLE = 0;
  YAML_PLAIN_SCALAR_STYLE = 1;
  YAML_SINGLE_QUOTED_SCALAR_STYLE = 2;
  YAML_DOUBLE_QUOTED_SCALAR_STYLE = 3;
  YAML_LITERAL_SCALAR_STYLE = 4;
  YAML_FOLDED_SCALAR_STYLE = 5;

type
  Pyaml_sequence_style_t = ^Tyaml_sequence_style_t;
  Tyaml_sequence_style_t = longint;

const
  YAML_ANY_SEQUENCE_STYLE = 0;
  YAML_BLOCK_SEQUENCE_STYLE = 1;
  YAML_FLOW_SEQUENCE_STYLE = 2;

type
  Pyaml_mapping_style_t = ^Tyaml_mapping_style_t;
  Tyaml_mapping_style_t = longint;

const
  YAML_ANY_MAPPING_STYLE = 0;
  YAML_BLOCK_MAPPING_STYLE = 1;
  YAML_FLOW_MAPPING_STYLE = 2;

type
  Pyaml_token_type_t = ^Tyaml_token_type_t;
  Tyaml_token_type_t = longint;

const
  YAML_NO_TOKEN = 0;
  YAML_STREAM_START_TOKEN = 1;
  YAML_STREAM_END_TOKEN = 2;
  YAML_VERSION_DIRECTIVE_TOKEN = 3;
  YAML_TAG_DIRECTIVE_TOKEN = 4;
  YAML_DOCUMENT_START_TOKEN = 5;
  YAML_DOCUMENT_END_TOKEN = 6;
  YAML_BLOCK_SEQUENCE_START_TOKEN = 7;
  YAML_BLOCK_MAPPING_START_TOKEN = 8;
  YAML_BLOCK_END_TOKEN = 9;
  YAML_FLOW_SEQUENCE_START_TOKEN = 10;
  YAML_FLOW_SEQUENCE_END_TOKEN = 11;
  YAML_FLOW_MAPPING_START_TOKEN = 12;
  YAML_FLOW_MAPPING_END_TOKEN = 13;
  YAML_BLOCK_ENTRY_TOKEN = 14;
  YAML_FLOW_ENTRY_TOKEN = 15;
  YAML_KEY_TOKEN = 16;
  YAML_VALUE_TOKEN = 17;
  YAML_ALIAS_TOKEN = 18;
  YAML_ANCHOR_TOKEN = 19;
  YAML_TAG_TOKEN = 20;
  YAML_SCALAR_TOKEN = 21;

type
  Pyaml_token_t = ^Tyaml_token_t;

  Tyaml_token_t = record
    _type: Tyaml_token_type_t;
    data: record
      case longint of
        0: (stream_start: record
            encoding: Tyaml_encoding_t;
            end);
        1: (alias: record
            value: Pyaml_char_t;
            end);
        2: (anchor: record
            value: Pyaml_char_t;
            end);
        3: (tag: record
            handle: Pyaml_char_t;
            suffix: Pyaml_char_t;
            end);
        4: (scalar: record
            value: Pyaml_char_t;
            length: Tsize_t;
            style: Tyaml_scalar_style_t;
            end);
        5: (version_directive: record
            major: longint;
            minor: longint;
            end);
        6: (tag_directive: record
            handle: Pyaml_char_t;
            prefix: Pyaml_char_t;
            end);
      end;
    start_mark: Tyaml_mark_t;
    end_mark: Tyaml_mark_t;
  end;

procedure yaml_token_delete(token: Pyaml_token_t); cdecl; external libyaml;

type
  Pyaml_event_type_t = ^Tyaml_event_type_t;
  Tyaml_event_type_t = longint;

const
  YAML_NO_EVENT = 0;
  YAML_STREAM_START_EVENT = 1;
  YAML_STREAM_END_EVENT = 2;
  YAML_DOCUMENT_START_EVENT = 3;
  YAML_DOCUMENT_END_EVENT = 4;
  YAML_ALIAS_EVENT = 5;
  YAML_SCALAR_EVENT = 6;
  YAML_SEQUENCE_START_EVENT = 7;
  YAML_SEQUENCE_END_EVENT = 8;
  YAML_MAPPING_START_EVENT = 9;
  YAML_MAPPING_END_EVENT = 10;

type
  Pyaml_event_t = ^Tyaml_event_t;

  Tyaml_event_t = record
    _type: Tyaml_event_type_t;
    data: record
      case longint of
        0: (stream_start: record
            encoding: Tyaml_encoding_t;
            end);
        1: (document_start: record
            version_directive: Pyaml_version_directive_t;
            tag_directives: record
              start: Pyaml_tag_directive_t;
              end_: Pyaml_tag_directive_t;
              end;
            implicit: longint;
            end);
        2: (document_end: record
            implicit: longint;
            end);
        3: (alias: record
            anchor: Pyaml_char_t;
            end);
        4: (scalar: record
            anchor: Pyaml_char_t;
            tag: Pyaml_char_t;
            value: Pyaml_char_t;
            length: Tsize_t;
            plain_implicit: longint;
            quoted_implicit: longint;
            style: Tyaml_scalar_style_t;
            end);
        5: (sequence_start: record
            anchor: Pyaml_char_t;
            tag: Pyaml_char_t;
            implicit: longint;
            style: Tyaml_sequence_style_t;
            end);
        6: (mapping_start: record
            anchor: Pyaml_char_t;
            tag: Pyaml_char_t;
            implicit: longint;
            style: Tyaml_mapping_style_t;
            end);
      end;
    start_mark: Tyaml_mark_t;
    end_mark: Tyaml_mark_t;
  end;

function yaml_stream_start_event_initialize(event: Pyaml_event_t; encoding: Tyaml_encoding_t): longint; cdecl; external libyaml;
function yaml_stream_end_event_initialize(event: Pyaml_event_t): longint; cdecl; external libyaml;
function yaml_document_start_event_initialize(event: Pyaml_event_t; version_directive: Pyaml_version_directive_t; tag_directives_start: Pyaml_tag_directive_t; tag_directives_end: Pyaml_tag_directive_t; implicit: longint): longint; cdecl; external libyaml;
function yaml_document_end_event_initialize(event: Pyaml_event_t; implicit: longint): longint; cdecl; external libyaml;
function yaml_alias_event_initialize(event: Pyaml_event_t; anchor: Pyaml_char_t): longint; cdecl; external libyaml;
function yaml_scalar_event_initialize(event: Pyaml_event_t; anchor: Pyaml_char_t; tag: Pyaml_char_t; value: Pyaml_char_t; length: longint;
  plain_implicit: longint; quoted_implicit: longint; style: Tyaml_scalar_style_t): longint; cdecl; external libyaml;
function yaml_sequence_start_event_initialize(event: Pyaml_event_t; anchor: Pyaml_char_t; tag: Pyaml_char_t; implicit: longint; style: Tyaml_sequence_style_t): longint; cdecl; external libyaml;
function yaml_sequence_end_event_initialize(event: Pyaml_event_t): longint; cdecl; external libyaml;
function yaml_mapping_start_event_initialize(event: Pyaml_event_t; anchor: Pyaml_char_t; tag: Pyaml_char_t; implicit: longint; style: Tyaml_mapping_style_t): longint; cdecl; external libyaml;
function yaml_mapping_end_event_initialize(event: Pyaml_event_t): longint; cdecl; external libyaml;
procedure yaml_event_delete(event: Pyaml_event_t); cdecl; external libyaml;

const
  YAML_NULL_TAG = 'tag:yaml.org,2002:null';
  YAML_BOOL_TAG = 'tag:yaml.org,2002:bool';
  YAML_STR_TAG = 'tag:yaml.org,2002:str';
  YAML_INT_TAG = 'tag:yaml.org,2002:int';
  YAML_FLOAT_TAG = 'tag:yaml.org,2002:float';
  YAML_TIMESTAMP_TAG = 'tag:yaml.org,2002:timestamp';
  YAML_SEQ_TAG = 'tag:yaml.org,2002:seq';
  YAML_MAP_TAG = 'tag:yaml.org,2002:map';
  YAML_DEFAULT_SCALAR_TAG = YAML_STR_TAG;
  YAML_DEFAULT_SEQUENCE_TAG = YAML_SEQ_TAG;
  YAML_DEFAULT_MAPPING_TAG = YAML_MAP_TAG;

type
  Pyaml_node_type_t = ^Tyaml_node_type_t;
  Tyaml_node_type_t = longint;

const
  YAML_NO_NODE = 0;
  YAML_SCALAR_NODE = 1;
  YAML_SEQUENCE_NODE = 2;
  YAML_MAPPING_NODE = 3;

type
  Pyaml_node_item_t = ^Tyaml_node_item_t;
  Tyaml_node_item_t = longint;

  Pyaml_node_pair_t = ^Tyaml_node_pair_t;

  Tyaml_node_pair_t = record
    key: longint;
    value: longint;
  end;

  Pyaml_node_t = ^Tyaml_node_t;

  Tyaml_node_t = record
    _type: Tyaml_node_type_t;
    tag: Pyaml_char_t;
    data: record
      case longint of
        0: (scalar: record
            value: Pyaml_char_t;
            length: Tsize_t;
            style: Tyaml_scalar_style_t;
            end);
        1: (sequence: record
            items: record
              start: Pyaml_node_item_t;
              end_: Pyaml_node_item_t;
              top: Pyaml_node_item_t;
              end;
            style: Tyaml_sequence_style_t;
            end);
        2: (mapping: record
            pairs: record
              start: Pyaml_node_pair_t;
              end_: Pyaml_node_pair_t;
              top: Pyaml_node_pair_t;
              end;
            style: Tyaml_mapping_style_t;
            end);
      end;
    start_mark: Tyaml_mark_t;
    end_mark: Tyaml_mark_t;
  end;

  Pyaml_document_t = ^Tyaml_document_t;

  Tyaml_document_t = record
    nodes: record
      start: Pyaml_node_t;
      end_: Pyaml_node_t;
      top: Pyaml_node_t;
      end;
    version_directive: Pyaml_version_directive_t;
    tag_directives: record
      start: Pyaml_tag_directive_t;
      end_: Pyaml_tag_directive_t;
      end;
    start_implicit: longint;
    end_implicit: longint;
    start_mark: Tyaml_mark_t;
    end_mark: Tyaml_mark_t;
  end;

function yaml_document_initialize(document: Pyaml_document_t; version_directive: Pyaml_version_directive_t; tag_directives_start: Pyaml_tag_directive_t; tag_directives_end: Pyaml_tag_directive_t; start_implicit: longint;
  end_implicit: longint): longint; cdecl; external libyaml;
procedure yaml_document_delete(document: Pyaml_document_t); cdecl; external libyaml;
function yaml_document_get_node(document: Pyaml_document_t; index: longint): Pyaml_node_t; cdecl; external libyaml;
function yaml_document_get_root_node(document: Pyaml_document_t): Pyaml_node_t; cdecl; external libyaml;
function yaml_document_add_scalar(document: Pyaml_document_t; tag: Pyaml_char_t; value: Pyaml_char_t; length: longint; style: Tyaml_scalar_style_t): longint; cdecl; external libyaml;
function yaml_document_add_sequence(document: Pyaml_document_t; tag: Pyaml_char_t; style: Tyaml_sequence_style_t): longint; cdecl; external libyaml;
function yaml_document_add_mapping(document: Pyaml_document_t; tag: Pyaml_char_t; style: Tyaml_mapping_style_t): longint; cdecl; external libyaml;
function yaml_document_append_sequence_item(document: Pyaml_document_t; sequence: longint; item: longint): longint; cdecl; external libyaml;
function yaml_document_append_mapping_pair(document: Pyaml_document_t; mapping: longint; key: longint; value: longint): longint; cdecl; external libyaml;

type
  Tyaml_read_handler_t = function(data: pointer; buffer: pbyte; size: Tsize_t; size_read: Psize_t): longint; cdecl;

  Pyaml_simple_key_t = ^Tyaml_simple_key_t;

  Tyaml_simple_key_t = record
    possible: longint;
    required: longint;
    token_number: Tsize_t;
    mark: Tyaml_mark_t;
  end;

type
  Pyaml_parser_state_t = ^Tyaml_parser_state_t;
  Tyaml_parser_state_t = longint;

const
  YAML_PARSE_STREAM_START_STATE = 0;
  YAML_PARSE_IMPLICIT_DOCUMENT_START_STATE = 1;
  YAML_PARSE_DOCUMENT_START_STATE = 2;
  YAML_PARSE_DOCUMENT_CONTENT_STATE = 3;
  YAML_PARSE_DOCUMENT_END_STATE = 4;
  YAML_PARSE_BLOCK_NODE_STATE = 5;
  YAML_PARSE_BLOCK_NODE_OR_INDENTLESS_SEQUENCE_STATE = 6;
  YAML_PARSE_FLOW_NODE_STATE = 7;
  YAML_PARSE_BLOCK_SEQUENCE_FIRST_ENTRY_STATE = 8;
  YAML_PARSE_BLOCK_SEQUENCE_ENTRY_STATE = 9;
  YAML_PARSE_INDENTLESS_SEQUENCE_ENTRY_STATE = 10;
  YAML_PARSE_BLOCK_MAPPING_FIRST_KEY_STATE = 11;
  YAML_PARSE_BLOCK_MAPPING_KEY_STATE = 12;
  YAML_PARSE_BLOCK_MAPPING_VALUE_STATE = 13;
  YAML_PARSE_FLOW_SEQUENCE_FIRST_ENTRY_STATE = 14;
  YAML_PARSE_FLOW_SEQUENCE_ENTRY_STATE = 15;
  YAML_PARSE_FLOW_SEQUENCE_ENTRY_MAPPING_KEY_STATE = 16;
  YAML_PARSE_FLOW_SEQUENCE_ENTRY_MAPPING_VALUE_STATE = 17;
  YAML_PARSE_FLOW_SEQUENCE_ENTRY_MAPPING_END_STATE = 18;
  YAML_PARSE_FLOW_MAPPING_FIRST_KEY_STATE = 19;
  YAML_PARSE_FLOW_MAPPING_KEY_STATE = 20;
  YAML_PARSE_FLOW_MAPPING_VALUE_STATE = 21;
  YAML_PARSE_FLOW_MAPPING_EMPTY_VALUE_STATE = 22;
  YAML_PARSE_END_STATE = 23;

type
  Pyaml_alias_data_t = ^Tyaml_alias_data_t;

  Tyaml_alias_data_t = record
    anchor: Pyaml_char_t;
    index: longint;
    mark: Tyaml_mark_t;
  end;

  Pyaml_parser_t = ^Tyaml_parser_t;

  Tyaml_parser_t = record
    error: Tyaml_error_type_t;
    problem: pchar;
    problem_offset: Tsize_t;
    problem_value: longint;
    problem_mark: Tyaml_mark_t;
    context: pchar;
    context_mark: Tyaml_mark_t;
    read_handler: Tyaml_read_handler_t;
    read_handler_data: pointer;
    input: record
      case longint of
        0: (_string: record
            start: pbyte;
            end_: pbyte;
            current: pbyte;
            end);
        1: (file_: PFILE);
      end;
    eof: longint;
    buffer: record
      start: Pyaml_char_t;
      end_: Pyaml_char_t;
      pointer: Pyaml_char_t;
      last: Pyaml_char_t;
      end;
    unread: Tsize_t;
    raw_buffer: record
      start: pbyte;
      end_: pbyte;
      pointer: pbyte;
      last: pbyte;
      end;
    encoding: Tyaml_encoding_t;
    offset: Tsize_t;
    mark: Tyaml_mark_t;
    stream_start_produced: longint;
    stream_end_produced: longint;
    flow_level: longint;
    tokens: record
      start: Pyaml_token_t;
      end_: Pyaml_token_t;
      head: Pyaml_token_t;
      tail: Pyaml_token_t;
      end;
    tokens_parsed: Tsize_t;
    token_available: longint;
    indents: record
      start: Plongint;
      end_: Plongint;
      top: Plongint;
      end;
    indent: longint;
    simple_key_allowed: longint;
    simple_keys: record
      start: Pyaml_simple_key_t;
      end_: Pyaml_simple_key_t;
      top: Pyaml_simple_key_t;
      end;
    states: record
      start: Pyaml_parser_state_t;
      end_: Pyaml_parser_state_t;
      top: Pyaml_parser_state_t;
      end;
    state: Tyaml_parser_state_t;
    marks: record
      start: Pyaml_mark_t;
      end_: Pyaml_mark_t;
      top: Pyaml_mark_t;
      end;
    tag_directives: record
      start: Pyaml_tag_directive_t;
      end_: Pyaml_tag_directive_t;
      top: Pyaml_tag_directive_t;
      end;
    aliases: record
      start: Pyaml_alias_data_t;
      end_: Pyaml_alias_data_t;
      top: Pyaml_alias_data_t;
      end;
    document: Pyaml_document_t;
  end;

function yaml_parser_initialize(parser: Pyaml_parser_t): longint; cdecl; external libyaml;
procedure yaml_parser_delete(parser: Pyaml_parser_t); cdecl; external libyaml;
procedure yaml_parser_set_input_string(parser: Pyaml_parser_t; input: pbyte; size: Tsize_t); cdecl; external libyaml;
procedure yaml_parser_set_input_file(parser: Pyaml_parser_t; file_: PFILE); cdecl; external libyaml;
procedure yaml_parser_set_input(parser: Pyaml_parser_t; handler: Tyaml_read_handler_t; data: pointer); cdecl; external libyaml;
procedure yaml_parser_set_encoding(parser: Pyaml_parser_t; encoding: Tyaml_encoding_t); cdecl; external libyaml;
function yaml_parser_scan(parser: Pyaml_parser_t; token: Pyaml_token_t): longint; cdecl; external libyaml;
function yaml_parser_parse(parser: Pyaml_parser_t; event: Pyaml_event_t): longint; cdecl; external libyaml;
function yaml_parser_load(parser: Pyaml_parser_t; document: Pyaml_document_t): longint; cdecl; external libyaml;

type
  Tyaml_write_handler_t = function(data: pointer; buffer: pbyte; size: Tsize_t): longint; cdecl;

type
  Pyaml_emitter_state_t = ^Tyaml_emitter_state_t;
  Tyaml_emitter_state_t = longint;

const
  YAML_EMIT_STREAM_START_STATE = 0;
  YAML_EMIT_FIRST_DOCUMENT_START_STATE = 1;
  YAML_EMIT_DOCUMENT_START_STATE = 2;
  YAML_EMIT_DOCUMENT_CONTENT_STATE = 3;
  YAML_EMIT_DOCUMENT_END_STATE = 4;
  YAML_EMIT_FLOW_SEQUENCE_FIRST_ITEM_STATE = 5;
  YAML_EMIT_FLOW_SEQUENCE_ITEM_STATE = 6;
  YAML_EMIT_FLOW_MAPPING_FIRST_KEY_STATE = 7;
  YAML_EMIT_FLOW_MAPPING_KEY_STATE = 8;
  YAML_EMIT_FLOW_MAPPING_SIMPLE_VALUE_STATE = 9;
  YAML_EMIT_FLOW_MAPPING_VALUE_STATE = 10;
  YAML_EMIT_BLOCK_SEQUENCE_FIRST_ITEM_STATE = 11;
  YAML_EMIT_BLOCK_SEQUENCE_ITEM_STATE = 12;
  YAML_EMIT_BLOCK_MAPPING_FIRST_KEY_STATE = 13;
  YAML_EMIT_BLOCK_MAPPING_KEY_STATE = 14;
  YAML_EMIT_BLOCK_MAPPING_SIMPLE_VALUE_STATE = 15;
  YAML_EMIT_BLOCK_MAPPING_VALUE_STATE = 16;
  YAML_EMIT_END_STATE = 17;

type
  Pyaml_anchors_t = ^Tyaml_anchors_t;

  Tyaml_anchors_t = record
    references: longint;
    anchor: longint;
    serialized: longint;
  end;

  Pyaml_emitter_t = ^Tyaml_emitter_t;

  Tyaml_emitter_t = record
    error: Tyaml_error_type_t;
    problem: pchar;
    write_handler: Tyaml_write_handler_t;
    write_handler_data: pointer;
    output: record
      case longint of
        0: (_string: record
            buffer: pbyte;
            size: Tsize_t;
            size_written: Psize_t;
            end);
        1: (file_: PFILE);
      end;
    buffer: record
      start: Pyaml_char_t;
      end_: Pyaml_char_t;
      pointer: Pyaml_char_t;
      last: Pyaml_char_t;
      end;
    raw_buffer: record
      start: pbyte;
      end_: pbyte;
      pointer: pbyte;
      last: pbyte;
      end;
    encoding: Tyaml_encoding_t;
    canonical: longint;
    best_indent: longint;
    best_width: longint;
    unicode: longint;
    line_break: Tyaml_break_t;
    states: record
      start: Pyaml_emitter_state_t;
      end_: Pyaml_emitter_state_t;
      top: Pyaml_emitter_state_t;
      end;
    state: Tyaml_emitter_state_t;
    events: record
      start: Pyaml_event_t;
      end_: Pyaml_event_t;
      head: Pyaml_event_t;
      tail: Pyaml_event_t;
      end;
    indents: record
      start: Plongint;
      end_: Plongint;
      top: Plongint;
      end;
    tag_directives: record
      start: Pyaml_tag_directive_t;
      end_: Pyaml_tag_directive_t;
      top: Pyaml_tag_directive_t;
      end;
    indent: longint;
    flow_level: longint;
    root_context: longint;
    sequence_context: longint;
    mapping_context: longint;
    simple_key_context: longint;
    line: longint;
    column: longint;
    whitespace: longint;
    indention: longint;
    open_ended: longint;
    anchor_data: record
      anchor: Pyaml_char_t;
      anchor_length: Tsize_t;
      alias: longint;
      end;
    tag_data: record
      handle: Pyaml_char_t;
      handle_length: Tsize_t;
      suffix: Pyaml_char_t;
      suffix_length: Tsize_t;
      end;
    scalar_data: record
      value: Pyaml_char_t;
      length: Tsize_t;
      multiline: longint;
      flow_plain_allowed: longint;
      block_plain_allowed: longint;
      single_quoted_allowed: longint;
      block_allowed: longint;
      style: Tyaml_scalar_style_t;
      end;
    opened: longint;
    closed: longint;
    anchors: Pyaml_anchors_t;
    last_anchor_id: longint;
    document: Pyaml_document_t;
  end;

function yaml_emitter_initialize(emitter: Pyaml_emitter_t): longint; cdecl; external libyaml;
procedure yaml_emitter_delete(emitter: Pyaml_emitter_t); cdecl; external libyaml;
procedure yaml_emitter_set_output_string(emitter: Pyaml_emitter_t; output: pbyte; size: Tsize_t; size_written: Psize_t); cdecl; external libyaml;
procedure yaml_emitter_set_output_file(emitter: Pyaml_emitter_t; file_: PFILE); cdecl; external libyaml;
procedure yaml_emitter_set_output(emitter: Pyaml_emitter_t; handler: Tyaml_write_handler_t; data: pointer); cdecl; external libyaml;
procedure yaml_emitter_set_encoding(emitter: Pyaml_emitter_t; encoding: Tyaml_encoding_t); cdecl; external libyaml;
procedure yaml_emitter_set_canonical(emitter: Pyaml_emitter_t; canonical: longint); cdecl; external libyaml;
procedure yaml_emitter_set_indent(emitter: Pyaml_emitter_t; indent: longint); cdecl; external libyaml;
procedure yaml_emitter_set_width(emitter: Pyaml_emitter_t; width: longint); cdecl; external libyaml;
procedure yaml_emitter_set_unicode(emitter: Pyaml_emitter_t; unicode: longint); cdecl; external libyaml;
procedure yaml_emitter_set_break(emitter: Pyaml_emitter_t; line_break: Tyaml_break_t); cdecl; external libyaml;
function yaml_emitter_emit(emitter: Pyaml_emitter_t; event: Pyaml_event_t): longint; cdecl; external libyaml;
function yaml_emitter_open(emitter: Pyaml_emitter_t): longint; cdecl; external libyaml;
function yaml_emitter_close(emitter: Pyaml_emitter_t): longint; cdecl; external libyaml;
function yaml_emitter_dump(emitter: Pyaml_emitter_t; document: Pyaml_document_t): longint; cdecl; external libyaml;
function yaml_emitter_flush(emitter: Pyaml_emitter_t): longint; cdecl; external libyaml;

// === Konventiert am: 7-12-25 15:31:44 ===


implementation



end.
