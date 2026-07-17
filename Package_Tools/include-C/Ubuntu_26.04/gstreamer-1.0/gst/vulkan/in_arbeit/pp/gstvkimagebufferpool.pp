
unit gstvkimagebufferpool;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvkimagebufferpool.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkimagebufferpool.h
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
PGstBufferPool  = ^GstBufferPool;
PGstCaps  = ^GstCaps;
PGstStructure  = ^GstStructure;
PGstVulkanDevice  = ^GstVulkanDevice;
PGstVulkanImageBufferPool  = ^GstVulkanImageBufferPool;
PGstVulkanImageBufferPoolClass  = ^GstVulkanImageBufferPoolClass;
Pguint64  = ^guint64;
PVkImageLayout  = ^VkImageLayout;
PVkImageUsageFlags  = ^VkImageUsageFlags;
PVkMemoryPropertyFlags  = ^VkMemoryPropertyFlags;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2016 Matthew Waters <matthew@centricular.com>
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
{$ifndef __GST_VULKAN_IMAGE_BUFFER_POOL_H__}
{$define __GST_VULKAN_IMAGE_BUFFER_POOL_H__}
{$include <gst/video/video.h>}
{$include <gst/video/gstvideometa.h>}
{$include <gst/video/gstvideopool.h>}
{$include <gst/vulkan/vulkan.h>}

function gst_vulkan_image_buffer_pool_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_VULKAN_IMAGE_BUFFER_POOL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_IMAGE_BUFFER_POOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_IMAGE_BUFFER_POOL(obj : longint) : longint;

{*
 * GST_VULKAN_IMAGE_BUFFER_POOL_CAST:
 *
 * Since: 1.18
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VULKAN_IMAGE_BUFFER_POOL_CAST(obj : longint) : PGstVulkanImageBufferPool;

{*
 * GstVulkanImageBufferPool:
 * @bufferpool: parent #GstBufferPool
 * @device: the #GstVulkanDevice to allocate images from
 *
 * Since: 1.18
  }
{ <private>  }
type
  PGstVulkanImageBufferPool = ^TGstVulkanImageBufferPool;
  TGstVulkanImageBufferPool = record
      bufferpool : TGstBufferPool;
      device : PGstVulkanDevice;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanImageBufferPoolClass:
 * @parent_class: parent #GstBufferPoolClass
 *
 * The #GstVulkanImageBufferPoolClass structure contains only private data
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanImageBufferPoolClass = ^TGstVulkanImageBufferPoolClass;
  TGstVulkanImageBufferPoolClass = record
      parent_class : TGstBufferPoolClass;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC         (GstVulkanImageBufferPool, gst_object_unref); }

function gst_vulkan_image_buffer_pool_new(device:PGstVulkanDevice):PGstBufferPool;cdecl;external;
procedure gst_vulkan_image_buffer_pool_config_set_allocation_params(config:PGstStructure; usage:TVkImageUsageFlags; mem_properties:TVkMemoryPropertyFlags; initial_layout:TVkImageLayout; initial_access:Tguint64);cdecl;external;
procedure gst_vulkan_image_buffer_pool_config_get_allocation_params(config:PGstStructure; usage:PVkImageUsageFlags; mem_props:PVkMemoryPropertyFlags; initial_layout:PVkImageLayout; initial_access:Pguint64);cdecl;external;
procedure gst_vulkan_image_buffer_pool_config_set_decode_caps(config:PGstStructure; caps:PGstCaps);cdecl;external;
procedure gst_vulkan_image_buffer_pool_config_set_encode_caps(config:PGstStructure; caps:PGstCaps);cdecl;external;
{$endif}
{ __GST_VULKAN_IMAGE_BUFFER_POOL_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VULKAN_IMAGE_BUFFER_POOL : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_IMAGE_BUFFER_POOL:=gst_vulkan_image_buffer_pool_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_IMAGE_BUFFER_POOL(obj : longint) : longint;
begin
  GST_IS_VULKAN_IMAGE_BUFFER_POOL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VULKAN_IMAGE_BUFFER_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_IMAGE_BUFFER_POOL(obj : longint) : longint;
begin
  GST_VULKAN_IMAGE_BUFFER_POOL:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VULKAN_IMAGE_BUFFER_POOL,GstVulkanImageBufferPool);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VULKAN_IMAGE_BUFFER_POOL_CAST(obj : longint) : PGstVulkanImageBufferPool;
begin
  GST_VULKAN_IMAGE_BUFFER_POOL_CAST:=PGstVulkanImageBufferPool(obj);
end;


end.
