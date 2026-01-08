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

  MagickCore magick methods.
*/
#ifndef MAGICKCORE_MAGICK_H
#define MAGICKCORE_MAGICK_H


#include <stdarg.h>
#include "magick/semaphore.h"


typedef enum
{
  UndefinedFormatType,
  ImplicitFormatType,
  ExplicitFormatType
} MagickFormatType;

typedef enum
{
  NoThreadSupport = 0x0000,
  DecoderThreadSupport = 0x0001,
  EncoderThreadSupport = 0x0002
} MagickThreadSupport;

typedef Image
  (*DecodeImageHandler)(const ImageInfo *,ExceptionInfo *);

// xxxxxxxxxx
typedef MagickBooleanType
  (*EncodeImageHandler)(const ImageInfo *,Image *);

// xxxxxxxxxx
typedef MagickBooleanType
 (* IsImageFormatHandler)(const unsigned char *,const size_t);

typedef struct _MagickInfo
{
  char
    *name,
    *description,
    *version,
    *note,
    *magick_module;

  ImageInfo
    *image_info;

  DecodeImageHandler
    *decoder;

  EncodeImageHandler
    *encoder;

  IsImageFormatHandler
    *magick;

  void
    *client_data;

  MagickBooleanType
    adjoin,
    raw,
    endian_support,
    blob_support,
    seekable_stream;

  MagickFormatType
    format_type;

  MagickStatusType
    thread_support;

  MagickBooleanType
    stealth;

  struct _MagickInfo
    *previous,
    *next;  /* deprecated, use GetMagickInfoList() */

  size_t
    signature;

  char
    *mime_type;

  SemaphoreInfo
    *semaphore;
} MagickInfo;

extern  char
  **GetMagickList(const char *,size_t *,ExceptionInfo *);

extern  const char
  *GetMagickDescription(const MagickInfo *);
extern  const char
  *GetMagickMimeType(const MagickInfo *);

extern  DecodeImageHandler
  *GetImageDecoder(const MagickInfo *) ;

extern  EncodeImageHandler
  *GetImageEncoder(const MagickInfo *) ;

extern  int
  GetMagickPrecision(void);
extern  int
  SetMagickPrecision(const int);

extern  MagickBooleanType
  GetImageMagick(const unsigned char *,const size_t,char *);
extern  MagickBooleanType
  GetMagickAdjoin(const MagickInfo *) ;
extern  MagickBooleanType
  GetMagickBlobSupport(const MagickInfo *) ;
extern  MagickBooleanType
  GetMagickEndianSupport(const MagickInfo *);
extern  MagickBooleanType
  GetMagickRawSupport(const MagickInfo *);
extern  MagickBooleanType
  GetMagickSeekableStream(const MagickInfo *);
extern  MagickBooleanType
  IsMagickCoreInstantiated(void) ;
extern  MagickBooleanType
  MagickComponentGenesis(void);
extern  MagickBooleanType
  UnregisterMagickInfo(const char *);

extern const  MagickInfo
  *GetMagickInfo(const char *,ExceptionInfo *);
extern const  MagickInfo
  **GetMagickInfoList(const char *,size_t *,ExceptionInfo *);

extern  MagickInfo
  *RegisterMagickInfo(MagickInfo *);
extern  MagickInfo
  *SetMagickInfo(const char *);

extern  MagickStatusType
  GetMagickThreadSupport(const MagickInfo *);

extern  void
  MagickComponentTerminus(void);
extern  void
  MagickCoreGenesis(const char *,const MagickBooleanType);
extern  void
  MagickCoreTerminus(void);


#endif
