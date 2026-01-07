unit resample;

interface

uses
  fp_magiccore, magick_type, pixel, cache_view;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PFilterTypes = ^TFilterTypes;
  TFilterTypes = longint;

const
  UndefinedFilter = 0;
  PointFilter = 1;
  BoxFilter = 2;
  TriangleFilter = 3;
  HermiteFilter = 4;
  HanningFilter = 5;
  HammingFilter = 6;
  BlackmanFilter = 7;
  GaussianFilter = 8;
  QuadraticFilter = 9;
  CubicFilter = 10;
  CatromFilter = 11;
  MitchellFilter = 12;
  JincFilter = 13;
  SincFilter = 14;
  SincFastFilter = 15;
  KaiserFilter = 16;
  WelshFilter = 17;
  ParzenFilter = 18;
  BohmanFilter = 19;
  BartlettFilter = 20;
  LagrangeFilter = 21;
  LanczosFilter = 22;
  LanczosSharpFilter = 23;
  Lanczos2Filter = 24;
  Lanczos2SharpFilter = 25;
  RobidouxFilter = 26;
  RobidouxSharpFilter = 27;
  CosineFilter = 28;
  SplineFilter = 29;
  LanczosRadiusFilter = 30;
  SentinelFilter = 31;

  BesselFilter = JincFilter;

type
  PResampleFilter=type Pointer;

function ResamplePixelColor(para1: PResampleFilter; para2: double; para3: double; para4: PMagickPixelPacket): TMagickBooleanType; cdecl; external libmagiccore;
function SetResampleFilterInterpolateMethod(para1: PResampleFilter; para2: TInterpolatePixelMethod): TMagickBooleanType; cdecl; external libmagiccore;
function SetResampleFilterVirtualPixelMethod(para1: PResampleFilter; para2: TVirtualPixelMethod): TMagickBooleanType; cdecl; external libmagiccore;
function AcquireResampleFilter(para1: PImage; para2: PExceptionInfo): PResampleFilter; cdecl; external libmagiccore;
function DestroyResampleFilter(para1: PResampleFilter): PResampleFilter; cdecl; external libmagiccore;
procedure ScaleResampleFilter(para1: PResampleFilter; para2: double; para3: double; para4: double; para5: double); cdecl; external libmagiccore;
procedure SetResampleFilter(para1: PResampleFilter; para2: TFilterTypes; para3: double); cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 15:36:45 ===


implementation



end.
