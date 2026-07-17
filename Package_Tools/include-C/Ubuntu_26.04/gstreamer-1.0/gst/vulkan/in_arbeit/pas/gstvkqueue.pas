unit gstvkqueue;

interface

uses
  fp_glib2, fp_gst;

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

function gst_vulkan_queue_get_type:TGType;cdecl;external libgstvulkan;
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

function gst_vulkan_queue_get_device(queue:PGstVulkanQueue):PGstVulkanDevice;cdecl;external libgstvulkan;
function gst_vulkan_queue_create_command_pool(queue:PGstVulkanQueue; error:PPGError):PGstVulkanCommandPool;cdecl;external libgstvulkan;
procedure gst_vulkan_queue_submit_lock(queue:PGstVulkanQueue);cdecl;external libgstvulkan;
procedure gst_vulkan_queue_submit_unlock(queue:PGstVulkanQueue);cdecl;external libgstvulkan;
procedure gst_context_set_vulkan_queue(context:PGstContext; queue:PGstVulkanQueue);cdecl;external libgstvulkan;
function gst_context_get_vulkan_queue(context:PGstContext; queue:PPGstVulkanQueue):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_queue_handle_context_query(element:PGstElement; query:PGstQuery; queue:PGstVulkanQueue):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_queue_run_context_query(element:PGstElement; queue:PPGstVulkanQueue):Tgboolean;cdecl;external libgstvulkan;
{$endif}
{ __GST_VULKAN_QUEUE_H__  }

// === Konventiert am: 17-7-26 15:46:40 ===

function GST_TYPE_VULKAN_QUEUE : TGType;
function GST_VULKAN_QUEUE(obj : Pointer) : PGstVulkanQueue;
function GST_VULKAN_QUEUE_CLASS(klass : Pointer) : PGstVulkanQueueClass;
function GST_IS_VULKAN_QUEUE(obj : Pointer) : Tgboolean;
function GST_IS_VULKAN_QUEUE_CLASS(klass : Pointer) : Tgboolean;
function GST_VULKAN_QUEUE_GET_CLASS(obj : Pointer) : PGstVulkanQueueClass;

implementation

function GST_TYPE_VULKAN_QUEUE : TGType;
  begin
    GST_TYPE_VULKAN_QUEUE:=gst_vulkan_queue_get_type;
  end;

function GST_VULKAN_QUEUE(obj : Pointer) : PGstVulkanQueue;
begin
  Result := PGstVulkanQueue(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_QUEUE));
end;

function GST_VULKAN_QUEUE_CLASS(klass : Pointer) : PGstVulkanQueueClass;
begin
  Result := PGstVulkanQueueClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_QUEUE));
end;

function GST_IS_VULKAN_QUEUE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_VULKAN_QUEUE);
end;

function GST_IS_VULKAN_QUEUE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_VULKAN_QUEUE);
end;

function GST_VULKAN_QUEUE_GET_CLASS(obj : Pointer) : PGstVulkanQueueClass;
begin
  Result := PGstVulkanQueueClass(PGTypeInstance(obj)^.g_class);
end;



end.
