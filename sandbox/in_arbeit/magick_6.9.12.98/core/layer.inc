{$IFDEF read_interface}



function CoalesceImages(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function DisposeImages(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function CompareImageLayers(para1: PImage; para2: TImageLayerMethod; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function DeconstructImages(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function MergeImageLayers(para1: PImage; para2: TImageLayerMethod; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function OptimizeImageLayers(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function OptimizePlusImageLayers(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
procedure CompositeLayers(para1: PImage; para2: TCompositeOperator; para3: PImage; para4: Tssize_t; para5: Tssize_t;
  para6: PExceptionInfo); cdecl; external libmagickcore;
procedure OptimizeImageTransparency(para1: PImage; para2: PExceptionInfo); cdecl; external libmagickcore;
procedure RemoveDuplicateLayers(para1: PPImage; para2: PExceptionInfo); cdecl; external libmagickcore;
procedure RemoveZeroDelayLayers(para1: PPImage; para2: PExceptionInfo); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:50:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
