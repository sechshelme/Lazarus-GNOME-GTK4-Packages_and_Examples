
unit transform;
interface

{
  Automatically converted by H2Pas 1.0.0 from transform.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    transform.h
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
PRectangleInfo  = ^RectangleInfo;
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

  MagickCore image transform methods.
 }
{$ifndef MAGICKCORE_TRANSFORM_H}
{$define MAGICKCORE_TRANSFORM_H}
(* Const before type ignored *)
(* Const before type ignored *)

function AutoOrientImage(para1:PImage; para2:TOrientationType; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ChopImage(para1:PImage; para2:PRectangleInfo; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
function ConsolidateCMYKImages(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CropImage(para1:PImage; para2:PRectangleInfo; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CropImageToTiles(para1:PImage; para2:Pchar; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ExcerptImage(para1:PImage; para2:PRectangleInfo; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ExtentImage(para1:PImage; para2:PRectangleInfo; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
function FlipImage(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
function FlopImage(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function RollImage(para1:PImage; para2:Tssize_t; para3:Tssize_t; para4:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ShaveImage(para1:PImage; para2:PRectangleInfo; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SpliceImage(para1:PImage; para2:PRectangleInfo; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
function TransposeImage(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
function TransverseImage(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
function TrimImage(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TransformImage(para1:PPImage; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TransformImages(para1:PPImage; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external;

implementation


end.
