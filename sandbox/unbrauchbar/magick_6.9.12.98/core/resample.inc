{$IFDEF read_interface}


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

function ResamplePixelColor(para1: PResampleFilter; para2: double; para3: double; para4: PMagickPixelPacket): TMagickBooleanType; cdecl; external libmagickcore;
function SetResampleFilterInterpolateMethod(para1: PResampleFilter; para2: TInterpolatePixelMethod): TMagickBooleanType; cdecl; external libmagickcore;
function SetResampleFilterVirtualPixelMethod(para1: PResampleFilter; para2: TVirtualPixelMethod): TMagickBooleanType; cdecl; external libmagickcore;
function AcquireResampleFilter(para1: PImage; para2: PExceptionInfo): PResampleFilter; cdecl; external libmagickcore;
function DestroyResampleFilter(para1: PResampleFilter): PResampleFilter; cdecl; external libmagickcore;
procedure ScaleResampleFilter(para1: PResampleFilter; para2: double; para3: double; para4: double; para5: double); cdecl; external libmagickcore;
procedure SetResampleFilter(para1: PResampleFilter; para2: TFilterTypes; para3: double); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:36:45 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
