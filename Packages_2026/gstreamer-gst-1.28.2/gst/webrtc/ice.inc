{$IFDEF read_interface}


type
  PGstWebRTCICE = ^TGstWebRTCICE;
  TGstWebRTCICE = record
    parent: TGstObject;
    ice_gathering_state: TGstWebRTCICEGatheringState;
    ice_connection_state: TGstWebRTCICEConnectionState;
    min_rtp_port: Tguint;
    max_rtp_port: Tguint;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PPGstWebRTCICECandidateStats = ^PGstWebRTCICECandidateStats;
  PGstWebRTCICECandidateStats = ^TGstWebRTCICECandidateStats;
  TGstWebRTCICECandidateStats = record
    ipaddr: Pgchar;
    port: Tguint;
    stream_id: Tguint;
    _type: Pgchar;
    proto: Pgchar;
    relay_proto: Pgchar;
    prio: Tguint;
    url: Pgchar;
    ABI: record
      case longint of
        0: (abi: record
            foundation: Pgchar;
            related_address: Pgchar;
            related_port: Tguint;
            username_fragment: Pgchar;
            tcp_type: TGstWebRTCICETcpCandidateType;
            end);
        1: (_gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer);
      end;
  end;

type
  PGstWebRTCICECandidate = ^TGstWebRTCICECandidate;
  TGstWebRTCICECandidate = record
    candidate: Pgchar;
    component: Tgint;
    sdp_mid: Pgchar;
    sdp_mline_index: Tgint;
    stats: PGstWebRTCICECandidateStats;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;

  PGstWebRTCICECandidatePair = ^TGstWebRTCICECandidatePair;
  TGstWebRTCICECandidatePair = record
    local: PGstWebRTCICECandidate;
    remote: PGstWebRTCICECandidate;
  end;

  TGstWebRTCICEOnCandidateFunc = procedure(ice: PGstWebRTCICE; stream_id: Tguint; candidate: Pgchar; user_data: Tgpointer); cdecl;

  PGstWebRTCICEClass = ^TGstWebRTCICEClass;
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
    close: procedure(ice: PGstWebRTCICE; promise: PGstPromise); cdecl;
    _gst_reserved: array[0..(GST_PADDING - 1) - 1] of Tgpointer;
  end;

function gst_webrtc_ice_get_type: TGType; cdecl; external libgstwebrtc;
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
function gst_webrtc_ice_get_selected_pair(ice: PGstWebRTCICE; stream: PGstWebRTCICEStream; local_stats: PPGstWebRTCICECandidateStats; remote_stats: PPGstWebRTCICECandidateStats): Tgboolean; cdecl; external libgstwebrtc; deprecated;

procedure gst_webrtc_ice_candidate_stats_free(stats: PGstWebRTCICECandidateStats); cdecl; external libgstwebrtc;
function gst_webrtc_ice_candidate_stats_get_type: TGType; cdecl; external libgstwebrtc;
function gst_webrtc_ice_candidate_stats_copy(stats: PGstWebRTCICECandidateStats): PGstWebRTCICECandidateStats; cdecl; external libgstwebrtc;
procedure gst_webrtc_ice_close(ice: PGstWebRTCICE; promise: PGstPromise); cdecl; external libgstwebrtc;
procedure gst_webrtc_ice_candidate_free(candidate: PGstWebRTCICECandidate); cdecl; external libgstwebrtc;
function gst_webrtc_ice_candidate_get_type: TGType; cdecl; external libgstwebrtc;
function gst_webrtc_ice_candidate_copy(candidate: PGstWebRTCICECandidate): PGstWebRTCICECandidate; cdecl; external libgstwebrtc;
procedure gst_webrtc_ice_candidate_pair_free(pair: PGstWebRTCICECandidatePair); cdecl; external libgstwebrtc;
function gst_webrtc_ice_candidate_pair_get_type: TGType; cdecl; external libgstwebrtc;
function gst_webrtc_ice_candidate_pair_copy(pair: PGstWebRTCICECandidatePair): PGstWebRTCICECandidatePair; cdecl; external libgstwebrtc;

// === Konventiert am: 23-7-26 14:12:56 ===

function GST_TYPE_WEBRTC_ICE: TGType;
function GST_WEBRTC_ICE(obj: Pointer): PGstWebRTCICE;
function GST_WEBRTC_ICE_CLASS(klass: Pointer): PGstWebRTCICEClass;
function GST_IS_WEBRTC_ICE(obj: Pointer): Tgboolean;
function GST_IS_WEBRTC_ICE_CLASS(klass: Pointer): Tgboolean;
function GST_WEBRTC_ICE_GET_CLASS(obj: Pointer): PGstWebRTCICEClass;

