unit misc;

interface

uses
  fp_ode, common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function dTestRand: longint; cdecl; external libodes;
function dRand: dword; cdecl; external libodes;
function dRandGetSeed: dword; cdecl; external libodes;
procedure dRandSetSeed(s: dword); cdecl; external libodes;
function dRandInt(n: longint): longint; cdecl; external libodes;
function dRandReal: TdReal; cdecl; external libodes;
procedure dPrintMatrix(A: PdReal; n: longint; m: longint; fmt: pchar; f: PFILE); cdecl; external libodes;
procedure dMakeRandomVector(A: PdReal; n: longint; range: TdReal); cdecl; external libodes;
procedure dMakeRandomMatrix(A: PdReal; n: longint; m: longint; range: TdReal); cdecl; external libodes;
procedure dClearUpperTriangle(A: PdReal; n: longint); cdecl; external libodes;
function dMaxDifference(A: PdReal; B: PdReal; n: longint; m: longint): TdReal; cdecl; external libodes;
function dMaxDifferenceLowerTriangle(A: PdReal; B: PdReal; n: longint): TdReal; cdecl; external libodes;

// === Konventiert am: 30-4-26 17:09:34 ===


implementation



end.
