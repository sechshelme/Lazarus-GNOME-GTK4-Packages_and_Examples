unit glib280;

interface

uses
  Strings,
  ctypes;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  {$IFDEF Linux}
  libglib2 = 'libglib-2.0';
  libgobject2_0 = 'libgobject-2.0';
  libgio2 = 'libgio-2.0';
  libgtk4 = 'libgtk-4';
  {$ENDIF}

  {$IFDEF Windows}
  libgio2 = 'gio-2.0-0.dll';
  libglib2 = 'glib-2.0-0.dll';
  libgobject2_0 = 'gobject-2.0-0.dll';
  libgtk4 = 'gtk-4.dll';
  {$ENDIF}

  // === Externes
type
  Ttm = record  //  /usr/include/x86_64-linux-gnu/bits/types/struct_tm.h
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
    tm_zone: PChar;
  end;
  Ptm = ^Ttm;

  // Wayland;

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

  Twl_shm_format=Pointer;
  Pwl_shm_format=^Twl_shm_format;

  Twl_callback_listener=Pointer;
  Pwl_callback_listener=^Twl_callback_listener;

  Twl_callback=Pointer;
  Pwl_callback=^Twl_callback;
  PPwl_callback=^Pwl_callback;

  Twl_event_queue=Pointer;
  Pwl_event_queue=^Twl_event_queue;

  Twl_subcompositor=Pointer;
  Pwl_subcompositor=^Twl_subcompositor;

  Twl_shm=Pointer;
  Pwl_shm=^Twl_shm;

  Twl_subsurface=Pointer;
  Pwl_subsurface=^Twl_subsurface;

  Twl_buffer=Pointer;
  Pwl_buffer=^Twl_buffer;

  Txdg_wm_base=Pointer;
  Pxdg_wm_base=^Txdg_wm_base;

  Tzwp_fullscreen_shell_v1=Pointer;
  Pzwp_fullscreen_shell_v1=^Tzwp_fullscreen_shell_v1;

  Twp_viewporter=Pointer;
  Pwp_viewporter=^Twp_viewporter;

  Tzwp_linux_dmabuf_v1=Pointer;
  Pzwp_linux_dmabuf_v1=^Tzwp_linux_dmabuf_v1;

  Twp_single_pixel_buffer_manager_v1=Pointer;
  Pwp_single_pixel_buffer_manager_v1=^Twp_single_pixel_buffer_manager_v1;

  // egl
  Tkhronos_int32_t=int32;
  TEGLint= Tkhronos_int32_t;


  // ====

const
  //  GLIB_MAJOR_VERSION = 2;
  //  GLIB_MINOR_VERSION = 80;
  //  GLIB_MICRO_VERSION = 0;


  {$IFDEF Linux}
  G_DIR_SEPARATOR = '/';
  {$ENDIF}
  {$IFDEF Windows}
  G_DIR_SEPARATOR = '';
  {$ENDIF}

const
  G_MINFLOAT = 5.0e-324;
  G_MAXFLOAT = 1.7e308;
  G_MINDOUBLE = G_MINFLOAT;
  G_MAXDOUBLE = G_MAXFLOAT;
  G_MAXSHORT = 32767;
  G_MINSHORT = -G_MAXSHORT - 1;
  G_MAXUSHORT = 2 * G_MAXSHORT + 1;
  G_MAXINT = 2147483647;
  G_MININT = -G_MAXINT - 1;
  G_MAXUINT = 4294967295;
  G_MINLONG = G_MININT;
  G_MAXLONG = G_MAXINT;
  G_MAXULONG = G_MAXUINT;

type
  Tgint8 = int8;
  Tguint8 = uint8;
  Pgint8 = ^int8;
  Pguint8 = ^uint8;
  PPguint8 = ^PUInt8;

  Tgint16 = int16;
  Tguint16 = uint16;
  Pgint16 = ^int16;
  Pguint16 = ^uint16;
  PPguint16 = ^PUInt16;

  Tgint32 = int32;
  Tguint32 = uint32;
  Pgint32 = ^int32;
  Pguint32 = ^uint32;
  PPguint32 = ^PUInt32;

  Tgint64 = int64;
  Tguint64 = uint64;
  Pgint64 = ^int64;
  Pguint64 = ^uint64;

  Tgssize = SizeInt;
  Pgssize = PSizeInt;
  Tgsize = SizeUInt;
  Pgsize = PSizeUInt;


  Tgintptr = IntPtr;
  Pgintptr = PIntPtr;
  Tguintptr = PtrUInt;
  Pguintptr = PPtrUInt;

  Tgoffset = SizeInt;

  Tuintptr_t=PtrUInt;

  // gio

type
  PGType = ^TGType;
  TGType = Tguintptr;


  // no GLIB

  TFILE = record //  /usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h
  end;
  PFILE = ^TFILE;

  Tdouble = double;

  Tsize_t = SizeUInt;
  Ttime_t = clong; // types.h
  Ptime_t = ^Ttime_t;

  TGPid = cint;
  PGPid = ^TGPid;


  Tva_list = Pointer;
  Pva_list = ^Tva_list;

  Tstat = record  // /usr/include/x86_64-linux-gnu/bits/struct_stat.h
  end;
  PTstat = ^Tstat;

const         // nur Linux    /usr/lib/x86_64-linux-gnu/glib-2.0/include/glibconfig.h
  GLIB_SYSDEF_AF_UNIX = 1;
  GLIB_SYSDEF_AF_INET = 2;
  GLIB_SYSDEF_AF_INET6 = 10;

  GLIB_SYSDEF_MSG_OOB = 1;
  GLIB_SYSDEF_MSG_PEEK = 2;
  GLIB_SYSDEF_MSG_DONTROUTE = 4;


type
  Tpid_t = cint;    // /usr/include/x86_64-linux-gnu/bits/types.h
  Tuid_t = cuint;

const
  __SIZEOF_PTHREAD_MUTEX_T = 40;

type
  Ppthread_mutex_t = ^Tpthread_mutex_t;   // /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h
  Tpthread_mutex_t = record
    case longint of
      //        0 : ( __data : T_pthread_mutex_s );
      1: (__size: array[0..__SIZEOF_PTHREAD_MUTEX_T - 1] of char);
      2: (__align: culong);
  end;

  Tpthread_t = culong;  // /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h


  {$DEFINE read_interface}
  {$include glib280_includes.inc}
type
  TGValue = record
    g_type: TGType;
    Data: array[0..1] of record
      case longint of
        0: (v_int: Tgint);
        1: (v_uint: Tguint);
        2: (v_long: Tglong);
        3: (v_ulong: Tgulong);
        4: (v_int64: Tgint64);
        5: (v_uint64: Tguint64);
        6: (v_float: Tgfloat);
        7: (v_double: Tgdouble);
        8: (v_pointer: Tgpointer);
      end;
  end;
  PGValue = ^TGValue;
  PPGValue = ^PGValue;


  {$include gobject280_includes.inc}
  {$include gio280_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include glib280_includes.inc}
{$include gobject280_includes.inc}
{$include gio280_includes.inc}
{$UNDEF read_implementation}

end.
