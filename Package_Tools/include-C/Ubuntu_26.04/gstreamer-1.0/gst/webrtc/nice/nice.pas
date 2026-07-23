unit nice;

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
{$ifndef __GST_WEBRTC_NICE_H__}
{$define __GST_WEBRTC_NICE_H__}
{$include "gst/webrtc/ice.h"}
{$include "nicestream.h"}
{$include "nicetransport.h"}
{$include "nice_fwd.h"}

function gst_webrtc_nice_get_type:TGType;cdecl;external libgstwebrtcnice;
{*
 * GstWebRTCNice:
  }
type
  PGstWebRTCNice = ^TGstWebRTCNice;
  TGstWebRTCNice = record
      parent : TGstWebRTCICE;
      priv : PGstWebRTCNicePrivate;
    end;

  PGstWebRTCNiceClass = ^TGstWebRTCNiceClass;
  TGstWebRTCNiceClass = record
      parent_class : TGstWebRTCICEClass;
    end;


function gst_webrtc_nice_new(name:Pgchar):PGstWebRTCNice;cdecl;external libgstwebrtcnice;
{//////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                (GstWebRTCNice, gst_object_unref) }
{$endif}
{ __GST_WEBRTC_NICE_H__  }

// === Konventiert am: 23-7-26 14:05:45 ===

function GST_TYPE_WEBRTC_NICE : TGType;
function GST_WEBRTC_NICE(obj : Pointer) : PGstWebRTCNice;
function GST_WEBRTC_NICE_CLASS(klass : Pointer) : PGstWebRTCNiceClass;
function GST_IS_WEBRTC_NICE(obj : Pointer) : Tgboolean;
function GST_IS_WEBRTC_NICE_CLASS(klass : Pointer) : Tgboolean;
function GST_WEBRTC_NICE_GET_CLASS(obj : Pointer) : PGstWebRTCNiceClass;

implementation

function GST_TYPE_WEBRTC_NICE : TGType;
  begin
    GST_TYPE_WEBRTC_NICE:=gst_webrtc_nice_get_type;
  end;

function GST_WEBRTC_NICE(obj : Pointer) : PGstWebRTCNice;
begin
  Result := PGstWebRTCNice(g_type_check_instance_cast(obj, GST_TYPE_WEBRTC_NICE));
end;

function GST_WEBRTC_NICE_CLASS(klass : Pointer) : PGstWebRTCNiceClass;
begin
  Result := PGstWebRTCNiceClass(g_type_check_class_cast(klass, GST_TYPE_WEBRTC_NICE));
end;

function GST_IS_WEBRTC_NICE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_WEBRTC_NICE);
end;

function GST_IS_WEBRTC_NICE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_WEBRTC_NICE);
end;

function GST_WEBRTC_NICE_GET_CLASS(obj : Pointer) : PGstWebRTCNiceClass;
begin
  Result := PGstWebRTCNiceClass(PGTypeInstance(obj)^.g_class);
end;



end.
