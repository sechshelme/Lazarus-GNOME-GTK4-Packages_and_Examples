unit fp_gst;

interface

uses
  {$ifdef Linux}
  x, xlib,
  {$endif}
  fp_glib2,
  ctypes;

  // ==== gstreamer
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
  Tptrdiff_t = PtrInt;

  {$ifdef Linux}
  // ==== xcb.h
type
  Pxcb_connection_t = type Pointer;
  Txcb_window_t = TWindow;
  Pxcb_screen_t = PScreen;
  {$endif}

  // ==== va
type
  // /usr/include/va/va.h
  TVAGenericID = cuint;
  PVASurfaceID = ^TVASurfaceID;
  TVASurfaceID = TVAGenericID;

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

  TGLuint64 = uint64;
  PGLuint64 = ^TGLuint64;

  TGLint64 = int64;
  PGLint64 = ^TGLint64;

  // /usr/include/KHR/khrplatform.h
  Tkhronos_int32_t = int32;
  // /usr/include/EGL/eglplatform.h
  TEGLint = Tkhronos_int32_t;

  // ==== Vulkan
  // /usr/include/vulkan/vulkan_core.h
  TVkDeviceSize = uint64;

  TVkFlags = uint32;
  TVkMemoryPropertyFlags = TVkFlags;
  TVkBufferUsageFlags = TVkFlags;
  TVkMemoryHeapFlags = TVkFlags;
  TVkQueueFlags = TVkFlags;
  TVkSampleCountFlags = TVkFlags;
  TVkImageAspectFlags = TVkFlags;
  TVkImageUsageFlags = TVkFlags;
  PVkImageUsageFlags = ^TVkImageUsageFlags;

  TVkCommandBufferLevel = longint;           // enum
  TVkImageLayout = longint;                  // enum
  TVkFormat = longint;                       // enum
  TVkImageTiling = longint;                  // enum
  TVkSamplerYcbcrRange = longint;            // enum
  TVkChromaLocation = longint;               // enum
  TVkResult = longint;                       // enum
  TVkBlendOp = longint;                      // enum
  TVkBlendFactor = longint;                  // enum
  TVkPhysicalDeviceType = longint;           // enum
  TVkPresentModeKHR = longint;               // enum
  TVkQueryType = longint;                    // enum
  TVkQueueFlagBits = LongInt;                // enum

  // mit Vorsicht verwenden !
  TVkDevice = Pointer;                       // ????
  TVkQueue = Pointer;                        // ????
  TVkInstance = Pointer;                     // ????
  TVkFence = Pointer;                        // ????
  TVkSemaphore = Pointer;                    // ????
  TVkCommandPool = Pointer;                  // ????
  TVkCommandBuffer = Pointer;                // ????
  TVkImage = Pointer;                        // ????
  TVkDeviceMemory = Pointer;                 // ????
  TVkImageView = Pointer;                    // ????
  TVkBuffer = Pointer;                       // ????
  TVkSurfaceKHR = Pointer;                   // ????
  TVkDescriptorPool = Pointer;               // ????
  TVkDescriptorSet = Pointer;                // ????
  TVkPhysicalDevice = Pointer;               // ????
  PVkPhysicalDevice = ^TVkPhysicalDevice;

  PVkQueueFamilyProperties = type Pointer;
  TVkPhysicalDeviceProperties = Pointer;                        // struct
  TVkPhysicalDeviceFeatures = Pointer;                          // struct
  TVkPhysicalDeviceMemoryProperties = Pointer;                  // struct
  TVkImageSubresourceRange = Pointer;                           // struct
  TVkMemoryAllocateInfo = Pointer;                              // struct
  TVkImageFormatProperties = Pointer;                           // struct
  TVkVideoPictureResourceInfoKHR = Pointer;                     // struct
  TVkVideoReferenceSlotInfoKHR = Pointer;                       // struct
  TVkVideoDecodeInfoKHR = Pointer;                              // struct
  TVkVideoProfileInfoKHR = Pointer;                             // struct
  TVkVideoDecodeUsageInfoKHR = Pointer;                         // struct
  TVkBaseInStructure = Pointer;                                 // struct
  TVkVideoDecodeH264ProfileInfoKHR = Pointer;                   // struct
  TVkVideoDecodeH265ProfileInfoKHR = Pointer;                   // struct
  TVkVideoCapabilitiesKHR = Pointer;                            // struct
  TVkVideoDecodeH264CapabilitiesKHR = Pointer;                  // struct
  TVkVideoDecodeH265CapabilitiesKHR = Pointer;                  // struct
  TVkVideoDecodeH264SessionParametersCreateInfoKHR = Pointer;   // struct
  TVkVideoDecodeH265SessionParametersCreateInfoKHR = Pointer;   // struct
  TVkMemoryRequirements = Pointer;                              // struct
  PVkMemoryRequirements = ^TVkMemoryRequirements;
  TVkImageCreateInfo = Pointer;                                 // struct
  PVkImageCreateInfo = ^TVkImageCreateInfo;
  TVkImageViewCreateInfo = Pointer;                             // struct
  PVkImageViewCreateInfo = ^TVkImageViewCreateInfo;
  TVkVideoFormatPropertiesKHR = Pointer;                        // struct
  PVkVideoFormatPropertiesKHR = ^TVkVideoFormatPropertiesKHR;
  TVkBufferCreateInfo = Pointer;                                // struct
  PVkBufferCreateInfo = ^TVkBufferCreateInfo;

  // ==== Windows
  {$ifdef windows}
