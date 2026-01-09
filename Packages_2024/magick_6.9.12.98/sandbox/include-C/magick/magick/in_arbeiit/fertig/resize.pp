
unit resize;
interface

{
  Automatically converted by H2Pas 1.0.0 from resize.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    resize.h
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
PExceptionInfo  = ^ExceptionInfo;
PImage  = ^Image;
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

  MagickCore image resize methods.
 }
{$ifndef MAGICKCORE_RESIZE_H}
{$define MAGICKCORE_RESIZE_H}
type
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function AdaptiveResizeImage(para1:PImage; para2:Tsize_t; para3:Tsize_t; para4:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function InterpolativeResizeImage(para1:PImage; para2:Tsize_t; para3:Tsize_t; para4:TInterpolatePixelMethod; para5:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function LiquidRescaleImage(para1:PImage; para2:Tsize_t; para3:Tsize_t; para4:Tdouble; para5:Tdouble; 
           para6:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
function MagnifyImage(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
function MinifyImage(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ResampleImage(para1:PImage; para2:Tdouble; para3:Tdouble; para4:TFilterTypes; para5:Tdouble; 
           para6:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ResizeImage(para1:PImage; para2:Tsize_t; para3:Tsize_t; para4:TFilterTypes; para5:Tdouble; 
           para6:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function SampleImage(para1:PImage; para2:Tsize_t; para3:Tsize_t; para4:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ScaleImage(para1:PImage; para2:Tsize_t; para3:Tsize_t; para4:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ThumbnailImage(para1:PImage; para2:Tsize_t; para3:Tsize_t; para4:PExceptionInfo):PImage;cdecl;external;

implementation


end.
