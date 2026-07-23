
unit ice;
interface

{
  Automatically converted by H2Pas 1.0.0 from ice.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ice.h
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
Pgchar  = ^gchar;
PGstPromise  = ^GstPromise;
PGstWebRTCICE  = ^GstWebRTCICE;
PGstWebRTCICECandidate  = ^GstWebRTCICECandidate;
PGstWebRTCICECandidatePair  = ^GstWebRTCICECandidatePair;
PGstWebRTCICECandidateStats  = ^GstWebRTCICECandidateStats;
PGstWebRTCICEClass  = ^GstWebRTCICEClass;
PGstWebRTCICEStream  = ^GstWebRTCICEStream;
PGstWebRTCICETransport  = ^GstWebRTCICETransport;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2017 Matthew Waters <matthew@centricular.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_WEBRTC_ICE_H__}
{$define __GST_WEBRTC_ICE_H__}
{$include <gst/webrtc/webrtc_fwd.h>}

function gst_webrtc_ice_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_WEBRTC_ICE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_WEBRTC_ICE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_WEBRTC_ICE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_GET_CLASS(obj : longint) : longint;

{< protected > }
type
  PGstWebRTCICE = ^TGstWebRTCICE;
  TGstWebRTCICE = record
      parent : TGstObject;
      ice_gathering_state : TGstWebRTCICEGatheringState;
      ice_connection_state : TGstWebRTCICEConnectionState;
      min_rtp_port : Tguint;
      max_rtp_port : Tguint;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstWebRTCICECandidateStats:
 * @ipaddr: A string containing the address of the candidate. This value may be
 *          an IPv4 address, an IPv6 address, or a fully-qualified domain name
 * @port: The network port number used by the candidate
 * @stream_id: A string that uniquely identifies the object that is being
 *             monitored to produce this set of statistics
 * @type: The candidate type
 * @proto: A string specifying the protocol (tcp or udp) used to transmit data
 *         on the @port
 * @replay_proto: A string identifying the protocol used by the endpoint for
 *                communicating with the TURN server; valid values are tcp, udp, and tls
 * @prio: The candidate's priority, corresponding to RTCIceCandidate.priority
 * @url: For local candidates, the url property is the URL of the ICE server
 *       from which the candidate was received
 * @foundation: The ICE foundation as defined in RFC5245 section 15.1 (Since: 1.28)
 * @related_address: The ICE rel-addr defined in RFC5245 section 15.1 Only
 *                   set for serverreflexive, peerreflexive and relay candidates. (Since: 1.28)
 * @related_port: The ICE rel-addr defined in RFC5245 section 15.1. Only set
 *                for serverreflexive, peerreflexive and relay candidates. (Since: 1.28)
 * @username_fragment: The ICE username fragment as defined in RFC5245 section 7.1.2.3 (Since: 1.28)
 * @tcp_type: The ICE candidate TCP type, (Since: 1.28)
 *
 * Since: 1.22
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{*
   * GstWebRTCICECandidateStats.ABI: (attributes doc.skip=true)
   *
   * ABI compatibility union
   *
   * Since: 1.28
    }
{*
     * GstWebRTCICECandidateStats.ABI.abi: (attributes doc.skip=true)
     *
     * ABI compatibility struct
     *
     * Since: 1.28
      }
{*
       * GstWebRTCICECandidateStats.ABI.abi.foundation:
       *
       * The foundation of the ICE candidate.
       *
       * Since: 1.28
        }
{*
       * GstWebRTCICECandidateStats.ABI.abi.related_address:
       *
       * The related address (STUN or TURN server) of the candidate. Will be
       * NULL for host candidates.
       *
       * Since: 1.28
        }
{*
       * GstWebRTCICECandidateStats.ABI.abi.related_port:
       *
       * The related port (STUN or TURN server) of the candidate. Will be
       * 0 for host candidates.
       *
       * Since: 1.28
        }
{*
       * GstWebRTCICECandidateStats.ABI.abi.username_fragment:
       *
       * The ICE username for this candidate.
       *
       * Since: 1.28
        }
{*
       * GstWebRTCICECandidateStats.ABI.abi.tcp_type:
       *
       * The type of TCP candidate. Will be NULL if the candidate is not a TCP
       * candidate.
       *
       * Since: 1.28
        }
{< private > }
  PGstWebRTCICECandidateStats = ^TGstWebRTCICECandidateStats;
  TGstWebRTCICECandidateStats = record
      ipaddr : Pgchar;
      port : Tguint;
      stream_id : Tguint;
      _type : Pgchar;
      proto : Pgchar;
      relay_proto : Pgchar;
      prio : Tguint;
      url : Pgchar;
      ABI : record
          case longint of
            0 : ( abi : record
                foundation : Pgchar;
                related_address : Pgchar;
                related_port : Tguint;
                username_fragment : Pgchar;
                tcp_type : TGstWebRTCICETcpCandidateType;
              end );
            1 : ( _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer );
          end;
    end;

