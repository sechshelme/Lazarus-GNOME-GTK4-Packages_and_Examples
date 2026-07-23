unit webrtc_fwd;

interface

uses
  fp_glib2, fp_gst;

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
{*
 * GstWebRTCDTLSTransport:
  }
type
{*
 * GstWebRTCICE:
 *
 * Since: 1.22
  }
{*
 * GstWebRTCICECandidatePair:
 *
 * Since: 1.28
  }
{*
 * GstWebRTCICETcpCandidateType:
 * @GST_WEBRTC_ICE_TCP_CANDIDATE_TYPE_ACTIVE: An "active" TCP candidate is one for which the transport
 *                                            will attempt to open an outbound connection but will not
 *                                            receive incoming connection requests.
 * @GST_WEBRTC_ICE_TCP_CANDIDATE_TYPE_PASSIVE: A "passive" TCP candidate is one for which the transport
 *                                             will receive incoming connection attempts but not attempt
 *                                             a connection.
 * @GST_WEBRTC_ICE_TCP_CANDIDATE_TYPE_SO: An "so" candidate is one for which the transport will attempt
 *                                        to open a connection simultaneously with its peer.
 * @GST_WEBRTC_ICE_TCP_CANDIDATE_TYPE_NONE: Value used for non-TCP candidate type.
 *
 * Since: 1.28
  }
{< underscore_name=gst_webrtc_ice_tcp_candidate_type > }

  PGstWebRTCICETcpCandidateType = ^TGstWebRTCICETcpCandidateType;
  TGstWebRTCICETcpCandidateType =  Longint;
  Const
    GST_WEBRTC_ICE_TCP_CANDIDATE_TYPE_ACTIVE = 0;
    GST_WEBRTC_ICE_TCP_CANDIDATE_TYPE_PASSIVE = 1;
    GST_WEBRTC_ICE_TCP_CANDIDATE_TYPE_SO = 2;
    GST_WEBRTC_ICE_TCP_CANDIDATE_TYPE_NONE = 3;
;
{*
 * GstWebRTCICECandidateProtocolType:
 * @GST_WEBRTC_ICE_CANDIDATE_PROTOCOL_TYPE_TCP:
 * @GST_WEBRTC_ICE_CANDIDATE_PROTOCOL_TYPE_UDP:
 *
 * Since: 1.28
  }
{< underscore_name=gst_webrtc_ice_candidate_protocol_type > }
type
  PGstWebRTCICECandidateProtocolType = ^TGstWebRTCICECandidateProtocolType;
  TGstWebRTCICECandidateProtocolType =  Longint;
  Const
    GST_WEBRTC_ICE_CANDIDATE_PROTOCOL_TYPE_TCP = 0;
    GST_WEBRTC_ICE_CANDIDATE_PROTOCOL_TYPE_UDP = 1;
;
{*
 * GstWebRTCICECandidateType:
 * @GST_WEBRTC_ICE_CANDIDATE_TYPE_HOST: The candidate is a host candidate, whose
 *   IP address as specified in the RTCIceCandidate.address property is in fact the
 *   true address of the remote peer.
 * @GST_WEBRTC_ICE_CANDIDATE_TYPE_SERVER_REFLEXIVE: The candidate is a server
 *   reflexive candidate; the ip and port are a binding allocated by a NAT for an
 *   agent when it sent a packet through the NAT to a server. They can be learned by
 *   the STUN server and TURN server to represent the candidate's peer anonymously.
 * @GST_WEBRTC_ICE_CANDIDATE_TYPE_PEER_REFLEXIVE: The candidate is a peer
 *   reflexive candidate; the ip and port are a binding allocated by a NAT when it
 *   sent a STUN request to represent the candidate's peer anonymously.
 * @GST_WEBRTC_ICE_CANDIDATE_TYPE_RELAYED: The candidate is a relay candidate,
 *   obtained from a TURN server. The relay candidate's IP address is an address the
 *   TURN server uses to forward the media between the two peers.
 *
 * Since: 1.28
  }
{< underscore_name=gst_webrtc_ice_candidate_type > }
type
  PGstWebRTCICECandidateType = ^TGstWebRTCICECandidateType;
  TGstWebRTCICECandidateType =  Longint;
  Const
    GST_WEBRTC_ICE_CANDIDATE_TYPE_HOST = 0;
    GST_WEBRTC_ICE_CANDIDATE_TYPE_SERVER_REFLEXIVE = 1;
    GST_WEBRTC_ICE_CANDIDATE_TYPE_PEER_REFLEXIVE = 2;
    GST_WEBRTC_ICE_CANDIDATE_TYPE_RELAYED = 3;
