unit compare;

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

  MagickCore image compare methods.
 }
{$ifndef MAGICKCORE_COMPARE_H}
{$define MAGICKCORE_COMPARE_H}
{$include "magick/image.h"}
type
  PMetricType = ^TMetricType;
  TMetricType =  Longint;
  Const
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
;

function GetImageChannelDistortions(para1:PImage; para2:PImage; para3:TMetricType; para4:PExceptionInfo):Pdouble;cdecl;external libmagiccore;
function CompareImageChannels(para1:PImage; para2:PImage; para3:TChannelType; para4:TMetricType; para5:Pdouble; 
           para6:PExceptionInfo):PImage;cdecl;external libmagiccore;
function CompareImages(para1:PImage; para2:PImage; para3:TMetricType; para4:Pdouble; para5:PExceptionInfo):PImage;cdecl;external libmagiccore;
function SimilarityImage(para1:PImage; para2:PImage; para3:PRectangleInfo; para4:Pdouble; para5:PExceptionInfo):PImage;cdecl;external libmagiccore;
function SimilarityMetricImage(para1:PImage; para2:PImage; para3:TMetricType; para4:PRectangleInfo; para5:Pdouble; 
           para6:PExceptionInfo):PImage;cdecl;external libmagiccore;
function GetImageChannelDistortion(para1:PImage; para2:PImage; para3:TChannelType; para4:TMetricType; para5:Pdouble; 
           para6:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetImageDistortion(para1:PImage; para2:PImage; para3:TMetricType; para4:Pdouble; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function IsImagesEqual(para1:PImage; para2:PImage):TMagickBooleanType;cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 15:54:28 ===


implementation



end.
