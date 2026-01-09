{$IFDEF read_interface}




function ResamplePixelColor(para1: PResampleFilter; para2: double; para3: double; para4: PMagickPixelPacket): TMagickBooleanType; cdecl; external libmagickcore;
function SetResampleFilterInterpolateMethod(para1: PResampleFilter; para2: TInterpolatePixelMethod): TMagickBooleanType; cdecl; external libmagickcore;
function SetResampleFilterVirtualPixelMethod(para1: PResampleFilter; para2: TVirtualPixelMethod): TMagickBooleanType; cdecl; external libmagickcore;
function AcquireResampleFilter(para1: PImage; para2: PExceptionInfo): PResampleFilter; cdecl; external libmagickcore;
function DestroyResampleFilter(para1: PResampleFilter): PResampleFilter; cdecl; external libmagickcore;
procedure ScaleResampleFilter(para1: PResampleFilter; para2: double; para3: double; para4: double; para5: double); cdecl; external libmagickcore;
procedure SetResampleFilter(para1: PResampleFilter; para2: TFilterTypes; para3: double); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:36:45 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
