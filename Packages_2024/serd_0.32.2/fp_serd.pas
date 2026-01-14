unit fp_serd;

interface

const
  {$IFDEF Linux}
  libserd0 = 'serd-0';
  {$ENDIF}

  {$IFDEF Windows}
  libserd0 = 'libserd-0.dll'; 
  {$ENDIF}


type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  PPuint8_t = ^Puint8_t;
  Tuint16_t = uint16;
  Puint16_t = ^Tuint16_t;
  PPuint16_t = ^Puint16_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;
  PPuint32_t = ^Puint32_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;
  PPuint64_t = ^Puint64_t;

  Tint8_t = int8;
  Pint8_t = ^Tint8_t;
  PPint8_t = ^Pint8_t;
  Tint16_t = int16;
  Pint16_t = ^Tint16_t;
  PPint16_t = ^Pint16_t;
  Tint32_t = int32;
  Pint32_t = ^Tint32_t;
  PPint32_t = ^Pint32_t;
  Tint64_t = int64;
  Pint64_t = ^Tint64_t;
  PPint64_t = ^Pint64_t;

  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  PFILE = type Pointer;

  Pva_list = type Pointer; // ?????


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PSerdSyntax = ^TSerdSyntax;
  TSerdSyntax = longint;

const
  SERD_TURTLE = 1;
  SERD_NTRIPLES = 2;
  SERD_NQUADS = 3;
  SERD_TRIG = 4;

type
  PSerdNodeFlag = ^TSerdNodeFlag;
  TSerdNodeFlag = longint;

const
  SERD_HAS_NEWLINE = 1 shl 0;
  SERD_HAS_QUOTE = 1 shl 1;

type
  PSerdNodeFlags = ^TSerdNodeFlags;
  TSerdNodeFlags = Tuint32_t;

  PSerdChunk = ^TSerdChunk;

  TSerdChunk = record
    buf: pansichar;
    len: Tsize_t;
  end;

procedure serd_free(ptr: pointer); cdecl; external libserd0;

type
  PSerdStatus = ^TSerdStatus;
  TSerdStatus = longint;

const
  SERD_SUCCESS = 0;
  SERD_FAILURE = 1;
  SERD_ERR_UNKNOWN = 2;
  SERD_ERR_BAD_SYNTAX = 3;
  SERD_ERR_BAD_ARG = 4;
  SERD_ERR_NOT_FOUND = 5;
  SERD_ERR_ID_CLASH = 6;
  SERD_ERR_BAD_CURIE = 7;
  SERD_ERR_INTERNAL = 8;
  SERD_ERR_BAD_WRITE = 9;
  SERD_ERR_BAD_TEXT = 10;

function serd_strerror(status: TSerdStatus): Puint8_t; cdecl; external libserd0;
function serd_strlen(str: Puint8_t; n_bytes: Psize_t; flags: PSerdNodeFlags): Tsize_t; cdecl; external libserd0;
function serd_strtod(str: pchar; endptr: PPchar): double; cdecl; external libserd0;
function serd_base64_decode(str: Puint8_t; len: Tsize_t; size: Psize_t): pointer; cdecl; external libserd0;

type
  TSerdStreamErrorFunc = function(stream: pointer): longint; cdecl;
  TSerdSource = function(buf: pointer; size: Tsize_t; nmemb: Tsize_t; stream: pointer): Tsize_t; cdecl;
  TSerdSink = function(buf: pointer; len: Tsize_t; stream: pointer): Tsize_t; cdecl;

  TSerdURI = record
    scheme: TSerdChunk;
    authority: TSerdChunk;
    path_base: TSerdChunk;
    path: TSerdChunk;
    query: TSerdChunk;
    fragment: TSerdChunk;
  end;
  PSerdURI = ^TSerdURI;

