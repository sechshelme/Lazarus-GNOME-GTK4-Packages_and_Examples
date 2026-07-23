unit icetransport;

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
{$ifndef __GST_WEBRTC_ICE_TRANSPORT_H__}
{$define __GST_WEBRTC_ICE_TRANSPORT_H__}
{$include <gst/webrtc/webrtc_fwd.h>}

function gst_webrtc_ice_transport_get_type:TGType;cdecl;external libgstwebrtc;
{ <protected>  }
{ Filled by subclasses  }
type
  PGstWebRTCICETransport = ^TGstWebRTCICETransport;
  TGstWebRTCICETransport = record
      parent : TGstObject;
      role : TGstWebRTCICERole;
      component : TGstWebRTCICEComponent;
      state : TGstWebRTCICEConnectionState;
      gathering_state : TGstWebRTCICEGatheringState;
      src : PGstElement;
      sink : PGstElement;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
   * GstWebRTCICETransportClass::get_selected_candidate_pair:
   * @transport: a #GstWebRTCICETransport
   *
   * See also
   * https://w3c.github.io/webrtc-pc/#dom-rtcicetransport-getselectedcandidatepair
   *
   * Returns: (transfer full) (nullable): A #GstWebRTCICECandidatePair
   *
   * Since: 1.28
    }
  PGstWebRTCICETransportClass = ^TGstWebRTCICETransportClass;
  TGstWebRTCICETransportClass = record
      parent_class : TGstObjectClass;
      gather_candidates : function (transport:PGstWebRTCICETransport):Tgboolean;cdecl;
      get_selected_candidate_pair : function (transport:PGstWebRTCICETransport):PGstWebRTCICECandidatePair;cdecl;
      _padding : array[0..(GST_PADDING-1)-1] of Tgpointer;
    end;


procedure gst_webrtc_ice_transport_connection_state_change(ice:PGstWebRTCICETransport; new_state:TGstWebRTCICEConnectionState);cdecl;external libgstwebrtc;
procedure gst_webrtc_ice_transport_gathering_state_change(ice:PGstWebRTCICETransport; new_state:TGstWebRTCICEGatheringState);cdecl;external libgstwebrtc;
procedure gst_webrtc_ice_transport_selected_pair_change(ice:PGstWebRTCICETransport);cdecl;external libgstwebrtc;
procedure gst_webrtc_ice_transport_new_candidate(ice:PGstWebRTCICETransport; stream_id:Tguint; component:TGstWebRTCICEComponent; attr:Pgchar);cdecl;external libgstwebrtc;
function gst_webrtc_ice_transport_get_selected_candidate_pair(transport:PGstWebRTCICETransport):PGstWebRTCICECandidatePair;cdecl;external libgstwebrtc;
{//////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                (GstWebRTCICETransport, gst_object_unref) }
{$endif}
{ __GST_WEBRTC_ICE_TRANSPORT_H__  }

// === Konventiert am: 23-7-26 14:12:31 ===

function GST_TYPE_WEBRTC_ICE_TRANSPORT : TGType;
function GST_WEBRTC_ICE_TRANSPORT(obj : Pointer) : PGstWebRTCICETransport;
function GST_WEBRTC_ICE_TRANSPORT_CLASS(klass : Pointer) : PGstWebRTCICETransportClass;
function GST_IS_WEBRTC_ICE_TRANSPORT(obj : Pointer) : Tgboolean;
function GST_IS_WEBRTC_ICE_TRANSPORT_CLASS(klass : Pointer) : Tgboolean;
function GST_WEBRTC_ICE_TRANSPORT_GET_CLASS(obj : Pointer) : PGstWebRTCICETransportClass;

implementation

function GST_TYPE_WEBRTC_ICE_TRANSPORT : TGType;
  begin
    GST_TYPE_WEBRTC_ICE_TRANSPORT:=gst_webrtc_ice_transport_get_type;
  end;

function GST_WEBRTC_ICE_TRANSPORT(obj : Pointer) : PGstWebRTCICETransport;
begin
  Result := PGstWebRTCICETransport(g_type_check_instance_cast(obj, GST_TYPE_WEBRTC_ICE_TRANSPORT));
end;

function GST_WEBRTC_ICE_TRANSPORT_CLASS(klass : Pointer) : PGstWebRTCICETransportClass;
begin
  Result := PGstWebRTCICETransportClass(g_type_check_class_cast(klass, GST_TYPE_WEBRTC_ICE_TRANSPORT));
end;

function GST_IS_WEBRTC_ICE_TRANSPORT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_WEBRTC_ICE_TRANSPORT);
end;

function GST_IS_WEBRTC_ICE_TRANSPORT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_WEBRTC_ICE_TRANSPORT);
end;

function GST_WEBRTC_ICE_TRANSPORT_GET_CLASS(obj : Pointer) : PGstWebRTCICETransportClass;
begin
  Result := PGstWebRTCICETransportClass(PGTypeInstance(obj)^.g_class);
end;



end.
