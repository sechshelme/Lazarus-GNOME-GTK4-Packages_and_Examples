unit gstvideosink;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{  GStreamer video sink base class
 *  Copyright (C) <2003> Julien Moutte <julien@moutte.net>
 *  Copyright (C) <2009> Tim-Philipp Müller <tim centricular net>
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
{ FIXME 0.11: turn this into a proper base class  }
{$ifndef __GST_VIDEO_SINK_H__}
{$define __GST_VIDEO_SINK_H__}
{$include <gst/gst.h>}
{$include <gst/base/gstbasesink.h>}
{$include <gst/video/video.h>}

{ was #define dname def_expr }
function GST_TYPE_VIDEO_SINK : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_SINK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_SINK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_SINK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_SINK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_SINK_GET_CLASS(klass : longint) : longint;

{*
 * GST_VIDEO_SINK_CAST:
 * @obj: a #GstVideoSink or derived object
 *
 * Cast @obj to a #GstVideoSink without runtime type check.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VIDEO_SINK_CAST(obj : longint) : PGstVideoSink;

{*
 * GST_VIDEO_SINK_PAD:
 * @obj: a #GstVideoSink
 *
 * Get the sink #GstPad of @obj.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_SINK_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_SINK_WIDTH(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_SINK_HEIGHT(obj : longint) : longint;

type
{*
 * GstVideoSink:
 * @height: video height (derived class needs to set this)
 * @width: video width (derived class needs to set this)
 *
 * The video sink instance structure. Derived video sinks should set the
 * @height and @width members.
  }
{ FIXME 0.11: this should not be called 'element'  }
{< public > }
{< private > }
  PGstVideoSink = ^TGstVideoSink;
  TGstVideoSink = record
      element : TGstBaseSink;
      width : Tgint;
      height : Tgint;
      priv : PGstVideoSinkPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVideoSinkClass:
 * @parent_class: the parent class structure
 * @show_frame: render a video frame. Maps to #GstBaseSinkClass.render() and
 *     #GstBaseSinkClass.preroll() vfuncs. Rendering during preroll will be
 *     suppressed if the #GstVideoSink:show-preroll-frame property is set to
 *     %FALSE.
 *
 * The video sink class structure. Derived classes should override the
 * @show_frame virtual function.
  }
{*
   * GstVideoSinkClass::set_info:
   * @caps: A #GstCaps.
   * @info: A #GstVideoInfo corresponding to @caps.
   *
   * Notifies the subclass of changed #GstVideoInfo.
   *
   * Since: 1.20
    }
{< private > }
  PGstVideoSinkClass = ^TGstVideoSinkClass;
  TGstVideoSinkClass = record
      parent_class : TGstBaseSinkClass;
      show_frame : function (video_sink:PGstVideoSink; buf:PGstBuffer):TGstFlowReturn;cdecl;
      set_info : function (video_sink:PGstVideoSink; caps:PGstCaps; info:PGstVideoInfo):Tgboolean;cdecl;
      _gst_reserved : array[0..(GST_PADDING-1)-1] of Tgpointer;
    end;


function gst_video_sink_get_type:TGType;cdecl;external libgstvideo;
{xxxxxxGST_VIDEO_DEPRECATED_FOR(gst_video_center_rect) }
procedure gst_video_sink_center_rect(src:TGstVideoRectangle; dst:TGstVideoRectangle; result:PGstVideoRectangle; scaling:Tgboolean);cdecl;external libgstvideo;
procedure gst_video_center_rect(src:PGstVideoRectangle; dst:PGstVideoRectangle; result:PGstVideoRectangle; scaling:Tgboolean);cdecl;external libgstvideo;
{////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC       (GstVideoSink, gst_object_unref) }
{$endif}
{ __GST_VIDEO_SINK_H__  }

// === Konventiert am: 15-7-26 13:30:38 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_VIDEO_SINK : longint; { return type might be wrong }
  begin
    GST_TYPE_VIDEO_SINK:=gst_video_sink_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_SINK(obj : longint) : longint;
begin
  GST_VIDEO_SINK:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VIDEO_SINK,GstVideoSink);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_SINK_CLASS(klass : longint) : longint;
begin
  GST_VIDEO_SINK_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_VIDEO_SINK,GstVideoSinkClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_SINK(obj : longint) : longint;
begin
  GST_IS_VIDEO_SINK:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VIDEO_SINK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_SINK_CLASS(klass : longint) : longint;
begin
  GST_IS_VIDEO_SINK_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_VIDEO_SINK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_SINK_GET_CLASS(klass : longint) : longint;
begin
  GST_VIDEO_SINK_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(klass,GST_TYPE_VIDEO_SINK,GstVideoSinkClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VIDEO_SINK_CAST(obj : longint) : PGstVideoSink;
begin
  GST_VIDEO_SINK_CAST:=PGstVideoSink(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_SINK_PAD(obj : longint) : longint;
begin
  GST_VIDEO_SINK_PAD:=GST_BASE_SINK_PAD(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_SINK_WIDTH(obj : longint) : longint;
begin
  GST_VIDEO_SINK_WIDTH:=(GST_VIDEO_SINK_CAST(obj))^.width;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_SINK_HEIGHT(obj : longint) : longint;
begin
  GST_VIDEO_SINK_HEIGHT:=(GST_VIDEO_SINK_CAST(obj))^.height;
end;


end.
