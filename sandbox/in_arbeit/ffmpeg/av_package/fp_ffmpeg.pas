unit fp_ffmpeg;

interface

const
  {$IFDEF Linux}
  libavformat = 'avformat';
  libavutil = 'avutil';
  libavcodec = 'avcodec';
  libavfilter = 'avfilter';
  libavdevice = 'avdevice';
  libswscale='swscale';
  libswresample='swresample';
  libpostproc='postproc';

  {$ENDIF}

  {$IFDEF Windows}
  libavformat = 'avformat.dll';  // ????
  libavformat = 'avutil.dll';  // ????
  {$ENDIF}

type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  PPuint8_t = ^Puint8_t;
  PPPuint8_t = ^PPuint8_t;
  Tuint16_t = uint16;
  Puint16_t = ^Tuint16_t;
  PPuint16_t = ^Puint16_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;
  PPuint32_t = ^Puint32_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;
  PPuint64_t = ^Puint64_t;

  Tint8_t = int8;
  Pint8_t = ^Tint8_t;
  PPint8_t = ^Pint8_t;
  Tint16_t = int16;
  Pint16_t = ^Tint16_t;
  PPint16_t = ^Pint16_t;
  Tint32_t = int32;
  Pint32_t = ^Tint32_t;
  PPint32_t = ^Pint32_t;
  Tint64_t = int64;
  Pint64_t = ^Tint64_t;
  PPint64_t = ^Pint64_t;

  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  Tptrdiff_t = SizeInt;
  Pptrdiff_t = ^Tptrdiff_t;

  Ptm = type Pointer;
  Tva_list = type Pointer; // ????
  Ttime_t = int64;
  PFILE = type Pointer;

type // Vulkan
  PVkFormat = type Pointer;

type // /usr/include/X11/extensions/XvMC.h
  PXvMCMacroBlock = type Pointer;
  PXvMCSurface = type Pointer;

type // nicht auffindbar
  PAVMurMur3 = type Pointer;
  TCFStringRef = longint;
  TCVPixelBufferRef = longint;
  PVdpPictureInfo = type Pointer;
  PVdpBitstreamBuffer = type Pointer;
  TVdpDevice = longint;
  PVdpGetProcAddress = type Pointer;
  PVdpChromaType = type Pointer;

  {$DEFINE read_interface}
  {$include fp_avutil_includes.inc}
  {$include fp_codec_includes.inc}
  {$include fp_avformat_includes.inc}
  {$include fp_avfilter_includes.inc}
  {$include fp_avdevice_includes.inc}
  {$include fp_swscale_includes.inc}
  {$include fp_swresample_includes.inc}
  {$include fp_postproc_includes.inc}
//  {$include fp_avc1394_includes.inc}  // nicht gebunden
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_avutil_includes.inc}
{$include fp_codec_includes.inc}
{$include fp_avformat_includes.inc}
{$include fp_avfilter_includes.inc}
{$include fp_avdevice_includes.inc}
{$include fp_swscale_includes.inc}
{$include fp_swresample_includes.inc}
{$include fp_postproc_includes.inc}
// {$include fp_avc1394_includes.inc}
{$UNDEF read_implementation}

end.
