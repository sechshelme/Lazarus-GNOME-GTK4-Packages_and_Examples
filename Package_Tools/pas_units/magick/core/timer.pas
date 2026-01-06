unit timer;

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

  MagickCore timer methods.
 }
{$ifndef MAGICKCORE_TIMER_H}
{$define MAGICKCORE_TIMER_H}
type
  PTimerState = ^TTimerState;
  TTimerState =  Longint;
  Const
    UndefinedTimerState = 0;
    StoppedTimerState = 1;
    RunningTimerState = 2;
;
type
  PTimer = ^TTimer;
  TTimer = record
      start : Tdouble;
      stop : Tdouble;
      total : Tdouble;
    end;

  PTimerInfo = ^TTimerInfo;
  TTimerInfo = record
      user : TTimer;
      elapsed : TTimer;
      state : TTimerState;
      signature : Tsize_t;
    end;

function GetElapsedTime(para1:PTimerInfo):Tdouble;cdecl;external libmagiccore;
function GetUserTime(para1:PTimerInfo):Tdouble;cdecl;external libmagiccore;
function ContinueTimer(para1:PTimerInfo):TMagickBooleanType;cdecl;external libmagiccore;
function FormatMagickTime(para1:Ttime_t; para2:Tsize_t; para3:Pchar):Tssize_t;cdecl;external libmagiccore;
function AcquireTimerInfo:PTimerInfo;cdecl;external libmagiccore;
function DestroyTimerInfo(para1:PTimerInfo):PTimerInfo;cdecl;external libmagiccore;
procedure GetTimerInfo(para1:PTimerInfo);cdecl;external libmagiccore;
procedure ResetTimer(para1:PTimerInfo);cdecl;external libmagiccore;
procedure StartTimer(para1:PTimerInfo; para2:TMagickBooleanType);cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 17:40:14 ===


implementation



end.
