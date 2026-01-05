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

  MagickCore image view methods.
*/
#ifndef MAGICKCORE_IMAGE_VIEW_H
#define MAGICKCORE_IMAGE_VIEW_H

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

typedef struct _ImageView
  ImageView;

typedef MagickBooleanType
  (*DuplexTransferImageViewMethod)(const ImageView *,const ImageView *,
    ImageView *,const ssize_t,const int,void *),
  (*GetImageViewMethod)(const ImageView *,const ssize_t,const int,void *),
  (*SetImageViewMethod)(ImageView *,const ssize_t,const int,void *),
  (*TransferImageViewMethod)(const ImageView *,ImageView *,const ssize_t,
    const int,void *),
  (*UpdateImageViewMethod)(ImageView *,const ssize_t,const int,void *);

extern  char
  *GetImageViewException(const ImageView *,ExceptionType *);

extern  const IndexPacket
  *GetImageViewVirtualIndexes(const ImageView *);

extern  const PixelPacket
  *GetImageViewVirtualPixels(const ImageView *);

extern  Image
  *GetImageViewImage(const ImageView *);

extern  ImageView
  *CloneImageView(const ImageView *),
  *DestroyImageView(ImageView *),
  *NewImageView(Image *),
  *NewImageViewRegion(Image *,const ssize_t,const ssize_t,const size_t,
    const size_t);

extern  IndexPacket
  *GetImageViewAuthenticIndexes(const ImageView *);

extern  MagickBooleanType
  DuplexTransferImageViewIterator(ImageView *,ImageView *,ImageView *,
    DuplexTransferImageViewMethod,void *),
  GetImageViewIterator(ImageView *,GetImageViewMethod,void *),
  IsImageView(const ImageView *),
  SetImageViewIterator(ImageView *,SetImageViewMethod,void *),
  TransferImageViewIterator(ImageView *,ImageView *,TransferImageViewMethod,
    void *),
  UpdateImageViewIterator(ImageView *,UpdateImageViewMethod,void *);

extern  PixelPacket
  *GetImageViewAuthenticPixels(const ImageView *);

extern  RectangleInfo
  GetImageViewExtent(const ImageView *);

extern  void
  SetImageViewDescription(ImageView *,const char *),
  SetImageViewThreads(ImageView *,const size_t);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif

#endif
