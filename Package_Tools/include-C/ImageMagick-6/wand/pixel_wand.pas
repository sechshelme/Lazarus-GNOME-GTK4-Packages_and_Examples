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

function PixelGetColorAsNormalizedString(para1:PPixelWand):Pchar;cdecl;external libmagicwand;
function PixelGetColorAsString(para1:PPixelWand):Pchar;cdecl;external libmagicwand;
function PixelGetException(para1:PPixelWand; para2:PExceptionType):Pchar;cdecl;external libmagicwand;
function PixelGetAlpha(para1:PPixelWand):Tdouble;cdecl;external libmagicwand;
function PixelGetBlack(para1:PPixelWand):Tdouble;cdecl;external libmagicwand;
function PixelGetBlue(para1:PPixelWand):Tdouble;cdecl;external libmagicwand;
function PixelGetCyan(para1:PPixelWand):Tdouble;cdecl;external libmagicwand;
function PixelGetFuzz(para1:PPixelWand):Tdouble;cdecl;external libmagicwand;
function PixelGetGreen(para1:PPixelWand):Tdouble;cdecl;external libmagicwand;
function PixelGetMagenta(para1:PPixelWand):Tdouble;cdecl;external libmagicwand;
function PixelGetOpacity(para1:PPixelWand):Tdouble;cdecl;external libmagicwand;
function PixelGetRed(para1:PPixelWand):Tdouble;cdecl;external libmagicwand;
function PixelGetYellow(para1:PPixelWand):Tdouble;cdecl;external libmagicwand;
function PixelGetExceptionType(para1:PPixelWand):TExceptionType;cdecl;external libmagicwand;
function PixelGetIndex(para1:PPixelWand):TIndexPacket;cdecl;external libmagicwand;
function IsPixelWand(para1:PPixelWand):TMagickBooleanType;cdecl;external libmagicwand;
function IsPixelWandSimilar(para1:PPixelWand; para2:PPixelWand; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function PixelClearException(para1:PPixelWand):TMagickBooleanType;cdecl;external libmagicwand;
function PixelSetColor(para1:PPixelWand; para2:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function ClonePixelWand(para1:PPixelWand):PPixelWand;cdecl;external libmagicwand;
function ClonePixelWands(para1:PPPixelWand; para2:Tsize_t):^PPixelWand;cdecl;external libmagicwand;
function DestroyPixelWand(para1:PPixelWand):PPixelWand;cdecl;external libmagicwand;
function DestroyPixelWands(para1:PPPixelWand; para2:Tsize_t):^PPixelWand;cdecl;external libmagicwand;
function NewPixelWand:PPixelWand;cdecl;external libmagicwand;
function NewPixelWands(para1:Tsize_t):^PPixelWand;cdecl;external libmagicwand;
function PixelGetAlphaQuantum(para1:PPixelWand):TQuantum;cdecl;external libmagicwand;
function PixelGetBlackQuantum(para1:PPixelWand):TQuantum;cdecl;external libmagicwand;
function PixelGetBlueQuantum(para1:PPixelWand):TQuantum;cdecl;external libmagicwand;
function PixelGetCyanQuantum(para1:PPixelWand):TQuantum;cdecl;external libmagicwand;
function PixelGetGreenQuantum(para1:PPixelWand):TQuantum;cdecl;external libmagicwand;
function PixelGetMagentaQuantum(para1:PPixelWand):TQuantum;cdecl;external libmagicwand;
function PixelGetOpacityQuantum(para1:PPixelWand):TQuantum;cdecl;external libmagicwand;
function PixelGetRedQuantum(para1:PPixelWand):TQuantum;cdecl;external libmagicwand;
function PixelGetYellowQuantum(para1:PPixelWand):TQuantum;cdecl;external libmagicwand;
function PixelGetColorCount(para1:PPixelWand):Tsize_t;cdecl;external libmagicwand;
procedure ClearPixelWand(para1:PPixelWand);cdecl;external libmagicwand;
procedure PixelGetHSL(para1:PPixelWand; para2:Pdouble; para3:Pdouble; para4:Pdouble);cdecl;external libmagicwand;
procedure PixelGetMagickColor(para1:PPixelWand; para2:PMagickPixelPacket);cdecl;external libmagicwand;
procedure PixelGetQuantumColor(para1:PPixelWand; para2:PPixelPacket);cdecl;external libmagicwand;
procedure PixelSetAlpha(para1:PPixelWand; para2:Tdouble);cdecl;external libmagicwand;
procedure PixelSetAlphaQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external libmagicwand;
procedure PixelSetBlack(para1:PPixelWand; para2:Tdouble);cdecl;external libmagicwand;
procedure PixelSetBlackQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external libmagicwand;
procedure PixelSetBlue(para1:PPixelWand; para2:Tdouble);cdecl;external libmagicwand;
procedure PixelSetBlueQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external libmagicwand;
procedure PixelSetColorFromWand(para1:PPixelWand; para2:PPixelWand);cdecl;external libmagicwand;
procedure PixelSetColorCount(para1:PPixelWand; para2:Tsize_t);cdecl;external libmagicwand;
procedure PixelSetCyan(para1:PPixelWand; para2:Tdouble);cdecl;external libmagicwand;
procedure PixelSetCyanQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external libmagicwand;
procedure PixelSetFuzz(para1:PPixelWand; para2:Tdouble);cdecl;external libmagicwand;
procedure PixelSetGreen(para1:PPixelWand; para2:Tdouble);cdecl;external libmagicwand;
procedure PixelSetGreenQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external libmagicwand;
procedure PixelSetHSL(para1:PPixelWand; para2:Tdouble; para3:Tdouble; para4:Tdouble);cdecl;external libmagicwand;
procedure PixelSetIndex(para1:PPixelWand; para2:TIndexPacket);cdecl;external libmagicwand;
procedure PixelSetMagenta(para1:PPixelWand; para2:Tdouble);cdecl;external libmagicwand;
procedure PixelSetMagentaQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external libmagicwand;
procedure PixelSetMagickColor(para1:PPixelWand; para2:PMagickPixelPacket);cdecl;external libmagicwand;
procedure PixelSetOpacity(para1:PPixelWand; para2:Tdouble);cdecl;external libmagicwand;
procedure PixelSetOpacityQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external libmagicwand;
procedure PixelSetQuantumColor(para1:PPixelWand; para2:PPixelPacket);cdecl;external libmagicwand;
procedure PixelSetRed(para1:PPixelWand; para2:Tdouble);cdecl;external libmagicwand;
procedure PixelSetRedQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external libmagicwand;
procedure PixelSetYellow(para1:PPixelWand; para2:Tdouble);cdecl;external libmagicwand;
procedure PixelSetYellowQuantum(para1:PPixelWand; para2:TQuantum);cdecl;external libmagicwand;

// === Konventiert am: 5-1-26 19:40:15 ===


implementation



end.
