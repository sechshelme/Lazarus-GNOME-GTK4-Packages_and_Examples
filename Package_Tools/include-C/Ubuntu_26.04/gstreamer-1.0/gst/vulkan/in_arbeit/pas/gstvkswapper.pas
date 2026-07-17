unit gstvkswapper;

interface

uses
  fp_glib2, fp_gst;

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

function gst_vulkan_swapper_get_type:TGType;cdecl;external libgstvulkan;
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

function gst_vulkan_swapper_new(device:PGstVulkanDevice; window:PGstVulkanWindow):PGstVulkanSwapper;cdecl;external libgstvulkan;
function gst_vulkan_swapper_choose_queue(swapper:PGstVulkanSwapper; available_queue:PGstVulkanQueue; error:PPGError):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_swapper_get_supported_caps(swapper:PGstVulkanSwapper; error:PPGError):PGstCaps;cdecl;external libgstvulkan;
function gst_vulkan_swapper_set_caps(swapper:PGstVulkanSwapper; caps:PGstCaps; error:PPGError):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_swapper_render_buffer(swapper:PGstVulkanSwapper; buffer:PGstBuffer; error:PPGError):Tgboolean;cdecl;external libgstvulkan;
procedure gst_vulkan_swapper_get_surface_rectangles(swapper:PGstVulkanSwapper; input_image:PGstVideoRectangle; surface_location:PGstVideoRectangle; display_rect:PGstVideoRectangle);cdecl;external libgstvulkan;
{$endif}
{ __GST_VULKAN_SWAPPER_H__  }

// === Konventiert am: 17-7-26 15:46:35 ===

function GST_TYPE_VULKAN_SWAPPER : TGType;
function GST_VULKAN_SWAPPER(obj : Pointer) : PGstVulkanSwapper;
function GST_VULKAN_SWAPPER_CLASS(klass : Pointer) : PGstVulkanSwapperClass;
function GST_IS_VULKAN_SWAPPER(obj : Pointer) : Tgboolean;
function GST_IS_VULKAN_SWAPPER_CLASS(klass : Pointer) : Tgboolean;
function GST_VULKAN_SWAPPER_GET_CLASS(obj : Pointer) : PGstVulkanSwapperClass;

implementation

function GST_TYPE_VULKAN_SWAPPER : TGType;
  begin
    GST_TYPE_VULKAN_SWAPPER:=gst_vulkan_swapper_get_type;
  end;

function GST_VULKAN_SWAPPER(obj : Pointer) : PGstVulkanSwapper;
begin
  Result := PGstVulkanSwapper(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_SWAPPER));
end;

function GST_VULKAN_SWAPPER_CLASS(klass : Pointer) : PGstVulkanSwapperClass;
begin
  Result := PGstVulkanSwapperClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_SWAPPER));
end;

function GST_IS_VULKAN_SWAPPER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_VULKAN_SWAPPER);
end;

function GST_IS_VULKAN_SWAPPER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_VULKAN_SWAPPER);
end;

function GST_VULKAN_SWAPPER_GET_CLASS(obj : Pointer) : PGstVulkanSwapperClass;
begin
  Result := PGstVulkanSwapperClass(PGTypeInstance(obj)^.g_class);
end;



end.
