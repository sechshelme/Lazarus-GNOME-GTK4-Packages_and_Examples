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

  MagickCore image profile methods.
*/
#ifndef MAGICKCORE_PROFILE_H
#define MAGICKCORE_PROFILE_H

#include "magick/string_.h"


typedef struct _ProfileInfo
{
  char
    *name;

  size_t
    length;

  unsigned char
    *info;

  size_t
    signature;
} ProfileInfo;

typedef enum
{
  UndefinedIntent,
  SaturationIntent,
  PerceptualIntent,
  AbsoluteIntent,
  RelativeIntent
} RenderingIntent;

extern  char
  *GetNextImageProfile(const Image *);

extern  const StringInfo
  *GetImageProfile(const Image *,const char *);

extern  MagickBooleanType
  CloneImageProfiles(Image *,const Image *);
extern  MagickBooleanType
  DeleteImageProfile(Image *,const char *);
extern  MagickBooleanType
  ProfileImage(Image *,const char *,const void *,const size_t,
    const MagickBooleanType);
extern  MagickBooleanType
  SetImageProfile(Image *,const char *,const StringInfo *);
extern  MagickBooleanType
  SyncImageProfiles(Image *);

extern  StringInfo
  *RemoveImageProfile(Image *,const char *);

extern  void
  DestroyImageProfiles(Image *);
extern  void
  ResetImageProfileIterator(const Image *);


