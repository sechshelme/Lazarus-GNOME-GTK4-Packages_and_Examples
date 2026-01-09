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

  MagickCore image segment methods.
*/
#ifndef MAGICKCORE_SEGMENT_H
#define MAGICKCORE_SEGMENT_H


extern  MagickBooleanType
  GetImageDynamicThreshold(const Image *,const double,const double,
    MagickPixelPacket *,ExceptionInfo *);
extern  MagickBooleanType
  SegmentImage(Image *,const ColorspaceType,const MagickBooleanType,
    const double,const double);

