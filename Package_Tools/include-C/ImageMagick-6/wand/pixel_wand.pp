
unit pixel_wand;
interface

{
  Automatically converted by H2Pas 1.0.0 from pixel_wand.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pixel_wand.h
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
Pdouble  = ^double;
PExceptionType  = ^ExceptionType;
PMagickPixelPacket  = ^MagickPixelPacket;
PPixelPacket  = ^PixelPacket;
PPixelWand  = ^PixelWand;
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

  MagickWand pixel wand methods.
 }
{$ifndef MAGICKWAND_PIXEL_WAND_H}
{$define MAGICKWAND_PIXEL_WAND_H}
type
(* Const before type ignored *)

function PixelGetColorAsNormalizedString(para1:PPixelWand):Pchar;cdecl;external;
(* Const before type ignored *)
function PixelGetColorAsString(para1:PPixelWand):Pchar;cdecl;external;
(* Const before type ignored *)
function PixelGetException(para1:PPixelWand; para2:PExceptionType):Pchar;cdecl;external;
(* Const before type ignored *)
function PixelGetAlpha(para1:PPixelWand):Tdouble;cdecl;external;
(* Const before type ignored *)
function PixelGetBlack(para1:PPixelWand):Tdouble;cdecl;external;
(* Const before type ignored *)
function PixelGetBlue(para1:PPixelWand):Tdouble;cdecl;external;
(* Const before type ignored *)
function PixelGetCyan(para1:PPixelWand):Tdouble;cdecl;external;
(* Const before type ignored *)
function PixelGetFuzz(para1:PPixelWand):Tdouble;cdecl;external;
(* Const before type ignored *)
function PixelGetGreen(para1:PPixelWand):Tdouble;cdecl;external;
(* Const before type ignored *)
function PixelGetMagenta(para1:PPixelWand):Tdouble;cdecl;external;
(* Const before type ignored *)
function PixelGetOpacity(para1:PPixelWand):Tdouble;cdecl;external;
(* Const before type ignored *)
function PixelGetRed(para1:PPixelWand):Tdouble;cdecl;external;
(* Const before type ignored *)
function PixelGetYellow(para1:PPixelWand):Tdouble;cdecl;external;
(* Const before type ignored *)
function PixelGetExceptionType(para1:PPixelWand):TExceptionType;cdecl;external;
(* Const before type ignored *)
function PixelGetIndex(para1:PPixelWand):TIndexPacket;cdecl;external;
(* Const before type ignored *)
function IsPixelWand(para1:PPixelWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function IsPixelWandSimilar(para1:PPixelWand; para2:PPixelWand; para3:Tdouble):TMagickBooleanType;cdecl;external;
function PixelClearException(para1:PPixelWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function PixelSetColor(para1:PPixelWand; para2:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function ClonePixelWand(para1:PPixelWand):PPixelWand;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ClonePixelWands(para1:PPPixelWand; para2:Tsize_t):^PPixelWand;cdecl;external;
function DestroyPixelWand(para1:PPixelWand):PPixelWand;cdecl;external;
(* Const before type ignored *)
function DestroyPixelWands(para1:PPPixelWand; para2:Tsize_t):^PPixelWand;cdecl;external;
function NewPixelWand:PPixelWand;cdecl;external;
(* Const before type ignored *)
function NewPixelWands(para1:Tsize_t):^PPixelWand;cdecl;external;
(* Const before type ignored *)
function PixelGetAlphaQuantum(para1:PPixelWand):TQuantum;cdecl;external;
(* Const before type ignored *)
function PixelGetBlackQuantum(para1:PPixelWand):TQuantum;cdecl;external;
(* Const before type ignored *)
function PixelGetBlueQuantum(para1:PPixelWand):TQuantum;cdecl;external;
(* Const before type ignored *)
function PixelGetCyanQuantum(para1:PPixelWand):TQuantum;cdecl;external;
(* Const before type ignored *)
function PixelGetGreenQuantum(para1:PPixelWand):TQuantum;cdecl;external;
(* Const before type ignored *)
function PixelGetMagentaQuantum(para1:PPixelWand):TQuantum;cdecl;external;
(* Const before type ignored *)
function PixelGetOpacityQuantum(para1:PPixelWand):TQuantum;cdecl;external;
(* Const before type ignored *)
function PixelGetRedQuantum(para1:PPixelWand):TQuantum;cdecl;external;
(* Const before type ignored *)
function PixelGetYellowQuantum(para1:PPixelWand):TQuantum;cdecl;external;
(* Const before type ignored *)
function PixelGetColorCount(para1:PPixelWand):Tsize_t;cdecl;external;
procedure ClearPixelWand(para1:PPixelWand);cdecl;external;
(* Const before type ignored *)
procedure PixelGetHSL(para1:PPixelWand; para2:Pdouble; para3:Pdouble; para4:Pdouble);cdecl;external;
(* Const before type ignored *)
procedure PixelGetMagickColor(para1:PPixelWand; para2:PMagickPixelPacket);cdecl;external;
(* Const before type ignored *)
procedure PixelGetQuantumColor(para1:PPixelWand; para2:PPixelPacket);cdecl;external;
(* Const before type ignored *)
procedure PixelSetAlpha(para1:PPixelWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure PixelSetAlphaQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external;
(* Const before type ignored *)
procedure PixelSetBlack(para1:PPixelWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure PixelSetBlackQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external;
(* Const before type ignored *)
procedure PixelSetBlue(para1:PPixelWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure PixelSetBlueQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external;
(* Const before type ignored *)
procedure PixelSetColorFromWand(para1:PPixelWand; para2:PPixelWand);cdecl;external;
(* Const before type ignored *)
procedure PixelSetColorCount(para1:PPixelWand; para2:Tsize_t);cdecl;external;
(* Const before type ignored *)
procedure PixelSetCyan(para1:PPixelWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure PixelSetCyanQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external;
(* Const before type ignored *)
procedure PixelSetFuzz(para1:PPixelWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure PixelSetGreen(para1:PPixelWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure PixelSetGreenQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure PixelSetHSL(para1:PPixelWand; para2:Tdouble; para3:Tdouble; para4:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure PixelSetIndex(para1:PPixelWand; para2:TIndexPacket);cdecl;external;
(* Const before type ignored *)
procedure PixelSetMagenta(para1:PPixelWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure PixelSetMagentaQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external;
(* Const before type ignored *)
procedure PixelSetMagickColor(para1:PPixelWand; para2:PMagickPixelPacket);cdecl;external;
(* Const before type ignored *)
procedure PixelSetOpacity(para1:PPixelWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure PixelSetOpacityQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external;
(* Const before type ignored *)
procedure PixelSetQuantumColor(para1:PPixelWand; para2:PPixelPacket);cdecl;external;
(* Const before type ignored *)
procedure PixelSetRed(para1:PPixelWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure PixelSetRedQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external;
(* Const before type ignored *)
procedure PixelSetYellow(para1:PPixelWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure PixelSetYellowQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external;

implementation


end.
