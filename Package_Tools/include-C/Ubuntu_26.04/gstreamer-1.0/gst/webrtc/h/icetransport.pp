
unit icetransport;
interface

{
  Automatically converted by H2Pas 1.0.0 from icetransport.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    icetransport.h
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
PGstElement  = ^GstElement;
PGstWebRTCICECandidatePair  = ^GstWebRTCICECandidatePair;
PGstWebRTCICETransport  = ^GstWebRTCICETransport;
PGstWebRTCICETransportClass  = ^GstWebRTCICETransportClass;
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

function gst_webrtc_ice_transport_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_WEBRTC_ICE_TRANSPORT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_TRANSPORT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_TRANSPORT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_WEBRTC_ICE_TRANSPORT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_WEBRTC_ICE_TRANSPORT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_TRANSPORT_GET_CLASS(obj : longint) : longint;

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


procedure gst_webrtc_ice_transport_connection_state_change(ice:PGstWebRTCICETransport; new_state:TGstWebRTCICEConnectionState);cdecl;external;
procedure gst_webrtc_ice_transport_gathering_state_change(ice:PGstWebRTCICETransport; new_state:TGstWebRTCICEGatheringState);cdecl;external;
procedure gst_webrtc_ice_transport_selected_pair_change(ice:PGstWebRTCICETransport);cdecl;external;
(* Const before type ignored *)
procedure gst_webrtc_ice_transport_new_candidate(ice:PGstWebRTCICETransport; stream_id:Tguint; component:TGstWebRTCICEComponent; attr:Pgchar);cdecl;external;
function gst_webrtc_ice_transport_get_selected_candidate_pair(transport:PGstWebRTCICETransport):PGstWebRTCICECandidatePair;cdecl;external;
{//////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                (GstWebRTCICETransport, gst_object_unref) }
{$endif}
{ __GST_WEBRTC_ICE_TRANSPORT_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_WEBRTC_ICE_TRANSPORT : longint; { return type might be wrong }
  begin
    GST_TYPE_WEBRTC_ICE_TRANSPORT:=gst_webrtc_ice_transport_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_TRANSPORT(obj : longint) : longint;
begin
  GST_WEBRTC_ICE_TRANSPORT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_WEBRTC_ICE_TRANSPORT,GstWebRTCICETransport);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_TRANSPORT_CLASS(klass : longint) : longint;
begin
  GST_WEBRTC_ICE_TRANSPORT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_WEBRTC_ICE_TRANSPORT,GstWebRTCICETransportClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_WEBRTC_ICE_TRANSPORT(obj : longint) : longint;
begin
  GST_IS_WEBRTC_ICE_TRANSPORT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_WEBRTC_ICE_TRANSPORT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_WEBRTC_ICE_TRANSPORT_CLASS(klass : longint) : longint;
begin
  GST_IS_WEBRTC_ICE_TRANSPORT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_WEBRTC_ICE_TRANSPORT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_TRANSPORT_GET_CLASS(obj : longint) : longint;
begin
  GST_WEBRTC_ICE_TRANSPORT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_WEBRTC_ICE_TRANSPORT,GstWebRTCICETransportClass);
end;


end.
