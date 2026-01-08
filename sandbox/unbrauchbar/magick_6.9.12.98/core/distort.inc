{$IFDEF read_interface}


type
  PDistortImageMethod = ^TDistortImageMethod;
  TDistortImageMethod = longint;

const
  UndefinedDistortion = 0;
  AffineDistortion = 1;
  AffineProjectionDistortion = 2;
  ScaleRotateTranslateDistortion = 3;
  PerspectiveDistortion = 4;
  PerspectiveProjectionDistortion = 5;
  BilinearForwardDistortion = 6;
  BilinearDistortion = BilinearForwardDistortion;
  BilinearReverseDistortion = (BilinearForwardDistortion) + 1;
  PolynomialDistortion = (BilinearForwardDistortion) + 2;
  ArcDistortion = (BilinearForwardDistortion) + 3;
  PolarDistortion = (BilinearForwardDistortion) + 4;
  DePolarDistortion = (BilinearForwardDistortion) + 5;
  Cylinder2PlaneDistortion = (BilinearForwardDistortion) + 6;
  Plane2CylinderDistortion = (BilinearForwardDistortion) + 7;
  BarrelDistortion = (BilinearForwardDistortion) + 8;
  BarrelInverseDistortion = (BilinearForwardDistortion) + 9;
  ShepardsDistortion = (BilinearForwardDistortion) + 10;
  ResizeDistortion = (BilinearForwardDistortion) + 11;
  SentinelDistortion = (BilinearForwardDistortion) + 12;

type
  PSparseColorMethod = ^TSparseColorMethod;
  TSparseColorMethod = longint;

const
  UndefinedColorInterpolate = UndefinedDistortion;
  BarycentricColorInterpolate = AffineDistortion;
  BilinearColorInterpolate = BilinearReverseDistortion;
  PolynomialColorInterpolate = PolynomialDistortion;
  ShepardsColorInterpolate = ShepardsDistortion;
  VoronoiColorInterpolate = SentinelDistortion;
  InverseColorInterpolate = (SentinelDistortion) + 1;
  ManhattanColorInterpolate = (SentinelDistortion) + 2;

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
