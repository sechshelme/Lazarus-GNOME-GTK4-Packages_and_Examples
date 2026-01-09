unit statistic;

interface

uses
  fp_magiccore, magick_type, draw;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  MaximumNumberOfImageMoments = 8;
  MaximumNumberOfPerceptualHashes = 7;

type
  PChannelStatistics = ^TChannelStatistics;

  TChannelStatistics = record
    depth: Tsize_t;
    minima: double;
    maxima: double;
    sum: double;
    sum_squared: double;
    sum_cubed: double;
    sum_fourth_power: double;
    mean: double;
    variance: double;
    standard_deviation: double;
    kurtosis: double;
    skewness: double;
    entropy: double;
  end;
  {$undef I}

  PChannelMoments = ^TChannelMoments;

  TChannelMoments = record
    I: array[0..31] of double;
    centroid: TPointInfo;
    ellipse_axis: TPointInfo;
    ellipse_angle: double;
    ellipse_eccentricity: double;
    ellipse_intensity: double;
  end;

  PChannelPerceptualHash = ^TChannelPerceptualHash;

  TChannelPerceptualHash = record
    P: array[0..31] of double;
    Q: array[0..31] of double;
  end;

  PMagickEvaluateOperator = ^TMagickEvaluateOperator;
  TMagickEvaluateOperator = longint;

const
  UndefinedEvaluateOperator = 0;
  AddEvaluateOperator = 1;
  AndEvaluateOperator = 2;
  DivideEvaluateOperator = 3;
  LeftShiftEvaluateOperator = 4;
  MaxEvaluateOperator = 5;
  MinEvaluateOperator = 6;
  MultiplyEvaluateOperator = 7;
  OrEvaluateOperator = 8;
  RightShiftEvaluateOperator = 9;
  SetEvaluateOperator = 10;
  SubtractEvaluateOperator = 11;
  XorEvaluateOperator = 12;
  PowEvaluateOperator = 13;
  LogEvaluateOperator = 14;
  ThresholdEvaluateOperator = 15;
  ThresholdBlackEvaluateOperator = 16;
  ThresholdWhiteEvaluateOperator = 17;
  GaussianNoiseEvaluateOperator = 18;
  ImpulseNoiseEvaluateOperator = 19;
  LaplacianNoiseEvaluateOperator = 20;
  MultiplicativeNoiseEvaluateOperator = 21;
  PoissonNoiseEvaluateOperator = 22;
  UniformNoiseEvaluateOperator = 23;
  CosineEvaluateOperator = 24;
  SineEvaluateOperator = 25;
  AddModulusEvaluateOperator = 26;
  MeanEvaluateOperator = 27;
  AbsEvaluateOperator = 28;
  ExponentialEvaluateOperator = 29;
  MedianEvaluateOperator = 30;
  SumEvaluateOperator = 31;
  RootMeanSquareEvaluateOperator = 32;
  InverseLogEvaluateOperator = 33;

type
  PMagickFunction = ^TMagickFunction;
  TMagickFunction = longint;

const
  UndefinedFunction = 0;
  PolynomialFunction = 1;
  SinusoidFunction = 2;
  ArcsinFunction = 3;
  ArctanFunction = 4;

type
  PStatisticType = ^TStatisticType;
  TStatisticType = longint;

const
  UndefinedStatistic = 0;
  GradientStatistic = 1;
  MaximumStatistic = 2;
  MeanStatistic = 3;
  MedianStatistic = 4;
  MinimumStatistic = 5;
  ModeStatistic = 6;
  NonpeakStatistic = 7;
  StandardDeviationStatistic = 8;
  RootMeanSquareStatistic = 9;

function GetImageChannelStatistics(para1: PImage; para2: PExceptionInfo): PChannelStatistics; cdecl; external libmagickcore;
function GetImageChannelMoments(para1: PImage; para2: PExceptionInfo): PChannelMoments; cdecl; external libmagickcore;
function GetImageChannelPerceptualHash(para1: PImage; para2: PExceptionInfo): PChannelPerceptualHash; cdecl; external libmagickcore;
function EvaluateImages(para1: PImage; para2: TMagickEvaluateOperator; para3: PExceptionInfo): PImage; cdecl; external libmagickcore;
function PolynomialImage(para1: PImage; para2: Tsize_t; para3: Pdouble; para4: PExceptionInfo): PImage; cdecl; external libmagickcore;
function PolynomialImageChannel(para1: PImage; para2: TChannelType; para3: Tsize_t; para4: Pdouble; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function StatisticImage(para1: PImage; para2: TStatisticType; para3: Tsize_t; para4: Tsize_t; para5: PExceptionInfo): PImage; cdecl; external libmagickcore;
function StatisticImageChannel(para1: PImage; para2: TChannelType; para3: TStatisticType; para4: Tsize_t; para5: Tsize_t;
  para6: PExceptionInfo): PImage; cdecl; external libmagickcore;
function EvaluateImage(para1: PImage; para2: TMagickEvaluateOperator; para3: double; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function EvaluateImageChannel(para1: PImage; para2: TChannelType; para3: TMagickEvaluateOperator; para4: double; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function FunctionImage(para1: PImage; para2: TMagickFunction; para3: Tsize_t; para4: Pdouble; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function FunctionImageChannel(para1: PImage; para2: TChannelType; para3: TMagickFunction; para4: Tsize_t; para5: Pdouble;
  para6: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageChannelEntropy(para1: PImage; para2: TChannelType; para3: Pdouble; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageChannelExtrema(para1: PImage; para2: TChannelType; para3: Psize_t; para4: Psize_t; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageChannelMean(para1: PImage; para2: TChannelType; para3: Pdouble; para4: Pdouble; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageChannelKurtosis(para1: PImage; para2: TChannelType; para3: Pdouble; para4: Pdouble; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageChannelRange(para1: PImage; para2: TChannelType; para3: Pdouble; para4: Pdouble; para5: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageEntropy(para1: PImage; para2: Pdouble; para3: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageExtrema(para1: PImage; para2: Psize_t; para3: Psize_t; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageMean(para1: PImage; para2: Pdouble; para3: Pdouble; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageKurtosis(para1: PImage; para2: Pdouble; para3: Pdouble; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function GetImageRange(para1: PImage; para2: Pdouble; para3: Pdouble; para4: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 14:40:32 ===


implementation



end.
