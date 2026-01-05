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

  MagickCore deprecated methods.
*/
#ifndef MAGICKWAND_DEPRECATE_H
#define MAGICKWAND_DEPRECATE_H


#if !defined(MAGICKCORE_EXCLUDE_DEPRECATED)

#include "wand/drawing-wand.h"
#include "wand/magick-wand.h"
#include "wand/pixel-iterator.h"
#include "wand/pixel-wand.h"

typedef struct _DrawingWand
  *DrawContext;

typedef struct _PixelView
  PixelView;

extern  DrawingWand
  *DrawAllocateWand(const DrawInfo *,Image *);

typedef MagickBooleanType
  (*DuplexTransferPixelViewMethod)(const PixelView *,const PixelView *, PixelView *,void *);
typedef MagickBooleanType
  (*GetPixelViewMethod)(const PixelView *,void *);
typedef MagickBooleanType
  (*SetPixelViewMethod)(PixelView *,void *);
typedef MagickBooleanType
  (*TransferPixelViewMethod)(const PixelView *,PixelView *,void *);
typedef MagickBooleanType
  (*UpdatePixelViewMethod)(PixelView *,void *);

extern  char
  *GetPixelViewException(const PixelView *,ExceptionType *)
    ;

extern  double
  DrawGetFillAlpha(const DrawingWand *) ;
extern  double
  DrawGetStrokeAlpha(const DrawingWand *) ;

extern  DrawInfo
  *DrawPeekGraphicWand(const DrawingWand *) ;

extern  char
  *MagickDescribeImage(MagickWand *) ;
extern  char
  *MagickGetImageAttribute(MagickWand *,const char *);
    
extern  char
  *PixelIteratorGetException(const PixelIterator *,ExceptionType *)
    ;

extern  ssize_t
  MagickGetImageIndex(MagickWand *) ;

extern  MagickBooleanType
  DuplexTransferPixelViewIterator(PixelView *,PixelView *,PixelView *,    DuplexTransferPixelViewMethod,void *) ;
extern  MagickBooleanType
  GetPixelViewIterator(PixelView *,GetPixelViewMethod,void *)    ;
extern  MagickBooleanType
  IsPixelView(const PixelView *) ;
extern  MagickBooleanType
  MagickClipPathImage(MagickWand *,const char *,const MagickBooleanType)
    ;
extern  MagickBooleanType
  MagickColorFloodfillImage(MagickWand *,const PixelWand *,const double,
    const PixelWand *,const ssize_t,const ssize_t)
    ;
extern  MagickBooleanType
  MagickGetImageChannelExtrema(MagickWand *,const ChannelType,size_t *,
    size_t *) ;
extern  MagickBooleanType
  MagickGetImageExtrema(MagickWand *,size_t *,size_t *)
    ;
extern  MagickBooleanType
  MagickGetImageMatte(MagickWand *) ;
extern  MagickBooleanType
  MagickGetImagePixels(MagickWand *,const ssize_t,const ssize_t,const size_t,
    const size_t,const char *,const StorageType,void *)
    ;
extern  MagickBooleanType
  MagickMapImage(MagickWand *,const MagickWand *,const MagickBooleanType)
    ;
extern  MagickBooleanType
  MagickMatteFloodfillImage(MagickWand *,const double,const double,
    const PixelWand *,const ssize_t,const ssize_t)
    ;
extern  MagickBooleanType
  MagickMedianFilterImage(MagickWand *,const double)
    ;
extern  MagickBooleanType
  MagickModeImage(MagickWand *,const double) ;
extern  MagickBooleanType
  MagickReduceNoiseImage(MagickWand *,const double)
    ;
extern  MagickBooleanType
  MagickRemapImage(MagickWand *,const MagickWand *,const DitherMethod);
extern  MagickBooleanType
  MagickOpaqueImage(MagickWand *,const PixelWand *,const PixelWand *,    const double) ;