;
{*
 * GstWebRTCICEStream:
 *
 * Since: 1.22
  }
type
{*
 * GstWebRTCICETransport:
  }
{*
 * GstWebRTCRTPReceiver:
 *
 * An object to track the receiving aspect of the stream
 *
 * Mostly matches the WebRTC RTCRtpReceiver interface.
  }
{*
 * GstWebRTCRTPSender:
 *
 * An object to track the sending aspect of the stream
 *
 * Mostly matches the WebRTC RTCRtpSender interface.
  }
{*
 * GstWebRTCRTPTransceiver:
 *
 * Mostly matches the WebRTC RTCRtpTransceiver interface.
  }
{*
 * GstWebRTCDataChannel:
 *
 * Since: 1.18
  }
{*
 * GstWebRTCDTLSTransportState:
 * @GST_WEBRTC_DTLS_TRANSPORT_STATE_NEW: new
 * @GST_WEBRTC_DTLS_TRANSPORT_STATE_CLOSED: closed
 * @GST_WEBRTC_DTLS_TRANSPORT_STATE_FAILED: failed
 * @GST_WEBRTC_DTLS_TRANSPORT_STATE_CONNECTING: connecting
 * @GST_WEBRTC_DTLS_TRANSPORT_STATE_CONNECTED: connected
  }
{< underscore_name=gst_webrtc_dtls_transport_state > }

  PGstWebRTCDTLSTransportState = ^TGstWebRTCDTLSTransportState;
  TGstWebRTCDTLSTransportState =  Longint;
  Const
    GST_WEBRTC_DTLS_TRANSPORT_STATE_NEW = 0;
    GST_WEBRTC_DTLS_TRANSPORT_STATE_CLOSED = 1;
    GST_WEBRTC_DTLS_TRANSPORT_STATE_FAILED = 2;
    GST_WEBRTC_DTLS_TRANSPORT_STATE_CONNECTING = 3;
    GST_WEBRTC_DTLS_TRANSPORT_STATE_CONNECTED = 4;
;
{*
 * GstWebRTCDTLSRole:
 * @GST_WEBRTC_DTLS_ROLE_CLIENT: client
 * @GST_WEBRTC_DTLS_ROLE_SERVER: server
 * @GST_WEBRTC_DTLS_ROLE_UNKNOWN: unknown
 *
 * Since: 1.28
  }
{< underscore_name=gst_webrtc_dtls_role > }
type
  PGstWebRTCDTLSRole = ^TGstWebRTCDTLSRole;
  TGstWebRTCDTLSRole =  Longint;
  Const
    GST_WEBRTC_DTLS_ROLE_CLIENT = 0;
    GST_WEBRTC_DTLS_ROLE_SERVER = 1;
    GST_WEBRTC_DTLS_ROLE_UNKNOWN = 2;
;
{*
 * GstWebRTCICEGatheringState:
 * @GST_WEBRTC_ICE_GATHERING_STATE_NEW: new
 * @GST_WEBRTC_ICE_GATHERING_STATE_GATHERING: gathering
 * @GST_WEBRTC_ICE_GATHERING_STATE_COMPLETE: complete
 *
 * See <http://w3c.github.io/webrtc-pc/#dom-rtcicegatheringstate>
  }
{< underscore_name=gst_webrtc_ice_gathering_state > }
type
  PGstWebRTCICEGatheringState = ^TGstWebRTCICEGatheringState;
  TGstWebRTCICEGatheringState =  Longint;
  Const
    GST_WEBRTC_ICE_GATHERING_STATE_NEW = 0;
    GST_WEBRTC_ICE_GATHERING_STATE_GATHERING = 1;
    GST_WEBRTC_ICE_GATHERING_STATE_COMPLETE = 2;
