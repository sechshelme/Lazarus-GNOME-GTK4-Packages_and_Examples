unit gst124;

interface

uses
  {$ifdef Linux}
  x, xlib,
  {$endif}
  glib280,
  Strings,
  ctypes;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

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
  libgstbasecamerabinsrc='libgstbasecamerabinsrc-1.0';
  libgsttranscoder = 'libgsttranscoder-1.0';
  libgsturidownloader = 'libgsturidownloader-1.0';
  libgstsctp = 'libgstsctp-1.0';
  libgstopencv = 'libgstopencv-1.0';
  libgstisoff = 'libgstisoff-1.0';
  {$endif}
  {$ifdef Windows}
  libgstreamer = 'gstreamer-1.0-0.dll';
  libgstpbutils = 'gstpbutils-1.0-0.dll';
  libgstaudio = 'gstaudio-1.0-0.dll';
  libgstbadaudio = 'gstbadaudio-1.0-0.dll';
  libgstvideo = 'gstvideo-1.0-0.dll';
  libgstbase = 'gstbase-1.0-0.dll';
  libgstallocators = 'gstallocators-1.0-0.dll';
  libgstanalytics = 'gstanalytics-1.0-0.dll';
  libgstcheck = 'gstcheck-1.0-0.dll';
  libgstphotography = 'gstphotography-1.0-0.dll';
  libgstmse = 'gstmse-1.0-0.dll';
  libgstinsertbin = 'gstinsertbin-1.0-0.dll';
  libgstwebrtc = 'gstwebrtc-1.0-0.dll';
  libgstwebrtcnice = 'gstwebrtcnice-1.0-0.dll';
  libgstsdp = 'gstsdp-1.0-o.dll';
  libgstmpegts = 'gstmpegts-1.0-0.dll';
  libgsttag = 'gsttag-1.0-0.dll';
  libgstfft = 'gstfft-1.0-0.dll';
  libgstcodecparsers = 'gstcodecparsers-1.0-0.dll';
  libgstcontroller = 'gstcontroller-1.0-0.dll';
  libgstrtp = 'gstrtp-1.0-0.dll';
  libgstrtsp = 'gstrtsp-1.0-0.dll';
  libgstwayland = 'lstwayland-1.0-0.dll';
  libgstva = 'gstva-1.0-0.dll';
  libgstplayer = 'gstplayer-1.0-0.dll';
  libgstgl = 'gstgl-1.0-.dll';
  libgstvulkan = 'gstvulkan-1.0-0.dll';
  libgstnet = 'gstnet-1.0-0.dll';
  libgstcuda = 'gstcuda-1.0-0.dll';
  libgstplay = 'gstplay-1.0-0.dll';
  libgstapp = 'gstapp-1.0-0.dll';
  libgstriff = 'gstriff-1.0-0.dll';
  libgstbasecamerabinsrc='gstbasecamerabinsrc-1.0-0.dll';
  libgsttranscoder = 'gsttranscoder-1.0-0.dll';
  libgsturidownloader = 'gsturidownloader-1.0-0.dll';
  libgstsctp = 'gstsctp-1.0-0.dll';
  libgstopencv = 'gstopencv-1.0-0.gll';
  libgstisoff = 'gstisoff-1.0-0.dll';
  {$endif}

  // ==== Externes;

type
  Ttimespec = record
    tv_sec: int64;
    tv_nsec: int64;
  end;

  // ===== gl.h

