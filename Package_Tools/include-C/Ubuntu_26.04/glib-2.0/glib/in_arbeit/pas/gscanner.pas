unit gscanner;

interface

uses
  common_GLIB, gtypes, ghash, gdataset;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  G_CSET_A_2_Z_ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  G_CSET_a_2_z = 'abcdefghijklmnopqrstuvwxyz';
  G_CSET_DIGITS = '0123456789';
  G_CSET_LATINC =
    #&300#&301#&302#&303#&304#&305#&306#&307 +
    #&310#&311#&312#&313#&314#&315#&316#&317 +
    #&320#&321#&322#&323#&324#&325#&326 +
    #&330#&331#&332#&333#&334#&335#&336;
  G_CSET_LATINS =
    #&337#&340#&341#&342#&343#&344#&345#&346 +
    #&347#&350#&351#&352#&353#&354#&355#&356 +
    #&357#&360#&361#&362#&363#&364#&365#&366 +
    #&370#&371#&372#&373#&374#&375#&376#&377;

type
  PGErrorType = ^TGErrorType;
  TGErrorType = longint;
const
  G_ERR_UNKNOWN = 0;
  G_ERR_UNEXP_EOF = 1;
  G_ERR_UNEXP_EOF_IN_STRING = 2;
  G_ERR_UNEXP_EOF_IN_COMMENT = 3;
  G_ERR_NON_DIGIT_IN_CONST = 4;
  G_ERR_DIGIT_RADIX = 5;
  G_ERR_FLOAT_RADIX = 6;
  G_ERR_FLOAT_MALFORMED = 7;

type
  PGTokenType = ^TGTokenType;
  TGTokenType = longint;
const
  G_TOKEN_EOF = 0;
  G_TOKEN_LEFT_PAREN = '(';
  G_TOKEN_RIGHT_PAREN = ')';
  G_TOKEN_LEFT_CURLY = '{';
  G_TOKEN_RIGHT_CURLY = '}';
  G_TOKEN_LEFT_BRACE = '[';
  G_TOKEN_RIGHT_BRACE = ']';
  G_TOKEN_EQUAL_SIGN = '=';
  G_TOKEN_COMMA = ',';
  G_TOKEN_NONE = 256;
  G_TOKEN_ERROR = 257;
  G_TOKEN_CHAR = 258;
  G_TOKEN_BINARY = 259;
  G_TOKEN_OCTAL = 260;
  G_TOKEN_INT = 261;
  G_TOKEN_HEX = 262;
  G_TOKEN_FLOAT = 263;
  G_TOKEN_STRING = 264;
  G_TOKEN_SYMBOL = 265;
  G_TOKEN_IDENTIFIER = 266;
  G_TOKEN_IDENTIFIER_NULL = 267;
  G_TOKEN_COMMENT_SINGLE = 268;
  G_TOKEN_COMMENT_MULTI = 269;
  G_TOKEN_LAST = 270;

type
  PGTokenValue = ^TGTokenValue;
  TGTokenValue = record
    case longint of
      0: (v_symbol: Tgpointer);
      1: (v_identifier: Pgchar);
      2: (v_binary: Tgulong);
      3: (v_octal: Tgulong);
      4: (v_int: Tgulong);
      5: (v_int64: Tguint64);
      6: (v_float: Tgdouble);
      7: (v_hex: Tgulong);
      8: (v_string: Pgchar);
      9: (v_comment: Pgchar);
      10: (v_char: Tguchar);
      11: (v_error: Tguint);
  end;

  PGScannerConfig = ^TGScannerConfig;
  TGScannerConfig = bitpacked record
    cset_skip_characters: Pgchar;
    cset_identifier_first: Pgchar;
    cset_identifier_nth: Pgchar;
    cpair_comment_single: Pgchar;
    case_sensitive: 0..1;
    skip_comment_multi: 0..1;
    skip_comment_single: 0..1;
    scan_comment_multi: 0..1;
    scan_identifier: 0..1;
    scan_identifier_1char: 0..1;
    scan_identifier_NULL: 0..1;
    scan_symbols: 0..1;
    scan_binary: 0..1;
    scan_octal: 0..1;
    scan_float: 0..1;
    scan_hex: 0..1;
    scan_hex_dollar: 0..1;
    scan_string_sq: 0..1;
    scan_string_dq: 0..1;
    numbers_2_int: 0..1;
    int_2_float: 0..1;
    identifier_2_string: 0..1;
    char_2_token: 0..1;
    symbol_2_token: 0..1;
    scope_0_fallback: 0..1;
    store_int64: 0..1;
    padding_dummy: Tguint;
  end;