type
  PID3D11Resource = Pointer;
  {$endif}



  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // ==== cuda
type
  TCUresult = longint; // enum

  TCUcontext = Pointer;
  PCUcontext = ^TCUcontext;

  TCUdevice = Pointer;
  PCUdevice = ^TCUdevice;

  TCUgraphicsResource = Pointer;
  PCUgraphicsResource = ^TCUgraphicsResource;

  TCUstream = Pointer;
  PCUstream = ^TCUstream;

  TCUfilter_mode = Pointer;
  PCUfilter_mode = ^TCUfilter_mode;

  TCUtexObject = Pointer;
  PCUtexObject = ^TCUtexObject;

  TCUdeviceptr = Pointer;
  PCUdeviceptr = ^TCUdeviceptr;

  TCUmemAllocationProp = Pointer;
  PCUmemAllocationProp = ^TCUmemAllocationProp;

  TCUgraphicsRegisterFlags = longint;
  TCUgraphicsMapResourceFlags = longint;
  TCUmemAllocationGranularity_flags = longint;


  // === GST
const
  GST_PADDING = 4;

type
  PGstClockTime = ^TGstClockTime;
  TGstClockTime = Tguint64;

type
  PGstObject = ^TGstObject;

  TGstObject = record
    obj: TGInitiallyUnowned;
    lock: TGMutex;
    Name: Pgchar;
    parent: PGstObject;
    flags: Tguint32;
    control_bindings: PGList;
    control_rate: Tguint64;
    last_sync: Tguint64;
    _gst_reserved: Tgpointer;
  end;
  PPGstObject = ^PGstObject;

  PGstControlBindingPrivate = type Pointer;

  TGstControlBinding = record
    parent: TGstObject;
    Name: Pgchar;
    pspec: PGParamSpec;
    obj: PGstObject;
    __object: Tgpointer;
    disabled: Tgboolean;
    ABI: record
      case longint of
        0: (abi: record
            priv: PGstControlBindingPrivate;
            end);
        1: (_gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer);
      end;
  end;
  PGstControlBinding = ^TGstControlBinding;

  PGstBufferPoolPrivate = type Pointer;

  TGstBufferPool = record
    obj: TGstObject;
    flushing: Tgint;
    priv: PGstBufferPoolPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstBufferPool = ^TGstBufferPool;
  PPGstBufferPool = ^PGstBufferPool;

type
  PGstMiniObject = ^TGstMiniObject;
  PPGstMiniObject = ^PGstMiniObject;

  PGstMiniObjectCopyFunction = ^TGstMiniObjectCopyFunction;
  TGstMiniObjectCopyFunction = function(obj: PGstMiniObject): PGstMiniObject; cdecl;
  TGstMiniObjectDisposeFunction = function(obj: PGstMiniObject): Tgboolean; cdecl;
  TGstMiniObjectFreeFunction = procedure(obj: PGstMiniObject); cdecl;
  TGstMiniObjectNotify = procedure(user_data: Tgpointer; obj: PGstMiniObject); cdecl;

  TGstMiniObject = record
    _type: TGType;
    refcount: Tgint;
    lockstate: Tgint;
    flags: Tguint;
    copy: TGstMiniObjectCopyFunction;
    _dispose: TGstMiniObjectDisposeFunction;
    Free: TGstMiniObjectFreeFunction;
    priv_uint: Tguint;
    priv_pointer: Tgpointer;
  end;

type
  TGstBuffer = record
    mini_object: TGstMiniObject;
    pool: PGstBufferPool;
    pts: TGstClockTime;
    dts: TGstClockTime;
    duration: TGstClockTime;
    offset: Tguint64;
    offset_end: Tguint64;
  end;
  PGstBuffer = ^TGstBuffer;
  PPGstBuffer = ^PGstBuffer;

type
  PGstPadDirection = ^TGstPadDirection;
  TGstPadDirection = longint;

