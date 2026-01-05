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

  MagickWand property, options, and profile  methods.
*/

#ifndef MAGICKWAND_MAGICK_PROPERTY_H
#define MAGICKWAND_MAGICK_PROPERTY_H


extern  char
  *MagickGetFilename(const MagickWand *);
extern  char
  *MagickGetFormat(MagickWand *);
extern  char
  *MagickGetFont(MagickWand *);
extern  char
  *MagickGetHomeURL(void);
extern  char
  *MagickGetImageArtifact(MagickWand *,const char *);
extern  char
  **MagickGetImageArtifacts(MagickWand *,const char *,size_t *);
extern  char
  **MagickGetImageProfiles(MagickWand *,const char *,size_t *);
extern  char
  *MagickGetImageProperty(MagickWand *,const char *);
extern  char
  **MagickGetImageProperties(MagickWand *,const char *,size_t *);
extern  char
  *MagickGetOption(MagickWand *,const char *);
extern  char
  **MagickGetOptions(MagickWand *,const char *,size_t *);
extern  char
  *MagickQueryConfigureOption(const char *);
extern  char
  **MagickQueryConfigureOptions(const char *,size_t *);
extern  char
  **MagickQueryFonts(const char *,size_t *);
extern  char
  **MagickQueryFormats(const char *,size_t *);

extern  ColorspaceType
  MagickGetColorspace(MagickWand *);

extern  CompressionType
  MagickGetCompression(MagickWand *);

extern  const char
  *MagickGetCopyright(void);
extern  const char
  *MagickGetPackageName(void);
extern  const char
  *MagickGetQuantumDepth(size_t *);
extern  const char
  *MagickGetQuantumRange(size_t *);
extern  const char
  *MagickGetReleaseDate(void);
extern  const char
  *MagickGetVersion(size_t *);

extern  double
  MagickGetPointsize(MagickWand *);
extern  double
  *MagickGetSamplingFactors(MagickWand *,size_t *);
extern  double
  *MagickQueryFontMetrics(MagickWand *,const DrawingWand *,const char *);
extern  double
  *MagickQueryMultilineFontMetrics(MagickWand *,const DrawingWand *,    const char *);

extern  GravityType
  MagickGetGravity(MagickWand *);

extern  ImageType
  MagickGetType(MagickWand *);

extern  InterlaceType
  MagickGetInterlaceScheme(MagickWand *);

extern  InterpolatePixelMethod
  MagickGetInterpolateMethod(MagickWand *);

extern  OrientationType
  MagickGetOrientation(MagickWand *);

extern  MagickBooleanType
  MagickDeleteImageArtifact(MagickWand *,const char *);
extern  MagickBooleanType
  MagickDeleteImageProperty(MagickWand *,const char *);
extern  MagickBooleanType
  MagickDeleteOption(MagickWand *,const char *);
extern  MagickBooleanType
  MagickGetAntialias(const MagickWand *);
extern  MagickBooleanType
  MagickGetPage(const MagickWand *,size_t *,size_t *,ssize_t *,ssize_t *);
extern  MagickBooleanType
  MagickGetResolution(const MagickWand *,double *,double *);
extern  MagickBooleanType
  MagickGetSize(const MagickWand *,size_t *,size_t *);
extern  MagickBooleanType
  MagickGetSizeOffset(const MagickWand *,ssize_t *);
extern  MagickBooleanType
  MagickProfileImage(MagickWand *,const char *,const void *,const size_t);
extern  MagickBooleanType
  MagickSetAntialias(MagickWand *,const MagickBooleanType);
extern  MagickBooleanType
  MagickSetBackgroundColor(MagickWand *,const PixelWand *);
extern  MagickBooleanType
  MagickSetColorspace(MagickWand *,const ColorspaceType);
extern  MagickBooleanType
  MagickSetCompression(MagickWand *,const CompressionType);
extern  MagickBooleanType
  MagickSetCompressionQuality(MagickWand *,const size_t);
extern  MagickBooleanType
  MagickSetDepth(MagickWand *,const size_t);
extern  MagickBooleanType
  MagickSetExtract(MagickWand *,const char *);
extern  MagickBooleanType
  MagickSetFilename(MagickWand *,const char *);
extern  MagickBooleanType
  MagickSetFormat(MagickWand *,const char *);
extern  MagickBooleanType
  MagickSetFont(MagickWand *,const char *);
extern  MagickBooleanType
  MagickSetGravity(MagickWand *,const GravityType);
extern  MagickBooleanType
  MagickSetImageArtifact(MagickWand *,const char *,const char *);
extern  MagickBooleanType
  MagickSetImageProfile(MagickWand *,const char *,const void *,const size_t);
extern  MagickBooleanType
  MagickSetImageProperty(MagickWand *,const char *,const char *);
extern  MagickBooleanType
  MagickSetInterlaceScheme(MagickWand *,const InterlaceType);
extern  MagickBooleanType
  MagickSetInterpolateMethod(MagickWand *,const InterpolatePixelMethod);
extern  MagickBooleanType
  MagickSetOption(MagickWand *,const char *,const char *);
extern  MagickBooleanType
  MagickSetOrientation(MagickWand *,const OrientationType);
extern  MagickBooleanType
  MagickSetPage(MagickWand *,const size_t,const size_t,const ssize_t,    const ssize_t);
extern  MagickBooleanType
  MagickSetPassphrase(MagickWand *,const char *);
extern  MagickBooleanType
  MagickSetPointsize(MagickWand *,const double);
extern  MagickBooleanType
  MagickSetResolution(MagickWand *,const double,const double);
extern  MagickBooleanType
  MagickSetResourceLimit(const ResourceType type,const MagickSizeType limit);
extern  MagickBooleanType
  MagickSetSamplingFactors(MagickWand *,const size_t,const double *);
extern  MagickBooleanType
  MagickSetSecurityPolicy(MagickWand *,const char *);
extern  MagickBooleanType
  MagickSetSize(MagickWand *,const size_t,const size_t);
extern  MagickBooleanType
  MagickSetSizeOffset(MagickWand *,const size_t,const size_t,const ssize_t);
extern  MagickBooleanType
  MagickSetType(MagickWand *,const ImageType);

extern  MagickProgressMonitor
  MagickSetProgressMonitor(MagickWand *,const MagickProgressMonitor,void *);

extern  MagickSizeType
  MagickGetResource(const ResourceType);
extern  MagickSizeType
  MagickGetResourceLimit(const ResourceType);

extern  PixelWand
  *MagickGetBackgroundColor(MagickWand *);

extern  OrientationType
  MagickGetOrientationType(MagickWand *);

extern  size_t
  MagickGetCompressionQuality(MagickWand *);

extern  unsigned char
  *MagickGetImageProfile(MagickWand *,const char *,size_t *);
extern  unsigned char
  *MagickRemoveImageProfile(MagickWand *,const char *,size_t *);


