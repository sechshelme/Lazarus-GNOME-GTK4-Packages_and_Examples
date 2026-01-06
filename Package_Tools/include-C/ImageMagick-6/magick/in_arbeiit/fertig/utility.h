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

  MagickCore utility methods.
*/
#ifndef MAGICKCORE_UTILITY_H
#define MAGICKCORE_UTILITY_H

typedef enum
{
  UndefinedPath,
  MagickPath,
  RootPath,
  HeadPath,
  TailPath,
  BasePath,
  ExtensionPath,
  SubimagePath,
  CanonicalPath,
  SubcanonicalPath,
  BasePathSansCompressExtension
} PathType;

extern  char
  *Base64Encode(const unsigned char *,const size_t,size_t *);
extern  char
  **GetPathComponents(const char *,size_t *);
extern  char
  **ListFiles(const char *,const char *,size_t *);

extern  MagickBooleanType
  AcquireUniqueFilename(char *);
extern  char
  AcquireUniqueSymbolicLink(const char *,char *);
extern  char
  ExpandFilenames(int *,char ***);
extern  char
  GetPathAttributes(const char *,void *);
extern  char
  GetExecutionPath(char *,const size_t);
extern  char
  IsPathAccessible(const char *);

extern  size_t
  MultilineCensus(const char *) ;

extern  ssize_t
  GetMagickPageSize(void);

extern  unsigned char
  *Base64Decode(const char *, size_t *);

extern  void
  AppendImageFormat(const char *,char *);
extern  void
  ChopPathComponents(char *,const size_t);
extern  void
  ExpandFilename(char *);
extern  void
  GetPathComponent(const char *,PathType,char *);
extern  void
  MagickDelay(const MagickSizeType);

