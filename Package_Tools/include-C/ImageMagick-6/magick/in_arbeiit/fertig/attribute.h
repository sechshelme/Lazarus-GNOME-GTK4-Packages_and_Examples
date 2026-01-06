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

  MagickCore methods to set or get image attributes.
*/
#ifndef MAGICKCORE_ATTRIBUTE_H
#define MAGICKCORE_ATTRIBUTE_H

#include "magick/image.h"
#include "magick/exception.h"


extern  ImageType
  GetImageType(const Image *,ExceptionInfo *);
extern  ImageType
  IdentifyImageGray(const Image *,ExceptionInfo *);
extern  ImageType
  IdentifyImageType(const Image *,ExceptionInfo *);

extern  MagickBooleanType
  IdentifyImageMonochrome(const Image *,ExceptionInfo *);
extern  MagickBooleanType
  IsGrayImage(const Image *,ExceptionInfo *);
extern  MagickBooleanType
  IsMonochromeImage(const Image *,ExceptionInfo *);
extern  MagickBooleanType
  IsOpaqueImage(const Image *,ExceptionInfo *);
extern  MagickBooleanType
  SetImageChannelDepth(Image *,const ChannelType,const size_t);
extern  MagickBooleanType
  SetImageDepth(Image *,const size_t);
extern  MagickBooleanType
  SetImageType(Image *,const ImageType);

extern  RectangleInfo
  GetImageBoundingBox(const Image *,ExceptionInfo *exception);

extern  size_t
  GetImageChannelDepth(const Image *,const ChannelType,ExceptionInfo *);
extern  size_t
  GetImageDepth(const Image *,ExceptionInfo *);
extern  size_t
  GetImageQuantumDepth(const Image *,const MagickBooleanType);


#endif
