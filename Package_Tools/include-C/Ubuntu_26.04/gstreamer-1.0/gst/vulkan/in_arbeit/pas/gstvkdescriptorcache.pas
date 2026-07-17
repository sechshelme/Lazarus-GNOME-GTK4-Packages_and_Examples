unit gstvkdescriptorcache;

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
{$ifndef __GST_VULKAN_DESCRIPTOR_CACHE_H__}
{$define __GST_VULKAN_DESCRIPTOR_CACHE_H__}
{$include <gst/vulkan/gstvkqueue.h>}
{$include <gst/vulkan/gstvkhandlepool.h>}

function gst_vulkan_descriptor_cache_get_type:TGType;cdecl;external libgstvulkan;
{*
 * GstVulkanDescriptorCache:
 * @parent: the parent #GstVulkanHandlePool
 * @pool: the #GstVulkanDescriptorPool to cache descriptor sets for
 *
 * Since: 1.18
  }
{ <private>  }
type
  PGstVulkanDescriptorCache = ^TGstVulkanDescriptorCache;
  TGstVulkanDescriptorCache = record
      parent : TGstVulkanHandlePool;
      pool : PGstVulkanDescriptorPool;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanDescriptorCacheClass:
 * @parent_class: the parent #GstObjectClass
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanDescriptorCacheClass = ^TGstVulkanDescriptorCacheClass;
  TGstVulkanDescriptorCacheClass = record
      parent_class : TGstVulkanHandlePoolClass;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC          (GstVulkanDescriptorCache, gst_object_unref) }

function gst_vulkan_descriptor_cache_new(pool:PGstVulkanDescriptorPool; n_layouts:Tguint; layouts:PPGstVulkanHandle):PGstVulkanDescriptorCache;cdecl;external libgstvulkan;
function gst_vulkan_descriptor_cache_acquire(cache:PGstVulkanDescriptorCache; error:PPGError):PGstVulkanDescriptorSet;cdecl;external libgstvulkan;
{$endif}
{ __GST_VULKAN_DESCRIPTOR_CACHE_H__  }

// === Konventiert am: 17-7-26 15:36:52 ===

function GST_TYPE_VULKAN_DESCRIPTOR_CACHE : TGType;
function GST_VULKAN_DESCRIPTOR_CACHE(obj : Pointer) : PGstVulkanDescriptorCache;
function GST_VULKAN_DESCRIPTOR_CACHE_CLASS(klass : Pointer) : PGstVulkanDescriptorCacheClass;
function GST_IS_VULKAN_DESCRIPTOR_CACHE(obj : Pointer) : Tgboolean;
function GST_IS_VULKAN_DESCRIPTOR_CACHE_CLASS(klass : Pointer) : Tgboolean;
function GST_VULKAN_DESCRIPTOR_CACHE_GET_CLASS(obj : Pointer) : PGstVulkanDescriptorCacheClass;

implementation

function GST_TYPE_VULKAN_DESCRIPTOR_CACHE : TGType;
  begin
    GST_TYPE_VULKAN_DESCRIPTOR_CACHE:=gst_vulkan_descriptor_cache_get_type;
  end;

function GST_VULKAN_DESCRIPTOR_CACHE(obj : Pointer) : PGstVulkanDescriptorCache;
begin
  Result := PGstVulkanDescriptorCache(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_DESCRIPTOR_CACHE));
end;

function GST_VULKAN_DESCRIPTOR_CACHE_CLASS(klass : Pointer) : PGstVulkanDescriptorCacheClass;
begin
  Result := PGstVulkanDescriptorCacheClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_DESCRIPTOR_CACHE));
end;

function GST_IS_VULKAN_DESCRIPTOR_CACHE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_VULKAN_DESCRIPTOR_CACHE);
end;

function GST_IS_VULKAN_DESCRIPTOR_CACHE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_VULKAN_DESCRIPTOR_CACHE);
end;

function GST_VULKAN_DESCRIPTOR_CACHE_GET_CLASS(obj : Pointer) : PGstVulkanDescriptorCacheClass;
begin
  Result := PGstVulkanDescriptorCacheClass(PGTypeInstance(obj)^.g_class);
end;



end.
