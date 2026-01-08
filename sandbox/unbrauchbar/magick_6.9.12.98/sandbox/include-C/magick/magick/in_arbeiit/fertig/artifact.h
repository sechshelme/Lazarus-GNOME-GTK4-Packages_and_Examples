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

  MagickCore artifact methods.
*/
#ifndef MAGICKCORE_ARTIFACT_H
#define MAGICKCORE_ARTIFACT_H


extern  char
  *GetNextImageArtifact(const Image *);
extern  char
  *RemoveImageArtifact(Image *,const char *);

extern  const char
  *GetImageArtifact(const Image *,const char *);

extern  MagickBooleanType
  CloneImageArtifacts(Image *,const Image *);
extern  MagickBooleanType
  DefineImageArtifact(Image *,const char *);
extern  MagickBooleanType
  DeleteImageArtifact(Image *,const char *);
extern  MagickBooleanType
  SetImageArtifact(Image *,const char *,const char *);

extern  void
  DestroyImageArtifacts(Image *);
extern  void
  ResetImageArtifactIterator(const Image *);


