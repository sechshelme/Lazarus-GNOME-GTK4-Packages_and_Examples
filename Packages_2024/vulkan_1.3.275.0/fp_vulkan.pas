unit fp_vulkan;

interface

const
  {$IFDEF Linux}
  libvulkan = 'vulkan';
  {$ENDIF}

  {$IFDEF Windows}
  libvulkan = 'vulkan-1.dll';
  {$ENDIF}


type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  PPuint8_t = ^Puint8_t;
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

  Tuintptr_t = PtrInt;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TLUID = int64;
  PMirConnection = Pointer;
  PMirSurface = Pointer;
  Pwl_display = Pointer;
  Pwl_surface = Pointer;
  THINSTANCE = Pointer;
  THWND = Pointer;
  TLPCWSTR = Pointer;
  PSECURITY_ATTRIBUTES = Pointer;
  TDWORD = DWord;
  THANDLE = longint;
  PHANDLE = ^THANDLE;
  THMONITOR = longint;
  Pxcb_connection_t = Pointer;
  Txcb_window_t = longint;
  PDisplay = Pointer;
  TWindow = longint;
  PIDirectFB = Pointer;
  PIDirectFBSurface = Pointer;
  PANativeWindow = Pointer;
  TGgpStreamDescriptor = uint32;
  PCAMetalLayer = Pointer;
  Pscreen_context = Pointer;
  Pscreen_window = Pointer;
  Tzx_handle_t = longint;
  Pzx_handle_t = ^Tzx_handle_t;
  PVkBufferCollectionFUCHSIA = Pointer;
  TGgpFrameToken = Pointer;
  P_IOSurface = Pointer;
  Pscreen_buffer = Pointer;
  Txcb_visualid_t = longint;
  TVisualID = longint;
  TRROutput = longint;


  // /usr/include/vk_video/vulkan_video_codec_h???std.h
type
  TStdVideoH264LevelIdc = longint; // enum
  TStdVideoH264ProfileIdc = longint; // enum
  TStdVideoH265LevelIdc = longint; // emunm
  TStdVideoH265ProfileIdc = longint; // emunm
  PStdVideoH264SequenceParameterSet = type Pointer;
  PStdVideoH264PictureParameterSet = type Pointer;
  PStdVideoH265VideoParameterSet = type Pointer;
  PStdVideoH265SequenceParameterSet = type Pointer;
  PStdVideoH265PictureParameterSet = type Pointer;
  PStdVideoEncodeH265SliceSegmentHeader = type Pointer;

  // /usr/include/vk_video/vulkan_video_codec_h???std_encode.h
type
  PStdVideoEncodeH264SliceHeader = type Pointer;
  PStdVideoEncodeH264PictureInfo = type Pointer;
  PStdVideoEncodeH264ReferenceInfo = type Pointer;
  PStdVideoEncodeH265PictureInfo = type Pointer;
  PStdVideoEncodeH265ReferenceInfo = type Pointer;

  // /usr/include/vk_video/vulkan_video_codec_h???std_decode.h
type
  PStdVideoDecodeH264PictureInfo = type Pointer;
  PStdVideoDecodeH264ReferenceInfo = type Pointer;
  PStdVideoDecodeH265PictureInfo = type Pointer;
  PStdVideoDecodeH265ReferenceInfo = type Pointer;

  {$DEFINE read_interface}
  {$include fp_vulkan_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_vulkan_includes.inc}
{$UNDEF read_implementation}

end.
