
unit magic;
interface

{
  Automatically converted by H2Pas 1.0.0 from magic.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    magic.h
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
PExceptionInfo  = ^ExceptionInfo;
PFILE  = ^FILE;
PMagicInfo  = ^MagicInfo;
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

  MagickCore magic methods.
 }
{$ifndef MAGICKCORE_MAGIC_H}
{$define MAGICKCORE_MAGIC_H}
{ deprecated, use GetMagicInfoList()  }
type
  PMagicInfo = ^TMagicInfo;
  TMagicInfo = record
      path : Pchar;
      name : Pchar;
      target : Pchar;
      magic : Pbyte;
      length : Tsize_t;
      offset : TMagickOffsetType;
      exempt : TMagickBooleanType;
      stealth : TMagickBooleanType;
      previous : PMagicInfo;
      next : PMagicInfo;
      signature : Tsize_t;
    end;
(* Const before type ignored *)

function GetMagicList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetMagicName(para1:PMagicInfo):Pchar;cdecl;external;
function ListMagicInfo(para1:PFILE; para2:PExceptionInfo):TMagickBooleanType;cdecl;external;
function MagicComponentGenesis:TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GetMagicInfo(para1:Pbyte; para2:Tsize_t; para3:PExceptionInfo):PMagicInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetMagicInfoList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^PMagicInfo;cdecl;external;
procedure MagicComponentTerminus;cdecl;external;

implementation


end.
