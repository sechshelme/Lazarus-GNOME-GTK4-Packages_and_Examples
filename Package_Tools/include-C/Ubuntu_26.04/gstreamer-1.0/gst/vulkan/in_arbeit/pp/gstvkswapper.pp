
unit gstvkswapper;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvkswapper.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkswapper.h
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
PGError  = ^GError;
PGstBuffer  = ^GstBuffer;
PGstCaps  = ^GstCaps;
PGstVideoRectangle  = ^GstVideoRectangle;
PGstVulkanCommandPool  = ^GstVulkanCommandPool;
PGstVulkanDevice  = ^GstVulkanDevice;
PGstVulkanQueue  = ^GstVulkanQueue;
PGstVulkanSwapper  = ^GstVulkanSwapper;
PGstVulkanSwapperClass  = ^GstVulkanSwapperClass;
PGstVulkanWindow  = ^GstVulkanWindow;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2015 Matthew Waters <matthew@centricular.com>
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
{$ifndef __GST_VULKAN_SWAPPER_H__}
{$define __GST_VULKAN_SWAPPER_H__}
{$include <gst/video/video.h>}
{$include <gst/vulkan/vulkan.h>}

{ was #define dname def_expr }
function GST_TYPE_VULKAN_SWAPPER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_SWAPPER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_SWAPPER_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_SWAPPER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_SWAPPER_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_SWAPPER_GET_CLASS(o : longint) : longint;

function gst_vulkan_swapper_get_type:TGType;cdecl;external;
{*
 * GST_VULKAN_SWAPPER_VIDEO_FORMATS:
 *
 * Since: 1.18
  }
const
  GST_VULKAN_SWAPPER_VIDEO_FORMATS = ' { RGBA, BGRA, RGB, BGR } ';  
type
{*
 * GstVulkanSwapper:
 * @parent: parent #GstObject
 * @device: the #GstVulkanDevice
 * @window: the #GstVulkanWindow to display into
 * @queue: the #GstVulkanQueue to display with
 * @cmd_pool: the #GstVulkanCommandPool to allocate command buffers from
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanSwapper = ^TGstVulkanSwapper;
  TGstVulkanSwapper = record
      parent : TGstObject;
      device : PGstVulkanDevice;
      window : PGstVulkanWindow;
      queue : PGstVulkanQueue;
      cmd_pool : PGstVulkanCommandPool;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanSwapperClass:
 * @parent_class: parent #GstObjectClass
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanSwapperClass = ^TGstVulkanSwapperClass;
  TGstVulkanSwapperClass = record
      parent_class : TGstObjectClass;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC          (GstVulkanSwapper, gst_object_unref) }

function gst_vulkan_swapper_new(device:PGstVulkanDevice; window:PGstVulkanWindow):PGstVulkanSwapper;cdecl;external;
function gst_vulkan_swapper_choose_queue(swapper:PGstVulkanSwapper; available_queue:PGstVulkanQueue; error:PPGError):Tgboolean;cdecl;external;
function gst_vulkan_swapper_get_supported_caps(swapper:PGstVulkanSwapper; error:PPGError):PGstCaps;cdecl;external;
function gst_vulkan_swapper_set_caps(swapper:PGstVulkanSwapper; caps:PGstCaps; error:PPGError):Tgboolean;cdecl;external;
function gst_vulkan_swapper_render_buffer(swapper:PGstVulkanSwapper; buffer:PGstBuffer; error:PPGError):Tgboolean;cdecl;external;
procedure gst_vulkan_swapper_get_surface_rectangles(swapper:PGstVulkanSwapper; input_image:PGstVideoRectangle; surface_location:PGstVideoRectangle; display_rect:PGstVideoRectangle);cdecl;external;
{$endif}
{ __GST_VULKAN_SWAPPER_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VULKAN_SWAPPER : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_SWAPPER:=gst_vulkan_swapper_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_SWAPPER(o : longint) : longint;
begin
  GST_VULKAN_SWAPPER:=G_TYPE_CHECK_INSTANCE_CAST(o,GST_TYPE_VULKAN_SWAPPER,GstVulkanSwapper);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_SWAPPER_CLASS(k : longint) : longint;
begin
  GST_VULKAN_SWAPPER_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,GST_TYPE_VULKAN_SWAPPER,GstVulkanSwapperClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_SWAPPER(o : longint) : longint;
begin
  GST_IS_VULKAN_SWAPPER:=G_TYPE_CHECK_INSTANCE_TYPE(o,GST_TYPE_VULKAN_SWAPPER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_SWAPPER_CLASS(k : longint) : longint;
begin
  GST_IS_VULKAN_SWAPPER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,GST_TYPE_VULKAN_SWAPPER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_SWAPPER_GET_CLASS(o : longint) : longint;
begin
  GST_VULKAN_SWAPPER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GST_TYPE_VULKAN_SWAPPER,GstVulkanSwapperClass);
end;


end.
