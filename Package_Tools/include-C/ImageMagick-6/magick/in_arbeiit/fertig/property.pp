
unit property;
interface

{
  Automatically converted by H2Pas 1.0.0 from property.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    property.h
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
PImage  = ^Image;
PImageInfo  = ^ImageInfo;
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

  MagickCore property methods.
 }
{$ifndef MAGICKCORE_PROPERTY_H}
{$define MAGICKCORE_PROPERTY_H}
(* Const before type ignored *)

function GetNextImageProperty(para1:PImage):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function InterpretImageProperties(para1:PImageInfo; para2:PImage; para3:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function RemoveImageProperty(para1:PImage; para2:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GetImageProperty(para1:PImage; para2:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GetMagickProperty(para1:PImageInfo; para2:PImage; para3:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function CloneImageProperties(para1:PImage; para2:PImage):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function DefineImageProperty(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function DeleteImageProperty(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function FormatImageProperty(para1:PImage; para2:Pchar; para3:Pchar; args:array of const):TMagickBooleanType;cdecl;external;
function FormatImageProperty(para1:PImage; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SetImageProperty(para1:PImage; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external;
procedure DestroyImageProperties(para1:PImage);cdecl;external;
(* Const before type ignored *)
procedure ResetImagePropertyIterator(para1:PImage);cdecl;external;

implementation


end.
