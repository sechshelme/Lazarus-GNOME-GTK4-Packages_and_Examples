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


typedef struct _ImageView
  ImageView;

typedef MagickBooleanType
  (*DuplexTransferImageViewMethod)(const ImageView *,const ImageView *,
    ImageView *,const ssize_t,const int,void *);
typedef MagickBooleanType
  (*GetImageViewMethod)(const ImageView *,const ssize_t,const int,void *);
typedef MagickBooleanType
  (*SetImageViewMethod)(ImageView *,const ssize_t,const int,void *);
typedef MagickBooleanType
  (*TransferImageViewMethod)(const ImageView *,ImageView *,const ssize_t,
    const int,void *);
typedef MagickBooleanType
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
  *CloneImageView(const ImageView *);
extern  ImageView
  *DestroyImageView(ImageView *);
extern  ImageView
  *NewImageView(Image *);
extern  ImageView
  *NewImageViewRegion(Image *,const ssize_t,const ssize_t,const size_t,
    const size_t);

extern  IndexPacket
  *GetImageViewAuthenticIndexes(const ImageView *);

extern  MagickBooleanType
  DuplexTransferImageViewIterator(ImageView *,ImageView *,ImageView *,
    DuplexTransferImageViewMethod,void *);
extern  MagickBooleanType
  GetImageViewIterator(ImageView *,GetImageViewMethod,void *);
extern  MagickBooleanType
  IsImageView(const ImageView *);
extern  MagickBooleanType
  SetImageViewIterator(ImageView *,SetImageViewMethod,void *);
extern  MagickBooleanType
  TransferImageViewIterator(ImageView *,ImageView *,TransferImageViewMethod,
    void *);
extern  MagickBooleanType
  UpdateImageViewIterator(ImageView *,UpdateImageViewMethod,void *);

extern  PixelPacket
  *GetImageViewAuthenticPixels(const ImageView *);

extern  RectangleInfo
  GetImageViewExtent(const ImageView *);

extern  void
  SetImageViewDescription(ImageView *,const char *);
extern  void
  SetImageViewThreads(ImageView *,const size_t);


#endif
