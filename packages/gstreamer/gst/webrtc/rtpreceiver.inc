/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 05-10-2024   19:50                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstWebRTCRTPReceiver = record
  end;
  PGstWebRTCRTPReceiver = ^TGstWebRTCRTPReceiver;

  TGstWebRTCRTPReceiverClass = record
  end;
  PGstWebRTCRTPReceiverClass = ^TGstWebRTCRTPReceiverClass;


function gst_webrtc_rtp_receiver_get_type: TGType; cdecl; external libgstwebrtc;

// === Konventiert am: 5-10-24 17:16:09 ===

function GST_TYPE_WEBRTC_RTP_RECEIVER: TGType;
function GST_WEBRTC_RTP_RECEIVER(obj: Pointer): PGstWebRTCRTPReceiver;
function GST_WEBRTC_RTP_RECEIVER_CLASS(klass: Pointer): PGstWebRTCRTPReceiverClass;
function GST_IS_WEBRTC_RTP_RECEIVER(obj: Pointer): Tgboolean;
function GST_IS_WEBRTC_RTP_RECEIVER_CLASS(klass: Pointer): Tgboolean;
function GST_WEBRTC_RTP_RECEIVER_GET_CLASS(obj: Pointer): PGstWebRTCRTPReceiverClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_WEBRTC_RTP_RECEIVER: TGType;
begin
  GST_TYPE_WEBRTC_RTP_RECEIVER := gst_webrtc_rtp_receiver_get_type;
end;

function GST_WEBRTC_RTP_RECEIVER(obj: Pointer): PGstWebRTCRTPReceiver;
begin
  Result := PGstWebRTCRTPReceiver(g_type_check_instance_cast(obj, GST_TYPE_WEBRTC_RTP_RECEIVER));
end;

function GST_WEBRTC_RTP_RECEIVER_CLASS(klass: Pointer): PGstWebRTCRTPReceiverClass;
begin
  Result := PGstWebRTCRTPReceiverClass(g_type_check_class_cast(klass, GST_TYPE_WEBRTC_RTP_RECEIVER));
end;

function GST_IS_WEBRTC_RTP_RECEIVER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_WEBRTC_RTP_RECEIVER);
end;

function GST_IS_WEBRTC_RTP_RECEIVER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_WEBRTC_RTP_RECEIVER);
end;

function GST_WEBRTC_RTP_RECEIVER_GET_CLASS(obj: Pointer): PGstWebRTCRTPReceiverClass;
begin
  Result := PGstWebRTCRTPReceiverClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
