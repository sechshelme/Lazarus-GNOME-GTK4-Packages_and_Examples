
unit blob;
interface

{
  Automatically converted by H2Pas 1.0.0 from blob.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    blob.h
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
Pbyte  = ^byte;
Pchar  = ^char;
PExceptionInfo  = ^ExceptionInfo;
PFILE  = ^FILE;
PImage  = ^Image;
PImageInfo  = ^ImageInfo;
PMapMode  = ^MapMode;
Psize_t  = ^size_t;
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

  MagickCore Binary Large OBjects methods.
 }
{$ifndef MAGICKCORE_BLOB_H}
{$define MAGICKCORE_BLOB_H}
{$include "magick/image.h"}
{$include "magick/stream.h"}

const
  MagickMaxBufferExtent = 81920;  
  MagickMinBufferExtent = 16384;  
type
  PMapMode = ^TMapMode;
  TMapMode =  Longint;
  Const
    ReadMode = 0;
    WriteMode = 1;
    IOMode = 2;
    PersistMode = 3;
;
(* Const before type ignored *)

function GetBlobFileHandle(para1:PImage):PFILE;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function BlobToImage(para1:PImageInfo; para2:pointer; para3:Tsize_t; para4:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function PingBlob(para1:PImageInfo; para2:pointer; para3:Tsize_t; para4:PExceptionInfo):PImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function BlobToFile(para1:Pchar; para2:pointer; para3:Tsize_t; para4:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function FileToImage(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function GetBlobError(para1:PImage):TMagickBooleanType;cdecl;external;
function ImageToFile(para1:PImage; para2:Pchar; para3:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function InjectImageBlob(para1:PImageInfo; para2:PImage; para3:PImage; para4:Pchar; para5:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function IsBlobExempt(para1:PImage):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function IsBlobSeekable(para1:PImage):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function IsBlobTemporary(para1:PImage):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function GetBlobSize(para1:PImage):TMagickSizeType;cdecl;external;
(* Const before type ignored *)
function GetBlobStreamHandler(para1:PImage):TStreamHandler;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function FileToBlob(para1:Pchar; para2:Tsize_t; para3:Psize_t; para4:PExceptionInfo):Pbyte;cdecl;external;
(* Const before type ignored *)
function GetBlobStreamData(para1:PImage):Pbyte;cdecl;external;
(* Const before type ignored *)
function ImageToBlob(para1:PImageInfo; para2:PImage; para3:Psize_t; para4:PExceptionInfo):Pbyte;cdecl;external;
(* Const before type ignored *)
function ImagesToBlob(para1:PImageInfo; para2:PImage; para3:Psize_t; para4:PExceptionInfo):Pbyte;cdecl;external;
procedure DestroyBlob(para1:PImage);cdecl;external;
(* Const before type ignored *)
procedure DuplicateBlob(para1:PImage; para2:PImage);cdecl;external;
(* Const before type ignored *)
procedure SetBlobExempt(para1:PImage; para2:TMagickBooleanType);cdecl;external;
{$endif}

implementation


end.
