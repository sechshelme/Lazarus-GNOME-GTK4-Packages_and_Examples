
unit attribute;
interface

{
  Automatically converted by H2Pas 1.0.0 from attribute.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    attribute.h
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

  MagickCore methods to set or get image attributes.
 }
{$ifndef MAGICKCORE_ATTRIBUTE_H}
{$define MAGICKCORE_ATTRIBUTE_H}
{$include "magick/image.h"}
{$include "magick/exception.h"}
(* Const before type ignored *)

function GetImageType(para1:PImage; para2:PExceptionInfo):TImageType;cdecl;external;
(* Const before type ignored *)
function IdentifyImageGray(para1:PImage; para2:PExceptionInfo):TImageType;cdecl;external;
(* Const before type ignored *)
function IdentifyImageType(para1:PImage; para2:PExceptionInfo):TImageType;cdecl;external;
(* Const before type ignored *)
function IdentifyImageMonochrome(para1:PImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function IsGrayImage(para1:PImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function IsMonochromeImage(para1:PImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function IsOpaqueImage(para1:PImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SetImageChannelDepth(para1:PImage; para2:TChannelType; para3:Tsize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function SetImageDepth(para1:PImage; para2:Tsize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function SetImageType(para1:PImage; para2:TImageType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function GetImageBoundingBox(para1:PImage; exception:PExceptionInfo):TRectangleInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetImageChannelDepth(para1:PImage; para2:TChannelType; para3:PExceptionInfo):Tsize_t;cdecl;external;
(* Const before type ignored *)
function GetImageDepth(para1:PImage; para2:PExceptionInfo):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetImageQuantumDepth(para1:PImage; para2:TMagickBooleanType):Tsize_t;cdecl;external;
{$endif}

implementation


end.
