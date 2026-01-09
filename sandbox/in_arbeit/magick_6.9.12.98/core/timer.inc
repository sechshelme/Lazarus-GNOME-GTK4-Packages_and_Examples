{$IFDEF read_interface}



function GetElapsedTime(para1: PTimerInfo): double; cdecl; external libmagickcore;
function GetUserTime(para1: PTimerInfo): double; cdecl; external libmagickcore;
function ContinueTimer(para1: PTimerInfo): TMagickBooleanType; cdecl; external libmagickcore;
function FormatMagickTime(para1: Ttime_t; para2: Tsize_t; para3: pchar): Tssize_t; cdecl; external libmagickcore;
function AcquireTimerInfo: PTimerInfo; cdecl; external libmagickcore;
function DestroyTimerInfo(para1: PTimerInfo): PTimerInfo; cdecl; external libmagickcore;
procedure GetTimerInfo(para1: PTimerInfo); cdecl; external libmagickcore;
procedure ResetTimer(para1: PTimerInfo); cdecl; external libmagickcore;
procedure StartTimer(para1: PTimerInfo; para2: TMagickBooleanType); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 17:40:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
