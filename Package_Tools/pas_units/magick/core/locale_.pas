unit locale_;

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

  MagickCore locale methods.
 }
{$ifndef MAGICKCORE_LOCALE_H}
{$define MAGICKCORE_LOCALE_H}
{$include "magick/hashmap.h"}
{ deprecated, use GetLocaleInfoList()  }
type
  PLocaleInfo = ^TLocaleInfo;
  TLocaleInfo = record
      path : Pchar;
      tag : Pchar;
      message : Pchar;
      stealth : TMagickBooleanType;
      previous : PLocaleInfo;
      next : PLocaleInfo;
      signature : Tsize_t;
    end;

function GetLocaleList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^Pchar;cdecl;external libmagiccore;
function GetLocaleMessage(para1:Pchar):Pchar;cdecl;external libmagiccore;
function GetLocaleInfo_(para1:Pchar; para2:PExceptionInfo):PLocaleInfo;cdecl;external libmagiccore;
function GetLocaleInfoList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^PLocaleInfo;cdecl;external libmagiccore;
function InterpretLocaleValue(magick_restrict:Pchar; magick_restrict:PPchar):Tdouble;cdecl;external libmagiccore;
function LocaleCompare(para1:Pchar; para2:Pchar):longint;cdecl;external libmagiccore;
function LocaleLowercase(para1:longint):longint;cdecl;external libmagiccore;
function LocaleNCompare(para1:Pchar; para2:Pchar; para3:Tsize_t):longint;cdecl;external libmagiccore;
function LocaleUppercase(para1:longint):longint;cdecl;external libmagiccore;
function DestroyLocaleOptions(para1:PLinkedListInfo):PLinkedListInfo;cdecl;external libmagiccore;
function GetLocaleOptions(para1:Pchar; para2:PExceptionInfo):PLinkedListInfo;cdecl;external libmagiccore;
function ListLocaleInfo(para1:PFILE; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function LocaleComponentGenesis:TMagickBooleanType;cdecl;external libmagiccore;
function FormatLocaleFile(para1:PFILE; magick_restrict:Pchar; args:array of const):Tssize_t;cdecl;external libmagiccore;
function FormatLocaleFile(para1:PFILE; magick_restrict:Pchar):Tssize_t;cdecl;external libmagiccore;
function FormatLocaleFileList(para1:PFILE; magick_restrict:Pchar; para3:Tva_list):Tssize_t;cdecl;external libmagiccore;
function FormatLocaleString(magick_restrict:Pchar; para2:Tsize_t; magick_restrict:Pchar; args:array of const):Tssize_t;cdecl;external libmagiccore;
function FormatLocaleString(magick_restrict:Pchar; para2:Tsize_t; magick_restrict:Pchar):Tssize_t;cdecl;external libmagiccore;
function FormatLocaleStringList(magick_restrict:Pchar; para2:Tsize_t; magick_restrict:Pchar; para4:Tva_list):Tssize_t;cdecl;external libmagiccore;
procedure LocaleComponentTerminus;cdecl;external libmagiccore;
procedure LocaleLower(para1:Pchar);cdecl;external libmagiccore;
procedure LocaleUpper(para1:Pchar);cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 15:47:34 ===


implementation



end.
