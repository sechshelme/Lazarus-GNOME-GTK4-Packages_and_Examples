{$IFDEF read_interface}


function GetImageDynamicThreshold(para1: PImage; para2: double; para3: double; para4: PMagickPixelPacket; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SegmentImage(para1: PImage; para2: TColorspaceType; para3: TMagickBooleanType; para4: double; para5: double): TMagickBooleanType; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 19:17:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
