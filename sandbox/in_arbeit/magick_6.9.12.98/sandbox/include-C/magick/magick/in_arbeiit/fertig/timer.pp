
unit timer;
interface

{
  Automatically converted by H2Pas 1.0.0 from timer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    timer.h
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
PTimer  = ^Timer;
PTimerInfo  = ^TimerInfo;
PTimerState  = ^TimerState;
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

function GetElapsedTime(para1:PTimerInfo):Tdouble;cdecl;external;
function GetUserTime(para1:PTimerInfo):Tdouble;cdecl;external;
function ContinueTimer(para1:PTimerInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function FormatMagickTime(para1:Ttime_t; para2:Tsize_t; para3:Pchar):Tssize_t;cdecl;external;
function AcquireTimerInfo:PTimerInfo;cdecl;external;
function DestroyTimerInfo(para1:PTimerInfo):PTimerInfo;cdecl;external;
procedure GetTimerInfo(para1:PTimerInfo);cdecl;external;
procedure ResetTimer(para1:PTimerInfo);cdecl;external;
(* Const before type ignored *)
procedure StartTimer(para1:PTimerInfo; para2:TMagickBooleanType);cdecl;external;

implementation


end.
