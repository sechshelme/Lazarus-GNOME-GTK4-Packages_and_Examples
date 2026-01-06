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

  MagickCore image effects methods.
*/
#ifndef MAGICKCORE_EFFECT_H
#define MAGICKCORE_EFFECT_H

#include "magick/morphology.h"


typedef enum
{
  UndefinedPreview,
  RotatePreview,
  ShearPreview,
  RollPreview,
  HuePreview,
  SaturationPreview,
  BrightnessPreview,
  GammaPreview,
  SpiffPreview,
  DullPreview,
  GrayscalePreview,
  QuantizePreview,
  DespecklePreview,
  ReduceNoisePreview,
  AddNoisePreview,
  SharpenPreview,
  BlurPreview,
  ThresholdPreview,
  EdgeDetectPreview,
  SpreadPreview,
  SolarizePreview,
  ShadePreview,
  RaisePreview,
  SegmentPreview,
  SwirlPreview,
  ImplodePreview,
  WavePreview,
  OilPaintPreview,
  CharcoalDrawingPreview,
  JPEGPreview
} PreviewType;

extern  Image
  *AdaptiveBlurImage(const Image *,const double,const double,ExceptionInfo *);
extern  Image
  *AdaptiveBlurImageChannel(const Image *,const ChannelType,const double,
    const double,ExceptionInfo *);
extern  Image
  *AdaptiveSharpenImage(const Image *,const double,const double,
     ExceptionInfo *);
extern  Image
  *AdaptiveSharpenImageChannel(const Image *,const ChannelType,const double,
    const double,ExceptionInfo *);
extern  Image
  *BlurImage(const Image *,const double,const double,ExceptionInfo *);
extern  Image
  *BlurImageChannel(const Image *,const ChannelType,const double,const double,
    ExceptionInfo *);
extern  Image
  *ConvolveImage(const Image *,const size_t,const double *,ExceptionInfo *);
extern  Image
  *ConvolveImageChannel(const Image *,const ChannelType,const size_t,
    const double *,ExceptionInfo *);
extern  Image
  *DespeckleImage(const Image *,ExceptionInfo *);
extern  Image
  *EdgeImage(const Image *,const double,ExceptionInfo *);
extern  Image
  *EmbossImage(const Image *,const double,const double,ExceptionInfo *);
extern  Image
  *FilterImage(const Image *,const KernelInfo *,ExceptionInfo *);
extern  Image
  *FilterImageChannel(const Image *,const ChannelType,const KernelInfo *,
     ExceptionInfo *);
extern  Image
  *GaussianBlurImage(const Image *,const double,const double,ExceptionInfo *);
extern  Image
  *GaussianBlurImageChannel(const Image *,const ChannelType,const double,
    const double,ExceptionInfo *);
extern  Image
  *KuwaharaImage(const Image *,const double,const double,ExceptionInfo *);
extern  Image
  *KuwaharaImageChannel(const Image *,const ChannelType,const double,
    const double,ExceptionInfo *);
extern  Image
  *LocalContrastImage(const Image *,const double,const double,ExceptionInfo *);
extern  Image
  *MotionBlurImage(const Image *,const double,const double,const double,
    ExceptionInfo *);
extern  Image
  *MotionBlurImageChannel(const Image *,const ChannelType,const double,
    const double,const double,ExceptionInfo *);
extern  Image
  *PreviewImage(const Image *,const PreviewType,ExceptionInfo *);
extern  Image
  *RotationalBlurImage(const Image *,const double,ExceptionInfo *);
extern  Image
  *RotationalBlurImageChannel(const Image *,const ChannelType,const double,
    ExceptionInfo *);
extern  Image
  *SelectiveBlurImage(const Image *,const double,const double,const double,
    ExceptionInfo *);
extern  Image
  *SelectiveBlurImageChannel(const Image *,const ChannelType,const double,
    const double,const double,ExceptionInfo *);
extern  Image
  *ShadeImage(const Image *,const MagickBooleanType,const double,const double,
    ExceptionInfo *);
extern  Image
  *SharpenImage(const Image *,const double,const double,ExceptionInfo *);
extern  Image
  *SharpenImageChannel(const Image *,const ChannelType,const double,
    const double,ExceptionInfo *);
extern  Image
  *SpreadImage(const Image *,const double,ExceptionInfo *);
extern  Image
  *UnsharpMaskImage(const Image *,const double,const double,const double,
    const double,ExceptionInfo *);
extern  Image
  *UnsharpMaskImageChannel(const Image *,const ChannelType,const double,
    const double,const double,const double,ExceptionInfo *);


