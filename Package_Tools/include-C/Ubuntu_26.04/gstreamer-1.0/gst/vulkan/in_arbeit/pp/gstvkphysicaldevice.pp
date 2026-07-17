
unit gstvkphysicaldevice;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvkphysicaldevice.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkphysicaldevice.h
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
Pgchar  = ^gchar;
PGstVulkanInstance  = ^GstVulkanInstance;
PGstVulkanPhysicalDevice  = ^GstVulkanPhysicalDevice;
PGstVulkanPhysicalDeviceClass  = ^GstVulkanPhysicalDeviceClass;
PGstVulkanQueueFamilyOps  = ^GstVulkanQueueFamilyOps;
Pguint  = ^guint;
Pguint32  = ^guint32;
PVkQueueFamilyProperties  = ^VkQueueFamilyProperties;
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

{ was #define dname def_expr }
function GST_TYPE_VULKAN_PHYSICAL_DEVICE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_PHYSICAL_DEVICE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_PHYSICAL_DEVICE_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_PHYSICAL_DEVICE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_PHYSICAL_DEVICE_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_PHYSICAL_DEVICE_GET_CLASS(o : longint) : longint;

function gst_vulkan_physical_device_get_type:TGType;cdecl;external;
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

function gst_vulkan_physical_device_new(instance:PGstVulkanInstance; device_index:Tguint):PGstVulkanPhysicalDevice;cdecl;external;
function gst_vulkan_physical_device_get_instance(device:PGstVulkanPhysicalDevice):PGstVulkanInstance;cdecl;external;
function gst_vulkan_physical_device_get_handle(device:PGstVulkanPhysicalDevice):TVkPhysicalDevice;cdecl;external;
(* Const before type ignored *)
function gst_vulkan_physical_device_get_extension_info(device:PGstVulkanPhysicalDevice; name:Pgchar; spec_version:Pguint32):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_vulkan_physical_device_get_layer_info(device:PGstVulkanPhysicalDevice; name:Pgchar; description:PPgchar; spec_version:Pguint32; implementation_version:Pguint32):Tgboolean;cdecl;external;
procedure gst_vulkan_physical_device_get_api_version(device:PGstVulkanPhysicalDevice; major:Pguint; minor:Pguint; patch:Pguint);cdecl;external;
function gst_vulkan_physical_device_check_api_version(device:PGstVulkanPhysicalDevice; major:Tguint; minor:Tguint; patch:Tguint):Tgboolean;cdecl;external;
{$endif}
{ __GST_VULKAN_PHYSICAL_DEVICE_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VULKAN_PHYSICAL_DEVICE : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_PHYSICAL_DEVICE:=gst_vulkan_physical_device_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_PHYSICAL_DEVICE(o : longint) : longint;
begin
  GST_VULKAN_PHYSICAL_DEVICE:=G_TYPE_CHECK_INSTANCE_CAST(o,GST_TYPE_VULKAN_PHYSICAL_DEVICE,GstVulkanPhysicalDevice);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_PHYSICAL_DEVICE_CLASS(k : longint) : longint;
begin
  GST_VULKAN_PHYSICAL_DEVICE_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,GST_TYPE_VULKAN_PHYSICAL_DEVICE,GstVulkanPhysicalDeviceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_PHYSICAL_DEVICE(o : longint) : longint;
begin
  GST_IS_VULKAN_PHYSICAL_DEVICE:=G_TYPE_CHECK_INSTANCE_TYPE(o,GST_TYPE_VULKAN_PHYSICAL_DEVICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_PHYSICAL_DEVICE_CLASS(k : longint) : longint;
begin
  GST_IS_VULKAN_PHYSICAL_DEVICE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,GST_TYPE_VULKAN_PHYSICAL_DEVICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_PHYSICAL_DEVICE_GET_CLASS(o : longint) : longint;
begin
  GST_VULKAN_PHYSICAL_DEVICE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GST_TYPE_VULKAN_PHYSICAL_DEVICE,GstVulkanPhysicalDeviceClass);
end;


end.
