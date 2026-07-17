
unit gstvkcommandpool;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvkcommandpool.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkcommandpool.h
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
PGstVulkanCommandBuffer  = ^GstVulkanCommandBuffer;
PGstVulkanCommandPool  = ^GstVulkanCommandPool;
PGstVulkanCommandPoolClass  = ^GstVulkanCommandPoolClass;
PGstVulkanQueue  = ^GstVulkanQueue;
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

{ was #define dname def_expr }
function GST_TYPE_VULKAN_COMMAND_POOL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_COMMAND_POOL(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_COMMAND_POOL_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_COMMAND_POOL(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_COMMAND_POOL_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_COMMAND_POOL_GET_CLASS(o : longint) : longint;

function gst_vulkan_command_pool_get_type:TGType;cdecl;external;
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

function gst_vulkan_command_pool_get_queue(pool:PGstVulkanCommandPool):PGstVulkanQueue;cdecl;external;
function gst_vulkan_command_pool_create(pool:PGstVulkanCommandPool; error:PPGError):PGstVulkanCommandBuffer;cdecl;external;
procedure gst_vulkan_command_pool_lock(pool:PGstVulkanCommandPool);cdecl;external;
procedure gst_vulkan_command_pool_unlock(pool:PGstVulkanCommandPool);cdecl;external;
{$endif}
{ __GST_VULKAN_COMMAND_POOL_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VULKAN_COMMAND_POOL : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_COMMAND_POOL:=gst_vulkan_command_pool_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_COMMAND_POOL(o : longint) : longint;
begin
  GST_VULKAN_COMMAND_POOL:=G_TYPE_CHECK_INSTANCE_CAST(o,GST_TYPE_VULKAN_COMMAND_POOL,GstVulkanCommandPool);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_COMMAND_POOL_CLASS(k : longint) : longint;
begin
  GST_VULKAN_COMMAND_POOL_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,GST_TYPE_VULKAN_COMMAND_POOL,GstVulkanCommandPoolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_COMMAND_POOL(o : longint) : longint;
begin
  GST_IS_VULKAN_COMMAND_POOL:=G_TYPE_CHECK_INSTANCE_TYPE(o,GST_TYPE_VULKAN_COMMAND_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_COMMAND_POOL_CLASS(k : longint) : longint;
begin
  GST_IS_VULKAN_COMMAND_POOL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,GST_TYPE_VULKAN_COMMAND_POOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_COMMAND_POOL_GET_CLASS(o : longint) : longint;
begin
  GST_VULKAN_COMMAND_POOL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GST_TYPE_VULKAN_COMMAND_POOL,GstVulkanCommandPoolClass);
end;


end.
