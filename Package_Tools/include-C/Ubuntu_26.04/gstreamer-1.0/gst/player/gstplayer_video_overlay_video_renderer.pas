unit gstplayer_video_overlay_video_renderer;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * Copyright (C) 2014-2015 Sebastian Dröge <sebastian@centricular.com>
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
{$ifndef __GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_H__}
{$define __GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_H__}
{$include <gst/player/gstplayer-types.h>}
{$include <gst/player/gstplayer-video-renderer.h>}
type

{ was #define dname def_expr }
function GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_CAST(obj : longint) : PGstPlayerVideoOverlayVideoRenderer;

function gst_player_video_overlay_video_renderer_get_type:TGType;cdecl;external libgstplayer;
function gst_player_video_overlay_video_renderer_new(window_handle:Tgpointer):PGstPlayerVideoRenderer;cdecl;external libgstplayer;
function gst_player_video_overlay_video_renderer_new_with_sink(window_handle:Tgpointer; video_sink:PGstElement):PGstPlayerVideoRenderer;cdecl;external libgstplayer;
procedure gst_player_video_overlay_video_renderer_set_window_handle(self:PGstPlayerVideoOverlayVideoRenderer; window_handle:Tgpointer);cdecl;external libgstplayer;
function gst_player_video_overlay_video_renderer_get_window_handle(self:PGstPlayerVideoOverlayVideoRenderer):Tgpointer;cdecl;external libgstplayer;
procedure gst_player_video_overlay_video_renderer_expose(self:PGstPlayerVideoOverlayVideoRenderer);cdecl;external libgstplayer;
procedure gst_player_video_overlay_video_renderer_set_render_rectangle(self:PGstPlayerVideoOverlayVideoRenderer; x:Tgint; y:Tgint; width:Tgint; height:Tgint);cdecl;external libgstplayer;
procedure gst_player_video_overlay_video_renderer_get_render_rectangle(self:PGstPlayerVideoOverlayVideoRenderer; x:Pgint; y:Pgint; width:Pgint; height:Pgint);cdecl;external libgstplayer;
{$endif}
{ __GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_H__  }

// === Konventiert am: 24-7-26 19:51:26 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER : longint; { return type might be wrong }
  begin
    GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER:=gst_player_video_overlay_video_renderer_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER(obj : longint) : longint;
begin
  GST_IS_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_CLASS(klass : longint) : longint;
begin
  GST_IS_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_GET_CLASS(obj : longint) : longint;
begin
  GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER,GstPlayerVideoOverlayVideoRendererClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER(obj : longint) : longint;
begin
  GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER,GstPlayerVideoOverlayVideoRenderer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_CLASS(klass : longint) : longint;
begin
  GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER,GstPlayerVideoOverlayVideoRendererClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_CAST(obj : longint) : PGstPlayerVideoOverlayVideoRenderer;
begin
  GST_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER_CAST:=PGstPlayerVideoOverlayVideoRenderer(obj);
end;


end.
