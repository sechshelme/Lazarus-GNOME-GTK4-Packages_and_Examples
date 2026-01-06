unit statistic;

interface

uses
  fp_magiccore;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
  Copyright 1999 ImageMagick Studio LLC, a non-profit organization
  dedicated to making software imaging solutions freely available.
  
  You may not use this file except in compliance with the License.  You may
  obtain a copy of the License at
  
    https://imagemagick.org/script/license.php
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

  MagickCore statistical methods.
 }
{$ifndef MAGICKCORE_STATISTIC_H}
{$define MAGICKCORE_STATISTIC_H}

const
  MaximumNumberOfImageMoments = 8;  
  MaximumNumberOfPerceptualHashes = 7;  
type
  PChannelStatistics = ^TChannelStatistics;
  TChannelStatistics = record
      depth : Tsize_t;
      minima : Tdouble;
      maxima : Tdouble;
      sum : Tdouble;
      sum_squared : Tdouble;
      sum_cubed : Tdouble;
      sum_fourth_power : Tdouble;
      mean : Tdouble;
      variance : Tdouble;
      standard_deviation : Tdouble;
      kurtosis : Tdouble;
      skewness : Tdouble;
      entropy : Tdouble;
    end;
{$undef I}

  PChannelMoments = ^TChannelMoments;
  TChannelMoments = record
      I : array[0..31] of Tdouble;
      centroid : TPointInfo;
      ellipse_axis : TPointInfo;
      ellipse_angle : Tdouble;
      ellipse_eccentricity : Tdouble;
      ellipse_intensity : Tdouble;
    end;

  PChannelPerceptualHash = ^TChannelPerceptualHash;
  TChannelPerceptualHash = record
      P : array[0..31] of Tdouble;
      Q : array[0..31] of Tdouble;
    end;

  PMagickEvaluateOperator = ^TMagickEvaluateOperator;
  TMagickEvaluateOperator =  Longint;
  Const
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
;
type
  PMagickFunction = ^TMagickFunction;
  TMagickFunction =  Longint;
  Const
    UndefinedFunction = 0;
    PolynomialFunction = 1;
    SinusoidFunction = 2;
    ArcsinFunction = 3;
    ArctanFunction = 4;
;
type
  PStatisticType = ^TStatisticType;
  TStatisticType =  Longint;
  Const
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
;

function GetImageChannelStatistics(para1:PImage; para2:PExceptionInfo):PChannelStatistics;cdecl;external libmagiccore;
function GetImageChannelMoments(para1:PImage; para2:PExceptionInfo):PChannelMoments;cdecl;external libmagiccore;
function GetImageChannelPerceptualHash(para1:PImage; para2:PExceptionInfo):PChannelPerceptualHash;cdecl;external libmagiccore;
function EvaluateImages(para1:PImage; para2:TMagickEvaluateOperator; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function PolynomialImage(para1:PImage; para2:Tsize_t; para3:Pdouble; para4:PExceptionInfo):PImage;cdecl;external libmagiccore;
function PolynomialImageChannel(para1:PImage; para2:TChannelType; para3:Tsize_t; para4:Pdouble; para5:PExceptionInfo):PImage;cdecl;external libmagiccore;
function StatisticImage(para1:PImage; para2:TStatisticType; para3:Tsize_t; para4:Tsize_t; para5:PExceptionInfo):PImage;cdecl;external libmagiccore;
function StatisticImageChannel(para1:PImage; para2:TChannelType; para3:TStatisticType; para4:Tsize_t; para5:Tsize_t; 
           para6:PExceptionInfo):PImage;cdecl;external libmagiccore;
function EvaluateImage(para1:PImage; para2:TMagickEvaluateOperator; para3:Tdouble; para4:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function EvaluateImageChannel(para1:PImage; para2:TChannelType; para3:TMagickEvaluateOperator; para4:Tdouble; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function FunctionImage(para1:PImage; para2:TMagickFunction; para3:Tsize_t; para4:Pdouble; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function FunctionImageChannel(para1:PImage; para2:TChannelType; para3:TMagickFunction; para4:Tsize_t; para5:Pdouble; 
           para6:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetImageChannelEntropy(para1:PImage; para2:TChannelType; para3:Pdouble; para4:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetImageChannelExtrema(para1:PImage; para2:TChannelType; para3:Psize_t; para4:Psize_t; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetImageChannelMean(para1:PImage; para2:TChannelType; para3:Pdouble; para4:Pdouble; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetImageChannelKurtosis(para1:PImage; para2:TChannelType; para3:Pdouble; para4:Pdouble; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetImageChannelRange(para1:PImage; para2:TChannelType; para3:Pdouble; para4:Pdouble; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetImageEntropy(para1:PImage; para2:Pdouble; para3:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetImageExtrema(para1:PImage; para2:Psize_t; para3:Psize_t; para4:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetImageMean(para1:PImage; para2:Pdouble; para3:Pdouble; para4:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetImageKurtosis(para1:PImage; para2:Pdouble; para3:Pdouble; para4:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetImageRange(para1:PImage; para2:Pdouble; para3:Pdouble; para4:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
{$endif}

// === Konventiert am: 6-1-26 14:40:32 ===


implementation



end.
