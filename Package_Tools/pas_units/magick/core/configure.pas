unit configure;

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

  MagickCore configure methods.
 }
{$ifndef MAGICKCORE_CONFIGURE_H}
{$define MAGICKCORE_CONFIGURE_H}
{$include "magick/hashmap.h"}
{ deprecated, use GetConfigureInfoList()  }
type
  PConfigureInfo = ^TConfigureInfo;
  TConfigureInfo = record
      path : Pchar;
      name : Pchar;
      value : Pchar;
      exempt : TMagickBooleanType;
      stealth : TMagickBooleanType;
      previous : PConfigureInfo;
      next : PConfigureInfo;
      signature : Tsize_t;
    end;

function GetConfigureList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^Pchar;cdecl;external libmagiccore;
function GetConfigureOption(para1:Pchar):Pchar;cdecl;external libmagiccore;
function GetConfigureValue(para1:PConfigureInfo):Pchar;cdecl;external libmagiccore;
function GetConfigureInfo(para1:Pchar; para2:PExceptionInfo):PConfigureInfo;cdecl;external libmagiccore;
function GetConfigureInfoList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^PConfigureInfo;cdecl;external libmagiccore;
function DestroyConfigureOptions(para1:PLinkedListInfo):PLinkedListInfo;cdecl;external libmagiccore;
function GetConfigurePaths(para1:Pchar; para2:PExceptionInfo):PLinkedListInfo;cdecl;external libmagiccore;
function GetConfigureOptions(para1:Pchar; para2:PExceptionInfo):PLinkedListInfo;cdecl;external libmagiccore;
function ConfigureComponentGenesis:TMagickBooleanType;cdecl;external libmagiccore;
function ListConfigureInfo(para1:PFILE; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
procedure ConfigureComponentTerminus;cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 15:54:31 ===


implementation



end.
