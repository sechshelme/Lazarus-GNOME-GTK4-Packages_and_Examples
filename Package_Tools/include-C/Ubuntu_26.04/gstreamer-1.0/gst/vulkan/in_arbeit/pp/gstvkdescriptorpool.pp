
unit gstvkdescriptorpool;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvkdescriptorpool.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkdescriptorpool.h
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
PGError  = ^GError;
PGstVulkanDescriptorPool  = ^GstVulkanDescriptorPool;
PGstVulkanDescriptorPoolClass  = ^GstVulkanDescriptorPoolClass;
PGstVulkanDescriptorSet  = ^GstVulkanDescriptorSet;
PGstVulkanDevice  = ^GstVulkanDevice;
PGstVulkanHandle  = ^GstVulkanHandle;
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

function gst_vulkan_descriptor_pool_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_VULKAN_DESCRIPTOR_POOL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DESCRIPTOR_POOL(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DESCRIPTOR_POOL_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DESCRIPTOR_POOL(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DESCRIPTOR_POOL_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DESCRIPTOR_POOL_GET_CLASS(o : longint) : longint;

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

function gst_vulkan_descriptor_pool_new_wrapped(device:PGstVulkanDevice; pool:TVkDescriptorPool; max_sets:Tgsize):PGstVulkanDescriptorPool;cdecl;external;
function gst_vulkan_descriptor_pool_get_device(pool:PGstVulkanDescriptorPool):PGstVulkanDevice;cdecl;external;
function gst_vulkan_descriptor_pool_create(pool:PGstVulkanDescriptorPool; n_layouts:Tguint; layouts:PPGstVulkanHandle; error:PPGError):PGstVulkanDescriptorSet;cdecl;external;
function gst_vulkan_descriptor_pool_get_max_sets(pool:PGstVulkanDescriptorPool):Tgsize;cdecl;external;
{$endif}
{ __GST_VULKAN_DESCRIPTOR_POOL_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VULKAN_DESCRIPTOR_POOL : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_DESCRIPTOR_POOL:=gst_vulkan_descriptor_pool_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DESCRIPTOR_POOL(o : longint) : longint;
begin
  GST_VULKAN_DESCRIPTOR_POOL:=G_TYPE_CHECK_INSTANCE_CAST(o,GST_TYPE_VULKAN_DESCRIPTOR_POOL,GstVulkanDescriptorPool);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DESCRIPTOR_POOL_CLASS(k : longint) : longint;
begin
  GST_VULKAN_DESCRIPTOR_POOL_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,GST_TYPE_VULKAN_DESCRIPTOR_POOL,GstVulkanDescriptorPoolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DESCRIPTOR_POOL(o : longint) : longint;
begin
  GST_IS_VULKAN_DESCRIPTOR_POOL:=G_TYPE_CHECK_INSTANCE_TYPE(o,GST_TYPE_VULKAN_DESCRIPTOR_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DESCRIPTOR_POOL_CLASS(k : longint) : longint;
begin
  GST_IS_VULKAN_DESCRIPTOR_POOL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,GST_TYPE_VULKAN_DESCRIPTOR_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DESCRIPTOR_POOL_GET_CLASS(o : longint) : longint;
begin
  GST_VULKAN_DESCRIPTOR_POOL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GST_TYPE_VULKAN_DESCRIPTOR_POOL,GstVulkanDescriptorPoolClass);
end;


end.
