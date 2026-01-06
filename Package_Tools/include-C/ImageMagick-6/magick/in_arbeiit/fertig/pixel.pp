
unit pixel;
interface

{
  Automatically converted by H2Pas 1.0.0 from pixel.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pixel.h
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
PCacheView_  = ^CacheView_;
Pchar  = ^char;
PDoublePixelPacket  = ^DoublePixelPacket;
PExceptionInfo  = ^ExceptionInfo;
PImage  = ^Image;
PIndexPacket  = ^IndexPacket;
PInterpolatePixelMethod  = ^InterpolatePixelMethod;
PLongPixelPacket  = ^LongPixelPacket;
PMagickPixelPacket  = ^MagickPixelPacket;
PPixelComponent  = ^PixelComponent;
PPixelIntensityMethod  = ^PixelIntensityMethod;
PPixelPacket  = ^PixelPacket;
PQuantumPixelPacket  = ^QuantumPixelPacket;
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

  MagickCore image constitute methods.
 }
{$ifndef MAGICKCORE_PIXEL_H}
{$define MAGICKCORE_PIXEL_H}
{$include "magick/colorspace.h"}
{$include "magick/constitute.h"}
{
  Pixel enum declarations.
 }
{ Average 4 nearest neighbours  }
{ Catmull-Rom interpolation  }
{ Triangular filter interpolation  }
{ Use resize filter - (very slow)  }
{ Integer (floor) interpolation  }
{ Triangular mesh interpolation  }
{ Nearest neighbour only  }
{ Cubic Spline (blurred) interpolation  }
{ Average 9 nearest neighbours  }
{ Average 16 nearest neighbours  }
{ blend of nearest 1, 2 or 4 pixels  }
{ just return background color  }
{ Catmull-Rom interpolation  }
type
  PInterpolatePixelMethod = ^TInterpolatePixelMethod;
  TInterpolatePixelMethod =  Longint;
  Const
    UndefinedInterpolatePixel = 0;
    AverageInterpolatePixel = 1;
    BicubicInterpolatePixel = 2;
    BilinearInterpolatePixel = 3;
    FilterInterpolatePixel = 4;
    IntegerInterpolatePixel = 5;
    MeshInterpolatePixel = 6;
    NearestNeighborInterpolatePixel = 7;
    SplineInterpolatePixel = 8;
    Average9InterpolatePixel = 9;
    Average16InterpolatePixel = 10;
    BlendInterpolatePixel = 11;
    BackgroundInterpolatePixel = 12;
    CatromInterpolatePixel = 13;
;
type
  PPixelComponent = ^TPixelComponent;
  TPixelComponent =  Longint;
  Const
    PixelRed = 0;
    PixelCyan = 0;
    PixelGray = 0;
    PixelY = 0;
    PixelGreen = 1;
    PixelMagenta = 1;
    PixelCb = 1;
    PixelBlue = 2;
    PixelYellow = 2;
    PixelCr = 2;
    PixelAlpha = 3;
    PixelBlack = 4;
    PixelIndex = 4;
    MaskPixelComponent = 5;
;
type
  PPixelIntensityMethod = ^TPixelIntensityMethod;
  TPixelIntensityMethod =  Longint;
  Const
    UndefinedPixelIntensityMethod = 0;
    AveragePixelIntensityMethod = 1;
    BrightnessPixelIntensityMethod = 2;
    LightnessPixelIntensityMethod = 3;
    Rec601LumaPixelIntensityMethod = 4;
    Rec601LuminancePixelIntensityMethod = 5;
    Rec709LumaPixelIntensityMethod = 6;
    Rec709LuminancePixelIntensityMethod = 7;
    RMSPixelIntensityMethod = 8;
    MSPixelIntensityMethod = 9;
;
{
  Pixel typedef declarations.
 }
type
  PDoublePixelPacket = ^TDoublePixelPacket;
  TDoublePixelPacket = record
      red : Tdouble;
      green : Tdouble;
      blue : Tdouble;
      opacity : Tdouble;
      index : Tdouble;
    end;

  PLongPixelPacket = ^TLongPixelPacket;
  TLongPixelPacket = record
      red : dword;
      green : dword;
      blue : dword;
      opacity : dword;
      index : dword;
    end;

  PMagickPixelPacket = ^TMagickPixelPacket;
  TMagickPixelPacket = record
      storage_class : TClassType;
      colorspace : TColorspaceType;
      matte : TMagickBooleanType;
      fuzz : Tdouble;
      depth : Tsize_t;
      red : TMagickRealType;
      green : TMagickRealType;
      blue : TMagickRealType;
      opacity : TMagickRealType;
      index : TMagickRealType;
    end;

  PIndexPacket = ^TIndexPacket;
  TIndexPacket = TQuantum;

  PPixelPacket = ^TPixelPacket;
  TPixelPacket = record
      blue : TQuantum;
      green : TQuantum;
      red : TQuantum;
      opacity : TQuantum;
    end;

  PQuantumPixelPacket = ^TQuantumPixelPacket;
  TQuantumPixelPacket = record
      red : TQuantum;
      green : TQuantum;
      blue : TQuantum;
      opacity : TQuantum;
      index : TQuantum;
    end;
  TCacheView = TCacheView_;
{
  Pixel method declarations.
 }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function ExportImagePixels(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:Pchar; para7:TStorageType; para8:pointer; para9:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ImportImagePixels(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:Pchar; para7:TStorageType; para8:pointer):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function InterpolateMagickPixelPacket(magick_restrict:PImage; para2:PCacheView_; para3:TInterpolatePixelMethod; para4:Tdouble; para5:Tdouble; 
           para6:PMagickPixelPacket; para7:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function CloneMagickPixelPacket(para1:PMagickPixelPacket):PMagickPixelPacket;cdecl;external;
(* Const before type ignored *)
function DecodePixelGamma(para1:TMagickRealType):TMagickRealType;cdecl;external;
(* Const before type ignored *)
function EncodePixelGamma(para1:TMagickRealType):TMagickRealType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetMagickPixelIntensity(image:PImage; magick_restrict:PMagickPixelPacket):TMagickRealType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetPixelIntensity(image:PImage; magick_restrict:PPixelPacket):TMagickRealType;cdecl;external;
(* Const before type ignored *)
procedure ConformMagickPixelPacket(para1:PImage; para2:PMagickPixelPacket; para3:PMagickPixelPacket; para4:PExceptionInfo);cdecl;external;
(* Const before type ignored *)
procedure GetMagickPixelPacket(para1:PImage; para2:PMagickPixelPacket);cdecl;external;
{$endif}

implementation


end.
