unit gstvkcommandpool;

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
{$ifndef __GST_VULKAN_COMMAND_POOL_H__}
{$define __GST_VULKAN_COMMAND_POOL_H__}
{$include <gst/vulkan/gstvkqueue.h>}

function gst_vulkan_command_pool_get_type:TGType;cdecl;external libgstvulkan;
{*
 * GstVulkanCommandPool:
 * @parent: the parent #GstObject
 * @queue: the #GstVulkanQueue to command buffers will be allocated from
 * @pool: the vulkan command pool handle
 *
 * Since: 1.18
  }
{ hides a pointer  }
{ <private>  }
type
  PGstVulkanCommandPool = ^TGstVulkanCommandPool;
  TGstVulkanCommandPool = record
      parent : TGstObject;
      queue : PGstVulkanQueue;
      pool : TVkCommandPool;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanCommandPoolClass:
 * @parent_class: the parent #GstObjectClass
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanCommandPoolClass = ^TGstVulkanCommandPoolClass;
  TGstVulkanCommandPoolClass = record
      parent_class : TGstObjectClass;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC          (GstVulkanCommandPool, gst_object_unref) }

function gst_vulkan_command_pool_get_queue(pool:PGstVulkanCommandPool):PGstVulkanQueue;cdecl;external libgstvulkan;
function gst_vulkan_command_pool_create(pool:PGstVulkanCommandPool; error:PPGError):PGstVulkanCommandBuffer;cdecl;external libgstvulkan;
procedure gst_vulkan_command_pool_lock(pool:PGstVulkanCommandPool);cdecl;external libgstvulkan;
procedure gst_vulkan_command_pool_unlock(pool:PGstVulkanCommandPool);cdecl;external libgstvulkan;
{$endif}
{ __GST_VULKAN_COMMAND_POOL_H__  }

// === Konventiert am: 17-7-26 15:37:15 ===

function GST_TYPE_VULKAN_COMMAND_POOL : TGType;
function GST_VULKAN_COMMAND_POOL(obj : Pointer) : PGstVulkanCommandPool;
function GST_VULKAN_COMMAND_POOL_CLASS(klass : Pointer) : PGstVulkanCommandPoolClass;
function GST_IS_VULKAN_COMMAND_POOL(obj : Pointer) : Tgboolean;
function GST_IS_VULKAN_COMMAND_POOL_CLASS(klass : Pointer) : Tgboolean;
function GST_VULKAN_COMMAND_POOL_GET_CLASS(obj : Pointer) : PGstVulkanCommandPoolClass;

implementation

function GST_TYPE_VULKAN_COMMAND_POOL : TGType;
  begin
    GST_TYPE_VULKAN_COMMAND_POOL:=gst_vulkan_command_pool_get_type;
  end;

function GST_VULKAN_COMMAND_POOL(obj : Pointer) : PGstVulkanCommandPool;
begin
  Result := PGstVulkanCommandPool(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_COMMAND_POOL));
end;

function GST_VULKAN_COMMAND_POOL_CLASS(klass : Pointer) : PGstVulkanCommandPoolClass;
begin
  Result := PGstVulkanCommandPoolClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_COMMAND_POOL));
end;

function GST_IS_VULKAN_COMMAND_POOL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_VULKAN_COMMAND_POOL);
end;

function GST_IS_VULKAN_COMMAND_POOL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_VULKAN_COMMAND_POOL);
end;

function GST_VULKAN_COMMAND_POOL_GET_CLASS(obj : Pointer) : PGstVulkanCommandPoolClass;
begin
  Result := PGstVulkanCommandPoolClass(PGTypeInstance(obj)^.g_class);
end;



end.
