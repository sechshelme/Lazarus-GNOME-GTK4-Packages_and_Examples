unit datachannel;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2018 Matthew Waters <matthew@centricular.com>
 * Copyright (C) 2020 Sebastian Dröge <sebastian@centricular.com>
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
{$ifndef __GST_WEBRTC_DATA_CHANNEL_H__}
{$define __GST_WEBRTC_DATA_CHANNEL_H__}
{$include <gst/gst.h>}
{$include <gst/webrtc/webrtc_fwd.h>}

function gst_webrtc_data_channel_get_type:TGType;cdecl;external libgstwebrtc;
function gst_webrtc_data_channel_send_data_full(channel:PGstWebRTCDataChannel; data:PGBytes; error:PPGError):Tgboolean;cdecl;external libgstwebrtc;
function gst_webrtc_data_channel_send_string_full(channel:PGstWebRTCDataChannel; str:Pgchar; error:PPGError):Tgboolean;cdecl;external libgstwebrtc;
procedure gst_webrtc_data_channel_close(channel:PGstWebRTCDataChannel);cdecl;external libgstwebrtc;
{$ifndef GST_REMOVE_DEPRECATED}
{xxxxxxGST_WEBRTC_DEPRECATED_FOR(gst_webrtc_data_channel_send_data_full) }

procedure gst_webrtc_data_channel_send_data(channel:PGstWebRTCDataChannel; data:PGBytes);cdecl;external libgstwebrtc;
{xxxxxxxGST_WEBRTC_DEPRECATED_FOR(gst_webrtc_data_channel_send_string_full) }
procedure gst_webrtc_data_channel_send_string(channel:PGstWebRTCDataChannel; str:Pgchar);cdecl;external libgstwebrtc;
{$endif}
{//////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                (GstWebRTCDataChannel, g_object_unref) }
{$endif}
{ __GST_WEBRTC_DATA_CHANNEL_H__  }

// === Konventiert am: 23-7-26 14:13:05 ===

function GST_TYPE_WEBRTC_DATA_CHANNEL : TGType;
function GST_WEBRTC_DATA_CHANNEL(obj : Pointer) : PGstWebRTCDataChannel;
function GST_WEBRTC_DATA_CHANNEL_CLASS(klass : Pointer) : PGstWebRTCDataChannelClass;
function GST_IS_WEBRTC_DATA_CHANNEL(obj : Pointer) : Tgboolean;
function GST_IS_WEBRTC_DATA_CHANNEL_CLASS(klass : Pointer) : Tgboolean;
function GST_WEBRTC_DATA_CHANNEL_GET_CLASS(obj : Pointer) : PGstWebRTCDataChannelClass;

implementation

function GST_TYPE_WEBRTC_DATA_CHANNEL : TGType;
  begin
    GST_TYPE_WEBRTC_DATA_CHANNEL:=gst_webrtc_data_channel_get_type;
  end;

function GST_WEBRTC_DATA_CHANNEL(obj : Pointer) : PGstWebRTCDataChannel;
begin
  Result := PGstWebRTCDataChannel(g_type_check_instance_cast(obj, GST_TYPE_WEBRTC_DATA_CHANNEL));
end;

function GST_WEBRTC_DATA_CHANNEL_CLASS(klass : Pointer) : PGstWebRTCDataChannelClass;
begin
  Result := PGstWebRTCDataChannelClass(g_type_check_class_cast(klass, GST_TYPE_WEBRTC_DATA_CHANNEL));
end;

function GST_IS_WEBRTC_DATA_CHANNEL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_WEBRTC_DATA_CHANNEL);
end;

function GST_IS_WEBRTC_DATA_CHANNEL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_WEBRTC_DATA_CHANNEL);
end;

function GST_WEBRTC_DATA_CHANNEL_GET_CLASS(obj : Pointer) : PGstWebRTCDataChannelClass;
begin
  Result := PGstWebRTCDataChannelClass(PGTypeInstance(obj)^.g_class);
end;



end.
