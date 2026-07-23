unit icestream;

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
{$ifndef __GST_WEBRTC_ICE_STREAM_H__}
{$define __GST_WEBRTC_ICE_STREAM_H__}
{$include "ice.h"}

function gst_webrtc_ice_stream_get_type:TGType;cdecl;external libgstwebrtc;
type
  PGstWebRTCICEStream = ^TGstWebRTCICEStream;
  TGstWebRTCICEStream = record
      parent : TGstObject;
      stream_id : Tguint;
    end;

  PGstWebRTCICEStreamClass = ^TGstWebRTCICEStreamClass;
  TGstWebRTCICEStreamClass = record
      parent_class : TGstObjectClass;
      find_transport : function (stream:PGstWebRTCICEStream; component:TGstWebRTCICEComponent):PGstWebRTCICETransport;cdecl;
      gather_candidates : function (ice:PGstWebRTCICEStream):Tgboolean;cdecl;
    end;


function gst_webrtc_ice_stream_find_transport(stream:PGstWebRTCICEStream; component:TGstWebRTCICEComponent):PGstWebRTCICETransport;cdecl;external libgstwebrtc;
function gst_webrtc_ice_stream_gather_candidates(ice:PGstWebRTCICEStream):Tgboolean;cdecl;external libgstwebrtc;
{//////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                (GstWebRTCICEStream, gst_object_unref) }
{$endif}
{ __GST_WEBRTC_ICE_STREAM_H__  }

// === Konventiert am: 23-7-26 14:12:35 ===

function GST_TYPE_WEBRTC_ICE_STREAM : TGType;
function GST_WEBRTC_ICE_STREAM(obj : Pointer) : PGstWebRTCICEStream;
function GST_WEBRTC_ICE_STREAM_CLASS(klass : Pointer) : PGstWebRTCICEStreamClass;
function GST_IS_WEBRTC_ICE_STREAM(obj : Pointer) : Tgboolean;
function GST_IS_WEBRTC_ICE_STREAM_CLASS(klass : Pointer) : Tgboolean;
function GST_WEBRTC_ICE_STREAM_GET_CLASS(obj : Pointer) : PGstWebRTCICEStreamClass;

implementation

function GST_TYPE_WEBRTC_ICE_STREAM : TGType;
  begin
    GST_TYPE_WEBRTC_ICE_STREAM:=gst_webrtc_ice_stream_get_type;
  end;

function GST_WEBRTC_ICE_STREAM(obj : Pointer) : PGstWebRTCICEStream;
begin
  Result := PGstWebRTCICEStream(g_type_check_instance_cast(obj, GST_TYPE_WEBRTC_ICE_STREAM));
end;

function GST_WEBRTC_ICE_STREAM_CLASS(klass : Pointer) : PGstWebRTCICEStreamClass;
begin
  Result := PGstWebRTCICEStreamClass(g_type_check_class_cast(klass, GST_TYPE_WEBRTC_ICE_STREAM));
end;

function GST_IS_WEBRTC_ICE_STREAM(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_WEBRTC_ICE_STREAM);
end;

function GST_IS_WEBRTC_ICE_STREAM_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_WEBRTC_ICE_STREAM);
end;

function GST_WEBRTC_ICE_STREAM_GET_CLASS(obj : Pointer) : PGstWebRTCICEStreamClass;
begin
  Result := PGstWebRTCICEStreamClass(PGTypeInstance(obj)^.g_class);
end;



end.
