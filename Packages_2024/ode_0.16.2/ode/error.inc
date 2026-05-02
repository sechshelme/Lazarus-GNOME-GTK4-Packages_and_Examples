{$IFDEF read_interface}


type
  TdMessageFunction = procedure(errnum: longint; msg: pchar; ap: Tva_list); cdecl;

procedure dSetErrorHandler(fn: TdMessageFunction); cdecl; external libodes;
procedure dSetDebugHandler(fn: TdMessageFunction); cdecl; external libodes;
procedure dSetMessageHandler(fn: TdMessageFunction); cdecl; external libodes;
function dGetErrorHandler: TdMessageFunction; cdecl; external libodes;
function dGetDebugHandler: TdMessageFunction; cdecl; external libodes;
function dGetMessageHandler: TdMessageFunction; cdecl; external libodes;
procedure dError(num: longint; msg: pchar); varargs; cdecl; external libodes;
procedure dDebug(num: longint; msg: pchar); varargs; cdecl; external libodes;
procedure dMessage(num: longint; msg: pchar); varargs; cdecl; external libodes;

// === Konventiert am: 30-4-26 17:09:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
