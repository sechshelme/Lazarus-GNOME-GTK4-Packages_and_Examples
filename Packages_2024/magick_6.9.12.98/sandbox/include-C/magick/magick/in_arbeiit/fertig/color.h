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

  MagickCore image color methods.
*/
#ifndef MAGICKCORE_COLOR_H
#define MAGICKCORE_COLOR_H

#include "magick/pixel.h"
#include "magick/exception.h"


typedef enum
{
  UndefinedCompliance,
  NoCompliance = 0x0000,
  CSSCompliance = 0x0001,
  SVGCompliance = 0x0001,
  X11Compliance = 0x0002,
  XPMCompliance = 0x0004,
  MVGCompliance = 0x0008,
  AllCompliance = 0x7fffffff
} ComplianceType;

typedef struct _ColorInfo
{
  char
    *path,
    *name;

  ComplianceType
    compliance;

  MagickPixelPacket
    color;

  MagickBooleanType
    exempt,
    stealth;

  struct _ColorInfo
    *previous,
    *next;  /* deprecated, use GetColorInfoList() */

  size_t
    signature;
} ColorInfo;

typedef struct _ErrorInfo
{
  double
    mean_error_per_pixel,
    normalized_mean_error,
    normalized_maximum_error;
} ErrorInfo;

extern  char
  **GetColorList(const char *,size_t *,ExceptionInfo *);

extern  const ColorInfo
  *GetColorInfo(const char *,ExceptionInfo *);
extern  const ColorInfo
  **GetColorInfoList(const char *,size_t *,ExceptionInfo *);

extern  MagickBooleanType
  ColorComponentGenesis(void);
extern  MagickBooleanType
  IsColorSimilar(const Image *,const PixelPacket *,const PixelPacket *);
extern  MagickBooleanType
  IsImageSimilar(const Image *,const Image *,ssize_t *x,ssize_t *y,
    ExceptionInfo *);
extern  MagickBooleanType
  IsMagickColorSimilar(const MagickPixelPacket *,const MagickPixelPacket *);
extern  MagickBooleanType
  IsOpacitySimilar(const Image *,const PixelPacket *,const PixelPacket *);
extern  MagickBooleanType
  ListColorInfo(FILE *,ExceptionInfo *);
extern  MagickBooleanType
  QueryColorCompliance(const char *,const ComplianceType,PixelPacket *,
    ExceptionInfo *);
extern  MagickBooleanType
  QueryColorDatabase(const char *,PixelPacket *,ExceptionInfo *);
extern  MagickBooleanType
  QueryColorname(const Image *,const PixelPacket *,const ComplianceType,char *,
    ExceptionInfo *);
extern  MagickBooleanType
  QueryMagickColorCompliance(const char *,const ComplianceType,
    MagickPixelPacket *,ExceptionInfo *);
extern  MagickBooleanType
  QueryMagickColor(const char *,MagickPixelPacket *,ExceptionInfo *);
extern  MagickBooleanType
  QueryMagickColorname(const Image *,const MagickPixelPacket *,
    const ComplianceType,char *,ExceptionInfo *);

extern  void
  ColorComponentTerminus(void);
extern  void
  ConcatenateColorComponent(const MagickPixelPacket *,const ChannelType,
    const ComplianceType,char *);
extern  void
  GetColorTuple(const MagickPixelPacket *,const MagickBooleanType,char *);

#endif
