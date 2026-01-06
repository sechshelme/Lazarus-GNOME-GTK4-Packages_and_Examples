unit mime;

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

  The ImageMagick mime methods.
 }
type

function GetMimeList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^Pchar;cdecl;external libmagiccore;
function MagickToMime(para1:Pchar):Pchar;cdecl;external libmagiccore;
function GetMimeDescription(para1:PMimeInfo):Pchar;cdecl;external libmagiccore;
function GetMimeType(para1:PMimeInfo):Pchar;cdecl;external libmagiccore;
function ListMimeInfo(para1:PFILE; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function MimeComponentGenesis:TMagickBooleanType;cdecl;external libmagiccore;
function GetMimeInfo(para1:Pchar; para2:Pbyte; para3:Tsize_t; para4:PExceptionInfo):PMimeInfo;cdecl;external libmagiccore;
function GetMimeInfoList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^PMimeInfo;cdecl;external libmagiccore;
procedure MimeComponentTerminus;cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 19:17:27 ===


implementation



end.
