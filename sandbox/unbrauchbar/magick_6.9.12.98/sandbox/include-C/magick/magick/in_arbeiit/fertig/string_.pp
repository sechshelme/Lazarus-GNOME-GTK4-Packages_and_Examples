
unit string_;
interface

{
  Automatically converted by H2Pas 1.0.0 from string_.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    string_.h
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
Pbyte  = ^byte;
Pchar  = ^char;
Pdouble  = ^double;
PExceptionInfo  = ^ExceptionInfo;
PFILE  = ^FILE;
Plongint  = ^longint;
Psize_t  = ^size_t;
Pssize_t  = ^ssize_t;
PStringInfo  = ^StringInfo;
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

  MagickCore string methods.
 }
{$ifndef MAGICKCORE_STRING_H_}
{$define MAGICKCORE_STRING_H_}
{$include <stdarg.h>}
{$include <time.h>}
{$include "magick/exception.h"}
type
  PStringInfo = ^TStringInfo;
  TStringInfo = record
      path : array[0..(MaxTextExtent)-1] of char;
      datum : Pbyte;
      length : Tsize_t;
      signature : Tsize_t;
      name : Pchar;
    end;
(* Const before type ignored *)

function AcquireString(para1:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function CloneString(para1:PPchar; para2:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function ConstantString(para1:Pchar):Pchar;cdecl;external;
function DestroyString(para1:Pchar):Pchar;cdecl;external;
function DestroyStringList(para1:PPchar):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function EscapeString(para1:Pchar; para2:char):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function FileToString(para1:Pchar; para2:Tsize_t; para3:PExceptionInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function GetEnvironmentValue(para1:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function SanitizeString(para1:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function StringInfoToHexString(para1:PStringInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function StringInfoToString(para1:PStringInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function StringToArgv(para1:Pchar; para2:Plongint):^Pchar;cdecl;external;
(* Const before type ignored *)
function StringToken(para1:Pchar; para2:PPchar):Pchar;cdecl;external;
(* Const before type ignored *)
function StringToList(para1:Pchar):^Pchar;cdecl;external;
(* Const before type ignored *)
function StringToStrings(para1:Pchar; para2:Psize_t):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetStringInfoName(para1:PStringInfo):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetStringInfoPath(para1:PStringInfo):Pchar;cdecl;external;
(* Const before type ignored *)
function InterpretSiPrefixValue(magick_restrict:Pchar; magick_restrict:PPchar):Tdouble;cdecl;external;
(* Const before type ignored *)
function StringToArrayOfDoubles(para1:Pchar; para2:Pssize_t; para3:PExceptionInfo):Pdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CompareStringInfo(para1:PStringInfo; para2:PStringInfo):longint;cdecl;external;
(* Const before type ignored *)
function ConcatenateString(magick_restrict:PPchar; magick_restrict:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function IsStringTrue(para1:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function IsStringNotFalse(para1:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SubstituteString(para1:PPchar; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ConcatenateMagickString(magick_restrict:Pchar; magick_restrict:Pchar; para3:Tsize_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function CopyMagickString(magick_restrict:Pchar; magick_restrict:Pchar; para3:Tsize_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
function GetStringInfoLength(para1:PStringInfo):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function FormatMagickSize(para1:TMagickSizeType; para2:TMagickBooleanType; para3:Pchar):Tssize_t;cdecl;external;
(* Const before type ignored *)
function AcquireStringInfo(para1:Tsize_t):PStringInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function BlobToStringInfo(para1:pointer; para2:Tsize_t):PStringInfo;cdecl;external;
(* Const before type ignored *)
function CloneStringInfo(para1:PStringInfo):PStringInfo;cdecl;external;
(* Const before type ignored *)
function ConfigureFileToStringInfo(para1:Pchar):PStringInfo;cdecl;external;
function DestroyStringInfo(para1:PStringInfo):PStringInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function FileToStringInfo(para1:Pchar; para2:Tsize_t; para3:PExceptionInfo):PStringInfo;cdecl;external;
(* Const before type ignored *)
function SplitStringInfo(para1:PStringInfo; para2:Tsize_t):PStringInfo;cdecl;external;
(* Const before type ignored *)
function StringToStringInfo(para1:Pchar):PStringInfo;cdecl;external;
(* Const before type ignored *)
function GetStringInfoDatum(para1:PStringInfo):Pbyte;cdecl;external;
(* Const before type ignored *)
procedure ConcatenateStringInfo(para1:PStringInfo; para2:PStringInfo);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure PrintStringInfo(file:PFILE; para2:Pchar; para3:PStringInfo);cdecl;external;
procedure ResetStringInfo(para1:PStringInfo);cdecl;external;
(* Const before type ignored *)
procedure SetStringInfo(para1:PStringInfo; para2:PStringInfo);cdecl;external;
(* Const before type ignored *)
procedure SetStringInfoDatum(para1:PStringInfo; para2:Pbyte);cdecl;external;
(* Const before type ignored *)
procedure SetStringInfoLength(para1:PStringInfo; para2:Tsize_t);cdecl;external;
(* Const before type ignored *)
procedure SetStringInfoName(para1:PStringInfo; para2:Pchar);cdecl;external;
(* Const before type ignored *)
procedure SetStringInfoPath(para1:PStringInfo; para2:Pchar);cdecl;external;
procedure StripString(para1:Pchar);cdecl;external;
{$endif}

implementation


end.