const
  SERD_URI_NULL: TSerdURI = (
    scheme: (buf: nil; len: 0);
    authority: (buf: nil; len: 0);
    path_base: (buf: nil; len: 0);
    path: (buf: nil; len: 0);
    query: (buf: nil; len: 0);
    fragment: (buf: nil; len: 0));

function serd_uri_to_path(uri: Puint8_t): Puint8_t; cdecl; external libserd0; deprecated'serd_file_uri_parse';

function serd_file_uri_parse(uri: Puint8_t; hostname: PPuint8_t): Puint8_t; cdecl; external libserd0;
function serd_uri_string_has_scheme(utf8: Puint8_t): boolean; cdecl; external libserd0;
function serd_uri_parse(utf8: Puint8_t; out_: PSerdURI): TSerdStatus; cdecl; external libserd0;
procedure serd_uri_resolve(r: PSerdURI; base: PSerdURI; t: PSerdURI); cdecl; external libserd0;
function serd_uri_serialise(uri: PSerdURI; sink: TSerdSink; stream: pointer): Tsize_t; cdecl; external libserd0;
function serd_uri_serialise_relative(uri: PSerdURI; base: PSerdURI; root: PSerdURI; sink: TSerdSink; stream: pointer): Tsize_t; cdecl; external libserd0;

type
  PSerdType = ^TSerdType;
  TSerdType = longint;

const
  SERD_NOTHING = 0;
  SERD_LITERAL = 1;
  SERD_URI = 2;
  SERD_CURIE = 3;
  SERD_BLANK = 4;

type
  TSerdNode = record
    buf: pansichar;
    n_bytes: Tsize_t;
    n_chars: Tsize_t;
    flags: TSerdNodeFlags;
    _type: TSerdType;
  end;
  PSerdNode = ^TSerdNode;

const
  SERD_NODE_NULL: TSerdNode = (buf: nil; n_bytes: 0; n_chars: 0; flags: 0; _type: SERD_NOTHING);

function serd_node_from_string(_type: TSerdType; str: Puint8_t): TSerdNode; cdecl; external libserd0;
function serd_node_from_substring(_type: TSerdType; str: Puint8_t; len: Tsize_t): TSerdNode; cdecl; external libserd0;
function serd_node_new_uri_from_node(uri_node: PSerdNode; base: PSerdURI; out_: PSerdURI): TSerdNode; cdecl; external libserd0;
function serd_node_new_uri_from_string(str: Puint8_t; base: PSerdURI; out_: PSerdURI): TSerdNode; cdecl; external libserd0;
function serd_node_new_file_uri(path: Puint8_t; hostname: Puint8_t; out_: PSerdURI; escape: boolean): TSerdNode; cdecl; external libserd0;
function serd_node_new_uri(uri: PSerdURI; base: PSerdURI; out_: PSerdURI): TSerdNode; cdecl; external libserd0;
function serd_node_new_relative_uri(uri: PSerdURI; base: PSerdURI; root: PSerdURI; out_: PSerdURI): TSerdNode; cdecl; external libserd0;
function serd_node_new_decimal(d: double; frac_digits: dword): TSerdNode; cdecl; external libserd0;
function serd_node_new_integer(i: Tint64_t): TSerdNode; cdecl; external libserd0;
function serd_node_new_blob(buf: pointer; size: Tsize_t; wrap_lines: boolean): TSerdNode; cdecl; external libserd0;
function serd_node_copy(node: PSerdNode): TSerdNode; cdecl; external libserd0;
function serd_node_equals(a: PSerdNode; b: PSerdNode): boolean; cdecl; external libserd0;
procedure serd_node_free(node: PSerdNode); cdecl; external libserd0;

type
  PSerdStatementFlag = ^TSerdStatementFlag;
  TSerdStatementFlag = longint;

const
  SERD_EMPTY_S = 1 shl 1;
  SERD_EMPTY_O = 1 shl 2;
  SERD_ANON_S_BEGIN = 1 shl 3;
  SERD_ANON_O_BEGIN = 1 shl 4;
  SERD_ANON_CONT = 1 shl 5;
  SERD_LIST_S_BEGIN = 1 shl 6;
  SERD_LIST_O_BEGIN = 1 shl 7;
  SERD_LIST_CONT = 1 shl 8;

