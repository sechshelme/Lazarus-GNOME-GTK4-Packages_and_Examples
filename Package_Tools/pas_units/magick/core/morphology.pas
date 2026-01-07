unit morphology;

interface

uses
  fp_magiccore, magick_type, geometry;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PKernelInfoType = ^TKernelInfoType;
  TKernelInfoType = longint;

const
  UndefinedKernel = 0;
  UnityKernel = 1;
  GaussianKernel = 2;
  DoGKernel = 3;
  LoGKernel = 4;
  BlurKernel = 5;
  CometKernel = 6;
  LaplacianKernel = 7;
  SobelKernel = 8;
  FreiChenKernel = 9;
  RobertsKernel = 10;
  PrewittKernel = 11;
  CompassKernel = 12;
  KirschKernel = 13;
  DiamondKernel = 14;
  SquareKernel = 15;
  RectangleKernel = 16;
  OctagonKernel = 17;
  DiskKernel = 18;
  PlusKernel = 19;
  CrossKernel = 20;
  RingKernel = 21;
  PeaksKernel = 22;
  EdgesKernel = 23;
  CornersKernel = 24;
  DiagonalsKernel = 25;
  LineEndsKernel = 26;
  LineJunctionsKernel = 27;
  RidgesKernel = 28;
  ConvexHullKernel = 29;
  ThinSEKernel = 30;
  SkeletonKernel = 31;
  ChebyshevKernel = 32;
  ManhattanKernel = 33;
  OctagonalKernel = 34;
  EuclideanKernel = 35;
  UserDefinedKernel = 36;
  BinomialKernel = 37;

type
  PMorphologyMethod = ^TMorphologyMethod;
  TMorphologyMethod = longint;

const
  UndefinedMorphology = 0;
  ConvolveMorphology = 1;
  CorrelateMorphology = 2;
  ErodeMorphology = 3;
  DilateMorphology = 4;
  ErodeIntensityMorphology = 5;
  DilateIntensityMorphology = 6;
  DistanceMorphology = 7;
  OpenMorphology = 8;
  CloseMorphology = 9;
  OpenIntensityMorphology = 10;
  CloseIntensityMorphology = 11;
  SmoothMorphology = 12;
  EdgeInMorphology = 13;
  EdgeOutMorphology = 14;
  EdgeMorphology = 15;
  TopHatMorphology = 16;
  BottomHatMorphology = 17;
  HitAndMissMorphology = 18;
  ThinningMorphology = 19;
  ThickenMorphology = 20;
  VoronoiMorphology = 21;
  IterativeDistanceMorphology = 22;

type
  PKernelInfo = ^TKernelInfo;

  TKernelInfo = record
    _type: TKernelInfoType;
    width: Tsize_t;
    height: Tsize_t;
    x: Tssize_t;
    y: Tssize_t;
    values: Pdouble;
    minimum: double;
    maximum: double;
    negative_range: double;
    positive_range: double;
    angle: double;
    next: PKernelInfo;
    signature: Tsize_t;
  end;

function AcquireKernelInfo(para1: pchar): PKernelInfo; cdecl; external libmagiccore;
function AcquireKernelBuiltIn(para1: TKernelInfoType; para2: PGeometryInfo): PKernelInfo; cdecl; external libmagiccore;
function CloneKernelInfo(para1: PKernelInfo): PKernelInfo; cdecl; external libmagiccore;
function DestroyKernelInfo(para1: PKernelInfo): PKernelInfo; cdecl; external libmagiccore;
function MorphologyImage(para1: PImage; para2: TMorphologyMethod; para3: Tssize_t; para4: PKernelInfo; para5: PExceptionInfo): PImage; cdecl; external libmagiccore;
function MorphologyImageChannel(para1: PImage; para2: TChannelType; para3: TMorphologyMethod; para4: Tssize_t; para5: PKernelInfo;
  para6: PExceptionInfo): PImage; cdecl; external libmagiccore;
procedure ScaleGeometryKernelInfo(para1: PKernelInfo; para2: pchar); cdecl; external libmagiccore;
procedure ScaleKernelInfo(para1: PKernelInfo; para2: double; para3: TGeometryFlags); cdecl; external libmagiccore;
procedure ShowKernelInfo(para1: PKernelInfo); cdecl; external libmagiccore;
procedure UnityAddKernelInfo(para1: PKernelInfo; para2: double); cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 15:03:29 ===


implementation



end.
