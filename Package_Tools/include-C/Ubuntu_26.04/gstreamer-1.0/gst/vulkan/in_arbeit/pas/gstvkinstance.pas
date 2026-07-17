unit gstvkinstance;

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
{$ifndef __GST_VULKAN_INSTANCE_H__}
{$define __GST_VULKAN_INSTANCE_H__}
{$include <gst/vulkan/vulkan.h>}

function gst_vulkan_instance_get_type:TGType;cdecl;external libgstvulkan;
{*
 * GST_VULKAN_INSTANCE_CONTEXT_TYPE_STR:
 *
 * Since: 1.18
  }
const
  GST_VULKAN_INSTANCE_CONTEXT_TYPE_STR = 'gst.vulkan.instance';  
{*
 * GstVulkanInstance:
 * @parent: parent #GstObject
 * @instance: the Vulkan instance handle
 * @physical_devices: list of vulkan physical device handles
 * @n_physical_device: number of entries in @physical_devices
 *
 * Since: 1.18
  }
{ hides a pointer  }
{ hides a pointer  }
{ <private>  }
type
  PGstVulkanInstance = ^TGstVulkanInstance;
  TGstVulkanInstance = record
      parent : TGstObject;
      instance : TVkInstance;
      physical_devices : PVkPhysicalDevice;
      n_physical_devices : Tguint32;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanInstanceClass:
 * @parent_class: parent #GstObjectClass
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanInstanceClass = ^TGstVulkanInstanceClass;
  TGstVulkanInstanceClass = record
      parent_class : TGstObjectClass;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC          (GstVulkanInstance, gst_object_unref) }

function gst_vulkan_instance_new:PGstVulkanInstance;cdecl;external libgstvulkan;
function gst_vulkan_instance_fill_info(instance:PGstVulkanInstance; error:PPGError):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_instance_open(instance:PGstVulkanInstance; error:PPGError):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_instance_get_proc_address(instance:PGstVulkanInstance; name:Pgchar):Tgpointer;cdecl;external libgstvulkan;
function gst_vulkan_instance_create_device(instance:PGstVulkanInstance; error:PPGError):PGstVulkanDevice;cdecl;external libgstvulkan;
function gst_vulkan_instance_create_device_with_index(instance:PGstVulkanInstance; device_index:Tguint; error:PPGError):PGstVulkanDevice;cdecl;external libgstvulkan;
procedure gst_context_set_vulkan_instance(context:PGstContext; instance:PGstVulkanInstance);cdecl;external libgstvulkan;
function gst_context_get_vulkan_instance(context:PGstContext; instance:PPGstVulkanInstance):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_instance_handle_context_query(element:PGstElement; query:PGstQuery; instance:PGstVulkanInstance):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_instance_run_context_query(element:PGstElement; instance:PPGstVulkanInstance):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_instance_check_version(instance:PGstVulkanInstance; major:Tguint; minor:Tguint; patch:Tguint):Tgboolean;cdecl;external libgstvulkan;
procedure gst_vulkan_instance_get_version(instance:PGstVulkanInstance; major:Pguint; minor:Pguint; patch:Pguint);cdecl;external libgstvulkan;
function gst_vulkan_instance_get_extension_info(instance:PGstVulkanInstance; name:Pgchar; spec_version:Pguint32):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_instance_enable_extension(instance:PGstVulkanInstance; name:Pgchar):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_instance_disable_extension(instance:PGstVulkanInstance; name:Pgchar):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_instance_is_extension_enabled(instance:PGstVulkanInstance; name:Pgchar):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_instance_get_layer_info(instance:PGstVulkanInstance; name:Pgchar; description:PPgchar; spec_version:Pguint32; implementation_version:Pguint32):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_instance_enable_layer(instance:PGstVulkanInstance; name:Pgchar):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_instance_is_layer_enabled(instance:PGstVulkanInstance; name:Pgchar):Tgboolean;cdecl;external libgstvulkan;
procedure gst_vulkan_instance_get_api_version(instance:PGstVulkanInstance; major:Pguint; minor:Pguint; patch:Pguint);cdecl;external libgstvulkan;
function gst_vulkan_instance_check_api_version(instance:PGstVulkanInstance; major:Tguint; minor:Tguint; patch:Tguint):Tgboolean;cdecl;external libgstvulkan;
{$endif}
{ __GST_VULKAN_INSTANCE_H__  }

// === Konventiert am: 17-7-26 15:47:05 ===

function GST_TYPE_VULKAN_INSTANCE : TGType;
function GST_VULKAN_INSTANCE(obj : Pointer) : PGstVulkanInstance;
function GST_VULKAN_INSTANCE_CLASS(klass : Pointer) : PGstVulkanInstanceClass;
function GST_IS_VULKAN_INSTANCE(obj : Pointer) : Tgboolean;
function GST_IS_VULKAN_INSTANCE_CLASS(klass : Pointer) : Tgboolean;
function GST_VULKAN_INSTANCE_GET_CLASS(obj : Pointer) : PGstVulkanInstanceClass;

implementation

function GST_TYPE_VULKAN_INSTANCE : TGType;
  begin
    GST_TYPE_VULKAN_INSTANCE:=gst_vulkan_instance_get_type;
  end;

function GST_VULKAN_INSTANCE(obj : Pointer) : PGstVulkanInstance;
begin
  Result := PGstVulkanInstance(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_INSTANCE));
end;

function GST_VULKAN_INSTANCE_CLASS(klass : Pointer) : PGstVulkanInstanceClass;
begin
  Result := PGstVulkanInstanceClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_INSTANCE));
end;

function GST_IS_VULKAN_INSTANCE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_VULKAN_INSTANCE);
end;

function GST_IS_VULKAN_INSTANCE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_VULKAN_INSTANCE);
end;

function GST_VULKAN_INSTANCE_GET_CLASS(obj : Pointer) : PGstVulkanInstanceClass;
begin
  Result := PGstVulkanInstanceClass(PGTypeInstance(obj)^.g_class);
end;



end.
