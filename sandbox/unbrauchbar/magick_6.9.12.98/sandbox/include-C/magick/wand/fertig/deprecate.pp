
unit deprecate;
interface

{
  Automatically converted by H2Pas 1.0.0 from deprecate.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    deprecate.h
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
PDrawContext  = ^DrawContext;
PDrawInfo  = ^DrawInfo;
PDrawingWand  = ^DrawingWand;
PExceptionType  = ^ExceptionType;
PImage  = ^Image;
PMagickWand  = ^MagickWand;
PPixelIterator  = ^PixelIterator;
PPixelView  = ^PixelView;
PPixelWand  = ^PixelWand;
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
(* Const before type ignored *)

function DrawAllocateWand(para1:PDrawInfo; para2:PImage):PDrawingWand;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
type

  TDuplexTransferPixelViewMethod = function (para1:PPixelView; para2:PPixelView; para3:PPixelView; para4:pointer):TMagickBooleanType;cdecl;
(* Const before type ignored *)

  TGetPixelViewMethod = function (para1:PPixelView; para2:pointer):TMagickBooleanType;cdecl;

  TSetPixelViewMethod = function (para1:PPixelView; para2:pointer):TMagickBooleanType;cdecl;
(* Const before type ignored *)

  TTransferPixelViewMethod = function (para1:PPixelView; para2:PPixelView; para3:pointer):TMagickBooleanType;cdecl;