;
{< underscore_name=gst_webrtc_ice_gathering_state > }
{*
 * GstWebRTCICEConnectionState:
 * @GST_WEBRTC_ICE_CONNECTION_STATE_NEW: new
 * @GST_WEBRTC_ICE_CONNECTION_STATE_CHECKING: checking
 * @GST_WEBRTC_ICE_CONNECTION_STATE_CONNECTED: connected
 * @GST_WEBRTC_ICE_CONNECTION_STATE_COMPLETED: completed
 * @GST_WEBRTC_ICE_CONNECTION_STATE_FAILED: failed
 * @GST_WEBRTC_ICE_CONNECTION_STATE_DISCONNECTED: disconnected
 * @GST_WEBRTC_ICE_CONNECTION_STATE_CLOSED: closed
 *
 * See <http://w3c.github.io/webrtc-pc/#dom-rtciceconnectionstate>
  }
{< underscore_name=gst_webrtc_ice_connection_state > }
type
  PGstWebRTCICEConnectionState = ^TGstWebRTCICEConnectionState;
  TGstWebRTCICEConnectionState =  Longint;
  Const
    GST_WEBRTC_ICE_CONNECTION_STATE_NEW = 0;
    GST_WEBRTC_ICE_CONNECTION_STATE_CHECKING = 1;
    GST_WEBRTC_ICE_CONNECTION_STATE_CONNECTED = 2;
    GST_WEBRTC_ICE_CONNECTION_STATE_COMPLETED = 3;
    GST_WEBRTC_ICE_CONNECTION_STATE_FAILED = 4;
    GST_WEBRTC_ICE_CONNECTION_STATE_DISCONNECTED = 5;
    GST_WEBRTC_ICE_CONNECTION_STATE_CLOSED = 6;
;
{*
 * GstWebRTCSignalingState:
 * @GST_WEBRTC_SIGNALING_STATE_STABLE: stable
 * @GST_WEBRTC_SIGNALING_STATE_CLOSED: closed
 * @GST_WEBRTC_SIGNALING_STATE_HAVE_LOCAL_OFFER: have-local-offer
 * @GST_WEBRTC_SIGNALING_STATE_HAVE_REMOTE_OFFER: have-remote-offer
 * @GST_WEBRTC_SIGNALING_STATE_HAVE_LOCAL_PRANSWER: have-local-pranswer
 * @GST_WEBRTC_SIGNALING_STATE_HAVE_REMOTE_PRANSWER: have-remote-pranswer
 *
 * See <http://w3c.github.io/webrtc-pc/#dom-rtcsignalingstate>
  }
{< underscore_name=gst_webrtc_signaling_state > }
type
  PGstWebRTCSignalingState = ^TGstWebRTCSignalingState;
  TGstWebRTCSignalingState =  Longint;
  Const
    GST_WEBRTC_SIGNALING_STATE_STABLE = 0;
    GST_WEBRTC_SIGNALING_STATE_CLOSED = 1;
    GST_WEBRTC_SIGNALING_STATE_HAVE_LOCAL_OFFER = 2;
    GST_WEBRTC_SIGNALING_STATE_HAVE_REMOTE_OFFER = 3;
    GST_WEBRTC_SIGNALING_STATE_HAVE_LOCAL_PRANSWER = 4;
    GST_WEBRTC_SIGNALING_STATE_HAVE_REMOTE_PRANSWER = 5;
;
{*
 * GstWebRTCPeerConnectionState:
 * @GST_WEBRTC_PEER_CONNECTION_STATE_NEW: new
 * @GST_WEBRTC_PEER_CONNECTION_STATE_CONNECTING: connecting
 * @GST_WEBRTC_PEER_CONNECTION_STATE_CONNECTED: connected
 * @GST_WEBRTC_PEER_CONNECTION_STATE_DISCONNECTED: disconnected
 * @GST_WEBRTC_PEER_CONNECTION_STATE_FAILED: failed
 * @GST_WEBRTC_PEER_CONNECTION_STATE_CLOSED: closed
 *
 * See <http://w3c.github.io/webrtc-pc/#dom-rtcpeerconnectionstate>
  }
{< underscore_name=gst_webrtc_peer_connection_state > }
type
  PGstWebRTCPeerConnectionState = ^TGstWebRTCPeerConnectionState;
  TGstWebRTCPeerConnectionState =  Longint;
  Const
    GST_WEBRTC_PEER_CONNECTION_STATE_NEW = 0;
    GST_WEBRTC_PEER_CONNECTION_STATE_CONNECTING = 1;
    GST_WEBRTC_PEER_CONNECTION_STATE_CONNECTED = 2;
    GST_WEBRTC_PEER_CONNECTION_STATE_DISCONNECTED = 3;
    GST_WEBRTC_PEER_CONNECTION_STATE_FAILED = 4;
    GST_WEBRTC_PEER_CONNECTION_STATE_CLOSED = 5;
