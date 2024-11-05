/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 05-10-2024   19:50                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_webrtc_dtls_transport_state_get_type: TGType; cdecl; external libgstwebrtc;
function GST_TYPE_WEBRTC_DTLS_TRANSPORT_STATE: TGType;

function gst_webrtc_ice_gathering_state_get_type: TGType; cdecl; external libgstwebrtc;
function GST_TYPE_WEBRTC_ICE_GATHERING_STATE: TGType;

function gst_webrtc_ice_connection_state_get_type: TGType; cdecl; external libgstwebrtc;
function GST_TYPE_WEBRTC_ICE_CONNECTION_STATE: TGType;

function gst_webrtc_signaling_state_get_type: TGType; cdecl; external libgstwebrtc;
function GST_TYPE_WEBRTC_SIGNALING_STATE: TGType;

function gst_webrtc_peer_connection_state_get_type: TGType; cdecl; external libgstwebrtc;
function GST_TYPE_WEBRTC_PEER_CONNECTION_STATE: TGType;

function gst_webrtc_ice_role_get_type: TGType; cdecl; external libgstwebrtc;
function GST_TYPE_WEBRTC_ICE_ROLE: TGType;

function gst_webrtc_ice_component_get_type: TGType; cdecl; external libgstwebrtc;
function GST_TYPE_WEBRTC_ICE_COMPONENT: TGType;

function gst_webrtc_sdp_type_get_type: TGType; cdecl; external libgstwebrtc;
function GST_TYPE_WEBRTC_SDP_TYPE: TGType;

function gst_webrtc_rtp_transceiver_direction_get_type: TGType; cdecl; external libgstwebrtc;
function GST_TYPE_WEBRTC_RTP_TRANSCEIVER_DIRECTION: TGType;

function gst_webrtc_dtls_setup_get_type: TGType; cdecl; external libgstwebrtc;
function GST_TYPE_WEBRTC_DTLS_SETUP: TGType;

function gst_webrtc_stats_type_get_type: TGType; cdecl; external libgstwebrtc;
function GST_TYPE_WEBRTC_STATS_TYPE: TGType;

function gst_webrtc_fec_type_get_type: TGType; cdecl; external libgstwebrtc;
function GST_TYPE_WEBRTC_FEC_TYPE: TGType;

function gst_webrtc_sctp_transport_state_get_type: TGType; cdecl; external libgstwebrtc;
function GST_TYPE_WEBRTC_SCTP_TRANSPORT_STATE: TGType;

function gst_webrtc_priority_type_get_type: TGType; cdecl; external libgstwebrtc;
function GST_TYPE_WEBRTC_PRIORITY_TYPE: TGType;

function gst_webrtc_data_channel_state_get_type: TGType; cdecl; external libgstwebrtc;
function GST_TYPE_WEBRTC_DATA_CHANNEL_STATE: TGType;

function gst_webrtc_bundle_policy_get_type: TGType; cdecl; external libgstwebrtc;
function GST_TYPE_WEBRTC_BUNDLE_POLICY: TGType;

function gst_webrtc_ice_transport_policy_get_type: TGType; cdecl; external libgstwebrtc;
function GST_TYPE_WEBRTC_ICE_TRANSPORT_POLICY: TGType;

function gst_webrtc_kind_get_type: TGType; cdecl; external libgstwebrtc;
function GST_TYPE_WEBRTC_KIND: TGType;

function gst_webrtc_error_get_type: TGType; cdecl; external libgstwebrtc;
function GST_TYPE_WEBRTC_ERROR: TGType;

// === Konventiert am: 5-10-24 17:13:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_TYPE_WEBRTC_DTLS_TRANSPORT_STATE: TGType;
begin
  GST_TYPE_WEBRTC_DTLS_TRANSPORT_STATE := gst_webrtc_dtls_transport_state_get_type;
end;

