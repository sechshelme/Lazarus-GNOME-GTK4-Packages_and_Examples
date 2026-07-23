unit gstaudiovisualizer;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2011> Stefan Kost <ensonic@users.sf.net>
 * Copyright (C) <2015> Luis de Bethencourt <luis@debethencourt.com>
 *
 * gstaudiovisualizer.c: base class for audio visualisation elements
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
{$ifndef __GST_AUDIO_VISUALIZER_H__}
{$define __GST_AUDIO_VISUALIZER_H__}
{$include <gst/gst.h>}
{$include <gst/base/gstbasetransform.h>}
{$include <gst/video/video.h>}
{$include <gst/audio/audio.h>}
{$include <gst/base/gstadapter.h>}
{$include <gst/pbutils/pbutils-prelude.h>}

{ was #define dname def_expr }
function GST_TYPE_AUDIO_VISUALIZER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_VISUALIZER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_VISUALIZER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_VISUALIZER_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_SYNAESTHESIA(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_SYNAESTHESIA_CLASS(klass : longint) : longint;

type

  TGstAudioVisualizerShaderFunc = procedure (scope:PGstAudioVisualizer; s:PGstVideoFrame; d:PGstVideoFrame);cdecl;
{*
 * GstAudioVisualizerShader:
 * @GST_AUDIO_VISUALIZER_SHADER_NONE: no shading
 * @GST_AUDIO_VISUALIZER_SHADER_FADE: plain fading
 * @GST_AUDIO_VISUALIZER_SHADER_FADE_AND_MOVE_UP: fade and move up
 * @GST_AUDIO_VISUALIZER_SHADER_FADE_AND_MOVE_DOWN: fade and move down
 * @GST_AUDIO_VISUALIZER_SHADER_FADE_AND_MOVE_LEFT: fade and move left
 * @GST_AUDIO_VISUALIZER_SHADER_FADE_AND_MOVE_RIGHT: fade and move right
 * @GST_AUDIO_VISUALIZER_SHADER_FADE_AND_MOVE_HORIZ_OUT: fade and move horizontally out
 * @GST_AUDIO_VISUALIZER_SHADER_FADE_AND_MOVE_HORIZ_IN: fade and move horizontally in
 * @GST_AUDIO_VISUALIZER_SHADER_FADE_AND_MOVE_VERT_OUT: fade and move vertically out
 * @GST_AUDIO_VISUALIZER_SHADER_FADE_AND_MOVE_VERT_IN: fade and move vertically in
 *
 * Different types of supported background shading functions.
  }

  PGstAudioVisualizerShader = ^TGstAudioVisualizerShader;
  TGstAudioVisualizerShader =  Longint;
  Const
    GST_AUDIO_VISUALIZER_SHADER_NONE = 0;
    GST_AUDIO_VISUALIZER_SHADER_FADE = 1;
    GST_AUDIO_VISUALIZER_SHADER_FADE_AND_MOVE_UP = 2;
    GST_AUDIO_VISUALIZER_SHADER_FADE_AND_MOVE_DOWN = 3;
    GST_AUDIO_VISUALIZER_SHADER_FADE_AND_MOVE_LEFT = 4;
    GST_AUDIO_VISUALIZER_SHADER_FADE_AND_MOVE_RIGHT = 5;
    GST_AUDIO_VISUALIZER_SHADER_FADE_AND_MOVE_HORIZ_OUT = 6;
    GST_AUDIO_VISUALIZER_SHADER_FADE_AND_MOVE_HORIZ_IN = 7;
    GST_AUDIO_VISUALIZER_SHADER_FADE_AND_MOVE_VERT_OUT = 8;
    GST_AUDIO_VISUALIZER_SHADER_FADE_AND_MOVE_VERT_IN = 9;
;
{ min samples per frame wanted by the subclass  }
{ video state  }
{ audio state  }
{< private > }
type
  PGstAudioVisualizer = ^TGstAudioVisualizer;
  TGstAudioVisualizer = record
      parent : TGstElement;
      req_spf : Tguint;
      vinfo : TGstVideoInfo;
      ainfo : TGstAudioInfo;
      priv : PGstAudioVisualizerPrivate;
    end;

{< private > }
{< public > }
{ virtual function, called whenever the format changes  }
{ virtual function for rendering a frame  }
  PGstAudioVisualizerClass = ^TGstAudioVisualizerClass;
  TGstAudioVisualizerClass = record
      parent_class : TGstElementClass;
      setup : function (scope:PGstAudioVisualizer):Tgboolean;cdecl;
      render : function (scope:PGstAudioVisualizer; audio:PGstBuffer; video:PGstVideoFrame):Tgboolean;cdecl;
      decide_allocation : function (scope:PGstAudioVisualizer; query:PGstQuery):Tgboolean;cdecl;
    end;


function gst_audio_visualizer_get_type:TGType;cdecl;external libgstpbutils;
{//////////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                   (GstAudioVisualizer, gst_object_unref) }
{$endif}
{ __GST_AUDIO_VISUALIZER_H__  }

// === Konventiert am: 23-7-26 19:46:06 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_AUDIO_VISUALIZER : longint; { return type might be wrong }
  begin
    GST_TYPE_AUDIO_VISUALIZER:=gst_audio_visualizer_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_VISUALIZER(obj : longint) : longint;
begin
  GST_AUDIO_VISUALIZER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_AUDIO_VISUALIZER,GstAudioVisualizer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_VISUALIZER_CLASS(klass : longint) : longint;
begin
  GST_AUDIO_VISUALIZER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_AUDIO_VISUALIZER,GstAudioVisualizerClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_VISUALIZER_GET_CLASS(obj : longint) : longint;
begin
  GST_AUDIO_VISUALIZER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_AUDIO_VISUALIZER,GstAudioVisualizerClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_SYNAESTHESIA(obj : longint) : longint;
begin
  GST_IS_SYNAESTHESIA:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_AUDIO_VISUALIZER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_SYNAESTHESIA_CLASS(klass : longint) : longint;
begin
  GST_IS_SYNAESTHESIA_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_AUDIO_VISUALIZER);
end;


end.
