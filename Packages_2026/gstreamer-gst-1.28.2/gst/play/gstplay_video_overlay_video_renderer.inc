{$IFDEF read_interface}

type
  PGstPlayVideoOverlayVideoRenderer = type Pointer;
  PGstPlayVideoOverlayVideoRendererClass = type Pointer;

function gst_play_video_overlay_video_renderer_get_type: TGType; cdecl; external libgstplay;
function gst_play_video_overlay_video_renderer_new(window_handle: Tgpointer): PGstPlayVideoRenderer; cdecl; external libgstplay;
function gst_play_video_overlay_video_renderer_new_with_sink(window_handle: Tgpointer; video_sink: PGstElement): PGstPlayVideoRenderer; cdecl; external libgstplay;
procedure gst_play_video_overlay_video_renderer_set_window_handle(self: PGstPlayVideoOverlayVideoRenderer; window_handle: Tgpointer); cdecl; external libgstplay;
function gst_play_video_overlay_video_renderer_get_window_handle(self: PGstPlayVideoOverlayVideoRenderer): Tgpointer; cdecl; external libgstplay;
procedure gst_play_video_overlay_video_renderer_expose(self: PGstPlayVideoOverlayVideoRenderer); cdecl; external libgstplay;
procedure gst_play_video_overlay_video_renderer_set_render_rectangle(self: PGstPlayVideoOverlayVideoRenderer; x: Tgint; y: Tgint; width: Tgint; height: Tgint); cdecl; external libgstplay;
procedure gst_play_video_overlay_video_renderer_get_render_rectangle(self: PGstPlayVideoOverlayVideoRenderer; x: Pgint; y: Pgint; width: Pgint; height: Pgint); cdecl; external libgstplay;

// === Konventiert am: 26-7-26 13:34:09 ===

function GST_TYPE_PLAY_VIDEO_OVERLAY_VIDEO_RENDERER: TGType;
function GST_PLAY_VIDEO_OVERLAY_VIDEO_RENDERER(obj: Pointer): PGstPlayVideoOverlayVideoRenderer;
function GST_PLAY_VIDEO_OVERLAY_VIDEO_RENDERER_CLASS(klass: Pointer): PGstPlayVideoOverlayVideoRendererClass;
function GST_IS_PLAY_VIDEO_OVERLAY_VIDEO_RENDERER(obj: Pointer): Tgboolean;
function GST_IS_PLAY_VIDEO_OVERLAY_VIDEO_RENDERER_CLASS(klass: Pointer): Tgboolean;
function GST_PLAY_VIDEO_OVERLAY_VIDEO_RENDERER_GET_CLASS(obj: Pointer): PGstPlayVideoOverlayVideoRendererClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_PLAY_VIDEO_OVERLAY_VIDEO_RENDERER: TGType;
begin
  GST_TYPE_PLAY_VIDEO_OVERLAY_VIDEO_RENDERER := gst_play_video_overlay_video_renderer_get_type;
end;

function GST_PLAY_VIDEO_OVERLAY_VIDEO_RENDERER(obj: Pointer): PGstPlayVideoOverlayVideoRenderer;
begin
  Result := PGstPlayVideoOverlayVideoRenderer(g_type_check_instance_cast(obj, GST_TYPE_PLAY_VIDEO_OVERLAY_VIDEO_RENDERER));
end;

function GST_PLAY_VIDEO_OVERLAY_VIDEO_RENDERER_CLASS(klass: Pointer): PGstPlayVideoOverlayVideoRendererClass;
begin
  Result := PGstPlayVideoOverlayVideoRendererClass(g_type_check_class_cast(klass, GST_TYPE_PLAY_VIDEO_OVERLAY_VIDEO_RENDERER));
end;

function GST_IS_PLAY_VIDEO_OVERLAY_VIDEO_RENDERER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PLAY_VIDEO_OVERLAY_VIDEO_RENDERER);
end;

function GST_IS_PLAY_VIDEO_OVERLAY_VIDEO_RENDERER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_PLAY_VIDEO_OVERLAY_VIDEO_RENDERER);
end;

function GST_PLAY_VIDEO_OVERLAY_VIDEO_RENDERER_GET_CLASS(obj: Pointer): PGstPlayVideoOverlayVideoRendererClass;
begin
  Result := PGstPlayVideoOverlayVideoRendererClass(PGTypeInstance(obj)^.g_class);
end;

function GST_PLAY_VIDEO_OVERLAY_VIDEO_RENDERER_CAST(obj: longint): PGstPlayVideoOverlayVideoRenderer;
begin
  Result := PGstPlayVideoOverlayVideoRenderer(obj);
end;

{$ENDIF read_implementation}
