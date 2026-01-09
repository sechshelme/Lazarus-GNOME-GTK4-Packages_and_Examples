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

  MagickCore locale methods.
*/
#ifndef MAGICKCORE_LOCALE_H
#define MAGICKCORE_LOCALE_H

#include "magick/hashmap.h"


typedef struct _LocaleInfo
{
  char
    *path,
    *tag,
    *message;

  MagickBooleanType
    stealth;

  struct _LocaleInfo
    *previous,
    *next;  /* deprecated, use GetLocaleInfoList() */

  size_t
    signature;
} LocaleInfo;

extern  char
  **GetLocaleList(const char *,size_t *,ExceptionInfo *);

extern  const char
  *GetLocaleMessage(const char *);

extern  const LocaleInfo
  *GetLocaleInfo_(const char *,ExceptionInfo *);
extern  const LocaleInfo
  **GetLocaleInfoList(const char *,size_t *,ExceptionInfo *);

extern  double
  InterpretLocaleValue(const char *magick_restrict,char **magick_restrict);

extern  int
  LocaleCompare(const char *,const char *) ;
extern  int
  LocaleLowercase(const int);
extern  int
  LocaleNCompare(const char *,const char *,const size_t);
extern  int
  LocaleUppercase(const int);

extern  LinkedListInfo
  *DestroyLocaleOptions(LinkedListInfo *);
extern  LinkedListInfo
  *GetLocaleOptions(const char *,ExceptionInfo *);

extern  MagickBooleanType
  ListLocaleInfo(FILE *,ExceptionInfo *);
extern  MagickBooleanType
  LocaleComponentGenesis(void);

extern  ssize_t
  FormatLocaleFile(FILE *,const char *magick_restrict,...);
extern  ssize_t
  FormatLocaleFileList(FILE *,const char *magick_restrict,va_list);
extern  ssize_t
  FormatLocaleString(char *magick_restrict,const size_t,
    const char *magick_restrict,...);
extern  ssize_t
  FormatLocaleStringList(char *magick_restrict,const size_t,
    const char *magick_restrict,
    va_list);

extern  void
  LocaleComponentTerminus(void);
extern  void
  LocaleLower(char *);
extern  void
  LocaleUpper(char *);


