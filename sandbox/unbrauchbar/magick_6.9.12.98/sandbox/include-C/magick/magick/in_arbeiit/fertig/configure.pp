
unit configure;
interface

{
  Automatically converted by H2Pas 1.0.0 from configure.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    configure.h
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
PConfigureInfo  = ^ConfigureInfo;
PExceptionInfo  = ^ExceptionInfo;
PFILE  = ^FILE;
PLinkedListInfo  = ^LinkedListInfo;
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

  MagickCore configure methods.
 }
{$ifndef MAGICKCORE_CONFIGURE_H}
{$define MAGICKCORE_CONFIGURE_H}
{$include "magick/hashmap.h"}
{ deprecated, use GetConfigureInfoList()  }
type
  PConfigureInfo = ^TConfigureInfo;
  TConfigureInfo = record
      path : Pchar;
      name : Pchar;
      value : Pchar;
      exempt : TMagickBooleanType;
      stealth : TMagickBooleanType;
      previous : PConfigureInfo;
      next : PConfigureInfo;
      signature : Tsize_t;
    end;
(* Const before type ignored *)

function GetConfigureList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^Pchar;cdecl;external;
(* Const before type ignored *)
function GetConfigureOption(para1:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetConfigureValue(para1:PConfigureInfo):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetConfigureInfo(para1:Pchar; para2:PExceptionInfo):PConfigureInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetConfigureInfoList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^PConfigureInfo;cdecl;external;
function DestroyConfigureOptions(para1:PLinkedListInfo):PLinkedListInfo;cdecl;external;
(* Const before type ignored *)
function GetConfigurePaths(para1:Pchar; para2:PExceptionInfo):PLinkedListInfo;cdecl;external;
(* Const before type ignored *)
function GetConfigureOptions(para1:Pchar; para2:PExceptionInfo):PLinkedListInfo;cdecl;external;
function ConfigureComponentGenesis:TMagickBooleanType;cdecl;external;
function ListConfigureInfo(para1:PFILE; para2:PExceptionInfo):TMagickBooleanType;cdecl;external;
procedure ConfigureComponentTerminus;cdecl;external;

implementation


end.
