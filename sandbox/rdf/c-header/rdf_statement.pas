unit rdf_statement;

interface

uses
  fp_rdf, rdf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Plibrdf_statement_part = ^Tlibrdf_statement_part;
  Tlibrdf_statement_part = longint;

const
  LIBRDF_STATEMENT_SUBJECT = 1 shl 0;
  LIBRDF_STATEMENT_PREDICATE = 1 shl 1;
  LIBRDF_STATEMENT_OBJECT = 1 shl 2;
  LIBRDF_STATEMENT_ALL = (LIBRDF_STATEMENT_SUBJECT or LIBRDF_STATEMENT_PREDICATE) or LIBRDF_STATEMENT_OBJECT;

function librdf_new_statement(world: Plibrdf_world): Plibrdf_statement; cdecl; external librdf;
function librdf_new_statement_from_statement(statement: Plibrdf_statement): Plibrdf_statement; cdecl; external librdf;
function librdf_new_statement_from_statement2(statement: Plibrdf_statement): Plibrdf_statement; cdecl; external librdf;
function librdf_new_statement_from_nodes(world: Plibrdf_world; subject: Plibrdf_node; predicate: Plibrdf_node; obj: Plibrdf_node): Plibrdf_statement; cdecl; external librdf;
procedure librdf_statement_init(world: Plibrdf_world; statement: Plibrdf_statement); cdecl; external librdf;
procedure librdf_statement_clear(statement: Plibrdf_statement); cdecl; external librdf;
procedure librdf_free_statement(statement: Plibrdf_statement); cdecl; external librdf;
function librdf_statement_get_subject(statement: Plibrdf_statement): Plibrdf_node; cdecl; external librdf;
procedure librdf_statement_set_subject(statement: Plibrdf_statement; node: Plibrdf_node); cdecl; external librdf;
function librdf_statement_get_predicate(statement: Plibrdf_statement): Plibrdf_node; cdecl; external librdf;
procedure librdf_statement_set_predicate(statement: Plibrdf_statement; node: Plibrdf_node); cdecl; external librdf;
function librdf_statement_get_object(statement: Plibrdf_statement): Plibrdf_node; cdecl; external librdf;
procedure librdf_statement_set_object(statement: Plibrdf_statement; node: Plibrdf_node); cdecl; external librdf;
function librdf_statement_is_complete(statement: Plibrdf_statement): longint; cdecl; external librdf;
function librdf_statement_to_string(statement: Plibrdf_statement): pbyte; cdecl; external librdf; deprecated;
function librdf_statement_write(statement: Plibrdf_statement; iostr: Praptor_iostream): longint; cdecl; external librdf;
procedure librdf_statement_print(statement: Plibrdf_statement; fh: PFILE); cdecl; external librdf;
function librdf_statement_equals(statement1: Plibrdf_statement; statement2: Plibrdf_statement): longint; cdecl; external librdf;
function librdf_statement_match(statement: Plibrdf_statement; partial_statement: Plibrdf_statement): longint; cdecl; external librdf;
function librdf_statement_encode(statement: Plibrdf_statement; buffer: pbyte; length: Tsize_t): Tsize_t; cdecl; external librdf; deprecated;
function librdf_statement_encode2(world: Plibrdf_world; statement: Plibrdf_statement; buffer: pbyte; length: Tsize_t): Tsize_t; cdecl; external librdf;
function librdf_statement_encode_parts(statement: Plibrdf_statement; context_node: Plibrdf_node; buffer: pbyte; length: Tsize_t; fields: Tlibrdf_statement_part): Tsize_t; cdecl; external librdf; deprecated;
function librdf_statement_encode_parts2(world: Plibrdf_world; statement: Plibrdf_statement; context_node: Plibrdf_node; buffer: pbyte; length: Tsize_t;
  fields: Tlibrdf_statement_part): Tsize_t; cdecl; external librdf;
function librdf_statement_decode(statement: Plibrdf_statement; buffer: pbyte; length: Tsize_t): Tsize_t; cdecl; external librdf; deprecated;
function librdf_statement_decode2(world: Plibrdf_world; statement: Plibrdf_statement; context_node: PPlibrdf_node; buffer: pbyte; length: Tsize_t): Tsize_t; cdecl; external librdf;
function librdf_statement_decode_parts(statement: Plibrdf_statement; context_node: PPlibrdf_node; buffer: pbyte; length: Tsize_t): Tsize_t; cdecl; external librdf; deprecated;

// === Konventiert am: 27-11-25 17:39:12 ===


implementation



end.
