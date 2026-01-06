
unit delegate;
interface

{
  Automatically converted by H2Pas 1.0.0 from delegate.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    delegate.h
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
PDelegateInfo  = ^DelegateInfo;
PExceptionInfo  = ^ExceptionInfo;
PFILE  = ^FILE;
PImage  = ^Image;
PImageInfo  = ^ImageInfo;
PSemaphoreInfo  = ^SemaphoreInfo;
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
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function GetDelegateCommand(para1:PImageInfo; para2:PImage; para3:Pchar; para4:Pchar; para5:PExceptionInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function GetDelegateList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetDelegateCommands(para1:PDelegateInfo):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GetDelegateInfo(para1:Pchar; para2:Pchar; exception:PExceptionInfo):PDelegateInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetDelegateInfoList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^PDelegateInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ExternalDelegateCommand(para1:TMagickBooleanType; para2:TMagickBooleanType; para3:Pchar; para4:Pchar; para5:PExceptionInfo):longint;cdecl;external;
(* Const before type ignored *)
function GetDelegateMode(para1:PDelegateInfo):Tssize_t;cdecl;external;
function DelegateComponentGenesis:TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function GetDelegateThreadSupport(para1:PDelegateInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function InvokeDelegate(para1:PImageInfo; para2:PImage; para3:Pchar; para4:Pchar; para5:PExceptionInfo):TMagickBooleanType;cdecl;external;
function ListDelegateInfo(para1:PFILE; para2:PExceptionInfo):TMagickBooleanType;cdecl;external;
procedure DelegateComponentTerminus;cdecl;external;

implementation


end.
