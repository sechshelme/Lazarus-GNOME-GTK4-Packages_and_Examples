
unit visual_effects;
interface

{
  Automatically converted by H2Pas 1.0.0 from visual_effects.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    visual_effects.h
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
PDrawInfo  = ^DrawInfo;
PExceptionInfo  = ^ExceptionInfo;
PImage  = ^Image;
PKernelInfo  = ^KernelInfo;
PNoiseType  = ^NoiseType;
PSegmentInfo  = ^SegmentInfo;
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

  MagickCore image visual effects methods.
 }
{$ifndef MAGICKCORE_VISUAL_EFFECTS_H}
{$define MAGICKCORE_VISUAL_EFFECTS_H}
{$include "magick/draw.h"}
type
  PNoiseType = ^TNoiseType;
  TNoiseType =  Longint;
  Const
    UndefinedNoise = 0;
    UniformNoise = 1;
    GaussianNoise = 2;
    MultiplicativeGaussianNoise = 3;
    ImpulseNoise = 4;
    LaplacianNoise = 5;
    PoissonNoise = 6;
    RandomNoise = 7;
;
(* Const before type ignored *)
(* Const before type ignored *)

function AddNoiseImage(para1:PImage; para2:TNoiseType; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function AddNoiseImageChannel(para1:PImage; para2:TChannelType; para3:TNoiseType; para4:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function BlueShiftImage(para1:PImage; para2:Tdouble; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function CharcoalImage(para1:PImage; para2:Tdouble; para3:Tdouble; para4:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ColorizeImage(para1:PImage; para2:Pchar; para3:TPixelPacket; para4:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ColorMatrixImage(para1:PImage; kernel:PKernelInfo; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ImplodeImage(para1:PImage; para2:Tdouble; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MorphImages(para1:PImage; para2:Tsize_t; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function PolaroidImage(para1:PImage; para2:PDrawInfo; para3:Tdouble; para4:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SepiaToneImage(para1:PImage; para2:Tdouble; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ShadowImage(para1:PImage; para2:Tdouble; para3:Tdouble; para4:Tssize_t; para5:Tssize_t; 
           para6:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function SketchImage(para1:PImage; para2:Tdouble; para3:Tdouble; para4:Tdouble; para5:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SteganoImage(para1:PImage; para2:PImage; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function StereoImage(para1:PImage; para2:PImage; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function StereoAnaglyphImage(para1:PImage; para2:PImage; para3:Tssize_t; para4:Tssize_t; para5:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
function SwirlImage(para1:PImage; para2:Tdouble; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function TintImage(para1:PImage; para2:Pchar; para3:TPixelPacket; para4:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function VignetteImage(para1:PImage; para2:Tdouble; para3:Tdouble; para4:Tssize_t; para5:Tssize_t; 
           para6:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function WaveImage(para1:PImage; para2:Tdouble; para3:Tdouble; para4:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function WaveletDenoiseImage(para1:PImage; para2:Tdouble; para3:Tdouble; para4:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
function PlasmaImage(para1:PImage; para2:PSegmentInfo; para3:Tsize_t; para4:Tsize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function SolarizeImage(para1:PImage; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SolarizeImageChannel(para1:PImage; para2:TChannelType; para3:Tdouble; para4:PExceptionInfo):TMagickBooleanType;cdecl;external;

implementation


end.
