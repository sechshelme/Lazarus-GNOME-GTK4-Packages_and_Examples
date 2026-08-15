
unit stats;
interface

{
  Automatically converted by H2Pas 1.0.0 from stats.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    stats.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Prist_ctx  = ^rist_ctx;
Prist_stats  = ^rist_stats;
Prist_stats_receiver_flow  = ^rist_stats_receiver_flow;
Prist_stats_sender_peer  = ^rist_stats_sender_peer;
Prist_stats_type  = ^rist_stats_type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef LIBRIST_STATS_H}
{$define LIBRIST_STATS_H}
{$include "common.h"}
{$include "headers.h"}
{$include <stddef.h>}
{$include <stdint.h>}
{ C++ extern C conditionnal removed }
{ cname  }
{ internal peer id  }
{ avg bandwidth calculation  }
{ bandwidth devoted to retries  }
{ num sent packets  }
{ num received packets  }
{ retransmitted packets  }
{ quality: Q = (sent * 100.0) / sent + bloat_skipped + bandwidth_skipped + retransmit_skipped + retransmitted  }
{ current RTT  }
type
  Prist_stats_sender_peer = ^Trist_stats_sender_peer;
  Trist_stats_sender_peer = record
      cname : array[0..(RIST_MAX_STRING_SHORT)-1] of char;
      peer_id : Tuint32_t;
      bandwidth : Tsize_t;
      retry_bandwidth : Tsize_t;
      sent : Tuint64_t;
      received : Tuint64_t;
      retransmitted : Tuint64_t;
      quality : Tdouble;
      rtt : Tuint32_t;
    end;

{ peer count  }
{ combined peer cnames  }
{ flow id (set by senders)  }
{ flow status  }
{ avg bandwidth calculation  }
{ bandwidth devoted to retries  }
{ num sent packets  }
{ num received packets  }
{ missing, including reordered  }
{ reordered  }
{ total recovered  }
{ recovered on the first retry  }
{ lost packets  }
{ quality: Q = (received * 100.0) / received + missing  }
{ packet inter-arrival time (microseconds)  }
{ avg rtt all non dead peers  }
  Prist_stats_receiver_flow = ^Trist_stats_receiver_flow;
  Trist_stats_receiver_flow = record
      peer_count : Tuint32_t;
      cname : array[0..(RIST_MAX_STRING_LONG)-1] of char;
      flow_id : Tuint32_t;
      status : longint;
      bandwidth : Tsize_t;
      retry_bandwidth : Tsize_t;
      sent : Tuint64_t;
      received : Tuint64_t;
      missing : Tuint32_t;
      reordered : Tuint32_t;
      recovered : Tuint32_t;
      recovered_one_retry : Tuint32_t;
      lost : Tuint32_t;
      quality : Tdouble;
      min_inter_packet_spacing : Tuint64_t;
      cur_inter_packet_spacing : Tuint64_t;
      max_inter_packet_spacing : Tuint64_t;
      rtt : Tuint32_t;
    end;

  Trist_stats_type =  Longint;
  Const
    RIST_STATS_SENDER_PEER = 0;
    RIST_STATS_RECEIVER_FLOW = 1;

  RIST_STATS_VERSION = 0;  
type
  Prist_stats = ^Trist_stats;
  Trist_stats = record
      json_size : Tuint32_t;
      stats_json : Pchar;
      version : Tuint16_t;
      stats_type : Trist_stats_type;
      stats : record
          case longint of
            0 : ( sender_peer : Trist_stats_sender_peer );
            1 : ( receiver_flow : Trist_stats_receiver_flow );
          end;
    end;

{*
 * @brief Set callback for receiving stats structs
 *
 * @param ctx RIST context
 * @param statsinterval interval between stats reporting
 * @param stats_cb Callback function that will be called. The json char pointer must be free()'d when you are finished.
 * @param arg extra arguments for callback function
  }
(* Const before type ignored *)

function rist_stats_callback_set(ctx:Prist_ctx; statsinterval:longint; stats_cb:function (arg:pointer; stats_container:Prist_stats):longint; arg:pointer):longint;cdecl;external;
{*
 * @brief Free the rist_stats structure memory allocations
 *
 * @return 0 on success or non-zero on error.
  }
(* Const before type ignored *)
function rist_stats_free(stats_container:Prist_stats):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBRIST_STATS_H  }

implementation


end.
