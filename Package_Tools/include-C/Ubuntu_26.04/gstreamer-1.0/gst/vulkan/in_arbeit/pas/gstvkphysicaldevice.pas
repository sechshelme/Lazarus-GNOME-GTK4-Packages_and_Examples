unit gstvkphysicaldevice;

interface

uses
  fp_glib2, fp_gst;

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
{$ifndef __GST_VULKAN_PHYSICAL_DEVICE_H__}
{$define __GST_VULKAN_PHYSICAL_DEVICE_H__}
{$include <gst/vulkan/gstvkinstance.h>}
{$include <gst/vulkan/gstvkqueue.h>}

function gst_vulkan_physical_device_get_type:TGType;cdecl;external libgstvulkan;
{*
 * GstVulkanQueueFamilyOps:
 * @video: video operation supported by queue family
 * @query_result_status: if queue family supports result status queries
 *
 * Since: 1.24
  }
{*
   * GstVulkanQueueFamilyOps.query_result_status:
   *
   * query status result support
   *
   * Since: 1.26
    }
type
  PGstVulkanQueueFamilyOps = ^TGstVulkanQueueFamilyOps;
  TGstVulkanQueueFamilyOps = record
      video : Tguint32;
      query_result_status : Tgboolean;
    end;

{*
 * GstVulkanPhysicalDevice:
 * @parent: the parent #GstObject
 * @instance: the parent #GstVulkanInstance for this physical device
 * @device_index: the index into the physical device list in @instance
 * @device: the vulkan physical device handle
 * @properties: retrieved physical device properties
 * @features: retrieved physical device features
 * @memory_properties: retrieved physical device memory properties
 * @queue_family_props: vulkan family properties
 * @n_queue_families: number of elements in @queue_family_props
 *
 * Since: 1.18
  }
{ hides a pointer  }
{*
   * GstVulkanPhysicalDevice.queue_family_ops:
   *
   * vulkan operations allowed per queue family
   *
   * Since: 1.24
    }
{ <private>  }
  PGstVulkanPhysicalDevice = ^TGstVulkanPhysicalDevice;
  TGstVulkanPhysicalDevice = record
      parent : TGstObject;
      instance : PGstVulkanInstance;
      device_index : Tguint;
      device : TVkPhysicalDevice;
      properties : TVkPhysicalDeviceProperties;
      features : TVkPhysicalDeviceFeatures;
      memory_properties : TVkPhysicalDeviceMemoryProperties;
      queue_family_props : PVkQueueFamilyProperties;
      n_queue_families : Tguint32;
      queue_family_ops : PGstVulkanQueueFamilyOps;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanPhysicalDeviceClass:
 * @parent_class: the parent #GstObjectClass
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanPhysicalDeviceClass = ^TGstVulkanPhysicalDeviceClass;
  TGstVulkanPhysicalDeviceClass = record
      parent_class : TGstObjectClass;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC          (GstVulkanPhysicalDevice, gst_object_unref) }

function gst_vulkan_physical_device_new(instance:PGstVulkanInstance; device_index:Tguint):PGstVulkanPhysicalDevice;cdecl;external libgstvulkan;
function gst_vulkan_physical_device_get_instance(device:PGstVulkanPhysicalDevice):PGstVulkanInstance;cdecl;external libgstvulkan;
function gst_vulkan_physical_device_get_handle(device:PGstVulkanPhysicalDevice):TVkPhysicalDevice;cdecl;external libgstvulkan;
function gst_vulkan_physical_device_get_extension_info(device:PGstVulkanPhysicalDevice; name:Pgchar; spec_version:Pguint32):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_physical_device_get_layer_info(device:PGstVulkanPhysicalDevice; name:Pgchar; description:PPgchar; spec_version:Pguint32; implementation_version:Pguint32):Tgboolean;cdecl;external libgstvulkan;
procedure gst_vulkan_physical_device_get_api_version(device:PGstVulkanPhysicalDevice; major:Pguint; minor:Pguint; patch:Pguint);cdecl;external libgstvulkan;
function gst_vulkan_physical_device_check_api_version(device:PGstVulkanPhysicalDevice; major:Tguint; minor:Tguint; patch:Tguint):Tgboolean;cdecl;external libgstvulkan;
{$endif}
{ __GST_VULKAN_PHYSICAL_DEVICE_H__  }

// === Konventiert am: 17-7-26 15:46:44 ===

function GST_TYPE_VULKAN_PHYSICAL_DEVICE : TGType;
function GST_VULKAN_PHYSICAL_DEVICE(obj : Pointer) : PGstVulkanPhysicalDevice;
function GST_VULKAN_PHYSICAL_DEVICE_CLASS(klass : Pointer) : PGstVulkanPhysicalDeviceClass;
function GST_IS_VULKAN_PHYSICAL_DEVICE(obj : Pointer) : Tgboolean;
function GST_IS_VULKAN_PHYSICAL_DEVICE_CLASS(klass : Pointer) : Tgboolean;
function GST_VULKAN_PHYSICAL_DEVICE_GET_CLASS(obj : Pointer) : PGstVulkanPhysicalDeviceClass;

implementation

function GST_TYPE_VULKAN_PHYSICAL_DEVICE : TGType;
  begin
    GST_TYPE_VULKAN_PHYSICAL_DEVICE:=gst_vulkan_physical_device_get_type;
  end;

function GST_VULKAN_PHYSICAL_DEVICE(obj : Pointer) : PGstVulkanPhysicalDevice;
begin
  Result := PGstVulkanPhysicalDevice(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_PHYSICAL_DEVICE));
end;

function GST_VULKAN_PHYSICAL_DEVICE_CLASS(klass : Pointer) : PGstVulkanPhysicalDeviceClass;
begin
  Result := PGstVulkanPhysicalDeviceClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_PHYSICAL_DEVICE));
end;

function GST_IS_VULKAN_PHYSICAL_DEVICE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_VULKAN_PHYSICAL_DEVICE);
end;

function GST_IS_VULKAN_PHYSICAL_DEVICE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_VULKAN_PHYSICAL_DEVICE);
end;

function GST_VULKAN_PHYSICAL_DEVICE_GET_CLASS(obj : Pointer) : PGstVulkanPhysicalDeviceClass;
begin
  Result := PGstVulkanPhysicalDeviceClass(PGTypeInstance(obj)^.g_class);
end;



end.
