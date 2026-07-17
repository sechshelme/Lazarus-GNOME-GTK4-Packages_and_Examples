unit gstvkdevice;

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
{$ifndef __GST_VULKAN_DEVICE_H__}
{$define __GST_VULKAN_DEVICE_H__}
{$include <gst/vulkan/gstvkphysicaldevice.h>}
{$include <gst/vulkan/gstvkqueue.h>}

function gst_vulkan_device_get_type:TGType;cdecl;external libgstvulkan;
{*
 * GST_VULKAN_DEVICE_CONTEXT_TYPE_STR:
 *
 * Since: 1.18
  }
const
  GST_VULKAN_DEVICE_CONTEXT_TYPE_STR = 'gst.vulkan.device';  
{*
 * GstVulkanDeviceForEachQueueFunc:
 *
 * Since: 1.18
  }
type

  TGstVulkanDeviceForEachQueueFunc = function (device:PGstVulkanDevice; queue:PGstVulkanQueue; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstVulkanDevice:
 * @parent: the parent #GstObject
 * @instance: the #GstVulkanInstance this device was allocated with
 * @physical_device: the #GstVulkanPhysicalDevice this device was allocated with
 * @device: the vulkan device handle
 *
 * Since: 1.18
  }
{ hides a pointer  }
{ <private>  }
  PGstVulkanDevice = ^TGstVulkanDevice;
  TGstVulkanDevice = record
      parent : TGstObject;cdecl;
      instance : PGstVulkanInstance;
      physical_device : PGstVulkanPhysicalDevice;
      device : TVkDevice;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanDeviceClass:
 * @parent_class: the parent #GstObjectClass
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanDeviceClass = ^TGstVulkanDeviceClass;
  TGstVulkanDeviceClass = record
      parent_class : TGstObjectClass;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC          (GstVulkanDevice, gst_object_unref) }

function gst_vulkan_device_new(physical_device:PGstVulkanPhysicalDevice):PGstVulkanDevice;cdecl;external libgstvulkan;
function gst_vulkan_device_new_with_index(instance:PGstVulkanInstance; device_index:Tguint):PGstVulkanDevice;cdecl;external libgstvulkan;
function gst_vulkan_device_get_instance(device:PGstVulkanDevice):PGstVulkanInstance;cdecl;external libgstvulkan;
function gst_vulkan_device_open(device:PGstVulkanDevice; error:PPGError):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_device_enable_extension(device:PGstVulkanDevice; name:Pgchar):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_device_disable_extension(device:PGstVulkanDevice; name:Pgchar):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_device_is_extension_enabled(device:PGstVulkanDevice; name:Pgchar):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_device_enable_layer(device:PGstVulkanDevice; name:Pgchar):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_device_is_layer_enabled(device:PGstVulkanDevice; name:Pgchar):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_device_get_proc_address(device:PGstVulkanDevice; name:Pgchar):Tgpointer;cdecl;external libgstvulkan;
procedure gst_vulkan_device_foreach_queue(device:PGstVulkanDevice; func:TGstVulkanDeviceForEachQueueFunc; user_data:Tgpointer);cdecl;external libgstvulkan;
function gst_vulkan_device_get_queue(device:PGstVulkanDevice; queue_family:Tguint32; queue_i:Tguint32):PGstVulkanQueue;cdecl;external libgstvulkan;
function gst_vulkan_device_queue_family_indices(device:PGstVulkanDevice):PGArray;cdecl;external libgstvulkan;
function gst_vulkan_device_get_physical_device(device:PGstVulkanDevice):TVkPhysicalDevice;cdecl;external libgstvulkan;
procedure gst_context_set_vulkan_device(context:PGstContext; device:PGstVulkanDevice);cdecl;external libgstvulkan;
function gst_context_get_vulkan_device(context:PGstContext; device:PPGstVulkanDevice):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_device_handle_context_query(element:PGstElement; query:PGstQuery; device:PGstVulkanDevice):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_device_run_context_query(element:PGstElement; device:PPGstVulkanDevice):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_device_create_fence(device:PGstVulkanDevice; error:PPGError):PGstVulkanFence;cdecl;external libgstvulkan;
function gst_vulkan_device_select_queue(device:PGstVulkanDevice; expected_flags:TVkQueueFlagBits):PGstVulkanQueue;cdecl;external libgstvulkan;
{$endif}
{ __GST_VULKAN_DEVICE_H__  }

// === Konventiert am: 17-7-26 15:43:24 ===

function GST_TYPE_VULKAN_DEVICE : TGType;
function GST_VULKAN_DEVICE(obj : Pointer) : PGstVulkanDevice;
function GST_VULKAN_DEVICE_CLASS(klass : Pointer) : PGstVulkanDeviceClass;
function GST_IS_VULKAN_DEVICE(obj : Pointer) : Tgboolean;
function GST_IS_VULKAN_DEVICE_CLASS(klass : Pointer) : Tgboolean;
function GST_VULKAN_DEVICE_GET_CLASS(obj : Pointer) : PGstVulkanDeviceClass;

implementation

function GST_TYPE_VULKAN_DEVICE : TGType;
  begin
    GST_TYPE_VULKAN_DEVICE:=gst_vulkan_device_get_type;
  end;

function GST_VULKAN_DEVICE(obj : Pointer) : PGstVulkanDevice;
begin
  Result := PGstVulkanDevice(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_DEVICE));
end;

function GST_VULKAN_DEVICE_CLASS(klass : Pointer) : PGstVulkanDeviceClass;
begin
  Result := PGstVulkanDeviceClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_DEVICE));
end;

function GST_IS_VULKAN_DEVICE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_VULKAN_DEVICE);
end;

function GST_IS_VULKAN_DEVICE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_VULKAN_DEVICE);
end;

function GST_VULKAN_DEVICE_GET_CLASS(obj : Pointer) : PGstVulkanDeviceClass;
begin
  Result := PGstVulkanDeviceClass(PGTypeInstance(obj)^.g_class);
end;



end.
