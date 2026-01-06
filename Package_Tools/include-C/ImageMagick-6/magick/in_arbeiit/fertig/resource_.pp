
unit resource_;
interface

{
  Automatically converted by H2Pas 1.0.0 from resource_.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    resource_.h
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
PFILE  = ^FILE;
PResourceType  = ^ResourceType;
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

  MagickCore resource methods.
 }
{$ifndef MAGICKCORE_RESOURCE_H}
{$define MAGICKCORE_RESOURCE_H}
type
  PResourceType = ^TResourceType;
  TResourceType =  Longint;
  Const
    UndefinedResource = 0;
    AreaResource = 1;
    DiskResource = 2;
    FileResource = 3;
    MapResource = 4;
    MemoryResource = 5;
    ThreadResource = 6;
    TimeResource = 7;
    ThrottleResource = 8;
    WidthResource = 9;
    HeightResource = 10;
    ListLengthResource = 11;
;

{ was #define dname def_expr }
function MagickResourceInfinity : longint; { return type might be wrong }

function AcquireUniqueFileResource(para1:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function AcquireMagickResource(para1:TResourceType; para2:TMagickSizeType):TMagickBooleanType;cdecl;external;
function GetPathTemplate(para1:Pchar):TMagickBooleanType;cdecl;external;
function ListMagickResourceInfo(para1:PFILE; para2:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function RelinquishUniqueFileResource(para1:Pchar):TMagickBooleanType;cdecl;external;
function ResourceComponentGenesis:TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SetMagickResourceLimit(para1:TResourceType; para2:TMagickSizeType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function GetMagickResource(para1:TResourceType):TMagickSizeType;cdecl;external;
(* Const before type ignored *)
function GetMagickResourceLimit(para1:TResourceType):TMagickSizeType;cdecl;external;
procedure AsynchronousResourceComponentTerminus;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure RelinquishMagickResource(para1:TResourceType; para2:TMagickSizeType);cdecl;external;
procedure ResourceComponentTerminus;cdecl;external;

implementation

{ was #define dname def_expr }
function MagickResourceInfinity : longint; { return type might be wrong }
  begin
    MagickResourceInfinity:=(MagickULLConstant( not (0))) shr 1;
  end;


end.
