{$IFDEF read_interface}


function AutoOrientImage(para1: PImage; para2: TOrientationType; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ChopImage(para1: PImage; para2: PRectangleInfo; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ConsolidateCMYKImages(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function CropImage(para1: PImage; para2: PRectangleInfo; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function CropImageToTiles(para1: PImage; para2: pchar; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ExcerptImage(para1: PImage; para2: PRectangleInfo; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ExtentImage(para1: PImage; para2: PRectangleInfo; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function FlipImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function FlopImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function RollImage(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function ShaveImage(para1: PImage; para2: PRectangleInfo; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SpliceImage(para1: PImage; para2: PRectangleInfo; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function TransposeImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function TransverseImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function TrimImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagickcore;
function TransformImage(para1: PPImage; para2: pchar; para3: pchar): TMagickBooleanType; cdecl; external libmagickcore;
function TransformImages(para1: PPImage; para2: pchar; para3: pchar): TMagickBooleanType; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:54:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
