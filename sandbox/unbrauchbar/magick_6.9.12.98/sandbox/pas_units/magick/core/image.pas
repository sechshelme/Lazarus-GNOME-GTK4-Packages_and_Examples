unit image;

interface

uses
  fp_magiccore, magick_type, exception, pixel, geometry, cache_view;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const    OpaqueOpacity=TQuantum(0);

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

type
  PResolutionType = ^TResolutionType;
  TResolutionType =  Longint;
  Const
    UndefinedResolution = 0;
    PixelsPerInchResolution = 1;
    PixelsPerCentimeterResolution = 2;

type
  TPrimaryInfo = record
      x : double;
      y : double;
      z : double;
    end;
  PPrimaryInfo = ^TPrimaryInfo;

  TSegmentInfo = record
      x1 : double;
      y1 : double;
      x2 : double;
      y2 : double;
    end;
  PSegmentInfo = ^TSegmentInfo;
type
  PTransmitType = ^TTransmitType;
  TTransmitType =  Longint;
  Const
    UndefinedTransmitType = 0;
    FileTransmitType = 1;
    BlobTransmitType = 2;
    StreamTransmitType = 3;
    ImageTransmitType = 4;

type
  TChromaticityInfo = record
      red_primary : TPrimaryInfo;
      green_primary : TPrimaryInfo;
      blue_primary : TPrimaryInfo;
      white_point : TPrimaryInfo;
    end;
  PChromaticityInfo = ^TChromaticityInfo;
type
  TImage = record
      //storage_class : TClassType;
      //colorspace : TColorspaceType;
      //compression : TCompressionType;
      //quality : Tsize_t;
      //orientation : TOrientationType;
      //taint : TMagickBooleanType;
      //matte : TMagickBooleanType;
      //columns : Tsize_t;
      //rows : Tsize_t;
      //depth : Tsize_t;
      //colors : Tsize_t;
      //colormap : PPixelPacket;
      //background_color : TPixelPacket;
      //border_color : TPixelPacket;
      //matte_color : TPixelPacket;
      //gamma : double;
      //chromaticity : TChromaticityInfo;
      //rendering_intent : TRenderingIntent;
      //profiles : pointer;
      //units : TResolutionType;
      //montage : Pchar;
      //directory : Pchar;
      //geometry : Pchar;
      //offset : Tssize_t;
      //x_resolution : double;
      //y_resolution : double;
      //page : TRectangleInfo;
      //extract_info : TRectangleInfo;
      //tile_info : TRectangleInfo;
      //bias : double;
      //blur : double;
      //fuzz : double;
      //filter : TFilterTypes;
      //interlace : TInterlaceType;
      //endian : TEndianType;
      //gravity : TGravityType;
      //compose : TCompositeOperator;
      //_dispose : TDisposeType;
      //clip_mask : PImage;
      //scene : Tsize_t;
      //delay : Tsize_t;
      //ticks_per_second : Tssize_t;
      //iterations : Tsize_t;
      //total_colors : Tsize_t;
      //start_loop : Tssize_t;
      //error : TErrorInfo;
      //timer : TTimerInfo;
      //progress_monitor : TMagickProgressMonitor;
      //client_data : pointer;
      //cache : pointer;
      //attributes : pointer;
      //ascii85 : PAscii85Info;
      //blob : PBlobInfo;
      //filename : array[0..(MaxTextExtent)-1] of char;
      //magick_filename : array[0..(MaxTextExtent)-1] of char;
      //magick : array[0..(MaxTextExtent)-1] of char;
      //magick_columns : Tsize_t;
      //magick_rows : Tsize_t;
      //exception : TExceptionInfo;
      //debug : TMagickBooleanType;
      //reference_count : Tssize_t;
      //semaphore : PSemaphoreInfo;
      //color_profile : TProfileInfo;
      //iptc_profile : TProfileInfo;
      //generic_profile : PProfileInfo;
      //generic_profiles : Tsize_t;
      //signature : Tsize_t;
      //previous : PImage;
      //list : PImage;
      //next : PImage;
      //interpolate : TInterpolatePixelMethod;
      //black_point_compensation : TMagickBooleanType;
      //transparent_color : TPixelPacket;
      //mask : PImage;
      //tile_offset : TRectangleInfo;
      //properties : pointer;
      //artifacts : pointer;
      //_type : TImageType;
      //dither : TMagickBooleanType;
      //extent : TMagickSizeType;
      //ping : TMagickBooleanType;
      //channels : Tsize_t;
      //timestamp : Ttime_t;
      //intensity : TPixelIntensityMethod;
      //duration : Tsize_t;
      //tietz_offset : longint;
    end;
  PImage = ^TImage;
  PPImage = ^PImage;

  TImageInfo = record
      //compression : TCompressionType;
      //orientation : TOrientationType;
      //temporary : TMagickBooleanType;
      //adjoin : TMagickBooleanType;
      //affirm : TMagickBooleanType;
      //antialias : TMagickBooleanType;
      //size : Pchar;
      //extract : Pchar;
      //page : Pchar;
      //scenes : Pchar;
      //scene : Tsize_t;
      //number_scenes : Tsize_t;
      //depth : Tsize_t;
      //interlace : TInterlaceType;
      //endian : TEndianType;
      //units : TResolutionType;
      //quality : Tsize_t;
      //sampling_factor : Pchar;
      //server_name : Pchar;
      //font : Pchar;
      //texture : Pchar;
      //density : Pchar;
      //pointsize : Tdouble;
      //fuzz : Tdouble;
      //background_color : TPixelPacket;
      //border_color : TPixelPacket;
      //matte_color : TPixelPacket;
      //dither : TMagickBooleanType;
      //monochrome : TMagickBooleanType;
      //colors : Tsize_t;
      //colorspace : TColorspaceType;
      //_type : TImageType;
      //preview_type : TPreviewType;
      //group : Tssize_t;
      //ping : TMagickBooleanType;
      //verbose : TMagickBooleanType;
      //view : Pchar;
      //authenticate : Pchar;
      //channel : TChannelType;
      //attributes : PImage;
      //options : pointer;
      //progress_monitor : TMagickProgressMonitor;
      //client_data : pointer;
      //cache : pointer;
      //stream : TStreamHandler;
      //file_ : PFILE;
      //blob : pointer;
      //length : Tsize_t;
      //magick : array[0..(MaxTextExtent)-1] of char;
      //unique : array[0..(MaxTextExtent)-1] of char;
      //zero : array[0..(MaxTextExtent)-1] of char;
      //filename : array[0..(MaxTextExtent)-1] of char;
      //debug : TMagickBooleanType;
      //tile : Pchar;
      //subimage : Tsize_t;
      //subrange : Tsize_t;
      //pen : TPixelPacket;
      //signature : Tsize_t;
      //virtual_pixel_method : TVirtualPixelMethod;
      //transparent_color : TPixelPacket;
      //profile : pointer;
      //synchronize : TMagickBooleanType;
    end;
  PImageInfo = ^TImageInfo;

