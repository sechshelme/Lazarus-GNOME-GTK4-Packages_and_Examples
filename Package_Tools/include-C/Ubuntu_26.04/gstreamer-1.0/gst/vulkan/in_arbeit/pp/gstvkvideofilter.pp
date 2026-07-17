
unit gstvkvideofilter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvkvideofilter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkvideofilter.h
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
PGstCaps  = ^GstCaps;
PGstVulkanDevice  = ^GstVulkanDevice;
PGstVulkanInstance  = ^GstVulkanInstance;
PGstVulkanQueue  = ^GstVulkanQueue;
PGstVulkanVideoFilter  = ^GstVulkanVideoFilter;
PGstVulkanVideoFilterClass  = ^GstVulkanVideoFilterClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2019 Matthew Waters <matthew@centricular.com>
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
{$ifndef _VK_FULL_SCREEN_RENDER_H_}
{$define _VK_FULL_SCREEN_RENDER_H_}
{$include <gst/gst.h>}
{$include <gst/video/video.h>}
{$include <gst/vulkan/gstvkqueue.h>}

function gst_vulkan_video_filter_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_VULKAN_VIDEO_FILTER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_VIDEO_FILTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_VIDEO_FILTER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_VIDEO_FILTER_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_VIDEO_FILTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_VIDEO_FILTER_CLASS(klass : longint) : longint;

type
{*
 * GstVulkanVideoFilter:
 * @parent: the parent #GstBaseTransform
 * @instance: the configured #GstVulkanInstance
 * @device: the configured #GstVulkanDevice
 * @queue: the configured #GstVulkanQueue
 * @in_caps: the configured input #GstCaps
 * @in_info: the configured input #GstVideoInfo
 * @out_caps: the configured output #GstCaps
 * @out_info: the configured output #GstVideoInfo
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanVideoFilter = ^TGstVulkanVideoFilter;
  TGstVulkanVideoFilter = record
      parent : TGstBaseTransform;
      instance : PGstVulkanInstance;
      device : PGstVulkanDevice;
      queue : PGstVulkanQueue;
      in_caps : PGstCaps;
      in_info : TGstVideoInfo;
      out_caps : PGstCaps;
      out_info : TGstVideoInfo;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanVideoFilterClass:
 * @parent_class: the parent #GstBaseTransformClass
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanVideoFilterClass = ^TGstVulkanVideoFilterClass;
  TGstVulkanVideoFilterClass = record
      parent_class : TGstBaseTransformClass;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC         (GstVulkanVideoFilter, gst_object_unref); }

function gst_vulkan_video_filter_get_instance(filter:PGstVulkanVideoFilter):PGstVulkanInstance;cdecl;external;
function gst_vulkan_video_filter_get_device(filter:PGstVulkanVideoFilter):PGstVulkanDevice;cdecl;external;
function gst_vulkan_video_filter_get_queue(filter:PGstVulkanVideoFilter):PGstVulkanQueue;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function GST_TYPE_VULKAN_VIDEO_FILTER : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_VIDEO_FILTER:=gst_vulkan_video_filter_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_VIDEO_FILTER(obj : longint) : longint;
begin
  GST_VULKAN_VIDEO_FILTER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VULKAN_VIDEO_FILTER,GstVulkanVideoFilter);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_VIDEO_FILTER_CLASS(klass : longint) : longint;
begin
  GST_VULKAN_VIDEO_FILTER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_VULKAN_VIDEO_FILTER,GstVulkanVideoFilterClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_VIDEO_FILTER_GET_CLASS(obj : longint) : longint;
begin
  GST_VULKAN_VIDEO_FILTER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_VULKAN_VIDEO_FILTER,GstVulkanVideoFilterClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_VIDEO_FILTER(obj : longint) : longint;
begin
  GST_IS_VULKAN_VIDEO_FILTER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VULKAN_VIDEO_FILTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_VIDEO_FILTER_CLASS(klass : longint) : longint;
begin
  GST_IS_VULKAN_VIDEO_FILTER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_VULKAN_VIDEO_FILTER);
end;


end.