type
  Tptrdiff_t = PtrInt;

  PGLeglImageOES = ^TGLeglImageOES;
  TGLeglImageOES = Tgpointer;

  PGLchar = ^TGLchar;
  TGLchar = Tgchar;

  PGLsizeiptr = ^TGLsizeiptr;
  TGLsizeiptr = Tptrdiff_t;

  PGLintptr = ^TGLintptr;
  TGLintptr = Tptrdiff_t;

  PGLsync = ^TGLsync;
  TGLsync = Tgpointer;

  PGLuint64 = ^TGLuint64;
  TGLuint64 = Tguint64;

  PGLint64 = ^TGLint64;
  TGLint64 = Tgint64;

  {$ifdef Linux}
  // ==== xcb.h
  Txcb_connection_t = record
  end;
  Pxcb_connection_t = ^Txcb_connection_t;

  Txcb_window_t = TWindow;
  Pxcb_screen_t = PScreen;
  {$endif}


  // ==== wayland
  Twl_registry = record
  end;
  Pwl_registry = ^Twl_registry;

  Twl_shell = record
  end;
  Pwl_shell = ^Twl_shell;

  // ==== Vulkan
  TVkDevice = Pointer; // ?????
  TVkQueue = Pointer;
  TVkInstance = Pointer;
  TVkPhysicalDeviceProperties = Pointer;
  TVkPhysicalDeviceFeatures = Pointer;
  TVkPhysicalDeviceMemoryProperties = Pointer;
  TVkFence = Pointer;
  TVkSemaphore = Pointer;
  TVkCommandPool = Pointer;
  TVkCommandBuffer = Pointer;
  TVkCommandBufferLevel = Pointer;
  TVkImageLayout = Pointer;
  TVkImageSubresourceRange = Pointer;
  TVkImage = Pointer;
  TVkDeviceMemory = Pointer;
  TVkMemoryAllocateInfo = Pointer;
  TVkMemoryPropertyFlags = Pointer;
  TVkImageFormatProperties = Pointer;
  TVkImageView = Pointer;
  TVkFormat = Pointer;
  TVkImageTiling = Pointer;
  TVkVideoPictureResourceInfoKHR = Pointer;
  TVkVideoReferenceSlotInfoKHR = Pointer;
  TVkVideoDecodeInfoKHR = Pointer;
  TVkVideoProfileInfoKHR = Pointer;
  TVkVideoDecodeUsageInfoKHR = Pointer;
  TVkBaseInStructure = Pointer;
  TVkVideoDecodeH264ProfileInfoKHR = Pointer;
  TVkVideoDecodeH265ProfileInfoKHR = Pointer;
  TVkVideoCapabilitiesKHR = Pointer;
  TVkVideoDecodeH264CapabilitiesKHR = Pointer;
  TVkVideoDecodeH265CapabilitiesKHR = Pointer;
  TVkVideoDecodeH264SessionParametersCreateInfoKHR = Pointer;
  TVkVideoDecodeH265SessionParametersCreateInfoKHR = Pointer;
  TVkSamplerYcbcrRange = Pointer;
  TVkChromaLocation = Pointer;
  TVkDeviceSize = Pointer;
  TVkBuffer = Pointer;
  TVkBufferUsageFlags = Pointer;
  TVkResult = Pointer;
  TVkSurfaceKHR = Pointer;
  TVkDescriptorPool = Pointer;
  TVkDescriptorSet = Pointer;
  TVkBlendOp = Pointer;
  TVkBlendFactor = Pointer;
  TVkPhysicalDeviceType = Pointer;
  TVkMemoryHeapFlags = Pointer;
  TVkQueueFlags = Pointer;
  TVkSampleCountFlags = Pointer;
  TVkPresentModeKHR = Pointer;
  TVkQueryType = Pointer;
  TVkImageAspectFlags = Pointer;
  // ?????????????????????

  TVkQueueFlagBits = longint; // enum

  TVkPhysicalDevice = Pointer;
  PVkPhysicalDevice = ^TVkPhysicalDevice;

  TVkQueueFamilyProperties = Pointer;
  PVkQueueFamilyProperties = ^TVkQueueFamilyProperties;

  TGstVulkanQueueFamilyOps = Pointer;
  PGstVulkanQueueFamilyOps = ^TGstVulkanQueueFamilyOps;

  TVkMemoryRequirements = Pointer;
  PVkMemoryRequirements = ^TVkMemoryRequirements;

  TVkImageCreateInfo = Pointer;
  PVkImageCreateInfo = ^TVkImageCreateInfo;

  TVkImageViewCreateInfo = Pointer;
  PVkImageViewCreateInfo = ^TVkImageViewCreateInfo;

  TVkVideoFormatPropertiesKHR = Pointer;
  PVkVideoFormatPropertiesKHR = ^TVkVideoFormatPropertiesKHR;

  TVkBufferCreateInfo = Pointer;
  PVkBufferCreateInfo = ^TVkBufferCreateInfo;

  TVkImageUsageFlags = Pointer;
  PVkImageUsageFlags = ^TVkImageUsageFlags;

  // ==== va.h
type
  TVAGenericID = cuint;
  PVASurfaceID = ^TVASurfaceID;
  TVASurfaceID = TVAGenericID;

