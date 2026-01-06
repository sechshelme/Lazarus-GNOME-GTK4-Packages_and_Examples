unit utility;

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

function Base64Encode(para1:Pbyte; para2:Tsize_t; para3:Psize_t):Pchar;cdecl;external libmagiccore;
function GetPathComponents(para1:Pchar; para2:Psize_t):^Pchar;cdecl;external libmagiccore;
function ListFiles(para1:Pchar; para2:Pchar; para3:Psize_t):^Pchar;cdecl;external libmagiccore;
function AcquireUniqueFilename(para1:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function AcquireUniqueSymbolicLink(para1:Pchar; para2:Pchar):char;cdecl;external libmagiccore;
function ExpandFilenames(para1:Plongint; para2:PPPchar):char;cdecl;external libmagiccore;
function GetPathAttributes(para1:Pchar; para2:pointer):char;cdecl;external libmagiccore;
function GetExecutionPath(para1:Pchar; para2:Tsize_t):char;cdecl;external libmagiccore;
function IsPathAccessible(para1:Pchar):char;cdecl;external libmagiccore;
function MultilineCensus(para1:Pchar):Tsize_t;cdecl;external libmagiccore;
function GetMagickPageSize:Tssize_t;cdecl;external libmagiccore;
function Base64Decode(para1:Pchar; para2:Psize_t):Pbyte;cdecl;external libmagiccore;
procedure AppendImageFormat(para1:Pchar; para2:Pchar);cdecl;external libmagiccore;
procedure ChopPathComponents(para1:Pchar; para2:Tsize_t);cdecl;external libmagiccore;
procedure ExpandFilename(para1:Pchar);cdecl;external libmagiccore;
procedure GetPathComponent(para1:Pchar; para2:TPathType; para3:Pchar);cdecl;external libmagiccore;
procedure MagickDelay(para1:TMagickSizeType);cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 17:33:40 ===


implementation



end.
