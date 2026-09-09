{$IFDEF read_interface}


procedure SetHardExit(hard_exit: longint); cdecl; external libxrl; deprecated;
procedure SetExitStatus(exit_status: longint); cdecl; external libxrl; deprecated;
function GetExitStatus: longint; cdecl; external libxrl; deprecated;
procedure SetErrorMessages(status: longint); cdecl; external libxrl; deprecated;
function GetErrorMessages: longint; cdecl; external libxrl; deprecated;

// === Konventiert am: 8-9-26 17:30:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
