unit colorspace;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PColorspaceType = ^TColorspaceType;
  TColorspaceType = longint;

const
  UndefinedColorspace = 0;
  RGBColorspace = 1;
  GRAYColorspace = 2;
  TransparentColorspace = 3;
  OHTAColorspace = 4;
  LabColorspace = 5;
  XYZColorspace = 6;
  YCbCrColorspace = 7;
  YCCColorspace = 8;
  YIQColorspace = 9;
  YPbPrColorspace = 10;
  YUVColorspace = 11;
  CMYKColorspace = 12;
  sRGBColorspace = 13;
  HSBColorspace = 14;
  HSLColorspace = 15;
  HWBColorspace = 16;
  Rec601LumaColorspace = 17;
  Rec601YCbCrColorspace = 18;
  Rec709LumaColorspace = 19;
  Rec709YCbCrColorspace = 20;
  LogColorspace = 21;
  CMYColorspace = 22;
  LuvColorspace = 23;
  HCLColorspace = 24;
  LCHColorspace = 25;
  LMSColorspace = 26;
  LCHabColorspace = 27;
  LCHuvColorspace = 28;
  scRGBColorspace = 29;
  HSIColorspace = 30;
  HSVColorspace = 31;
  HCLpColorspace = 32;
  YDbDrColorspace = 33;
  xyYColorspace = 34;
  LinearGRAYColorspace = 35;

function GetImageColorspaceType(para1: PImage; para2: PExceptionInfo): TColorspaceType; cdecl; external libmagickcore;
function RGBTransformImage(para1: PImage; para2: TColorspaceType): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageColorspace(para1: PImage; para2: TColorspaceType): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageGray(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageMonochrome(para1: PImage; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function TransformImageColorspace(para1: PImage; para2: TColorspaceType): TMagickBooleanType; cdecl; external libmagickcore;
function TransformRGBImage(para1: PImage; para2: TColorspaceType): TMagickBooleanType; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:47:29 ===


implementation



end.
