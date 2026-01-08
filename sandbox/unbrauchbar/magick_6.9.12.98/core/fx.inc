{$IFDEF read_interface}



function FxImage(para1: PImage; para2: pchar; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function FxImageChannel(para1: PImage; para2: TChannelType; para3: pchar; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 19:23:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
