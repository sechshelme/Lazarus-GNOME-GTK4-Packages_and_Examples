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

  MagickCore image list methods.
*/
#ifndef MAGICKCORE_LIST_H
#define MAGICKCORE_LIST_H

extern  Image
  *CloneImageList(const Image *,ExceptionInfo *);
extern  Image
  *CloneImages(const Image *,const char *,ExceptionInfo *);
extern  Image
  *DestroyImageList(Image *);
extern  Image
  *DuplicateImages(Image *,const size_t,const char *,ExceptionInfo *);
extern  Image
  *GetFirstImageInList(const Image *);
extern  Image
  *GetImageFromList(const Image *,const ssize_t);
extern  Image
  *GetLastImageInList(const Image *);
extern  Image
  *GetNextImageInList(const Image *);
extern  Image
  *GetPreviousImageInList(const Image *);
extern  Image
  **ImageListToArray(const Image *,ExceptionInfo *);
extern  Image
  *NewImageList(void) ;
extern  Image
  *RemoveImageFromList(Image **);
extern  Image
  *RemoveLastImageFromList(Image **);
extern  Image
  *RemoveFirstImageFromList(Image **);
extern  Image
  *SpliceImageIntoList(Image **,const size_t,const Image *);
extern  Image
  *SplitImageList(Image *);
extern  Image
  *SyncNextImageInList(const Image *);

extern  size_t
  GetImageListLength(const Image *);

extern  ssize_t
  GetImageIndexInList(const Image *);

extern  void
  AppendImageToList(Image **,const Image *);
extern  void
  DeleteImageFromList(Image **);
extern  void
  DeleteImages(Image **,const char *,ExceptionInfo *);
extern  void
  InsertImageInList(Image **,Image *);
extern  void
  PrependImageToList(Image **,Image *);
extern  void
  ReplaceImageInList(Image **,Image *);
extern  void
  ReplaceImageInListReturnLast(Image **,Image *);
extern  void
  ReverseImageList(Image **);
extern  void
  SyncImageList(Image *);


#endif
