unit enhance;

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

  MagickCore image enhance methods.
 }
{$ifndef MAGICKCORE_ENHANCE_H}
{$define MAGICKCORE_ENHANCE_H}
{$include "magick/pixel.h"}

function AutoGammaImage(para1:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function AutoGammaImageChannel(para1:PImage; para2:TChannelType):TMagickBooleanType;cdecl;external libmagiccore;
function AutoLevelImage(para1:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function AutoLevelImageChannel(para1:PImage; para2:TChannelType):TMagickBooleanType;cdecl;external libmagiccore;
function BrightnessContrastImage(para1:PImage; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external libmagiccore;
function BrightnessContrastImageChannel(para1:PImage; para2:TChannelType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external libmagiccore;
function ClutImage(para1:PImage; para2:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function ClutImageChannel(para1:PImage; para2:TChannelType; para3:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function ColorDecisionListImage(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function ContrastImage(para1:PImage; para2:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagiccore;
function ContrastStretchImage(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function ContrastStretchImageChannel(para1:PImage; para2:TChannelType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external libmagiccore;
function EqualizeImage(image:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function EqualizeImageChannel(image:PImage; para2:TChannelType):TMagickBooleanType;cdecl;external libmagiccore;
function GammaImage(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function GammaImageChannel(para1:PImage; para2:TChannelType; para3:Tdouble):TMagickBooleanType;cdecl;external libmagiccore;
function GrayscaleImage(para1:PImage; para2:TPixelIntensityMethod):TMagickBooleanType;cdecl;external libmagiccore;
function HaldClutImage(para1:PImage; para2:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function HaldClutImageChannel(para1:PImage; para2:TChannelType; para3:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function LevelImage(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function LevelImageChannel(para1:PImage; para2:TChannelType; para3:Tdouble; para4:Tdouble; para5:Tdouble):TMagickBooleanType;cdecl;external libmagiccore;
function LevelizeImage(para1:PImage; para2:Tdouble; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external libmagiccore;
function LevelizeImageChannel(para1:PImage; para2:TChannelType; para3:Tdouble; para4:Tdouble; para5:Tdouble):TMagickBooleanType;cdecl;external libmagiccore;
function LevelColorsImage(para1:PImage; para2:PMagickPixelPacket; para3:PMagickPixelPacket; para4:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagiccore;
function LevelColorsImageChannel(para1:PImage; para2:TChannelType; para3:PMagickPixelPacket; para4:PMagickPixelPacket; para5:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagiccore;
function LinearStretchImage(para1:PImage; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external libmagiccore;
function ModulateImage(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function NegateImage(para1:PImage; para2:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagiccore;
function NegateImageChannel(para1:PImage; para2:TChannelType; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagiccore;
function NormalizeImage(para1:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function NormalizeImageChannel(para1:PImage; para2:TChannelType):TMagickBooleanType;cdecl;external libmagiccore;
function SigmoidalContrastImage(para1:PImage; para2:TMagickBooleanType; para3:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function SigmoidalContrastImageChannel(para1:PImage; para2:TChannelType; para3:TMagickBooleanType; para4:Tdouble; para5:Tdouble):TMagickBooleanType;cdecl;external libmagiccore;
function EnhanceImage(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external libmagiccore;
{$endif}

// === Konventiert am: 6-1-26 15:36:29 ===


implementation



end.