;
{*
 * GstWebRTCICERole:
 * @GST_WEBRTC_ICE_ROLE_CONTROLLED: controlled
 * @GST_WEBRTC_ICE_ROLE_CONTROLLING: controlling
  }
{< underscore_name=gst_webrtc_ice_role > }
type
  PGstWebRTCICERole = ^TGstWebRTCICERole;
  TGstWebRTCICERole =  Longint;
  Const
    GST_WEBRTC_ICE_ROLE_CONTROLLED = 0;
    GST_WEBRTC_ICE_ROLE_CONTROLLING = 1;
;
{*
 * GstWebRTCICEComponent:
 * @GST_WEBRTC_ICE_COMPONENT_RTP: RTP component
 * @GST_WEBRTC_ICE_COMPONENT_RTCP: RTCP component
  }
{< underscore_name=gst_webrtc_ice_component > }
type
  PGstWebRTCICEComponent = ^TGstWebRTCICEComponent;
  TGstWebRTCICEComponent =  Longint;
  Const
    GST_WEBRTC_ICE_COMPONENT_RTP = 0;
    GST_WEBRTC_ICE_COMPONENT_RTCP = 1;
;
{*
 * GstWebRTCSDPType:
 * @GST_WEBRTC_SDP_TYPE_OFFER: offer
 * @GST_WEBRTC_SDP_TYPE_PRANSWER: pranswer
 * @GST_WEBRTC_SDP_TYPE_ANSWER: answer
 * @GST_WEBRTC_SDP_TYPE_ROLLBACK: rollback
 *
 * See <http://w3c.github.io/webrtc-pc/#rtcsdptype>
  }
{< underscore_name=gst_webrtc_sdp_type > }
type
  PGstWebRTCSDPType = ^TGstWebRTCSDPType;
  TGstWebRTCSDPType =  Longint;
  Const
    GST_WEBRTC_SDP_TYPE_OFFER = 1;
    GST_WEBRTC_SDP_TYPE_PRANSWER = 2;
    GST_WEBRTC_SDP_TYPE_ANSWER = 3;
    GST_WEBRTC_SDP_TYPE_ROLLBACK = 4;
;
{*
 * GstWebRTCRTPTransceiverDirection:
 * @GST_WEBRTC_RTP_TRANSCEIVER_DIRECTION_NONE: none
 * @GST_WEBRTC_RTP_TRANSCEIVER_DIRECTION_INACTIVE: inactive
 * @GST_WEBRTC_RTP_TRANSCEIVER_DIRECTION_SENDONLY: sendonly
 * @GST_WEBRTC_RTP_TRANSCEIVER_DIRECTION_RECVONLY: recvonly
 * @GST_WEBRTC_RTP_TRANSCEIVER_DIRECTION_SENDRECV: sendrecv
  }
{< underscore_name=gst_webrtc_rtp_transceiver_direction > }
type
  PGstWebRTCRTPTransceiverDirection = ^TGstWebRTCRTPTransceiverDirection;
  TGstWebRTCRTPTransceiverDirection =  Longint;
  Const
    GST_WEBRTC_RTP_TRANSCEIVER_DIRECTION_NONE = 0;
    GST_WEBRTC_RTP_TRANSCEIVER_DIRECTION_INACTIVE = 1;
    GST_WEBRTC_RTP_TRANSCEIVER_DIRECTION_SENDONLY = 2;
    GST_WEBRTC_RTP_TRANSCEIVER_DIRECTION_RECVONLY = 3;
    GST_WEBRTC_RTP_TRANSCEIVER_DIRECTION_SENDRECV = 4;
;
{*
 * GstWebRTCDTLSSetup:
 * @GST_WEBRTC_DTLS_SETUP_NONE: none
 * @GST_WEBRTC_DTLS_SETUP_ACTPASS: actpass
 * @GST_WEBRTC_DTLS_SETUP_ACTIVE: sendonly
 * @GST_WEBRTC_DTLS_SETUP_PASSIVE: recvonly
  }
{< underscore_name=gst_webrtc_dtls_setup > }
type
  PGstWebRTCDTLSSetup = ^TGstWebRTCDTLSSetup;
  TGstWebRTCDTLSSetup =  Longint;
  Const
    GST_WEBRTC_DTLS_SETUP_NONE = 0;
    GST_WEBRTC_DTLS_SETUP_ACTPASS = 1;
    GST_WEBRTC_DTLS_SETUP_ACTIVE = 2;
    GST_WEBRTC_DTLS_SETUP_PASSIVE = 3;
