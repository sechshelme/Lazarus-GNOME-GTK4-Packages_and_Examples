
{$IFDEF read_interface}

type
  TGstWebRTCRTPSender = record
  end;
  PGstWebRTCRTPSender = ^TGstWebRTCRTPSender;

  TGstWebRTCRTPSenderClass = record
  end;
  PGstWebRTCRTPSenderClass = ^TGstWebRTCRTPSenderClass;

function gst_webrtc_rtp_sender_get_type: TGType; cdecl; external libgstwebrtc;
procedure gst_webrtc_rtp_sender_set_priority(Sender: PGstWebRTCRTPSender; priority: TGstWebRTCPriorityType); cdecl; external libgstwebrtc;

// === Konventiert am: 5-10-24 17:13:34 ===

function GST_TYPE_WEBRTC_RTP_SENDER: TGType;
function GST_WEBRTC_RTP_SENDER(obj: Pointer): PGstWebRTCRTPSender;
function GST_WEBRTC_RTP_SENDER_CLASS(klass: Pointer): PGstWebRTCRTPSenderClass;
function GST_IS_WEBRTC_RTP_SENDER(obj: Pointer): Tgboolean;
function GST_IS_WEBRTC_RTP_SENDER_CLASS(klass: Pointer): Tgboolean;
function GST_WEBRTC_RTP_SENDER_GET_CLASS(obj: Pointer): PGstWebRTCRTPSenderClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_WEBRTC_RTP_SENDER: TGType;
begin
  GST_TYPE_WEBRTC_RTP_SENDER := gst_webrtc_rtp_sender_get_type;
end;

function GST_WEBRTC_RTP_SENDER(obj: Pointer): PGstWebRTCRTPSender;
begin
  Result := PGstWebRTCRTPSender(g_type_check_instance_cast(obj, GST_TYPE_WEBRTC_RTP_SENDER));
end;

function GST_WEBRTC_RTP_SENDER_CLASS(klass: Pointer): PGstWebRTCRTPSenderClass;
begin
  Result := PGstWebRTCRTPSenderClass(g_type_check_class_cast(klass, GST_TYPE_WEBRTC_RTP_SENDER));
end;

function GST_IS_WEBRTC_RTP_SENDER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_WEBRTC_RTP_SENDER);
end;

function GST_IS_WEBRTC_RTP_SENDER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_WEBRTC_RTP_SENDER);
end;

function GST_WEBRTC_RTP_SENDER_GET_CLASS(obj: Pointer): PGstWebRTCRTPSenderClass;
begin
  Result := PGstWebRTCRTPSenderClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
