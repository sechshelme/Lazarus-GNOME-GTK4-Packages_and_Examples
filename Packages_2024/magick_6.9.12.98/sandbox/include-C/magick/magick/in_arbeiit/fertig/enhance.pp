
unit enhance;
interface

{
  Automatically converted by H2Pas 1.0.0 from enhance.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    enhance.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PExceptionInfo  = ^ExceptionInfo;
PImage  = ^Image;
PMagickPixelPacket  = ^MagickPixelPacket;
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

function AutoGammaImage(para1:PImage):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function AutoGammaImageChannel(para1:PImage; para2:TChannelType):TMagickBooleanType;cdecl;external;
function AutoLevelImage(para1:PImage):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function AutoLevelImageChannel(para1:PImage; para2:TChannelType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function BrightnessContrastImage(para1:PImage; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function BrightnessContrastImageChannel(para1:PImage; para2:TChannelType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function ClutImage(para1:PImage; para2:PImage):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ClutImageChannel(para1:PImage; para2:TChannelType; para3:PImage):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function ColorDecisionListImage(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function ContrastImage(para1:PImage; para2:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function ContrastStretchImage(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ContrastStretchImageChannel(para1:PImage; para2:TChannelType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external;
function EqualizeImage(image:PImage):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function EqualizeImageChannel(image:PImage; para2:TChannelType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function GammaImage(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GammaImageChannel(para1:PImage; para2:TChannelType; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function GrayscaleImage(para1:PImage; para2:TPixelIntensityMethod):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function HaldClutImage(para1:PImage; para2:PImage):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function HaldClutImageChannel(para1:PImage; para2:TChannelType; para3:PImage):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function LevelImage(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function LevelImageChannel(para1:PImage; para2:TChannelType; para3:Tdouble; para4:Tdouble; para5:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function LevelizeImage(para1:PImage; para2:Tdouble; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function LevelizeImageChannel(para1:PImage; para2:TChannelType; para3:Tdouble; para4:Tdouble; para5:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function LevelColorsImage(para1:PImage; para2:PMagickPixelPacket; para3:PMagickPixelPacket; para4:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function LevelColorsImageChannel(para1:PImage; para2:TChannelType; para3:PMagickPixelPacket; para4:PMagickPixelPacket; para5:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function LinearStretchImage(para1:PImage; para2:Tdouble; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function ModulateImage(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function NegateImage(para1:PImage; para2:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function NegateImageChannel(para1:PImage; para2:TChannelType; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external;
function NormalizeImage(para1:PImage):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function NormalizeImageChannel(para1:PImage; para2:TChannelType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SigmoidalContrastImage(para1:PImage; para2:TMagickBooleanType; para3:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function SigmoidalContrastImageChannel(para1:PImage; para2:TChannelType; para3:TMagickBooleanType; para4:Tdouble; para5:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function EnhanceImage(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external;
{$endif}

implementation


end.
