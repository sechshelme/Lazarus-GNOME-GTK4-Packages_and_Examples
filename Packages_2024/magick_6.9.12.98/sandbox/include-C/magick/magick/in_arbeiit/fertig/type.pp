
unit type;
interface

{
  Automatically converted by H2Pas 1.0.0 from type.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    type.h
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
Psize_t  = ^size_t;
PStretchType  = ^StretchType;
PStyleType  = ^StyleType;
PTypeInfo  = ^TypeInfo;
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

  MagickCore image type methods.
 }
{$ifndef MAGICKCORE_TYPE_H}
{$define MAGICKCORE_TYPE_H}
type
  PStretchType = ^TStretchType;
  TStretchType =  Longint;
  Const
    UndefinedStretch = 0;
    NormalStretch = 1;
    UltraCondensedStretch = 2;
    ExtraCondensedStretch = 3;
    CondensedStretch = 4;
    SemiCondensedStretch = 5;
    SemiExpandedStretch = 6;
    ExpandedStretch = 7;
    ExtraExpandedStretch = 8;
    UltraExpandedStretch = 9;
    AnyStretch = 10;
;
{ deprecated  }
type
  PStyleType = ^TStyleType;
  TStyleType =  Longint;
  Const
    UndefinedStyle = 0;
    NormalStyle = 1;
    ItalicStyle = 2;
    ObliqueStyle = 3;
    AnyStyle = 4;
    BoldStyle = 5;
;
{ deprecated, use GetTypeInfoList()  }
type
  PTypeInfo = ^TTypeInfo;
  TTypeInfo = record
      face : Tsize_t;
      path : Pchar;
      name : Pchar;
      description : Pchar;
      family : Pchar;
      style : TStyleType;
      stretch : TStretchType;
      weight : Tsize_t;
      encoding : Pchar;
      foundry : Pchar;
      format : Pchar;
      metrics : Pchar;
      glyphs : Pchar;
      stealth : TMagickBooleanType;
      previous : PTypeInfo;
      next : PTypeInfo;
      signature : Tsize_t;
    end;
(* Const before type ignored *)

function GetTypeList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^Pchar;cdecl;external;
function ListTypeInfo(para1:PFILE; para2:PExceptionInfo):TMagickBooleanType;cdecl;external;
function TypeComponentGenesis:TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetTypeInfo(para1:Pchar; para2:PExceptionInfo):PTypeInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GetTypeInfoByFamily(para1:Pchar; para2:TStyleType; para3:TStretchType; para4:Tsize_t; para5:PExceptionInfo):PTypeInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetTypeInfoList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^PTypeInfo;cdecl;external;
procedure TypeComponentTerminus;cdecl;external;

implementation


end.
