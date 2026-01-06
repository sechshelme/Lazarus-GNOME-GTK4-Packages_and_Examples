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

  MagickCore configure methods.
*/
#ifndef MAGICKCORE_CONFIGURE_H
#define MAGICKCORE_CONFIGURE_H

#include "magick/hashmap.h"


typedef struct _ConfigureInfo
{
  char
    *path,
    *name,
    *value;
                                                                                
  MagickBooleanType
    exempt,
    stealth;
                                                                                
  struct _ConfigureInfo
    *previous,
    *next;  /* deprecated, use GetConfigureInfoList() */

  size_t
    signature;
} ConfigureInfo;

extern  char
  **GetConfigureList(const char *,size_t *,ExceptionInfo *);
extern  char
  *GetConfigureOption(const char *);

extern  const char
  *GetConfigureValue(const ConfigureInfo *);

extern  const ConfigureInfo
  *GetConfigureInfo(const char *,ExceptionInfo *);
extern  const ConfigureInfo
  **GetConfigureInfoList(const char *,size_t *,ExceptionInfo *);

extern  LinkedListInfo
  *DestroyConfigureOptions(LinkedListInfo *);
extern  LinkedListInfo
  *GetConfigurePaths(const char *,ExceptionInfo *);
extern  LinkedListInfo
  *GetConfigureOptions(const char *,ExceptionInfo *);

extern  MagickBooleanType
  ConfigureComponentGenesis(void);
extern  MagickBooleanType
  ListConfigureInfo(FILE *,ExceptionInfo *);

extern  void
  ConfigureComponentTerminus(void);


