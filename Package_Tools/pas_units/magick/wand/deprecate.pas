unit deprecate;

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

  MagickCore deprecated methods.
 }
{$ifndef MAGICKWAND_DEPRECATE_H}
{$define MAGICKWAND_DEPRECATE_H}
{$if !defined(MAGICKCORE_EXCLUDE_DEPRECATED)}
{$include "wand/drawing-wand.h"}
{$include "wand/magick-wand.h"}
{$include "wand/pixel-iterator.h"}
{$include "wand/pixel-wand.h"}
type
  PDrawContext = ^TDrawContext;
  TDrawContext = PDrawingWand;

function DrawAllocateWand(para1:PDrawInfo; para2:PImage):PDrawingWand;cdecl;external libmagicwand;
type

  TDuplexTransferPixelViewMethod = function (para1:PPixelView; para2:PPixelView; para3:PPixelView; para4:pointer):TMagickBooleanType;cdecl;

  TGetPixelViewMethod = function (para1:PPixelView; para2:pointer):TMagickBooleanType;cdecl;

  TSetPixelViewMethod = function (para1:PPixelView; para2:pointer):TMagickBooleanType;cdecl;

  TTransferPixelViewMethod = function (para1:PPixelView; para2:PPixelView; para3:pointer):TMagickBooleanType;cdecl;

  TUpdatePixelViewMethod = function (para1:PPixelView; para2:pointer):TMagickBooleanType;cdecl;

