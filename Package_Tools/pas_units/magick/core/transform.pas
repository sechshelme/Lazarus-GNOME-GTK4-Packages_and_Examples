unit transform;

interface

uses
  fp_magiccore, magick_type, geometry, image;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function AutoOrientImage(para1: PImage; para2: TOrientationType; para3: PExceptionInfo): PImage; cdecl; external libmagiccore;
function ChopImage(para1: PImage; para2: PRectangleInfo; para3: PExceptionInfo): PImage; cdecl; external libmagiccore;
function ConsolidateCMYKImages(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagiccore;
function CropImage(para1: PImage; para2: PRectangleInfo; para3: PExceptionInfo): PImage; cdecl; external libmagiccore;
function CropImageToTiles(para1: PImage; para2: pchar; para3: PExceptionInfo): PImage; cdecl; external libmagiccore;
function ExcerptImage(para1: PImage; para2: PRectangleInfo; para3: PExceptionInfo): PImage; cdecl; external libmagiccore;
function ExtentImage(para1: PImage; para2: PRectangleInfo; para3: PExceptionInfo): PImage; cdecl; external libmagiccore;
function FlipImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagiccore;
function FlopImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagiccore;
function RollImage(para1: PImage; para2: Tssize_t; para3: Tssize_t; para4: PExceptionInfo): PImage; cdecl; external libmagiccore;
function ShaveImage(para1: PImage; para2: PRectangleInfo; para3: PExceptionInfo): PImage; cdecl; external libmagiccore;
function SpliceImage(para1: PImage; para2: PRectangleInfo; para3: PExceptionInfo): PImage; cdecl; external libmagiccore;
function TransposeImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagiccore;
function TransverseImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagiccore;
function TrimImage(para1: PImage; para2: PExceptionInfo): PImage; cdecl; external libmagiccore;
function TransformImage(para1: PPImage; para2: pchar; para3: pchar): TMagickBooleanType; cdecl; external libmagiccore;
function TransformImages(para1: PPImage; para2: pchar; para3: pchar): TMagickBooleanType; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 15:54:38 ===


implementation



end.
