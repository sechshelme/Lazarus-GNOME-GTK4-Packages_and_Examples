

  {$IFDEF read_struct}
type
  PGstRTSPOnvifClientClass = ^TGstRTSPOnvifClientClass;
  TGstRTSPOnvifClientClass = record
    parent: TGstRTSPClientClass;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;

  PGstRTSPOnvifClient = ^TGstRTSPOnvifClient;
  TGstRTSPOnvifClient = record
    parent: TGstRTSPClient;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_rtsp_onvif_client_get_type: TGType; cdecl; external libgstrtsp;
function gst_rtsp_onvif_client_new: PGstRTSPClient; cdecl; external libgstrtsp;

// === Konventiert am: 20-7-26 13:45:14 ===

function GST_TYPE_RTSP_ONVIF_CLIENT: TGType;
function GST_RTSP_ONVIF_CLIENT(obj: Pointer): PGstRTSPOnvifClient;
function GST_RTSP_ONVIF_CLIENT_CLASS(klass: Pointer): PGstRTSPOnvifClientClass;
function GST_IS_RTSP_ONVIF_CLIENT(obj: Pointer): Tgboolean;
function GST_IS_RTSP_ONVIF_CLIENT_CLASS(klass: Pointer): Tgboolean;
function GST_RTSP_ONVIF_CLIENT_GET_CLASS(obj: Pointer): PGstRTSPOnvifClientClass;
function GST_RTSP_ONVIF_CLIENT_CAST(obj: Pointer): PGstRTSPOnvifClient;
function GST_RTSP_ONVIF_CLIENT_CLASS_CAST(klass: Pointer): PGstRTSPOnvifClientClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_RTSP_ONVIF_CLIENT: TGType;
begin
  Result := gst_rtsp_onvif_client_get_type;
end;

function GST_RTSP_ONVIF_CLIENT(obj: Pointer): PGstRTSPOnvifClient;
begin
  Result := PGstRTSPOnvifClient(g_type_check_instance_cast(obj, GST_TYPE_RTSP_ONVIF_CLIENT));
end;

function GST_RTSP_ONVIF_CLIENT_CLASS(klass: Pointer): PGstRTSPOnvifClientClass;
begin
  Result := PGstRTSPOnvifClientClass(g_type_check_class_cast(klass, GST_TYPE_RTSP_ONVIF_CLIENT));
end;

function GST_IS_RTSP_ONVIF_CLIENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_RTSP_ONVIF_CLIENT);
end;

function GST_IS_RTSP_ONVIF_CLIENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_RTSP_ONVIF_CLIENT);
end;

function GST_RTSP_ONVIF_CLIENT_GET_CLASS(obj: Pointer): PGstRTSPOnvifClientClass;
begin
  Result := PGstRTSPOnvifClientClass(PGTypeInstance(obj)^.g_class);
end;

function GST_RTSP_ONVIF_CLIENT_CAST(obj: Pointer): PGstRTSPOnvifClient;
begin
  Result := PGstRTSPOnvifClient(obj);
end;

function GST_RTSP_ONVIF_CLIENT_CLASS_CAST(klass: Pointer): PGstRTSPOnvifClientClass;
begin
  Result := PGstRTSPOnvifClientClass(klass);
end;

{$ENDIF read_implementation}
