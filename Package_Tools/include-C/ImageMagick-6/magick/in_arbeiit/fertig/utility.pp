
unit utility;
interface

{
  Automatically converted by H2Pas 1.0.0 from utility.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    utility.h
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
Plongint  = ^longint;
PPathType  = ^PathType;
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

  MagickCore utility methods.
 }
{$ifndef MAGICKCORE_UTILITY_H}
{$define MAGICKCORE_UTILITY_H}
type
  PPathType = ^TPathType;
  TPathType =  Longint;
  Const
    UndefinedPath = 0;
    MagickPath = 1;
    RootPath = 2;
    HeadPath = 3;
    TailPath = 4;
    BasePath = 5;
    ExtensionPath = 6;
    SubimagePath = 7;
    CanonicalPath = 8;
    SubcanonicalPath = 9;
    BasePathSansCompressExtension = 10;
;
(* Const before type ignored *)
(* Const before type ignored *)

function Base64Encode(para1:Pbyte; para2:Tsize_t; para3:Psize_t):Pchar;cdecl;external;
(* Const before type ignored *)
function GetPathComponents(para1:Pchar; para2:Psize_t):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ListFiles(para1:Pchar; para2:Pchar; para3:Psize_t):^Pchar;cdecl;external;
function AcquireUniqueFilename(para1:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function AcquireUniqueSymbolicLink(para1:Pchar; para2:Pchar):char;cdecl;external;
function ExpandFilenames(para1:Plongint; para2:PPPchar):char;cdecl;external;
(* Const before type ignored *)
function GetPathAttributes(para1:Pchar; para2:pointer):char;cdecl;external;
(* Const before type ignored *)
function GetExecutionPath(para1:Pchar; para2:Tsize_t):char;cdecl;external;
(* Const before type ignored *)
function IsPathAccessible(para1:Pchar):char;cdecl;external;
(* Const before type ignored *)
function MultilineCensus(para1:Pchar):Tsize_t;cdecl;external;
function GetMagickPageSize:Tssize_t;cdecl;external;
(* Const before type ignored *)
function Base64Decode(para1:Pchar; para2:Psize_t):Pbyte;cdecl;external;
(* Const before type ignored *)
procedure AppendImageFormat(para1:Pchar; para2:Pchar);cdecl;external;
(* Const before type ignored *)
procedure ChopPathComponents(para1:Pchar; para2:Tsize_t);cdecl;external;
procedure ExpandFilename(para1:Pchar);cdecl;external;
(* Const before type ignored *)
procedure GetPathComponent(para1:Pchar; para2:TPathType; para3:Pchar);cdecl;external;
(* Const before type ignored *)
procedure MagickDelay(para1:TMagickSizeType);cdecl;external;

implementation


end.
