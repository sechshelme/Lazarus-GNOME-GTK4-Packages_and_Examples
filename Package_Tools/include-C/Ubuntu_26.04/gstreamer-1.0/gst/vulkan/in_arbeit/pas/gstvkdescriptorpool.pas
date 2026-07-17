unit gstvkdescriptorpool;

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
{$ifndef __GST_VULKAN_DESCRIPTOR_POOL_H__}
{$define __GST_VULKAN_DESCRIPTOR_POOL_H__}
{$include <gst/vulkan/gstvkqueue.h>}

function gst_vulkan_descriptor_pool_get_type:TGType;cdecl;external libgstvulkan;
{*
 * GstVulkanDescriptorPool:
 * @parent: the parent #GstObject
 * @device: the #GstVulkanDevice for descriptor sets
 * @pool: the vulksn descriptor pool handle
 *
 * Since: 1.18
  }
{ hides a pointer  }
{ <private>  }
type
  PGstVulkanDescriptorPool = ^TGstVulkanDescriptorPool;
  TGstVulkanDescriptorPool = record
      parent : TGstObject;
      device : PGstVulkanDevice;
      pool : TVkDescriptorPool;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanDescriptorPoolClass:
 * @parent_class: the parent #GstObjectClass
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanDescriptorPoolClass = ^TGstVulkanDescriptorPoolClass;
  TGstVulkanDescriptorPoolClass = record
      parent_class : TGstObjectClass;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC         (GstVulkanDescriptorPool, gst_object_unref); }

function gst_vulkan_descriptor_pool_new_wrapped(device:PGstVulkanDevice; pool:TVkDescriptorPool; max_sets:Tgsize):PGstVulkanDescriptorPool;cdecl;external libgstvulkan;
function gst_vulkan_descriptor_pool_get_device(pool:PGstVulkanDescriptorPool):PGstVulkanDevice;cdecl;external libgstvulkan;
function gst_vulkan_descriptor_pool_create(pool:PGstVulkanDescriptorPool; n_layouts:Tguint; layouts:PPGstVulkanHandle; error:PPGError):PGstVulkanDescriptorSet;cdecl;external libgstvulkan;
function gst_vulkan_descriptor_pool_get_max_sets(pool:PGstVulkanDescriptorPool):Tgsize;cdecl;external libgstvulkan;
{$endif}
{ __GST_VULKAN_DESCRIPTOR_POOL_H__  }

// === Konventiert am: 17-7-26 15:36:47 ===

function GST_TYPE_VULKAN_DESCRIPTOR_POOL : TGType;
function GST_VULKAN_DESCRIPTOR_POOL(obj : Pointer) : PGstVulkanDescriptorPool;
function GST_VULKAN_DESCRIPTOR_POOL_CLASS(klass : Pointer) : PGstVulkanDescriptorPoolClass;
function GST_IS_VULKAN_DESCRIPTOR_POOL(obj : Pointer) : Tgboolean;
function GST_IS_VULKAN_DESCRIPTOR_POOL_CLASS(klass : Pointer) : Tgboolean;
function GST_VULKAN_DESCRIPTOR_POOL_GET_CLASS(obj : Pointer) : PGstVulkanDescriptorPoolClass;

implementation

function GST_TYPE_VULKAN_DESCRIPTOR_POOL : TGType;
  begin
    GST_TYPE_VULKAN_DESCRIPTOR_POOL:=gst_vulkan_descriptor_pool_get_type;
  end;

function GST_VULKAN_DESCRIPTOR_POOL(obj : Pointer) : PGstVulkanDescriptorPool;
begin
  Result := PGstVulkanDescriptorPool(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_DESCRIPTOR_POOL));
end;

function GST_VULKAN_DESCRIPTOR_POOL_CLASS(klass : Pointer) : PGstVulkanDescriptorPoolClass;
begin
  Result := PGstVulkanDescriptorPoolClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_DESCRIPTOR_POOL));
end;

function GST_IS_VULKAN_DESCRIPTOR_POOL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_VULKAN_DESCRIPTOR_POOL);
end;

function GST_IS_VULKAN_DESCRIPTOR_POOL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_VULKAN_DESCRIPTOR_POOL);
end;

function GST_VULKAN_DESCRIPTOR_POOL_GET_CLASS(obj : Pointer) : PGstVulkanDescriptorPoolClass;
begin
  Result := PGstVulkanDescriptorPoolClass(PGTypeInstance(obj)^.g_class);
end;



end.
