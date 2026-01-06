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

  MagickCore memory methods.
*/
#ifndef MAGICKCORE_MEMORY_H
#define MAGICKCORE_MEMORY_H

#include <errno.h>


typedef struct _MemoryInfo
  MemoryInfo;

typedef void
  *(*AcquireMemoryHandler)(size_t);
typedef void
  (*DestroyMemoryHandler)(void *);
typedef void
  *(*ResizeMemoryHandler)(void *,size_t);
typedef void
  *(*AcquireAlignedMemoryHandler)(const size_t,const size_t);
typedef void
  (*RelinquishAlignedMemoryHandler)(void *);

extern  MemoryInfo
  *AcquireVirtualMemory(const size_t,const size_t);
extern  MemoryInfo
  *RelinquishVirtualMemory(MemoryInfo *);

extern  size_t
  GetMaxMemoryRequest(void);

extern  void
  *AcquireAlignedMemory(const size_t,const size_t);
extern  void
  *AcquireMagickMemory(const size_t) ;
extern  void
  *AcquireCriticalMemory(const size_t);
extern  void
  *AcquireQuantumMemory(const size_t,const size_t);
extern  void
  *CopyMagickMemory(void *magick_restrict,const void *magick_restrict,    const size_t);
extern  void
  DestroyMagickMemory(void);
extern  void
  GetMagickMemoryMethods(AcquireMemoryHandler *,ResizeMemoryHandler *,    DestroyMemoryHandler *);
extern  void
  *GetVirtualMemoryBlob(const MemoryInfo *);
extern  void
  *RelinquishAlignedMemory(void *);
extern  void
  *RelinquishMagickMemory(void *);
extern  void
  *ResetMagickMemory(void *,int,const size_t);
extern  void
  *ResizeMagickMemory(void *,const size_t) ;
extern  void
  *ResizeQuantumMemory(void *,const size_t,const size_t) ;
extern  void
  SetMagickAlignedMemoryMethods(AcquireAlignedMemoryHandler,    RelinquishAlignedMemoryHandler);
extern  void
  SetMagickMemoryMethods(AcquireMemoryHandler,ResizeMemoryHandler,    DestroyMemoryHandler);

/*xxxxxxxxxxxxxxxx
static inline MagickBooleanType HeapOverflowSanityCheck(
  const size_t count,const size_t quantum)
{
  if ((count == 0) || (quantum == 0))
    return(MagickTrue);
  if (quantum != ((count*quantum)/count))
    {
      errno=ENOMEM;
      return(MagickTrue);
    }
  return(MagickFalse);
}

static inline MagickBooleanType HeapOverflowSanityCheckGetSize(
  const size_t count,const size_t quantum,size_t *const extent)
{
  size_t
    length;

  if ((count == 0) || (quantum == 0))
    return(MagickTrue);
  length=count*quantum;
  if (quantum != (length/count))
    {
      errno=ENOMEM;
      return(MagickTrue);
    }
  if (extent != (size_t *) NULL)
    *extent=length;
  return(MagickFalse);
}
*/

