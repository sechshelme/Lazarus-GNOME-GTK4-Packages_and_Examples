{$IFDEF read_interface}



function AffineTransformImage(para1: PImage; para2: PAffineMatrix; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function DistortImage(para1: PImage; para2: TDistortImageMethod; para3: Tsize_t; para4: Pdouble; para5: TMagickBooleanType;
  exception: PExceptionInfo): PImage; cdecl; external libmagickcore;
function DistortResizeImage(para1: PImage; para2: Tsize_t; para3: Tsize_t; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function RotateImage(para1: PImage; para2: double; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SparseColorImage(para1: PImage; para2: TChannelType; para3: TSparseColorMethod; para4: Tsize_t; para5: Pdouble;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:36:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
