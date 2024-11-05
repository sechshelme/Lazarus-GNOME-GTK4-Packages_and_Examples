/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 08-10-2024   19:23                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstPlayerVideoRendererInterface = record
    parent_iface: TGTypeInterface;
    create_video_sink: function(self: PGstPlayerVideoRenderer; player: PGstPlayer): PGstElement; cdecl;
  end;
  PGstPlayerVideoRendererInterface = ^TGstPlayerVideoRendererInterface;

function gst_player_video_renderer_get_type: TGType; cdecl; external libgstplayer;

// === Konventiert am: 8-10-24 18:50:50 ===

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
