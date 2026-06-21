unit fp_histedit;

interface


const
  {$ifdef linux}
  libhistedit = 'edit';
  {$endif}

  {$ifdef windows}
  libhistedit = 'msys-edit-0.dll';
  {$endif}

type
  PFILE = type Pointer;
  Pwchar_t = type Pointer;
  PPwchar_t = ^Pwchar_t;
  PPPwchar_t = ^PPwchar_t;

  {$IFDEF linux}
  var
    stdin: PFILE; cvar; external 'c';
    stdout: PFILE; cvar; external 'c';
    stderr: PFILE; cvar; external 'c';
  {$ENDIF}

  {$IFDEF windows}
  function stdin: PFILE; inline;
  function stdout: PFILE; inline;
  function stderr: PFILE; inline;
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  LIBEDIT_MAJOR = 2;
  LIBEDIT_MINOR = 11;

type
  PEditLine = type Pointer;

  Tlineinfo = record
    buffer: pchar;
    cursor: pchar;
    lastchar: pchar;
  end;
  Plineinfo = ^Tlineinfo;

const
  CC_NORM = 0;
  CC_NEWLINE = 1;
  CC_EOF = 2;
  CC_ARGHACK = 3;
  CC_REFRESH = 4;
  CC_CURSOR = 5;
  CC_ERROR = 6;
  CC_FATAL = 7;
  CC_REDISPLAY = 8;
  CC_REFRESH_BEEP = 9;

function el_init(para1: pchar; para2: PFILE; para3: PFILE; para4: PFILE): PEditLine; cdecl; external libhistedit;
function el_init_fd(para1: pchar; para2: PFILE; para3: PFILE; para4: PFILE; para5: longint; para6: longint; para7: longint): PEditLine; cdecl; external libhistedit;
procedure el_end(para1: PEditLine); cdecl; external libhistedit;
procedure el_reset(para1: PEditLine); cdecl; external libhistedit;
function el_gets(para1: PEditLine; para2: Plongint): pchar; cdecl; external libhistedit;
function el_getc(para1: PEditLine; para2: pchar): longint; cdecl; external libhistedit;
procedure el_push(para1: PEditLine; para2: pchar); cdecl; external libhistedit;
procedure el_beep(para1: PEditLine); cdecl; external libhistedit;
function el_parse(para1: PEditLine; para2: longint; para3: PPchar): longint; cdecl; external libhistedit;
function el_set(para1: PEditLine; para2: longint): longint; cdecl; varargs; external libhistedit;
function el_get(para1: PEditLine; para2: longint): longint; cdecl; varargs; external libhistedit;
function _el_fn_complete(para1: PEditLine; para2: longint): byte; cdecl; external libhistedit;
function _el_fn_sh_complete(para1: PEditLine; para2: longint): byte; cdecl; external libhistedit;

const
  EL_PROMPT = 0;
  EL_TERMINAL = 1;
  EL_EDITOR = 2;
  EL_SIGNAL = 3;
  EL_BIND = 4;
  EL_TELLTC = 5;
  EL_SETTC = 6;
  EL_ECHOTC = 7;
  EL_SETTY = 8;
  EL_ADDFN = 9;
  EL_HIST = 10;
  EL_EDITMODE = 11;
  EL_RPROMPT = 12;
  EL_GETCFN = 13;
  EL_CLIENTDATA = 14;
  EL_UNBUFFERED = 15;
  EL_PREP_TERM = 16;
  EL_GETTC = 17;
  EL_GETFP = 18;
  EL_SETFP = 19;
  EL_REFRESH = 20;
  EL_PROMPT_ESC = 21;
  EL_RPROMPT_ESC = 22;
  EL_RESIZE_ = 23;
  EL_ALIAS_TEXT = 24;
  EL_SAFEREAD = 25;
  EL_BUILTIN_GETCFN = nil;

function el_source(para1: PEditLine; para2: pchar): longint; cdecl; external libhistedit;
procedure el_resize(para1: PEditLine); cdecl; external libhistedit;
function el_line(para1: PEditLine): PLineInfo; cdecl; external libhistedit;
function el_insertstr(para1: PEditLine; para2: pchar): longint; cdecl; external libhistedit;
procedure el_deletestr(para1: PEditLine; para2: longint); cdecl; external libhistedit;
function el_replacestr(para1: PEditLine; para2: pchar): longint; cdecl; external libhistedit;
function el_deletestr1(para1: PEditLine; para2: longint; para3: longint): longint; cdecl; external libhistedit;

type
  PHistory = type Pointer;

  THistEvent = record
    num: longint;
    str: pchar;
  end;
  PHistEvent = ^THistEvent;

