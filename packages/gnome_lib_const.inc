  // {$include ../gnome_lib_const.inc}

  // ==== stdio
const
  {$IFDEF Linux}
  libc = 'c';
  {$ENDIF}

  {$IFDEF Windows}
  libc = 'msvcrt.dll';
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

type
  Tfloat = cfloat;
  Tdouble = cdouble;

  Tuintptr_t = PtrUInt;

  Tptrdiff_t = PtrInt;

  Tuint8_t = uint8;
  Tuint16_t = uint16;
  Tuint32_t = uint32;
  Tuint64_t = uint64;

  Tsize_t = SizeUInt;
  Ttime_t = clong; // types.h
  Ptime_t = ^Ttime_t;

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

  // Signal Handler für g_unix_signal
const
  SIGHUP = 1;    // Hangup: Terminal/Session geschlossen
  SIGINT = 2;    // Interrupt: z.B. Ctrl+C
  SIGQUIT = 3;   // Quit: z.B. Ctrl+\
  SIGILL = 4;    // Illegal Instruction
  SIGABRT = 6;   // Abort: z.B. durch abort()
  SIGFPE = 8;    // Floating Point Exception, z.B. Division durch 0
  SIGKILL = 9;   // Kill: Beenden, nicht abfangbar!
  SIGSEGV = 11;  // Segmentation Fault
  SIGPIPE = 13;  // Broken Pipe
  SIGALRM = 14;  // Alarm Clock: Zeitgeber, Timer
  SIGTERM = 15;  // Termination: Standard-Abbruchsignal
  SIGUSR1 = 10;  // User-defined Signal 1
  SIGUSR2 = 12;  // User-defined Signal 2
  SIGCHLD = 17;  // Child stopped or terminated
  SIGCONT = 18;  // Continue
  SIGSTOP = 19;  // Stop: Prozess anhalten, nicht abfangbar
  SIGTSTP = 20;  // Terminal Stop: z.B. Ctrl+Z
  SIGTTIN = 21;  // Hintergrundprozess will von Terminal lesen
  SIGTTOU = 22;  // Hintergrundprozess will auf Terminal schreiben


  // ==== Xft
type
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
  TSoupMessageHeaders = record  // wird in webkit gebraucht
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

  // /usr/include/unicode/ucnv_err.h
type
  TUConverter = record
  end;
  PUConverter = ^TUConverter;

  // /usr/include/iconv.h
  Ticonv_t = Pointer;
  Piconv_t = ^Ticonv_t;



  // ==== Windows
  {$ifdef windows}
type
  PID3D11Resource = Pointer;
  {$endif}