;
{*
 * GstWebRTCStatsType:
 * @GST_WEBRTC_STATS_CODEC: codec
 * @GST_WEBRTC_STATS_INBOUND_RTP: inbound-rtp
 * @GST_WEBRTC_STATS_OUTBOUND_RTP: outbound-rtp
 * @GST_WEBRTC_STATS_REMOTE_INBOUND_RTP: remote-inbound-rtp
 * @GST_WEBRTC_STATS_REMOTE_OUTBOUND_RTP: remote-outbound-rtp
 * @GST_WEBRTC_STATS_CSRC: csrc
 * @GST_WEBRTC_STATS_PEER_CONNECTION: peer-connection
 * @GST_WEBRTC_STATS_DATA_CHANNEL: data-channel
 * @GST_WEBRTC_STATS_STREAM: stream
 * @GST_WEBRTC_STATS_TRANSPORT: transport
 * @GST_WEBRTC_STATS_CANDIDATE_PAIR: candidate-pair
 * @GST_WEBRTC_STATS_LOCAL_CANDIDATE: local-candidate
 * @GST_WEBRTC_STATS_REMOTE_CANDIDATE: remote-candidate
 * @GST_WEBRTC_STATS_CERTIFICATE: certificate
 *
 * See <https://w3c.github.io/webrtc-stats/#dom-rtcstatstype>
  }
{< underscore_name=gst_webrtc_stats_type > }
type
  PGstWebRTCStatsType = ^TGstWebRTCStatsType;
  TGstWebRTCStatsType =  Longint;
  Const
    GST_WEBRTC_STATS_CODEC = 1;
    GST_WEBRTC_STATS_INBOUND_RTP = 2;
    GST_WEBRTC_STATS_OUTBOUND_RTP = 3;
    GST_WEBRTC_STATS_REMOTE_INBOUND_RTP = 4;
    GST_WEBRTC_STATS_REMOTE_OUTBOUND_RTP = 5;
    GST_WEBRTC_STATS_CSRC = 6;
    GST_WEBRTC_STATS_PEER_CONNECTION = 7;
    GST_WEBRTC_STATS_DATA_CHANNEL = 8;
    GST_WEBRTC_STATS_STREAM = 9;
    GST_WEBRTC_STATS_TRANSPORT = 10;
    GST_WEBRTC_STATS_CANDIDATE_PAIR = 11;
    GST_WEBRTC_STATS_LOCAL_CANDIDATE = 12;
    GST_WEBRTC_STATS_REMOTE_CANDIDATE = 13;
    GST_WEBRTC_STATS_CERTIFICATE = 14;
;
{*
 * GstWebRTCFECType:
 * @GST_WEBRTC_FEC_TYPE_NONE: none
 * @GST_WEBRTC_FEC_TYPE_ULP_RED: ulpfec + red
 *
 * Since: 1.14.1
  }
{< underscore_name=gst_webrtc_fec_type > }
type
  PGstWebRTCFECType = ^TGstWebRTCFECType;
  TGstWebRTCFECType =  Longint;
  Const
    GST_WEBRTC_FEC_TYPE_NONE = 0;
    GST_WEBRTC_FEC_TYPE_ULP_RED = 1;
;
{*
 * GstWebRTCSCTPTransportState:
 * @GST_WEBRTC_SCTP_TRANSPORT_STATE_NEW: new
 * @GST_WEBRTC_SCTP_TRANSPORT_STATE_CONNECTING: connecting
 * @GST_WEBRTC_SCTP_TRANSPORT_STATE_CONNECTED: connected
 * @GST_WEBRTC_SCTP_TRANSPORT_STATE_CLOSED: closed
 *
 * See <http://w3c.github.io/webrtc-pc/#dom-rtcsctptransportstate>
 *
 * Since: 1.16
  }
{< underscore_name=gst_webrtc_sctp_transport_state > }
type
  PGstWebRTCSCTPTransportState = ^TGstWebRTCSCTPTransportState;
  TGstWebRTCSCTPTransportState =  Longint;
  Const
    GST_WEBRTC_SCTP_TRANSPORT_STATE_NEW = 0;
    GST_WEBRTC_SCTP_TRANSPORT_STATE_CONNECTING = 1;
    GST_WEBRTC_SCTP_TRANSPORT_STATE_CONNECTED = 2;
    GST_WEBRTC_SCTP_TRANSPORT_STATE_CLOSED = 3;
