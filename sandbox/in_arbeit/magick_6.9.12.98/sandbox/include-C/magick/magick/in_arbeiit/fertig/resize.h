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

  MagickCore image resize methods.
*/
#ifndef MAGICKCORE_RESIZE_H
#define MAGICKCORE_RESIZE_H


typedef struct _ResizeFilter
  ResizeFilter;

extern  Image
  *AdaptiveResizeImage(const Image *,const size_t,const size_t,ExceptionInfo *);
extern  Image
  *InterpolativeResizeImage(const Image *,const size_t,const size_t,
    const InterpolatePixelMethod,ExceptionInfo *);
extern  Image
  *LiquidRescaleImage(const Image *,const size_t,const size_t,const double,
    const double,ExceptionInfo *);
extern  Image
  *MagnifyImage(const Image *,ExceptionInfo *);
extern  Image
  *MinifyImage(const Image *,ExceptionInfo *);
extern  Image
  *ResampleImage(const Image *,const double,const double,const FilterTypes,
    const double,ExceptionInfo *);
extern  Image
  *ResizeImage(const Image *,const size_t,const size_t,const FilterTypes,
    const double,ExceptionInfo *);
extern  Image
  *SampleImage(const Image *,const size_t,const size_t,ExceptionInfo *);
extern  Image
  *ScaleImage(const Image *,const size_t,const size_t,ExceptionInfo *);
extern  Image
  *ThumbnailImage(const Image *,const size_t,const size_t,ExceptionInfo *);


