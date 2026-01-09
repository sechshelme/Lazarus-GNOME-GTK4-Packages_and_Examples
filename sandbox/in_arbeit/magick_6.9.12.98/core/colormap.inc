{$IFDEF read_interface}



function AcquireImageColormap(para1: PImage; para2: Tsize_t): TMagickBooleanType; cdecl; external libmagickcore;
function CycleColormapImage(para1: PImage; para2: Tssize_t): TMagickBooleanType; cdecl; external libmagickcore;
function SortColormapByIntensity(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 19:23:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
