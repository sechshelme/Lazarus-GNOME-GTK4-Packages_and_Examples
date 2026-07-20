

  {$IFDEF read_struct}
type
  PGstRTSPOnvifMediaFactoryPrivate = type Pointer;

  PGstRTSPOnvifMediaFactory = ^TGstRTSPOnvifMediaFactory;
  TGstRTSPOnvifMediaFactory = record
    parent: TGstRTSPMediaFactory;
    priv: PGstRTSPOnvifMediaFactoryPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstRTSPOnvifMediaFactoryClass = ^TGstRTSPOnvifMediaFactoryClass;
  TGstRTSPOnvifMediaFactoryClass = record
    parent: TGstRTSPMediaFactoryClass;
    has_backchannel_support: function(factory: PGstRTSPOnvifMediaFactory): Tgboolean; cdecl;
    create_backchannel_stream: function(factory: PGstRTSPOnvifMediaFactory; media: PGstRTSPOnvifMedia; ctx: PGstRTSPContext): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE - 1) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_rtsp_onvif_media_factory_get_type: TGType; cdecl; external libgstrtsp;
function gst_rtsp_onvif_media_factory_new: PGstRTSPMediaFactory; cdecl; external libgstrtsp;
procedure gst_rtsp_onvif_media_factory_set_backchannel_launch(factory: PGstRTSPOnvifMediaFactory; launch: Pgchar); cdecl; external libgstrtsp;
function gst_rtsp_onvif_media_factory_get_backchannel_launch(factory: PGstRTSPOnvifMediaFactory): Pgchar; cdecl; external libgstrtsp;
function gst_rtsp_onvif_media_factory_has_backchannel_support(factory: PGstRTSPOnvifMediaFactory): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_onvif_media_factory_has_replay_support(factory: PGstRTSPOnvifMediaFactory): Tgboolean; cdecl; external libgstrtsp;
procedure gst_rtsp_onvif_media_factory_set_replay_support(factory: PGstRTSPOnvifMediaFactory; has_replay_support: Tgboolean); cdecl; external libgstrtsp;
procedure gst_rtsp_onvif_media_factory_set_backchannel_bandwidth(factory: PGstRTSPOnvifMediaFactory; bandwidth: Tguint); cdecl; external libgstrtsp;
function gst_rtsp_onvif_media_factory_get_backchannel_bandwidth(factory: PGstRTSPOnvifMediaFactory): Tguint; cdecl; external libgstrtsp;
function gst_rtsp_onvif_media_factory_requires_backchannel(factory: PGstRTSPMediaFactory; ctx: PGstRTSPContext): Tgboolean; cdecl; external libgstrtsp;

// === Konventiert am: 20-7-26 13:45:01 ===

function GST_TYPE_RTSP_ONVIF_MEDIA_FACTORY: TGType;
function GST_RTSP_ONVIF_MEDIA_FACTORY(obj: Pointer): PGstRTSPOnvifMediaFactory;
function GST_RTSP_ONVIF_MEDIA_FACTORY_CLASS(klass: Pointer): PGstRTSPOnvifMediaFactoryClass;
function GST_IS_RTSP_ONVIF_MEDIA_FACTORY(obj: Pointer): Tgboolean;
function GST_IS_RTSP_ONVIF_MEDIA_FACTORY_CLASS(klass: Pointer): Tgboolean;
function GST_RTSP_ONVIF_MEDIA_FACTORY_GET_CLASS(obj: Pointer): PGstRTSPOnvifMediaFactoryClass;
function GST_RTSP_ONVIF_MEDIA_FACTORY_CAST(obj: Pointer): PGstRTSPOnvifMediaFactory;
function GST_RTSP_ONVIF_MEDIA_FACTORY_CLASS_CAST(klass: Pointer): PGstRTSPOnvifMediaFactoryClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_RTSP_ONVIF_MEDIA_FACTORY: TGType;
begin
  Result := gst_rtsp_onvif_media_factory_get_type;
end;

function GST_RTSP_ONVIF_MEDIA_FACTORY(obj: Pointer): PGstRTSPOnvifMediaFactory;
begin
  Result := PGstRTSPOnvifMediaFactory(g_type_check_instance_cast(obj, GST_TYPE_RTSP_ONVIF_MEDIA_FACTORY));
end;

function GST_RTSP_ONVIF_MEDIA_FACTORY_CLASS(klass: Pointer): PGstRTSPOnvifMediaFactoryClass;
begin
  Result := PGstRTSPOnvifMediaFactoryClass(g_type_check_class_cast(klass, GST_TYPE_RTSP_ONVIF_MEDIA_FACTORY));
end;

function GST_IS_RTSP_ONVIF_MEDIA_FACTORY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_RTSP_ONVIF_MEDIA_FACTORY);
end;

function GST_IS_RTSP_ONVIF_MEDIA_FACTORY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_RTSP_ONVIF_MEDIA_FACTORY);
end;

function GST_RTSP_ONVIF_MEDIA_FACTORY_GET_CLASS(obj: Pointer): PGstRTSPOnvifMediaFactoryClass;
begin
  Result := PGstRTSPOnvifMediaFactoryClass(PGTypeInstance(obj)^.g_class);
end;

function GST_RTSP_ONVIF_MEDIA_FACTORY_CAST(obj: Pointer): PGstRTSPOnvifMediaFactory;
begin
  Result := PGstRTSPOnvifMediaFactory(obj);
end;

function GST_RTSP_ONVIF_MEDIA_FACTORY_CLASS_CAST(klass: Pointer): PGstRTSPOnvifMediaFactoryClass;
begin
  Result := PGstRTSPOnvifMediaFactoryClass(klass);
end;

{$ENDIF read_implementation}
