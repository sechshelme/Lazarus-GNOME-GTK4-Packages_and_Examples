
{$IFDEF read_interface}


type
  TGstPlayVideoRendererInterface = record
    parent_iface: TGTypeInterface;
    create_video_sink: function(self: PGstPlayVideoRenderer; play: PGstPlay): PGstElement; cdecl;
  end;
  PGstPlayVideoRendererInterface = ^TGstPlayVideoRendererInterface;

function gst_play_video_renderer_get_type: TGType; cdecl; external libgstplay;

// === Konventiert am: 11-10-24 19:21:03 ===

function GST_TYPE_PLAY_VIDEO_RENDERER: TGType;
function GST_PLAY_VIDEO_RENDERER(obj: Pointer): PGstPlayVideoRenderer;
function GST_IS_PLAY_VIDEO_RENDERER(obj: Pointer): Tgboolean;
function GST_PLAY_VIDEO_RENDERER_GET_INTERFACE(obj: Pointer): PGstPlayVideoRendererInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_PLAY_VIDEO_RENDERER: TGType;
begin
  GST_TYPE_PLAY_VIDEO_RENDERER := gst_play_video_renderer_get_type;
end;

function GST_PLAY_VIDEO_RENDERER(obj: Pointer): PGstPlayVideoRenderer;
begin
  Result := PGstPlayVideoRenderer(g_type_check_instance_cast(obj, GST_TYPE_PLAY_VIDEO_RENDERER));
end;

function GST_IS_PLAY_VIDEO_RENDERER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PLAY_VIDEO_RENDERER);
end;

function GST_PLAY_VIDEO_RENDERER_GET_INTERFACE(obj: Pointer): PGstPlayVideoRendererInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_PLAY_VIDEO_RENDERER);
end;



{$ENDIF read_implementation}
