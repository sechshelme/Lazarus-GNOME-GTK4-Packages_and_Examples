

  {$IFDEF read_enum}
const
  GST_RTSP_ONVIF_BACKCHANNEL_REQUIREMENT = 'www.onvif.org/ver20/backchannel';
  GST_RTSP_ONVIF_REPLAY_REQUIREMENT = 'onvif-replay';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstRTSPOnvifServerClass = ^TGstRTSPOnvifServerClass;
  TGstRTSPOnvifServerClass = record
    parent: TGstRTSPServerClass;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;

  PGstRTSPOnvifServer = ^TGstRTSPOnvifServer;
  TGstRTSPOnvifServer = record
    parent: TGstRTSPServer;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_rtsp_onvif_server_get_type: TGType; cdecl; external libgstrtspserver;
function gst_rtsp_onvif_server_new: PGstRTSPServer; cdecl; external libgstrtspserver;

// === Konventiert am: 20-7-26 13:44:53 ===

function GST_TYPE_RTSP_ONVIF_SERVER: TGType;
function GST_RTSP_ONVIF_SERVER(obj: Pointer): PGstRTSPOnvifServer;
function GST_RTSP_ONVIF_SERVER_CLASS(klass: Pointer): PGstRTSPOnvifServerClass;
function GST_IS_RTSP_ONVIF_SERVER(obj: Pointer): Tgboolean;
function GST_IS_RTSP_ONVIF_SERVER_CLASS(klass: Pointer): Tgboolean;
function GST_RTSP_ONVIF_SERVER_GET_CLASS(obj: Pointer): PGstRTSPOnvifServerClass;
function GST_RTSP_ONVIF_SERVER_CAST(obj: Pointer): PGstRTSPOnvifServer;
function GST_RTSP_ONVIF_SERVER_CLASS_CAST(klass: Pointer): PGstRTSPOnvifServerClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_RTSP_ONVIF_SERVER: TGType;
begin
  Result := gst_rtsp_onvif_server_get_type;
end;

function GST_RTSP_ONVIF_SERVER(obj: Pointer): PGstRTSPOnvifServer;
begin
  Result := PGstRTSPOnvifServer(g_type_check_instance_cast(obj, GST_TYPE_RTSP_ONVIF_SERVER));
end;

function GST_RTSP_ONVIF_SERVER_CLASS(klass: Pointer): PGstRTSPOnvifServerClass;
begin
  Result := PGstRTSPOnvifServerClass(g_type_check_class_cast(klass, GST_TYPE_RTSP_ONVIF_SERVER));
end;

function GST_IS_RTSP_ONVIF_SERVER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_RTSP_ONVIF_SERVER);
end;

function GST_IS_RTSP_ONVIF_SERVER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_RTSP_ONVIF_SERVER);
end;

function GST_RTSP_ONVIF_SERVER_GET_CLASS(obj: Pointer): PGstRTSPOnvifServerClass;
begin
  Result := PGstRTSPOnvifServerClass(PGTypeInstance(obj)^.g_class);
end;

function GST_RTSP_ONVIF_SERVER_CAST(obj: Pointer): PGstRTSPOnvifServer;
begin
  Result := PGstRTSPOnvifServer(obj);
end;

function GST_RTSP_ONVIF_SERVER_CLASS_CAST(klass: Pointer): PGstRTSPOnvifServerClass;
begin
  Result := PGstRTSPOnvifServerClass(klass);
end;

{$ENDIF read_implementation}
