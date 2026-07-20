
unit rtsp_onvif_media;
interface

{
  Automatically converted by H2Pas 1.0.0 from rtsp_onvif_media.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rtsp_onvif_media
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
PGstRTSPOnvifMedia  = ^GstRTSPOnvifMedia;
PGstRTSPOnvifMediaClass  = ^GstRTSPOnvifMediaClass;
PGstRTSPOnvifMediaPrivate  = ^GstRTSPOnvifMediaPrivate;
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
{$ifndef __GST_RTSP_ONVIF_MEDIA_H__}
{$define __GST_RTSP_ONVIF_MEDIA_H__}
{$include <gst/gst.h>}
{$include "rtsp-media.h"}

{ was #define dname def_expr }
function GST_TYPE_RTSP_ONVIF_MEDIA : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_ONVIF_MEDIA(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_ONVIF_MEDIA_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ONVIF_MEDIA_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ONVIF_MEDIA(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ONVIF_MEDIA_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_ONVIF_MEDIA_CAST(obj : longint) : PGstRTSPOnvifMedia;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_ONVIF_MEDIA_CLASS_CAST(klass : longint) : PGstRTSPOnvifMediaClass;

type
{*
 * GstRTSPOnvifMedia:
 *
 * Since: 1.14
  }
{< private > }
  PGstRTSPOnvifMediaClass = ^TGstRTSPOnvifMediaClass;
  TGstRTSPOnvifMediaClass = record
      parent : TGstRTSPMediaClass;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;

{< private > }
  PGstRTSPOnvifMedia = ^TGstRTSPOnvifMedia;
  TGstRTSPOnvifMedia = record
      parent : TGstRTSPMedia;
      priv : PGstRTSPOnvifMediaPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_rtsp_onvif_media_get_type:TGType;cdecl;external;
function gst_rtsp_onvif_media_collect_backchannel(media:PGstRTSPOnvifMedia):Tgboolean;cdecl;external;
procedure gst_rtsp_onvif_media_set_backchannel_bandwidth(media:PGstRTSPOnvifMedia; bandwidth:Tguint);cdecl;external;
function gst_rtsp_onvif_media_get_backchannel_bandwidth(media:PGstRTSPOnvifMedia):Tguint;cdecl;external;
{$endif}
{ __GST_RTSP_ONVIF_MEDIA_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_RTSP_ONVIF_MEDIA : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_ONVIF_MEDIA:=gst_rtsp_onvif_media_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_ONVIF_MEDIA(obj : longint) : longint;
begin
  GST_IS_RTSP_ONVIF_MEDIA:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_RTSP_ONVIF_MEDIA);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_ONVIF_MEDIA_CLASS(klass : longint) : longint;
begin
  GST_IS_RTSP_ONVIF_MEDIA_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_RTSP_ONVIF_MEDIA);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ONVIF_MEDIA_GET_CLASS(obj : longint) : longint;
begin
  GST_RTSP_ONVIF_MEDIA_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_RTSP_ONVIF_MEDIA,GstRTSPOnvifMediaClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ONVIF_MEDIA(obj : longint) : longint;
begin
  GST_RTSP_ONVIF_MEDIA:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_RTSP_ONVIF_MEDIA,GstRTSPOnvifMedia);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ONVIF_MEDIA_CLASS(klass : longint) : longint;
begin
  GST_RTSP_ONVIF_MEDIA_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_RTSP_ONVIF_MEDIA,GstRTSPOnvifMediaClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_ONVIF_MEDIA_CAST(obj : longint) : PGstRTSPOnvifMedia;
begin
  GST_RTSP_ONVIF_MEDIA_CAST:=PGstRTSPOnvifMedia(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_ONVIF_MEDIA_CLASS_CAST(klass : longint) : PGstRTSPOnvifMediaClass;
begin
  GST_RTSP_ONVIF_MEDIA_CLASS_CAST:=PGstRTSPOnvifMediaClass(klass);
end;


end.
