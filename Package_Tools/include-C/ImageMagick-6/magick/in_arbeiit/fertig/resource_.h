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

  MagickCore resource methods.
*/
#ifndef MAGICKCORE_RESOURCE_H
#define MAGICKCORE_RESOURCE_H

typedef enum
{
  UndefinedResource,
  AreaResource,
  DiskResource,
  FileResource,
  MapResource,
  MemoryResource,
  ThreadResource,
  TimeResource,
  ThrottleResource,
  WidthResource,
  HeightResource,
  ListLengthResource
} ResourceType;

#define MagickResourceInfinity  (MagickULLConstant(~0) >> 1)

extern  int
  AcquireUniqueFileResource(char *);

extern  MagickBooleanType
  AcquireMagickResource(const ResourceType,const MagickSizeType);
extern  MagickBooleanType
  GetPathTemplate(char *);
extern  MagickBooleanType
  ListMagickResourceInfo(FILE *,ExceptionInfo *);
extern  MagickBooleanType
  RelinquishUniqueFileResource(const char *);
extern  MagickBooleanType
  ResourceComponentGenesis(void);
extern  MagickBooleanType
  SetMagickResourceLimit(const ResourceType,const MagickSizeType);

extern  MagickSizeType
  GetMagickResource(const ResourceType);
extern  MagickSizeType
  GetMagickResourceLimit(const ResourceType);

extern  void
  AsynchronousResourceComponentTerminus(void);
extern  void
  RelinquishMagickResource(const ResourceType,const MagickSizeType);
extern  void
  ResourceComponentTerminus(void);

