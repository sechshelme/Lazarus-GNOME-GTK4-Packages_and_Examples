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

  MagickCore image methods.
*/
#ifndef MAGICKCORE_IMAGE_H
#define MAGICKCORE_IMAGE_H

#include "magick/color.h"


#define OpaqueOpacity  ((Quantum) 0UL)
#define TransparentOpacity  (QuantumRange)

typedef enum
{
  UndefinedAlphaChannel,
  ActivateAlphaChannel,
  BackgroundAlphaChannel,
  CopyAlphaChannel,
  DeactivateAlphaChannel,
  ExtractAlphaChannel,
  OpaqueAlphaChannel,
  ResetAlphaChannel,  /* deprecated */
  SetAlphaChannel,
  ShapeAlphaChannel,
  TransparentAlphaChannel,
  FlattenAlphaChannel,
  RemoveAlphaChannel,
  AssociateAlphaChannel,
  DisassociateAlphaChannel
} AlphaChannelType;

typedef enum
{
  UndefinedType,
  BilevelType,
  GrayscaleType,
  GrayscaleMatteType,
  PaletteType,
  PaletteMatteType,
  TrueColorType,
  TrueColorMatteType,
  ColorSeparationType,
  ColorSeparationMatteType,
  OptimizeType,
  PaletteBilevelMatteType
} ImageType;

typedef enum
{
  UndefinedInterlace,
  NoInterlace,
  LineInterlace,
  PlaneInterlace,
  PartitionInterlace,
  GIFInterlace,
  JPEGInterlace,
  PNGInterlace
} InterlaceType;

typedef enum
{
  UndefinedOrientation,
  TopLeftOrientation,
  TopRightOrientation,
  BottomRightOrientation,
  BottomLeftOrientation,
  LeftTopOrientation,
  RightTopOrientation,
  RightBottomOrientation,
  LeftBottomOrientation
} OrientationType;

typedef enum
{
  UndefinedResolution,
  PixelsPerInchResolution,
  PixelsPerCentimeterResolution
} ResolutionType;

typedef struct _PrimaryInfo
{
  double
    x,
    y,
    z;
} PrimaryInfo;

typedef struct _SegmentInfo
{
  double
    x1,
    y1,
    x2,
    y2;
} SegmentInfo;

typedef enum
{
  UndefinedTransmitType,
  FileTransmitType,
  BlobTransmitType,
  StreamTransmitType,
  ImageTransmitType
} TransmitType;

typedef struct _ChromaticityInfo
{
  PrimaryInfo
    red_primary,
    green_primary,
    blue_primary,
    white_point;
} ChromaticityInfo;

#include "magick/blob.h"
#include "magick/colorspace.h"
#include "magick/cache-view.h"
#include "magick/color.h"
#include "magick/composite.h"
#include "magick/compress.h"
#include "magick/effect.h"
#include "magick/geometry.h"
#include "magick/layer.h"
#include "magick/locale_.h"
#include "magick/monitor.h"
#include "magick/pixel.h"
#include "magick/profile.h"
#include "magick/quantum.h"
#include "magick/resample.h"
#include "magick/resize.h"
#include "magick/semaphore.h"
#include "magick/stream.h"
#include "magick/timer.h"

struct _Image
{
  ClassType
    storage_class;

  ColorspaceType
    colorspace;      /* colorspace of image data */

  CompressionType
    compression;     /* compression of image when read/write */

  size_t
    quality;         /* compression quality setting, meaning varies */

  OrientationType
    orientation;     /* photo orientation of image */

  MagickBooleanType
    taint,           /* has image been modified since reading */
    matte;           /* is transparency channel defined and active */

  size_t
    columns,         /* physical size of image */
    rows,
    depth,           /* depth of image on read/write */
    colors;          /* size of color table on read */

  PixelPacket
    *colormap,
    background_color, /* current background color attribute */
    border_color,     /* current bordercolor attribute */
    matte_color;      /* current mattecolor attribute */

  double
    gamma;

  ChromaticityInfo
    chromaticity;

  RenderingIntent
    rendering_intent;

  void
    *profiles;

  ResolutionType
    units;          /* resolution/density  ppi or ppc */

  char
    *montage,
    *directory,
    *geometry;

  ssize_t
    offset;

  double
    x_resolution,   /* image resolution/density */
    y_resolution;

