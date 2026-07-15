unit fp_gst;

interface

uses
  {$ifdef Linux}
  x, xlib,
  {$endif}
  fp_glib2;


// === Muss bearbeitet werden
const
GST_VIDEO_MAX_PLANES = 4;


type
  TGstVideoChromaSite=Integer;
//   // gts video
//   TGstVideoAggregator=Pointer;  // ??????  gst_video         gstvideoaggregator.h
//   TGstVideoAggregatorClass=Pointer;  // ??????  gst_video         gstvideoaggregator.h
//   TGstVideoAggregatorPad=Pointer;  // ??????  gst_video         gstvideoaggregator.h
//     TGstVideoAggregatorPadClass=Pointer;  // ??????  gst_video         gstvideoaggregator.h
//     PGstVideoInfo =^TGstVideoInfo;
//     TGstVideoInfo=Integer;
//     TGstVideoFormat=Integer;
//     TGstVideoAlignment=Integer;
//     TGstVideoMultiviewMode=Integer;
//     TGstVideoMultiviewFlags=Integer;
//     PGstVideoAlignment=Pointer;
//     PGstVideoAffineTransformationMeta=Pointer;
//     PGstVideoInfoDmaDrm=Pointer;

  // ===============

const
  {$ifdef Linux}
  libgstreamer = 'libgstreamer-1.0';
  libgstpbutils = 'libgstpbutils-1.0';
  libgstaudio = 'libgstaudio-1.0';
  libgstbadaudio = 'libgstbadaudio-1.0';
  libgstvideo = 'libgstvideo-1.0';
  libgstbase = 'libgstbase-1.0';
  libgstallocators = 'libgstallocators-1.0';
  libgstanalytics = 'libgstanalytics-1.0';
  libgstcheck = 'libgstcheck-1.0';
  libgstphotography = 'libgstphotography-1.0';
  libgstmse = 'libgstmse-1.0';
  libgstinsertbin = 'libgstinsertbin-1.0';
  libgstwebrtc = 'libgstwebrtc-1.0';
  libgstwebrtcnice = 'libgstwebrtcnice-1.0';
  libgstsdp = 'libgstsdp-1.0';
  libgstmpegts = 'libgstmpegts-1.0';
  libgsttag = 'libgsttag-1.0';
  libgstfft = 'libgstfft-1.0';
  libgstcodecparsers = 'libgstcodecparsers-1.0';
  libgstcontroller = 'libgstcontroller-1.0';
  libgstrtp = 'libgstrtp-1.0';
  libgstrtsp = 'libgstrtsp-1.0';
  libgstwayland = 'libgstwayland-1.0';
  libgstva = 'libgstva-1.0';
  libgstplayer = 'libgstplayer-1.0';
  libgstgl = 'libgstgl-1.0';
  libgstvulkan = 'libgstvulkan-1.0';
  libgstnet = 'libgstnet-1.0';
  libgstcuda = 'libgstcuda-1.0';
  libgstplay = 'libgstplay-1.0';
  libgstapp = 'libgstapp-1.0';
  libgstriff = 'libgstriff-1.0';
  libgstbasecamerabinsrc = 'libgstbasecamerabinsrc-1.0';
  libgsttranscoder = 'libgsttranscoder-1.0';
  libgsturidownloader = 'libgsturidownloader-1.0';
  libgstsctp = 'libgstsctp-1.0';
  libgstopencv = 'libgstopencv-1.0';
  libgstisoff = 'libgstisoff-1.0';

  libges = 'libges-1.0';
  {$endif}

  {$ifdef Windows}
  libgstreamer = 'libgstreamer-1.0-0.dll';
  libgstpbutils = 'libgstpbutils-1.0-0.dll';
  libgstaudio = 'libgstaudio-1.0-0.dll';
  libgstbadaudio = 'libgstbadaudio-1.0-0.dll';
  libgstvideo = 'libgstvideo-1.0-0.dll';
  libgstbase = 'libgstbase-1.0-0.dll';
  libgstallocators = 'libgstallocators-1.0-0.dll';
  libgstanalytics = 'libgstanalytics-1.0-0.dll';
  libgstcheck = 'libgstcheck-1.0-0.dll';
  libgstphotography = 'libgstphotography-1.0-0.dll';
  libgstmse = 'libgstmse-1.0-0.dll';
  libgstinsertbin = 'libgstinsertbin-1.0-0.dll';
  libgstwebrtc = 'libgstwebrtc-1.0-0.dll';
  libgstwebrtcnice = 'libgstwebrtcnice-1.0-0.dll';
  libgstsdp = 'libgstsdp-1.0-o.dll';
  libgstmpegts = 'libgstmpegts-1.0-0.dll';
  libgsttag = 'libgsttag-1.0-0.dll';
  libgstfft = 'libgstfft-1.0-0.dll';
  libgstcodecparsers = 'libgstcodecparsers-1.0-0.dll';
  libgstcontroller = 'libgstcontroller-1.0-0.dll';
  libgstrtp = 'libgstrtp-1.0-0.dll';
  libgstrtsp = 'libgstrtsp-1.0-0.dll';
  libgstwayland = 'liblstwayland-1.0-0.dll';
  libgstva = 'libgstva-1.0-0.dll';
  libgstplayer = 'libgstplayer-1.0-0.dll';
  libgstgl = 'libgstgl-1.0-.dll';
  libgstvulkan = 'libgstvulkan-1.0-0.dll';
  libgstnet = 'libgstnet-1.0-0.dll';
  libgstcuda = 'libgstcuda-1.0-0.dll';
  libgstplay = 'libgstplay-1.0-0.dll';
  libgstapp = 'libgstapp-1.0-0.dll';
  libgstriff = 'libgstriff-1.0-0.dll';
  libgstbasecamerabinsrc = 'libgstbasecamerabinsrc-1.0-0.dll';
  libgsttranscoder = 'libgsttranscoder-1.0-0.dll';
  libgsturidownloader = 'libgsturidownloader-1.0-0.dll';
  libgstsctp = 'libgstsctp-1.0-0.dll';
  libgstopencv = 'libgstopencv-1.0-0.gll';
  libgstisoff = 'libgstisoff-1.0-0.dll';

  libges = 'libges-1.0-0.dll';
  {$endif}

