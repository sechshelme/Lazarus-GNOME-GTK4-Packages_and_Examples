{$IFDEF read_interface}



function AcquireDrawInfo: PDrawInfo; cdecl; external libmagickcore;
function CloneDrawInfo(para1: PImageInfo; para2: PDrawInfo): PDrawInfo; cdecl; external libmagickcore;
function DestroyDrawInfo(para1: PDrawInfo): PDrawInfo; cdecl; external libmagickcore;
function DrawAffineImage(para1: PImage; para2: PImage; para3: PAffineMatrix): TMagickBooleanType; cdecl; external libmagickcore;
function DrawClipPath(para1: PImage; para2: PDrawInfo; para3: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function DrawGradientImage(para1: PImage; para2: PDrawInfo): TMagickBooleanType; cdecl; external libmagickcore;
function DrawImage(para1: PImage; para2: PDrawInfo): TMagickBooleanType; cdecl; external libmagickcore;
function DrawPatternPath(para1: PImage; para2: PDrawInfo; para3: pchar; para4: PPImage): TMagickBooleanType; cdecl; external libmagickcore;
function DrawPrimitive(para1: PImage; para2: PDrawInfo; para3: PPrimitiveInfo): TMagickBooleanType; cdecl; external libmagickcore;
procedure GetAffineMatrix(para1: PAffineMatrix); cdecl; external libmagickcore;
procedure GetDrawInfo(para1: PImageInfo; para2: PDrawInfo); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 14:40:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
