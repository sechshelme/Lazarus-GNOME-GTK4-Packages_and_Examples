
unit datachannel;
interface

{
  Automatically converted by H2Pas 1.0.0 from datachannel.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    datachannel.h
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
PGBytes  = ^GBytes;
Pgchar  = ^gchar;
PGError  = ^GError;
PGstWebRTCDataChannel  = ^GstWebRTCDataChannel;
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

function gst_webrtc_data_channel_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_WEBRTC_DATA_CHANNEL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_DATA_CHANNEL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_DATA_CHANNEL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_WEBRTC_DATA_CHANNEL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_WEBRTC_DATA_CHANNEL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_DATA_CHANNEL_GET_CLASS(obj : longint) : longint;

function gst_webrtc_data_channel_send_data_full(channel:PGstWebRTCDataChannel; data:PGBytes; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_webrtc_data_channel_send_string_full(channel:PGstWebRTCDataChannel; str:Pgchar; error:PPGError):Tgboolean;cdecl;external;
procedure gst_webrtc_data_channel_close(channel:PGstWebRTCDataChannel);cdecl;external;
{$ifndef GST_REMOVE_DEPRECATED}
{xxxxxxGST_WEBRTC_DEPRECATED_FOR(gst_webrtc_data_channel_send_data_full) }

procedure gst_webrtc_data_channel_send_data(channel:PGstWebRTCDataChannel; data:PGBytes);cdecl;external;
{xxxxxxxGST_WEBRTC_DEPRECATED_FOR(gst_webrtc_data_channel_send_string_full) }
(* Const before type ignored *)
procedure gst_webrtc_data_channel_send_string(channel:PGstWebRTCDataChannel; str:Pgchar);cdecl;external;
{$endif}
{//////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                (GstWebRTCDataChannel, g_object_unref) }
{$endif}
{ __GST_WEBRTC_DATA_CHANNEL_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_WEBRTC_DATA_CHANNEL : longint; { return type might be wrong }
  begin
    GST_TYPE_WEBRTC_DATA_CHANNEL:=gst_webrtc_data_channel_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_DATA_CHANNEL(obj : longint) : longint;
begin
  GST_WEBRTC_DATA_CHANNEL:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_WEBRTC_DATA_CHANNEL,GstWebRTCDataChannel);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_DATA_CHANNEL_CLASS(klass : longint) : longint;
begin
  GST_WEBRTC_DATA_CHANNEL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_WEBRTC_DATA_CHANNEL,GstWebRTCDataChannelClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_WEBRTC_DATA_CHANNEL(obj : longint) : longint;
begin
  GST_IS_WEBRTC_DATA_CHANNEL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_WEBRTC_DATA_CHANNEL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_WEBRTC_DATA_CHANNEL_CLASS(klass : longint) : longint;
begin
  GST_IS_WEBRTC_DATA_CHANNEL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_WEBRTC_DATA_CHANNEL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_DATA_CHANNEL_GET_CLASS(obj : longint) : longint;
begin
  GST_WEBRTC_DATA_CHANNEL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_WEBRTC_DATA_CHANNEL,GstWebRTCDataChannelClass);
end;


end.
