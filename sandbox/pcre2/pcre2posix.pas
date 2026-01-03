unit pcre2posix;

interface

uses
  fp_pcre2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  REG_ICASE = $0001;
  REG_NEWLINE = $0002;
  REG_NOTBOL = $0004;
  REG_NOTEOL = $0008;
  REG_DOTALL = $0010;
  REG_NOSUB = $0020;
  REG_UTF = $0040;
  REG_STARTEND = $0080;
  REG_NOTEMPTY = $0100;
  REG_UNGREEDY = $0200;
  REG_UCP = $0400;
  REG_PEND = $0800;
  REG_NOSPEC = $1000;
  REG_EXTENDED = 0;

const
  REG_ASSERT = 1;
  REG_BADBR = 2;
  REG_BADPAT = 3;
  REG_BADRPT = 4;
  REG_EBRACE = 5;
  REG_EBRACK = 6;
  REG_ECOLLATE = 7;
  REG_ECTYPE = 8;
  REG_EESCAPE = 9;
  REG_EMPTY = 10;
  REG_EPAREN = 11;
  REG_ERANGE = 12;
  REG_ESIZE = 13;
  REG_ESPACE = 14;
  REG_ESUBREG = 15;
  REG_INVARG = 16;
  REG_NOMATCH = 17;

type
  Tregex_t = record
    re_pcre2_code: pointer;
    re_match_data: pointer;
    re_endp: pchar;
    re_nsub: Tsize_t;
    re_erroffset: Tsize_t;
    re_cflags: longint;
  end;
  Pregex_t = ^Tregex_t;

  Pregoff_t = ^Tregoff_t;
  Tregoff_t = longint;

  Tregmatch_t = record
    rm_so: Tregoff_t;
    rm_eo: Tregoff_t;
  end;
  Pregmatch_t = ^Tregmatch_t;

function pcre2_regcomp(para1: Pregex_t; para2: pchar; para3: longint): longint; cdecl; external libpcre2;
function pcre2_regexec(para1: Pregex_t; para2: pchar; para3: Tsize_t; para4: Pregmatch_t; para5: longint): longint; cdecl; external libpcre2;
function pcre2_regerror(para1: longint; para2: Pregex_t; para3: pchar; para4: Tsize_t): Tsize_t; cdecl; external libpcre2;
procedure pcre2_regfree(para1: Pregex_t); cdecl; external libpcre2;

const
  PCRE2regcomp = pcre2_regcomp;
  PCRE2regexec = pcre2_regexec;
  PCRE2regerror = pcre2_regerror;
  PCRE2regfree = pcre2_regfree;

  // === Konventiert am: 3-1-26 19:51:39 ===


implementation



end.
