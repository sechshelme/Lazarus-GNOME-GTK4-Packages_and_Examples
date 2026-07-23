{$IFDEF read_interface}


type
  PGstWebRTCICETransport = ^TGstWebRTCICETransport;
  TGstWebRTCICETransport = record
    parent: TGstObject;
    role: TGstWebRTCICERole;
    component: TGstWebRTCICEComponent;
    state: TGstWebRTCICEConnectionState;
    gathering_state: TGstWebRTCICEGatheringState;
    src: PGstElement;
    sink: PGstElement;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstWebRTCICETransportClass = ^TGstWebRTCICETransportClass;
  TGstWebRTCICETransportClass = record
    parent_class: TGstObjectClass;
    gather_candidates: function(transport: PGstWebRTCICETransport): Tgboolean; cdecl;
    get_selected_candidate_pair: function(transport: PGstWebRTCICETransport): Pointer; {PGstWebRTCICECandidatePair;} cdecl;
    _padding: array[0..(GST_PADDING - 1) - 1] of Tgpointer;
  end;

function gst_webrtc_ice_transport_get_type: TGType; cdecl; external libgstwebrtc;
procedure gst_webrtc_ice_transport_connection_state_change(ice: PGstWebRTCICETransport; new_state: TGstWebRTCICEConnectionState); cdecl; external libgstwebrtc;
procedure gst_webrtc_ice_transport_gathering_state_change(ice: PGstWebRTCICETransport; new_state: TGstWebRTCICEGatheringState); cdecl; external libgstwebrtc;
procedure gst_webrtc_ice_transport_selected_pair_change(ice: PGstWebRTCICETransport); cdecl; external libgstwebrtc;
procedure gst_webrtc_ice_transport_new_candidate(ice: PGstWebRTCICETransport; stream_id: Tguint; component: TGstWebRTCICEComponent; attr: Pgchar); cdecl; external libgstwebrtc;
function gst_webrtc_ice_transport_get_selected_candidate_pair(transport: PGstWebRTCICETransport): Pointer; {PGstWebRTCICECandidatePair;} cdecl; external libgstwebrtc;

// === Konventiert am: 23-7-26 14:12:31 ===

function GST_TYPE_WEBRTC_ICE_TRANSPORT: TGType;
function GST_WEBRTC_ICE_TRANSPORT(obj: Pointer): PGstWebRTCICETransport;
function GST_WEBRTC_ICE_TRANSPORT_CLASS(klass: Pointer): PGstWebRTCICETransportClass;
function GST_IS_WEBRTC_ICE_TRANSPORT(obj: Pointer): Tgboolean;
function GST_IS_WEBRTC_ICE_TRANSPORT_CLASS(klass: Pointer): Tgboolean;
function GST_WEBRTC_ICE_TRANSPORT_GET_CLASS(obj: Pointer): PGstWebRTCICETransportClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_WEBRTC_ICE_TRANSPORT: TGType;
begin
  GST_TYPE_WEBRTC_ICE_TRANSPORT := gst_webrtc_ice_transport_get_type;
end;

function GST_WEBRTC_ICE_TRANSPORT(obj: Pointer): PGstWebRTCICETransport;
begin
  Result := PGstWebRTCICETransport(g_type_check_instance_cast(obj, GST_TYPE_WEBRTC_ICE_TRANSPORT));
end;

function GST_WEBRTC_ICE_TRANSPORT_CLASS(klass: Pointer): PGstWebRTCICETransportClass;
begin
  Result := PGstWebRTCICETransportClass(g_type_check_class_cast(klass, GST_TYPE_WEBRTC_ICE_TRANSPORT));
end;

function GST_IS_WEBRTC_ICE_TRANSPORT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_WEBRTC_ICE_TRANSPORT);
end;

function GST_IS_WEBRTC_ICE_TRANSPORT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_WEBRTC_ICE_TRANSPORT);
end;

function GST_WEBRTC_ICE_TRANSPORT_GET_CLASS(obj: Pointer): PGstWebRTCICETransportClass;
begin
  Result := PGstWebRTCICETransportClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