;
{*
 * GstWebRTCPriorityType:
 * @GST_WEBRTC_PRIORITY_TYPE_VERY_LOW: very-low
 * @GST_WEBRTC_PRIORITY_TYPE_LOW: low
 * @GST_WEBRTC_PRIORITY_TYPE_MEDIUM: medium
 * @GST_WEBRTC_PRIORITY_TYPE_HIGH: high
 *
 * See <http://w3c.github.io/webrtc-pc/#dom-rtcprioritytype>
 *
 * Since: 1.16
  }
{< underscore_name=gst_webrtc_priority_type > }
type
  PGstWebRTCPriorityType = ^TGstWebRTCPriorityType;
  TGstWebRTCPriorityType =  Longint;
  Const
    GST_WEBRTC_PRIORITY_TYPE_VERY_LOW = 1;
    GST_WEBRTC_PRIORITY_TYPE_LOW = 2;
    GST_WEBRTC_PRIORITY_TYPE_MEDIUM = 3;
    GST_WEBRTC_PRIORITY_TYPE_HIGH = 4;
;
{*
 * GstWebRTCDataChannelState:
 * @GST_WEBRTC_DATA_CHANNEL_STATE_CONNECTING: connecting
 * @GST_WEBRTC_DATA_CHANNEL_STATE_OPEN: open
 * @GST_WEBRTC_DATA_CHANNEL_STATE_CLOSING: closing
 * @GST_WEBRTC_DATA_CHANNEL_STATE_CLOSED: closed
 *
 * See <http://w3c.github.io/webrtc-pc/#dom-rtcdatachannelstate>
 *
 * Since: 1.16
  }
{< underscore_name=gst_webrtc_data_channel_state > }
type
  PGstWebRTCDataChannelState = ^TGstWebRTCDataChannelState;
  TGstWebRTCDataChannelState =  Longint;
  Const
    GST_WEBRTC_DATA_CHANNEL_STATE_CONNECTING = 1;
    GST_WEBRTC_DATA_CHANNEL_STATE_OPEN = 2;
    GST_WEBRTC_DATA_CHANNEL_STATE_CLOSING = 3;
    GST_WEBRTC_DATA_CHANNEL_STATE_CLOSED = 4;
;
{*
 * GstWebRTCBundlePolicy:
 * @GST_WEBRTC_BUNDLE_POLICY_NONE: none
 * @GST_WEBRTC_BUNDLE_POLICY_BALANCED: balanced
 * @GST_WEBRTC_BUNDLE_POLICY_MAX_COMPAT: max-compat
 * @GST_WEBRTC_BUNDLE_POLICY_MAX_BUNDLE: max-bundle
 *
 * See https://tools.ietf.org/html/draft-ietf-rtcweb-jsep-24#section-4.1.1
 * for more information.
 *
 * Since: 1.16
  }
{<underscore_name=gst_webrtc_bundle_policy> }
type
  PGstWebRTCBundlePolicy = ^TGstWebRTCBundlePolicy;
  TGstWebRTCBundlePolicy =  Longint;
  Const
    GST_WEBRTC_BUNDLE_POLICY_NONE = 0;
    GST_WEBRTC_BUNDLE_POLICY_BALANCED = 1;
    GST_WEBRTC_BUNDLE_POLICY_MAX_COMPAT = 2;
    GST_WEBRTC_BUNDLE_POLICY_MAX_BUNDLE = 3;
;
{*
 * GstWebRTCICETransportPolicy:
 * @GST_WEBRTC_ICE_TRANSPORT_POLICY_ALL: all
 * @GST_WEBRTC_ICE_TRANSPORT_POLICY_RELAY: relay
 *
 * See https://tools.ietf.org/html/draft-ietf-rtcweb-jsep-24#section-4.1.1
 * for more information.
 *
 * Since: 1.16
  }
{<underscore_name=gst_webrtc_ice_transport_policy> }
type
  PGstWebRTCICETransportPolicy = ^TGstWebRTCICETransportPolicy;
  TGstWebRTCICETransportPolicy =  Longint;
  Const
    GST_WEBRTC_ICE_TRANSPORT_POLICY_ALL = 0;
    GST_WEBRTC_ICE_TRANSPORT_POLICY_RELAY = 1;
