unit feature;

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

  MagickCore feature methods.
 }
{$ifndef MAGICKCORE_FEATURE_H}
{$define MAGICKCORE_FEATURE_H}
{
  Haralick texture features.
 }
type
  PChannelFeatures = ^TChannelFeatures;
  TChannelFeatures = record
      angular_second_moment : array[0..3] of Tdouble;
      contrast : array[0..3] of Tdouble;
      correlation : array[0..3] of Tdouble;
      variance_sum_of_squares : array[0..3] of Tdouble;
      inverse_difference_moment : array[0..3] of Tdouble;
      sum_average : array[0..3] of Tdouble;
      sum_variance : array[0..3] of Tdouble;
      sum_entropy : array[0..3] of Tdouble;
      entropy : array[0..3] of Tdouble;
      difference_variance : array[0..3] of Tdouble;
      difference_entropy : array[0..3] of Tdouble;
      measure_of_correlation_1 : array[0..3] of Tdouble;
      measure_of_correlation_2 : array[0..3] of Tdouble;
      maximum_correlation_coefficient : array[0..3] of Tdouble;
    end;

function GetImageChannelFeatures(para1:PImage; para2:Tsize_t; para3:PExceptionInfo):PChannelFeatures;cdecl;external libmagiccore;
function CannyEdgeImage(para1:PImage; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:Tdouble; 
           para6:PExceptionInfo):PImage;cdecl;external libmagiccore;
function HoughLineImage(para1:PImage; para2:Tsize_t; para3:Tsize_t; para4:Tsize_t; para5:PExceptionInfo):PImage;cdecl;external libmagiccore;
function MeanShiftImage(para1:PImage; para2:Tsize_t; para3:Tsize_t; para4:Tdouble; para5:PExceptionInfo):PImage;cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 17:33:20 ===


implementation



end.