type
  Tuintptr_t = PtrUInt;
  Puintptr_t = ^Tuintptr_t;
  Tptrdiff_t = PtrInt;

  {$ifdef Linux}
  // ==== xcb.h
type
  Pxcb_connection_t = type Pointer;
  Txcb_window_t = TWindow;
  Pxcb_screen_t = PScreen;
  {$endif}

  // ==== OpenGL
type
  TGLeglImageOES = pointer;
  PGLeglImageOES = ^TGLeglImageOES;

  TGLchar = byte;
  PGLchar = ^TGLchar;

  TGLsizeiptr = Tptrdiff_t;
  PGLsizeiptr = ^TGLsizeiptr;

  TGLintptr = Tptrdiff_t;
  PGLintptr = ^TGLintptr;

  TGLsync = pointer;
  PGLsync = ^TGLsync;

  TGLint =LongInt;
  PGLint=^TGLint;

  TGLuint =UInt32;
  PGLuint=^TGLuint;

  TGLuint64 = uint64;
  PGLuint64 = ^TGLuint64;

  TGLint64 = int64;
  PGLint64 = ^TGLint64;

  TGLenum = Longint;
  PGLenum = ^TGLenum;

  TGLsizei = LongInt;
  PGLsizei=^TGLsizei;

  // /usr/include/KHR/khrplatform.h
  Tkhronos_int32_t = int32;
  // /usr/include/EGL/eglplatform.h
  TEGLint = Tkhronos_int32_t;

  // ==== Windows
  {$ifdef windows}
type
  PID3D11Resource = Pointer;
  {$endif}



  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_enum}
  {$include fp_gst_includes.inc}
  {$UNDEF read_enum}

  {$DEFINE read_struct}
  {$include fp_gst_includes.inc}
  {$UNDEF read_struct}

  {$DEFINE read_function}
  {$include fp_gst_includes.inc}
  {$UNDEF read_function}


implementation

{$DEFINE read_implementation}
{$include fp_gst_includes.inc}
{$UNDEF read_implementation}

end.
