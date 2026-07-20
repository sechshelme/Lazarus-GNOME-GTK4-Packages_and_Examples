
unit rtsp_onvif_client;
interface

{
  Automatically converted by H2Pas 1.0.0 from rtsp_onvif_client.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rtsp_onvif_client.h
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
PGstRTSPClient  = ^GstRTSPClient;
PGstRTSPOnvifClient  = ^GstRTSPOnvifClient;
PGstRTSPOnvifClientClass  = ^GstRTSPOnvifClientClass;
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
{$ifndef __GST_RTSP_ONVIF_CLIENT_H__}
{$define __GST_RTSP_ONVIF_CLIENT_H__}
{$include <gst/gst.h>}
{$include "rtsp-client.h"}

{ was #define dname def_expr }
function GST_TYPE_RTSP_ONVIF_CLIENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_ONVIF_CLIENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_ONVIF_CLIENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ONVIF_CLIENT_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ONVIF_CLIENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ONVIF_CLIENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_ONVIF_CLIENT_CAST(obj : longint) : PGstRTSPOnvifClient;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_ONVIF_CLIENT_CLASS_CAST(klass : longint) : PGstRTSPOnvifClientClass;

type
{*
 * GstRTSPOnvifClient:
 *
 * Since: 1.14
  }
{< private > }
  PGstRTSPOnvifClientClass = ^TGstRTSPOnvifClientClass;
  TGstRTSPOnvifClientClass = record
      parent : TGstRTSPClientClass;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;

{< private > }
  PGstRTSPOnvifClient = ^TGstRTSPOnvifClient;
  TGstRTSPOnvifClient = record
      parent : TGstRTSPClient;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_rtsp_onvif_client_get_type:TGType;cdecl;external;
function gst_rtsp_onvif_client_new:PGstRTSPClient;cdecl;external;
{$endif}
{ __GST_RTSP_ONVIF_CLIENT_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_RTSP_ONVIF_CLIENT : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_ONVIF_CLIENT:=gst_rtsp_onvif_client_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_ONVIF_CLIENT(obj : longint) : longint;
begin
  GST_IS_RTSP_ONVIF_CLIENT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_RTSP_ONVIF_CLIENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_ONVIF_CLIENT_CLASS(klass : longint) : longint;
begin
  GST_IS_RTSP_ONVIF_CLIENT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_RTSP_ONVIF_CLIENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ONVIF_CLIENT_GET_CLASS(obj : longint) : longint;
begin
  GST_RTSP_ONVIF_CLIENT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_RTSP_ONVIF_CLIENT,GstRTSPOnvifClientClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ONVIF_CLIENT(obj : longint) : longint;
begin
  GST_RTSP_ONVIF_CLIENT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_RTSP_ONVIF_CLIENT,GstRTSPOnvifClient);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ONVIF_CLIENT_CLASS(klass : longint) : longint;
begin
  GST_RTSP_ONVIF_CLIENT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_RTSP_ONVIF_CLIENT,GstRTSPOnvifClientClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_ONVIF_CLIENT_CAST(obj : longint) : PGstRTSPOnvifClient;
begin
  GST_RTSP_ONVIF_CLIENT_CAST:=PGstRTSPOnvifClient(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_ONVIF_CLIENT_CLASS_CAST(klass : longint) : PGstRTSPOnvifClientClass;
begin
  GST_RTSP_ONVIF_CLIENT_CLASS_CAST:=PGstRTSPOnvifClientClass(klass);
end;


end.
