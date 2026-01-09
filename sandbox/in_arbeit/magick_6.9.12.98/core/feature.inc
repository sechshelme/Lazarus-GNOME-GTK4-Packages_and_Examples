{$IFDEF read_interface}



function GetImageChannelFeatures(para1: PImage; para2: Tsize_t; para3: PExceptionInfo): PChannelFeatures; cdecl; external libmagickcore;
function CannyEdgeImage(para1: PImage; para2: double; para3: double; para4: double; para5: double;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function HoughLineImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: Tsize_t; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function MeanShiftImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: double; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 17:33:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
