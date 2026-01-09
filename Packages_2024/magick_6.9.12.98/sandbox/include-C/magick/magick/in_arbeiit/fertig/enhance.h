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

  MagickCore image enhance methods.
*/
#ifndef MAGICKCORE_ENHANCE_H
#define MAGICKCORE_ENHANCE_H

#include "magick/pixel.h"


extern  MagickBooleanType
  AutoGammaImage(Image *);
extern  MagickBooleanType
  AutoGammaImageChannel(Image *,const ChannelType);
extern  MagickBooleanType
  AutoLevelImage(Image *);
extern  MagickBooleanType
  AutoLevelImageChannel(Image *,const ChannelType);
extern  MagickBooleanType
  BrightnessContrastImage(Image *,const double,const double);
extern  MagickBooleanType
  BrightnessContrastImageChannel(Image *,const ChannelType,const double,
    const double);
extern  MagickBooleanType
  ClutImage(Image *,const Image *);
extern  MagickBooleanType
  ClutImageChannel(Image *,const ChannelType,const Image *);
extern  MagickBooleanType
  ColorDecisionListImage(Image *,const char *);
extern  MagickBooleanType
  ContrastImage(Image *,const MagickBooleanType);
extern  MagickBooleanType
  ContrastStretchImage(Image *,const char *);
extern  MagickBooleanType
  ContrastStretchImageChannel(Image *,const ChannelType,const double,
    const double);
extern  MagickBooleanType
  EqualizeImage(Image *image);
extern  MagickBooleanType
  EqualizeImageChannel(Image *image,const ChannelType);
extern  MagickBooleanType
  GammaImage(Image *,const char *);
extern  MagickBooleanType
  GammaImageChannel(Image *,const ChannelType,const double);
extern  MagickBooleanType
  GrayscaleImage(Image *,const PixelIntensityMethod);
extern  MagickBooleanType
  HaldClutImage(Image *,const Image *);
extern  MagickBooleanType
  HaldClutImageChannel(Image *,const ChannelType,const Image *);
extern  MagickBooleanType
  LevelImage(Image *,const char *);
extern  MagickBooleanType
  LevelImageChannel(Image *,const ChannelType,const double,const double,
    const double);
extern  MagickBooleanType
  LevelizeImage(Image *,const double,const double,const double);
extern  MagickBooleanType
  LevelizeImageChannel(Image *,const ChannelType,const double,const double,
    const double);
extern  MagickBooleanType
  LevelColorsImage(Image *,const MagickPixelPacket *,const MagickPixelPacket *,
    const MagickBooleanType);
extern  MagickBooleanType
  LevelColorsImageChannel(Image *,const ChannelType,const MagickPixelPacket *,
    const MagickPixelPacket *,const MagickBooleanType);
extern  MagickBooleanType
  LinearStretchImage(Image *,const double,const double);
extern  MagickBooleanType
  ModulateImage(Image *,const char *);
extern  MagickBooleanType
  NegateImage(Image *,const MagickBooleanType);
extern  MagickBooleanType
  NegateImageChannel(Image *,const ChannelType,const MagickBooleanType);
extern  MagickBooleanType
  NormalizeImage(Image *);
extern  MagickBooleanType
  NormalizeImageChannel(Image *,const ChannelType);
extern  MagickBooleanType
  SigmoidalContrastImage(Image *,const MagickBooleanType,const char *);
extern  MagickBooleanType
  SigmoidalContrastImageChannel(Image *,const ChannelType,
    const MagickBooleanType,const double,const double);

extern  Image
  *EnhanceImage(const Image *,ExceptionInfo *);


#endif
