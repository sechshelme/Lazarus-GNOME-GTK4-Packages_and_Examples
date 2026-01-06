
unit montage;
interface

{
  Automatically converted by H2Pas 1.0.0 from montage.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    montage.h
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
PImageInfo  = ^ImageInfo;
PMontageInfo  = ^MontageInfo;
PMontageMode  = ^MontageMode;
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

  MagickCore montage methods.
 }
{$ifndef MAGICKCORE_MONTAGE_H}
{$define MAGICKCORE_MONTAGE_H}
type
  PMontageMode = ^TMontageMode;
  TMontageMode =  Longint;
  Const
    UndefinedMode = 0;
    FrameMode = 1;
    UnframeMode = 2;
    ConcatenateMode = 3;
;
type
  PMontageInfo = ^TMontageInfo;
  TMontageInfo = record
      geometry : Pchar;
      tile : Pchar;
      title : Pchar;
      frame : Pchar;
      texture : Pchar;
      font : Pchar;
      pointsize : Tdouble;
      border_width : Tsize_t;
      shadow : TMagickBooleanType;
      fill : TPixelPacket;
      stroke : TPixelPacket;
      background_color : TPixelPacket;
      border_color : TPixelPacket;
      matte_color : TPixelPacket;
      gravity : TGravityType;
      filename : array[0..(MaxTextExtent)-1] of char;
      debug : TMagickBooleanType;
      signature : Tsize_t;
    end;
(* Const before type ignored *)
(* Const before type ignored *)

function MontageImages(para1:PImage; para2:PMontageInfo; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MontageImageList(para1:PImageInfo; para2:PMontageInfo; para3:PImage; para4:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CloneMontageInfo(para1:PImageInfo; para2:PMontageInfo):PMontageInfo;cdecl;external;
function DestroyMontageInfo(para1:PMontageInfo):PMontageInfo;cdecl;external;
(* Const before type ignored *)
procedure GetMontageInfo(para1:PImageInfo; para2:PMontageInfo);cdecl;external;

implementation


end.
