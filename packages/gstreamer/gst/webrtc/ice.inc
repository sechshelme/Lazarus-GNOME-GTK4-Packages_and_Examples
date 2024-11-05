/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 05-10-2024   19:50                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_webrtc_ice_get_type: TGType; cdecl; external libgstwebrtc;

type
  TGstWebRTCICE = record
    parent: TGstObject;
    ice_gathering_state: TGstWebRTCICEGatheringState;
    ice_connection_state: TGstWebRTCICEConnectionState;
    min_rtp_port: Tguint;
    max_rtp_port: Tguint;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstWebRTCICE = ^TGstWebRTCICE;

  TGstWebRTCICECandidateStats = record
    ipaddr: Pgchar;
    port: Tguint;
    stream_id: Tguint;
    _type: Pgchar;
    proto: Pgchar;
    relay_proto: Pgchar;
    prio: Tguint;
    url: Pgchar;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;
  PGstWebRTCICECandidateStats = ^TGstWebRTCICECandidateStats;
  PPGstWebRTCICECandidateStats = ^PGstWebRTCICECandidateStats;

  TGstWebRTCICEOnCandidateFunc = procedure(ice: PGstWebRTCICE; stream_id: Tguint; candidate: Pgchar; user_data: Tgpointer); cdecl;

  TGstWebRTCICEClass = record
    parent_class: TGstObjectClass;
    add_stream: function(ice: PGstWebRTCICE; session_id: Tguint): PGstWebRTCICEStream; cdecl;
    find_transport: function(ice: PGstWebRTCICE; stream: PGstWebRTCICEStream; component: TGstWebRTCICEComponent): PGstWebRTCICETransport; cdecl;
    gather_candidates: function(ice: PGstWebRTCICE; stream: PGstWebRTCICEStream): Tgboolean; cdecl;
    add_candidate: procedure(ice: PGstWebRTCICE; stream: PGstWebRTCICEStream; candidate: Pgchar; promise: PGstPromise); cdecl;
    set_local_credentials: function(ice: PGstWebRTCICE; stream: PGstWebRTCICEStream; ufrag: Pgchar; pwd: Pgchar): Tgboolean; cdecl;
    set_remote_credentials: function(ice: PGstWebRTCICE; stream: PGstWebRTCICEStream; ufrag: Pgchar; pwd: Pgchar): Tgboolean; cdecl;
    add_turn_server: function(ice: PGstWebRTCICE; uri: Pgchar): Tgboolean; cdecl;
    set_is_controller: procedure(ice: PGstWebRTCICE; controller: Tgboolean); cdecl;
    get_is_controller: function(ice: PGstWebRTCICE): Tgboolean; cdecl;
    set_force_relay: procedure(ice: PGstWebRTCICE; force_relay: Tgboolean); cdecl;
    set_stun_server: procedure(ice: PGstWebRTCICE; uri: Pgchar); cdecl;
    get_stun_server: function(ice: PGstWebRTCICE): Pgchar; cdecl;
    set_turn_server: procedure(ice: PGstWebRTCICE; uri: Pgchar); cdecl;
    get_turn_server: function(ice: PGstWebRTCICE): Pgchar; cdecl;
    set_http_proxy: procedure(ice: PGstWebRTCICE; uri: Pgchar); cdecl;
    get_http_proxy: function(ice: PGstWebRTCICE): Pgchar; cdecl;
    set_tos: procedure(ice: PGstWebRTCICE; stream: PGstWebRTCICEStream; tos: Tguint); cdecl;
    set_on_ice_candidate: procedure(ice: PGstWebRTCICE; func: TGstWebRTCICEOnCandidateFunc; user_data: Tgpointer; notify: TGDestroyNotify); cdecl;
    get_local_candidates: function(ice: PGstWebRTCICE; stream: PGstWebRTCICEStream): PPGstWebRTCICECandidateStats; cdecl;
    get_remote_candidates: function(ice: PGstWebRTCICE; stream: PGstWebRTCICEStream): PPGstWebRTCICECandidateStats; cdecl;
    get_selected_pair: function(ice: PGstWebRTCICE; stream: PGstWebRTCICEStream; local_stats: PPGstWebRTCICECandidateStats; remote_stats: PPGstWebRTCICECandidateStats): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstWebRTCICEClass = ^TGstWebRTCICEClass;


