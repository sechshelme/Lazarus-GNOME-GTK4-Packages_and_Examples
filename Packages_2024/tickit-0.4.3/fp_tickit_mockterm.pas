unit fp_tickit_mockterm;

interface

uses
  fp_tickit;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  LOG_GOTO = 1;
  LOG_PRINT = 2;
  LOG_ERASECH = 3;
  LOG_CLEAR = 4;
  LOG_SCROLLRECT = 5;
  LOG_SETPEN = 6;

type
  TTickitMockTermLogEntry = record
    _type: longint;
    val1: longint;
    val2: longint;
    str: pchar;
    rect: TTickitRect;
    pen: PTickitPen;
  end;
  PTickitMockTermLogEntry = ^TTickitMockTermLogEntry;

type
  PTickitMockTerm = PTickitTerm;

function tickit_mockterm_new(Lines: longint; cols: longint): PTickitMockTerm; cdecl; external libtickit;
procedure tickit_mockterm_destroy(mt: PTickitMockTerm); cdecl; external libtickit;
procedure tickit_mockterm_resize(mt: PTickitMockTerm; newlines: longint; newcols: longint); cdecl; external libtickit;
function tickit_mockterm_get_display_text(mt: PTickitMockTerm; buffer: pchar; len: Tsize_t; line: longint; col: longint;
  Width: longint): Tsize_t; cdecl; external libtickit;
function tickit_mockterm_get_display_pen(mt: PTickitMockTerm; line: longint; col: longint): PTickitPen; cdecl; external libtickit;
function tickit_mockterm_loglen(mt: PTickitMockTerm): longint; cdecl; external libtickit;
function tickit_mockterm_peeklog(mt: PTickitMockTerm; i: longint): PTickitMockTermLogEntry; cdecl; external libtickit;
procedure tickit_mockterm_clearlog(mt: PTickitMockTerm); cdecl; external libtickit;
procedure tickit_mockterm_get_position(mt: PTickitMockTerm; line: Plongint; col: Plongint); cdecl; external libtickit;

// === Konventiert am: 2-5-25 13:40:48 ===


implementation



end.
