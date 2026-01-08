
unit fx;
interface

{
  Automatically converted by H2Pas 1.0.0 from fx.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fx.h
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

  MagickCore image f/x methods.
 }
{$ifndef MAGICKCORE_FX_H}
{$define MAGICKCORE_FX_H}
{$include "magick/draw.h"}
(* Const before type ignored *)
(* Const before type ignored *)

function FxImage(para1:PImage; para2:Pchar; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function FxImageChannel(para1:PImage; para2:TChannelType; para3:Pchar; para4:PExceptionInfo):PImage;cdecl;external;

implementation


end.
