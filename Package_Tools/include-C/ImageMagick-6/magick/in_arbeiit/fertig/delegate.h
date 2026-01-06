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

  MagickCore delegates methods.
*/
#ifndef MAGICKCORE_DELEGATE_H
#define MAGICKCORE_DELEGATE_H


#include <stdarg.h>
#include "magick/semaphore.h"

typedef struct _DelegateInfo
{
  char
    *path,
    *decode,
    *encode,
    *commands;

  ssize_t
    mode;

  MagickBooleanType
    thread_support,
    spawn,
    stealth;

  struct _DelegateInfo
    *previous,
    *next;  /* deprecated, use GetDelegateInfoList() */

  size_t
    signature;

  SemaphoreInfo
    *semaphore;
} DelegateInfo;

extern  char
  *GetDelegateCommand(const ImageInfo *,Image *,const char *,const char *,
    ExceptionInfo *);
extern  char
  **GetDelegateList(const char *,size_t *,ExceptionInfo *);

extern  const char
  *GetDelegateCommands(const DelegateInfo *);

extern  const DelegateInfo
  *GetDelegateInfo(const char *,const char *,ExceptionInfo *exception);
extern  const DelegateInfo
  **GetDelegateInfoList(const char *,size_t *,ExceptionInfo *);

extern  int
  ExternalDelegateCommand(const MagickBooleanType,const MagickBooleanType,
    const char *,char *,ExceptionInfo *);

extern  ssize_t
  GetDelegateMode(const DelegateInfo *);

extern  MagickBooleanType
  DelegateComponentGenesis(void);
extern  MagickBooleanType
  GetDelegateThreadSupport(const DelegateInfo *);
extern  MagickBooleanType
  InvokeDelegate(ImageInfo *,Image *,const char *,const char *,ExceptionInfo *);
extern  MagickBooleanType
  ListDelegateInfo(FILE *,ExceptionInfo *);

extern  void
  DelegateComponentTerminus(void);


