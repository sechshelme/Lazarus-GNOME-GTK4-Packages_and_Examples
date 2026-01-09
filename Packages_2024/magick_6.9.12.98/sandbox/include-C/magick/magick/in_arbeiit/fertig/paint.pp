
unit paint;
interface

{
  Automatically converted by H2Pas 1.0.0 from paint.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    paint.h
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
PDrawInfo  = ^DrawInfo;
PExceptionInfo  = ^ExceptionInfo;
PImage  = ^Image;
PMagickPixelPacket  = ^MagickPixelPacket;
PPixelPacket  = ^PixelPacket;
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

  MagickCore image paint methods.
 }
{$ifndef MAGICKCORE_PAINT_H}
{$define MAGICKCORE_PAINT_H}
{$include "magick/color.h"}
{$include "magick/draw.h"}
(* Const before type ignored *)
(* Const before type ignored *)

function OilPaintImage(para1:PImage; para2:Tdouble; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function FloodfillPaintImage(para1:PImage; para2:TChannelType; para3:PDrawInfo; para4:PMagickPixelPacket; para5:Tssize_t; 
           para6:Tssize_t; para7:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GradientImage(para1:PImage; para2:TGradientType; para3:TSpreadMethod; para4:PPixelPacket; para5:PPixelPacket):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function OpaquePaintImage(para1:PImage; para2:PMagickPixelPacket; para3:PMagickPixelPacket; para4:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function OpaquePaintImageChannel(para1:PImage; para2:TChannelType; para3:PMagickPixelPacket; para4:PMagickPixelPacket; para5:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function TransparentPaintImage(para1:PImage; para2:PMagickPixelPacket; para3:TQuantum; para4:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function TransparentPaintImageChroma(para1:PImage; para2:PMagickPixelPacket; para3:PMagickPixelPacket; para4:TQuantum; para5:TMagickBooleanType):TMagickBooleanType;cdecl;external;

implementation


end.
