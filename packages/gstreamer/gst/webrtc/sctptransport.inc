
{$IFDEF read_interface}

type
  TGstWebRTCSCTPTransport = record
  end;
  PGstWebRTCSCTPTransport = ^TGstWebRTCSCTPTransport;

  TGstWebRTCSCTPTransportClass = record
  end;
  PGstWebRTCSCTPTransportClass = ^TGstWebRTCSCTPTransportClass;

function gst_webrtc_sctp_transport_get_type: TGType; cdecl; external libgstwebrtc;

// === Konventiert am: 5-10-24 17:13:47 ===

function GST_TYPE_WEBRTC_SCTP_TRANSPORT: TGType;
function GST_WEBRTC_SCTP_TRANSPORT(obj: Pointer): PGstWebRTCSCTPTransport;
function GST_WEBRTC_SCTP_TRANSPORT_CLASS(klass: Pointer): PGstWebRTCSCTPTransportClass;
function GST_IS_WEBRTC_SCTP_TRANSPORT(obj: Pointer): Tgboolean;
function GST_IS_WEBRTC_SCTP_TRANSPORT_CLASS(klass: Pointer): Tgboolean;
function GST_WEBRTC_SCTP_TRANSPORT_GET_CLASS(obj: Pointer): PGstWebRTCSCTPTransportClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_WEBRTC_SCTP_TRANSPORT: TGType;
begin
  GST_TYPE_WEBRTC_SCTP_TRANSPORT := gst_webrtc_sctp_transport_get_type;
end;

function GST_WEBRTC_SCTP_TRANSPORT(obj: Pointer): PGstWebRTCSCTPTransport;
begin
  Result := PGstWebRTCSCTPTransport(g_type_check_instance_cast(obj, GST_TYPE_WEBRTC_SCTP_TRANSPORT));
end;

function GST_WEBRTC_SCTP_TRANSPORT_CLASS(klass: Pointer): PGstWebRTCSCTPTransportClass;
begin
  Result := PGstWebRTCSCTPTransportClass(g_type_check_class_cast(klass, GST_TYPE_WEBRTC_SCTP_TRANSPORT));
end;

function GST_IS_WEBRTC_SCTP_TRANSPORT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_WEBRTC_SCTP_TRANSPORT);
end;

function GST_IS_WEBRTC_SCTP_TRANSPORT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_WEBRTC_SCTP_TRANSPORT);
end;

function GST_WEBRTC_SCTP_TRANSPORT_GET_CLASS(obj: Pointer): PGstWebRTCSCTPTransportClass;
begin
  Result := PGstWebRTCSCTPTransportClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
