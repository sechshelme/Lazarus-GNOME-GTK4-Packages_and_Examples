{$IFDEF read_interface}


type
  PGstWlDisplay = ^TGstWlDisplay;
  TGstWlDisplay = record
    parent_instance: TGstObject;
  end;

  TGstWlDisplayClass = record
    parent_class: TGstObjectClass;
  end;
  PGstWlDisplayClass = ^TGstWlDisplayClass;

function gst_wl_display_get_type: TGType; cdecl; external libgstwayland;
function gst_wl_display_new(name: Pgchar; error: PPGError): PGstWlDisplay; cdecl; external libgstwayland;
function gst_wl_display_new_existing(display: Pwl_display; take_ownership: Tgboolean; error: PPGError): PGstWlDisplay; cdecl; external libgstwayland;
procedure gst_wl_display_register_buffer(self: PGstWlDisplay; gstmem: Tgpointer; wlbuffer: Tgpointer); cdecl; external libgstwayland;
procedure gst_wl_display_unregister_buffer(self: PGstWlDisplay; gstmem: Tgpointer); cdecl; external libgstwayland;
function gst_wl_display_sync(self: PGstWlDisplay; listener: Pwl_callback_listener; data: Tgpointer): Pwl_callback; cdecl; external libgstwayland;
procedure gst_wl_display_object_destroy(self: PGstWlDisplay; obj: Pgpointer; destroy_func: TGDestroyNotify); cdecl; external libgstwayland;
procedure gst_wl_display_callback_destroy(self: PGstWlDisplay; callback: PPwl_callback); cdecl; external libgstwayland;
function gst_wl_display_lookup_buffer(self: PGstWlDisplay; gstmem: Tgpointer): Tgpointer; cdecl; external libgstwayland;
function gst_wl_display_check_format_for_shm(self: PGstWlDisplay; video_info: PGstVideoInfo): Tgboolean; cdecl; external libgstwayland;
function gst_wl_display_check_format_for_dmabuf(self: PGstWlDisplay; drm_info: PGstVideoInfoDmaDrm): Tgboolean; cdecl; external libgstwayland;
function gst_wl_display_get_display(self: PGstWlDisplay): Pwl_display; cdecl; external libgstwayland;
function gst_wl_display_get_event_queue(self: PGstWlDisplay): Pwl_event_queue; cdecl; external libgstwayland;
function gst_wl_display_get_compositor(self: PGstWlDisplay): Pwl_compositor; cdecl; external libgstwayland;
function gst_wl_display_get_subcompositor(self: PGstWlDisplay): Pwl_subcompositor; cdecl; external libgstwayland;
function gst_wl_display_get_xdg_wm_base(self: PGstWlDisplay): Pxdg_wm_base; cdecl; external libgstwayland;
function gst_wl_display_get_fullscreen_shell_v1(self: PGstWlDisplay): Pzwp_fullscreen_shell_v1; cdecl; external libgstwayland;
function gst_wl_display_get_viewporter(self: PGstWlDisplay): Pwp_viewporter; cdecl; external libgstwayland;
function gst_wl_display_get_shm(self: PGstWlDisplay): Pwl_shm; cdecl; external libgstwayland;
function gst_wl_display_get_shm_formats(self: PGstWlDisplay): PGArray; cdecl; external libgstwayland;
function gst_wl_display_get_dmabuf_formats(self: PGstWlDisplay): PGArray; cdecl; external libgstwayland;
function gst_wl_display_get_dmabuf_modifiers(self: PGstWlDisplay): PGArray; cdecl; external libgstwayland;
procedure gst_wl_display_fill_shm_format_list(self: PGstWlDisplay; format_list: PGValue); cdecl; external libgstwayland;
procedure gst_wl_display_fill_dmabuf_format_list(self: PGstWlDisplay; format_list: PGValue); cdecl; external libgstwayland;
function gst_wl_display_get_dmabuf_v1(self: PGstWlDisplay): Pzwp_linux_dmabuf_v1; cdecl; external libgstwayland;
function gst_wl_display_get_single_pixel_buffer_manager_v1(self: PGstWlDisplay): Pwp_single_pixel_buffer_manager_v1; cdecl; external libgstwayland;
function gst_wl_display_has_own_display(self: PGstWlDisplay): Tgboolean; cdecl; external libgstwayland;
function gst_wl_display_get_color_manager_v1(self: PGstWlDisplay): Pwp_color_manager_v1; cdecl; external libgstwayland;
function gst_wl_display_get_color_representation_manager_v1(self: PGstWlDisplay): Pwp_color_representation_manager_v1; cdecl; external libgstwayland;
function gst_wl_display_is_color_parametric_creator_supported(self: PGstWlDisplay): Tgboolean; cdecl; external libgstwayland;
function gst_wl_display_is_color_mastering_display_supported(self: PGstWlDisplay): Tgboolean; cdecl; external libgstwayland;
function gst_wl_display_is_color_transfer_function_supported(self: PGstWlDisplay; transfer_function: uint32): Tgboolean; cdecl; external libgstwayland;
function gst_wl_display_are_color_primaries_supported(self: PGstWlDisplay; primaries: uint32): Tgboolean; cdecl; external libgstwayland;
function gst_wl_display_is_color_alpha_mode_supported(self: PGstWlDisplay; alpha_mode: uint32): Tgboolean; cdecl; external libgstwayland;
function gst_wl_display_are_color_coefficients_supported(self: PGstWlDisplay; coefficients: uint32; range: uint32): Tgboolean; cdecl; external libgstwayland;
function gst_wl_display_get_output_by_name(self: PGstWlDisplay; output_name: Pgchar): PGstWlOutput; cdecl; external libgstwayland;

// === Konventiert am: 23-7-26 19:13:05 ===

function GST_TYPE_WL_DISPLAY: TGType;
function GST_WL_DISPLAY(obj: Pointer): PGstWlDisplay;
function GST_IS_WL_DISPLAY(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_WL_DISPLAY: TGType;
begin
  Result := gst_wl_display_get_type;
end;

function GST_WL_DISPLAY(obj: Pointer): PGstWlDisplay;
begin
  Result := PGstWlDisplay(g_type_check_instance_cast(obj, GST_TYPE_WL_DISPLAY));
end;

function GST_IS_WL_DISPLAY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_WL_DISPLAY);
end;

{$ENDIF read_implementation}
