{$IFDEF read_interface}


procedure dSetZero(a: PdReal; n: longint); cdecl; external libodes;
procedure dSetValue(a: PdReal; n: longint; value: TdReal); cdecl; external libodes;
function dDot(a: PdReal; b: PdReal; n: longint): TdReal; cdecl; external libodes;
procedure dMultiply0(A: PdReal; B: PdReal; C: PdReal; p: longint; q: longint; r: longint); cdecl; external libodes;
procedure dMultiply1(A: PdReal; B: PdReal; C: PdReal; p: longint; q: longint; r: longint); cdecl; external libodes;
procedure dMultiply2(A: PdReal; B: PdReal; C: PdReal; p: longint; q: longint; r: longint); cdecl; external libodes;
function dFactorCholesky(A: PdReal; n: longint): longint; cdecl; external libodes;
procedure dSolveCholesky(L: PdReal; b: PdReal; n: longint); cdecl; external libodes;
function dInvertPDMatrix(A: PdReal; Ainv: PdReal; n: longint): longint; cdecl; external libodes;
function dIsPositiveDefinite(A: PdReal; n: longint): longint; cdecl; external libodes;
procedure dFactorLDLT(A: PdReal; d: PdReal; n: longint; nskip: longint); cdecl; external libodes;
procedure dSolveL1(L: PdReal; b: PdReal; n: longint; nskip: longint); cdecl; external libodes;
procedure dSolveL1T(L: PdReal; b: PdReal; n: longint; nskip: longint); cdecl; external libodes;
procedure dScaleVector(a: PdReal; d: PdReal; n: longint); cdecl; external libodes;
procedure dVectorScale(a: PdReal; d: PdReal; n: longint); cdecl; external libodes; deprecated;
procedure dSolveLDLT(L: PdReal; d: PdReal; b: PdReal; n: longint; nskip: longint); cdecl; external libodes;
procedure dLDLTAddTL(L: PdReal; d: PdReal; a: PdReal; n: longint; nskip: longint); cdecl; external libodes;
procedure dLDLTRemove(A: PPdReal; p: Plongint; L: PdReal; d: PdReal; n1: longint; n2: longint; r: longint; nskip: longint); cdecl; external libodes;
procedure dRemoveRowCol(A: PdReal; n: longint; nskip: longint; r: longint); cdecl; external libodes;

// === Konventiert am: 30-4-26 17:09:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
