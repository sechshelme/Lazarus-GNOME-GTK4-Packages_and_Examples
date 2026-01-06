unit cache_view;

interface

uses
  fp_magiccore;

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

  MagickCore cache view methods.
 }
{$ifndef MAGICKCORE_CACHE_VIEW_H}
{$define MAGICKCORE_CACHE_VIEW_H}
{$include "magick/pixel.h"}
{ deprecated  }
type
  PVirtualPixelMethod = ^TVirtualPixelMethod;
  TVirtualPixelMethod =  Longint;
  Const
    UndefinedVirtualPixelMethod = 0;
    BackgroundVirtualPixelMethod = 1;
    ConstantVirtualPixelMethod = 2;
    DitherVirtualPixelMethod = 3;
    EdgeVirtualPixelMethod = 4;
    MirrorVirtualPixelMethod = 5;
    RandomVirtualPixelMethod = 6;
    TileVirtualPixelMethod = 7;
    TransparentVirtualPixelMethod = 8;
    MaskVirtualPixelMethod = 9;
    BlackVirtualPixelMethod = 10;
    GrayVirtualPixelMethod = 11;
    WhiteVirtualPixelMethod = 12;
    HorizontalTileVirtualPixelMethod = 13;
    VerticalTileVirtualPixelMethod = 14;
    HorizontalTileEdgeVirtualPixelMethod = 15;
    VerticalTileEdgeVirtualPixelMethod = 16;
    CheckerTileVirtualPixelMethod = 17;
;
type

function AcquireAuthenticCacheView(para1:PImage; para2:PExceptionInfo):PCacheView;cdecl;external libmagiccore;
function AcquireCacheView(para1:PImage):PCacheView;cdecl;external libmagiccore;
function AcquireVirtualCacheView(para1:PImage; para2:PExceptionInfo):PCacheView;cdecl;external libmagiccore;
function CloneCacheView(para1:PCacheView):PCacheView;cdecl;external libmagiccore;
function DestroyCacheView(para1:PCacheView):PCacheView;cdecl;external libmagiccore;
function GetCacheViewStorageClass(para1:PCacheView):TClassType;cdecl;external libmagiccore;
function GetCacheViewColorspace(para1:PCacheView):TColorspaceType;cdecl;external libmagiccore;
function GetCacheViewVirtualIndexQueue(para1:PCacheView):PIndexPacket;cdecl;external libmagiccore;
function GetCacheViewVirtualPixels(para1:PCacheView; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:PExceptionInfo):PPixelPacket;cdecl;external libmagiccore;
function GetCacheViewVirtualPixelQueue(para1:PCacheView):PPixelPacket;cdecl;external libmagiccore;
function GetCacheViewException(para1:PCacheView):PExceptionInfo;cdecl;external libmagiccore;
function GetCacheViewAuthenticIndexQueue(para1:PCacheView):PIndexPacket;cdecl;external libmagiccore;
function GetOneCacheViewAuthenticPixel(magick_restrict:PCacheView; para2:Tssize_t; para3:Tssize_t; magick_restrict:PPixelPacket; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetOneCacheViewVirtualMethodPixel(para1:PCacheView; para2:TVirtualPixelMethod; para3:Tssize_t; para4:Tssize_t; para5:PPixelPacket; 
           para6:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetOneCacheViewVirtualPixel(magick_restrict:PCacheView; para2:Tssize_t; para3:Tssize_t; magick_restrict:PPixelPacket; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function SetCacheViewStorageClass(para1:PCacheView; para2:TClassType):TMagickBooleanType;cdecl;external libmagiccore;
function SetCacheViewVirtualPixelMethod(magick_restrict:PCacheView; para2:TVirtualPixelMethod):TMagickBooleanType;cdecl;external libmagiccore;
function SyncCacheViewAuthenticPixels(magick_restrict:PCacheView; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function GetCacheViewExtent(para1:PCacheView):TMagickSizeType;cdecl;external libmagiccore;
function GetCacheViewChannels(para1:PCacheView):Tsize_t;cdecl;external libmagiccore;
function GetCacheViewAuthenticPixelQueue(para1:PCacheView):PPixelPacket;cdecl;external libmagiccore;
function GetCacheViewAuthenticPixels(para1:PCacheView; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:PExceptionInfo):PPixelPacket;cdecl;external libmagiccore;
function QueueCacheViewAuthenticPixels(para1:PCacheView; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t; 
           para6:PExceptionInfo):PPixelPacket;cdecl;external libmagiccore;
{$endif}

// === Konventiert am: 6-1-26 15:03:09 ===


implementation



end.
