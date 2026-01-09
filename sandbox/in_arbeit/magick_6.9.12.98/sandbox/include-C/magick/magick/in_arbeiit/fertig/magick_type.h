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

  MagickCore types.
*/
#ifndef MAGICKCORE_MAGICK_TYPE_H
#define MAGICKCORE_MAGICK_TYPE_H

#include "magick/magick-config.h"


typedef float MagickFloatType;
typedef double MagickDoubleType;

typedef ssize_t SignedQuantum;
typedef unsigned short Quantum;

typedef MagickDoubleType MagickRealType;

typedef ssize_t MagickOffsetType;
typedef size_t MagickSizeType;

typedef size_t MagickAddressType;

typedef MagickOffsetType QuantumAny;
typedef MagickSizeType QuantumAny;


typedef enum
{
  UndefinedChannel,
  RedChannel = 0x0001,
  GrayChannel = 0x0001,
  CyanChannel = 0x0001,
  GreenChannel = 0x0002,
  MagentaChannel = 0x0002,
  BlueChannel = 0x0004,
  YellowChannel = 0x0004,
  AlphaChannel = 0x0008,
  OpacityChannel = 0x0008,
  MatteChannel = 0x0008,     /* deprecated */
  BlackChannel = 0x0020,
  IndexChannel = 0x0020,
  CompositeChannels = 0x002F,
  AllChannels = 0x7ffffff,
  /*
    Special purpose channel types.
  */
  TrueAlphaChannel = 0x0040, /* extract actual alpha channel from opacity */
  RGBChannels = 0x0080,      /* set alpha from  grayscale mask in RGB */
  GrayChannels = 0x0080,
  SyncChannels = 0x0100,     /* channels should be modified equally */
  DefaultChannels = ((AllChannels | SyncChannels) &~ OpacityChannel)
} ChannelType;

typedef enum
{
  UndefinedClass,
  DirectClass,
  PseudoClass
} ClassType;

typedef enum
{
  MagickFalse = 0,
  MagickTrue = 1
} MagickBooleanType;

/*
  The IsNaN test is for special floating point numbers of value Nan (not a
  number). NaN's are defined as part of the IEEE standard for floating point
  number representation, and need to be watched out for. Morphology Kernels
  often use these special numbers as neighbourhood masks.

  The special property that two NaN's are never equal, even if they are from
  the same variable allows you to test if a value is special NaN value.

  The macros are thus is only true if the value given is NaN.
*/

typedef struct _BlobInfo BlobInfo;

typedef struct _ExceptionInfo ExceptionInfo;

typedef struct _Image Image;

typedef struct _ImageInfo ImageInfo;


#endif
