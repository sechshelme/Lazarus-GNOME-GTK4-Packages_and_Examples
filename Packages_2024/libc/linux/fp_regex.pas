unit fp_regex;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pre_size_t = ^Tre_size_t;
  Tre_size_t = Tsize_t;

  Pre_long_size_t = ^Tre_long_size_t;
  Tre_long_size_t = Tsize_t;

type
  Ps_reg_t = ^Ts_reg_t;
  Ts_reg_t = int64;

  Pactive_reg_t = ^Tactive_reg_t;
  Tactive_reg_t = uint64;

  Preg_syntax_t = ^Treg_syntax_t;
  Treg_syntax_t = uint64;

const
  RE_BACKSLASH_ESCAPE_IN_LISTS = uint64(1);

const
  RE_BK_PLUS_QM = RE_BACKSLASH_ESCAPE_IN_LISTS shl 1;
  RE_CHAR_CLASSES = RE_BK_PLUS_QM shl 1;
  RE_CONTEXT_INDEP_ANCHORS = RE_CHAR_CLASSES shl 1;
  RE_CONTEXT_INDEP_OPS = RE_CONTEXT_INDEP_ANCHORS shl 1;
  RE_CONTEXT_INVALID_OPS = RE_CONTEXT_INDEP_OPS shl 1;
  RE_DOT_NEWLINE = RE_CONTEXT_INVALID_OPS shl 1;
  RE_DOT_NOT_NULL = RE_DOT_NEWLINE shl 1;
  RE_HAT_LISTS_NOT_NEWLINE = RE_DOT_NOT_NULL shl 1;
  RE_INTERVALS = RE_HAT_LISTS_NOT_NEWLINE shl 1;
  RE_LIMITED_OPS = RE_INTERVALS shl 1;
  RE_NEWLINE_ALT = RE_LIMITED_OPS shl 1;
  RE_NO_BK_BRACES = RE_NEWLINE_ALT shl 1;
  RE_NO_BK_PARENS = RE_NO_BK_BRACES shl 1;
  RE_NO_BK_REFS = RE_NO_BK_PARENS shl 1;
  RE_NO_BK_VBAR = RE_NO_BK_REFS shl 1;
  RE_NO_EMPTY_RANGES = RE_NO_BK_VBAR shl 1;
  RE_UNMATCHED_RIGHT_PAREN_ORD = RE_NO_EMPTY_RANGES shl 1;
  RE_NO_POSIX_BACKTRACKING = RE_UNMATCHED_RIGHT_PAREN_ORD shl 1;
  RE_NO_GNU_OPS = RE_NO_POSIX_BACKTRACKING shl 1;
  RE_DEBUG = RE_NO_GNU_OPS shl 1;
  RE_INVALID_INTERVAL_ORD = RE_DEBUG shl 1;
  RE_ICASE = RE_INVALID_INTERVAL_ORD shl 1;
  RE_CARET_ANCHORS_HERE = RE_ICASE shl 1;
  RE_CONTEXT_INVALID_DUP = RE_CARET_ANCHORS_HERE shl 1;
  RE_NO_SUB = RE_CONTEXT_INVALID_DUP shl 1;

var
  re_syntax_options: Treg_syntax_t; cvar;external libc;

