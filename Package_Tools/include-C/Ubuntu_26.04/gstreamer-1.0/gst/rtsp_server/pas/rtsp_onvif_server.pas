unit rtsp_onvif_server;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2017 Sebastian Dröge <sebastian@centricular.com>
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
{$ifndef __GST_RTSP_ONVIF_SERVER_H__}
{$define __GST_RTSP_ONVIF_SERVER_H__}
{$include <gst/gst.h>}
{$include "rtsp-server-object.h"}

{ was #define dname def_expr }
function GST_TYPE_RTSP_ONVIF_SERVER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_ONVIF_SERVER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_ONVIF_SERVER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ONVIF_SERVER_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ONVIF_SERVER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ONVIF_SERVER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_ONVIF_SERVER_CAST(obj : longint) : PGstRTSPOnvifServer;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_ONVIF_SERVER_CLASS_CAST(klass : longint) : PGstRTSPOnvifServerClass;

type
{*
 * GstRTSPOnvifServer:
 *
 * Since: 1.14
  }
{< private > }
  PGstRTSPOnvifServerClass = ^TGstRTSPOnvifServerClass;
  TGstRTSPOnvifServerClass = record
      parent : TGstRTSPServerClass;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;

{< private > }
  PGstRTSPOnvifServer = ^TGstRTSPOnvifServer;
  TGstRTSPOnvifServer = record
      parent : TGstRTSPServer;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_rtsp_onvif_server_get_type:TGType;cdecl;external libgstrtsp;
function gst_rtsp_onvif_server_new:PGstRTSPServer;cdecl;external libgstrtsp;
const
  GST_RTSP_ONVIF_BACKCHANNEL_REQUIREMENT = 'www.onvif.org/ver20/backchannel';  
  GST_RTSP_ONVIF_REPLAY_REQUIREMENT = 'onvif-replay';  
{$include "rtsp-onvif-client.h"}
{$include "rtsp-onvif-media-factory.h"}
{$include "rtsp-onvif-media.h"}
{$endif}
{ __GST_RTSP_ONVIF_SERVER_H__  }

// === Konventiert am: 20-7-26 13:44:53 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_RTSP_ONVIF_SERVER : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_ONVIF_SERVER:=gst_rtsp_onvif_server_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_ONVIF_SERVER(obj : longint) : longint;
begin
  GST_IS_RTSP_ONVIF_SERVER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_RTSP_ONVIF_SERVER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_ONVIF_SERVER_CLASS(klass : longint) : longint;
begin
  GST_IS_RTSP_ONVIF_SERVER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_RTSP_ONVIF_SERVER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ONVIF_SERVER_GET_CLASS(obj : longint) : longint;
begin
  GST_RTSP_ONVIF_SERVER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_RTSP_ONVIF_SERVER,GstRTSPOnvifServerClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ONVIF_SERVER(obj : longint) : longint;
begin
  GST_RTSP_ONVIF_SERVER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_RTSP_ONVIF_SERVER,GstRTSPOnvifServer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ONVIF_SERVER_CLASS(klass : longint) : longint;
begin
  GST_RTSP_ONVIF_SERVER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_RTSP_ONVIF_SERVER,GstRTSPOnvifServerClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_ONVIF_SERVER_CAST(obj : longint) : PGstRTSPOnvifServer;
begin
  GST_RTSP_ONVIF_SERVER_CAST:=PGstRTSPOnvifServer(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_ONVIF_SERVER_CLASS_CAST(klass : longint) : PGstRTSPOnvifServerClass;
begin
  GST_RTSP_ONVIF_SERVER_CLASS_CAST:=PGstRTSPOnvifServerClass(klass);
end;


end.
