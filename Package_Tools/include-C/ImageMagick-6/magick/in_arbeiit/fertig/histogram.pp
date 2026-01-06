
unit histogram;
interface

{
  Automatically converted by H2Pas 1.0.0 from histogram.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    histogram.h
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
PColorPacket  = ^ColorPacket;
PExceptionInfo  = ^ExceptionInfo;
PFILE  = ^FILE;
PImage  = ^Image;
Psize_t  = ^size_t;
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

  MagickCore histogram methods.
 }
{$ifndef MAGICKCORE_HISTOGRAM_H}
{$define MAGICKCORE_HISTOGRAM_H}
type
  PColorPacket = ^TColorPacket;
  TColorPacket = record
      pixel : TPixelPacket;
      index : TIndexPacket;
      count : TMagickSizeType;
    end;
(* Const before type ignored *)

function GetImageHistogram(para1:PImage; para2:Psize_t; para3:PExceptionInfo):PColorPacket;cdecl;external;
(* Const before type ignored *)
function UniqueImageColors(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
function IdentifyPaletteImage(para1:PImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function IsHistogramImage(para1:PImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function IsPaletteImage(para1:PImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MinMaxStretchImage(para1:PImage; para2:TChannelType; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function GetNumberColors(para1:PImage; para2:PFILE; para3:PExceptionInfo):Tsize_t;cdecl;external;

implementation


end.