const
  _RE_SYNTAX_POSIX_COMMON = (((RE_CHAR_CLASSES or RE_DOT_NEWLINE) or RE_DOT_NOT_NULL) or RE_INTERVALS) or RE_NO_EMPTY_RANGES;
  RE_SYNTAX_POSIX_BASIC = (_RE_SYNTAX_POSIX_COMMON or RE_BK_PLUS_QM) or RE_CONTEXT_INVALID_DUP;
  RE_SYNTAX_POSIX_MINIMAL_BASIC = _RE_SYNTAX_POSIX_COMMON or RE_LIMITED_OPS;
  RE_SYNTAX_POSIX_EXTENDED = ((((((_RE_SYNTAX_POSIX_COMMON or RE_CONTEXT_INDEP_ANCHORS) or RE_CONTEXT_INDEP_OPS) or RE_NO_BK_BRACES) or RE_NO_BK_PARENS) or RE_NO_BK_VBAR) or RE_CONTEXT_INVALID_OPS) or RE_UNMATCHED_RIGHT_PAREN_ORD;
  RE_SYNTAX_POSIX_MINIMAL_EXTENDED = ((((((_RE_SYNTAX_POSIX_COMMON or RE_CONTEXT_INDEP_ANCHORS) or RE_CONTEXT_INVALID_OPS) or RE_NO_BK_BRACES) or RE_NO_BK_PARENS) or RE_NO_BK_REFS) or RE_NO_BK_VBAR) or RE_UNMATCHED_RIGHT_PAREN_ORD;

  RE_SYNTAX_EMACS = 0;
  RE_SYNTAX_AWK = (((((((((RE_BACKSLASH_ESCAPE_IN_LISTS or RE_DOT_NOT_NULL) or RE_NO_BK_PARENS) or RE_NO_BK_REFS) or RE_NO_BK_VBAR) or RE_NO_EMPTY_RANGES) or RE_DOT_NEWLINE) or RE_CONTEXT_INDEP_ANCHORS) or RE_CHAR_CLASSES) or RE_UNMATCHED_RIGHT_PAREN_ORD) or RE_NO_GNU_OPS;
  RE_SYNTAX_GNU_AWK = ((RE_SYNTAX_POSIX_EXTENDED or RE_BACKSLASH_ESCAPE_IN_LISTS) or RE_INVALID_INTERVAL_ORD) and (not ((RE_DOT_NOT_NULL or RE_CONTEXT_INDEP_OPS) or RE_CONTEXT_INVALID_OPS));
  RE_SYNTAX_POSIX_AWK = (((RE_SYNTAX_POSIX_EXTENDED or RE_BACKSLASH_ESCAPE_IN_LISTS) or RE_INTERVALS) or RE_NO_GNU_OPS) or RE_INVALID_INTERVAL_ORD;
  RE_SYNTAX_GREP = (RE_SYNTAX_POSIX_BASIC or RE_NEWLINE_ALT) and (not (RE_CONTEXT_INVALID_DUP or RE_DOT_NOT_NULL));
  RE_SYNTAX_EGREP = ((RE_SYNTAX_POSIX_EXTENDED or RE_INVALID_INTERVAL_ORD) or RE_NEWLINE_ALT) and (not (RE_CONTEXT_INVALID_OPS or RE_DOT_NOT_NULL));
  RE_SYNTAX_POSIX_EGREP = RE_SYNTAX_EGREP;
  RE_SYNTAX_ED = RE_SYNTAX_POSIX_BASIC;
  RE_SYNTAX_SED = RE_SYNTAX_POSIX_BASIC;

const
  RE_DUP_MAX = $7fff;

const
  REG_EXTENDED = 1;
  REG_ICASE = 1 shl 1;
  REG_NEWLINE = 1 shl 2;
  REG_NOSUB = 1 shl 3;
  REG_NOTBOL = 1;
  REG_NOTEOL = 1 shl 1;
  REG_STARTEND = 1 shl 2;

type
  Preg_errcode_t = ^Treg_errcode_t;
  Treg_errcode_t = longint;

const
  _REG_ENOSYS = -(1);
  _REG_NOERROR = 0;
  _REG_NOMATCH = 1;
  _REG_BADPAT = 2;
  _REG_ECOLLATE = 3;
  _REG_ECTYPE = 4;
  _REG_EESCAPE = 5;
  _REG_ESUBREG = 6;
  _REG_EBRACK = 7;
  _REG_EPAREN = 8;
  _REG_EBRACE = 9;
  _REG_BADBR = 10;
  _REG_ERANGE = 11;
  _REG_ESPACE = 12;
  _REG_BADRPT = 13;
  _REG_EEND = 14;
  _REG_ESIZE = 15;
  _REG_ERPAREN = 16;

const
  REG_ENOSYS = _REG_ENOSYS;

