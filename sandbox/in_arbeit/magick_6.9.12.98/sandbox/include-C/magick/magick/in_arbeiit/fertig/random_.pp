
unit random_;
interface

{
  Automatically converted by H2Pas 1.0.0 from random_.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    random_.h
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
PRandomInfo  = ^RandomInfo;
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

  MagickCore random methods.
 }
{$ifndef MAGICKCORE_RANDOM__H}
{$define MAGICKCORE_RANDOM__H}
{$include "magick/string_.h"}
{
  Typedef declarations.
 }
type
{
  Method declarations.
 }

function GetRandomValue(para1:PRandomInfo):Tdouble;cdecl;external;
function GetPseudoRandomValue(magick_restrict:PRandomInfo):Tdouble;cdecl;external;
function RandomComponentGenesis:TMagickBooleanType;cdecl;external;
function AcquireRandomInfo:PRandomInfo;cdecl;external;
function DestroyRandomInfo(para1:PRandomInfo):PRandomInfo;cdecl;external;
(* Const before type ignored *)
function GetRandomKey(para1:PRandomInfo; para2:Tsize_t):PStringInfo;cdecl;external;
(* Const before type ignored *)
function GetRandomSecretKey(para1:PRandomInfo):dword;cdecl;external;
procedure RandomComponentTerminus;cdecl;external;
(* Const before type ignored *)
procedure SeedPseudoRandomGenerator(para1:dword);cdecl;external;
(* Const before type ignored *)
procedure SetRandomKey(para1:PRandomInfo; para2:Tsize_t; para3:Pbyte);cdecl;external;
(* Const before type ignored *)
procedure SetRandomSecretKey(para1:dword);cdecl;external;
(* Const before type ignored *)
procedure SetRandomTrueRandom(para1:TMagickBooleanType);cdecl;external;

implementation


end.
