
unit sokol_gfx_imgui;
interface

{
  Automatically converted by H2Pas 1.0.0 from sokol_gfx_imgui.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sokol_gfx_imgui.h
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
Psgimgui_allocator_t  = ^sgimgui_allocator_t;
Psgimgui_desc_t  = ^sgimgui_desc_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    sgimgui_allocator_t

    Used in sgimgui_desc_t to provide custom memory-alloc and -free functions
    to sokol_gfx_imgui.h. If memory management should be overridden, both the
    alloc and free function must be provided (e.g. it's not valid to
    override one function but not the other).
 }
type
  Psgimgui_allocator_t = ^Tsgimgui_allocator_t;
  Tsgimgui_allocator_t = record
      alloc_fn : function (size:Tsize_t; user_data:pointer):pointer;cdecl;
      free_fn : procedure (ptr:pointer; user_data:pointer);cdecl;
      user_data : pointer;
    end;
{
    sgimgui_desc_t

    Initialization options for sgimgui_init().
 }
{ optional memory allocation overrides (default: malloc/free) }

  Psgimgui_desc_t = ^Tsgimgui_desc_t;
  Tsgimgui_desc_t = record
      allocator : Tsgimgui_allocator_t;
    end;
(* Const before type ignored *)

procedure sgimgui_setup(desc:Psgimgui_desc_t);cdecl;external;
procedure sgimgui_shutdown;cdecl;external;
procedure sgimgui_draw;cdecl;external;
(* Const before type ignored *)
procedure sgimgui_draw_menu(title:Pchar);cdecl;external;
procedure sgimgui_draw_buffer_window_content;cdecl;external;
procedure sgimgui_draw_image_window_content;cdecl;external;
procedure sgimgui_draw_sampler_window_content;cdecl;external;
procedure sgimgui_draw_shader_window_content;cdecl;external;
procedure sgimgui_draw_pipeline_window_content;cdecl;external;
procedure sgimgui_draw_view_window_content;cdecl;external;
procedure sgimgui_draw_capture_window_content;cdecl;external;
procedure sgimgui_draw_capabilities_window_content;cdecl;external;
procedure sgimgui_draw_frame_stats_window_content;cdecl;external;
(* Const before type ignored *)
procedure sgimgui_draw_buffer_window(title:Pchar);cdecl;external;
(* Const before type ignored *)
procedure sgimgui_draw_image_window(title:Pchar);cdecl;external;
(* Const before type ignored *)
procedure sgimgui_draw_sampler_window(title:Pchar);cdecl;external;
(* Const before type ignored *)
procedure sgimgui_draw_shader_window(title:Pchar);cdecl;external;
(* Const before type ignored *)
procedure sgimgui_draw_pipeline_window(title:Pchar);cdecl;external;
(* Const before type ignored *)
procedure sgimgui_draw_view_window(title:Pchar);cdecl;external;
(* Const before type ignored *)
procedure sgimgui_draw_capture_window(title:Pchar);cdecl;external;
(* Const before type ignored *)
procedure sgimgui_draw_capabilities_window(title:Pchar);cdecl;external;
(* Const before type ignored *)
procedure sgimgui_draw_frame_stats_window(title:Pchar);cdecl;external;
(* Const before type ignored *)
procedure sgimgui_draw_buffer_menu_item(_label:Pchar);cdecl;external;
(* Const before type ignored *)
procedure sgimgui_draw_image_menu_item(_label:Pchar);cdecl;external;
(* Const before type ignored *)
procedure sgimgui_draw_sampler_menu_item(_label:Pchar);cdecl;external;
(* Const before type ignored *)
procedure sgimgui_draw_shader_menu_item(_label:Pchar);cdecl;external;
(* Const before type ignored *)
procedure sgimgui_draw_pipeline_menu_item(_label:Pchar);cdecl;external;
(* Const before type ignored *)
procedure sgimgui_draw_view_menu_item(_label:Pchar);cdecl;external;
(* Const before type ignored *)
procedure sgimgui_draw_capture_menu_item(_label:Pchar);cdecl;external;
(* Const before type ignored *)
procedure sgimgui_draw_capabilities_menu_item(_label:Pchar);cdecl;external;
(* Const before type ignored *)
procedure sgimgui_draw_frame_stats_menu_item(_label:Pchar);cdecl;external;

implementation


end.
