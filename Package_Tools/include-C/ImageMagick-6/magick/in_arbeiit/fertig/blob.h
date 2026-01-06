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

  MagickCore Binary Large OBjects methods.
*/
#ifndef MAGICKCORE_BLOB_H
#define MAGICKCORE_BLOB_H

#include "magick/image.h"
#include "magick/stream.h"


#define MagickMaxBufferExtent  81920
#define MagickMinBufferExtent  16384

typedef enum
{
  ReadMode,
  WriteMode,
  IOMode,
  PersistMode
} MapMode;

extern  FILE
  *GetBlobFileHandle(const Image *) ;

extern  Image
  *BlobToImage(const ImageInfo *,const void *,const size_t,ExceptionInfo *);
extern  Image
  *PingBlob(const ImageInfo *,const void *,const size_t,ExceptionInfo *);

extern  MagickBooleanType
  BlobToFile(char *,const void *,const size_t,ExceptionInfo *);
extern  MagickBooleanType
  FileToImage(Image *,const char *);
extern  MagickBooleanType
  GetBlobError(const Image *);
extern  MagickBooleanType
  ImageToFile(Image *,char *,ExceptionInfo *);
extern  MagickBooleanType
  InjectImageBlob(const ImageInfo *,Image *,Image *,const char *,
    ExceptionInfo *);
extern  MagickBooleanType
  IsBlobExempt(const Image *);
extern  MagickBooleanType
  IsBlobSeekable(const Image *);
extern  MagickBooleanType
  IsBlobTemporary(const Image *);

extern  MagickSizeType
  GetBlobSize(const Image *);

extern  StreamHandler
  GetBlobStreamHandler(const Image *);

extern  unsigned char
  *FileToBlob(const char *,const size_t,size_t *,ExceptionInfo *);
extern  unsigned char
  *GetBlobStreamData(const Image *) ;
extern  unsigned char
  *ImageToBlob(const ImageInfo *,Image *,size_t *,ExceptionInfo *);
extern  unsigned char
  *ImagesToBlob(const ImageInfo *,Image *,size_t *,ExceptionInfo *);

extern  void
  DestroyBlob(Image *);
extern  void
  DuplicateBlob(Image *,const Image *);
extern  void
  SetBlobExempt(Image *,const MagickBooleanType);


#endif
