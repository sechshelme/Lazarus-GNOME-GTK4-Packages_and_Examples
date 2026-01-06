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

  MagickCore image visual effects methods.
*/
#ifndef MAGICKCORE_VISUAL_EFFECTS_H
#define MAGICKCORE_VISUAL_EFFECTS_H

#include "magick/draw.h"


typedef enum
{
  UndefinedNoise,
  UniformNoise,
  GaussianNoise,
  MultiplicativeGaussianNoise,
  ImpulseNoise,
  LaplacianNoise,
  PoissonNoise,
  RandomNoise
} NoiseType;

extern  Image
  *AddNoiseImage(const Image *,const NoiseType,ExceptionInfo *);
extern  Image
  *AddNoiseImageChannel(const Image *,const ChannelType,const NoiseType,
    ExceptionInfo *);
extern  Image
  *BlueShiftImage(const Image *,const double,ExceptionInfo *);
extern  Image
  *CharcoalImage(const Image *,const double,const double,ExceptionInfo *);
extern  Image
  *ColorizeImage(const Image *,const char *,const PixelPacket,ExceptionInfo *);
extern  Image
  *ColorMatrixImage(const Image *,const KernelInfo *kernel,ExceptionInfo *);
extern  Image
  *ImplodeImage(const Image *,const double,ExceptionInfo *);
extern  Image
  *MorphImages(const Image *,const size_t,ExceptionInfo *);
extern  Image
  *PolaroidImage(const Image *,const DrawInfo *,const double,ExceptionInfo *);
extern  Image
  *SepiaToneImage(const Image *,const double,ExceptionInfo *);
extern  Image
  *ShadowImage(const Image *,const double,const double,const ssize_t,
    const ssize_t,ExceptionInfo *);
extern  Image
  *SketchImage(const Image *,const double,const double,const double,
    ExceptionInfo *);
extern  Image
  *SteganoImage(const Image *,const Image *,ExceptionInfo *);
extern  Image
  *StereoImage(const Image *,const Image *,ExceptionInfo *);
extern  Image
  *StereoAnaglyphImage(const Image *,const Image *,const ssize_t,const ssize_t,
     ExceptionInfo *);
extern  Image
  *SwirlImage(const Image *,double,ExceptionInfo *);
extern  Image
  *TintImage(const Image *,const char *,const PixelPacket,ExceptionInfo *);
extern  Image
  *VignetteImage(const Image *,const double,const double,const ssize_t,
    const ssize_t,ExceptionInfo *);
extern  Image
  *WaveImage(const Image *,const double,const double,ExceptionInfo *);
extern  Image
  *WaveletDenoiseImage(const Image *,const double,const double,ExceptionInfo *);

extern  MagickBooleanType
  PlasmaImage(Image *,const SegmentInfo *,size_t,size_t);
extern  MagickBooleanType
  SolarizeImage(Image *,const double);
extern  MagickBooleanType
  SolarizeImageChannel(Image *,const ChannelType,const double,ExceptionInfo *);