;
{*
 * GstWebRTCKind:
 * @GST_WEBRTC_KIND_UNKNOWN: Kind has not yet been set
 * @GST_WEBRTC_KIND_AUDIO: Kind is audio
 * @GST_WEBRTC_KIND_VIDEO: Kind is video
 *
 * https://w3c.github.io/mediacapture-main/#dom-mediastreamtrack-kind
 *
 * Since: 1.20
  }
{<underscore_name=gst_webrtc_kind> }
type
  PGstWebRTCKind = ^TGstWebRTCKind;
  TGstWebRTCKind =  Longint;
  Const
    GST_WEBRTC_KIND_UNKNOWN = 0;
    GST_WEBRTC_KIND_AUDIO = 1;
    GST_WEBRTC_KIND_VIDEO = 2;
;

function gst_webrtc_error_quark:TGQuark;cdecl;external libgstwebrtc;
{*
 * GST_WEBRTC_ERROR:
 *
 * Since: 1.20
  }
{ was #define dname def_expr }
function GST_WEBRTC_ERROR : longint; { return type might be wrong }

{*
 * GstWebRTCError:
 * @GST_WEBRTC_ERROR_DATA_CHANNEL_FAILURE: data-channel-failure
 * @GST_WEBRTC_ERROR_DTLS_FAILURE: dtls-failure
 * @GST_WEBRTC_ERROR_FINGERPRINT_FAILURE: fingerprint-failure
 * @GST_WEBRTC_ERROR_SCTP_FAILURE: sctp-failure
 * @GST_WEBRTC_ERROR_SDP_SYNTAX_ERROR: sdp-syntax-error
 * @GST_WEBRTC_ERROR_HARDWARE_ENCODER_NOT_AVAILABLE: hardware-encoder-not-available
 * @GST_WEBRTC_ERROR_ENCODER_ERROR: encoder-error
 * @GST_WEBRTC_ERROR_INVALID_STATE: invalid-state (part of WebIDL specification)
 * @GST_WEBRTC_ERROR_INTERNAL_FAILURE: GStreamer-specific failure, not matching any other value from the specification
 *
 * See <https://www.w3.org/TR/webrtc/#dom-rtcerrordetailtype> for more information.
 *
 * Since: 1.20
  }
{*
 * GST_WEBRTC_ERROR_INVALID_MODIFICATION:
 *
 * invalid-modification (part of WebIDL specification)
 *
 * Since: 1.22
  }
{*
 * GST_WEBRTC_ERROR_TYPE_ERROR:
 *
 * type-error (maps to JavaScript TypeError)
 *
 * Since: 1.22
  }
{<underscore_name=gst_webrtc_error> }
type
  PGstWebRTCError = ^TGstWebRTCError;
  TGstWebRTCError =  Longint;
  Const
    GST_WEBRTC_ERROR_DATA_CHANNEL_FAILURE = 0;
    GST_WEBRTC_ERROR_DTLS_FAILURE = 1;
    GST_WEBRTC_ERROR_FINGERPRINT_FAILURE = 2;
    GST_WEBRTC_ERROR_SCTP_FAILURE = 3;
    GST_WEBRTC_ERROR_SDP_SYNTAX_ERROR = 4;
    GST_WEBRTC_ERROR_HARDWARE_ENCODER_NOT_AVAILABLE = 5;
    GST_WEBRTC_ERROR_ENCODER_ERROR = 6;
    GST_WEBRTC_ERROR_INVALID_STATE = 7;
    GST_WEBRTC_ERROR_INTERNAL_FAILURE = 8;
    GST_WEBRTC_ERROR_INVALID_MODIFICATION = 9;
    GST_WEBRTC_ERROR_TYPE_ERROR = 10;
;
{$endif}
{ __GST_WEBRTC_FWD_H__  }

// === Konventiert am: 23-7-26 14:10:23 ===


implementation


{ was #define dname def_expr }
function GST_WEBRTC_ERROR : longint; { return type might be wrong }
  begin
    GST_WEBRTC_ERROR:=gst_webrtc_error_quark;
  end;


end.