  RectangleInfo
    page,           /* virtual canvas size and offset of image */
    extract_info,
    tile_info;      /* deprecated */

  double
    bias,
    blur,           /* deprecated */
    fuzz;           /* current color fuzz attribute */

  FilterTypes
    filter;         /* resize/distort filter to apply */

  InterlaceType
    interlace;

  EndianType
    endian;         /* raw data integer ordering on read/write */

  GravityType
    gravity;        /* Gravity attribute for positioning in image */

  CompositeOperator
    compose;        /* alpha composition method for layered images */

  DisposeType
    dispose;        /* GIF animation disposal method */

  struct _Image
    *clip_mask;

  size_t
    scene,          /* index of image in multi-image file */
    delay;          /* Animation delay time */

  ssize_t
    ticks_per_second;  /* units for delay time, default 100 for GIF */

  size_t
    iterations,
    total_colors;

  ssize_t
    start_loop;

  ErrorInfo
    error;

  TimerInfo
    timer;

  MagickProgressMonitor
    progress_monitor;

  void
    *client_data,
    *cache,
    *attributes;      /* deprecated */

  Ascii85Info
    *ascii85;

  BlobInfo
    *blob;

  char
    filename[MaxTextExtent],         /* images input filename */
    magick_filename[MaxTextExtent],  /* ditto with coders, and read_mods */
    magick[MaxTextExtent];           /* Coder used to decode image */

  size_t
    magick_columns,
    magick_rows;

  ExceptionInfo
    exception;        /* Error handling report */

  MagickBooleanType
    debug;            /* debug output attribute */

  ssize_t
    reference_count;

  SemaphoreInfo
    *semaphore;

  ProfileInfo
    color_profile,
    iptc_profile,
    *generic_profile;

  size_t
    generic_profiles;  /* this & ProfileInfo is deprecated */

  size_t
    signature;

  struct _Image
    *previous,         /* Image list links */
    *list,             /* Undo/Redo image processing list (for display) */
    *next;             /* Image list links */

  InterpolatePixelMethod
    interpolate;       /* Interpolation of color for between pixel lookups */

  MagickBooleanType
    black_point_compensation;

  PixelPacket
    transparent_color; /* color for 'transparent' color index in GIF */

  struct _Image
    *mask;

  RectangleInfo
    tile_offset;

  void
    *properties,       /* per image properities */
    *artifacts;        /* per image sequence image artifacts */

  ImageType
    type;

  MagickBooleanType
    dither;            /* dithering method during color reduction */

  MagickSizeType
    extent;

  MagickBooleanType
    ping;

  size_t
    channels;

  time_t
    timestamp;

  PixelIntensityMethod
    intensity;      /* method to generate an intensity value from a pixel */

  size_t
    duration;       /* Total animation duration sum(delay*iterations) */

  long
    tietz_offset;
};

struct _ImageInfo
{
  CompressionType
    compression;

  OrientationType
    orientation;

  MagickBooleanType
    temporary,
    adjoin,
    affirm,
    antialias;

  char
    *size,
    *extract,
    *page,
    *scenes;

  size_t
    scene,
    number_scenes,
    depth;

  InterlaceType
    interlace;

  EndianType
    endian;

  ResolutionType
    units;

  size_t
    quality;

  char
    *sampling_factor,  /* Chroma subsampling ratio string */
    *server_name,
    *font,
    *texture,
    *density;

  double
    pointsize,
    fuzz;

  PixelPacket
    background_color,
    border_color,
    matte_color;

  MagickBooleanType
    dither,
    monochrome;

  size_t
    colors;

  ColorspaceType
    colorspace;

  ImageType
    type;

  PreviewType
    preview_type;

  ssize_t
    group;

  MagickBooleanType
    ping,
    verbose;

  char
    *view,
    *authenticate;

  ChannelType
    channel;

  Image
    *attributes;  /* deprecated */

  void
    *options;

  MagickProgressMonitor
    progress_monitor;

  void
    *client_data,
    *cache;

  StreamHandler
    stream;

  FILE
    *file;

  void
    *blob;

  size_t
    length;

  char
    magick[MaxTextExtent],
    unique[MaxTextExtent],
    zero[MaxTextExtent],
    filename[MaxTextExtent];

  MagickBooleanType
    debug;

  char
    *tile;  /* deprecated */

  size_t
    subimage,  /* deprecated */
    subrange;  /* deprecated */