function gst_webrtc_ice_add_stream(ice: PGstWebRTCICE; session_id: Tguint): PGstWebRTCICEStream; cdecl; external libgstwebrtc;
function gst_webrtc_ice_find_transport(ice: PGstWebRTCICE; stream: PGstWebRTCICEStream; component: TGstWebRTCICEComponent): PGstWebRTCICETransport; cdecl; external libgstwebrtc;
function gst_webrtc_ice_gather_candidates(ice: PGstWebRTCICE; stream: PGstWebRTCICEStream): Tgboolean; cdecl; external libgstwebrtc;
procedure gst_webrtc_ice_add_candidate(ice: PGstWebRTCICE; stream: PGstWebRTCICEStream; candidate: Pgchar; promise: PGstPromise); cdecl; external libgstwebrtc;
function gst_webrtc_ice_set_local_credentials(ice: PGstWebRTCICE; stream: PGstWebRTCICEStream; ufrag: Pgchar; pwd: Pgchar): Tgboolean; cdecl; external libgstwebrtc;
function gst_webrtc_ice_set_remote_credentials(ice: PGstWebRTCICE; stream: PGstWebRTCICEStream; ufrag: Pgchar; pwd: Pgchar): Tgboolean; cdecl; external libgstwebrtc;
function gst_webrtc_ice_add_turn_server(ice: PGstWebRTCICE; uri: Pgchar): Tgboolean; cdecl; external libgstwebrtc;
procedure gst_webrtc_ice_set_is_controller(ice: PGstWebRTCICE; controller: Tgboolean); cdecl; external libgstwebrtc;
function gst_webrtc_ice_get_is_controller(ice: PGstWebRTCICE): Tgboolean; cdecl; external libgstwebrtc;
procedure gst_webrtc_ice_set_force_relay(ice: PGstWebRTCICE; force_relay: Tgboolean); cdecl; external libgstwebrtc;
procedure gst_webrtc_ice_set_stun_server(ice: PGstWebRTCICE; uri: Pgchar); cdecl; external libgstwebrtc;
function gst_webrtc_ice_get_stun_server(ice: PGstWebRTCICE): Pgchar; cdecl; external libgstwebrtc;
procedure gst_webrtc_ice_set_turn_server(ice: PGstWebRTCICE; uri: Pgchar); cdecl; external libgstwebrtc;
function gst_webrtc_ice_get_turn_server(ice: PGstWebRTCICE): Pgchar; cdecl; external libgstwebrtc;
procedure gst_webrtc_ice_set_http_proxy(ice: PGstWebRTCICE; uri: Pgchar); cdecl; external libgstwebrtc;
function gst_webrtc_ice_get_http_proxy(ice: PGstWebRTCICE): Pgchar; cdecl; external libgstwebrtc;
procedure gst_webrtc_ice_set_on_ice_candidate(ice: PGstWebRTCICE; func: TGstWebRTCICEOnCandidateFunc; user_data: Tgpointer; notify: TGDestroyNotify); cdecl; external libgstwebrtc;
procedure gst_webrtc_ice_set_tos(ice: PGstWebRTCICE; stream: PGstWebRTCICEStream; tos: Tguint); cdecl; external libgstwebrtc;
function gst_webrtc_ice_get_local_candidates(ice: PGstWebRTCICE; stream: PGstWebRTCICEStream): PPGstWebRTCICECandidateStats; cdecl; external libgstwebrtc;
function gst_webrtc_ice_get_remote_candidates(ice: PGstWebRTCICE; stream: PGstWebRTCICEStream): PPGstWebRTCICECandidateStats; cdecl; external libgstwebrtc;
function gst_webrtc_ice_get_selected_pair(ice: PGstWebRTCICE; stream: PGstWebRTCICEStream; local_stats: PPGstWebRTCICECandidateStats; remote_stats: PPGstWebRTCICECandidateStats): Tgboolean; cdecl; external libgstwebrtc;
procedure gst_webrtc_ice_candidate_stats_free(stats: PGstWebRTCICECandidateStats); cdecl; external libgstwebrtc;
function gst_webrtc_ice_candidate_stats_get_type: TGType; cdecl; external libgstwebrtc;
function gst_webrtc_ice_candidate_stats_copy(stats: PGstWebRTCICECandidateStats): PGstWebRTCICECandidateStats; cdecl; external libgstwebrtc;

// === Konventiert am: 5-10-24 17:12:50 ===

function GST_TYPE_WEBRTC_ICE: TGType;
function GST_WEBRTC_ICE(obj: Pointer): PGstWebRTCICE;
function GST_WEBRTC_ICE_CLASS(klass: Pointer): PGstWebRTCICEClass;
function GST_IS_WEBRTC_ICE(obj: Pointer): Tgboolean;
function GST_IS_WEBRTC_ICE_CLASS(klass: Pointer): Tgboolean;
function GST_WEBRTC_ICE_GET_CLASS(obj: Pointer): PGstWebRTCICEClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_WEBRTC_ICE: TGType;
begin
  GST_TYPE_WEBRTC_ICE := gst_webrtc_ice_get_type;
end;

function GST_WEBRTC_ICE(obj: Pointer): PGstWebRTCICE;
begin
  Result := PGstWebRTCICE(g_type_check_instance_cast(obj, GST_TYPE_WEBRTC_ICE));
end;

function GST_WEBRTC_ICE_CLASS(klass: Pointer): PGstWebRTCICEClass;
begin
  Result := PGstWebRTCICEClass(g_type_check_class_cast(klass, GST_TYPE_WEBRTC_ICE));
end;

function GST_IS_WEBRTC_ICE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_WEBRTC_ICE);
end;

function GST_IS_WEBRTC_ICE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_WEBRTC_ICE);
end;

function GST_WEBRTC_ICE_GET_CLASS(obj: Pointer): PGstWebRTCICEClass;
begin
  Result := PGstWebRTCICEClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
