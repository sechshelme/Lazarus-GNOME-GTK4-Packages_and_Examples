
{$IFDEF read_interface}

type
  TGstWebRTCDTLSTransport = record
  end;
  PGstWebRTCDTLSTransport = ^TGstWebRTCDTLSTransport;

  TGstWebRTCDTLSTransportClass = record
  end;
  PGstWebRTCDTLSTransportClass = ^TGstWebRTCDTLSTransportClass;


function gst_webrtc_dtls_transport_get_type: TGType; cdecl; external libgstwebrtc;

// === Konventiert am: 5-10-24 17:12:41 ===

function GST_TYPE_WEBRTC_DTLS_TRANSPORT: TGType;
function GST_WEBRTC_DTLS_TRANSPORT(obj: Pointer): PGstWebRTCDTLSTransport;
function GST_WEBRTC_DTLS_TRANSPORT_CLASS(klass: Pointer): PGstWebRTCDTLSTransportClass;
function GST_IS_WEBRTC_DTLS_TRANSPORT(obj: Pointer): Tgboolean;
function GST_IS_WEBRTC_DTLS_TRANSPORT_CLASS(klass: Pointer): Tgboolean;
function GST_WEBRTC_DTLS_TRANSPORT_GET_CLASS(obj: Pointer): PGstWebRTCDTLSTransportClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_WEBRTC_DTLS_TRANSPORT: TGType;
begin
  GST_TYPE_WEBRTC_DTLS_TRANSPORT := gst_webrtc_dtls_transport_get_type;
end;

function GST_WEBRTC_DTLS_TRANSPORT(obj: Pointer): PGstWebRTCDTLSTransport;
begin
  Result := PGstWebRTCDTLSTransport(g_type_check_instance_cast(obj, GST_TYPE_WEBRTC_DTLS_TRANSPORT));
end;

function GST_WEBRTC_DTLS_TRANSPORT_CLASS(klass: Pointer): PGstWebRTCDTLSTransportClass;
begin
  Result := PGstWebRTCDTLSTransportClass(g_type_check_class_cast(klass, GST_TYPE_WEBRTC_DTLS_TRANSPORT));
end;

function GST_IS_WEBRTC_DTLS_TRANSPORT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_WEBRTC_DTLS_TRANSPORT);
end;

function GST_IS_WEBRTC_DTLS_TRANSPORT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_WEBRTC_DTLS_TRANSPORT);
end;

function GST_WEBRTC_DTLS_TRANSPORT_GET_CLASS(obj: Pointer): PGstWebRTCDTLSTransportClass;
begin
  Result := PGstWebRTCDTLSTransportClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
