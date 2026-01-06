unit image;

interface

uses
  fp_magiccore;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
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
 }
{$ifndef MAGICKCORE_IMAGE_H}
{$define MAGICKCORE_IMAGE_H}
{$include "magick/color.h"}

{ was #define dname def_expr }
function OpaqueOpacity : TQuantum;  

const
  TransparentOpacity = QuantumRange;  
{ deprecated  }
type
  PAlphaChannelType = ^TAlphaChannelType;
  TAlphaChannelType =  Longint;
  Const
    UndefinedAlphaChannel = 0;
    ActivateAlphaChannel = 1;
    BackgroundAlphaChannel = 2;
    CopyAlphaChannel = 3;
    DeactivateAlphaChannel = 4;
    ExtractAlphaChannel = 5;
    OpaqueAlphaChannel = 6;
    ResetAlphaChannel = 7;
    SetAlphaChannel = 8;
    ShapeAlphaChannel = 9;
    TransparentAlphaChannel = 10;
    FlattenAlphaChannel = 11;
    RemoveAlphaChannel = 12;
    AssociateAlphaChannel = 13;
    DisassociateAlphaChannel = 14;
;
type
  PImageType = ^TImageType;
  TImageType =  Longint;
  Const
    UndefinedType = 0;
    BilevelType = 1;
    GrayscaleType = 2;
    GrayscaleMatteType = 3;
    PaletteType = 4;
    PaletteMatteType = 5;
    TrueColorType = 6;
    TrueColorMatteType = 7;
    ColorSeparationType = 8;
    ColorSeparationMatteType = 9;
    OptimizeType = 10;
    PaletteBilevelMatteType = 11;
;
type
  PInterlaceType = ^TInterlaceType;
  TInterlaceType =  Longint;
  Const
    UndefinedInterlace = 0;
    NoInterlace = 1;
    LineInterlace = 2;
    PlaneInterlace = 3;
    PartitionInterlace = 4;
    GIFInterlace = 5;
    JPEGInterlace = 6;
    PNGInterlace = 7;
;
type
  POrientationType = ^TOrientationType;
  TOrientationType =  Longint;
  Const
    UndefinedOrientation = 0;
    TopLeftOrientation = 1;
    TopRightOrientation = 2;
    BottomRightOrientation = 3;
    BottomLeftOrientation = 4;
    LeftTopOrientation = 5;
    RightTopOrientation = 6;
    RightBottomOrientation = 7;
    LeftBottomOrientation = 8;
;
type
  PResolutionType = ^TResolutionType;
  TResolutionType =  Longint;
  Const
    UndefinedResolution = 0;
    PixelsPerInchResolution = 1;
    PixelsPerCentimeterResolution = 2;
;
type
  PPrimaryInfo = ^TPrimaryInfo;
  TPrimaryInfo = record
      x : Tdouble;
      y : Tdouble;
      z : Tdouble;
    end;

  PSegmentInfo = ^TSegmentInfo;
  TSegmentInfo = record
      x1 : Tdouble;
      y1 : Tdouble;
      x2 : Tdouble;
      y2 : Tdouble;
    end;

  PTransmitType = ^TTransmitType;
  TTransmitType =  Longint;
  Const
    UndefinedTransmitType = 0;
    FileTransmitType = 1;
    BlobTransmitType = 2;
    StreamTransmitType = 3;
    ImageTransmitType = 4;
;
type
  PChromaticityInfo = ^TChromaticityInfo;
  TChromaticityInfo = record
      red_primary : TPrimaryInfo;
      green_primary : TPrimaryInfo;
      blue_primary : TPrimaryInfo;
      white_point : TPrimaryInfo;
    end;
{$include "magick/blob.h"}
{$include "magick/colorspace.h"}
{$include "magick/cache-view.h"}
{$include "magick/color.h"}
{$include "magick/composite.h"}
{$include "magick/compress.h"}
{$include "magick/effect.h"}
{$include "magick/geometry.h"}
{$include "magick/layer.h"}
{$include "magick/locale_.h"}
{$include "magick/monitor.h"}
{$include "magick/pixel.h"}
{$include "magick/profile.h"}
{$include "magick/quantum.h"}
{$include "magick/resample.h"}
{$include "magick/resize.h"}
{$include "magick/semaphore.h"}
{$include "magick/stream.h"}
{$include "magick/timer.h"}
{ colorspace of image data  }
{ compression of image when read/write  }
{ compression quality setting, meaning varies  }
{ photo orientation of image  }
{ has image been modified since reading  }
{ is transparency channel defined and active  }
{ physical size of image  }
{ depth of image on read/write  }
{ size of color table on read  }
{ current background color attribute  }
{ current bordercolor attribute  }
{ current mattecolor attribute  }
{ resolution/density  ppi or ppc  }
{ image resolution/density  }
{ virtual canvas size and offset of image  }
{ deprecated  }
{ deprecated  }
{ current color fuzz attribute  }
{ resize/distort filter to apply  }
{ raw data integer ordering on read/write  }
{ Gravity attribute for positioning in image  }
{ alpha composition method for layered images  }
{ GIF animation disposal method  }
{ index of image in multi-image file  }
{ Animation delay time  }
{ units for delay time, default 100 for GIF  }
{ deprecated  }
{ images input filename  }
{ ditto with coders, and read_mods  }
{ Coder used to decode image  }
{ Error handling report  }
{ debug output attribute  }
{ this & ProfileInfo is deprecated  }
{ Image list links  }
{ Undo/Redo image processing list (for display)  }
{ Image list links  }
{ Interpolation of color for between pixel lookups  }
{ color for 'transparent' color index in GIF  }
{ per image properities  }
{ per image sequence image artifacts  }
{ dithering method during color reduction  }
{ method to generate an intensity value from a pixel  }
{ Total animation duration sum(delay*iterations)  }
type
  PImage = ^TImage;
  TImage = record
      storage_class : TClassType;
      colorspace : TColorspaceType;
      compression : TCompressionType;
      quality : Tsize_t;
      orientation : TOrientationType;
      taint : TMagickBooleanType;
      matte : TMagickBooleanType;
      columns : Tsize_t;
      rows : Tsize_t;
      depth : Tsize_t;
      colors : Tsize_t;
      colormap : PPixelPacket;
      background_color : TPixelPacket;
      border_color : TPixelPacket;
      matte_color : TPixelPacket;
      gamma : Tdouble;
      chromaticity : TChromaticityInfo;
      rendering_intent : TRenderingIntent;
      profiles : pointer;
      units : TResolutionType;
      montage : Pchar;
      directory : Pchar;
      geometry : Pchar;
      offset : Tssize_t;
      x_resolution : Tdouble;
      y_resolution : Tdouble;
      page : TRectangleInfo;
      extract_info : TRectangleInfo;
      tile_info : TRectangleInfo;
      bias : Tdouble;
      blur : Tdouble;
      fuzz : Tdouble;
      filter : TFilterTypes;
      interlace : TInterlaceType;
      endian : TEndianType;
      gravity : TGravityType;
      compose : TCompositeOperator;
      _dispose : TDisposeType;
      clip_mask : PImage;
      scene : Tsize_t;
      delay : Tsize_t;
      ticks_per_second : Tssize_t;
      iterations : Tsize_t;
      total_colors : Tsize_t;
      start_loop : Tssize_t;
      error : TErrorInfo;
      timer : TTimerInfo;
      progress_monitor : TMagickProgressMonitor;
      client_data : pointer;
      cache : pointer;
      attributes : pointer;
      ascii85 : PAscii85Info;
      blob : PBlobInfo;
      filename : array[0..(MaxTextExtent)-1] of char;
      magick_filename : array[0..(MaxTextExtent)-1] of char;
      magick : array[0..(MaxTextExtent)-1] of char;
      magick_columns : Tsize_t;
      magick_rows : Tsize_t;
      exception : TExceptionInfo;
      debug : TMagickBooleanType;
      reference_count : Tssize_t;
      semaphore : PSemaphoreInfo;
      color_profile : TProfileInfo;
      iptc_profile : TProfileInfo;
      generic_profile : PProfileInfo;
      generic_profiles : Tsize_t;
      signature : Tsize_t;
      previous : PImage;
      list : PImage;
      next : PImage;
      interpolate : TInterpolatePixelMethod;
      black_point_compensation : TMagickBooleanType;
      transparent_color : TPixelPacket;
      mask : PImage;
      tile_offset : TRectangleInfo;
      properties : pointer;
      artifacts : pointer;
      _type : TImageType;
      dither : TMagickBooleanType;
      extent : TMagickSizeType;
      ping : TMagickBooleanType;
      channels : Tsize_t;
      timestamp : Ttime_t;
      intensity : TPixelIntensityMethod;
      duration : Tsize_t;
      tietz_offset : longint;
    end;

{ Chroma subsampling ratio string  }
{ deprecated  }
{ deprecated  }
{ deprecated  }
{ deprecated  }
{ deprecated  }
  PImageInfo = ^TImageInfo;
  TImageInfo = record
      compression : TCompressionType;
      orientation : TOrientationType;
      temporary : TMagickBooleanType;
      adjoin : TMagickBooleanType;
      affirm : TMagickBooleanType;
      antialias : TMagickBooleanType;
      size : Pchar;
      extract : Pchar;
      page : Pchar;
      scenes : Pchar;
      scene : Tsize_t;
      number_scenes : Tsize_t;
      depth : Tsize_t;
      interlace : TInterlaceType;
      endian : TEndianType;
      units : TResolutionType;
      quality : Tsize_t;
      sampling_factor : Pchar;
      server_name : Pchar;
      font : Pchar;
      texture : Pchar;
      density : Pchar;
      pointsize : Tdouble;
      fuzz : Tdouble;
      background_color : TPixelPacket;
      border_color : TPixelPacket;
      matte_color : TPixelPacket;
      dither : TMagickBooleanType;
      monochrome : TMagickBooleanType;
      colors : Tsize_t;
      colorspace : TColorspaceType;
      _type : TImageType;
      preview_type : TPreviewType;
      group : Tssize_t;
      ping : TMagickBooleanType;
      verbose : TMagickBooleanType;
      view : Pchar;
      authenticate : Pchar;
      channel : TChannelType;
      attributes : PImage;
      options : pointer;
      progress_monitor : TMagickProgressMonitor;
      client_data : pointer;
      cache : pointer;
      stream : TStreamHandler;
      file : PFILE;
      blob : pointer;
      length : Tsize_t;
      magick : array[0..(MaxTextExtent)-1] of char;
      unique : array[0..(MaxTextExtent)-1] of char;
      zero : array[0..(MaxTextExtent)-1] of char;
      filename : array[0..(MaxTextExtent)-1] of char;
      debug : TMagickBooleanType;
      tile : Pchar;
      subimage : Tsize_t;
      subrange : Tsize_t;
      pen : TPixelPacket;
      signature : Tsize_t;
      virtual_pixel_method : TVirtualPixelMethod;
      transparent_color : TPixelPacket;
      profile : pointer;
      synchronize : TMagickBooleanType;
    end;


function CatchImageException(para1:PImage):TExceptionType;cdecl;external libmagiccore;
function GetImageInfoFile(para1:PImageInfo):PFILE;cdecl;external libmagiccore;
function AcquireImage(para1:PImageInfo):PImage;cdecl;external libmagiccore;
function AppendImages(para1:PImage; para2:TMagickBooleanType; para3:PExceptionInfo):PImage;cdecl;external libmagiccore;
function CloneImage(para1:PImage; para2:Tsize_t; para3:Tsize_t; para4:TMagickBooleanType; para5:PExceptionInfo):PImage;cdecl;external libmagiccore;
function DestroyImage(para1:PImage):PImage;cdecl;external libmagiccore;
function GetImageClipMask(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external libmagiccore;
function GetImageMask(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external libmagiccore;
function NewMagickImage(para1:PImageInfo; para2:Tsize_t; para3:Tsize_t; para4:PMagickPixelPacket):PImage;cdecl;external libmagiccore;
function ReferenceImage(para1:PImage):PImage;cdecl;external libmagiccore;
function SmushImages(para1:PImage; para2:TMagickBooleanType; para3:Tssize_t; para4:PExceptionInfo):PImage;cdecl;external libmagiccore;
function AcquireImageInfo:PImageInfo;cdecl;external libmagiccore;
function CloneImageInfo(para1:PImageInfo):PImageInfo;cdecl;external libmagiccore;
function DestroyImageInfo(para1:PImageInfo):PImageInfo;cdecl;external libmagiccore;
function ClipImage(para1:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function ClipImagePath(para1:PImage; para2:Pchar; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagiccore;
function CopyImagePixels(para1:PImage; para2:PImage; para3:PRectangleInfo; para4:POffsetInfo; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function IsTaintImage(para1:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function IsMagickConflict(para1:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function IsHighDynamicRangeImage(para1:PImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function IsImageObject(para1:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function ListMagickInfo(para1:PFILE; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function ModifyImage(para1:PPImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function ResetImagePage(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external libmagiccore;
function ResetImagePixels(para1:PImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function SetImageBackgroundColor(para1:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function SetImageClipMask(para1:PImage; para2:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function SetImageColor(para1:PImage; para2:PMagickPixelPacket):TMagickBooleanType;cdecl;external libmagiccore;
function SetImageExtent(para1:PImage; para2:Tsize_t; para3:Tsize_t):TMagickBooleanType;cdecl;external libmagiccore;
function SetImageInfo(para1:PImageInfo; para2:dword; para3:PExceptionInfo):TMagickBooleanType;cdecl;external libmagiccore;
function SetImageMask(para1:PImage; para2:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function SetImageOpacity(para1:PImage; para2:TQuantum):TMagickBooleanType;cdecl;external libmagiccore;
function SetImageChannels(para1:PImage; para2:Tsize_t):TMagickBooleanType;cdecl;external libmagiccore;
function SetImageStorageClass(para1:PImage; para2:TClassType):TMagickBooleanType;cdecl;external libmagiccore;
function StripImage(para1:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function SyncImage(para1:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function SyncImageSettings(para1:PImageInfo; para2:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function SyncImagesSettings(para1:PImageInfo; para2:PImage):TMagickBooleanType;cdecl;external libmagiccore;
function InterpretImageFilename(para1:PImageInfo; para2:PImage; para3:Pchar; para4:longint; para5:Pchar):Tsize_t;cdecl;external libmagiccore;
function GetImageReferenceCount(para1:PImage):Tssize_t;cdecl;external libmagiccore;
function GetImageChannels(para1:PImage):Tsize_t;cdecl;external libmagiccore;
function GetImageVirtualPixelMethod(para1:PImage):TVirtualPixelMethod;cdecl;external libmagiccore;
function SetImageVirtualPixelMethod(para1:PImage; para2:TVirtualPixelMethod):TVirtualPixelMethod;cdecl;external libmagiccore;
procedure AcquireNextImage(para1:PImageInfo; para2:PImage);cdecl;external libmagiccore;
procedure DestroyImagePixels(para1:PImage);cdecl;external libmagiccore;
procedure DisassociateImageStream(para1:PImage);cdecl;external libmagiccore;
procedure GetImageException(para1:PImage; para2:PExceptionInfo);cdecl;external libmagiccore;
procedure GetImageInfo(para1:PImageInfo);cdecl;external libmagiccore;
procedure SetImageInfoBlob(para1:PImageInfo; para2:pointer; para3:Tsize_t);cdecl;external libmagiccore;
procedure SetImageInfoFile(para1:PImageInfo; para2:PFILE);cdecl;external libmagiccore;
{$endif}

// === Konventiert am: 6-1-26 14:01:00 ===


implementation


{ was #define dname def_expr }
function OpaqueOpacity : TQuantum;
  begin
    OpaqueOpacity:=TQuantum(0);
  end;


end.
