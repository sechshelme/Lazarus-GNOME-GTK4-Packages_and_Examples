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

  MagickCore image threshold methods.
*/
#ifndef MAGICKCORE_THRESHOLD_H
#define MAGICKCORE_THRESHOLD_H

typedef enum
{
  UndefinedThresholdMethod,
  KapurThresholdMethod,
  OTSUThresholdMethod,
  TriangleThresholdMethod
} AutoThresholdMethod;

typedef struct _ThresholdMap
  ThresholdMap;

extern  Image
  *AdaptiveThresholdImage(const Image *,const size_t,const size_t,const ssize_t,
    ExceptionInfo *);

extern  ThresholdMap
  *DestroyThresholdMap(ThresholdMap *);
extern  ThresholdMap
  *GetThresholdMap(const char *,ExceptionInfo *);

extern  MagickBooleanType
  AutoThresholdImage(Image *,const AutoThresholdMethod,ExceptionInfo *);
extern  MagickBooleanType
  BilevelImage(Image *,const double);
extern  MagickBooleanType
  BilevelImageChannel(Image *,const ChannelType,const double);
extern  MagickBooleanType
  BlackThresholdImage(Image *,const char *);
extern  MagickBooleanType
  BlackThresholdImageChannel(Image *,const ChannelType,const char *,
    ExceptionInfo *);
extern  MagickBooleanType
  ClampImage(Image *);
extern  MagickBooleanType
  ClampImageChannel(Image *,const ChannelType);
extern  MagickBooleanType
  ListThresholdMaps(FILE *,ExceptionInfo *);
extern  MagickBooleanType
  OrderedDitherImage(Image *);  /* deprecated */
extern  MagickBooleanType
  OrderedDitherImageChannel(Image *,const ChannelType,ExceptionInfo *);
extern  MagickBooleanType
  OrderedPosterizeImage(Image *,const char *,ExceptionInfo *);
extern  MagickBooleanType
  OrderedPosterizeImageChannel(Image *,const ChannelType,const char *,
    ExceptionInfo *);
extern  MagickBooleanType
  PerceptibleImage(Image *,const double);
extern  MagickBooleanType
  PerceptibleImageChannel(Image *,const ChannelType,const double);
extern  MagickBooleanType
  RandomThresholdImage(Image *,const char *,ExceptionInfo *);
extern  MagickBooleanType
  RandomThresholdImageChannel(Image *,const ChannelType,const char *,
    ExceptionInfo *);
extern  MagickBooleanType
  WhiteThresholdImage(Image *,const char *);
extern  MagickBooleanType
  WhiteThresholdImageChannel(Image *,const ChannelType,const char *,
    ExceptionInfo *);