const
  GST_PAD_UNKNOWN = 0;
  GST_PAD_SRC = 1;
  GST_PAD_SINK = 2;

type
  PGstStreamPrivate = type Pointer;

  TGstStream = record
    obj: TGstObject;
    stream_id: Pgchar;
    priv: PGstStreamPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstStream = ^TGstStream;
  PPGstStream = ^PGstStream;

const
  GST_QUERY_TYPE_UPSTREAM = 1 shl 0;
  GST_QUERY_TYPE_DOWNSTREAM = 1 shl 1;
  GST_QUERY_TYPE_SERIALIZED = 1 shl 2;

const
  GST_QUERY_NUM_SHIFT = 8;

type
  PGstQueryType = ^TGstQueryType;
  TGstQueryType = longint;

const
  GST_QUERY_UNKNOWN = 0 shl (GST_QUERY_NUM_SHIFT or 0);
  GST_QUERY_POSITION = 10 shl (GST_QUERY_NUM_SHIFT or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_DURATION = 20 shl (GST_QUERY_NUM_SHIFT or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_LATENCY = 30 shl (GST_QUERY_NUM_SHIFT or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_JITTER = 40 shl (GST_QUERY_NUM_SHIFT or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_RATE = 50 shl (GST_QUERY_NUM_SHIFT or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_SEEKING = 60 shl (GST_QUERY_NUM_SHIFT or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_SEGMENT = 70 shl (GST_QUERY_NUM_SHIFT or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_CONVERT = 80 shl (GST_QUERY_NUM_SHIFT or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_FORMATS = 90 shl (GST_QUERY_NUM_SHIFT or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_BUFFERING = 110 shl (GST_QUERY_NUM_SHIFT or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_CUSTOM = 120 shl (GST_QUERY_NUM_SHIFT or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_URI = 130 shl (GST_QUERY_NUM_SHIFT or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_ALLOCATION = 140 shl (GST_QUERY_NUM_SHIFT or GST_QUERY_TYPE_DOWNSTREAM or GST_QUERY_TYPE_SERIALIZED);
  GST_QUERY_SCHEDULING = 150 shl (GST_QUERY_NUM_SHIFT or GST_QUERY_TYPE_UPSTREAM);
  GST_QUERY_ACCEPT_CAPS = 160 shl (GST_QUERY_NUM_SHIFT or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_CAPS = 170 shl (GST_QUERY_NUM_SHIFT or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_DRAIN = 180 shl (GST_QUERY_NUM_SHIFT or GST_QUERY_TYPE_DOWNSTREAM or GST_QUERY_TYPE_SERIALIZED);
  GST_QUERY_CONTEXT = 190 shl (GST_QUERY_NUM_SHIFT or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_BITRATE = 200 shl (GST_QUERY_NUM_SHIFT or GST_QUERY_TYPE_DOWNSTREAM);
  GST_QUERY_SELECTABLE = 210 shl (GST_QUERY_NUM_SHIFT or GST_QUERY_TYPE_UPSTREAM or GST_QUERY_TYPE_DOWNSTREAM);

type
  TGstQuery = record
    mini_object: TGstMiniObject;
    _type: TGstQueryType;
  end;
  PGstQuery = ^TGstQuery;
  PPGstQuery = ^PGstQuery;

type
  PGstElementFactory = type Pointer;
  PGstDeviceProviderFactory = type Pointer;

  // video/video_chroma
type
  PGstVideoChromaSite = ^TGstVideoChromaSite;
  TGstVideoChromaSite = longint;

const
  GST_VIDEO_CHROMA_SITE_UNKNOWN = 0;
  GST_VIDEO_CHROMA_SITE_NONE = 1 shl 0;
  GST_VIDEO_CHROMA_SITE_H_COSITED = 1 shl 1;
  GST_VIDEO_CHROMA_SITE_V_COSITED = 1 shl 2;
  GST_VIDEO_CHROMA_SITE_ALT_LINE = 1 shl 3;
  GST_VIDEO_CHROMA_SITE_COSITED = GST_VIDEO_CHROMA_SITE_H_COSITED or GST_VIDEO_CHROMA_SITE_V_COSITED;
  GST_VIDEO_CHROMA_SITE_JPEG = GST_VIDEO_CHROMA_SITE_NONE;
  GST_VIDEO_CHROMA_SITE_MPEG2 = GST_VIDEO_CHROMA_SITE_H_COSITED;
  GST_VIDEO_CHROMA_SITE_DV = GST_VIDEO_CHROMA_SITE_COSITED or GST_VIDEO_CHROMA_SITE_ALT_LINE;


  {$DEFINE read_interface}
  {$include fp_gst_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_gst_includes.inc}
{$UNDEF read_implementation}

end.
