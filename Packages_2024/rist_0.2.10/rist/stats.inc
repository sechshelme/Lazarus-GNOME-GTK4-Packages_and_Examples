{$IFDEF read_interface}


type
  Prist_stats_sender_peer = ^Trist_stats_sender_peer;
  Trist_stats_sender_peer = record
    cname: array[0..(RIST_MAX_STRING_SHORT) - 1] of char;
    peer_id: Tuint32_t;
    bandwidth: Tsize_t;
    retry_bandwidth: Tsize_t;
    sent: Tuint64_t;
    received: Tuint64_t;
    retransmitted: Tuint64_t;
    quality: double;
    rtt: Tuint32_t;
  end;

  Prist_stats_receiver_flow = ^Trist_stats_receiver_flow;
  Trist_stats_receiver_flow = record
    peer_count: Tuint32_t;
    cname: array[0..(RIST_MAX_STRING_LONG) - 1] of char;
    flow_id: Tuint32_t;
    status: longint;
    bandwidth: Tsize_t;
    retry_bandwidth: Tsize_t;
    sent: Tuint64_t;
    received: Tuint64_t;
    missing: Tuint32_t;
    reordered: Tuint32_t;
    recovered: Tuint32_t;
    recovered_one_retry: Tuint32_t;
    lost: Tuint32_t;
    quality: double;
    min_inter_packet_spacing: Tuint64_t;
    cur_inter_packet_spacing: Tuint64_t;
    max_inter_packet_spacing: Tuint64_t;
    rtt: Tuint32_t;
  end;

type
  Trist_stats_type = longint;
const
  RIST_STATS_SENDER_PEER = 0;
  RIST_STATS_RECEIVER_FLOW = 1;

const
  RIST_STATS_VERSION = 0;

type
  Prist_stats = ^Trist_stats;
  Trist_stats = record
    json_size: Tuint32_t;
    stats_json: pchar;
    version: Tuint16_t;
    stats_type: Trist_stats_type;
    stats: record
      case longint of
        0: (sender_peer: Trist_stats_sender_peer);
        1: (receiver_flow: Trist_stats_receiver_flow);
      end;
  end;

  Tcallback_set_func = function(arg: pointer; stats_container: Prist_stats): longint; cdecl;

function rist_stats_callback_set(ctx: Prist_ctx; statsinterval: longint; stats_cb: Tcallback_set_func; arg: pointer): longint; cdecl; external librist;
function rist_stats_free(stats_container: Prist_stats): longint; cdecl; external librist;

// === Konventiert am: 15-8-26 19:16:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
