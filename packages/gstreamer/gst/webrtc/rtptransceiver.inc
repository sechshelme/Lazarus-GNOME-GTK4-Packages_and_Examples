/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 05-10-2024   19:50                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstWebRTCRTPTransceiver = record
  end;
  PGstWebRTCRTPTransceiver = ^TGstWebRTCRTPTransceiver;

  TGstWebRTCRTPTransceiverClass = record
  end;
  PGstWebRTCRTPTransceiverClass = ^TGstWebRTCRTPTransceiverClass;

function gst_webrtc_rtp_transceiver_get_type: TGType; cdecl; external libgstwebrtc;

// === Konventiert am: 5-10-24 17:13:40 ===

function GST_TYPE_WEBRTC_RTP_TRANSCEIVER: TGType;
function GST_WEBRTC_RTP_TRANSCEIVER(obj: Pointer): PGstWebRTCRTPTransceiver;
function GST_WEBRTC_RTP_TRANSCEIVER_CLASS(klass: Pointer): PGstWebRTCRTPTransceiverClass;
function GST_IS_WEBRTC_RTP_TRANSCEIVER(obj: Pointer): Tgboolean;
function GST_IS_WEBRTC_RTP_TRANSCEIVER_CLASS(klass: Pointer): Tgboolean;
function GST_WEBRTC_RTP_TRANSCEIVER_GET_CLASS(obj: Pointer): PGstWebRTCRTPTransceiverClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_WEBRTC_RTP_TRANSCEIVER: TGType;
begin
  GST_TYPE_WEBRTC_RTP_TRANSCEIVER := gst_webrtc_rtp_transceiver_get_type;
end;

function GST_WEBRTC_RTP_TRANSCEIVER(obj: Pointer): PGstWebRTCRTPTransceiver;
begin
  Result := PGstWebRTCRTPTransceiver(g_type_check_instance_cast(obj, GST_TYPE_WEBRTC_RTP_TRANSCEIVER));
end;

function GST_WEBRTC_RTP_TRANSCEIVER_CLASS(klass: Pointer): PGstWebRTCRTPTransceiverClass;
begin
  Result := PGstWebRTCRTPTransceiverClass(g_type_check_class_cast(klass, GST_TYPE_WEBRTC_RTP_TRANSCEIVER));
end;

function GST_IS_WEBRTC_RTP_TRANSCEIVER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_WEBRTC_RTP_TRANSCEIVER);
end;

function GST_IS_WEBRTC_RTP_TRANSCEIVER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_WEBRTC_RTP_TRANSCEIVER);
end;

function GST_WEBRTC_RTP_TRANSCEIVER_GET_CLASS(obj: Pointer): PGstWebRTCRTPTransceiverClass;
begin
  Result := PGstWebRTCRTPTransceiverClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
