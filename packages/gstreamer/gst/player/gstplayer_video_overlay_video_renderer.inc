/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 08-10-2024   19:23                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstPlayerVideoOverlayVideoRenderer = record
  end;
  PGstPlayerVideoOverlayVideoRenderer = ^TGstPlayerVideoOverlayVideoRenderer;

  TGstPlayerVideoOverlayVideoRendererClass = record
  end;
  PGstPlayerVideoOverlayVideoRendererClass = ^TGstPlayerVideoOverlayVideoRendererClass;

function gst_player_video_overlay_video_renderer_get_type: TGType; cdecl; external libgstplayer;
function gst_player_video_overlay_video_renderer_new(window_handle: Tgpointer): PGstPlayerVideoRenderer; cdecl; external libgstplayer;
function gst_player_video_overlay_video_renderer_new_with_sink(window_handle: Tgpointer; video_sink: PGstElement): PGstPlayerVideoRenderer; cdecl; external libgstplayer;
procedure gst_player_video_overlay_video_renderer_set_window_handle(self: PGstPlayerVideoOverlayVideoRenderer; window_handle: Tgpointer); cdecl; external libgstplayer;
function gst_player_video_overlay_video_renderer_get_window_handle(self: PGstPlayerVideoOverlayVideoRenderer): Tgpointer; cdecl; external libgstplayer;
procedure gst_player_video_overlay_video_renderer_expose(self: PGstPlayerVideoOverlayVideoRenderer); cdecl; external libgstplayer;
procedure gst_player_video_overlay_video_renderer_set_render_rectangle(self: PGstPlayerVideoOverlayVideoRenderer; x: Tgint; y: Tgint; Width: Tgint; Height: Tgint); cdecl; external libgstplayer;
procedure gst_player_video_overlay_video_renderer_get_render_rectangle(self: PGstPlayerVideoOverlayVideoRenderer; x: Pgint; y: Pgint; Width: Pgint; Height: Pgint); cdecl; external libgstplayer;

function GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_CAST(obj: Pointer): PGstPlayerVideoOverlayVideoRenderer;

// === Konventiert am: 8-10-24 18:50:30 ===

function GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER: TGType;
function GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER(obj: Pointer): PGstPlayerVideoOverlayVideoRenderer;
function GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_CLASS(klass: Pointer): PGstPlayerVideoOverlayVideoRendererClass;
function GST_IS_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER(obj: Pointer): Tgboolean;
function GST_IS_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_CLASS(klass: Pointer): Tgboolean;
function GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_GET_CLASS(obj: Pointer): PGstPlayerVideoOverlayVideoRendererClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER: TGType;
begin
  GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER := gst_player_video_overlay_video_renderer_get_type;
end;

function GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER(obj: Pointer): PGstPlayerVideoOverlayVideoRenderer;
begin
  Result := PGstPlayerVideoOverlayVideoRenderer(g_type_check_instance_cast(obj, GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER));
end;

function GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_CLASS(klass: Pointer): PGstPlayerVideoOverlayVideoRendererClass;
begin
  Result := PGstPlayerVideoOverlayVideoRendererClass(g_type_check_class_cast(klass, GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER));
end;

function GST_IS_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER);
end;

function GST_IS_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER);
end;

function GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_GET_CLASS(obj: Pointer): PGstPlayerVideoOverlayVideoRendererClass;
begin
  Result := PGstPlayerVideoOverlayVideoRendererClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_CAST(obj: Pointer): PGstPlayerVideoOverlayVideoRenderer;
begin
  GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_CAST := PGstPlayerVideoOverlayVideoRenderer(obj);
end;


{$ENDIF read_implementation}
