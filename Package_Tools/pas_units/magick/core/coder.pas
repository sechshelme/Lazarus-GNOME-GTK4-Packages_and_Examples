unit coder;

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

  MagickCore image coder methods.
 }
{$ifndef MAGICKCORE_CODER_H}
{$define MAGICKCORE_CODER_H}
{ deprecated, use GetCoderInfoList()  }
type
  PCoderInfo = ^TCoderInfo;
  TCoderInfo = record
      path : Pchar;
      magick : Pchar;
      name : Pchar;
      exempt : TMagickBooleanType;
      stealth : TMagickBooleanType;
      previous : PCoderInfo;
      next : PCoderInfo;
      signature : Tsize_t;
    end;

function GetCoderList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^Pchar;cdecl;external libmagiccore;
function GetCoderInfo(para1:Pchar; para2:PExceptionInfo):PCoderInfo;cdecl;external libmagiccore;
function GetCoderInfoList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^PCoderInfo;cdecl;external libmagiccore;
function CoderComponentGenesis:TMagickBooleanType;cdecl;external libmagiccore;
function ListCoderInfo(para1:PFILE; para2:PExceptionInfo):TCoderInfo;cdecl;external libmagiccore;
procedure CoderComponentTerminus;cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 17:39:51 ===


implementation



end.