extern  MagickBooleanType
  MagickPaintFloodfillImage(MagickWand *,const ChannelType,const PixelWand *,
    const double,const PixelWand *,const ssize_t,const ssize_t)
    ;
extern  MagickBooleanType
  MagickPaintOpaqueImage(MagickWand *,const PixelWand *,const PixelWand *,
    const double) ;
extern  MagickBooleanType
  MagickPaintOpaqueImageChannel(MagickWand *,const ChannelType,
    const PixelWand *,const PixelWand *,const double)
    ;
extern  MagickBooleanType
  MagickPaintTransparentImage(MagickWand *,const PixelWand *,const double,
    const double) ;
extern  MagickBooleanType
  MagickRadialBlurImage(MagickWand *,const double)
     ;
extern  MagickBooleanType
  MagickRadialBlurImageChannel(MagickWand *,const ChannelType,const double)
    ;
extern  MagickBooleanType
  MagickRecolorImage(MagickWand *,const size_t,const double *)
    ;
extern  MagickBooleanType
  MagickSetImageAttribute(MagickWand *,const char *,const char *)
    ;
extern  MagickBooleanType
  MagickSetImageIndex(MagickWand *,const ssize_t)
    ;
extern  MagickBooleanType
  MagickSetImageOption(MagickWand *,const char *,const char *,const char *)
    ;
extern  MagickBooleanType
  MagickSetImagePixels(MagickWand *,const ssize_t,const ssize_t,const size_t,
    const size_t,const char *,const StorageType,const void *)
    ;
extern  MagickBooleanType
  MagickTransparentImage(MagickWand *,const PixelWand *,const double,
    const double) ;
extern  MagickBooleanType
  SetPixelViewIterator(PixelView *,SetPixelViewMethod,void *)
    ;
extern  MagickBooleanType
  TransferPixelViewIterator(PixelView *,PixelView *,TransferPixelViewMethod,
    void *) ;
extern  MagickBooleanType
  UpdatePixelViewIterator(PixelView *,UpdatePixelViewMethod,void *)
    ;

extern  MagickWand
  *GetPixelViewWand(const PixelView *) ;
extern  MagickWand
  *MagickAverageImages(MagickWand *) ;
extern  MagickWand
  *MagickFlattenImages(MagickWand *) ;
extern  MagickWand
  *MagickMaximumImages(MagickWand *) ;
extern  MagickWand
  *MagickMinimumImages(MagickWand *) ;
extern  MagickWand
  *MagickMosaicImages(MagickWand *) ;
extern  MagickWand
  *MagickRegionOfInterestImage(MagickWand *,const size_t,const size_t,    const ssize_t,const ssize_t) ;

extern  MagickSizeType
  MagickGetImageSize(MagickWand *) ;

extern  PixelView
  *ClonePixelView(const PixelView *) ;
extern  PixelView
  *DestroyPixelView(PixelView *) ;
extern  PixelView
  *NewPixelView(MagickWand *) ;
extern  PixelView
  *NewPixelViewRegion(MagickWand *,const ssize_t,const ssize_t,const size_t,
    const size_t) ;

extern  PixelWand
  **GetPixelViewPixels(const PixelView *) ;
extern  PixelWand
  **PixelGetNextRow(PixelIterator *) ;

extern  size_t
  GetPixelViewHeight(const PixelView *) ;
extern  size_t
  GetPixelViewWidth(const PixelView *) ;

extern  ssize_t
  GetPixelViewX(const PixelView *) ;
extern  ssize_t
  GetPixelViewY(const PixelView *) ;

extern  unsigned char
  *MagickWriteImageBlob(MagickWand *,size_t *) ;

extern  void
  DrawPopGraphicContext(DrawingWand *) ;
extern  void
  DrawPushGraphicContext(DrawingWand *) ;
extern  void
  DrawSetFillAlpha(DrawingWand *,const double) ;
extern  void
  DrawSetStrokeAlpha(DrawingWand *,const double) ;

#endif


#endif
