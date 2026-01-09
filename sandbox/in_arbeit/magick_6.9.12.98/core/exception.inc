{$IFDEF read_interface}



function GetExceptionMessage(para1: longint): pchar; cdecl; external libmagickcore;
function GetLocaleExceptionMessage(para1: TExceptionType; para2: pchar): pchar; cdecl; external libmagickcore;
function SetErrorHandler(para1: TErrorHandler): TErrorHandler; cdecl; external libmagickcore;
function AcquireExceptionInfo: PExceptionInfo; cdecl; external libmagickcore;
function CloneExceptionInfo(para1: PExceptionInfo): PImage; cdecl; external libmagickcore;
function DestroyExceptionInfo(para1: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SetFatalErrorHandler(para1: TFatalErrorHandler): TFatalErrorHandler; cdecl; external libmagickcore;
function ThrowException(para1: PExceptionInfo; para2: TExceptionType; para3: pchar; para4: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function ThrowMagickException(para1: PExceptionInfo; para2: pchar; para3: pchar; para4: Tsize_t; para5: TExceptionType;
  para6: pchar; para7: pchar): TMagickBooleanType; cdecl; varargs; external libmagickcore;
function ThrowMagickExceptionList(para1: PExceptionInfo; para2: pchar; para3: pchar; para4: Tsize_t; para5: TExceptionType;
  para6: pchar; para7: pchar; para8: Tva_list): TMagickBooleanType; cdecl; external libmagickcore;
procedure CatchException(para1: PExceptionInfo); cdecl; external libmagickcore;
procedure ClearMagickException(para1: PExceptionInfo); cdecl; external libmagickcore;
procedure InheritException(para1: PExceptionInfo; para2: PExceptionInfo); cdecl; external libmagickcore;
procedure MagickError(para1: TExceptionType; para2: pchar; para3: pchar); cdecl; external libmagickcore;
procedure MagickFatalError(para1: TExceptionType; para2: pchar; para3: pchar); cdecl; external libmagickcore;
procedure MagickWarning(para1: TExceptionType; para2: pchar; para3: pchar); cdecl; external libmagickcore;
function SetWarningHandler(para1: TWarningHandler): TWarningHandler; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:03:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
