unit compare;

interface

uses
  fp_magiccore, magick_type, geometry;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PMetricType = ^TMetricType;
  TMetricType = longint;

const
  UndefinedMetric = 0;
  AbsoluteErrorMetric = 1;
  MeanAbsoluteErrorMetric = 2;
  MeanErrorPerPixelMetric = 3;
  MeanSquaredErrorMetric = 4;
  PeakAbsoluteErrorMetric = 5;
  PeakSignalToNoiseRatioMetric = 6;
  RootMeanSquaredErrorMetric = 7;
  NormalizedCrossCorrelationErrorMetric = 8;
  FuzzErrorMetric = 9;
  UndefinedErrorMetric = 0;
  PerceptualHashErrorMetric = $ff;

function GetImageChannelDistortions(para1: PImage; para2: PImage; para3: TMetricType; para4: PExceptionInfo): Pdouble; cdecl; external libmagickcore;
function CompareImageChannels(para1: PImage; para2: PImage; para3: TChannelType; para4: TMetricType; para5: Pdouble;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function CompareImages(para1: PImage; para2: PImage; para3: TMetricType; para4: Pdouble; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SimilarityImage(para1: PImage; para2: PImage; para3: PRectangleInfo; para4: Pdouble; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function SimilarityMetricImage(para1: PImage; para2: PImage; para3: TMetricType; para4: PRectangleInfo; para5: Pdouble;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function GetImageChannelDistortion(para1: PImage; para2: PImage; para3: TChannelType; para4: TMetricType; para5: Pdouble;
  para6: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageDistortion(para1: PImage; para2: PImage; para3: TMetricType; para4: Pdouble; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function IsImagesEqual(para1: PImage; para2: PImage): TMagickBooleanType; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:54:28 ===


implementation



end.
