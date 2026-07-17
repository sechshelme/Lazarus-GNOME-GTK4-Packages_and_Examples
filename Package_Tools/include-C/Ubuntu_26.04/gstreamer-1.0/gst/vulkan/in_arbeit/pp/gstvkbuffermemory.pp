
unit gstvkbuffermemory;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvkbuffermemory.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkbuffermemory.h
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
PGstMemory  = ^GstMemory;
PGstVulkanBarrierBufferInfo  = ^GstVulkanBarrierBufferInfo;
PGstVulkanBufferMemory  = ^GstVulkanBufferMemory;
PGstVulkanBufferMemoryAllocator  = ^GstVulkanBufferMemoryAllocator;
PGstVulkanBufferMemoryAllocatorClass  = ^GstVulkanBufferMemoryAllocatorClass;
PGstVulkanDevice  = ^GstVulkanDevice;
PGstVulkanMemory  = ^GstVulkanMemory;
PVkBufferCreateInfo  = ^VkBufferCreateInfo;
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
{$ifndef __GST_VULKAN_BUFFER_MEMORY_H__}
{$define __GST_VULKAN_BUFFER_MEMORY_H__}
{$include <gst/gst.h>}
{$include <gst/gstallocator.h>}
{$include <gst/gstmemory.h>}
{$include <gst/vulkan/gstvkbarrier.h>}
{$include <gst/vulkan/vulkan.h>}

{ was #define dname def_expr }
function GST_TYPE_VULKAN_BUFFER_MEMORY_ALLOCATOR : longint; { return type might be wrong }

function gst_vulkan_buffer_memory_allocator_get_type:TGType;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_BUFFER_MEMORY_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_BUFFER_MEMORY_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_BUFFER_MEMORY_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_CLASS(klass : longint) : longint;

{*
 * GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_CAST:
 *
 * Since: 1.18
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_CAST(obj : longint) : PGstVulkanBufferMemoryAllocator;

{*
 * GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_NAME:
 *
 * Since: 1.18
  }
const
  GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_NAME = 'VulkanBuffer';  
{*
 * GST_CAPS_FEATURE_MEMORY_VULKAN_BUFFER:
 *
 * Since: 1.18
  }
  GST_CAPS_FEATURE_MEMORY_VULKAN_BUFFER = 'memory:VulkanBuffer';  
{*
 * GstVulkanBarrierBufferInfo:
 * @parent: parent #GstVulkanBarrierMemoryInfo
 * @offset: offset into the vulkan buffer to execute the barrier with
 * @size: size of memory to execute barrier over
 *
 * Since: 1.18
  }
type
  PGstVulkanBarrierBufferInfo = ^TGstVulkanBarrierBufferInfo;
  TGstVulkanBarrierBufferInfo = record
      parent : TGstVulkanBarrierMemoryInfo;
      offset : TVkDeviceSize;
      size : TVkDeviceSize;
    end;

{*
 * GstVulkanBufferMemory:
 * @parent: parent #GstMemory
 * @device: the #GstVulkanDevice this vulkan buffer is allocated from
 * @buffer: Vulkan buffer object
 * @vk_mem: backing #GstVulkanMemory for @buffer
 * @requirements: allocation requirements for @buffer
 * @usage: intended usage for @buffer
 * @barrier: the last set barrier information
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanBufferMemory = ^TGstVulkanBufferMemory;
  TGstVulkanBufferMemory = record
      parent : TGstMemory;
      device : PGstVulkanDevice;
      buffer : TVkBuffer;
      vk_mem : PGstVulkanMemory;
      requirements : TVkMemoryRequirements;
      usage : TVkBufferUsageFlags;
      barrier : TGstVulkanBarrierBufferInfo;
      lock : TGMutex;
      wrapped : Tgboolean;
      notify : TGDestroyNotify;
      user_data : Tgpointer;
    end;

{*
 * GstVulkanBufferMemoryAllocator
 * @parent: the parent #GstAllocator
 *
 * Opaque #GstVulkanBufferMemoryAllocator struct
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanBufferMemoryAllocator = ^TGstVulkanBufferMemoryAllocator;
  TGstVulkanBufferMemoryAllocator = record
      parent : TGstAllocator;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanBufferMemoryAllocatorClass:
 * @parent_class: the parent #GstAllocatorClass
 *
 * The #GstVulkanBufferMemoryAllocatorClass only contains private data
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanBufferMemoryAllocatorClass = ^TGstVulkanBufferMemoryAllocatorClass;
  TGstVulkanBufferMemoryAllocatorClass = record
      parent_class : TGstAllocatorClass;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC         (GstVulkanBufferMemoryAllocator, gst_object_unref); }

procedure gst_vulkan_buffer_memory_init_once;cdecl;external;
function gst_is_vulkan_buffer_memory(mem:PGstMemory):Tgboolean;cdecl;external;
function gst_vulkan_buffer_memory_alloc(device:PGstVulkanDevice; size:Tgsize; usage:TVkBufferUsageFlags; mem_prop_flags:TVkMemoryPropertyFlags):PGstMemory;cdecl;external;
(* Const before type ignored *)
function gst_vulkan_buffer_memory_alloc_with_buffer_info(device:PGstVulkanDevice; buffer_info:PVkBufferCreateInfo; mem_prop_flags:TVkMemoryPropertyFlags):PGstMemory;cdecl;external;
function gst_vulkan_buffer_memory_wrapped(device:PGstVulkanDevice; buffer:TVkBuffer; usage:TVkBufferUsageFlags; user_data:Tgpointer; notify:TGDestroyNotify):PGstMemory;cdecl;external;
{$endif}
{ __GST_VULKAN_BUFFER_MEMORY_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VULKAN_BUFFER_MEMORY_ALLOCATOR : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_BUFFER_MEMORY_ALLOCATOR:=gst_vulkan_buffer_memory_allocator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_BUFFER_MEMORY_ALLOCATOR(obj : longint) : longint;
begin
  GST_IS_VULKAN_BUFFER_MEMORY_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VULKAN_BUFFER_MEMORY_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_BUFFER_MEMORY_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_IS_VULKAN_BUFFER_MEMORY_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_VULKAN_BUFFER_MEMORY_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_GET_CLASS(obj : longint) : longint;
begin
  GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_VULKAN_MEMORY_ALLOCATOR,GstVulkanBufferMemoryAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_BUFFER_MEMORY_ALLOCATOR(obj : longint) : longint;
begin
  GST_VULKAN_BUFFER_MEMORY_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VULKAN_MEMORY_ALLOCATOR,GstVulkanBufferMemoryAllocator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_VULKAN_MEMORY_ALLOCATOR,GstVulkanBufferMemoryAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_CAST(obj : longint) : PGstVulkanBufferMemoryAllocator;
begin
  GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_CAST:=PGstVulkanBufferMemoryAllocator(obj);
end;


end.
