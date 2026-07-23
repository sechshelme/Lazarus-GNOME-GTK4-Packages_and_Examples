unit dtlstransport;

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
{$ifndef __GST_WEBRTC_DTLS_TRANSPORT_H__}
{$define __GST_WEBRTC_DTLS_TRANSPORT_H__}
{$include <gst/gst.h>}
{$include <gst/webrtc/webrtc_fwd.h>}
{$include <gst/webrtc/icetransport.h>}

function gst_webrtc_dtls_transport_get_type:TGType;cdecl;external libgstwebrtc;
{//////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                (GstWebRTCDTLSTransport, gst_object_unref) }
{$endif}
{ __GST_WEBRTC_DTLS_TRANSPORT_H__  }

// === Konventiert am: 23-7-26 14:13:00 ===

function GST_TYPE_WEBRTC_DTLS_TRANSPORT : TGType;
function GST_WEBRTC_DTLS_TRANSPORT(obj : Pointer) : PGstWebRTCDTLSTransport;
function GST_WEBRTC_DTLS_TRANSPORT_CLASS(klass : Pointer) : PGstWebRTCDTLSTransportClass;
function GST_IS_WEBRTC_DTLS_TRANSPORT(obj : Pointer) : Tgboolean;
function GST_IS_WEBRTC_DTLS_TRANSPORT_CLASS(klass : Pointer) : Tgboolean;
function GST_WEBRTC_DTLS_TRANSPORT_GET_CLASS(obj : Pointer) : PGstWebRTCDTLSTransportClass;

implementation

function GST_TYPE_WEBRTC_DTLS_TRANSPORT : TGType;
  begin
    GST_TYPE_WEBRTC_DTLS_TRANSPORT:=gst_webrtc_dtls_transport_get_type;
  end;

function GST_WEBRTC_DTLS_TRANSPORT(obj : Pointer) : PGstWebRTCDTLSTransport;
begin
  Result := PGstWebRTCDTLSTransport(g_type_check_instance_cast(obj, GST_TYPE_WEBRTC_DTLS_TRANSPORT));
end;

function GST_WEBRTC_DTLS_TRANSPORT_CLASS(klass : Pointer) : PGstWebRTCDTLSTransportClass;
begin
  Result := PGstWebRTCDTLSTransportClass(g_type_check_class_cast(klass, GST_TYPE_WEBRTC_DTLS_TRANSPORT));
end;

function GST_IS_WEBRTC_DTLS_TRANSPORT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_WEBRTC_DTLS_TRANSPORT);
end;

function GST_IS_WEBRTC_DTLS_TRANSPORT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_WEBRTC_DTLS_TRANSPORT);
end;

function GST_WEBRTC_DTLS_TRANSPORT_GET_CLASS(obj : Pointer) : PGstWebRTCDTLSTransportClass;
begin
  Result := PGstWebRTCDTLSTransportClass(PGTypeInstance(obj)^.g_class);
end;



end.