type
  PGScanner = ^TGScanner;

  TGScannerMsgFunc = procedure(scanner: PGScanner; message: Pgchar; error: Tgboolean); cdecl;

  TGScanner = record
    user_data: Tgpointer;
    max_parse_errors: Tguint;
    parse_errors: Tguint;
    input_name: Pgchar;
    qdata: PGData;
    config: PGScannerConfig;
    token: TGTokenType;
    value: TGTokenValue;
    line: Tguint;
    position: Tguint;
    next_token: TGTokenType;
    next_value: TGTokenValue;
    next_line: Tguint;
    next_position: Tguint;
    symbol_table: PGHashTable;
    input_fd: Tgint;
    text: Pgchar;
    text_end: Pgchar;
    buffer: Pgchar;
    scope_id: Tguint;
    msg_handler: TGScannerMsgFunc;
  end;

function g_scanner_new(config_templ: PGScannerConfig): PGScanner; cdecl; external libglib2;
procedure g_scanner_destroy(scanner: PGScanner); cdecl; external libglib2;
procedure g_scanner_input_file(scanner: PGScanner; input_fd: Tgint); cdecl; external libglib2;
procedure g_scanner_sync_file_offset(scanner: PGScanner); cdecl; external libglib2;
procedure g_scanner_input_text(scanner: PGScanner; text: Pgchar; text_len: Tguint); cdecl; external libglib2;
function g_scanner_get_next_token(scanner: PGScanner): TGTokenType; cdecl; external libglib2;
function g_scanner_peek_next_token(scanner: PGScanner): TGTokenType; cdecl; external libglib2;
function g_scanner_cur_token(scanner: PGScanner): TGTokenType; cdecl; external libglib2;
function g_scanner_cur_value(scanner: PGScanner): TGTokenValue; cdecl; external libglib2;
function g_scanner_cur_line(scanner: PGScanner): Tguint; cdecl; external libglib2;
function g_scanner_cur_position(scanner: PGScanner): Tguint; cdecl; external libglib2;
function g_scanner_eof(scanner: PGScanner): Tgboolean; cdecl; external libglib2;
function g_scanner_set_scope(scanner: PGScanner; scope_id: Tguint): Tguint; cdecl; external libglib2;
procedure g_scanner_scope_add_symbol(scanner: PGScanner; scope_id: Tguint; symbol: Pgchar; value: Tgpointer); cdecl; external libglib2;
procedure g_scanner_scope_remove_symbol(scanner: PGScanner; scope_id: Tguint; symbol: Pgchar); cdecl; external libglib2;
function g_scanner_scope_lookup_symbol(scanner: PGScanner; scope_id: Tguint; symbol: Pgchar): Tgpointer; cdecl; external libglib2;
procedure g_scanner_scope_foreach_symbol(scanner: PGScanner; scope_id: Tguint; func: TGHFunc; user_data: Tgpointer); cdecl; external libglib2;
function g_scanner_lookup_symbol(scanner: PGScanner; symbol: Pgchar): Tgpointer; cdecl; external libglib2;
procedure g_scanner_unexp_token(scanner: PGScanner; expected_token: TGTokenType; identifier_spec: Pgchar; symbol_spec: Pgchar; symbol_name: Pgchar;
  message: Pgchar; is_error: Tgint); cdecl; external libglib2;
procedure g_scanner_error(scanner: PGScanner; format: Pgchar); cdecl; varargs; external libglib2;
procedure g_scanner_warn(scanner: PGScanner; format: Pgchar); cdecl; varargs; external libglib2;

// === Konventiert am: 22-6-26 19:22:47 ===


implementation


end.
