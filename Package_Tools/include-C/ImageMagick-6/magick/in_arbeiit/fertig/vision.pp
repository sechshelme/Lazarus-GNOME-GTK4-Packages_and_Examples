
unit vision;
interface

{
  Automatically converted by H2Pas 1.0.0 from vision.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    vision.h
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

  MagickCore computer vision methods.
 }
{$ifndef MAGICKCORE_VISION_H}
{$define MAGICKCORE_VISION_H}
(* Const before type ignored *)
(* Const before type ignored *)

function ConnectedComponentsImage(para1:PImage; para2:Tsize_t; para3:PExceptionInfo):PImage;cdecl;external;
{$endif}

implementation


end.
