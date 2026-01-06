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

  MagickCore image layer methods.
*/
#ifndef MAGICKCORE_LAYER_H
#define MAGICKCORE_LAYER_H


typedef enum
{
  UnrecognizedDispose,
  UndefinedDispose = 0,
  NoneDispose = 1,
  BackgroundDispose = 2,
  PreviousDispose = 3
} DisposeType;

typedef enum
{
  UndefinedLayer,
  CoalesceLayer,
  CompareAnyLayer,
  CompareClearLayer,
  CompareOverlayLayer,
  DisposeLayer,
  OptimizeLayer,
  OptimizeImageLayer,
  OptimizePlusLayer,
  OptimizeTransLayer,
  RemoveDupsLayer,
  RemoveZeroLayer,
  CompositeLayer,
  MergeLayer,
  FlattenLayer,
  MosaicLayer,
  TrimBoundsLayer
} ImageLayerMethod;

extern  Image
  *CoalesceImages(const Image *,ExceptionInfo *);
extern  Image
  *DisposeImages(const Image *,ExceptionInfo *);
extern  Image
  *CompareImageLayers(const Image *,const ImageLayerMethod,ExceptionInfo *);
extern  Image
  *DeconstructImages(const Image *,ExceptionInfo *);
extern  Image
  *MergeImageLayers(Image *,const ImageLayerMethod,ExceptionInfo *);
extern  Image
  *OptimizeImageLayers(const Image *,ExceptionInfo *);
extern  Image
  *OptimizePlusImageLayers(const Image *,ExceptionInfo *);

extern  void
  CompositeLayers(Image *,const CompositeOperator,Image *,const ssize_t,
    const ssize_t,ExceptionInfo *);
extern  void
  OptimizeImageTransparency(const Image *,ExceptionInfo *);
extern  void
  RemoveDuplicateLayers(Image **,ExceptionInfo *);
extern  void
  RemoveZeroDelayLayers(Image **,ExceptionInfo *);


