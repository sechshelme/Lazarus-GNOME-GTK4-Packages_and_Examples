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

  MagickCore property methods.
*/
#ifndef MAGICKCORE_PROPERTY_H
#define MAGICKCORE_PROPERTY_H

extern  char
  *GetNextImageProperty(const Image *);
extern  char
  *InterpretImageProperties(const ImageInfo *,Image *,const char *);
extern  char
  *RemoveImageProperty(Image *,const char *);

extern  const char
  *GetImageProperty(const Image *,const char *);
extern  const char
  *GetMagickProperty(const ImageInfo *,Image *,const char *);

extern  MagickBooleanType
  CloneImageProperties(Image *,const Image *);
extern  MagickBooleanType
  DefineImageProperty(Image *,const char *);
extern  MagickBooleanType
  DeleteImageProperty(Image *,const char *);
extern  MagickBooleanType
  FormatImageProperty(Image *,const char *,const char *,...);
extern  MagickBooleanType
  SetImageProperty(Image *,const char *,const char *);

extern  void
  DestroyImageProperties(Image *);
extern  void
  ResetImagePropertyIterator(const Image *);

