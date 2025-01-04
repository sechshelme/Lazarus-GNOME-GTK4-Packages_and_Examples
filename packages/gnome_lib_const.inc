  // {$include ../gnome_lib_const.inc}

type  // muss wieder entfernt werden !!!!
  TJSCValue=Pointer;
  PJSCValue=Pointer;

  TJSCContext=Pointer   ;
    PJSCContext=Pointer;


  // ==== stdio
const
  {$IFDEF Linux}
  libc = 'c';
  {$ENDIF}

  {$IFDEF Windows}
  libc = 'msvcrt.dll';
  {$ENDIF}

  // Freetype2
const
  {$IFDEF Linux}
  freetype_lib = 'libfreetype';
  {$ENDIF}

  {$IFDEF Windows}
  freetype_lib = 'libfreetype-6.dll';
  {$ENDIF}

  // ==== Cairo
const
  {$IFDEF Linux}
  cairo_lib = 'libcairo';
  {$ENDIF}

  {$IFDEF Windows}
  cairo_lib = 'libcairo-2.dll';
  {$ENDIF}

  // ==== Pango
const
  {$IFDEF Linux}
  libpango = 'libpango-1.0';
  libpangocairo = 'libpangocairo-1.0';
  libpangoft2 = 'libpangoft2-1.0';
  libpangoxft = 'libpangoxft-1.0';  // Nur Linux
  {$ENDIF}

  {$IFDEF Windows}
  libpango = 'libpango-1.0-0.dll';
  libpangocairo = 'libpangocairo-1.0-0.dll';
  libpangoft2 = 'libpangoft2-1.0-0.dll';
  {$ENDIF}

  // ==== graphene
const
  {$IFDEF Linux}
  libgraphene = 'libgraphene-1.0';
  {$ENDIF}

  {$IFDEF Windows}
  libgraphene = 'libgraphene-1.0-0.dll';
  {$ENDIF}

  // ==== HarfBuzz
const
  {$IFDEF Linux}
  libharfbuzz = 'libharfbuzz';
  libharfbuzzsubset = 'libharfbuzz-subset';
  libharfbuzzcairo = 'libharfbuzz-cairo';
  libharfbuzzicu = 'libharfbuzz-icu';
  libharfbuzzgobject = 'libharfbuzz-gobject';
  {$ENDIF}

  {$IFDEF Windows}
  libharfbuzz = 'libharfbuzz-0.dll';
  libharfbuzzcairo = 'libharfbuzz-cairo-0.dll';
  libharfbuzzicu = 'libharfbuzz-icu-0.dll';
  libharfbuzzsubset = 'libharfbuzz-subset-0.dll';
  libharfbuzzgobject = 'libharfbuzz-gobject-0.dll';
  {$ENDIF}

  // ==== glib2
const
  {$IFDEF Linux}
  libglib2 = 'libglib-2.0';
  libgobject2_0 = 'libgobject-2.0';
  libgio2 = 'libgio-2.0';
  libgmodule = 'libgmodule-2.0';
  {$ENDIF}

  {$IFDEF Windows}
  libglib2 = 'libglib-2.0-0.dll';
  libgobject2_0 = 'libgobject-2.0-0.dll';
  libgio2 = 'libgio-2.0-0.dll';
  libgmodule = 'libgmodule-2.0-0.dll';
  {$ENDIF}

  // ==== gdk_pixbuf2
const
  {$IFDEF Linux}
  libgdk_pixbuf2 = 'libgdk_pixbuf-2.0';
  {$ENDIF}

  {$IFDEF Windows}
  libgdk_pixbuf2 = 'libgdk_pixbuf-2.0-0.dll';
  {$ENDIF}

  // ==== GTK4
const
  {$IFDEF Linux}
  libgtk4 = 'libgtk-4';
  {$ENDIF}

  {$IFDEF Windows}
  libgtk4 = 'libgtk-4-1.dll';
  {$ENDIF}

  // ==== webkit
const
  {$IFDEF Linux}
  libwebkit = 'webkitgtk-6.0';
  {$ENDIF}

  {$IFDEF Windows}
  libwebkit = 'webkitgtk-6.0.0.dll'; // ????????
  {$ENDIF}

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

  // ==== System
type
  Tfloat = cfloat;
  Tdouble = cdouble;

  Tuintptr_t = PtrUInt;

  Tptrdiff_t = PtrInt;

  Tsize_t = SizeUInt;
  Ttime_t = clong; // types.h
  Ptime_t = ^Ttime_t;

  //  TGPid = cint;
  //  PGPid = ^TGPid;

  Tva_list = Pointer;
  Pva_list = ^Tva_list;

  // /usr/include/x86_64-linux-gnu/bits/struct_stat.h
  Tstat = record
  end;
  PTstat = ^Tstat;

  // /usr/include/x86_64-linux-gnu/bits/types.h
  Tpid_t = cint;
  Tuid_t = cuint;

  //  /usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h
  TFILE = record
  end;
  PFILE = ^TFILE;

  //  /usr/include/x86_64-linux-gnu/bits/types/struct_tm.h
  Ttm = record
    tm_sec: cint;
    tm_min: cint;
    tm_hour: cint;
    tm_mday: cint;
    tm_mon: cint;
    tm_year: cint;
    tm_wday: cint;
    tm_yday: cint;
    tm_isdst: cint;
    tm_gmtoff: cint;
    tm_zone: pchar;
  end;
  Ptm = ^Ttm;

  // /usr/include/linux/time.h
