
unit gstvkqueue;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvkqueue.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkqueue.h
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
PGstContext  = ^GstContext;
PGstElement  = ^GstElement;
PGstQuery  = ^GstQuery;
PGstVulkanCommandPool  = ^GstVulkanCommandPool;
PGstVulkanDevice  = ^GstVulkanDevice;
PGstVulkanQueue  = ^GstVulkanQueue;
PGstVulkanQueueClass  = ^GstVulkanQueueClass;
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
{$ifndef __GST_VULKAN_QUEUE_H__}
{$define __GST_VULKAN_QUEUE_H__}
{$include <gst/vulkan/gstvkdevice.h>}
{$include <gst/vulkan/gstvkcommandpool.h>}

{ was #define dname def_expr }
function GST_TYPE_VULKAN_QUEUE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_QUEUE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_QUEUE_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_QUEUE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_QUEUE_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_QUEUE_GET_CLASS(o : longint) : longint;

function gst_vulkan_queue_get_type:TGType;cdecl;external;
{*
 * GST_VULKAN_QUEUE_CONTEXT_TYPE_STR:
 *
 * Since: 1.18
  }
const
  GST_VULKAN_QUEUE_CONTEXT_TYPE_STR = 'gst.vulkan.queue';  
{*
 * GstVulkanQueue:
 * @parent: the parent #GstObject
 * @device: the #GstVulkanDevice this queue was allocated from
 * @queue: the vulkan queue handle
 * @family: the vulkan queue family
 * @index: the vulkan queue index
 *
 * Since: 1.18
  }
{ hides a pointer  }
{ <private>  }
type
  PGstVulkanQueue = ^TGstVulkanQueue;
  TGstVulkanQueue = record
      parent : TGstObject;
      device : PGstVulkanDevice;
      queue : TVkQueue;
      family : Tguint32;
      index : Tguint32;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanQueueClass:
 * @parent_class: the parent #GstObjectClass
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanQueueClass = ^TGstVulkanQueueClass;
  TGstVulkanQueueClass = record
      parent_class : TGstObjectClass;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC          (GstVulkanQueue, gst_object_unref) }

function gst_vulkan_queue_get_device(queue:PGstVulkanQueue):PGstVulkanDevice;cdecl;external;
function gst_vulkan_queue_create_command_pool(queue:PGstVulkanQueue; error:PPGError):PGstVulkanCommandPool;cdecl;external;
procedure gst_vulkan_queue_submit_lock(queue:PGstVulkanQueue);cdecl;external;
procedure gst_vulkan_queue_submit_unlock(queue:PGstVulkanQueue);cdecl;external;
procedure gst_context_set_vulkan_queue(context:PGstContext; queue:PGstVulkanQueue);cdecl;external;
function gst_context_get_vulkan_queue(context:PGstContext; queue:PPGstVulkanQueue):Tgboolean;cdecl;external;
function gst_vulkan_queue_handle_context_query(element:PGstElement; query:PGstQuery; queue:PGstVulkanQueue):Tgboolean;cdecl;external;
function gst_vulkan_queue_run_context_query(element:PGstElement; queue:PPGstVulkanQueue):Tgboolean;cdecl;external;
{$endif}
{ __GST_VULKAN_QUEUE_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VULKAN_QUEUE : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_QUEUE:=gst_vulkan_queue_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_QUEUE(o : longint) : longint;
begin
  GST_VULKAN_QUEUE:=G_TYPE_CHECK_INSTANCE_CAST(o,GST_TYPE_VULKAN_QUEUE,GstVulkanQueue);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_QUEUE_CLASS(k : longint) : longint;
begin
  GST_VULKAN_QUEUE_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,GST_TYPE_VULKAN_QUEUE,GstVulkanQueueClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_QUEUE(o : longint) : longint;
begin
  GST_IS_VULKAN_QUEUE:=G_TYPE_CHECK_INSTANCE_TYPE(o,GST_TYPE_VULKAN_QUEUE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_QUEUE_CLASS(k : longint) : longint;
begin
  GST_IS_VULKAN_QUEUE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,GST_TYPE_VULKAN_QUEUE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_QUEUE_GET_CLASS(o : longint) : longint;
begin
  GST_VULKAN_QUEUE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GST_TYPE_VULKAN_QUEUE,GstVulkanQueueClass);
end;


end.
