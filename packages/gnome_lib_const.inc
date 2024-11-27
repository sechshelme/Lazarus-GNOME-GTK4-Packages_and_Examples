  // {$include ../gnome_lib_const.inc}

  // ==== stdio
const
  {$IFDEF Linux}
  libc = 'c';
  {$ENDIF}

  {$IFDEF Windows}
  libc = 'msvcrt.dll';
  {$ENDIF}

  // ==== Cairo
const
  {$IFDEF Linux}
  cairo_lib = 'libcairo.so.2';
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
  {$endif}

  // ==== System
type
  Tfloat = cfloat;
  Tdouble = cdouble;

  Tuintptr_t = PtrUInt;

  Tsize_t = SizeUInt;
  Ttime_t = clong; // types.h
  Ptime_t = ^Ttime_t;

  TGPid = cint;
  PGPid = ^TGPid;

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

  // ==== FreeTyp
  // /usr/include/freetype2/freetype/freetype.h
  TFT_SizeRec = record
  end;

  TFT_Face = ^TFT_SizeRec;

  TFT_BitmapRec = record
  end;

  TFT_Bitmap = ^TFT_BitmapRec;
  PFT_Bitmap = ^TFT_Bitmap;

  //  ==== Graphene
type
  Tgraphene_matrix_t = Pointer; //    /usr/include/graphene-1.0/graphene-matrix.h
  Pgraphene_matrix_t = ^Tgraphene_matrix_t;
  Tgraphene_rect_t = Pointer;
  Pgraphene_rect_t = ^Tgraphene_rect_t;
  Tgraphene_point_t = Pointer;
  Pgraphene_point_t = ^Tgraphene_point_t;
  Tgraphene_vec2_t = Pointer;        // /usr/include/graphene-1.0/graphene-vec3.h
  Pgraphene_vec2_t = ^Tgraphene_vec2_t;
  Tgraphene_vec3_t = Pointer;        // /usr/include/graphene-1.0/graphene-vec3.h
  Pgraphene_vec3_t = ^Tgraphene_vec3_t;
  Tgraphene_vec4_t = Pointer;        // /usr/include/graphene-1.0/graphene-vec4.h
  Pgraphene_vec4_t = ^Tgraphene_vec4_t;

  Tgraphene_size_t = record
    Width, Height: cfloat;
  end;
  Pgraphene_size_t = ^Tgraphene_size_t;  // /usr/include/graphene-1.0/graphene-size.h

  Tgraphene_point3d_t = record
    x, y, z: cfloat;
  end;
  Pgraphene_point3d_t = ^Tgraphene_point3d_t;


  // ==== OpenGL
type
  // /usr/include/KHR/khrplatform.h
  Tkhronos_int32_t = int32;
  // /usr/include/EGL/eglplatform.h
  TEGLint = Tkhronos_int32_t;


  // ==== Wayland;
type
  Twl_surface = Pointer;
  Pwl_surface = ^Twl_surface;

  Twl_seat = Pointer;
  Pwl_seat = ^Twl_seat;

  Twl_output = Pointer;
  Pwl_output = ^Twl_output;

  Twl_display = Pointer;
  Pwl_display = ^Twl_display;

  Twl_compositor = Pointer;
  Pwl_compositor = ^Twl_compositor;

  Twl_pointer = Pointer;
  Pwl_pointer = ^Twl_pointer;

  Twl_keyboard = Pointer;
  Pwl_keyboard = ^Twl_keyboard;

  Txkb_keymap = Pointer;
  Pxkb_keymap = ^Txkb_keymap;

  Twl_shm_format = Pointer;
  Pwl_shm_format = ^Twl_shm_format;

  Twl_callback_listener = Pointer;
  Pwl_callback_listener = ^Twl_callback_listener;

  Twl_callback = Pointer;
  Pwl_callback = ^Twl_callback;
  PPwl_callback = ^Pwl_callback;

  Twl_event_queue = Pointer;
  Pwl_event_queue = ^Twl_event_queue;

  Twl_subcompositor = Pointer;
  Pwl_subcompositor = ^Twl_subcompositor;

  Twl_shm = Pointer;
  Pwl_shm = ^Twl_shm;

  Twl_subsurface = Pointer;
  Pwl_subsurface = ^Twl_subsurface;

  Twl_buffer = Pointer;
  Pwl_buffer = ^Twl_buffer;

  Txdg_wm_base = Pointer;
  Pxdg_wm_base = ^Txdg_wm_base;

  Tzwp_fullscreen_shell_v1 = Pointer;
  Pzwp_fullscreen_shell_v1 = ^Tzwp_fullscreen_shell_v1;

  Twp_viewporter = Pointer;
  Pwp_viewporter = ^Twp_viewporter;

  Tzwp_linux_dmabuf_v1 = Pointer;
  Pzwp_linux_dmabuf_v1 = ^Tzwp_linux_dmabuf_v1;

  Twp_single_pixel_buffer_manager_v1 = Pointer;
  Pwp_single_pixel_buffer_manager_v1 = ^Twp_single_pixel_buffer_manager_v1;


  // ==== HarfBuzz
type
  // /usr/include/harfbuzz/hb-common.h
  Thb_feature_t = record
  end;
  Phb_feature_t = ^Thb_feature_t;

  Thb_font_t = record
  end;
  Phb_font_t = ^Thb_font_t;

  // /usr/include/harfbuzz/hb-face.h
  Thb_face_t = record
  end;
  Phb_face_t = ^Thb_face_t;

  // ==== Windows
  {$ifdef windows}
type
  PID3D11Resource = Pointer;
  {$endif}

