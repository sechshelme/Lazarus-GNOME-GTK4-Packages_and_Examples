unit gstvideofilter;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <1999> Erik Walthinsen <omega@cse.ogi.edu>
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
{$ifndef __GST_VIDEO_FILTER_H__}
{$define __GST_VIDEO_FILTER_H__}
{$include <gst/base/gstbasetransform.h>}
{$include <gst/video/video.h>}
type

{ was #define dname def_expr }
function GST_TYPE_VIDEO_FILTER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FILTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FILTER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FILTER_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_FILTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_FILTER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VIDEO_FILTER_CAST(obj : longint) : PGstVideoFilter;

{< private > }
type
  PGstVideoFilter = ^TGstVideoFilter;
  TGstVideoFilter = record
      element : TGstBaseTransform;
      negotiated : Tgboolean;
      in_info : TGstVideoInfo;
      out_info : TGstVideoInfo;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVideoFilterClass:
 * @parent_class: the parent class structure
 * @set_info: function to be called with the negotiated caps and video infos
 * @transform_frame: transform a video frame
 * @transform_frame_ip: transform a video frame in place
 *
 * The video filter class structure.
  }
{ transform  }
{< private > }
  PGstVideoFilterClass = ^TGstVideoFilterClass;
  TGstVideoFilterClass = record
      parent_class : TGstBaseTransformClass;
      set_info : function (filter:PGstVideoFilter; incaps:PGstCaps; in_info:PGstVideoInfo; outcaps:PGstCaps; out_info:PGstVideoInfo):Tgboolean;cdecl;
      transform_frame : function (filter:PGstVideoFilter; inframe:PGstVideoFrame; outframe:PGstVideoFrame):TGstFlowReturn;cdecl;
      transform_frame_ip : function (trans:PGstVideoFilter; frame:PGstVideoFrame):TGstFlowReturn;cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_video_filter_get_type:TGType;cdecl;external libgstvideo;
{////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC       (GstVideoFilter, gst_object_unref) }
{$endif}
{ __GST_VIDEO_FILTER_H__  }

// === Konventiert am: 15-7-26 13:21:09 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_VIDEO_FILTER : longint; { return type might be wrong }
  begin
    GST_TYPE_VIDEO_FILTER:=gst_video_filter_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FILTER(obj : longint) : longint;
begin
  GST_VIDEO_FILTER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VIDEO_FILTER,GstVideoFilter);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FILTER_CLASS(klass : longint) : longint;
begin
  GST_VIDEO_FILTER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_VIDEO_FILTER,GstVideoFilterClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_FILTER_GET_CLASS(obj : longint) : longint;
begin
  GST_VIDEO_FILTER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_VIDEO_FILTER,GstVideoFilterClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_FILTER(obj : longint) : longint;
begin
  GST_IS_VIDEO_FILTER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VIDEO_FILTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_FILTER_CLASS(klass : longint) : longint;
begin
  GST_IS_VIDEO_FILTER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_VIDEO_FILTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VIDEO_FILTER_CAST(obj : longint) : PGstVideoFilter;
begin
  GST_VIDEO_FILTER_CAST:=PGstVideoFilter(obj);
end;


end.
