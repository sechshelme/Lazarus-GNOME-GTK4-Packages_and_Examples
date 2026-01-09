{$IFDEF read_interface}


function ReadStream(para1: PImageInfo; para2: TStreamHandler; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function WriteStream(para1: PImageInfo; para2: PImage; para3: TStreamHandler): TMagickBooleanType; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 19:17:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