type
  PSerdStatementFlags = ^TSerdStatementFlags;
  TSerdStatementFlags = Tuint32_t;

  TSerdError = record
    status: TSerdStatus;
    filename: Puint8_t;
    line: dword;
    col: dword;
    fmt: pchar;
    args: Pva_list;
  end;
  PSerdError = ^TSerdError;

  TSerdErrorSink = function(handle: pointer; error: PSerdError): TSerdStatus; cdecl;
  TSerdBaseSink = function(handle: pointer; uri: PSerdNode): TSerdStatus; cdecl;
  TSerdPrefixSink = function(handle: pointer; name: PSerdNode; uri: PSerdNode): TSerdStatus; cdecl;
  TSerdStatementSink = function(handle: pointer; flags: TSerdStatementFlags; graph, subject, predicate, obj, object_datatype, object_lang: PSerdNode): TSerdStatus; cdecl;
  TSerdEndSink = function(handle: pointer; node: PSerdNode): TSerdStatus; cdecl;

  PSerdEnv = type Pointer;

function serd_env_new(base_uri: PSerdNode): PSerdEnv; cdecl; external libserd0;
procedure serd_env_free(env: PSerdEnv); cdecl; external libserd0;
function serd_env_get_base_uri(env: PSerdEnv; out_: PSerdURI): PSerdNode; cdecl; external libserd0;
function serd_env_set_base_uri(env: PSerdEnv; uri: PSerdNode): TSerdStatus; cdecl; external libserd0;
function serd_env_set_prefix(env: PSerdEnv; name: PSerdNode; uri: PSerdNode): TSerdStatus; cdecl; external libserd0;
function serd_env_set_prefix_from_strings(env: PSerdEnv; name: Puint8_t; uri: Puint8_t): TSerdStatus; cdecl; external libserd0;
function serd_env_qualify(env: PSerdEnv; uri: PSerdNode; prefix: PSerdNode; suffix: PSerdChunk): boolean; cdecl; external libserd0;
function serd_env_expand(env: PSerdEnv; curie: PSerdNode; uri_prefix: PSerdChunk; uri_suffix: PSerdChunk): TSerdStatus; cdecl; external libserd0;
function serd_env_expand_node(env: PSerdEnv; node: PSerdNode): TSerdNode; cdecl; external libserd0;
procedure serd_env_foreach(env: PSerdEnv; func: TSerdPrefixSink; handle: pointer); cdecl; external libserd0;

type
  PSerdReader = type Pointer;

  Tread_new_proc = procedure(para1: pointer); cdecl;

function serd_reader_new(syntax: TSerdSyntax; handle: pointer; free_handle: Tread_new_proc; base_sink: TSerdBaseSink; prefix_sink: TSerdPrefixSink;
  statement_sink: TSerdStatementSink; end_sink: TSerdEndSink): PSerdReader; cdecl; external libserd0;
procedure serd_reader_set_strict(reader: PSerdReader; strict: boolean); cdecl; external libserd0;
procedure serd_reader_set_error_sink(reader: PSerdReader; error_sink: TSerdErrorSink; error_handle: pointer); cdecl; external libserd0;
function serd_reader_get_handle(reader: PSerdReader): pointer; cdecl; external libserd0;
procedure serd_reader_add_blank_prefix(reader: PSerdReader; prefix: Puint8_t); cdecl; external libserd0;
procedure serd_reader_set_default_graph(reader: PSerdReader; graph: PSerdNode); cdecl; external libserd0;
function serd_reader_read_file(reader: PSerdReader; uri: Puint8_t): TSerdStatus; cdecl; external libserd0;
function serd_reader_start_stream(reader: PSerdReader; file_: PFILE; name: Puint8_t; bulk: boolean): TSerdStatus; cdecl; external libserd0;
function serd_reader_start_source_stream(reader: PSerdReader; read_func: TSerdSource; error_func: TSerdStreamErrorFunc; stream: pointer; name: Puint8_t;
  page_size: Tsize_t): TSerdStatus; cdecl; external libserd0;
