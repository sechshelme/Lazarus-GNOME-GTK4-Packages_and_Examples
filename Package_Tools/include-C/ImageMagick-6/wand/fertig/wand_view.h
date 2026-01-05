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

  MagickWand wand view methods.
*/
#ifndef MAGICKWAND_WAND_VIEW_H
#define MAGICKWAND_WAND_VIEW_H


typedef struct _WandView
  WandView;

typedef MagickBooleanType
  (*DuplexTransferWandViewMethod)(const WandView *,const WandView *,WandView *,
    const ssize_t,const int,void *);
typedef MagickBooleanType
  (*GetWandViewMethod)(const WandView *,const ssize_t,const int,void *);
typedef MagickBooleanType
  (*SetWandViewMethod)(WandView *,const ssize_t,const int,void *);
typedef MagickBooleanType
  (*TransferWandViewMethod)(const WandView *,WandView *,const ssize_t,
    const int,void *);
typedef MagickBooleanType
  (*UpdateWandViewMethod)(WandView *,const ssize_t,const int,void *);

extern  char
  *GetWandViewException(const WandView *,ExceptionType *);

extern  MagickBooleanType
  DuplexTransferWandViewIterator(WandView *,WandView *,WandView *,
    DuplexTransferWandViewMethod,void *);
extern  MagickBooleanType
  GetWandViewIterator(WandView *,GetWandViewMethod,void *);
extern  MagickBooleanType
  IsWandView(const WandView *);
extern  MagickBooleanType
  SetWandViewIterator(WandView *,SetWandViewMethod,void *);
extern  MagickBooleanType
  TransferWandViewIterator(WandView *,WandView *,TransferWandViewMethod,void *);
extern  MagickBooleanType
  UpdateWandViewIterator(WandView *,UpdateWandViewMethod,void *);

extern  MagickWand
  *GetWandViewWand(const WandView *);

extern  PixelWand
  **GetWandViewPixels(const WandView *);

extern  RectangleInfo
  GetWandViewExtent(const WandView *);

extern  void
  SetWandViewDescription(WandView *,const char *);
extern  void
  SetWandViewThreads(WandView *,const size_t);

extern  WandView
  *CloneWandView(const WandView *);
extern  WandView
  *DestroyWandView(WandView *);
extern  WandView
  *NewWandView(MagickWand *);
extern  WandView
  *NewWandViewExtent(MagickWand *,const ssize_t,const ssize_t,const size_t,
    const size_t);

#endif
