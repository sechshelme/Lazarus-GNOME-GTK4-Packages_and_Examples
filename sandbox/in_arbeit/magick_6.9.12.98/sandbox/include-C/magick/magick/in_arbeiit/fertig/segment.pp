
unit segment;
interface

{
  Automatically converted by H2Pas 1.0.0 from segment.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    segment.h
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
PMagickPixelPacket  = ^MagickPixelPacket;
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

  MagickCore image segment methods.
 }
{$ifndef MAGICKCORE_SEGMENT_H}
{$define MAGICKCORE_SEGMENT_H}
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function GetImageDynamicThreshold(para1:PImage; para2:Tdouble; para3:Tdouble; para4:PMagickPixelPacket; para5:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function SegmentImage(para1:PImage; para2:TColorspaceType; para3:TMagickBooleanType; para4:Tdouble; para5:Tdouble):TMagickBooleanType;cdecl;external;

implementation


end.
