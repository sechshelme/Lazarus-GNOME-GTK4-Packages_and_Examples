unit gstvkhandlepool;

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
{$ifndef __GST_VULKAN_HANDLE_POOL_H__}
{$define __GST_VULKAN_HANDLE_POOL_H__}
{$include <gst/gst.h>}
{$include <gst/vulkan/vulkan_fwd.h>}
{$include <gst/vulkan/gstvkapi.h>}

function gst_vulkan_handle_pool_get_type:TGType;cdecl;external libgstvulkan;
{*
 * GST_VULKAN_HANDLE_POOL_CAST:
 *
 * Since: 1.18
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VULKAN_HANDLE_POOL_CAST(obj : longint) : PGstVulkanHandlePool;

{*
 * GstVulkanHandlePool:
 * @parent: the parent #GstObject
 * @device: the #GstVulkanDevice handles are allocated from
 * @outstanding: the collection of outstanding handles
 * @available: the collection of allocated and available handles
 *
 * Since: 1.18
  }
{ <protected>  }
{ <private>  }
type
  PGstVulkanHandlePool = ^TGstVulkanHandlePool;
  TGstVulkanHandlePool = record
      parent : TGstObject;
      device : PGstVulkanDevice;
      outstanding : PGPtrArray;
      available : PGPtrArray;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanHandlePoolClass:
 * @parent: the parent #GstObjectClass
 * @alloc: allocate a new handle
 * @acquire: acquire a handle for usage
 * @release: release a handle for possible reuse at the next call to @acquire
 * @free: free a handle
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanHandlePoolClass = ^TGstVulkanHandlePoolClass;
  TGstVulkanHandlePoolClass = record
      parent : TGstObjectClass;
      alloc : function (pool:PGstVulkanHandlePool; error:PPGError):Tgpointer;cdecl;
      acquire : function (pool:PGstVulkanHandlePool; error:PPGError):Tgpointer;cdecl;
      release : procedure (pool:PGstVulkanHandlePool; handle:Tgpointer);cdecl;
      free : procedure (pool:PGstVulkanHandlePool; handle:Tgpointer);cdecl;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC          (GstVulkanHandlePool, gst_object_unref) }

function gst_vulkan_handle_pool_alloc(pool:PGstVulkanHandlePool; error:PPGError):Tgpointer;cdecl;external libgstvulkan;
function gst_vulkan_handle_pool_acquire(pool:PGstVulkanHandlePool; error:PPGError):Tgpointer;cdecl;external libgstvulkan;
procedure gst_vulkan_handle_pool_release(pool:PGstVulkanHandlePool; handle:Tgpointer);cdecl;external libgstvulkan;
{$endif}
{ _GST_VULKAN_HANDLE_H_  }

// === Konventiert am: 17-7-26 15:42:25 ===

function GST_TYPE_VULKAN_HANDLE_POOL : TGType;
function GST_VULKAN_HANDLE_POOL(obj : Pointer) : PGstVulkanHandlePool;
function GST_VULKAN_HANDLE_POOL_CLASS(klass : Pointer) : PGstVulkanHandlePoolClass;
function GST_IS_VULKAN_HANDLE_POOL(obj : Pointer) : Tgboolean;
function GST_IS_VULKAN_HANDLE_POOL_CLASS(klass : Pointer) : Tgboolean;
function GST_VULKAN_HANDLE_POOL_GET_CLASS(obj : Pointer) : PGstVulkanHandlePoolClass;

implementation

function GST_TYPE_VULKAN_HANDLE_POOL : TGType;
  begin
    GST_TYPE_VULKAN_HANDLE_POOL:=gst_vulkan_handle_pool_get_type;
  end;

function GST_VULKAN_HANDLE_POOL(obj : Pointer) : PGstVulkanHandlePool;
begin
  Result := PGstVulkanHandlePool(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_HANDLE_POOL));
end;

function GST_VULKAN_HANDLE_POOL_CLASS(klass : Pointer) : PGstVulkanHandlePoolClass;
begin
  Result := PGstVulkanHandlePoolClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_HANDLE_POOL));
end;

function GST_IS_VULKAN_HANDLE_POOL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_VULKAN_HANDLE_POOL);
end;

function GST_IS_VULKAN_HANDLE_POOL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_VULKAN_HANDLE_POOL);
end;

function GST_VULKAN_HANDLE_POOL_GET_CLASS(obj : Pointer) : PGstVulkanHandlePoolClass;
begin
  Result := PGstVulkanHandlePoolClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_VULKAN_HANDLE_POOL_CAST(obj : longint) : PGstVulkanHandlePool;
begin
  GST_VULKAN_HANDLE_POOL_CAST:=PGstVulkanHandlePool(o);
end;


end.