  TUpdatePixelViewMethod = function (para1:PPixelView; para2:pointer):TMagickBooleanType;cdecl;
(* Const before type ignored *)

function GetPixelViewException(para1:PPixelView; para2:PExceptionType):Pchar;cdecl;external;
(* Const before type ignored *)
function DrawGetFillAlpha(para1:PDrawingWand):Tdouble;cdecl;external;
(* Const before type ignored *)
function DrawGetStrokeAlpha(para1:PDrawingWand):Tdouble;cdecl;external;
(* Const before type ignored *)
function DrawPeekGraphicWand(para1:PDrawingWand):PDrawInfo;cdecl;external;
function MagickDescribeImage(para1:PMagickWand):Pchar;cdecl;external;
(* Const before type ignored *)
function MagickGetImageAttribute(para1:PMagickWand; para2:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function PixelIteratorGetException(para1:PPixelIterator; para2:PExceptionType):Pchar;cdecl;external;
function MagickGetImageIndex(para1:PMagickWand):Tssize_t;cdecl;external;
function DuplexTransferPixelViewIterator(para1:PPixelView; para2:PPixelView; para3:PPixelView; para4:TDuplexTransferPixelViewMethod; para5:pointer):TMagickBooleanType;cdecl;external;
function GetPixelViewIterator(para1:PPixelView; para2:TGetPixelViewMethod; para3:pointer):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function IsPixelView(para1:PPixelView):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickClipPathImage(para1:PMagickWand; para2:Pchar; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickColorFloodfillImage(para1:PMagickWand; para2:PPixelWand; para3:Tdouble; para4:PPixelWand; para5:Tssize_t; 
           para6:Tssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickGetImageChannelExtrema(para1:PMagickWand; para2:TChannelType; para3:Psize_t; para4:Psize_t):TMagickBooleanType;cdecl;external;
function MagickGetImageExtrema(para1:PMagickWand; para2:Psize_t; para3:Psize_t):TMagickBooleanType;cdecl;external;
function MagickGetImageMatte(para1:PMagickWand):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickGetImagePixels(para1:PMagickWand; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:Pchar; para7:TStorageType; para8:pointer):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickMapImage(para1:PMagickWand; para2:PMagickWand; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickMatteFloodfillImage(para1:PMagickWand; para2:Tdouble; para3:Tdouble; para4:PPixelWand; para5:Tssize_t; 
           para6:Tssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickMedianFilterImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickModeImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickReduceNoiseImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickRemapImage(para1:PMagickWand; para2:PMagickWand; para3:TDitherMethod):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickOpaqueImage(para1:PMagickWand; para2:PPixelWand; para3:PPixelWand; para4:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickPaintFloodfillImage(para1:PMagickWand; para2:TChannelType; para3:PPixelWand; para4:Tdouble; para5:PPixelWand; 
           para6:Tssize_t; para7:Tssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickPaintOpaqueImage(para1:PMagickWand; para2:PPixelWand; para3:PPixelWand; para4:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickPaintOpaqueImageChannel(para1:PMagickWand; para2:TChannelType; para3:PPixelWand; para4:PPixelWand; para5:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickPaintTransparentImage(para1:PMagickWand; para2:PPixelWand; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickRadialBlurImage(para1:PMagickWand; para2:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickRadialBlurImageChannel(para1:PMagickWand; para2:TChannelType; para3:Tdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickRecolorImage(para1:PMagickWand; para2:Tsize_t; para3:Pdouble):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSetImageAttribute(para1:PMagickWand; para2:Pchar; para3:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function MagickSetImageIndex(para1:PMagickWand; para2:Tssize_t):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSetImageOption(para1:PMagickWand; para2:Pchar; para3:Pchar; para4:Pchar):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickSetImagePixels(para1:PMagickWand; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:Pchar; para7:TStorageType; para8:pointer):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickTransparentImage(para1:PMagickWand; para2:PPixelWand; para3:Tdouble; para4:Tdouble):TMagickBooleanType;cdecl;external;
function SetPixelViewIterator(para1:PPixelView; para2:TSetPixelViewMethod; para3:pointer):TMagickBooleanType;cdecl;external;
function TransferPixelViewIterator(para1:PPixelView; para2:PPixelView; para3:TTransferPixelViewMethod; para4:pointer):TMagickBooleanType;cdecl;external;
function UpdatePixelViewIterator(para1:PPixelView; para2:TUpdatePixelViewMethod; para3:pointer):TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function GetPixelViewWand(para1:PPixelView):PMagickWand;cdecl;external;
function MagickAverageImages(para1:PMagickWand):PMagickWand;cdecl;external;
function MagickFlattenImages(para1:PMagickWand):PMagickWand;cdecl;external;
function MagickMaximumImages(para1:PMagickWand):PMagickWand;cdecl;external;
function MagickMinimumImages(para1:PMagickWand):PMagickWand;cdecl;external;
function MagickMosaicImages(para1:PMagickWand):PMagickWand;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function MagickRegionOfInterestImage(para1:PMagickWand; para2:Tsize_t; para3:Tsize_t; para4:Tssize_t; para5:Tssize_t):PMagickWand;cdecl;external;
function MagickGetImageSize(para1:PMagickWand):TMagickSizeType;cdecl;external;
(* Const before type ignored *)
function ClonePixelView(para1:PPixelView):PPixelView;cdecl;external;
function DestroyPixelView(para1:PPixelView):PPixelView;cdecl;external;
function NewPixelView(para1:PMagickWand):PPixelView;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function NewPixelViewRegion(para1:PMagickWand; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t):PPixelView;cdecl;external;
(* Const before type ignored *)
function GetPixelViewPixels(para1:PPixelView):^PPixelWand;cdecl;external;
function PixelGetNextRow(para1:PPixelIterator):^PPixelWand;cdecl;external;
(* Const before type ignored *)
function GetPixelViewHeight(para1:PPixelView):Tsize_t;cdecl;external;
(* Const before type ignored *)
function GetPixelViewWidth(para1:PPixelView):Tsize_t;cdecl;external;
(* Const before type ignored *)
function GetPixelViewX(para1:PPixelView):Tssize_t;cdecl;external;
(* Const before type ignored *)
function GetPixelViewY(para1:PPixelView):Tssize_t;cdecl;external;
function MagickWriteImageBlob(para1:PMagickWand; para2:Psize_t):Pbyte;cdecl;external;
procedure DrawPopGraphicContext(para1:PDrawingWand);cdecl;external;
procedure DrawPushGraphicContext(para1:PDrawingWand);cdecl;external;
(* Const before type ignored *)
procedure DrawSetFillAlpha(para1:PDrawingWand; para2:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure DrawSetStrokeAlpha(para1:PDrawingWand; para2:Tdouble);cdecl;external;
{$endif}
{$endif}

implementation


end.
