unit fp_tickit_termdrv;

interface

uses
  fp_tickit;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PTickitTermDriver = ^TTickitTermDriver;
  PTickitTermDriverVTable = ^TTickitTermDriverVTable;

  TTickitTermDriverVTable = record
    attach: procedure(ttd: PTickitTermDriver; tt: PTickitTerm); cdecl;
    Destroy: procedure(ttd: PTickitTermDriver); cdecl;
    start: procedure(ttd: PTickitTermDriver); cdecl;
    started: function(ttd: PTickitTermDriver): Tbool; cdecl;
    stop: procedure(ttd: PTickitTermDriver); cdecl;
    pause: procedure(ttd: PTickitTermDriver); cdecl;
    resume: procedure(ttd: PTickitTermDriver); cdecl;
    print: function(ttd: PTickitTermDriver; str: pchar; len: Tsize_t): Tbool; cdecl;
    goto_abs: function(ttd: PTickitTermDriver; line: longint; col: longint): Tbool; cdecl;
    move_rel: function(ttd: PTickitTermDriver; downward: longint; rightward: longint): Tbool; cdecl;
    scrollrect: function(ttd: PTickitTermDriver; rect: PTickitRect; downward: longint; rightward: longint): Tbool; cdecl;
    erasech: function(ttd: PTickitTermDriver; Count: longint; moveend: TTickitMaybeBool): Tbool; cdecl;
    Clear: function(ttd: PTickitTermDriver): Tbool; cdecl;
    chpen: function(ttd: PTickitTermDriver; delta: PTickitPen; final: PTickitPen): Tbool; cdecl;
    getctl_int: function(ttd: PTickitTermDriver; ctl: TTickitTermCtl; Value: Plongint): Tbool; cdecl;
    setctl_int: function(ttd: PTickitTermDriver; ctl: TTickitTermCtl; Value: longint): Tbool; cdecl;
    setctl_str: function(ttd: PTickitTermDriver; ctl: TTickitTermCtl; Value: pchar): Tbool; cdecl;
    on_modereport: function(ttd: PTickitTermDriver; initial: longint; mode: longint; Value: longint): longint; cdecl;
    on_decrqss: function(ttd: PTickitTermDriver; args: pchar; arglen: Tsize_t): longint; cdecl;
  end;

  TTickitTermDriver = record
    tt: PTickitTerm;
    vtable: PTickitTermDriverVTable;
    Name: pchar;
  end;


function tickit_termdrv_get_tmpbuffer(ttd: PTickitTermDriver; len: Tsize_t): pointer; cdecl; external libtickit;
procedure tickit_termdrv_write_str(ttd: PTickitTermDriver; str: pchar; len: Tsize_t); cdecl; external libtickit;
procedure tickit_termdrv_write_strf(ttd: PTickitTermDriver; fmt: pchar); cdecl; varargs external libtickit;
function tickit_termdrv_current_pen(ttd: PTickitTermDriver): PTickitPen; cdecl; external libtickit;
function tickit_term_get_driver(tt: PTickitTerm): PTickitTermDriver; cdecl; external libtickit;

// === Konventiert am: 2-5-25 13:40:52 ===


implementation



end.
