
unit gstvkoperation;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvkoperation.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkoperation.h
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
PGArray  = ^GArray;
PGError  = ^GError;
Pgpointer  = ^gpointer;
PGstBuffer  = ^GstBuffer;
PGstVulkanCommandBuffer  = ^GstVulkanCommandBuffer;
PGstVulkanCommandPool  = ^GstVulkanCommandPool;
PGstVulkanEncodeQueryResult  = ^GstVulkanEncodeQueryResult;
PGstVulkanOperation  = ^GstVulkanOperation;
PGstVulkanOperationClass  = ^GstVulkanOperationClass;
PGstVulkanQueue  = ^GstVulkanQueue;
PVkBaseInStructure  = ^VkBaseInStructure;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2023 Igalia, S.L.
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
(** unsupported pragma#pragma once*)
{$include <gst/vulkan/gstvkqueue.h>}

{ was #define dname def_expr }
function GST_TYPE_VULKAN_OPERATION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_OPERATION(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_OPERATION_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_OPERATION(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_OPERATION_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_OPERATION_GET_CLASS(o : longint) : longint;

function gst_vulkan_operation_get_type:TGType;cdecl;external;
{*
 * GstVulkanOperation:
 * @parent: the parent #GstObject
 * @cmd_buf: the current #GstVulkanCommandBuffer
 *
 * When using the operation @cmd_buf, you should lock it using
 * gst_vulkan_command_buffer_lock(), but you have to unlock it, with
 * gst_vulkan_command_buffer_unlock(), when calling any of #GstVulkanOperation
 * methods.
 *
 * Since: 1.24
  }
{ <private>  }
type
  PGstVulkanOperation = ^TGstVulkanOperation;
  TGstVulkanOperation = record
      parent : TGstObject;
      cmd_buf : PGstVulkanCommandBuffer;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{ <private>  }
  PGstVulkanOperationClass = ^TGstVulkanOperationClass;
  TGstVulkanOperationClass = record
      parent_class : TGstObjectClass;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanEncodeQueryResult:
 * @offset: buffer offset
 * @data_size: data size
 * @status: status
 *
 * Encoder query result. Expected to be used in gst_vulkan_operation_get_query()
 *
 * Since: 1.26
  }
  PGstVulkanEncodeQueryResult = ^TGstVulkanEncodeQueryResult;
  TGstVulkanEncodeQueryResult = record
      offset : Tguint32;
      data_size : Tguint32;
      status : Tguint32;
    end;

{////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC          (GstVulkanOperation, gst_object_unref) }

function gst_vulkan_operation_new(cmd_pool:PGstVulkanCommandPool):PGstVulkanOperation;cdecl;external;
function gst_vulkan_operation_begin(self:PGstVulkanOperation; error:PPGError):Tgboolean;cdecl;external;
function gst_vulkan_operation_wait(self:PGstVulkanOperation):Tgboolean;cdecl;external;
function gst_vulkan_operation_end(self:PGstVulkanOperation; error:PPGError):Tgboolean;cdecl;external;
procedure gst_vulkan_operation_reset(self:PGstVulkanOperation);cdecl;external;
function gst_vulkan_operation_retrieve_image_barriers(self:PGstVulkanOperation):PGArray;cdecl;external;
function gst_vulkan_operation_new_extra_image_barriers(self:PGstVulkanOperation):PGArray;cdecl;external;
function gst_vulkan_operation_add_frame_barrier(self:PGstVulkanOperation; frame:PGstBuffer; src_stage:Tguint64; dst_stage:Tguint64; new_access:Tguint64; 
           new_layout:TVkImageLayout; new_queue:PGstVulkanQueue):Tgboolean;cdecl;external;
procedure gst_vulkan_operation_add_extra_image_barriers(self:PGstVulkanOperation; extra_barriers:PGArray);cdecl;external;
procedure gst_vulkan_operation_update_frame(self:PGstVulkanOperation; frame:PGstBuffer; dst_stage:Tguint64; new_access:Tguint64; new_layout:TVkImageLayout; 
            new_queue:PGstVulkanQueue);cdecl;external;
function gst_vulkan_operation_add_dependency_frame(self:PGstVulkanOperation; frame:PGstBuffer; wait_stage:Tguint64; signal_stage:Tguint64):Tgboolean;cdecl;external;
procedure gst_vulkan_operation_discard_dependencies(self:PGstVulkanOperation);cdecl;external;
function gst_vulkan_operation_enable_query(self:PGstVulkanOperation; query_type:TVkQueryType; n_queries:Tguint; pnext:Tgpointer; error:PPGError):Tgboolean;cdecl;external;
function gst_vulkan_operation_get_query(self:PGstVulkanOperation; data:Pgpointer; error:PPGError):Tgboolean;cdecl;external;
function gst_vulkan_operation_begin_query(self:PGstVulkanOperation; base:PVkBaseInStructure; id:Tguint32):Tgboolean;cdecl;external;
function gst_vulkan_operation_end_query(self:PGstVulkanOperation; id:Tguint32):Tgboolean;cdecl;external;
function gst_vulkan_operation_use_sync2(self:PGstVulkanOperation):Tgboolean;cdecl;external;
function gst_vulkan_operation_pipeline_barrier2(self:PGstVulkanOperation; dependency_info:Tgpointer):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GST_TYPE_VULKAN_OPERATION : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_OPERATION:=gst_vulkan_operation_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_OPERATION(o : longint) : longint;
begin
  GST_VULKAN_OPERATION:=G_TYPE_CHECK_INSTANCE_CAST(o,GST_TYPE_VULKAN_OPERATION,GstVulkanOperation);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_OPERATION_CLASS(k : longint) : longint;
begin
  GST_VULKAN_OPERATION_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,GST_TYPE_VULKAN_OPERATION,GstVulkanOperationClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_OPERATION(o : longint) : longint;
begin
  GST_IS_VULKAN_OPERATION:=G_TYPE_CHECK_INSTANCE_TYPE(o,GST_TYPE_VULKAN_OPERATION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_OPERATION_CLASS(k : longint) : longint;
begin
  GST_IS_VULKAN_OPERATION_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,GST_TYPE_VULKAN_OPERATION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_OPERATION_GET_CLASS(o : longint) : longint;
begin
  GST_VULKAN_OPERATION_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GST_TYPE_VULKAN_OPERATION,GstVulkanOperationClass);
end;


end.
