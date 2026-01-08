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

  MagickWand Application Programming Interface declarations.
*/

#ifndef _MAGICK_WAND_H
#define _MAGICK_WAND_H

#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <sys/types.h>
#include <time.h>


typedef struct _MagickWand
  MagickWand;

#include "wand/method-attribute.h"
#include "magick/MagickCore.h"
#include "wand/animate.h"
#include "wand/compare.h"
#include "wand/composite.h"
#include "wand/conjure.h"
#include "wand/convert.h"
#include "wand/deprecate.h"
#include "wand/display.h"
#include "wand/drawing-wand.h"
#include "wand/identify.h"
#include "wand/import.h"
#include "wand/magick-property.h"
#include "wand/magick-image.h"
#include "wand/mogrify.h"
#include "wand/montage.h"
#include "wand/pixel-iterator.h"
#include "wand/pixel-wand.h"
#include "wand/stream.h"
#include "wand/wand-view.h"

extern  char
  *MagickGetException(const MagickWand *,ExceptionType *);

extern  ExceptionType
  MagickGetExceptionType(const MagickWand *);

extern  MagickBooleanType
  IsMagickWand(const MagickWand *);
extern  MagickBooleanType
  IsMagickWandInstantiated(void);
extern  MagickBooleanType
  MagickClearException(MagickWand *);
extern  MagickBooleanType
  MagickSetIteratorIndex(MagickWand *,const ssize_t);

extern  MagickWand
  *CloneMagickWand(const MagickWand *);
extern  MagickWand
  *DestroyMagickWand(MagickWand *);
extern  MagickWand
  *NewMagickWand(void);
extern  MagickWand
  *NewMagickWandFromImage(const Image *);

extern  ssize_t
  MagickGetIteratorIndex(MagickWand *);

extern  void
  ClearMagickWand(MagickWand *);
extern  void
  MagickWandGenesis(void);
extern  void
  MagickWandTerminus(void);
extern  void
  *MagickRelinquishMemory(void *);
extern  void
  MagickResetIterator(MagickWand *);
extern  void
  MagickSetFirstIterator(MagickWand *);
extern  void
  MagickSetLastIterator(MagickWand *);


#endif
