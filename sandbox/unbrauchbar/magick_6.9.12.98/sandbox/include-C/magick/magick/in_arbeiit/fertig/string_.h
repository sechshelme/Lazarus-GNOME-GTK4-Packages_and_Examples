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

  MagickCore string methods.
*/
#ifndef MAGICKCORE_STRING_H_
#define MAGICKCORE_STRING_H_

#include <stdarg.h>
#include <time.h>
#include "magick/exception.h"


typedef struct _StringInfo
{
  char
    path[MaxTextExtent];

  unsigned char
    *datum;

  size_t
    length,
    signature;

  char
    *name;
} StringInfo;

extern  char
  *AcquireString(const char *);
extern  char
  *CloneString(char **,const char *);
extern  char
  *ConstantString(const char *);
extern  char
  *DestroyString(char *);
extern  char
  **DestroyStringList(char **);
extern  char
  *EscapeString(const char *,const char);
extern  char
  *FileToString(const char *,const size_t,ExceptionInfo *);
extern  char
  *GetEnvironmentValue(const char *);
extern  char
  *SanitizeString(const char *);
extern  char
  *StringInfoToHexString(const StringInfo *);
extern  char
  *StringInfoToString(const StringInfo *);
extern  char
  **StringToArgv(const char *,int *);
extern  char
  *StringToken(const char *,char **);
extern  char
  **StringToList(const char *);
extern  char
  **StringToStrings(const char *,size_t *);

extern  const char
  *GetStringInfoName(const StringInfo *);
extern  const char
  *GetStringInfoPath(const StringInfo *);

extern  double
  InterpretSiPrefixValue(const char *magick_restrict,char **magick_restrict);
extern  double
  *StringToArrayOfDoubles(const char *,ssize_t *, ExceptionInfo *);

extern  int
  CompareStringInfo(const StringInfo *,const StringInfo *);

extern  MagickBooleanType
  ConcatenateString(char **magick_restrict,const char *magick_restrict);
extern  MagickBooleanType
  IsStringTrue(const char *);
extern  MagickBooleanType
  IsStringNotFalse(const char *);
extern  MagickBooleanType
  SubstituteString(char **,const char *,const char *);

extern  size_t
  ConcatenateMagickString(char *magick_restrict,const char *magick_restrict,
    const size_t) ;
extern  size_t
  CopyMagickString(char *magick_restrict,const char *magick_restrict,
    const size_t) ;
extern  size_t
  GetStringInfoLength(const StringInfo *);

extern  ssize_t
  FormatMagickSize(const MagickSizeType,const MagickBooleanType,char *);

extern  StringInfo
  *AcquireStringInfo(const size_t);
extern  StringInfo
  *BlobToStringInfo(const void *,const size_t);
extern  StringInfo
  *CloneStringInfo(const StringInfo *);
extern  StringInfo
  *ConfigureFileToStringInfo(const char *);
extern  StringInfo
  *DestroyStringInfo(StringInfo *);
extern  StringInfo
  *FileToStringInfo(const char *,const size_t,ExceptionInfo *);
extern  StringInfo
  *SplitStringInfo(StringInfo *,const size_t);
extern  StringInfo
  *StringToStringInfo(const char *);

extern  unsigned char
  *GetStringInfoDatum(const StringInfo *);

extern  void
  ConcatenateStringInfo(StringInfo *,const StringInfo *);
extern  void
  PrintStringInfo(FILE *file,const char *,const StringInfo *);
extern  void
  ResetStringInfo(StringInfo *);
extern  void
  SetStringInfo(StringInfo *,const StringInfo *);
extern  void
  SetStringInfoDatum(StringInfo *,const unsigned char *);
extern  void
  SetStringInfoLength(StringInfo *,const size_t);
extern  void
  SetStringInfoName(StringInfo *,const char *);
extern  void
  SetStringInfoPath(StringInfo *,const char *);
extern  void
  StripString(char *);


#endif
