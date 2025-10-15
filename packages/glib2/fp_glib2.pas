unit fp_glib2;

interface

uses
  {$ifdef linux}
  x, xlib,
  {$endif}
  ctypes;

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

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // ==== glib2
type
  Tuintptr_t = PtrUInt;
  Tptrdiff_t = PtrInt;

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
  Ptm = type Pointer;

  // /usr/include/linux/time.h
type
  Ttimespec = record
    tv_sec: int64;
    tv_nsec: int64;
  end;

  // /usr/include/pwd.h
type
  Ppasswd = type Pointer;

  // ==== Wayland;
type
  Pwl_surface = type Pointer;
  Pwl_seat = type Pointer;
  Pwl_output = type Pointer;
  Pwl_display = type Pointer;
  Pwl_compositor = type Pointer;
  Pwl_pointer = type Pointer;
  Pwl_keyboard = type Pointer;
  Pxkb_keymap = type Pointer;
  Pwl_callback_listener = type Pointer;
  Pwl_callback = type Pointer;
  PPwl_callback = ^Pwl_callback;
  Pwl_event_queue = type Pointer;
  Pwl_subcompositor = type Pointer;
  Pwl_shm = type Pointer;
  Pwl_subsurface = type Pointer;
  Pwl_buffer = type Pointer;
  Pxdg_wm_base = type Pointer;
  Pzwp_fullscreen_shell_v1 = type Pointer;
  Pwp_viewporter = type Pointer;
  Pzwp_linux_dmabuf_v1 = type Pointer;
  Pwp_single_pixel_buffer_manager_v1 = type Pointer;
  Pwl_registry = type Pointer;
  Pwl_shell = type Pointer;
  Twl_shm_format = longint;
  Pwl_shm_format = ^Twl_shm_format;

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

  //  {$include ../gnome_lib_const.inc}

  {$DEFINE read_interface}
  {$include glibconfig.inc}
  {$include fp_glib2_includes.inc}
  {$include fp_gobject2_includes.inc}
  {$include fp_gio2_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include glibconfig.inc}
{$include fp_glib2_includes.inc}
{$include fp_gobject2_includes.inc}
{$include fp_gio2_includes.inc}
{$UNDEF read_implementation}

// wegen "division_by_zero" in den clibs
{$IF defined(CPUX86) or defined(CPUX64)}
{$asmmode intel}
procedure SetMXCSR;
var
  w2: word = 8064;
begin
  asm
           Ldmxcsr w2
  end;
end;
{$ENDIF}

begin
  {$IF defined(CPUX86) or defined(CPUX64)}
  SetMXCSR;
  {$ENDIF}
end.
