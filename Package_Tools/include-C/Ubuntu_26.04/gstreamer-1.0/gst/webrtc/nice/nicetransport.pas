unit nicetransport;

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
{$ifndef __GST_WEBRTC_NICE_TRANSPORT_H__}
{$define __GST_WEBRTC_NICE_TRANSPORT_H__}
{$include "nice.h"}
{$include "gst/webrtc/icetransport.h"}
{ libnice  }
{$include <agent.h>}
{$include "nice_fwd.h"}

function gst_webrtc_nice_transport_get_type:TGType;cdecl;external libgstwebrtcnice;
{*
 * GstWebRTCNiceTransport:
  }
type
  PGstWebRTCNiceTransport = ^TGstWebRTCNiceTransport;
  TGstWebRTCNiceTransport = record
      parent : TGstWebRTCICETransport;
      stream : PGstWebRTCNiceStream;
      priv : PGstWebRTCNiceTransportPrivate;
    end;

  PGstWebRTCNiceTransportClass = ^TGstWebRTCNiceTransportClass;
  TGstWebRTCNiceTransportClass = record
      parent_class : TGstWebRTCICETransportClass;
    end;


function gst_webrtc_nice_transport_new(stream:PGstWebRTCNiceStream; component:TGstWebRTCICEComponent):PGstWebRTCNiceTransport;cdecl;external libgstwebrtcnice;
procedure gst_webrtc_nice_transport_update_buffer_size(nice:PGstWebRTCNiceTransport);cdecl;external libgstwebrtcnice;
{//////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                (GstWebRTCNiceTransport, gst_object_unref) }
{$endif}
{ __GST_WEBRTC_NICE_TRANSPORT_H__  }

// === Konventiert am: 23-7-26 14:05:54 ===

function GST_TYPE_WEBRTC_NICE_TRANSPORT : TGType;
function GST_WEBRTC_NICE_TRANSPORT(obj : Pointer) : PGstWebRTCNiceTransport;
function GST_WEBRTC_NICE_TRANSPORT_CLASS(klass : Pointer) : PGstWebRTCNiceTransportClass;
function GST_IS_WEBRTC_NICE_TRANSPORT(obj : Pointer) : Tgboolean;
function GST_IS_WEBRTC_NICE_TRANSPORT_CLASS(klass : Pointer) : Tgboolean;
function GST_WEBRTC_NICE_TRANSPORT_GET_CLASS(obj : Pointer) : PGstWebRTCNiceTransportClass;

implementation

function GST_TYPE_WEBRTC_NICE_TRANSPORT : TGType;
  begin
    GST_TYPE_WEBRTC_NICE_TRANSPORT:=gst_webrtc_nice_transport_get_type;
  end;

function GST_WEBRTC_NICE_TRANSPORT(obj : Pointer) : PGstWebRTCNiceTransport;
begin
  Result := PGstWebRTCNiceTransport(g_type_check_instance_cast(obj, GST_TYPE_WEBRTC_NICE_TRANSPORT));
end;

function GST_WEBRTC_NICE_TRANSPORT_CLASS(klass : Pointer) : PGstWebRTCNiceTransportClass;
begin
  Result := PGstWebRTCNiceTransportClass(g_type_check_class_cast(klass, GST_TYPE_WEBRTC_NICE_TRANSPORT));
end;

function GST_IS_WEBRTC_NICE_TRANSPORT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_WEBRTC_NICE_TRANSPORT);
end;

function GST_IS_WEBRTC_NICE_TRANSPORT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_WEBRTC_NICE_TRANSPORT);
end;

function GST_WEBRTC_NICE_TRANSPORT_GET_CLASS(obj : Pointer) : PGstWebRTCNiceTransportClass;
begin
  Result := PGstWebRTCNiceTransportClass(PGTypeInstance(obj)^.g_class);
end;



end.
