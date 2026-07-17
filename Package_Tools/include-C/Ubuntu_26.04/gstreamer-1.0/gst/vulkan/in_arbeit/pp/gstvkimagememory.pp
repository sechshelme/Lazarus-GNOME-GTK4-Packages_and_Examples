
unit gstvkimagememory;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvkimagememory.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkimagememory.h
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
PGPtrArray  = ^GPtrArray;
PGstAllocationParams  = ^GstAllocationParams;
PGstAllocator  = ^GstAllocator;
PGstMemory  = ^GstMemory;
PGstVulkanBarrierImageInfo  = ^GstVulkanBarrierImageInfo;
PGstVulkanDevice  = ^GstVulkanDevice;
PGstVulkanImageMemory  = ^GstVulkanImageMemory;
PGstVulkanImageMemoryAllocator  = ^GstVulkanImageMemoryAllocator;
PGstVulkanImageMemoryAllocatorClass  = ^GstVulkanImageMemoryAllocatorClass;
PGstVulkanImageView  = ^GstVulkanImageView;
PGstVulkanMemory  = ^GstVulkanMemory;
PVkImageCreateInfo  = ^VkImageCreateInfo;
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
{$ifndef __GST_VULKAN_IMAGE_MEMORY_H__}
{$define __GST_VULKAN_IMAGE_MEMORY_H__}
{$include <gst/vulkan/gstvkbarrier.h>}
{$include <gst/vulkan/gstvkdevice.h>}
{$include <gst/video/video.h>}

