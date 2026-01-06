
unit exception;
interface

{
  Automatically converted by H2Pas 1.0.0 from exception.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    exception.h
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
PExceptionType  = ^ExceptionType;
PImage  = ^Image;
PSemaphoreInfo  = ^SemaphoreInfo;
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

  MagickCore exception methods.
 }
{$ifndef MAGICKCORE_EXCEPTION_H}
{$define MAGICKCORE_EXCEPTION_H}
{$include <stdarg.h>}
{$include "magick/semaphore.h"}
type
  PExceptionType = ^TExceptionType;
  TExceptionType =  Longint;
  Const
    UndefinedException = 0;
    WarningException = 300;
    ResourceLimitWarning = 300;
    TypeWarning = 305;
    OptionWarning = 310;
    DelegateWarning = 315;
    MissingDelegateWarning = 320;
    CorruptImageWarning = 325;
    FileOpenWarning = 330;
    BlobWarning = 335;
    StreamWarning = 340;
    CacheWarning = 345;
    CoderWarning = 350;
    FilterWarning = 352;
    ModuleWarning = 355;
    DrawWarning = 360;
    ImageWarning = 365;
    WandWarning = 370;
    RandomWarning = 375;
    XServerWarning = 380;
    MonitorWarning = 385;
    RegistryWarning = 390;
    ConfigureWarning = 395;
    PolicyWarning = 399;
    ErrorException = 400;
    ResourceLimitError = 400;
    TypeError = 405;
    OptionError = 410;
    DelegateError = 415;
    MissingDelegateError = 420;
    CorruptImageError = 425;
    FileOpenError = 430;
    BlobError = 435;
    StreamError = 440;
    CacheError = 445;
    CoderError = 450;
    FilterError = 452;
    ModuleError = 455;
    DrawError = 460;
    ImageError = 465;
    WandError = 470;
    RandomError = 475;
    XServerError = 480;
    MonitorError = 485;
    RegistryError = 490;
    ConfigureError = 495;
    PolicyError = 499;
    FatalErrorException = 700;
    ResourceLimitFatalError = 700;
    TypeFatalError = 705;
    OptionFatalError = 710;
    DelegateFatalError = 715;
    MissingDelegateFatalError = 720;
    CorruptImageFatalError = 725;
    FileOpenFatalError = 730;
    BlobFatalError = 735;
    StreamFatalError = 740;
    CacheFatalError = 745;
    CoderFatalError = 750;
    FilterFatalError = 752;
    ModuleFatalError = 755;
    DrawFatalError = 760;
    ImageFatalError = 765;
    WandFatalError = 770;
    RandomFatalError = 775;
    XServerFatalError = 780;
    MonitorFatalError = 785;
    RegistryFatalError = 790;
    ConfigureFatalError = 795;
    PolicyFatalError = 799;
;
type
  PExceptionInfo = ^TExceptionInfo;
  TExceptionInfo = record
      severity : TExceptionType;
      error_number : longint;
      reason : Pchar;
      description : Pchar;
      exceptions : pointer;
      relinquish : TMagickBooleanType;
      semaphore : PSemaphoreInfo;
      signature : Tsize_t;
    end;

(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TErrorHandler = procedure (para1:TExceptionType; para2:Pchar; para3:Pchar);cdecl;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TFatalErrorHandler = procedure (para1:TExceptionType; para2:Pchar; para3:Pchar);cdecl;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TWarningHandler = procedure (para1:TExceptionType; para2:Pchar; para3:Pchar);cdecl;
(* Const before type ignored *)

function GetExceptionMessage(para1:longint):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GetLocaleExceptionMessage(para1:TExceptionType; para2:Pchar):Pchar;cdecl;external;
function SetErrorHandler(para1:TErrorHandler):TErrorHandler;cdecl;external;
function AcquireExceptionInfo:PExceptionInfo;cdecl;external;
function CloneExceptionInfo(para1:PExceptionInfo):PImage;cdecl;external;
function DestroyExceptionInfo(para1:PExceptionInfo):PImage;cdecl;external;
function SetFatalErrorHandler(para1:TFatalErrorHandler):TFatalErrorHandler;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ThrowException(para1:PExceptionInfo; para2:TExceptionType; para3:Pchar; para4:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ThrowMagickException(para1:PExceptionInfo; para2:Pchar; para3:Pchar; para4:Tsize_t; para5:TExceptionType; 
           para6:Pchar; para7:Pchar; args:array of const):TMagickBooleanType;cdecl;external;
function ThrowMagickException(para1:PExceptionInfo; para2:Pchar; para3:Pchar; para4:Tsize_t; para5:TExceptionType; 
           para6:Pchar; para7:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ThrowMagickExceptionList(para1:PExceptionInfo; para2:Pchar; para3:Pchar; para4:Tsize_t; para5:TExceptionType; 
           para6:Pchar; para7:Pchar; para8:Tva_list):TMagickBooleanType;cdecl;external;
procedure CatchException(para1:PExceptionInfo);cdecl;external;
procedure ClearMagickException(para1:PExceptionInfo);cdecl;external;
(* Const before type ignored *)
procedure InheritException(para1:PExceptionInfo; para2:PExceptionInfo);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure MagickError(para1:TExceptionType; para2:Pchar; para3:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure MagickFatalError(para1:TExceptionType; para2:Pchar; para3:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure MagickWarning(para1:TExceptionType; para2:Pchar; para3:Pchar);cdecl;external;
function SetWarningHandler(para1:TWarningHandler):TWarningHandler;cdecl;external;
{$endif}

implementation


end.
