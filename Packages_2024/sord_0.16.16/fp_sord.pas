unit fp_sord;

interface

uses
  fp_serd;

const
  {$IFDEF Linux}
  libsord0 = 'sord-0';
  {$ENDIF}

  {$IFDEF Windows}
  libsord0 = 'sord-0.dll';  // ??????
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


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PSordWorld = type Pointer;
  PSordModel = type Pointer;
  PSordInserter = type Pointer;
  PSordIter = type Pointer;
  PSordNode = type Pointer;

  PSordQuad = ^TSordQuad;
  TSordQuad = array[0..3] of PSordNode;

type
  PSordQuadIndex = ^TSordQuadIndex;
  TSordQuadIndex = longint;

const
  SORD_SUBJECT = 0;
  SORD_PREDICATE = 1;
  SORD_OBJECT = 2;
  SORD_GRAPH = 3;

type
  PSordNodeType = ^TSordNodeType;
  TSordNodeType = longint;

const
  SORD_URI = 1;
  SORD_BLANK = 2;
  SORD_LITERAL = 3;

type
  PSordIndexOption = ^TSordIndexOption;
  TSordIndexOption = longint;

const
  SORD_SPO = 1;
  SORD_SOP = 1 shl 1;
  SORD_OPS = 1 shl 2;
  SORD_OSP = 1 shl 3;
  SORD_PSO = 1 shl 4;
  SORD_POS = 1 shl 5;

function sord_world_new: PSordWorld; cdecl; external libsord0;
procedure sord_world_free(world: PSordWorld); cdecl; external libsord0;
procedure sord_world_set_error_sink(world: PSordWorld; error_sink: TSerdErrorSink; handle: pointer); cdecl; external libsord0;
function sord_new_uri(world: PSordWorld; uri: PAnsiChar): PSordNode; cdecl; external libsord0;
function sord_new_relative_uri(world: PSordWorld; uri: PAnsiChar; base_uri: Puint8_t): PSordNode; cdecl; external libsord0;
function sord_new_blank(world: PSordWorld; str: PAnsiChar): PSordNode; cdecl; external libsord0;
function sord_new_literal(world: PSordWorld; datatype: PSordNode; str: PAnsiChar; lang: pchar): PSordNode; cdecl; external libsord0;
function sord_node_copy(node: PSordNode): PSordNode; cdecl; external libsord0;
procedure sord_node_free(world: PSordWorld; node: PSordNode); cdecl; external libsord0;
function sord_node_get_type(node: PSordNode): TSordNodeType; cdecl; external libsord0;
function sord_node_get_string(node: PSordNode): PAnsiChar; cdecl; external libsord0;
function sord_node_get_string_counted(node: PSordNode; bytes: Psize_t): PAnsiChar; cdecl; external libsord0;
function sord_node_get_string_measured(node: PSordNode; bytes: Psize_t; chars: Psize_t): PAnsiChar; cdecl; external libsord0;
function sord_node_get_language(node: PSordNode): pchar; cdecl; external libsord0;
function sord_node_get_datatype(node: PSordNode): PSordNode; cdecl; external libsord0;
function sord_node_get_flags(node: PSordNode): TSerdNodeFlags; cdecl; external libsord0;
function sord_node_is_inline_object(node: PSordNode): boolean; cdecl; external libsord0;
function sord_node_equals(a: PSordNode; b: PSordNode): boolean; cdecl; external libsord0;
function sord_node_to_serd_node(node: PSordNode): PSerdNode; cdecl; external libsord0;
function sord_node_from_serd_node(world: PSordWorld; env: PSerdEnv; node: PSerdNode; datatype: PSerdNode; lang: PSerdNode): PSordNode; cdecl; external libsord0;
function sord_new(world: PSordWorld; indices: dword; graphs: boolean): PSordModel; cdecl; external libsord0;
procedure sord_free(model: PSordModel); cdecl; external libsord0;
function sord_get_world(model: PSordModel): PSordWorld; cdecl; external libsord0;
function sord_num_nodes(world: PSordWorld): Tsize_t; cdecl; external libsord0;
function sord_num_quads(model: PSordModel): Tsize_t; cdecl; external libsord0;
function sord_begin(model: PSordModel): PSordIter; cdecl; external libsord0;
function sord_find(model: PSordModel; pat: TSordQuad): PSordIter; cdecl; external libsord0;
function sord_search(model: PSordModel; s: PSordNode; p: PSordNode; o: PSordNode; g: PSordNode): PSordIter; cdecl; external libsord0;
function sord_get(model: PSordModel; s: PSordNode; p: PSordNode; o: PSordNode; g: PSordNode): PSordNode; cdecl; external libsord0;
function sord_ask(model: PSordModel; s: PSordNode; p: PSordNode; o: PSordNode; g: PSordNode): boolean; cdecl; external libsord0;
function sord_count(model: PSordModel; s: PSordNode; p: PSordNode; o: PSordNode; g: PSordNode): Tuint64_t; cdecl; external libsord0;
function sord_contains(model: PSordModel; pat: TSordQuad): boolean; cdecl; external libsord0;
function sord_add(model: PSordModel; tup: TSordQuad): boolean; cdecl; external libsord0;
procedure sord_remove(model: PSordModel; tup: TSordQuad); cdecl; external libsord0;
function sord_erase(model: PSordModel; iter: PSordIter): TSerdStatus; cdecl; external libsord0;
function sord_inserter_new(model: PSordModel; env: PSerdEnv): PSordInserter; cdecl; external libsord0;
procedure sord_inserter_free(inserter: PSordInserter); cdecl; external libsord0;
function sord_inserter_set_base_uri(inserter: PSordInserter; uri: PSerdNode): TSerdStatus; cdecl; external libsord0;
function sord_inserter_set_prefix(inserter: PSordInserter; name: PSerdNode; uri: PSerdNode): TSerdStatus; cdecl; external libsord0;
function sord_inserter_write_statement(inserter: PSordInserter; flags: TSerdStatementFlags; graph: PSerdNode; subject: PSerdNode; predicate: PSerdNode;
  obj: PSerdNode; object_datatype: PSerdNode; object_lang: PSerdNode): TSerdStatus; cdecl; external libsord0;
procedure sord_iter_get(iter: PSordIter; tup: TSordQuad); cdecl; external libsord0;
function sord_iter_get_node(iter: PSordIter; index: TSordQuadIndex): PSordNode; cdecl; external libsord0;
function sord_iter_get_model(iter: PSordIter): PSordModel; cdecl; external libsord0;
function sord_iter_next(iter: PSordIter): boolean; cdecl; external libsord0;
function sord_iter_end(iter: PSordIter): boolean; cdecl; external libsord0;
procedure sord_iter_free(iter: PSordIter); cdecl; external libsord0;
function sord_quad_match(x: TSordQuad; y: TSordQuad): boolean; cdecl; external libsord0;
function sord_new_reader(model: PSordModel; env: PSerdEnv; syntax: TSerdSyntax; graph: PSordNode): PSerdReader; cdecl; external libsord0;
function sord_write(model: PSordModel; writer: PSerdWriter; graph: PSordNode): boolean; cdecl; external libsord0;
function sord_write_iter(iter: PSordIter; writer: PSerdWriter): boolean; cdecl; external libsord0;

// === Konventiert am: 25-11-25 17:36:45 ===


implementation



end.
