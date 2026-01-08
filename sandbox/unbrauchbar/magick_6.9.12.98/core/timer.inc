{$IFDEF read_interface}


type
  PTimerState = ^TTimerState;
  TTimerState = longint;

const
  UndefinedTimerState = 0;
  StoppedTimerState = 1;
  RunningTimerState = 2;

type
  TTimer = record
    start: double;
    stop: double;
    total: double;
  end;
  PTimer = ^TTimer;

  TTimerInfo = record
    user: TTimer;
    elapsed: TTimer;
    state: TTimerState;
    signature: Tsize_t;
  end;
  PTimerInfo = ^TTimerInfo;

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
