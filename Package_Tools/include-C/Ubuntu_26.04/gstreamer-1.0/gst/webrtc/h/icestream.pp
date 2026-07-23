
unit icestream;
interface

{
  Automatically converted by H2Pas 1.0.0 from icestream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    icestream.h
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
PGstWebRTCICEStream  = ^GstWebRTCICEStream;
PGstWebRTCICEStreamClass  = ^GstWebRTCICEStreamClass;
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
{$ifndef __GST_WEBRTC_ICE_STREAM_H__}
{$define __GST_WEBRTC_ICE_STREAM_H__}
{$include "ice.h"}

function gst_webrtc_ice_stream_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_WEBRTC_ICE_STREAM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_STREAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_STREAM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_WEBRTC_ICE_STREAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_WEBRTC_ICE_STREAM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_STREAM_GET_CLASS(obj : longint) : longint;

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


function gst_webrtc_ice_stream_find_transport(stream:PGstWebRTCICEStream; component:TGstWebRTCICEComponent):PGstWebRTCICETransport;cdecl;external;
function gst_webrtc_ice_stream_gather_candidates(ice:PGstWebRTCICEStream):Tgboolean;cdecl;external;
{//////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                (GstWebRTCICEStream, gst_object_unref) }
{$endif}
{ __GST_WEBRTC_ICE_STREAM_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_WEBRTC_ICE_STREAM : longint; { return type might be wrong }
  begin
    GST_TYPE_WEBRTC_ICE_STREAM:=gst_webrtc_ice_stream_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_STREAM(obj : longint) : longint;
begin
  GST_WEBRTC_ICE_STREAM:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_WEBRTC_ICE_STREAM,GstWebRTCICEStream);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_STREAM_CLASS(klass : longint) : longint;
begin
  GST_WEBRTC_ICE_STREAM_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_WEBRTC_ICE_STREAM,GstWebRTCICEStreamClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_WEBRTC_ICE_STREAM(obj : longint) : longint;
begin
  GST_IS_WEBRTC_ICE_STREAM:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_WEBRTC_ICE_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_WEBRTC_ICE_STREAM_CLASS(klass : longint) : longint;
begin
  GST_IS_WEBRTC_ICE_STREAM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_WEBRTC_ICE_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_WEBRTC_ICE_STREAM_GET_CLASS(obj : longint) : longint;
begin
  GST_WEBRTC_ICE_STREAM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_WEBRTC_ICE_STREAM,GstWebRTCICEStreamClass);
end;


end.