{ was #define dname def_expr }
function GST_TYPE_VULKAN_IMAGE_MEMORY_ALLOCATOR : longint; { return type might be wrong }

function gst_vulkan_image_memory_allocator_get_type:TGType;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_IMAGE_MEMORY_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_IMAGE_MEMORY_ALLOCATOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_IMAGE_MEMORY_ALLOCATOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_CLASS(klass : longint) : longint;

{*
 * GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_CAST:
 *
 * Since: 1.18
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_CAST(obj : longint) : PGstVulkanImageMemoryAllocator;

{*
 * GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_NAME:
 *
 * Since: 1.18
  }
const
  GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_NAME = 'VulkanImage';  
{*
 * GST_CAPS_FEATURE_MEMORY_VULKAN_IMAGE:
 *
 * Since: 1.18
  }
  GST_CAPS_FEATURE_MEMORY_VULKAN_IMAGE = 'memory:VulkanImage';  
{*
 * GstVulkanBarrierImageInfo:
 * @parent: parent #GstVulkanBarrierMemoryInfo
 * @image_layout: the image layout of this barrier
 * @subresource_range: what subresource the barrier applies to
 *
 * Since: 1.18
  }
{ FIXME: multiple layers or mipmap levels may require multiple barriers  }
type
  PGstVulkanBarrierImageInfo = ^TGstVulkanBarrierImageInfo;
  TGstVulkanBarrierImageInfo = record
      parent : TGstVulkanBarrierMemoryInfo;
      image_layout : TVkImageLayout;
      subresource_range : TVkImageSubresourceRange;
    end;

{*
 * GstVulkanImageMemory:
 * @parent: parent #GstMemory
 * @device: the #GstVulkanDevice to allocate images from
 * @image: the Vulkan image handle
 * @vk_mem: the backing #GstVulkanMemory for @image
 * @create_info: creation information for @image
 * @requirements: memory requirements for @image
 * @format_properties: format properties
 * @usage: intended usage for @image
 * @barrier: last set barrier for @image
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanImageMemory = ^TGstVulkanImageMemory;
  TGstVulkanImageMemory = record
      parent : TGstMemory;
      device : PGstVulkanDevice;
      image : TVkImage;
      vk_mem : PGstVulkanMemory;
      create_info : TVkImageCreateInfo;
      requirements : TVkMemoryRequirements;
      format_properties : TVkImageFormatProperties;
      usage : TVkImageUsageFlags;
      barrier : TGstVulkanBarrierImageInfo;
      lock : TGMutex;
      wrapped : Tgboolean;
      notify : TGDestroyNotify;
      user_data : Tgpointer;
      views : PGPtrArray;
      outstanding_views : PGPtrArray;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanImageMemoryFindViewFunc:
 *
 * Function definition used to find views.  Return %TRUE if @view matches the
 * criteria.
 *
 * Since: 1.18
  }

  TGstVulkanImageMemoryFindViewFunc = function (view:PGstVulkanImageView; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstVulkanImageMemoryAllocator
 * @parent: the parent #GstAllocator
 *
 * Opaque #GstVulkanImageMemoryAllocator struct
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanImageMemoryAllocator = ^TGstVulkanImageMemoryAllocator;
  TGstVulkanImageMemoryAllocator = record
      parent : TGstAllocator;cdecl;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanImageMemoryAllocatorClass:
 * @parent_class: the parent #GstAllocatorClass
 *
 * The #GstVulkanImageMemoryAllocatorClass only contains private data
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanImageMemoryAllocatorClass = ^TGstVulkanImageMemoryAllocatorClass;
  TGstVulkanImageMemoryAllocatorClass = record
      parent_class : TGstAllocatorClass;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC         (GstVulkanImageMemoryAllocator, gst_object_unref); }

procedure gst_vulkan_image_memory_init_once;cdecl;external;
function gst_is_vulkan_image_memory(mem:PGstMemory):Tgboolean;cdecl;external;
function gst_vulkan_image_memory_init(mem:PGstVulkanImageMemory; allocator:PGstAllocator; parent:PGstMemory; device:PGstVulkanDevice; format:TVkFormat; 
           usage:TVkImageUsageFlags; initial_layout:TVkImageLayout; params:PGstAllocationParams; size:Tgsize; user_data:Tgpointer; 
           notify:TGDestroyNotify):Tgboolean;cdecl;external;
function gst_vulkan_image_memory_alloc_with_image_info(device:PGstVulkanDevice; image_info:PVkImageCreateInfo; mem_prop_flags:TVkMemoryPropertyFlags):PGstMemory;cdecl;external;
function gst_vulkan_image_memory_alloc(device:PGstVulkanDevice; format:TVkFormat; width:Tgsize; height:Tgsize; tiling:TVkImageTiling; 
           usage:TVkImageUsageFlags; mem_prop_flags:TVkMemoryPropertyFlags):PGstMemory;cdecl;external;
function gst_vulkan_image_memory_wrapped(device:PGstVulkanDevice; image:TVkImage; format:TVkFormat; width:Tgsize; height:Tgsize; 
           tiling:TVkImageTiling; usage:TVkImageUsageFlags; user_data:Tgpointer; notify:TGDestroyNotify):PGstMemory;cdecl;external;
function gst_vulkan_image_memory_get_width(image:PGstVulkanImageMemory):Tguint32;cdecl;external;
function gst_vulkan_image_memory_get_height(image:PGstVulkanImageMemory):Tguint32;cdecl;external;
function gst_vulkan_image_memory_find_view(image:PGstVulkanImageMemory; find_func:TGstVulkanImageMemoryFindViewFunc; user_data:Tgpointer):PGstVulkanImageView;cdecl;external;
procedure gst_vulkan_image_memory_add_view(image:PGstVulkanImageMemory; view:PGstVulkanImageView);cdecl;external;
{$endif}
{ __GST_VULKAN_IMAGE_MEMORY_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VULKAN_IMAGE_MEMORY_ALLOCATOR : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_IMAGE_MEMORY_ALLOCATOR:=gst_vulkan_image_memory_allocator_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_IMAGE_MEMORY_ALLOCATOR(obj : longint) : longint;
begin
  GST_IS_VULKAN_IMAGE_MEMORY_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VULKAN_IMAGE_MEMORY_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_IMAGE_MEMORY_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_IS_VULKAN_IMAGE_MEMORY_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_VULKAN_IMAGE_MEMORY_ALLOCATOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_GET_CLASS(obj : longint) : longint;
begin
  GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_VULKAN_MEMORY_ALLOCATOR,GstVulkanImageMemoryAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_IMAGE_MEMORY_ALLOCATOR(obj : longint) : longint;
begin
  GST_VULKAN_IMAGE_MEMORY_ALLOCATOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VULKAN_MEMORY_ALLOCATOR,GstVulkanImageMemoryAllocator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_CLASS(klass : longint) : longint;
begin
  GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_VULKAN_MEMORY_ALLOCATOR,GstVulkanImageMemoryAllocatorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_CAST(obj : longint) : PGstVulkanImageMemoryAllocator;
begin
  GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_CAST:=PGstVulkanImageMemoryAllocator(obj);
end;


end.
