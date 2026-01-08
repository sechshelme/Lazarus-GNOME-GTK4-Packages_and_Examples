unit pixel_wand;

interface

uses
  fp_magiccore, fp_magicwand;

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

function PixelGetColorAsNormalizedString(para1:PPixelWand):Pchar;cdecl;external libmagickwand;
function PixelGetColorAsString(para1:PPixelWand):Pchar;cdecl;external libmagickwand;
function PixelGetException(para1:PPixelWand; para2:PExceptionType):Pchar;cdecl;external libmagickwand;
function PixelGetAlpha(para1:PPixelWand):Tdouble;cdecl;external libmagickwand;
function PixelGetBlack(para1:PPixelWand):Tdouble;cdecl;external libmagickwand;
function PixelGetBlue(para1:PPixelWand):Tdouble;cdecl;external libmagickwand;
function PixelGetCyan(para1:PPixelWand):Tdouble;cdecl;external libmagickwand;
function PixelGetFuzz(para1:PPixelWand):Tdouble;cdecl;external libmagickwand;
function PixelGetGreen(para1:PPixelWand):Tdouble;cdecl;external libmagickwand;
function PixelGetMagenta(para1:PPixelWand):Tdouble;cdecl;external libmagickwand;
function PixelGetOpacity(para1:PPixelWand):Tdouble;cdecl;external libmagickwand;
function PixelGetRed(para1:PPixelWand):Tdouble;cdecl;external libmagickwand;
function PixelGetYellow(para1:PPixelWand):Tdouble;cdecl;external libmagickwand;
function PixelGetExceptionType(para1:PPixelWand):TExceptionType;cdecl;external libmagickwand;
function PixelGetIndex(para1:PPixelWand):TIndexPacket;cdecl;external libmagickwand;
function IsPixelWand(para1:PPixelWand):TMagickBooleanType;cdecl;external libmagickwand;
function IsPixelWandSimilar(para1:PPixelWand; para2:PPixelWand; para3:Tdouble):TMagickBooleanType;cdecl;external libmagickwand;
function PixelClearException(para1:PPixelWand):TMagickBooleanType;cdecl;external libmagickwand;
function PixelSetColor(para1:PPixelWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagickwand;
function ClonePixelWand(para1:PPixelWand):PPixelWand;cdecl;external libmagickwand;
function ClonePixelWands(para1:PPPixelWand; para2:Tsize_t):^PPixelWand;cdecl;external libmagickwand;
function DestroyPixelWand(para1:PPixelWand):PPixelWand;cdecl;external libmagickwand;
function DestroyPixelWands(para1:PPPixelWand; para2:Tsize_t):^PPixelWand;cdecl;external libmagickwand;
function NewPixelWand:PPixelWand;cdecl;external libmagickwand;
function NewPixelWands(para1:Tsize_t):^PPixelWand;cdecl;external libmagickwand;
function PixelGetAlphaQuantum(para1:PPixelWand):TQuantum;cdecl;external libmagickwand;
function PixelGetBlackQuantum(para1:PPixelWand):TQuantum;cdecl;external libmagickwand;
function PixelGetBlueQuantum(para1:PPixelWand):TQuantum;cdecl;external libmagickwand;
function PixelGetCyanQuantum(para1:PPixelWand):TQuantum;cdecl;external libmagickwand;
function PixelGetGreenQuantum(para1:PPixelWand):TQuantum;cdecl;external libmagickwand;
function PixelGetMagentaQuantum(para1:PPixelWand):TQuantum;cdecl;external libmagickwand;
function PixelGetOpacityQuantum(para1:PPixelWand):TQuantum;cdecl;external libmagickwand;
function PixelGetRedQuantum(para1:PPixelWand):TQuantum;cdecl;external libmagickwand;
function PixelGetYellowQuantum(para1:PPixelWand):TQuantum;cdecl;external libmagickwand;
function PixelGetColorCount(para1:PPixelWand):Tsize_t;cdecl;external libmagickwand;
procedure ClearPixelWand(para1:PPixelWand);cdecl;external libmagickwand;
procedure PixelGetHSL(para1:PPixelWand; para2:Pdouble; para3:Pdouble; para4:Pdouble);cdecl;external libmagickwand;
procedure PixelGetMagickColor(para1:PPixelWand; para2:PMagickPixelPacket);cdecl;external libmagickwand;
procedure PixelGetQuantumColor(para1:PPixelWand; para2:PPixelPacket);cdecl;external libmagickwand;
procedure PixelSetAlpha(para1:PPixelWand; para2:Tdouble);cdecl;external libmagickwand;
procedure PixelSetAlphaQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external libmagickwand;
procedure PixelSetBlack(para1:PPixelWand; para2:Tdouble);cdecl;external libmagickwand;
procedure PixelSetBlackQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external libmagickwand;
procedure PixelSetBlue(para1:PPixelWand; para2:Tdouble);cdecl;external libmagickwand;
procedure PixelSetBlueQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external libmagickwand;
procedure PixelSetColorFromWand(para1:PPixelWand; para2:PPixelWand);cdecl;external libmagickwand;
procedure PixelSetColorCount(para1:PPixelWand; para2:Tsize_t);cdecl;external libmagickwand;
procedure PixelSetCyan(para1:PPixelWand; para2:Tdouble);cdecl;external libmagickwand;
procedure PixelSetCyanQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external libmagickwand;
procedure PixelSetFuzz(para1:PPixelWand; para2:Tdouble);cdecl;external libmagickwand;
procedure PixelSetGreen(para1:PPixelWand; para2:Tdouble);cdecl;external libmagickwand;
procedure PixelSetGreenQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external libmagickwand;
procedure PixelSetHSL(para1:PPixelWand; para2:Tdouble; para3:Tdouble; para4:Tdouble);cdecl;external libmagickwand;
procedure PixelSetIndex(para1:PPixelWand; para2:TIndexPacket);cdecl;external libmagickwand;
procedure PixelSetMagenta(para1:PPixelWand; para2:Tdouble);cdecl;external libmagickwand;
procedure PixelSetMagentaQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external libmagickwand;
procedure PixelSetMagickColor(para1:PPixelWand; para2:PMagickPixelPacket);cdecl;external libmagickwand;
procedure PixelSetOpacity(para1:PPixelWand; para2:Tdouble);cdecl;external libmagickwand;
procedure PixelSetOpacityQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external libmagickwand;
procedure PixelSetQuantumColor(para1:PPixelWand; para2:PPixelPacket);cdecl;external libmagickwand;
procedure PixelSetRed(para1:PPixelWand; para2:Tdouble);cdecl;external libmagickwand;
procedure PixelSetRedQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external libmagickwand;
procedure PixelSetYellow(para1:PPixelWand; para2:Tdouble);cdecl;external libmagickwand;
procedure PixelSetYellowQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external libmagickwand;

// === Konventiert am: 5-1-26 19:40:15 ===


implementation



end.
