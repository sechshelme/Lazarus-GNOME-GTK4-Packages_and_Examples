
unit log;
interface

{
  Automatically converted by H2Pas 1.0.0 from log.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    log.h
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
PExceptionInfo  = ^ExceptionInfo;
PFILE  = ^FILE;
PLogEventType  = ^LogEventType;
PLogInfo  = ^LogInfo;
Psize_t  = ^size_t;
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

  MagickCore log methods.
 }
{$ifndef MAGICKCORE_LOG_H}
{$define MAGICKCORE_LOG_H}
{$include <stdarg.h>}
{$include "magick/exception.h"}

const
  MagickLogFilename = 'log.xml';  
type
  PLogEventType = ^TLogEventType;
  TLogEventType =  Longint;
  Const
    UndefinedEvents = 0;
    NoEvents = $00000;
    TraceEvent = $00001;
    AnnotateEvent = $00002;
    BlobEvent = $00004;
    CacheEvent = $00008;
    CoderEvent = $00010;
    ConfigureEvent = $00020;
    DeprecateEvent = $00040;
    DrawEvent = $00080;
    ExceptionEvent = $00100;
    ImageEvent = $00200;
    LocaleEvent = $00400;
    ModuleEvent = $00800;
    PolicyEvent = $01000;
    ResourceEvent = $02000;
    TransformEvent = $04000;
    UserEvent = $09000;
    WandEvent = $10000;
    X11Event = $20000;
    AccelerateEvent = $40000;
    AllEvents = $7fffffff;
;
type
(* Const before type ignored *)
(* Const before type ignored *)

  TMagickLogMethod = procedure (para1:TLogEventType; para2:Pchar);cdecl;
(* Const before type ignored *)
(* Const before type ignored *)

function GetLogInfoList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^PLogInfo;cdecl;external;
(* Const before type ignored *)
function GetLogList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^Pchar;cdecl;external;
function GetLogName:Pchar;cdecl;external;
(* Const before type ignored *)
function SetLogName(para1:Pchar):Pchar;cdecl;external;
function GetLogEventMask:TLogEventType;cdecl;external;
(* Const before type ignored *)
function SetLogEventMask(para1:Pchar):TLogEventType;cdecl;external;
function IsEventLogging:TMagickBooleanType;cdecl;external;
function ListLogInfo(para1:PFILE; para2:PExceptionInfo):char;cdecl;external;
function LogComponentGenesis:char;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function LogMagickEvent(para1:TLogEventType; para2:Pchar; para3:Pchar; para4:Tsize_t; para5:Pchar; 
           args:array of const):char;cdecl;external;
function LogMagickEvent(para1:TLogEventType; para2:Pchar; para3:Pchar; para4:Tsize_t; para5:Pchar):char;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function LogMagickEventList(para1:TLogEventType; para2:Pchar; para3:Pchar; para4:Tsize_t; para5:Pchar; 
           para6:Tva_list):char;cdecl;external;
procedure CloseMagickLog;cdecl;external;
procedure LogComponentTerminus;cdecl;external;
(* Const before type ignored *)
procedure SetLogFormat(para1:Pchar);cdecl;external;
procedure SetLogMethod(para1:TMagickLogMethod);cdecl;external;
{$endif}

implementation


end.
