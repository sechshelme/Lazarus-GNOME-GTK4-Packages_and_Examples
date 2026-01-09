
unit stream;
interface

{
  Automatically converted by H2Pas 1.0.0 from stream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    stream.h
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

  MagickCore image stream methods.
 }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type

  TStreamHandler = function (para1:PImage; para2:pointer; para3:Tsize_t):Tsize_t;cdecl;
(* Const before type ignored *)

function ReadStream(para1:PImageInfo; para2:TStreamHandler; para3:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
function WriteStream(para1:PImageInfo; para2:PImage; para3:TStreamHandler):TMagickBooleanType;cdecl;external;

implementation


end.
