{$IFDEF read_interface}



function CompositeImage(para1: PImage; para2: TCompositeOperator; para3: PImage; para4: Tssize_t; para5: Tssize_t): TMagickBooleanType; cdecl; external libmagickcore;
function CompositeImageChannel(para1: PImage; para2: TChannelType; para3: TCompositeOperator; para4: PImage; para5: Tssize_t;
  para6: Tssize_t): TMagickBooleanType; cdecl; external libmagickcore;
function TextureImage(para1: PImage; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:03:12 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
