unit threshold;

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

  MagickCore image threshold methods.
 }
{$ifndef MAGICKCORE_THRESHOLD_H}
{$define MAGICKCORE_THRESHOLD_H}
type
  PAutoThresholdMethod = ^TAutoThresholdMethod;
  TAutoThresholdMethod =  Longint;
  Const
    UndefinedThresholdMethod = 0;
    KapurThresholdMethod = 1;
    OTSUThresholdMethod = 2;
    TriangleThresholdMethod = 3;
;
type

function AdaptiveThresholdImage(para1:PImage; para2:Tsize_t; para3:Tsize_t; para4:Tssize_t; para5:PExceptionInfo):PImage;cdecl;external libmagiccore;
function DestroyThresholdMap(para1:PThresholdMap):PThresholdMap;cdecl;external libmagiccore;
function GetThresholdMap(para1:Pchar; para2:PExceptionInfo):PThresholdMap;cdecl;external libmagiccore;
function AutoThresholdImage(para1:PImage; para2:TAutoThresholdMethod; para3:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function BilevelImage(para1:PImage; para2:Tdouble):TMagickBooleanType;cdecl;external libmagiccore;
function BilevelImageChannel(para1:PImage; para2:TChannelType; para3:Tdouble):TMagickBooleanType;cdecl;external libmagiccore;
function BlackThresholdImage(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function BlackThresholdImageChannel(para1:PImage; para2:TChannelType; para3:Pchar; para4:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function ClampImage(para1:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function ClampImageChannel(para1:PImage; para2:TChannelType):TMagickBooleanType;cdecl;external libmagiccore;
function ListThresholdMaps(para1:PFILE; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function OrderedDitherImage(para1:PImage):TMagickBooleanType;cdecl;external libmagiccore;
{ deprecated  }
function OrderedDitherImageChannel(para1:PImage; para2:TChannelType; para3:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function OrderedPosterizeImage(para1:PImage; para2:Pchar; para3:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function OrderedPosterizeImageChannel(para1:PImage; para2:TChannelType; para3:Pchar; para4:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function PerceptibleImage(para1:PImage; para2:Tdouble):TMagickBooleanType;cdecl;external libmagiccore;
function PerceptibleImageChannel(para1:PImage; para2:TChannelType; para3:Tdouble):TMagickBooleanType;cdecl;external libmagiccore;
function RandomThresholdImage(para1:PImage; para2:Pchar; para3:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function RandomThresholdImageChannel(para1:PImage; para2:TChannelType; para3:Pchar; para4:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function WhiteThresholdImage(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function WhiteThresholdImageChannel(para1:PImage; para2:TChannelType; para3:Pchar; para4:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 15:47:41 ===


implementation



end.
