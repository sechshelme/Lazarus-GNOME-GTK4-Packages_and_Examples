
unit locale_;
interface

{
  Automatically converted by H2Pas 1.0.0 from locale_.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    locale_.h
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
PLinkedListInfo  = ^LinkedListInfo;
PLocaleInfo  = ^LocaleInfo;
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

  MagickCore locale methods.
 }
{$ifndef MAGICKCORE_LOCALE_H}
{$define MAGICKCORE_LOCALE_H}
{$include "magick/hashmap.h"}
{ deprecated, use GetLocaleInfoList()  }
type
  PLocaleInfo = ^TLocaleInfo;
  TLocaleInfo = record
      path : Pchar;
      tag : Pchar;
      message : Pchar;
      stealth : TMagickBooleanType;
      previous : PLocaleInfo;
      next : PLocaleInfo;
      signature : Tsize_t;
    end;
(* Const before type ignored *)

function GetLocaleList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetLocaleMessage(para1:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetLocaleInfo_(para1:Pchar; para2:PExceptionInfo):PLocaleInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetLocaleInfoList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^PLocaleInfo;cdecl;external;
(* Const before type ignored *)
function InterpretLocaleValue(magick_restrict:Pchar; magick_restrict:PPchar):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function LocaleCompare(para1:Pchar; para2:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function LocaleLowercase(para1:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function LocaleNCompare(para1:Pchar; para2:Pchar; para3:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function LocaleUppercase(para1:longint):longint;cdecl;external;
function DestroyLocaleOptions(para1:PLinkedListInfo):PLinkedListInfo;cdecl;external;
(* Const before type ignored *)
function GetLocaleOptions(para1:Pchar; para2:PExceptionInfo):PLinkedListInfo;cdecl;external;
function ListLocaleInfo(para1:PFILE; para2:PExceptionInfo):TMagickBooleanType;cdecl;external;
function LocaleComponentGenesis:TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function FormatLocaleFile(para1:PFILE; magick_restrict:Pchar; args:array of const):Tssize_t;cdecl;external;
function FormatLocaleFile(para1:PFILE; magick_restrict:Pchar):Tssize_t;cdecl;external;
(* Const before type ignored *)
function FormatLocaleFileList(para1:PFILE; magick_restrict:Pchar; para3:Tva_list):Tssize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function FormatLocaleString(magick_restrict:Pchar; para2:Tsize_t; magick_restrict:Pchar; args:array of const):Tssize_t;cdecl;external;
function FormatLocaleString(magick_restrict:Pchar; para2:Tsize_t; magick_restrict:Pchar):Tssize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function FormatLocaleStringList(magick_restrict:Pchar; para2:Tsize_t; magick_restrict:Pchar; para4:Tva_list):Tssize_t;cdecl;external;
procedure LocaleComponentTerminus;cdecl;external;
procedure LocaleLower(para1:Pchar);cdecl;external;
procedure LocaleUpper(para1:Pchar);cdecl;external;

implementation


end.
