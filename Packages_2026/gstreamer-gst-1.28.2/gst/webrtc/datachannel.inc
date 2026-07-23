{$IFDEF read_interface}

type
  PGstWebRTCDataChannel = type Pointer;
  PGstWebRTCDataChannelClass = type Pointer;

function gst_webrtc_data_channel_get_type: TGType; cdecl; external libgstwebrtc;
function gst_webrtc_data_channel_send_data_full(channel: PGstWebRTCDataChannel; data: PGBytes; error: PPGError): Tgboolean; cdecl; external libgstwebrtc;
function gst_webrtc_data_channel_send_string_full(channel: PGstWebRTCDataChannel; str: Pgchar; error: PPGError): Tgboolean; cdecl; external libgstwebrtc;
procedure gst_webrtc_data_channel_close(channel: PGstWebRTCDataChannel); cdecl; external libgstwebrtc;
procedure gst_webrtc_data_channel_send_data(channel: PGstWebRTCDataChannel; data: PGBytes); cdecl; external libgstwebrtc; deprecated;
procedure gst_webrtc_data_channel_send_string(channel: PGstWebRTCDataChannel; str: Pgchar); cdecl; external libgstwebrtc; deprecated;

// === Konventiert am: 23-7-26 14:13:05 ===

function GST_TYPE_WEBRTC_DATA_CHANNEL: TGType;
function GST_WEBRTC_DATA_CHANNEL(obj: Pointer): PGstWebRTCDataChannel;
function GST_WEBRTC_DATA_CHANNEL_CLASS(klass: Pointer): PGstWebRTCDataChannelClass;
function GST_IS_WEBRTC_DATA_CHANNEL(obj: Pointer): Tgboolean;
function GST_IS_WEBRTC_DATA_CHANNEL_CLASS(klass: Pointer): Tgboolean;
function GST_WEBRTC_DATA_CHANNEL_GET_CLASS(obj: Pointer): PGstWebRTCDataChannelClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_WEBRTC_DATA_CHANNEL: TGType;
begin
  GST_TYPE_WEBRTC_DATA_CHANNEL := gst_webrtc_data_channel_get_type;
end;

function GST_WEBRTC_DATA_CHANNEL(obj: Pointer): PGstWebRTCDataChannel;
begin
  Result := PGstWebRTCDataChannel(g_type_check_instance_cast(obj, GST_TYPE_WEBRTC_DATA_CHANNEL));
end;

function GST_WEBRTC_DATA_CHANNEL_CLASS(klass: Pointer): PGstWebRTCDataChannelClass;
begin
  Result := PGstWebRTCDataChannelClass(g_type_check_class_cast(klass, GST_TYPE_WEBRTC_DATA_CHANNEL));
end;

function GST_IS_WEBRTC_DATA_CHANNEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_WEBRTC_DATA_CHANNEL);
end;

function GST_IS_WEBRTC_DATA_CHANNEL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_WEBRTC_DATA_CHANNEL);
end;

function GST_WEBRTC_DATA_CHANNEL_GET_CLASS(obj: Pointer): PGstWebRTCDataChannelClass;
begin
  Result := PGstWebRTCDataChannelClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
