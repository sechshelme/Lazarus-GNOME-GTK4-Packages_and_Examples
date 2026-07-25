{$IFDEF read_interface}


type
  PGstPlayerVideoRenderer = type Pointer;

  PGstPlayerVideoRendererInterface = ^TGstPlayerVideoRendererInterface;
  TGstPlayerVideoRendererInterface = record
    parent_iface: TGTypeInterface;
    create_video_sink: function(self: PGstPlayerVideoRenderer; player: PGstPlayer): PGstElement; cdecl;
  end;

function gst_player_video_renderer_get_type: TGType; cdecl; external libgstplayer;

// === Konventiert am: 24-7-26 19:51:12 ===

function GST_TYPE_PLAYER_VIDEO_RENDERER: TGType;
function GST_PLAYER_VIDEO_RENDERER(obj: Pointer): PGstPlayerVideoRenderer;
function GST_IS_PLAYER_VIDEO_RENDERER(obj: Pointer): Tgboolean;
function GST_PLAYER_VIDEO_RENDERER_GET_INTERFACE(obj: Pointer): PGstPlayerVideoRendererInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_PLAYER_VIDEO_RENDERER: TGType;
begin
  GST_TYPE_PLAYER_VIDEO_RENDERER := gst_player_video_renderer_get_type;
end;

function GST_PLAYER_VIDEO_RENDERER(obj: Pointer): PGstPlayerVideoRenderer;
begin
  Result := PGstPlayerVideoRenderer(g_type_check_instance_cast(obj, GST_TYPE_PLAYER_VIDEO_RENDERER));
end;

function GST_IS_PLAYER_VIDEO_RENDERER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PLAYER_VIDEO_RENDERER);
end;

function GST_PLAYER_VIDEO_RENDERER_GET_INTERFACE(obj: Pointer): PGstPlayerVideoRendererInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_PLAYER_VIDEO_RENDERER);
end;

{$ENDIF read_implementation}