function GST_TYPE_WEBRTC_ICE_GATHERING_STATE: TGType;
begin
  GST_TYPE_WEBRTC_ICE_GATHERING_STATE := gst_webrtc_ice_gathering_state_get_type;
end;

function GST_TYPE_WEBRTC_ICE_CONNECTION_STATE: TGType;
begin
  GST_TYPE_WEBRTC_ICE_CONNECTION_STATE := gst_webrtc_ice_connection_state_get_type;
end;

function GST_TYPE_WEBRTC_SIGNALING_STATE: TGType;
begin
  GST_TYPE_WEBRTC_SIGNALING_STATE := gst_webrtc_signaling_state_get_type;
end;

function GST_TYPE_WEBRTC_PEER_CONNECTION_STATE: TGType;
begin
  GST_TYPE_WEBRTC_PEER_CONNECTION_STATE := gst_webrtc_peer_connection_state_get_type;
end;

function GST_TYPE_WEBRTC_ICE_ROLE: TGType;
begin
  GST_TYPE_WEBRTC_ICE_ROLE := gst_webrtc_ice_role_get_type;
end;

function GST_TYPE_WEBRTC_ICE_COMPONENT: TGType;
begin
  GST_TYPE_WEBRTC_ICE_COMPONENT := gst_webrtc_ice_component_get_type;
end;

function GST_TYPE_WEBRTC_SDP_TYPE: TGType;
begin
  GST_TYPE_WEBRTC_SDP_TYPE := gst_webrtc_sdp_type_get_type;
end;

function GST_TYPE_WEBRTC_RTP_TRANSCEIVER_DIRECTION: TGType;
begin
  GST_TYPE_WEBRTC_RTP_TRANSCEIVER_DIRECTION := gst_webrtc_rtp_transceiver_direction_get_type;
end;

function GST_TYPE_WEBRTC_DTLS_SETUP: TGType;
begin
  GST_TYPE_WEBRTC_DTLS_SETUP := gst_webrtc_dtls_setup_get_type;
end;

function GST_TYPE_WEBRTC_STATS_TYPE: TGType;
begin
  GST_TYPE_WEBRTC_STATS_TYPE := gst_webrtc_stats_type_get_type;
end;

function GST_TYPE_WEBRTC_FEC_TYPE: TGType;
begin
  GST_TYPE_WEBRTC_FEC_TYPE := gst_webrtc_fec_type_get_type;
end;

function GST_TYPE_WEBRTC_SCTP_TRANSPORT_STATE: TGType;
begin
  GST_TYPE_WEBRTC_SCTP_TRANSPORT_STATE := gst_webrtc_sctp_transport_state_get_type;
end;

function GST_TYPE_WEBRTC_PRIORITY_TYPE: TGType;
begin
  GST_TYPE_WEBRTC_PRIORITY_TYPE := gst_webrtc_priority_type_get_type;
end;

function GST_TYPE_WEBRTC_DATA_CHANNEL_STATE: TGType;
begin
  GST_TYPE_WEBRTC_DATA_CHANNEL_STATE := gst_webrtc_data_channel_state_get_type;
end;

function GST_TYPE_WEBRTC_BUNDLE_POLICY: TGType;
begin
  GST_TYPE_WEBRTC_BUNDLE_POLICY := gst_webrtc_bundle_policy_get_type;
end;

function GST_TYPE_WEBRTC_ICE_TRANSPORT_POLICY: TGType;
begin
  GST_TYPE_WEBRTC_ICE_TRANSPORT_POLICY := gst_webrtc_ice_transport_policy_get_type;
end;

function GST_TYPE_WEBRTC_KIND: TGType;
begin
  GST_TYPE_WEBRTC_KIND := gst_webrtc_kind_get_type;
end;

function GST_TYPE_WEBRTC_ERROR: TGType;
begin
  GST_TYPE_WEBRTC_ERROR := gst_webrtc_error_get_type;
end;


{$ENDIF read_implementation}
