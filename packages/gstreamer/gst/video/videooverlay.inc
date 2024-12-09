
{$IFDEF read_interface}

type
  TGstVideoOverlay = record
  end;
  PGstVideoOverlay = ^TGstVideoOverlay;

  TGstVideoOverlayInterface = record
    iface: TGTypeInterface;
    expose: procedure(overlay: PGstVideoOverlay); cdecl;
    handle_events: procedure(overlay: PGstVideoOverlay; handle_events: Tgboolean); cdecl;
    set_render_rectangle: procedure(overlay: PGstVideoOverlay; x: Tgint; y: Tgint; Width: Tgint; Height: Tgint); cdecl;
    set_window_handle: procedure(overlay: PGstVideoOverlay; handle: Tguintptr); cdecl;
  end;
  PGstVideoOverlayInterface = ^TGstVideoOverlayInterface;

function gst_video_overlay_get_type: TGType; cdecl; external libgstvideo;
function gst_video_overlay_set_render_rectangle(overlay: PGstVideoOverlay; x: Tgint; y: Tgint; Width: Tgint; Height: Tgint): Tgboolean; cdecl; external libgstvideo;
procedure gst_video_overlay_expose(overlay: PGstVideoOverlay); cdecl; external libgstvideo;
procedure gst_video_overlay_handle_events(overlay: PGstVideoOverlay; handle_events: Tgboolean); cdecl; external libgstvideo;
procedure gst_video_overlay_set_window_handle(overlay: PGstVideoOverlay; handle: Tguintptr); cdecl; external libgstvideo;
procedure gst_video_overlay_got_window_handle(overlay: PGstVideoOverlay; handle: Tguintptr); cdecl; external libgstvideo;
procedure gst_video_overlay_prepare_window_handle(overlay: PGstVideoOverlay); cdecl; external libgstvideo;
function gst_is_video_overlay_prepare_window_handle_message(msg: PGstMessage): Tgboolean; cdecl; external libgstvideo;
procedure gst_video_overlay_install_properties(oclass: PGObjectClass; last_prop_id: Tgint); cdecl; external libgstvideo;
function gst_video_overlay_set_property(obj: PGObject; last_prop_id: Tgint; property_id: Tguint; Value: PGValue): Tgboolean; cdecl; external libgstvideo;

// === Konventiert am: 30-9-24 17:49:46 ===

function GST_TYPE_VIDEO_OVERLAY: TGType;
function GST_VIDEO_OVERLAY(obj: Pointer): PGstVideoOverlay;
function GST_IS_VIDEO_OVERLAY(obj: Pointer): Tgboolean;
function GST_VIDEO_OVERLAY_GET_INTERFACE(obj: Pointer): PGstVideoOverlayInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VIDEO_OVERLAY: TGType;
begin
  GST_TYPE_VIDEO_OVERLAY := gst_video_overlay_get_type;
end;

function GST_VIDEO_OVERLAY(obj: Pointer): PGstVideoOverlay;
begin
  Result := PGstVideoOverlay(g_type_check_instance_cast(obj, GST_TYPE_VIDEO_OVERLAY));
end;

function GST_IS_VIDEO_OVERLAY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VIDEO_OVERLAY);
end;

function GST_VIDEO_OVERLAY_GET_INTERFACE(obj: Pointer): PGstVideoOverlayInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_VIDEO_OVERLAY);
end;



{$ENDIF read_implementation}
