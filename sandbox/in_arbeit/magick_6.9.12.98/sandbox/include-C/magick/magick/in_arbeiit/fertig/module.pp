
unit module;
interface

{
  Automatically converted by H2Pas 1.0.0 from module.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    module.h
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
PImage  = ^Image;
PMagickModuleType  = ^MagickModuleType;
PModuleInfo  = ^ModuleInfo;
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

  MagickCore module methods.
 }
{$ifndef MAGICKCORE_MODULE_H}
{$define MAGICKCORE_MODULE_H}
{$include <time.h>}
{$include "magick/version.h"}

{ was #define dname def_expr }
function MagickImageCoderSignature : Tsize_t;  

{ was #define dname def_expr }
function MagickImageFilterSignature : Tsize_t;  

type
  PMagickModuleType = ^TMagickModuleType;
  TMagickModuleType =  Longint;
  Const
    MagickImageCoderModule = 0;
    MagickImageFilterModule = 1;
;
{ deprecated, use GetModuleInfoList()  }
type
  PModuleInfo = ^TModuleInfo;
  TModuleInfo = record
      path : Pchar;
      tag : Pchar;
      handle : pointer;
      unregister_module : procedure ;cdecl;
      register_module : function :Tsize_t;cdecl;
      timestamp : Ttime_t;
      stealth : TMagickBooleanType;
      previous : PModuleInfo;
      next : PModuleInfo;
      signature : Tsize_t;
    end;
{xxxxxxxxxxxx }
(* Const before type ignored *)
(* Const before type ignored *)

  TImageFilterHandler = function (para1:PPImage; para2:longint; para3:PPchar; para4:PExceptionInfo):Tsize_t;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)

function GetModuleList(para1:Pchar; para2:TMagickModuleType; para3:Psize_t; para4:PExceptionInfo):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetModuleInfoList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^PModuleInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function InvokeDynamicImageFilter(para1:Pchar; para2:PPImage; para3:longint; para4:PPchar; para5:PExceptionInfo):TMagickBooleanType;cdecl;external;
function ListModuleInfo(para1:PFILE; para2:PExceptionInfo):TMagickBooleanType;cdecl;external;
function ModuleComponentGenesis:TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function OpenModule(para1:Pchar; para2:PExceptionInfo):TMagickBooleanType;cdecl;external;
function OpenModules(para1:PExceptionInfo):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function GetModuleInfo(para1:Pchar; para2:PExceptionInfo):PModuleInfo;cdecl;external;
procedure DestroyModuleList;cdecl;external;
procedure ModuleComponentTerminus;cdecl;external;

implementation

{ was #define dname def_expr }
function MagickImageCoderSignature : Tsize_t;
  begin
    MagickImageCoderSignature:=Tsize_t((MagickLibInterface shl 8) or MAGICKCORE_QUANTUM_DEPTH);
  end;

{ was #define dname def_expr }
function MagickImageFilterSignature : Tsize_t;
  begin
    MagickImageFilterSignature:=Tsize_t((MagickLibInterface shl 8) or MAGICKCORE_QUANTUM_DEPTH);
  end;


end.