function serd_reader_read_chunk(reader: PSerdReader): TSerdStatus; cdecl; external libserd0;
function serd_reader_end_stream(reader: PSerdReader): TSerdStatus; cdecl; external libserd0;
function serd_reader_read_file_handle(reader: PSerdReader; file_: PFILE; name: Puint8_t): TSerdStatus; cdecl; external libserd0;
function serd_reader_read_source(reader: PSerdReader; source: TSerdSource; error: TSerdStreamErrorFunc; stream: pointer; name: Puint8_t;
  page_size: Tsize_t): TSerdStatus; cdecl; external libserd0;
function serd_reader_read_string(reader: PSerdReader; utf8: pansichar): TSerdStatus; cdecl; external libserd0;
function serd_reader_skip_until_byte(reader: PSerdReader; byte: Tuint8_t): TSerdStatus; cdecl; external libserd0;
procedure serd_reader_free(reader: PSerdReader); cdecl; external libserd0;

type
  PSerdWriter = type Pointer;

type
  PSerdStyle = ^TSerdStyle;
  TSerdStyle = longint;

const
  SERD_STYLE_ABBREVIATED = 1 shl 0;
  SERD_STYLE_ASCII = 1 shl 1;
  SERD_STYLE_RESOLVED = 1 shl 2;
  SERD_STYLE_CURIED = 1 shl 3;
  SERD_STYLE_BULK = 1 shl 4;
  SERD_STYLE_STRICT = 1 shl 5;

function serd_writer_new(syntax: TSerdSyntax; style: TSerdStyle; env: PSerdEnv; base_uri: PSerdURI; ssink: TSerdSink;
  stream: pointer): PSerdWriter; cdecl; external libserd0;
procedure serd_writer_free(writer: PSerdWriter); cdecl; external libserd0;
function serd_writer_get_env(writer: PSerdWriter): PSerdEnv; cdecl; external libserd0;
function serd_file_sink(buf: pointer; len: Tsize_t; stream: pointer): Tsize_t; cdecl; external libserd0;
function serd_chunk_sink(buf: pointer; len: Tsize_t; stream: pointer): Tsize_t; cdecl; external libserd0;
function serd_chunk_sink_finish(stream: PSerdChunk): Puint8_t; cdecl; external libserd0;
procedure serd_writer_set_error_sink(writer: PSerdWriter; error_sink: TSerdErrorSink; error_handle: pointer); cdecl; external libserd0;
procedure serd_writer_chop_blank_prefix(writer: PSerdWriter; prefix: Puint8_t); cdecl; external libserd0;
function serd_writer_set_base_uri(writer: PSerdWriter; uri: PSerdNode): TSerdStatus; cdecl; external libserd0;
function serd_writer_set_root_uri(writer: PSerdWriter; uri: PSerdNode): TSerdStatus; cdecl; external libserd0;
function serd_writer_set_prefix(writer: PSerdWriter; name: PSerdNode; uri: PSerdNode): TSerdStatus; cdecl; external libserd0;
function serd_writer_write_statement(writer: PSerdWriter; flags: TSerdStatementFlags; graph: PSerdNode; subject: PSerdNode; predicate: PSerdNode;
  obj: PSerdNode; datatype: PSerdNode; lang: PSerdNode): TSerdStatus; cdecl; external libserd0;
function serd_writer_end_anon(writer: PSerdWriter; node: PSerdNode): TSerdStatus; cdecl; external libserd0;
function serd_writer_finish(writer: PSerdWriter): TSerdStatus; cdecl; external libserd0;

// === Konventiert am: 25-11-25 15:13:14 ===


implementation



end.