{*
 * GST_WEBRTC_ICE_CANDIDATE_STATS_ADDRESS:
 *
 * Since: 1.28
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_WEBRTC_ICE_CANDIDATE_STATS_ADDRESS(c : longint) : longint;

{*
 * GST_WEBRTC_ICE_CANDIDATE_STATS_PORT:
 *
 * Since: 1.28
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_PORT(c : longint) : longint;

{*
 * GST_WEBRTC_ICE_CANDIDATE_STATS_STREAM_ID:
 *
 * Since: 1.28
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_STREAM_ID(c : longint) : longint;

{*
 * GST_WEBRTC_ICE_CANDIDATE_STATS_TYPE:
 *
 * Since: 1.28
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_TYPE(c : longint) : longint;

{*
 * GST_WEBRTC_ICE_CANDIDATE_STATS_PROTOCOL:
 *
 * Since: 1.28
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_PROTOCOL(c : longint) : longint;

{*
 * GST_WEBRTC_ICE_CANDIDATE_STATS_RELAY_PROTOCOL:
 *
 * Since: 1.28
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_RELAY_PROTOCOL(c : longint) : longint;

{*
 * GST_WEBRTC_ICE_CANDIDATE_STATS_PRIORITY:
 *
 * Since: 1.28
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_PRIORITY(c : longint) : longint;

{*
 * GST_WEBRTC_ICE_CANDIDATE_STATS_URL:
 *
 * Since: 1.28
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_URL(c : longint) : longint;

{*
 * GST_WEBRTC_ICE_CANDIDATE_STATS_FOUNDATION:
 *
 * Since: 1.28
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_FOUNDATION(c : longint) : longint;

{*
 * GST_WEBRTC_ICE_CANDIDATE_STATS_RELATED_ADDRESS:
 *
 * Since: 1.28
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_RELATED_ADDRESS(c : longint) : longint;

{*
 * GST_WEBRTC_ICE_CANDIDATE_STATS_RELATED_PORT:
 *
 * Since: 1.28
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_RELATED_PORT(c : longint) : longint;

{*
 * GST_WEBRTC_ICE_CANDIDATE_STATS_USERNAME_FRAGMENT:
 *
 * Since: 1.28
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_USERNAME_FRAGMENT(c : longint) : longint;

{*
 * GST_WEBRTC_ICE_CANDIDATE_STATS_TCP_TYPE:
 *
 * Since: 1.28
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_TCP_TYPE(c : longint) : longint;

{*
 * GstWebRTCICECandidate:
 * @candidate: String carrying the candidate-attribute as defined in
 *   section 15.1 of RFC5245
 * @component: The assigned network component of the candidate (1 for RTP
 *   2 for RTCP).
 * @sdp_mid: The media stream "identification-tag" defined in [RFC5888] for the
 *   media component this candidate is associated with.
 * @sdp_mline_index: The index (starting at zero) of the media description in
 *   the SDP this candidate is associated with.
 * @stats: The #GstWebRTCICECandidateStats associated to this candidate.
 *
 * Since: 1.28
  }
{ Set to -1 if unknown.  }
type
  PGstWebRTCICECandidate = ^TGstWebRTCICECandidate;
  TGstWebRTCICECandidate = record
      candidate : Pgchar;
      component : Tgint;
      sdp_mid : Pgchar;
      sdp_mline_index : Tgint;
      stats : PGstWebRTCICECandidateStats;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;

  PGstWebRTCICECandidatePair = ^TGstWebRTCICECandidatePair;
  TGstWebRTCICECandidatePair = record
      local : PGstWebRTCICECandidate;
      remote : PGstWebRTCICECandidate;
    end;

{*
 * GstWebRTCICEOnCandidateFunc:
 * @ice: The #GstWebRTCICE
 * @stream_id: The stream id
 * @candidate: The discovered candidate
 * @user_data: User data that was set by #gst_webrtc_ice_set_on_ice_candidate
 *
 * Callback function to be triggered on discovery of a new candidate
 * Since: 1.22
  }
(* Const before type ignored *)

  TGstWebRTCICEOnCandidateFunc = procedure (ice:PGstWebRTCICE; stream_id:Tguint; candidate:Pgchar; user_data:Tgpointer);cdecl;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{*
   * GstWebRTCICEClass::set_http_proxy:
   * @ice: a #GstWebRTCICE
   * @uri: (transfer none): URI of the HTTP proxy of the form
   *   http://[username:password@]hostname[:port]
   *
   * Set HTTP Proxy to be used when connecting to TURN server.
   *
   * Since: 1.22
    }
(* Const before type ignored *)
{*
   * GstWebRTCICEClass::get_http_proxy:
   * @ice: a #GstWebRTCICE
   *
   * Get HTTP Proxy to be used when connecting to TURN server.
   *
   * Returns: (transfer full): URI of the HTTP proxy of the form
   *   http://[username:password@]hostname[:port]
   *
   * Since: 1.22
    }
{*
   * GstWebRTCICEClass::close:
   * @ice: a #GstWebRTCICE
   * @promise: (transfer full) (nullable): a #GstPromise to be notified when the task is
   * complete.
   *
   * Invoke the close procedure as specified in
   * https://www.w3.org/TR/webrtc/#dom-rtcpeerconnection-close.
   *
   * Since: 1.28
    }
  PGstWebRTCICEClass = ^TGstWebRTCICEClass;
  TGstWebRTCICEClass = record
      parent_class : TGstObjectClass;cdecl;
      add_stream : function (ice:PGstWebRTCICE; session_id:Tguint):PGstWebRTCICEStream;cdecl;
      find_transport : function (ice:PGstWebRTCICE; stream:PGstWebRTCICEStream; component:TGstWebRTCICEComponent):PGstWebRTCICETransport;cdecl;
      gather_candidates : function (ice:PGstWebRTCICE; stream:PGstWebRTCICEStream):Tgboolean;cdecl;
      add_candidate : procedure (ice:PGstWebRTCICE; stream:PGstWebRTCICEStream; candidate:Pgchar; promise:PGstPromise);cdecl;
      set_local_credentials : function (ice:PGstWebRTCICE; stream:PGstWebRTCICEStream; ufrag:Pgchar; pwd:Pgchar):Tgboolean;cdecl;
      set_remote_credentials : function (ice:PGstWebRTCICE; stream:PGstWebRTCICEStream; ufrag:Pgchar; pwd:Pgchar):Tgboolean;cdecl;
      add_turn_server : function (ice:PGstWebRTCICE; uri:Pgchar):Tgboolean;cdecl;
      set_is_controller : procedure (ice:PGstWebRTCICE; controller:Tgboolean);cdecl;
      get_is_controller : function (ice:PGstWebRTCICE):Tgboolean;cdecl;
      set_force_relay : procedure (ice:PGstWebRTCICE; force_relay:Tgboolean);cdecl;
      set_stun_server : procedure (ice:PGstWebRTCICE; uri:Pgchar);cdecl;
      get_stun_server : function (ice:PGstWebRTCICE):Pgchar;cdecl;
      set_turn_server : procedure (ice:PGstWebRTCICE; uri:Pgchar);cdecl;
      get_turn_server : function (ice:PGstWebRTCICE):Pgchar;cdecl;
      set_http_proxy : procedure (ice:PGstWebRTCICE; uri:Pgchar);cdecl;
      get_http_proxy : function (ice:PGstWebRTCICE):Pgchar;cdecl;
      set_tos : procedure (ice:PGstWebRTCICE; stream:PGstWebRTCICEStream; tos:Tguint);cdecl;
      set_on_ice_candidate : procedure (ice:PGstWebRTCICE; func:TGstWebRTCICEOnCandidateFunc; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;
      get_local_candidates : function (ice:PGstWebRTCICE; stream:PGstWebRTCICEStream):PPGstWebRTCICECandidateStats;cdecl;
      get_remote_candidates : function (ice:PGstWebRTCICE; stream:PGstWebRTCICEStream):PPGstWebRTCICECandidateStats;cdecl;
      get_selected_pair : function (ice:PGstWebRTCICE; stream:PGstWebRTCICEStream; local_stats:PPGstWebRTCICECandidateStats; remote_stats:PPGstWebRTCICECandidateStats):Tgboolean;cdecl;
      close : procedure (ice:PGstWebRTCICE; promise:PGstPromise);cdecl;
      _gst_reserved : array[0..(GST_PADDING-1)-1] of Tgpointer;
    end;


function gst_webrtc_ice_add_stream(ice:PGstWebRTCICE; session_id:Tguint):PGstWebRTCICEStream;cdecl;external;
function gst_webrtc_ice_find_transport(ice:PGstWebRTCICE; stream:PGstWebRTCICEStream; component:TGstWebRTCICEComponent):PGstWebRTCICETransport;cdecl;external;
function gst_webrtc_ice_gather_candidates(ice:PGstWebRTCICE; stream:PGstWebRTCICEStream):Tgboolean;cdecl;external;
{ FIXME: GstStructure-ize the candidate  }
(* Const before type ignored *)
procedure gst_webrtc_ice_add_candidate(ice:PGstWebRTCICE; stream:PGstWebRTCICEStream; candidate:Pgchar; promise:PGstPromise);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_webrtc_ice_set_local_credentials(ice:PGstWebRTCICE; stream:PGstWebRTCICEStream; ufrag:Pgchar; pwd:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_webrtc_ice_set_remote_credentials(ice:PGstWebRTCICE; stream:PGstWebRTCICEStream; ufrag:Pgchar; pwd:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_webrtc_ice_add_turn_server(ice:PGstWebRTCICE; uri:Pgchar):Tgboolean;cdecl;external;
procedure gst_webrtc_ice_set_is_controller(ice:PGstWebRTCICE; controller:Tgboolean);cdecl;external;
function gst_webrtc_ice_get_is_controller(ice:PGstWebRTCICE):Tgboolean;cdecl;external;
procedure gst_webrtc_ice_set_force_relay(ice:PGstWebRTCICE; force_relay:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure gst_webrtc_ice_set_stun_server(ice:PGstWebRTCICE; uri:Pgchar);cdecl;external;
function gst_webrtc_ice_get_stun_server(ice:PGstWebRTCICE):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure gst_webrtc_ice_set_turn_server(ice:PGstWebRTCICE; uri:Pgchar);cdecl;external;
function gst_webrtc_ice_get_turn_server(ice:PGstWebRTCICE):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure gst_webrtc_ice_set_http_proxy(ice:PGstWebRTCICE; uri:Pgchar);cdecl;external;
function gst_webrtc_ice_get_http_proxy(ice:PGstWebRTCICE):Pgchar;cdecl;external;
procedure gst_webrtc_ice_set_on_ice_candidate(ice:PGstWebRTCICE; func:TGstWebRTCICEOnCandidateFunc; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
procedure gst_webrtc_ice_set_tos(ice:PGstWebRTCICE; stream:PGstWebRTCICEStream; tos:Tguint);cdecl;external;
function gst_webrtc_ice_get_local_candidates(ice:PGstWebRTCICE; stream:PGstWebRTCICEStream):^PGstWebRTCICECandidateStats;cdecl;external;
function gst_webrtc_ice_get_remote_candidates(ice:PGstWebRTCICE; stream:PGstWebRTCICEStream):^PGstWebRTCICECandidateStats;cdecl;external;
{$ifndef GST_DISABLE_DEPRECATED}
{xxxxxxxx GST_WEBRTC_DEPRECATED_FOR(gst_webrtc_ice_transport_get_selected_pair) }

function gst_webrtc_ice_get_selected_pair(ice:PGstWebRTCICE; stream:PGstWebRTCICEStream; local_stats:PPGstWebRTCICECandidateStats; remote_stats:PPGstWebRTCICECandidateStats):Tgboolean;cdecl;external;
{$endif}

procedure gst_webrtc_ice_candidate_stats_free(stats:PGstWebRTCICECandidateStats);cdecl;external;
function gst_webrtc_ice_candidate_stats_get_type:TGType;cdecl;external;
{//////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                (GstWebRTCICE, gst_object_unref) }
function gst_webrtc_ice_candidate_stats_copy(stats:PGstWebRTCICECandidateStats):PGstWebRTCICECandidateStats;cdecl;external;
procedure gst_webrtc_ice_close(ice:PGstWebRTCICE; promise:PGstPromise);cdecl;external;
procedure gst_webrtc_ice_candidate_free(candidate:PGstWebRTCICECandidate);cdecl;external;
function gst_webrtc_ice_candidate_get_type:TGType;cdecl;external;
function gst_webrtc_ice_candidate_copy(candidate:PGstWebRTCICECandidate):PGstWebRTCICECandidate;cdecl;external;
procedure gst_webrtc_ice_candidate_pair_free(pair:PGstWebRTCICECandidatePair);cdecl;external;
function gst_webrtc_ice_candidate_pair_get_type:TGType;cdecl;external;
function gst_webrtc_ice_candidate_pair_copy(pair:PGstWebRTCICECandidatePair):PGstWebRTCICECandidatePair;cdecl;external;
{$endif}
{ __GST_WEBRTC_ICE_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_WEBRTC_ICE : longint; { return type might be wrong }
  begin
    GST_TYPE_WEBRTC_ICE:=gst_webrtc_ice_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE(obj : longint) : longint;
begin
  GST_WEBRTC_ICE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_WEBRTC_ICE,GstWebRTCICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CLASS(klass : longint) : longint;
begin
  GST_WEBRTC_ICE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_WEBRTC_ICE,GstWebRTCICEClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_WEBRTC_ICE(obj : longint) : longint;
begin
  GST_IS_WEBRTC_ICE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_WEBRTC_ICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_WEBRTC_ICE_CLASS(klass : longint) : longint;
begin
  GST_IS_WEBRTC_ICE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_WEBRTC_ICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_GET_CLASS(obj : longint) : longint;
begin
  GST_WEBRTC_ICE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_WEBRTC_ICE,GstWebRTCICEClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_ADDRESS(c : longint) : longint;
begin
  GST_WEBRTC_ICE_CANDIDATE_STATS_ADDRESS:=c^.ipaddr;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_PORT(c : longint) : longint;
begin
  GST_WEBRTC_ICE_CANDIDATE_STATS_PORT:=c^.port;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_STREAM_ID(c : longint) : longint;
begin
  GST_WEBRTC_ICE_CANDIDATE_STATS_STREAM_ID:=c^.stream_id;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_TYPE(c : longint) : longint;
begin
  GST_WEBRTC_ICE_CANDIDATE_STATS_TYPE:=c^._type;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_PROTOCOL(c : longint) : longint;
begin
  GST_WEBRTC_ICE_CANDIDATE_STATS_PROTOCOL:=c^.proto;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_RELAY_PROTOCOL(c : longint) : longint;
begin
  GST_WEBRTC_ICE_CANDIDATE_STATS_RELAY_PROTOCOL:=c^.relay_proto;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_PRIORITY(c : longint) : longint;
begin
  GST_WEBRTC_ICE_CANDIDATE_STATS_PRIORITY:=c^.prio;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_URL(c : longint) : longint;
begin
  GST_WEBRTC_ICE_CANDIDATE_STATS_URL:=c^.url;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_FOUNDATION(c : longint) : longint;
begin
  GST_WEBRTC_ICE_CANDIDATE_STATS_FOUNDATION:=c^.(ABI.(abi.foundation));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_RELATED_ADDRESS(c : longint) : longint;
begin
  GST_WEBRTC_ICE_CANDIDATE_STATS_RELATED_ADDRESS:=c^.(ABI.(abi.related_address));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_RELATED_PORT(c : longint) : longint;
begin
  GST_WEBRTC_ICE_CANDIDATE_STATS_RELATED_PORT:=c^.(ABI.(abi.related_port));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_USERNAME_FRAGMENT(c : longint) : longint;
begin
  GST_WEBRTC_ICE_CANDIDATE_STATS_USERNAME_FRAGMENT:=c^.(ABI.(abi.username_fragment));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_CANDIDATE_STATS_TCP_TYPE(c : longint) : longint;
begin
  GST_WEBRTC_ICE_CANDIDATE_STATS_TCP_TYPE:=c^.(ABI.(abi.tcp_type));
end;


end.
