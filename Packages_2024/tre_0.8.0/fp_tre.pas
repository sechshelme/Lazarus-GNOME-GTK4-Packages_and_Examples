unit fp_tre;

interface

const
  {$IFDEF Linux}
  libtre = 'tre';
  {$ENDIF}

  {$IFDEF mswindows}
  libtre = 'libtre-5.dd';  // ????
  {$ENDIF}

type
  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  Pwchar_t = type Pointer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pregoff_t = ^Tregoff_t;
  Tregoff_t = longint;

  Tregex_t = record
    re_nsub: Tsize_t;
    value: pointer;
  end;
  Pregex_t = ^Tregex_t;

  Tregmatch_t = record
    rm_so: Tregoff_t;
    rm_eo: Tregoff_t;
  end;
  Pregmatch_t = ^Tregmatch_t;

type
  Preg_errcode_t = ^Treg_errcode_t;
  Treg_errcode_t = longint;

const
  REG_OK = 0;
  REG_NOMATCH = 1;
  REG_BADPAT = 2;
  REG_ECOLLATE = 3;
  REG_ECTYPE = 4;
  REG_EESCAPE = 5;
  REG_ESUBREG = 6;
  REG_EBRACK = 7;
  REG_EPAREN = 8;
  REG_EBRACE = 9;
  REG_BADBR = 10;
  REG_ERANGE = 11;
  REG_ESPACE = 12;
  REG_BADRPT = 13;

const
  REG_EXTENDED = 1;
  REG_ICASE = REG_EXTENDED shl 1;
  REG_NEWLINE = REG_ICASE shl 1;
  REG_NOSUB = REG_NEWLINE shl 1;
  REG_BASIC = 0;
  REG_LITERAL = REG_NOSUB shl 1;
  REG_RIGHT_ASSOC = REG_LITERAL shl 1;
  REG_UNGREEDY = REG_RIGHT_ASSOC shl 1;
  REG_NOTBOL = 1;
  REG_NOTEOL = REG_NOTBOL shl 1;
  REG_APPROX_MATCHER = REG_NOTEOL shl 1;
  REG_BACKTRACKING_MATCHER = REG_APPROX_MATCHER shl 1;

const
  REG_NOSPEC = REG_LITERAL;

const
  RE_DUP_MAX = 255;

function tre_regcomp(preg: Pregex_t; regex: pchar; cflags: longint): longint; cdecl; external libtre;
function tre_regexec(preg: Pregex_t; _string: pchar; nmatch: Tsize_t; pmatch: Pregmatch_t; eflags: longint): longint; cdecl; external libtre;
function tre_regerror(errcode: longint; preg: Pregex_t; errbuf: pchar; errbuf_size: Tsize_t): Tsize_t; cdecl; external libtre;
procedure tre_regfree(preg: Pregex_t); cdecl; external libtre;

function tre_regwcomp(preg: Pregex_t; regex: Pwchar_t; cflags: longint): longint; cdecl; external libtre;
function tre_regwexec(preg: Pregex_t; _string: Pwchar_t; nmatch: Tsize_t; pmatch: Pregmatch_t; eflags: longint): longint; cdecl; external libtre;

function tre_regncomp(preg: Pregex_t; regex: pchar; len: Tsize_t; cflags: longint): longint; cdecl; external libtre;
function tre_regnexec(preg: Pregex_t; _string: pchar; len: Tsize_t; nmatch: Tsize_t; pmatch: Pregmatch_t; eflags: longint): longint; cdecl; external libtre;

function tre_regwncomp(preg: Pregex_t; regex: Pwchar_t; len: Tsize_t; cflags: longint): longint; cdecl; external libtre;
function tre_regwnexec(preg: Pregex_t; _string: Pwchar_t; len: Tsize_t; nmatch: Tsize_t; pmatch: Pregmatch_t; eflags: longint): longint; cdecl; external libtre;

type
  Tregaparams_t = record
    cost_ins: longint;
    cost_del: longint;
    cost_subst: longint;
    max_cost: longint;
    max_ins: longint;
    max_del: longint;
    max_subst: longint;
    max_err: longint;
  end;
  Pregaparams_t = ^Tregaparams_t;

  Tregamatch_t = record
    nmatch: Tsize_t;
    pmatch: Pregmatch_t;
    cost: longint;
    num_ins: longint;
    num_del: longint;
    num_subst: longint;
  end;
  Pregamatch_t = ^Tregamatch_t;

function tre_regaexec(preg: Pregex_t; _string: pchar; match: Pregamatch_t; params: Tregaparams_t; eflags: longint): longint; cdecl; external libtre;
function tre_reganexec(preg: Pregex_t; _string: pchar; len: Tsize_t; match: Pregamatch_t; params: Tregaparams_t;
  eflags: longint): longint; cdecl; external libtre;

function tre_regawexec(preg: Pregex_t; _string: Pwchar_t; match: Pregamatch_t; params: Tregaparams_t; eflags: longint): longint; cdecl; external libtre;
function tre_regawnexec(preg: Pregex_t; _string: Pwchar_t; len: Tsize_t; match: Pregamatch_t; params: Tregaparams_t;
  eflags: longint): longint; cdecl; external libtre;

procedure tre_regaparams_default(params: Pregaparams_t); cdecl; external libtre;

type
  Ptre_char_t = type Pointer;

type
  Ttre_str_source = record
    get_next_char: function(c: Ptre_char_t; pos_add: Pdword; context: pointer): longint; cdecl;
    rewind: procedure(pos: Tsize_t; context: pointer); cdecl;
    compare: function(pos1: Tsize_t; pos2: Tsize_t; len: Tsize_t; context: pointer): longint; cdecl;
    context: pointer;
  end;
  Ptre_str_source = ^Ttre_str_source;

function tre_reguexec(preg: Pregex_t; _string: Ptre_str_source; nmatch: Tsize_t; pmatch: Pregmatch_t; eflags: longint): longint; cdecl; external libtre;
function tre_version: pchar; cdecl; external libtre;
function tre_config(query: longint; result: pointer): longint; cdecl; external libtre;

const
  TRE_CONFIG_APPROX = 0;
  TRE_CONFIG_WCHAR = 1;
  TRE_CONFIG_MULTIBYTE = 2;
  TRE_CONFIG_SYSTEM_ABI = 3;
  TRE_CONFIG_VERSION = 4;

function tre_have_backrefs(preg: Pregex_t): longint; cdecl; external libtre;
function tre_have_approx(preg: Pregex_t): longint; cdecl; external libtre;

// === Konventiert am: 28-12-25 17:13:13 ===


implementation



end.