  PixelPacket
    pen;  /* deprecated */

  size_t
    signature;

  VirtualPixelMethod
    virtual_pixel_method;

  PixelPacket
    transparent_color;

  void
    *profile;

  MagickBooleanType
    synchronize;
};

extern  ExceptionType
  CatchImageException(Image *);

extern  FILE
  *GetImageInfoFile(const ImageInfo *);

extern  Image
  *AcquireImage(const ImageInfo *);
extern  Image
  *AppendImages(const Image *,const MagickBooleanType,ExceptionInfo *);
extern  Image
  *CloneImage(const Image *,const size_t,const size_t,const MagickBooleanType,
    ExceptionInfo *);
extern  Image
  *DestroyImage(Image *);
extern  Image
  *GetImageClipMask(const Image *,ExceptionInfo *);
extern  Image
  *GetImageMask(const Image *,ExceptionInfo *) ;
extern  Image
  *NewMagickImage(const ImageInfo *,const size_t,const size_t,
    const MagickPixelPacket *);
extern  Image
  *ReferenceImage(Image *);
extern  Image
  *SmushImages(const Image *,const MagickBooleanType,const ssize_t,
    ExceptionInfo *);

extern  ImageInfo
  *AcquireImageInfo(void);
extern  ImageInfo
  *CloneImageInfo(const ImageInfo *);
extern  ImageInfo
  *DestroyImageInfo(ImageInfo *);

extern  MagickBooleanType
  ClipImage(Image *);
extern  MagickBooleanType
  ClipImagePath(Image *,const char *,const MagickBooleanType);
extern  MagickBooleanType
  CopyImagePixels(Image *,const Image *,const RectangleInfo *,
    const OffsetInfo *,ExceptionInfo *);
extern  MagickBooleanType
  IsTaintImage(const Image *);
extern  MagickBooleanType
  IsMagickConflict(const char *);
extern  MagickBooleanType
  IsHighDynamicRangeImage(const Image *,ExceptionInfo *);
extern  MagickBooleanType
  IsImageObject(const Image *);
extern  MagickBooleanType
  ListMagickInfo(FILE *,ExceptionInfo *);
extern  MagickBooleanType
  ModifyImage(Image **,ExceptionInfo *);
extern  MagickBooleanType
  ResetImagePage(Image *,const char *);
extern  MagickBooleanType
  ResetImagePixels(Image *,ExceptionInfo *);
extern  MagickBooleanType
  SetImageBackgroundColor(Image *);
extern  MagickBooleanType
  SetImageClipMask(Image *,const Image *);
extern  MagickBooleanType
  SetImageColor(Image *,const MagickPixelPacket *);
extern  MagickBooleanType
  SetImageExtent(Image *,const size_t,const size_t);
extern  MagickBooleanType
  SetImageInfo(ImageInfo *,const unsigned int,ExceptionInfo *);
extern  MagickBooleanType
  SetImageMask(Image *,const Image *);
extern  MagickBooleanType
  SetImageOpacity(Image *,const Quantum);
extern  MagickBooleanType
  SetImageChannels(Image *,const size_t);
extern  MagickBooleanType
  SetImageStorageClass(Image *,const ClassType);
extern  MagickBooleanType
  StripImage(Image *);
extern  MagickBooleanType
  SyncImage(Image *);
extern  MagickBooleanType
  SyncImageSettings(const ImageInfo *,Image *);
extern  MagickBooleanType
  SyncImagesSettings(ImageInfo *,Image *);

extern  size_t
  InterpretImageFilename(const ImageInfo *,Image *,const char *,int,char *);

extern  ssize_t
  GetImageReferenceCount(Image *);

extern  size_t
  GetImageChannels(Image *);

extern  VirtualPixelMethod
  GetImageVirtualPixelMethod(const Image *);
extern  VirtualPixelMethod
  SetImageVirtualPixelMethod(const Image *,const VirtualPixelMethod);

extern  void
  AcquireNextImage(const ImageInfo *,Image *);
extern  void
  DestroyImagePixels(Image *);
extern  void
  DisassociateImageStream(Image *);
extern  void
  GetImageException(Image *,ExceptionInfo *);
extern  void
  GetImageInfo(ImageInfo *);
extern  void
  SetImageInfoBlob(ImageInfo *,const void *,const size_t);
extern  void
  SetImageInfoFile(ImageInfo *,FILE *);


#endif
