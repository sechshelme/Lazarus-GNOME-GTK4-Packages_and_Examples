unit rtptransceiver;

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
{$ifndef __GST_WEBRTC_RTP_TRANSCEIVER_H__}
{$define __GST_WEBRTC_RTP_TRANSCEIVER_H__}
{$include <gst/gst.h>}
{$include <gst/webrtc/webrtc_fwd.h>}

function gst_webrtc_rtp_transceiver_get_type:TGType;cdecl;external libgstwebrtc;
{//////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                (GstWebRTCRTPTransceiver, gst_object_unref) }
{$endif}
{ __GST_WEBRTC_RTP_TRANSCEIVER_H__  }

// === Konventiert am: 23-7-26 14:12:08 ===

function GST_TYPE_WEBRTC_RTP_TRANSCEIVER : TGType;
function GST_WEBRTC_RTP_TRANSCEIVER(obj : Pointer) : PGstWebRTCRTPTransceiver;
function GST_WEBRTC_RTP_TRANSCEIVER_CLASS(klass : Pointer) : PGstWebRTCRTPTransceiverClass;
function GST_IS_WEBRTC_RTP_TRANSCEIVER(obj : Pointer) : Tgboolean;
function GST_IS_WEBRTC_RTP_TRANSCEIVER_CLASS(klass : Pointer) : Tgboolean;
function GST_WEBRTC_RTP_TRANSCEIVER_GET_CLASS(obj : Pointer) : PGstWebRTCRTPTransceiverClass;

implementation

function GST_TYPE_WEBRTC_RTP_TRANSCEIVER : TGType;
  begin
    GST_TYPE_WEBRTC_RTP_TRANSCEIVER:=gst_webrtc_rtp_transceiver_get_type;
  end;

function GST_WEBRTC_RTP_TRANSCEIVER(obj : Pointer) : PGstWebRTCRTPTransceiver;
begin
  Result := PGstWebRTCRTPTransceiver(g_type_check_instance_cast(obj, GST_TYPE_WEBRTC_RTP_TRANSCEIVER));
end;

function GST_WEBRTC_RTP_TRANSCEIVER_CLASS(klass : Pointer) : PGstWebRTCRTPTransceiverClass;
begin
  Result := PGstWebRTCRTPTransceiverClass(g_type_check_class_cast(klass, GST_TYPE_WEBRTC_RTP_TRANSCEIVER));
end;

function GST_IS_WEBRTC_RTP_TRANSCEIVER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_WEBRTC_RTP_TRANSCEIVER);
end;

function GST_IS_WEBRTC_RTP_TRANSCEIVER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_WEBRTC_RTP_TRANSCEIVER);
end;

function GST_WEBRTC_RTP_TRANSCEIVER_GET_CLASS(obj : Pointer) : PGstWebRTCRTPTransceiverClass;
begin
  Result := PGstWebRTCRTPTransceiverClass(PGTypeInstance(obj)^.g_class);
end;



end.
