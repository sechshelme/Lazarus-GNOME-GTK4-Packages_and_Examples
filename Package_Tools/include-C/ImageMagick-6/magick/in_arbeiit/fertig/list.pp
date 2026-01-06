
unit list;
interface

{
  Automatically converted by H2Pas 1.0.0 from list.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    list.h
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

  MagickCore image list methods.
 }
{$ifndef MAGICKCORE_LIST_H}
{$define MAGICKCORE_LIST_H}
(* Const before type ignored *)

function CloneImageList(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CloneImages(para1:PImage; para2:Pchar; para3:PExceptionInfo):PImage;cdecl;external;
function DestroyImageList(para1:PImage):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function DuplicateImages(para1:PImage; para2:Tsize_t; para3:Pchar; para4:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
function GetFirstImageInList(para1:PImage):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetImageFromList(para1:PImage; para2:Tssize_t):PImage;cdecl;external;
(* Const before type ignored *)
function GetLastImageInList(para1:PImage):PImage;cdecl;external;
(* Const before type ignored *)
function GetNextImageInList(para1:PImage):PImage;cdecl;external;
(* Const before type ignored *)
function GetPreviousImageInList(para1:PImage):PImage;cdecl;external;
(* Const before type ignored *)
function ImageListToArray(para1:PImage; para2:PExceptionInfo):^PImage;cdecl;external;
function NewImageList:PImage;cdecl;external;
function RemoveImageFromList(para1:PPImage):PImage;cdecl;external;
function RemoveLastImageFromList(para1:PPImage):PImage;cdecl;external;
function RemoveFirstImageFromList(para1:PPImage):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SpliceImageIntoList(para1:PPImage; para2:Tsize_t; para3:PImage):PImage;cdecl;external;
function SplitImageList(para1:PImage):PImage;cdecl;external;
(* Const before type ignored *)
function SyncNextImageInList(para1:PImage):PImage;cdecl;external;
(* Const before type ignored *)
function GetImageListLength(para1:PImage):Tsize_t;cdecl;external;
(* Const before type ignored *)
function GetImageIndexInList(para1:PImage):Tssize_t;cdecl;external;
(* Const before type ignored *)
procedure AppendImageToList(para1:PPImage; para2:PImage);cdecl;external;
procedure DeleteImageFromList(para1:PPImage);cdecl;external;
(* Const before type ignored *)
procedure DeleteImages(para1:PPImage; para2:Pchar; para3:PExceptionInfo);cdecl;external;
procedure InsertImageInList(para1:PPImage; para2:PImage);cdecl;external;
procedure PrependImageToList(para1:PPImage; para2:PImage);cdecl;external;
procedure ReplaceImageInList(para1:PPImage; para2:PImage);cdecl;external;
procedure ReplaceImageInListReturnLast(para1:PPImage; para2:PImage);cdecl;external;
procedure ReverseImageList(para1:PPImage);cdecl;external;
procedure SyncImageList(para1:PImage);cdecl;external;
{$endif}

implementation


end.
