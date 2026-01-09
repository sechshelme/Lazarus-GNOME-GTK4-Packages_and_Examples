
unit coder;
interface

{
  Automatically converted by H2Pas 1.0.0 from coder.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    coder.h
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
PCoderInfo  = ^CoderInfo;
PExceptionInfo  = ^ExceptionInfo;
PFILE  = ^FILE;
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

  MagickCore image coder methods.
 }
{$ifndef MAGICKCORE_CODER_H}
{$define MAGICKCORE_CODER_H}
{ deprecated, use GetCoderInfoList()  }
type
  PCoderInfo = ^TCoderInfo;
  TCoderInfo = record
      path : Pchar;
      magick : Pchar;
      name : Pchar;
      exempt : TMagickBooleanType;
      stealth : TMagickBooleanType;
      previous : PCoderInfo;
      next : PCoderInfo;
      signature : Tsize_t;
    end;
(* Const before type ignored *)

function GetCoderList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetCoderInfo(para1:Pchar; para2:PExceptionInfo):PCoderInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetCoderInfoList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^PCoderInfo;cdecl;external;
function CoderComponentGenesis:TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function ListCoderInfo(para1:PFILE; para2:PExceptionInfo):TCoderInfo;cdecl;external;
procedure CoderComponentTerminus;cdecl;external;

implementation


end.
