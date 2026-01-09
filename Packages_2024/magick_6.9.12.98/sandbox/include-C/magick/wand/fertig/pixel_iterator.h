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

  Pixel Iterator Methods.
*/
#ifndef MAGICKWAND_PIXEL_ITERATOR_H
#define MAGICKWAND_PIXEL_ITERATOR_H

#include "wand/magick-wand.h"
#include "wand/pixel-wand.h"


typedef struct _PixelIterator
  PixelIterator;

extern  char
  *PixelGetIteratorException(const PixelIterator *,ExceptionType *);

extern  ExceptionType
  PixelGetIteratorExceptionType(const PixelIterator *);

extern  MagickBooleanType
  IsPixelIterator(const PixelIterator *);
extern  MagickBooleanType
  PixelClearIteratorException(PixelIterator *);
extern  MagickBooleanType
  PixelSetIteratorRow(PixelIterator *,const ssize_t);
extern  MagickBooleanType
  PixelSyncIterator(PixelIterator *);

extern  PixelIterator
  *ClonePixelIterator(const PixelIterator *);
extern  PixelIterator
  *DestroyPixelIterator(PixelIterator *);
extern  PixelIterator
  *NewPixelIterator(MagickWand *);
extern  PixelIterator
  *NewPixelRegionIterator(MagickWand *,const ssize_t,const ssize_t,const size_t,
    const size_t);

extern  PixelWand
  **PixelGetCurrentIteratorRow(PixelIterator *,size_t *);
extern  PixelWand
  **PixelGetNextIteratorRow(PixelIterator *,size_t *);
extern  PixelWand
  **PixelGetPreviousIteratorRow(PixelIterator *,size_t *);

extern  ssize_t
  PixelGetIteratorRow(PixelIterator *);

extern  void
  ClearPixelIterator(PixelIterator *);
extern  void
  PixelResetIterator(PixelIterator *);
extern  void
  PixelSetFirstIteratorRow(PixelIterator *);
extern  void
  PixelSetLastIteratorRow(PixelIterator *);


#endif
