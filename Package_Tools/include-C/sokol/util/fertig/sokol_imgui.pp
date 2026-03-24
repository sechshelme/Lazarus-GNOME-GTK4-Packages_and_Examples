
unit sokol_imgui;
interface

{
  Automatically converted by H2Pas 1.0.0 from sokol_imgui.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sokol_imgui.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Psapp_event  = ^sapp_event;
Psimgui_allocator_t  = ^simgui_allocator_t;
Psimgui_desc_t  = ^simgui_desc_t;
Psimgui_font_tex_desc_t  = ^simgui_font_tex_desc_t;
Psimgui_frame_desc_t  = ^simgui_frame_desc_t;
Psimgui_logger_t  = ^simgui_logger_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    simgui_allocator_t

    Used in simgui_desc_t to provide custom memory-alloc and -free functions
    to sokol_imgui.h. If memory management should be overridden, both the
    alloc_fn and free_fn function must be provided (e.g. it's not valid to
    override one function but not the other).
 }
type
  Psimgui_allocator_t = ^Tsimgui_allocator_t;
  Tsimgui_allocator_t = record
      alloc_fn : function (size:Tsize_t; user_data:pointer):pointer;cdecl;
      free_fn : procedure (ptr:pointer; user_data:pointer);cdecl;
      user_data : pointer;
    end;
{
    simgui_logger

    Used in simgui_desc_t to provide a logging function. Please be aware
    that without logging function, sokol-imgui will be completely
    silent, e.g. it will not report errors, warnings and
    validation layer messages. For maximum error verbosity,
    compile in debug mode (e.g. NDEBUG *not* defined) and install
    a logger (for instance the standard logging function from sokol_log.h).
 }
(* Const before type ignored *)
{ always "simgui" }
{ 0=panic, 1=error, 2=warning, 3=info }
{ SIMGUI_LOGITEM_* }
(* Const before type ignored *)
{ a message string, may be nullptr in release mode }
{ line number in sokol_imgui.h }
(* Const before type ignored *)
{ source filename, may be nullptr in release mode }

  Psimgui_logger_t = ^Tsimgui_logger_t;
  Tsimgui_logger_t = record
      func : procedure (tag:Pchar; log_level:Tuint32_t; log_item_id:Tuint32_t; message_or_null:Pchar; line_nr:Tuint32_t; 
                    filename_or_null:Pchar; user_data:pointer);cdecl;
      user_data : pointer;
    end;
{ default: 65536 }
(* Const before type ignored *)
{ if true, don't send Ctrl-V on EVENTTYPE_CLIPBOARD_PASTED }
{ if true, don't control the mouse cursor type via sapp_set_mouse_cursor() }
{ if true, only resize edges from the bottom right corner }
{ if true, alpha values get written into the framebuffer }
{ optional memory allocation overrides (default: malloc/free) }
{ optional log function override }

  Psimgui_desc_t = ^Tsimgui_desc_t;
  Tsimgui_desc_t = record
      max_vertices : longint;
      color_format : Tsg_pixel_format;
      depth_format : Tsg_pixel_format;
      sample_count : longint;
      ini_filename : Pchar;
      no_default_font : Tbool;
      disable_paste_override : Tbool;
      disable_set_mouse_cursor : Tbool;
      disable_windows_resize_from_edges : Tbool;
      write_alpha_channel : Tbool;
      allocator : Tsimgui_allocator_t;
      logger : Tsimgui_logger_t;
    end;

  Psimgui_frame_desc_t = ^Tsimgui_frame_desc_t;
  Tsimgui_frame_desc_t = record
      width : longint;
      height : longint;
      delta_time : Tdouble;
      dpi_scale : single;
    end;

  Psimgui_font_tex_desc_t = ^Tsimgui_font_tex_desc_t;
  Tsimgui_font_tex_desc_t = record
      min_filter : Tsg_filter;
      mag_filter : Tsg_filter;
    end;
(* Const before type ignored *)

procedure simgui_setup(desc:Psimgui_desc_t);cdecl;external;
(* Const before type ignored *)
procedure simgui_new_frame(desc:Psimgui_frame_desc_t);cdecl;external;
procedure simgui_render;cdecl;external;
function simgui_imtextureid(tex_view:Tsg_view):Tuint64_t;cdecl;external;
function simgui_imtextureid_with_sampler(tex_view:Tsg_view; smp:Tsg_sampler):Tuint64_t;cdecl;external;
function simgui_texture_view_from_imtextureid(imtex_id:Tuint64_t):Tsg_view;cdecl;external;
function simgui_sampler_from_imtextureid(imtex_id:Tuint64_t):Tsg_sampler;cdecl;external;
procedure simgui_add_focus_event(focus:Tbool);cdecl;external;
procedure simgui_add_mouse_pos_event(x:single; y:single);cdecl;external;
procedure simgui_add_touch_pos_event(x:single; y:single);cdecl;external;
procedure simgui_add_mouse_button_event(mouse_button:longint; down:Tbool);cdecl;external;
procedure simgui_add_mouse_wheel_event(wheel_x:single; wheel_y:single);cdecl;external;
procedure simgui_add_key_event(imgui_key:longint; down:Tbool);cdecl;external;
procedure simgui_add_input_character(c:Tuint32_t);cdecl;external;
(* Const before type ignored *)
procedure simgui_add_input_characters_utf8(c:Pchar);cdecl;external;
procedure simgui_add_touch_button_event(mouse_button:longint; down:Tbool);cdecl;external;
{$if !defined(SOKOL_IMGUI_NO_SOKOL_APP)}
(* Const before type ignored *)

function simgui_handle_event(ev:Psapp_event):Tbool;cdecl;external;
function simgui_map_keycode(keycode:Tsapp_keycode):longint;cdecl;external;
{ returns ImGuiKey_* }
{$endif}

procedure simgui_shutdown;cdecl;external;

implementation


end.