function CatchImageException(para1:PImage):TExceptionType;cdecl;external libmagickcore;
function GetImageInfoFile(para1:PImageInfo):PFILE;cdecl;external libmagickcore;
function AcquireImage(para1:PImageInfo):PImage;cdecl;external libmagickcore;
function AppendImages(para1:PImage; para2:TMagickBooleanType; para3:PExceptionInfo):PImage;cdecl;external libmagickcore;
function CloneImage(para1:PImage; para2:Tsize_t; para3:Tsize_t; para4:TMagickBooleanType; para5:PExceptionInfo):PImage;cdecl;external libmagickcore;
function DestroyImage(para1:PImage):PImage;cdecl;external libmagickcore;
function GetImageClipMask(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external libmagickcore;
function GetImageMask(para1:PImage; para2:PExceptionInfo):PImage;cdecl;external libmagickcore;
function NewMagickImage(para1:PImageInfo; para2:Tsize_t; para3:Tsize_t; para4:PMagickPixelPacket):PImage;cdecl;external libmagickcore;
function ReferenceImage(para1:PImage):PImage;cdecl;external libmagickcore;
function SmushImages(para1:PImage; para2:TMagickBooleanType; para3:Tssize_t; para4:PExceptionInfo):PImage;cdecl;external libmagickcore;
function AcquireImageInfo:PImageInfo;cdecl;external libmagickcore;
function CloneImageInfo(para1:PImageInfo):PImageInfo;cdecl;external libmagickcore;
function DestroyImageInfo(para1:PImageInfo):PImageInfo;cdecl;external libmagickcore;
function ClipImage(para1:PImage):TMagickBooleanType;cdecl;external libmagickcore;
function ClipImagePath(para1:PImage; para2:Pchar; para3:TMagickBooleanType):TMagickBooleanType;cdecl;external libmagickcore;
function CopyImagePixels(para1:PImage; para2:PImage; para3:PRectangleInfo; para4:POffsetInfo; para5:PExceptionInfo):TMagickBooleanType;cdecl;external libmagickcore;
function IsTaintImage(para1:PImage):TMagickBooleanType;cdecl;external libmagickcore;
function IsMagickConflict(para1:Pchar):TMagickBooleanType;cdecl;external libmagickcore;
function IsHighDynamicRangeImage(para1:PImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagickcore;
function IsImageObject(para1:PImage):TMagickBooleanType;cdecl;external libmagickcore;
function ListMagickInfo(para1:PFILE; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagickcore;
function ModifyImage(para1:PPImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagickcore;
function ResetImagePage(para1:PImage; para2:Pchar):TMagickBooleanType;cdecl;external libmagickcore;
function ResetImagePixels(para1:PImage; para2:PExceptionInfo):TMagickBooleanType;cdecl;external libmagickcore;
function SetImageBackgroundColor(para1:PImage):TMagickBooleanType;cdecl;external libmagickcore;
function SetImageClipMask(para1:PImage; para2:PImage):TMagickBooleanType;cdecl;external libmagickcore;
function SetImageColor(para1:PImage; para2:PMagickPixelPacket):TMagickBooleanType;cdecl;external libmagickcore;
function SetImageExtent(para1:PImage; para2:Tsize_t; para3:Tsize_t):TMagickBooleanType;cdecl;external libmagickcore;
function SetImageInfo(para1:PImageInfo; para2:dword; para3:PExceptionInfo):TMagickBooleanType;cdecl;external libmagickcore;
function SetImageMask(para1:PImage; para2:PImage):TMagickBooleanType;cdecl;external libmagickcore;
function SetImageOpacity(para1:PImage; para2:TQuantum):TMagickBooleanType;cdecl;external libmagickcore;
function SetImageChannels(para1:PImage; para2:Tsize_t):TMagickBooleanType;cdecl;external libmagickcore;
function SetImageStorageClass(para1:PImage; para2:TClassType):TMagickBooleanType;cdecl;external libmagickcore;
function StripImage(para1:PImage):TMagickBooleanType;cdecl;external libmagickcore;
function SyncImage(para1:PImage):TMagickBooleanType;cdecl;external libmagickcore;
function SyncImageSettings(para1:PImageInfo; para2:PImage):TMagickBooleanType;cdecl;external libmagickcore;
function SyncImagesSettings(para1:PImageInfo; para2:PImage):TMagickBooleanType;cdecl;external libmagickcore;
function InterpretImageFilename(para1:PImageInfo; para2:PImage; para3:Pchar; para4:longint; para5:Pchar):Tsize_t;cdecl;external libmagickcore;
function GetImageReferenceCount(para1:PImage):Tssize_t;cdecl;external libmagickcore;
function GetImageChannels(para1:PImage):Tsize_t;cdecl;external libmagickcore;
function GetImageVirtualPixelMethod(para1:PImage):TVirtualPixelMethod;cdecl;external libmagickcore;
function SetImageVirtualPixelMethod(para1:PImage; para2:TVirtualPixelMethod):TVirtualPixelMethod;cdecl;external libmagickcore;
procedure AcquireNextImage(para1:PImageInfo; para2:PImage);cdecl;external libmagickcore;
procedure DestroyImagePixels(para1:PImage);cdecl;external libmagickcore;
procedure DisassociateImageStream(para1:PImage);cdecl;external libmagickcore;
procedure GetImageException(para1:PImage; para2:PExceptionInfo);cdecl;external libmagickcore;
procedure GetImageInfo(para1:PImageInfo);cdecl;external libmagickcore;
procedure SetImageInfoBlob(para1:PImageInfo; para2:pointer; para3:Tsize_t);cdecl;external libmagickcore;
procedure SetImageInfoFile(para1:PImageInfo; para2:PFILE);cdecl;external libmagickcore;

// === Konventiert am: 6-1-26 14:01:00 ===


implementation


end.
