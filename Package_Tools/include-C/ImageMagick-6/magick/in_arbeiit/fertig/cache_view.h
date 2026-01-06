/*
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
*/
#ifndef MAGICKCORE_CACHE_VIEW_H
#define MAGICKCORE_CACHE_VIEW_H

#include "magick/pixel.h"


typedef enum
{
  UndefinedVirtualPixelMethod,
  BackgroundVirtualPixelMethod,
  ConstantVirtualPixelMethod,  /* deprecated */
  DitherVirtualPixelMethod,
  EdgeVirtualPixelMethod,
  MirrorVirtualPixelMethod,
  RandomVirtualPixelMethod,
  TileVirtualPixelMethod,
  TransparentVirtualPixelMethod,
  MaskVirtualPixelMethod,
  BlackVirtualPixelMethod,
  GrayVirtualPixelMethod,
  WhiteVirtualPixelMethod,
  HorizontalTileVirtualPixelMethod,
  VerticalTileVirtualPixelMethod,
  HorizontalTileEdgeVirtualPixelMethod,
  VerticalTileEdgeVirtualPixelMethod,
  CheckerTileVirtualPixelMethod
} VirtualPixelMethod;

typedef struct _CacheView
  CacheView;

extern  CacheView
  *AcquireAuthenticCacheView(const Image *,ExceptionInfo *);
extern  CacheView
  *AcquireCacheView(const Image *);
extern  CacheView
  *AcquireVirtualCacheView(const Image *,ExceptionInfo *);
extern  CacheView
  *CloneCacheView(const CacheView *);
extern  CacheView
  *DestroyCacheView(CacheView *);

extern  ClassType
  GetCacheViewStorageClass(const CacheView *);

extern  ColorspaceType
  GetCacheViewColorspace(const CacheView *);

extern  const IndexPacket
  *GetCacheViewVirtualIndexQueue(const CacheView *)
;

extern  const PixelPacket
  *GetCacheViewVirtualPixels(const CacheView *,const ssize_t,const ssize_t,
    const size_t,const size_t,ExceptionInfo *);
extern  const PixelPacket
  *GetCacheViewVirtualPixelQueue(const CacheView *) ;

extern  ExceptionInfo
  *GetCacheViewException(const CacheView *);

extern  IndexPacket
  *GetCacheViewAuthenticIndexQueue(CacheView *) ;

extern  MagickBooleanType
  GetOneCacheViewAuthenticPixel(const CacheView *magick_restrict,const ssize_t,
    const ssize_t,PixelPacket *magick_restrict,ExceptionInfo *);
extern  MagickBooleanType
  GetOneCacheViewVirtualMethodPixel(const CacheView *,
    const VirtualPixelMethod,const ssize_t,const ssize_t,PixelPacket *,
    ExceptionInfo *);
extern  MagickBooleanType
  GetOneCacheViewVirtualPixel(const CacheView *magick_restrict,const ssize_t,
    const ssize_t,PixelPacket *magick_restrict,ExceptionInfo *);
extern  MagickBooleanType
  SetCacheViewStorageClass(CacheView *,const ClassType);
extern  MagickBooleanType
  SetCacheViewVirtualPixelMethod(CacheView *magick_restrict,
    const VirtualPixelMethod);
extern  MagickBooleanType
  SyncCacheViewAuthenticPixels(CacheView *magick_restrict,ExceptionInfo *)
 ;

extern  MagickSizeType
  GetCacheViewExtent(const CacheView *);

extern  size_t
  GetCacheViewChannels(const CacheView *);

extern  PixelPacket
  *GetCacheViewAuthenticPixelQueue(CacheView *);
extern  PixelPacket
  *GetCacheViewAuthenticPixels(CacheView *,const ssize_t,const ssize_t,
    const size_t,const size_t,ExceptionInfo *) ;
extern  PixelPacket
  *QueueCacheViewAuthenticPixels(CacheView *,const ssize_t,const ssize_t,
    const size_t,const size_t,ExceptionInfo *) ;

#endif
