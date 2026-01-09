{$IFDEF read_interface}



function BorderImage(para1: PImage; para2: PRectangleInfo; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function FrameImage(para1: PImage; para2: PFrameInfo; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function RaiseImage(para1: PImage; para2: PRectangleInfo; para3: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 19:17:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
