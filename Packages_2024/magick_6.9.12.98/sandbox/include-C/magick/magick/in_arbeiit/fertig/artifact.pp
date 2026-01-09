
unit artifact;
interface

{
  Automatically converted by H2Pas 1.0.0 from artifact.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    artifact.h
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

  MagickCore artifact methods.
 }
{$ifndef MAGICKCORE_ARTIFACT_H}
{$define MAGICKCORE_ARTIFACT_H}
(* Const before type ignored *)

function GetNextImageArtifact(para1:PImage):Pchar;cdecl;external;
(* Const before type ignored *)
function RemoveImageArtifact(para1:PImage; para2:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GetImageArtifact(para1:PImage; para2:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function CloneImageArtifacts(para1:PImage; para2:PImage):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function DefineImageArtifact(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function DeleteImageArtifact(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SetImageArtifact(para1:PImage; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external;
procedure DestroyImageArtifacts(para1:PImage);cdecl;external;
(* Const before type ignored *)
procedure ResetImageArtifactIterator(para1:PImage);cdecl;external;

implementation


end.