const
  REG_NOERROR = _REG_NOERROR;
  REG_NOMATCH = _REG_NOMATCH;
  REG_BADPAT = _REG_BADPAT;
  REG_ECOLLATE = _REG_ECOLLATE;
  REG_ECTYPE = _REG_ECTYPE;
  REG_EESCAPE = _REG_EESCAPE;
  REG_ESUBREG = _REG_ESUBREG;
  REG_EBRACK = _REG_EBRACK;
  REG_EPAREN = _REG_EPAREN;
  REG_EBRACE = _REG_EBRACE;
  REG_BADBR = _REG_BADBR;
  REG_ERANGE = _REG_ERANGE;
  REG_ESPACE = _REG_ESPACE;
  REG_BADRPT = _REG_BADRPT;
  REG_EEND = _REG_EEND;
  REG_ESIZE = _REG_ESIZE;
  REG_ERPAREN = _REG_ERPAREN;

type
  Tre_pattern_buffer = bitpacked record
    buffer: Pre_dfa_t;
    allocated: Tre_long_size_t;
    used: Tre_long_size_t;
    syntax: Treg_syntax_t;
    fastmap: pchar;
    translate: char;
    re_nsub: Tsize_t;

    can_be_null: 0..1;
    regs_allocated: 0..3;
    fastmap_accurate: 0..1;
    no_sub: 0..1;
    not_bol: 0..1;
    not_eol: 0..1;
    newline_anchor: 0..1;
  end;
  Pre_pattern_buffer = ^Tre_pattern_buffer;

  Pregex_t = Pre_pattern_buffer;

const
  REGS_UNALLOCATED = 0;
  REGS_REALLOCATE = 1;
  REGS_FIXED = 2;

type
  Pregoff_t = ^Tregoff_t;
  Tregoff_t = Tssize_t;

type
  Tre_registers = record
    num_regs: Tre_size_t;
    start: Pregoff_t;
    end_: Pregoff_t;
  end;
  Pre_registers = ^Tre_registers;

const
  RE_NREGS = 30;

type
  Tregmatch_t = record
    rm_so: Tregoff_t;
    rm_eo: Tregoff_t;
  end;
  Pregmatch_t = ^Tregmatch_t;

function re_set_syntax(__syntax: Treg_syntax_t): Treg_syntax_t; cdecl; external libc;
function re_compile_pattern(__pattern: pchar; __length: Tsize_t; __buffer: Pre_pattern_buffer): pchar; cdecl; external libc;
function re_compile_fastmap(__buffer: Pre_pattern_buffer): longint; cdecl; external libc;
function re_search(__buffer: Pre_pattern_buffer; __String: pchar; __length: Tregoff_t; __start: Tregoff_t; __range: Tregoff_t;
  __regs: Pre_registers): Tregoff_t; cdecl; external libc;
function re_search_2(__buffer: Pre_pattern_buffer; __string1: pchar; __length1: Tregoff_t; __string2: pchar; __length2: Tregoff_t;
  __start: Tregoff_t; __range: Tregoff_t; __regs: Pre_registers; __stop: Tregoff_t): Tregoff_t; cdecl; external libc;
function re_match(__buffer: Pre_pattern_buffer; __String: pchar; __length: Tregoff_t; __start: Tregoff_t; __regs: Pre_registers): Tregoff_t; cdecl; external libc;
function re_match_2(__buffer: Pre_pattern_buffer; __string1: pchar; __length1: Tregoff_t; __string2: pchar; __length2: Tregoff_t;
  __start: Tregoff_t; __regs: Pre_registers; __stop: Tregoff_t): Tregoff_t; cdecl; external libc;
procedure re_set_registers(__buffer: Pre_pattern_buffer; __regs: Pre_registers; __num_regs: Tre_size_t; __starts: Pregoff_t; __ends: Pregoff_t); cdecl; external libc;

function re_comp(para1: pchar): pchar; cdecl; external libc;
function re_exec(para1: pchar): longint; cdecl; external libc;

function regcomp(__preg: Pregex_t; __pattern: pchar; __cflags: longint): longint; cdecl; external libc;
function regexec(__preg: Pregex_t; __String: pchar; __nmatch: Tsize_t; __nmatch2: Pregmatch_t; __eflags: longint): longint; cdecl; external libc;
function regerror(__errcode: longint; __preg: Pregex_t; __errbuf: pchar; __errbuf_size: Tsize_t): Tsize_t; cdecl; external libc;
procedure regfree(__preg: Pregex_t); cdecl; external libc;

// === Konventiert am: 31-10-25 17:39:05 ===


implementation



end.
