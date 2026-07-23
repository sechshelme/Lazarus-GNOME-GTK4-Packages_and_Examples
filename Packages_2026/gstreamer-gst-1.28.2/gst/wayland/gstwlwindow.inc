{$IFDEF read_interface}


type
  PGstWlWindow = ^TGstWlWindow;
  TGstWlWindow = record
    parent_instance: TGstObject;
  end;

  TGstWlWindowClass = record
    parent_class: TGstObjectClass;
  end;
  PGstWlWindowClass = ^TGstWlWindowClass;

function gst_wl_window_get_type: TGType; cdecl; external libgstwayland;
procedure gst_wl_window_ensure_fullscreen(self: PGstWlWindow; fullscreen: Tgboolean); cdecl; external libgstwayland;
procedure gst_wl_window_ensure_fullscreen_for_output(self: PGstWlWindow; fullscreen: Tgboolean; output_name: Pgchar); cdecl; external libgstwayland;
function gst_wl_window_new_toplevel(display: PGstWlDisplay; info: PGstVideoInfo; fullscreen: Tgboolean; render_lock: PGMutex): PGstWlWindow; cdecl; external libgstwayland;
function gst_wl_window_new_toplevel_full(display: PGstWlDisplay; info: PGstVideoInfo; fullscreen: Tgboolean; output_name: Pgchar; render_lock: PGMutex): PGstWlWindow; cdecl; external libgstwayland;
function gst_wl_window_new_in_surface(display: PGstWlDisplay; parent: Pwl_surface; render_lock: PGMutex): PGstWlWindow; cdecl; external libgstwayland;
function gst_wl_window_get_display(self: PGstWlWindow): PGstWlDisplay; cdecl; external libgstwayland;
function gst_wl_window_get_wl_surface(self: PGstWlWindow): Pwl_surface; cdecl; external libgstwayland;
function gst_wl_window_get_subsurface(self: PGstWlWindow): Pwl_subsurface; cdecl; external libgstwayland;
function gst_wl_window_is_toplevel(self: PGstWlWindow): Tgboolean; cdecl; external libgstwayland;
function gst_wl_window_render(self: PGstWlWindow; buffer: PGstWlBuffer; info: PGstVideoInfo): Tgboolean; cdecl; external libgstwayland;
function gst_wl_window_flush(self: PGstWlWindow): Tgboolean; cdecl; external libgstwayland;
function gst_wl_window_render_hdr(self: PGstWlWindow; buffer: PGstWlBuffer; info: PGstVideoInfo; minfo: PGstVideoMasteringDisplayInfo; linfo: PGstVideoContentLightLevel): Tgboolean; cdecl; external libgstwayland;
procedure gst_wl_window_set_render_rectangle(self: PGstWlWindow; x: Tgint; y: Tgint; w: Tgint; h: Tgint); cdecl; external libgstwayland;
function gst_wl_window_get_render_rectangle(self: PGstWlWindow): PGstVideoRectangle; cdecl; external libgstwayland;
procedure gst_wl_window_set_rotate_method(self: PGstWlWindow; rotate_method: TGstVideoOrientationMethod); cdecl; external libgstwayland;
procedure gst_wl_window_set_force_aspect_ratio(self: PGstWlWindow; force_aspect_ratio: Tgboolean); cdecl; external libgstwayland;

// === Konventiert am: 23-7-26 19:12:35 ===

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