type
  Ttimespec = record
    tv_sec: int64;
    tv_nsec: int64;
  end;

  // /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h
const
  __SIZEOF_PTHREAD_MUTEX_T = 40;

type
  Ppthread_mutex_t = ^Tpthread_mutex_t;
  Tpthread_mutex_t = record
    case longint of
      //        0 : ( __data : T_pthread_mutex_s );
      1: (__size: array[0..__SIZEOF_PTHREAD_MUTEX_T - 1] of char);
      2: (__align: culong);
  end;

  Tpthread_t = culong;

  // /usr/include/pwd.h
type
  Tpasswd = record
    pw_name: pchar;
    pw_passwd: pchar;
    pw_uid: cuint;
    pw_gid: cuint;
    pw_gecos: pchar;
    pw_dir: pchar;
    pw_shell: pchar;
  end;
  Ppasswd = ^Tpasswd;

  // ==== Xft
  {$ifdef linux}
  TXftDraw = record
  end;
  PXftDraw = ^TXftDraw;

  TXftFont = record
  end;
  PXftFont = ^TXftFont;

  TXTrapezoid = record
  end;
  PXTrapezoid = ^TXTrapezoid;

  TXftGlyphSpec = record
  end;
  PXftGlyphSpec = ^TXftGlyphSpec;

  TXftColor = record
  end;
  PXftColor = ^TXftColor;

  TPicture = TXID;
  PPicture = ^TPicture;
  {$endif}

  {$ifdef Linux}
  // ==== xcb.h
  Txcb_connection_t = record
  end;
  Pxcb_connection_t = ^Txcb_connection_t;

  Txcb_window_t = TWindow;
  Pxcb_screen_t = PScreen;
  {$endif}

  // ==== fontconfig
  // /usr/include/fontconfig/fontconfig.h
  TFcPattern = record
  end;
  PFcPattern = ^TFcPattern;

  TFcConfig = record
  end;
  PFcConfig = ^TFcConfig;

  TFcCharSet = record
  end;
  PFcCharSet = ^TFcCharSet;

  // ==== va
type
  // /usr/include/va/va.h
  TVAGenericID = cuint;
  PVASurfaceID = ^TVASurfaceID;
  TVASurfaceID = TVAGenericID;

  // /usr/include/libsoup-3.0/libsoup/soup-message-headers.h
  TSoupMessageHeaders = record
  end;
  PSoupMessageHeaders = ^TSoupMessageHeaders;

  TSoupCookie = record
  end;
  PSoupCookie = ^TSoupCookie;

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

  // ==== Wayland;
type
  Twl_surface = record
  end;
  Pwl_surface = ^Twl_surface;

  Twl_seat = record
  end;
  Pwl_seat = ^Twl_seat;

  Twl_output = record
  end;
  Pwl_output = ^Twl_output;

  Twl_display = record
  end;
  Pwl_display = ^Twl_display;

  Twl_compositor = record
  end;
  Pwl_compositor = ^Twl_compositor;

  Twl_pointer = record
  end;
  Pwl_pointer = ^Twl_pointer;

  Twl_keyboard = record
  end;
  Pwl_keyboard = ^Twl_keyboard;

  Txkb_keymap = record
  end;
  Pxkb_keymap = ^Txkb_keymap;

  Twl_shm_format = record
  end;
  Pwl_shm_format = ^Twl_shm_format;

  Twl_callback_listener = record
  end;
  Pwl_callback_listener = ^Twl_callback_listener;

  Twl_callback = record
  end;
  Pwl_callback = ^Twl_callback;
  PPwl_callback = ^Pwl_callback;

  Twl_event_queue = record
  end;
  Pwl_event_queue = ^Twl_event_queue;

  Twl_subcompositor = record
  end;
  Pwl_subcompositor = ^Twl_subcompositor;

  Twl_shm = record
  end;
  Pwl_shm = ^Twl_shm;

  Twl_subsurface = record
  end;
  Pwl_subsurface = ^Twl_subsurface;

  Twl_buffer = record
  end;
  Pwl_buffer = ^Twl_buffer;

  Txdg_wm_base = record
  end;
  Pxdg_wm_base = ^Txdg_wm_base;

  Tzwp_fullscreen_shell_v1 = record
  end;
  Pzwp_fullscreen_shell_v1 = ^Tzwp_fullscreen_shell_v1;

  Twp_viewporter = record
  end;
  Pwp_viewporter = ^Twp_viewporter;

  Tzwp_linux_dmabuf_v1 = record
  end;
  Pzwp_linux_dmabuf_v1 = ^Tzwp_linux_dmabuf_v1;

  Twp_single_pixel_buffer_manager_v1 = record
  end;
  Pwp_single_pixel_buffer_manager_v1 = ^Twp_single_pixel_buffer_manager_v1;

  Twl_registry = record
  end;
  Pwl_registry = ^Twl_registry;

  Twl_shell = record
  end;
  Pwl_shell = ^Twl_shell;

  // ==== unicode
type
  // /usr/include/unicode/uscript.h
  TUScriptCode = longint;

  // ==== graphite2
  // /usr/include/graphite2/Font.h
  Tgr_face = record
  end;
  Pgr_face = ^Tgr_face;

  Tgr_font = record
  end;
  Pgr_font = ^Tgr_font;

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


  // ==== Windows
  {$ifdef windows}
type
  PID3D11Resource = Pointer;
  {$endif}