// ==== cuda
 TCUresult=LongInt; // enum

 TCUcontext=Pointer;
 PCUcontext=^TCUcontext;

 TCUdevice=Pointer;
 PCUdevice=^TCUdevice;

 TCUgraphicsResource=Pointer;
 PCUgraphicsResource=^TCUgraphicsResource;

 TCUstream=Pointer;
 PCUstream=^TCUstream;

 TCUfilter_mode=Pointer;
 PCUfilter_mode=^TCUfilter_mode;

 TCUtexObject=Pointer;
 PCUtexObject=^TCUtexObject;

 TCUdeviceptr=Pointer;
 PCUdeviceptr=^TCUdeviceptr;

 TCUmemAllocationProp=Pointer;
 PCUmemAllocationProp=^TCUmemAllocationProp;

 TCUgraphicsRegisterFlags=LongInt;
 TCUgraphicsMapResourceFlags=LongInt;
 TCUmemAllocationGranularity_flags=LongInt;


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

  TGstControlBindingPrivate = record
  end;
  PGstControlBindingPrivate = ^TGstControlBindingPrivate;

  PGstControlBinding = ^TGstControlBinding;

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

  TGstBufferPoolPrivate = record
  end;
  PGstBufferPoolPrivate = ^TGstBufferPoolPrivate;

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
  TGstStreamPrivate = record
  end;
  PGstStreamPrivate = ^TGstStreamPrivate;

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

  //typedef enum {
  //  GST_QUERY_UNKNOWN      = GST_QUERY_MAKE_TYPE (0, 0),
  //  GST_QUERY_POSITION     = GST_QUERY_MAKE_TYPE (10, _FLAG(BOTH)),
  //  GST_QUERY_DURATION     = GST_QUERY_MAKE_TYPE (20, _FLAG(BOTH)),
  //  GST_QUERY_LATENCY      = GST_QUERY_MAKE_TYPE (30, _FLAG(BOTH)),
  //  GST_QUERY_JITTER       = GST_QUERY_MAKE_TYPE (40, _FLAG(BOTH)),
  //  GST_QUERY_RATE         = GST_QUERY_MAKE_TYPE (50, _FLAG(BOTH)),
  //  GST_QUERY_SEEKING      = GST_QUERY_MAKE_TYPE (60, _FLAG(BOTH)),
  //  GST_QUERY_SEGMENT      = GST_QUERY_MAKE_TYPE (70, _FLAG(BOTH)),
  //  GST_QUERY_CONVERT      = GST_QUERY_MAKE_TYPE (80, _FLAG(BOTH)),
  //  GST_QUERY_FORMATS      = GST_QUERY_MAKE_TYPE (90, _FLAG(BOTH)),
  //  GST_QUERY_BUFFERING    = GST_QUERY_MAKE_TYPE (110, _FLAG(BOTH)),
  //  GST_QUERY_CUSTOM       = GST_QUERY_MAKE_TYPE (120, _FLAG(BOTH)),
  //  GST_QUERY_URI          = GST_QUERY_MAKE_TYPE (130, _FLAG(BOTH)),
  //  GST_QUERY_ALLOCATION   = GST_QUERY_MAKE_TYPE (140, _FLAG(DOWNSTREAM) | _FLAG(SERIALIZED)),
  //  GST_QUERY_SCHEDULING   = GST_QUERY_MAKE_TYPE (150, _FLAG(UPSTREAM)),
  //  GST_QUERY_ACCEPT_CAPS  = GST_QUERY_MAKE_TYPE (160, _FLAG(BOTH)),
  //  GST_QUERY_CAPS         = GST_QUERY_MAKE_TYPE (170, _FLAG(BOTH)),
  //  GST_QUERY_DRAIN        = GST_QUERY_MAKE_TYPE (180, _FLAG(DOWNSTREAM) | _FLAG(SERIALIZED)),
  //  GST_QUERY_CONTEXT      = GST_QUERY_MAKE_TYPE (190, _FLAG(BOTH)),
  //  GST_QUERY_BITRATE      = GST_QUERY_MAKE_TYPE (200, _FLAG(DOWNSTREAM)),
  //  GST_QUERY_SELECTABLE   = GST_QUERY_MAKE_TYPE (210, _FLAG(BOTH)),

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
  TGstElementFactory = record
  end;
  PGstElementFactory = ^TGstElementFactory;

  TGstDeviceProviderFactory = record
  end;
  PGstDeviceProviderFactory = ^TGstDeviceProviderFactory;

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
  {$include gst124_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include gst124_includes.inc}
{$UNDEF read_implementation}

end.
