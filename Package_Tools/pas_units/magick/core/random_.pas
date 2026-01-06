unit random_;

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

  MagickCore random methods.
 }
{$ifndef MAGICKCORE_RANDOM__H}
{$define MAGICKCORE_RANDOM__H}
{$include "magick/string_.h"}
{
  Typedef declarations.
 }
type
{
  Method declarations.
 }

function GetRandomValue(para1:PRandomInfo):Tdouble;cdecl;external libmagiccore;
function GetPseudoRandomValue(magick_restrict:PRandomInfo):Tdouble;cdecl;external libmagiccore;
function RandomComponentGenesis:TMagickBooleanType;cdecl;external libmagiccore;
function AcquireRandomInfo:PRandomInfo;cdecl;external libmagiccore;
function DestroyRandomInfo(para1:PRandomInfo):PRandomInfo;cdecl;external libmagiccore;
function GetRandomKey(para1:PRandomInfo; para2:Tsize_t):PStringInfo;cdecl;external libmagiccore;
function GetRandomSecretKey(para1:PRandomInfo):dword;cdecl;external libmagiccore;
procedure RandomComponentTerminus;cdecl;external libmagiccore;
procedure SeedPseudoRandomGenerator(para1:dword);cdecl;external libmagiccore;
procedure SetRandomKey(para1:PRandomInfo; para2:Tsize_t; para3:Pbyte);cdecl;external libmagiccore;
procedure SetRandomSecretKey(para1:dword);cdecl;external libmagiccore;
procedure SetRandomTrueRandom(para1:TMagickBooleanType);cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 17:40:06 ===


implementation



end.
