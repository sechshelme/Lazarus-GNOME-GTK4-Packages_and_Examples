/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 08-10-2024   15:12                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GstWlWindow, gst_wl_window, GST, WL_WINDOW, GObject); }
type
  TGstWlWindow = record
    parent_instance: TGObject;
  end;
  PGstWlWindow = ^TGstWlWindow;

  TGstWlWindowClass = record
    parent_class: TGObjectClass;
  end;
  PGstWlWindowClass = ^TGstWlWindowClass;

function gst_wl_window_get_type: TGType; cdecl; external libgstwayland;
procedure gst_wl_window_ensure_fullscreen(self: PGstWlWindow; fullscreen: Tgboolean); cdecl; external libgstwayland;
function gst_wl_window_new_toplevel(display: PGstWlDisplay; info: PGstVideoInfo; fullscreen: Tgboolean; render_lock: PGMutex): PGstWlWindow; cdecl; external libgstwayland;
function gst_wl_window_new_in_surface(display: PGstWlDisplay; parent: Pwl_surface; render_lock: PGMutex): PGstWlWindow; cdecl; external libgstwayland;
function gst_wl_window_get_display(self: PGstWlWindow): PGstWlDisplay; cdecl; external libgstwayland;
function gst_wl_window_get_wl_surface(self: PGstWlWindow): Pwl_surface; cdecl; external libgstwayland;
function gst_wl_window_get_subsurface(self: PGstWlWindow): Pwl_subsurface; cdecl; external libgstwayland;
function gst_wl_window_is_toplevel(self: PGstWlWindow): Tgboolean; cdecl; external libgstwayland;
function gst_wl_window_render(self: PGstWlWindow; buffer: PGstWlBuffer; info: PGstVideoInfo): Tgboolean; cdecl; external libgstwayland;
procedure gst_wl_window_set_render_rectangle(self: PGstWlWindow; x: Tgint; y: Tgint; w: Tgint; h: Tgint); cdecl; external libgstwayland;
function gst_wl_window_get_render_rectangle(self: PGstWlWindow): PGstVideoRectangle; cdecl; external libgstwayland;
procedure gst_wl_window_set_rotate_method(self: PGstWlWindow; rotate_method: TGstVideoOrientationMethod); cdecl; external libgstwayland;

// === Konventiert am: 8-10-24 14:16:38 ===

function GST_TYPE_WL_WINDOW: TGType;
function GST_WL_WINDOW(obj: Pointer): PGstWlWindow;
function GST_IS_WL_WINDOW(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_WL_WINDOW: TGType;
begin
  Result := gst_wl_window_get_type;
end;

function GST_WL_WINDOW(obj: Pointer): PGstWlWindow;
begin
  Result := PGstWlWindow(g_type_check_instance_cast(obj, GST_TYPE_WL_WINDOW));
end;

function GST_IS_WL_WINDOW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_WL_WINDOW);
end;




{$ENDIF read_implementation}
