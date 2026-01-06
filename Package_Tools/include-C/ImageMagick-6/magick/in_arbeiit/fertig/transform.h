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

  MagickCore image transform methods.
*/
#ifndef MAGICKCORE_TRANSFORM_H
#define MAGICKCORE_TRANSFORM_H

extern  Image
  *AutoOrientImage(const Image *,const OrientationType,ExceptionInfo *);
extern  Image
  *ChopImage(const Image *,const RectangleInfo *,ExceptionInfo *);
extern  Image
  *ConsolidateCMYKImages(const Image *,ExceptionInfo *);
extern  Image
  *CropImage(const Image *,const RectangleInfo *,ExceptionInfo *);
extern  Image
  *CropImageToTiles(const Image *,const char *, ExceptionInfo *);
extern  Image
  *ExcerptImage(const Image *,const RectangleInfo *,ExceptionInfo *);
extern  Image
  *ExtentImage(const Image *,const RectangleInfo *,ExceptionInfo *);
extern  Image
  *FlipImage(const Image *,ExceptionInfo *);
extern  Image
  *FlopImage(const Image *,ExceptionInfo *);
extern  Image
  *RollImage(const Image *,const ssize_t,const ssize_t,ExceptionInfo *);
extern  Image
  *ShaveImage(const Image *,const RectangleInfo *,ExceptionInfo *);
extern  Image
  *SpliceImage(const Image *,const RectangleInfo *,ExceptionInfo *);
extern  Image
  *TransposeImage(const Image *,ExceptionInfo *);
extern  Image
  *TransverseImage(const Image *,ExceptionInfo *);
extern  Image
  *TrimImage(const Image *,ExceptionInfo *);

extern  MagickBooleanType
  TransformImage(Image **,const char *,const char *);
extern  MagickBooleanType
  TransformImages(Image **,const char *,const char *);


