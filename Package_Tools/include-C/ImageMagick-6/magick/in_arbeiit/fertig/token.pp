
unit token;
interface

{
  Automatically converted by H2Pas 1.0.0 from token.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    token.h
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
Plongint  = ^longint;
PTokenInfo  = ^TokenInfo;
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

  MagickCore token methods.
 }
{$ifndef MAGICKCORE_TOKEN_H}
{$define MAGICKCORE_TOKEN_H}
{
  Typedef declarations.
 }
type
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function Tokenizer(para1:PTokenInfo; para2:dword; para3:Pchar; para4:Tsize_t; para5:Pchar; 
           para6:Pchar; para7:Pchar; para8:Pchar; para9:char; para10:Pchar; 
           para11:Plongint; para12:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GlobExpression(magick_restrict:Pchar; magick_restrict:Pchar; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function IsGlob(para1:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function IsMagickTrue(para1:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function GetNextToken(magick_restrict:Pchar; magick_restrict:PPchar; para3:Tsize_t; magick_restrict:Pchar):Tsize_t;cdecl;external;
function AcquireTokenInfo:PTokenInfo;cdecl;external;
function DestroyTokenInfo(para1:PTokenInfo):PTokenInfo;cdecl;external;

implementation


end.
