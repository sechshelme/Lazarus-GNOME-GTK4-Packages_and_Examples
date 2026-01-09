{$IFDEF read_interface}



function DisplayImages(para1: PImageInfo; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;
function RemoteDisplayCommand(para1: PImageInfo; para2: pchar; para3: pchar; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 19:23:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
