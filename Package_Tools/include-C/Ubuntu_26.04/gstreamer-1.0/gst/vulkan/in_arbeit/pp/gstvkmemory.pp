
unit gstvkmemory;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvkmemory.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkmemory.h
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
PGstAllocationParams  = ^GstAllocationParams;
PGstMemory  = ^GstMemory;
PGstVulkanDevice  = ^GstVulkanDevice;
PGstVulkanMemory  = ^GstVulkanMemory;
PGstVulkanMemoryAllocator  = ^GstVulkanMemoryAllocator;
PGstVulkanMemoryAllocatorClass  = ^GstVulkanMemoryAllocatorClass;
Pguint32  = ^guint32;
PVkMemoryRequirements  = ^VkMemoryRequirements;
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
{$ifndef __GST_VULKAN_BASE_BUFFER_H__}
{$define __GST_VULKAN_BASE_BUFFER_H__}
{$include <gst/gst.h>}
{$include <gst/gstallocator.h>}
{$include <gst/gstmemory.h>}
{$include <gst/vulkan/vulkan.h>}

{ was #define dname def_expr }
function GST_TYPE_VULKAN_MEMORY_ALLOCATOR : longint; { return type might be wrong }

function gst_vulkan_memory_allocator_get_type:TGType;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_MEMORY_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_MEMORY_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_MEMORY_ALLOCATOR_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_MEMORY_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_MEMORY_ALLOCATOR_CLASS(klass : longint) : longint;

{*
 * GST_VULKAN_MEMORY_ALLOCATOR_CAST:
 *
 * Since: 1.18
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VULKAN_MEMORY_ALLOCATOR_CAST(obj : longint) : PGstVulkanMemoryAllocator;

{*
 * GST_VULKAN_MEMORY_ALLOCATOR_NAME:
 *
 * Since: 1.18
  }
const
  GST_VULKAN_MEMORY_ALLOCATOR_NAME = 'Vulkan';  
{*
 * GstVulkanMemory:
 * @mem: the parent #GstMemory
 * @device: the #GstVulkanDevice this memory is allocated from
 * @mem_ptr: the vulkan memory handle
 * @lock: lock for accessing/changing memory informat
 * @map_count: number of times this memory is mapped
 * @mapping: internal pointer to already mapped memory
 *
 * Since: 1.18
  }
{ <protected>  }
{*
   * GstVulkanMemory.mapping:
   *
   * internal pointer to already mapped memory
   *
   * Since: 1.24
    }
{ <private>  }
{ we need our own offset because GstMemory's is used to offset into the
   * mapped pointer which when suballocating, we need to avoid.  This in
   * relation to the root memory  }
{ <private>  }
type
  PGstVulkanMemory = ^TGstVulkanMemory;
  TGstVulkanMemory = record
      mem : TGstMemory;
      device : PGstVulkanDevice;
      mem_ptr : TVkDeviceMemory;
      lock : TGMutex;
      map_count : Tguint;
      mapping : Tgpointer;
      notify : TGDestroyNotify;
      user_data : Tgpointer;
      alloc_info : TVkMemoryAllocateInfo;
      properties : TVkMemoryPropertyFlags;
      vk_offset : Tguint64;
      wrapped : Tgboolean;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanMemoryAllocator
 * @parent: the parent #GstAllocator
 *
 * Opaque #GstVulkanMemoryAllocator struct
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanMemoryAllocator = ^TGstVulkanMemoryAllocator;
  TGstVulkanMemoryAllocator = record
      parent : TGstAllocator;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanMemoryAllocatorClass:
 * @parent_class: the parent #GstAllocatorClass
 *
 * The #GstVulkanMemoryAllocatorClass only contains private data
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanMemoryAllocatorClass = ^TGstVulkanMemoryAllocatorClass;
  TGstVulkanMemoryAllocatorClass = record
      parent_class : TGstAllocatorClass;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC         (GstVulkanMemoryAllocator, gst_object_unref); }

procedure gst_vulkan_memory_init_once;cdecl;external;
function gst_is_vulkan_memory(mem:PGstMemory):Tgboolean;cdecl;external;
function gst_vulkan_memory_alloc(device:PGstVulkanDevice; memory_type_index:Tguint32; params:PGstAllocationParams; size:Tgsize; mem_prop_flags:TVkMemoryPropertyFlags):PGstMemory;cdecl;external;
(* Const before type ignored *)
function gst_vulkan_memory_find_memory_type_index_with_requirements(device:PGstVulkanDevice; req:PVkMemoryRequirements; properties:TVkMemoryPropertyFlags; type_index:Pguint32):Tgboolean;cdecl;external;
{$endif}
{ _GST_VULKAN_BASE_BUFFER_H_  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VULKAN_MEMORY_ALLOCATOR : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_MEMORY_ALLOCATOR:=gst_vulkan_memory_allocator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_MEMORY_ALLOCATOR(obj : longint) : longint;
begin
  GST_IS_VULKAN_MEMORY_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VULKAN_MEMORY_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_MEMORY_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_IS_VULKAN_MEMORY_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_VULKAN_MEMORY_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_MEMORY_ALLOCATOR_GET_CLASS(obj : longint) : longint;
begin
  GST_VULKAN_MEMORY_ALLOCATOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_VULKAN_MEMORY_ALLOCATOR,GstVulkanMemoryAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_MEMORY_ALLOCATOR(obj : longint) : longint;
begin
  GST_VULKAN_MEMORY_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VULKAN_MEMORY_ALLOCATOR,GstVulkanMemoryAllocator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_MEMORY_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_VULKAN_MEMORY_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_VULKAN_MEMORY_ALLOCATOR,GstVulkanMemoryAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VULKAN_MEMORY_ALLOCATOR_CAST(obj : longint) : PGstVulkanMemoryAllocator;
begin
  GST_VULKAN_MEMORY_ALLOCATOR_CAST:=PGstVulkanMemoryAllocator(obj);
end;


end.