function history_init: PHistory; cdecl; external libhistedit;
procedure history_end(para1: PHistory); cdecl; external libhistedit;
function history(para1: PHistory; para2: PHistEvent; para3: longint): longint; cdecl; varargs; external libhistedit;

const
  H_FUNC = 0;
  H_SETSIZE = 1;
  H_GETSIZE = 2;
  H_FIRST = 3;
  H_LAST = 4;
  H_PREV = 5;
  H_NEXT = 6;
  H_CURR = 8;
  H_SET = 7;
  H_ADD = 9;
  H_ENTER = 10;
  H_APPEND = 11;
  H_END = 12;
  H_NEXT_STR = 13;
  H_PREV_STR = 14;
  H_NEXT_EVENT = 15;
  H_PREV_EVENT = 16;
  H_LOAD = 17;
  H_SAVE = 18;
  H_CLEAR = 19;
  H_SETUNIQUE = 20;
  H_GETUNIQUE = 21;
  H_DEL = 22;
  H_NEXT_EVDATA = 23;
  H_DELDATA = 24;
  H_REPLACE = 25;
  H_SAVE_FP = 26;
  H_NSAVE_FP = 27;

type
  PTokenizer = type Pointer;

function tok_init(para1: pchar): PTokenizer; cdecl; external libhistedit;
procedure tok_end(para1: PTokenizer); cdecl; external libhistedit;
procedure tok_reset(para1: PTokenizer); cdecl; external libhistedit;
function tok_line(para1: PTokenizer; para2: PLineInfo; para3: Plongint; para4: PPPchar; para5: Plongint; para6: Plongint): longint; cdecl; external libhistedit;
function tok_str(para1: PTokenizer; para2: pchar; para3: Plongint; para4: PPPchar): longint; cdecl; external libhistedit;

function wcsdup(str: Pwchar_t): Pwchar_t; cdecl; external libhistedit;

type
  Tlineinfow = record
    buffer: Pwchar_t;
    cursor: Pwchar_t;
    lastchar: Pwchar_t;
  end;
  Plineinfow = ^Tlineinfow;

  Tel_rfunc_t = function(para1: PEditLine; para2: Pwchar_t): longint; cdecl;

function el_wgets(para1: PEditLine; para2: Plongint): Pwchar_t; cdecl; external libhistedit;
function el_wgetc(para1: PEditLine; para2: Pwchar_t): longint; cdecl; external libhistedit;
procedure el_wpush(para1: PEditLine; para2: Pwchar_t); cdecl; external libhistedit;
function el_wparse(para1: PEditLine; para2: longint; para3: PPwchar_t): longint; cdecl; external libhistedit;
function el_wset(para1: PEditLine; para2: longint): longint; cdecl; varargs; external libhistedit;
function el_wget(para1: PEditLine; para2: longint): longint; cdecl; varargs; external libhistedit;
function el_cursor(para1: PEditLine; para2: longint): longint; cdecl; external libhistedit;
function el_wline(para1: PEditLine): PLineInfoW; cdecl; external libhistedit;
function el_winsertstr(para1: PEditLine; para2: Pwchar_t): longint; cdecl; external libhistedit;

function el_wreplacestr(para1: PEditLine; para2: Pwchar_t): longint; cdecl; external libhistedit;

type
  ThisteventW = record
    num: longint;
    str: Pwchar_t;
  end;
  PhisteventW = ^ThisteventW;

  PHistoryW = type Pointer;

function history_winit: PHistoryW; cdecl; external libhistedit;
procedure history_wend(para1: PHistoryW); cdecl; external libhistedit;
function history_w(para1: PHistoryW; para2: PHistEventW; para3: longint): longint; cdecl; varargs; external libhistedit;

type
  PTokenizerW = type Pointer;

function tok_winit(para1: Pwchar_t): PTokenizerW; cdecl; external libhistedit;
procedure tok_wend(para1: PTokenizerW); cdecl; external libhistedit;
procedure tok_wreset(para1: PTokenizerW); cdecl; external libhistedit;
function tok_wline(para1: PTokenizerW; para2: PLineInfoW; para3: Plongint; para4: PPPwchar_t; para5: Plongint; para6: Plongint): longint; cdecl; external libhistedit;
function tok_wstr(para1: PTokenizerW; para2: Pwchar_t; para3: Plongint; para4: PPPwchar_t): longint; cdecl; external libhistedit;

// === Konventiert am: 21-6-26 13:32:42 ===


implementation

{$IFDEF windows}
function __iob_func: PFILE; cdecl; external 'msvcrt.dll';

function stdin: PFILE; inline;
begin
  Result := __iob_func + 0;
end;

function stdout: PFILE; inline;
begin
  Result := __iob_func + 48;
end;

function stderr: PFILE; inline;
begin
  Result := __iob_func + 96;
end;
{$ENDIF}

end.
