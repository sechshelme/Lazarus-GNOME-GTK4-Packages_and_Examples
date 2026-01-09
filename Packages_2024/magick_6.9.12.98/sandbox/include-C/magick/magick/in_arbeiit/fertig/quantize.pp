
unit quantize;
interface

{
  Automatically converted by H2Pas 1.0.0 from quantize.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    quantize.h
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
PDitherMethod  = ^DitherMethod;
PImage  = ^Image;
PImageInfo  = ^ImageInfo;
PQuantizeInfo  = ^QuantizeInfo;
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

  MagickCore image quantization methods.
 }
{$ifndef MAGICKCORE_QUANTIZE_H}
{$define MAGICKCORE_QUANTIZE_H}
{$include "magick/colorspace.h"}
type
  PDitherMethod = ^TDitherMethod;
  TDitherMethod =  Longint;
  Const
    UndefinedDitherMethod = 0;
    NoDitherMethod = 1;
    RiemersmaDitherMethod = 2;
    FloydSteinbergDitherMethod = 3;
;
type
  PQuantizeInfo = ^TQuantizeInfo;
  TQuantizeInfo = record
      number_colors : Tsize_t;
      tree_depth : Tsize_t;
      dither : TMagickBooleanType;
      colorspace : TColorspaceType;
      measure_error : TMagickBooleanType;
      signature : Tsize_t;
      dither_method : TDitherMethod;
    end;

function CompressImageColormap(para1:PImage):TMagickBooleanType;cdecl;external;
function GetImageQuantizeError(para1:PImage):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function PosterizeImage(para1:PImage; para2:Tsize_t; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function PosterizeImageChannel(para1:PImage; para2:TChannelType; para3:Tsize_t; para4:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function QuantizeImage(para1:PQuantizeInfo; para2:PImage):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function QuantizeImages(para1:PQuantizeInfo; para2:PImage):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function RemapImage(para1:PQuantizeInfo; para2:PImage; para3:PImage):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function RemapImages(para1:PQuantizeInfo; para2:PImage; para3:PImage):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function AcquireQuantizeInfo(para1:PImageInfo):PQuantizeInfo;cdecl;external;
(* Const before type ignored *)
function CloneQuantizeInfo(para1:PQuantizeInfo):PQuantizeInfo;cdecl;external;
function DestroyQuantizeInfo(para1:PQuantizeInfo):PQuantizeInfo;cdecl;external;
procedure GetQuantizeInfo(para1:PQuantizeInfo);cdecl;external;

implementation


end.
