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

  MagickCore private graphic gems methods.
*/
#ifndef MAGICKCORE_GEM_H
#define MAGICKCORE_GEM_H

#include "magick/random_.h"
#include "magick/visual-effects.h"


extern  double
  ExpandAffine(const AffineMatrix *);
extern  double
  GenerateDifferentialNoise(RandomInfo *,const Quantum,const NoiseType,
    const MagickRealType);

extern  size_t
  GetOptimalKernelWidth(const double,const double);
extern  size_t
  GetOptimalKernelWidth1D(const double,const double);
extern  size_t
  GetOptimalKernelWidth2D(const double,const double);

extern  void
  ConvertHCLToRGB(const double,const double,const double,Quantum *,Quantum *,
    Quantum *);
extern  void
  ConvertHCLpToRGB(const double,const double,const double,Quantum *,Quantum *,
    Quantum *);
extern  void
  ConvertHSBToRGB(const double,const double,const double,Quantum *,Quantum *,
    Quantum *);
extern  void
  ConvertHSIToRGB(const double,const double,const double,Quantum *,Quantum *,
    Quantum *);
extern  void
  ConvertHSLToRGB(const double,const double,const double,Quantum *,Quantum *,
    Quantum *);
extern  void
  ConvertHSVToRGB(const double,const double,const double,Quantum *,Quantum *,
    Quantum *);
extern  void
  ConvertHWBToRGB(const double,const double,const double,Quantum *,Quantum *,
    Quantum *);
extern  void
  ConvertLCHabToRGB(const double,const double,const double,Quantum *,Quantum *,
    Quantum *);
extern  void
  ConvertLCHuvToRGB(const double,const double,const double,Quantum *,Quantum *,
    Quantum *);
extern  void
  ConvertRGBToHCL(const Quantum,const Quantum,const Quantum,double *,double *,
    double *);
extern  void
  ConvertRGBToHCLp(const Quantum,const Quantum,const Quantum,double *,double *,
    double *);
extern  void
  ConvertRGBToHSB(const Quantum,const Quantum,const Quantum,double *,double *,
    double *);
extern  void
  ConvertRGBToHSI(const Quantum,const Quantum,const Quantum,double *,double *,
    double *);
extern  void
  ConvertRGBToHSL(const Quantum,const Quantum,const Quantum,double *,double *,
    double *);
extern  void
  ConvertRGBToHSV(const Quantum,const Quantum,const Quantum,double *,double *,
    double *);
extern  void
  ConvertRGBToHWB(const Quantum,const Quantum,const Quantum,double *,double *,
    double *);
extern  void
  ConvertRGBToLCHab(const Quantum,const Quantum,const Quantum,double *,double *,
    double *);
extern  void
  ConvertRGBToLCHuv(const Quantum,const Quantum,const Quantum,double *,double *,
    double *);


#endif
