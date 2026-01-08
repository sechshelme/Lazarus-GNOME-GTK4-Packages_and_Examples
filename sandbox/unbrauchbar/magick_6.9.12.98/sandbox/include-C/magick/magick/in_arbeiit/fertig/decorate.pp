
unit decorate;
interface

{
  Automatically converted by H2Pas 1.0.0 from decorate.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    decorate.h
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
PFrameInfo  = ^FrameInfo;
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

  MagickCore image decorate methods.
 }
type
  PFrameInfo = ^TFrameInfo;
  TFrameInfo = record
      width : Tsize_t;
      height : Tsize_t;
      x : Tssize_t;
      y : Tssize_t;
      inner_bevel : Tssize_t;
      outer_bevel : Tssize_t;
    end;
(* Const before type ignored *)
(* Const before type ignored *)

function BorderImage(para1:PImage; para2:PRectangleInfo; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function FrameImage(para1:PImage; para2:PFrameInfo; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function RaiseImage(para1:PImage; para2:PRectangleInfo; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external;

implementation


end.