function GetPixelViewException(para1:PPixelView; para2:PExceptionType):Pchar;cdecl;external libmagicwand;
function DrawGetFillAlpha(para1:PDrawingWand):Tdouble;cdecl;external libmagicwand;
function DrawGetStrokeAlpha(para1:PDrawingWand):Tdouble;cdecl;external libmagicwand;
function DrawPeekGraphicWand(para1:PDrawingWand):PDrawInfo;cdecl;external libmagicwand;
function MagickDescribeImage(para1:PMagickWand):Pchar;cdecl;external libmagicwand;
function MagickGetImageAttribute(para1:PMagickWand; para2:Pchar):Pchar;cdecl;external libmagicwand;
function PixelIteratorGetException(para1:PPixelIterator; para2:PExceptionType):Pchar;cdecl;external libmagicwand;
function MagickGetImageIndex(para1:PMagickWand):Tssize_t;cdecl;external libmagicwand;
function DuplexTransferPixelViewIterator(para1:PPixelView; para2:PPixelView; para3:PPixelView; para4:TDuplexTransferPixelViewMethod; para5:pointer):TMagickBooleanType;cdecl;external libmagicwand;
function GetPixelViewIterator(para1:PPixelView; para2:TGetPixelViewMethod; para3:pointer):TMagickBooleanType;cdecl;external libmagicwand;
function IsPixelView(para1:PPixelView):TMagickBooleanType;cdecl;external libmagicwand;
function MagickClipPathImage(para1:PMagickWand; para2:Pchar; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickColorFloodfillImage(para1:PMagickWand; para2:PPixelWand; para3:Tdouble; para4:PPixelWand; para5:Tssize_t; 
           para6:Tssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImageChannelExtrema(para1:PMagickWand; para2:TChannelType; para3:Psize_t; para4:Psize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImageExtrema(para1:PMagickWand; para2:Psize_t; para3:Psize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImageMatte(para1:PMagickWand):TMagickBooleanType;cdecl;external libmagicwand;
function MagickGetImagePixels(para1:PMagickWand; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:Pchar; para7:TStorageType; para8:pointer):TMagickBooleanType;cdecl;external libmagicwand;
function MagickMapImage(para1:PMagickWand; para2:PMagickWand; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagicwand;
function MagickMatteFloodfillImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble; para4:PPixelWand; para5:Tssize_t; 
           para6:Tssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickMedianFilterImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickModeImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickReduceNoiseImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickRemapImage(para1:PMagickWand; para2:PMagickWand; para3:TDitherMethod):TMagickBooleanType;cdecl;external libmagicwand;
function MagickOpaqueImage(para1:PMagickWand; para2:PPixelWand; para3:PPixelWand; para4:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickPaintFloodfillImage(para1:PMagickWand; para2:TChannelType; para3:PPixelWand; para4:Tdouble; para5:PPixelWand; 
           para6:Tssize_t; para7:Tssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickPaintOpaqueImage(para1:PMagickWand; para2:PPixelWand; para3:PPixelWand; para4:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickPaintOpaqueImageChannel(para1:PMagickWand; para2:TChannelType; para3:PPixelWand; para4:PPixelWand; para5:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickPaintTransparentImage(para1:PMagickWand; para2:PPixelWand; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickRadialBlurImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickRadialBlurImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickRecolorImage(para1:PMagickWand; para2:Tsize_t; para3:Pdouble):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageAttribute(para1:PMagickWand; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageIndex(para1:PMagickWand; para2:Tssize_t):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImageOption(para1:PMagickWand; para2:Pchar; para3:Pchar; para4:Pchar):TMagickBooleanType;cdecl;external libmagicwand;
function MagickSetImagePixels(para1:PMagickWand; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:Pchar; para7:TStorageType; para8:pointer):TMagickBooleanType;cdecl;external libmagicwand;
function MagickTransparentImage(para1:PMagickWand; para2:PPixelWand; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external libmagicwand;
function SetPixelViewIterator(para1:PPixelView; para2:TSetPixelViewMethod; para3:pointer):TMagickBooleanType;cdecl;external libmagicwand;
function TransferPixelViewIterator(para1:PPixelView; para2:PPixelView; para3:TTransferPixelViewMethod; para4:pointer):TMagickBooleanType;cdecl;external libmagicwand;
function UpdatePixelViewIterator(para1:PPixelView; para2:TUpdatePixelViewMethod; para3:pointer):TMagickBooleanType;cdecl;external libmagicwand;
function GetPixelViewWand(para1:PPixelView):PMagickWand;cdecl;external libmagicwand;
function MagickAverageImages(para1:PMagickWand):PMagickWand;cdecl;external libmagicwand;
function MagickFlattenImages(para1:PMagickWand):PMagickWand;cdecl;external libmagicwand;
function MagickMaximumImages(para1:PMagickWand):PMagickWand;cdecl;external libmagicwand;
function MagickMinimumImages(para1:PMagickWand):PMagickWand;cdecl;external libmagicwand;
function MagickMosaicImages(para1:PMagickWand):PMagickWand;cdecl;external libmagicwand;
function MagickRegionOfInterestImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Tssize_t; para5:Tssize_t):PMagickWand;cdecl;external libmagicwand;
function MagickGetImageSize(para1:PMagickWand):TMagickSizeType;cdecl;external libmagicwand;
function ClonePixelView(para1:PPixelView):PPixelView;cdecl;external libmagicwand;
function DestroyPixelView(para1:PPixelView):PPixelView;cdecl;external libmagicwand;
function NewPixelView(para1:PMagickWand):PPixelView;cdecl;external libmagicwand;
function NewPixelViewRegion(para1:PMagickWand; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t):PPixelView;cdecl;external libmagicwand;
function GetPixelViewPixels(para1:PPixelView):^PPixelWand;cdecl;external libmagicwand;
function PixelGetNextRow(para1:PPixelIterator):^PPixelWand;cdecl;external libmagicwand;
function GetPixelViewHeight(para1:PPixelView):Tsize_t;cdecl;external libmagicwand;
function GetPixelViewWidth(para1:PPixelView):Tsize_t;cdecl;external libmagicwand;
function GetPixelViewX(para1:PPixelView):Tssize_t;cdecl;external libmagicwand;
function GetPixelViewY(para1:PPixelView):Tssize_t;cdecl;external libmagicwand;
function MagickWriteImageBlob(para1:PMagickWand; para2:Psize_t):Pbyte;cdecl;external libmagicwand;
procedure DrawPopGraphicContext(para1:PDrawingWand);cdecl;external libmagicwand;
procedure DrawPushGraphicContext(para1:PDrawingWand);cdecl;external libmagicwand;
procedure DrawSetFillAlpha(para1:PDrawingWand; para2:Tdouble);cdecl;external libmagicwand;
procedure DrawSetStrokeAlpha(para1:PDrawingWand; para2:Tdouble);cdecl;external libmagicwand;
{$endif}
{$endif}

// === Konventiert am: 5-1-26 19:39:48 ===


implementation



end.
