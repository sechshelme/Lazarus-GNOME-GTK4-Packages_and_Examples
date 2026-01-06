unit delegate;

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

  MagickCore delegates methods.
 }
{$ifndef MAGICKCORE_DELEGATE_H}
{$define MAGICKCORE_DELEGATE_H}
{$include <stdarg.h>}
{$include "magick/semaphore.h"}
{ deprecated, use GetDelegateInfoList()  }
type
  PDelegateInfo = ^TDelegateInfo;
  TDelegateInfo = record
      path : Pchar;
      decode : Pchar;
      encode : Pchar;
      commands : Pchar;
      mode : Tssize_t;
      thread_support : TMagickBooleanType;
      spawn : TMagickBooleanType;
      stealth : TMagickBooleanType;
      previous : PDelegateInfo;
      next : PDelegateInfo;
      signature : Tsize_t;
      semaphore : PSemaphoreInfo;
    end;

function GetDelegateCommand(para1:PImageInfo; para2:PImage; para3:Pchar; para4:Pchar; para5:PExceptionInfo):Pchar;cdecl;external libmagiccore;
function GetDelegateList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^Pchar;cdecl;external libmagiccore;
function GetDelegateCommands(para1:PDelegateInfo):Pchar;cdecl;external libmagiccore;
function GetDelegateInfo(para1:Pchar; para2:Pchar; exception:PExceptionInfo):PDelegateInfo;cdecl;external libmagiccore;
function GetDelegateInfoList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^PDelegateInfo;cdecl;external libmagiccore;
function ExternalDelegateCommand(para1:TMagickBooleanType; para2:TMagickBooleanType; para3:Pchar; para4:Pchar; para5:PExceptionInfo):longint;cdecl;external libmagiccore;
function GetDelegateMode(para1:PDelegateInfo):Tssize_t;cdecl;external libmagiccore;
function DelegateComponentGenesis:TMagickBooleanType;cdecl;external libmagiccore;
function GetDelegateThreadSupport(para1:PDelegateInfo):TMagickBooleanType;cdecl;external libmagiccore;
function InvokeDelegate(para1:PImageInfo; para2:PImage; para3:Pchar; para4:Pchar; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function ListDelegateInfo(para1:PFILE; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
procedure DelegateComponentTerminus;cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 15:50:50 ===


implementation



end.
