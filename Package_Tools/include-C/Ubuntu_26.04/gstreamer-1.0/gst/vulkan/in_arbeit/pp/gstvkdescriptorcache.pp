
unit gstvkdescriptorcache;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvkdescriptorcache.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkdescriptorcache.h
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
PGstVulkanDescriptorCache  = ^GstVulkanDescriptorCache;
PGstVulkanDescriptorCacheClass  = ^GstVulkanDescriptorCacheClass;
PGstVulkanDescriptorPool  = ^GstVulkanDescriptorPool;
PGstVulkanDescriptorSet  = ^GstVulkanDescriptorSet;
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
{$ifndef __GST_VULKAN_DESCRIPTOR_CACHE_H__}
{$define __GST_VULKAN_DESCRIPTOR_CACHE_H__}
{$include <gst/vulkan/gstvkqueue.h>}
{$include <gst/vulkan/gstvkhandlepool.h>}

{ was #define dname def_expr }
function GST_TYPE_VULKAN_DESCRIPTOR_CACHE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DESCRIPTOR_CACHE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DESCRIPTOR_CACHE_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DESCRIPTOR_CACHE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DESCRIPTOR_CACHE_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DESCRIPTOR_CACHE_GET_CLASS(o : longint) : longint;

function gst_vulkan_descriptor_cache_get_type:TGType;cdecl;external;
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

function gst_vulkan_descriptor_cache_new(pool:PGstVulkanDescriptorPool; n_layouts:Tguint; layouts:PPGstVulkanHandle):PGstVulkanDescriptorCache;cdecl;external;
function gst_vulkan_descriptor_cache_acquire(cache:PGstVulkanDescriptorCache; error:PPGError):PGstVulkanDescriptorSet;cdecl;external;
{$endif}
{ __GST_VULKAN_DESCRIPTOR_CACHE_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VULKAN_DESCRIPTOR_CACHE : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_DESCRIPTOR_CACHE:=gst_vulkan_descriptor_cache_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DESCRIPTOR_CACHE(o : longint) : longint;
begin
  GST_VULKAN_DESCRIPTOR_CACHE:=G_TYPE_CHECK_INSTANCE_CAST(o,GST_TYPE_VULKAN_DESCRIPTOR_CACHE,GstVulkanDescriptorCache);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DESCRIPTOR_CACHE_CLASS(k : longint) : longint;
begin
  GST_VULKAN_DESCRIPTOR_CACHE_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,GST_TYPE_VULKAN_DESCRIPTOR_CACHE,GstVulkanDescriptorCacheClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DESCRIPTOR_CACHE(o : longint) : longint;
begin
  GST_IS_VULKAN_DESCRIPTOR_CACHE:=G_TYPE_CHECK_INSTANCE_TYPE(o,GST_TYPE_VULKAN_DESCRIPTOR_CACHE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DESCRIPTOR_CACHE_CLASS(k : longint) : longint;
begin
  GST_IS_VULKAN_DESCRIPTOR_CACHE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,GST_TYPE_VULKAN_DESCRIPTOR_CACHE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DESCRIPTOR_CACHE_GET_CLASS(o : longint) : longint;
begin
  GST_VULKAN_DESCRIPTOR_CACHE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GST_TYPE_VULKAN_DESCRIPTOR_CACHE,GstVulkanDescriptorCacheClass);
end;


end.
