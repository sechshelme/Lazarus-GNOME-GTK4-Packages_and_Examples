unit rtsp_session_media;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2008 Wim Taymans <wim.taymans at gmail.com>
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
{$include <gst/gst.h>}
{$include <gst/rtsp/gstrtsptransport.h>}
{$ifndef __GST_RTSP_SESSION_MEDIA_H__}
{$define __GST_RTSP_SESSION_MEDIA_H__}
{$include "rtsp-server-prelude.h"}

{ was #define dname def_expr }
function GST_TYPE_RTSP_SESSION_MEDIA : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_SESSION_MEDIA(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_SESSION_MEDIA_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_SESSION_MEDIA_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_SESSION_MEDIA(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_SESSION_MEDIA_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_SESSION_MEDIA_CAST(obj : longint) : PGstRTSPSessionMedia;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_SESSION_MEDIA_CLASS_CAST(klass : longint) : PGstRTSPSessionMediaClass;

type
{*
 * GstRTSPSessionMedia:
 *
 * State of a client session regarding a specific media identified by path.
  }
{< private > }
  PGstRTSPSessionMedia = ^TGstRTSPSessionMedia;
  TGstRTSPSessionMedia = record
      parent : TGObject;
      priv : PGstRTSPSessionMediaPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{< private > }
  PGstRTSPSessionMediaClass = ^TGstRTSPSessionMediaClass;
  TGstRTSPSessionMediaClass = record
      parent_class : TGObjectClass;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_rtsp_session_media_get_type:TGType;cdecl;external libgstrtsp;
function gst_rtsp_session_media_new(path:Pgchar; media:PGstRTSPMedia):PGstRTSPSessionMedia;cdecl;external libgstrtsp;
function gst_rtsp_session_media_matches(media:PGstRTSPSessionMedia; path:Pgchar; matched:Pgint):Tgboolean;cdecl;external libgstrtsp;
function gst_rtsp_session_media_get_media(media:PGstRTSPSessionMedia):PGstRTSPMedia;cdecl;external libgstrtsp;
function gst_rtsp_session_media_get_base_time(media:PGstRTSPSessionMedia):TGstClockTime;cdecl;external libgstrtsp;
{ control media  }
function gst_rtsp_session_media_set_state(media:PGstRTSPSessionMedia; state:TGstState):Tgboolean;cdecl;external libgstrtsp;
procedure gst_rtsp_session_media_set_rtsp_state(media:PGstRTSPSessionMedia; state:TGstRTSPState);cdecl;external libgstrtsp;
function gst_rtsp_session_media_get_rtsp_state(media:PGstRTSPSessionMedia):TGstRTSPState;cdecl;external libgstrtsp;
{ get stream transport config  }
function gst_rtsp_session_media_set_transport(media:PGstRTSPSessionMedia; stream:PGstRTSPStream; tr:PGstRTSPTransport):PGstRTSPStreamTransport;cdecl;external libgstrtsp;
function gst_rtsp_session_media_get_transport(media:PGstRTSPSessionMedia; idx:Tguint):PGstRTSPStreamTransport;cdecl;external libgstrtsp;
function gst_rtsp_session_media_get_transports(media:PGstRTSPSessionMedia):PGPtrArray;cdecl;external libgstrtsp;
function gst_rtsp_session_media_alloc_channels(media:PGstRTSPSessionMedia; range:PGstRTSPRange):Tgboolean;cdecl;external libgstrtsp;
function gst_rtsp_session_media_get_rtpinfo(media:PGstRTSPSessionMedia):Pgchar;cdecl;external libgstrtsp;
{$ifdef //////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           }
{////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           (GstRTSPSessionMedia, gst_object_unref) }
{$endif}
{$endif}
{ __GST_RTSP_SESSION_MEDIA_H__  }

// === Konventiert am: 20-7-26 13:44:10 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_RTSP_SESSION_MEDIA : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_SESSION_MEDIA:=gst_rtsp_session_media_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_SESSION_MEDIA(obj : longint) : longint;
begin
  GST_IS_RTSP_SESSION_MEDIA:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_RTSP_SESSION_MEDIA);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_SESSION_MEDIA_CLASS(klass : longint) : longint;
begin
  GST_IS_RTSP_SESSION_MEDIA_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_RTSP_SESSION_MEDIA);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_SESSION_MEDIA_GET_CLASS(obj : longint) : longint;
begin
  GST_RTSP_SESSION_MEDIA_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_RTSP_SESSION_MEDIA,GstRTSPSessionMediaClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_SESSION_MEDIA(obj : longint) : longint;
begin
  GST_RTSP_SESSION_MEDIA:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_RTSP_SESSION_MEDIA,GstRTSPSessionMedia);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_SESSION_MEDIA_CLASS(klass : longint) : longint;
begin
  GST_RTSP_SESSION_MEDIA_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_RTSP_SESSION_MEDIA,GstRTSPSessionMediaClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_SESSION_MEDIA_CAST(obj : longint) : PGstRTSPSessionMedia;
begin
  GST_RTSP_SESSION_MEDIA_CAST:=PGstRTSPSessionMedia(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_SESSION_MEDIA_CLASS_CAST(klass : longint) : PGstRTSPSessionMediaClass;
begin
  GST_RTSP_SESSION_MEDIA_CLASS_CAST:=PGstRTSPSessionMediaClass(klass);
end;


end.
