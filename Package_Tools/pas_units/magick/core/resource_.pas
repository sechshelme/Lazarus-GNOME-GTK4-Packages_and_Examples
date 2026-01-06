unit resource_;

interface

uses
  fp_magiccore;

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

function AcquireUniqueFileResource(para1:Pchar):longint;cdecl;external libmagiccore;
function AcquireMagickResource(para1:TResourceType; para2:TMagickSizeType):TMagickBooleanType;cdecl;external libmagiccore;
function GetPathTemplate(para1:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function ListMagickResourceInfo(para1:PFILE; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function RelinquishUniqueFileResource(para1:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function ResourceComponentGenesis:TMagickBooleanType;cdecl;external libmagiccore;
function SetMagickResourceLimit(para1:TResourceType; para2:TMagickSizeType):TMagickBooleanType;cdecl;external libmagiccore;
function GetMagickResource(para1:TResourceType):TMagickSizeType;cdecl;external libmagiccore;
function GetMagickResourceLimit(para1:TResourceType):TMagickSizeType;cdecl;external libmagiccore;
procedure AsynchronousResourceComponentTerminus;cdecl;external libmagiccore;
procedure RelinquishMagickResource(para1:TResourceType; para2:TMagickSizeType);cdecl;external libmagiccore;
procedure ResourceComponentTerminus;cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 17:33:37 ===


implementation


{ was #define dname def_expr }
function MagickResourceInfinity : longint; { return type might be wrong }
  begin
    MagickResourceInfinity:=(MagickULLConstant( not (0))) shr 1;
  end;


end.
