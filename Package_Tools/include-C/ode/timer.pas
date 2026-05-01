unit timer;

interface

uses
  fp_ode;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TdStopwatch = record
    time: double;
    cc: array[0..1] of dword;
  end;
  PdStopwatch = ^TdStopwatch;

procedure dStopwatchReset(para1: PdStopwatch); cdecl; external libodes;
procedure dStopwatchStart(para1: PdStopwatch); cdecl; external libodes;
procedure dStopwatchStop(para1: PdStopwatch); cdecl; external libodes;
function dStopwatchTime(para1: PdStopwatch): double; cdecl; external libodes;
procedure dTimerStart(description: pchar); cdecl; external libodes;
procedure dTimerNow(description: pchar); cdecl; external libodes;
procedure dTimerEnd; cdecl; external libodes;
procedure dTimerReport(fout: PFILE; average: longint); cdecl; external libodes;
function dTimerTicksPerSecond: double; cdecl; external libodes;
function dTimerResolution: double; cdecl; external libodes;

// === Konventiert am: 30-4-26 17:09:07 ===


implementation



end.