function GST_WEBRTC_ICE_CANDIDATE_STATS_ADDRESS(c: PGstWebRTCICECandidateStats): pchar;
function GST_WEBRTC_ICE_CANDIDATE_STATS_PORT(c: PGstWebRTCICECandidateStats): TGuint;
function GST_WEBRTC_ICE_CANDIDATE_STATS_STREAM_ID(c: PGstWebRTCICECandidateStats): TGuint;
function GST_WEBRTC_ICE_CANDIDATE_STATS_TYPE(c: PGstWebRTCICECandidateStats): pchar;
function GST_WEBRTC_ICE_CANDIDATE_STATS_PROTOCOL(c: PGstWebRTCICECandidateStats): pchar;
function GST_WEBRTC_ICE_CANDIDATE_STATS_RELAY_PROTOCOL(c: PGstWebRTCICECandidateStats): pchar;
function GST_WEBRTC_ICE_CANDIDATE_STATS_PRIORITY(c: PGstWebRTCICECandidateStats): TGuint;
function GST_WEBRTC_ICE_CANDIDATE_STATS_URL(c: PGstWebRTCICECandidateStats): pchar;
function GST_WEBRTC_ICE_CANDIDATE_STATS_FOUNDATION(c: PGstWebRTCICECandidateStats): pchar;
function GST_WEBRTC_ICE_CANDIDATE_STATS_RELATED_ADDRESS(c: PGstWebRTCICECandidateStats): pchar;
function GST_WEBRTC_ICE_CANDIDATE_STATS_RELATED_PORT(c: PGstWebRTCICECandidateStats): TGuint;
function GST_WEBRTC_ICE_CANDIDATE_STATS_USERNAME_FRAGMENT(c: PGstWebRTCICECandidateStats): pchar;
function GST_WEBRTC_ICE_CANDIDATE_STATS_TCP_TYPE(c: PGstWebRTCICECandidateStats): LongInt;

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


function GST_WEBRTC_ICE_CANDIDATE_STATS_ADDRESS(c: PGstWebRTCICECandidateStats): pchar;
begin
  Result := c^.ipaddr;
end;

function GST_WEBRTC_ICE_CANDIDATE_STATS_PORT(c: PGstWebRTCICECandidateStats): TGuint;
begin
  Result := c^.port;
end;

function GST_WEBRTC_ICE_CANDIDATE_STATS_STREAM_ID(c: PGstWebRTCICECandidateStats): TGuint;
begin
  Result := c^.stream_id;
end;

function GST_WEBRTC_ICE_CANDIDATE_STATS_TYPE(c: PGstWebRTCICECandidateStats): pchar;
begin
  Result := c^._type;
end;

function GST_WEBRTC_ICE_CANDIDATE_STATS_PROTOCOL(c: PGstWebRTCICECandidateStats): pchar;
begin
  Result := c^.proto;
end;

function GST_WEBRTC_ICE_CANDIDATE_STATS_RELAY_PROTOCOL(c: PGstWebRTCICECandidateStats): pchar;
begin
  Result := c^.relay_proto;
end;

function GST_WEBRTC_ICE_CANDIDATE_STATS_PRIORITY(c: PGstWebRTCICECandidateStats): TGuint;
begin
  Result := c^.prio;
end;

function GST_WEBRTC_ICE_CANDIDATE_STATS_URL(c: PGstWebRTCICECandidateStats): pchar;
begin
  Result := c^.url;
end;

function GST_WEBRTC_ICE_CANDIDATE_STATS_FOUNDATION(c: PGstWebRTCICECandidateStats): pchar;
begin
  Result := c^.ABI.abi.foundation;
end;

function GST_WEBRTC_ICE_CANDIDATE_STATS_RELATED_ADDRESS(c: PGstWebRTCICECandidateStats): pchar;
begin
  Result := c^.ABI.abi.related_address;
end;

function GST_WEBRTC_ICE_CANDIDATE_STATS_RELATED_PORT(c: PGstWebRTCICECandidateStats): TGuint;
begin
  Result := c^.ABI.abi.related_port;
end;

function GST_WEBRTC_ICE_CANDIDATE_STATS_USERNAME_FRAGMENT(c: PGstWebRTCICECandidateStats): pchar;
begin
  Result := c^.ABI.abi.username_fragment;
end;

function GST_WEBRTC_ICE_CANDIDATE_STATS_TCP_TYPE(c: PGstWebRTCICECandidateStats
  ): LongInt;
begin
  Result := c^.ABI.abi.tcp_type;
end;

{$ENDIF read_implementation}
