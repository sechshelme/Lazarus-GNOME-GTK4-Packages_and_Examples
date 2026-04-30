unit memory;

interface

uses
  fp_ode, odeconfig;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TdAllocFunction = function(size: Tdsizeint): pointer; cdecl;
  TdReallocFunction = function(ptr: pointer; oldsize: Tdsizeint; newsize: Tdsizeint): pointer; cdecl;
  TdFreeFunction = procedure(ptr: pointer; size: Tdsizeint); cdecl;

procedure dSetAllocHandler(fn: TdAllocFunction); cdecl; external libodes;
procedure dSetReallocHandler(fn: TdReallocFunction); cdecl; external libodes;
procedure dSetFreeHandler(fn: TdFreeFunction); cdecl; external libodes;
function dGetAllocHandler: TdAllocFunction; cdecl; external libodes;
function dGetReallocHandler: TdReallocFunction; cdecl; external libodes;
function dGetFreeHandler: TdFreeFunction; cdecl; external libodes;
function dAlloc(size: Tdsizeint): pointer; cdecl; external libodes;
function dRealloc(ptr: pointer; oldsize: Tdsizeint; newsize: Tdsizeint): pointer; cdecl; external libodes;
procedure dFree(ptr: pointer; size: Tdsizeint); cdecl; external libodes;

// === Konventiert am: 30-4-26 17:09:36 ===


implementation



end.
