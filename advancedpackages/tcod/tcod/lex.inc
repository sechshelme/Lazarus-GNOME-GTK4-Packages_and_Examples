{$IFDEF read_interface}


const
  TCOD_LEX_FLAG_NOCASE = 1;
  TCOD_LEX_FLAG_NESTING_COMMENT = 2;
  TCOD_LEX_FLAG_TOKENIZE_COMMENTS = 4;
  TCOD_LEX_ERROR = -(1);
  TCOD_LEX_UNKNOWN = 0;
  TCOD_LEX_SYMBOL = 1;
  TCOD_LEX_KEYWORD = 2;
  TCOD_LEX_IDEN = 3;
  TCOD_LEX_STRING = 4;
  TCOD_LEX_INTEGER = 5;
  TCOD_LEX_FLOAT = 6;
  TCOD_LEX_CHAR = 7;
  TCOD_LEX_EOF = 8;
  TCOD_LEX_COMMENT = 9;
  TCOD_LEX_MAX_SYMBOLS = 100;
  TCOD_LEX_SYMBOL_SIZE = 5;
  TCOD_LEX_MAX_KEYWORDS = 100;
  TCOD_LEX_KEYWORD_SIZE = 20;

type
  TTCOD_lex_t = record
    file_line: longint;
    token_type: longint;
    token_int_val: longint;
    token_idx: longint;
    token_float_val: single;
    tok: pchar;
    toklen: longint;
    lastStringDelim: char;
    pos: pchar;
    buf: pchar;
    filename: pchar;
    last_javadoc_comment: pchar;
    nb_symbols: longint;
    nb_keywords: longint;
    flags: longint;
    symbols: array[0..(TCOD_LEX_MAX_SYMBOLS) - 1] of array[0..(TCOD_LEX_SYMBOL_SIZE) - 1] of char;
    keywords: array[0..(TCOD_LEX_MAX_KEYWORDS) - 1] of array[0..(TCOD_LEX_KEYWORD_SIZE) - 1] of char;
    simpleCmt: pchar;
    cmtStart: pchar;
    cmtStop: pchar;
    javadocCmtStart: pchar;
    stringDelim: pchar;
    javadoc_read: Tbool;
    allocBuf: Tbool;
    savept: Tbool;
  end;
  PTCOD_lex_t = ^TTCOD_lex_t;

function TCOD_lex_new_intern: PTCOD_lex_t; cdecl; external libtcod;
function TCOD_lex_new(symbols: PPchar; keywords: PPchar; simpleComment: pchar; commentStart: pchar; commentStop: pchar;
  javadocCommentStart: pchar; stringDelim: pchar; flags: longint): PTCOD_lex_t; cdecl; external libtcod;
procedure TCOD_lex_delete(lex: PTCOD_lex_t); cdecl; external libtcod;
procedure TCOD_lex_set_data_buffer(lex: PTCOD_lex_t; dat: pchar); cdecl; external libtcod;
function TCOD_lex_set_data_file(lex: PTCOD_lex_t; filename: pchar): Tbool; cdecl; external libtcod;
function TCOD_lex_parse(lex: PTCOD_lex_t): longint; cdecl; external libtcod;
function TCOD_lex_parse_until_token_type(lex: PTCOD_lex_t; token_type: longint): longint; cdecl; external libtcod;
function TCOD_lex_parse_until_token_value(lex: PTCOD_lex_t; token_value: pchar): longint; cdecl; external libtcod;
function TCOD_lex_expect_token_type(lex: PTCOD_lex_t; token_type: longint): Tbool; cdecl; external libtcod;
function TCOD_lex_expect_token_value(lex: PTCOD_lex_t; token_type: longint; token_value: pchar): Tbool; cdecl; external libtcod;
procedure TCOD_lex_savepoint(lex: PTCOD_lex_t; savept: PTCOD_lex_t); cdecl; external libtcod;
procedure TCOD_lex_restore(lex: PTCOD_lex_t; savept: PTCOD_lex_t); cdecl; external libtcod;
function TCOD_lex_get_last_javadoc(lex: PTCOD_lex_t): pchar; cdecl; external libtcod;
function TCOD_lex_get_token_name(token_type: longint): pchar; cdecl; external libtcod;
function TCOD_lex_get_last_error: pchar; cdecl; external libtcod;
function TCOD_lex_hextoint(c: char): longint; cdecl; external libtcod;

// === Konventiert am: 10-9-25 13:49:30 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
