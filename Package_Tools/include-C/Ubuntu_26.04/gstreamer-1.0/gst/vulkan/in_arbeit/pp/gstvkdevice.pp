
unit gstvkdevice;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvkdevice.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkdevice.h
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
Pgchar  = ^gchar;
PGError  = ^GError;
PGstContext  = ^GstContext;
PGstElement  = ^GstElement;
PGstQuery  = ^GstQuery;
PGstVulkanDevice  = ^GstVulkanDevice;
PGstVulkanDeviceClass  = ^GstVulkanDeviceClass;
PGstVulkanFence  = ^GstVulkanFence;
PGstVulkanInstance  = ^GstVulkanInstance;
PGstVulkanPhysicalDevice  = ^GstVulkanPhysicalDevice;
PGstVulkanQueue  = ^GstVulkanQueue;
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
{$ifndef __GST_VULKAN_DEVICE_H__}
{$define __GST_VULKAN_DEVICE_H__}
{$include <gst/vulkan/gstvkphysicaldevice.h>}
{$include <gst/vulkan/gstvkqueue.h>}

{ was #define dname def_expr }
function GST_TYPE_VULKAN_DEVICE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DEVICE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DEVICE_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DEVICE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DEVICE_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DEVICE_GET_CLASS(o : longint) : longint;

function gst_vulkan_device_get_type:TGType;cdecl;external;
{*
 * GST_VULKAN_DEVICE_CONTEXT_TYPE_STR:
 *
 * Since: 1.18
  }
const
  GST_VULKAN_DEVICE_CONTEXT_TYPE_STR = 'gst.vulkan.device';  
{*
 * GstVulkanDeviceForEachQueueFunc:
 *
 * Since: 1.18
  }
type

  TGstVulkanDeviceForEachQueueFunc = function (device:PGstVulkanDevice; queue:PGstVulkanQueue; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GstVulkanDevice:
 * @parent: the parent #GstObject
 * @instance: the #GstVulkanInstance this device was allocated with
 * @physical_device: the #GstVulkanPhysicalDevice this device was allocated with
 * @device: the vulkan device handle
 *
 * Since: 1.18
  }
{ hides a pointer  }
{ <private>  }
  PGstVulkanDevice = ^TGstVulkanDevice;
  TGstVulkanDevice = record
      parent : TGstObject;cdecl;
      instance : PGstVulkanInstance;
      physical_device : PGstVulkanPhysicalDevice;
      device : TVkDevice;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanDeviceClass:
 * @parent_class: the parent #GstObjectClass
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanDeviceClass = ^TGstVulkanDeviceClass;
  TGstVulkanDeviceClass = record
      parent_class : TGstObjectClass;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC          (GstVulkanDevice, gst_object_unref) }

function gst_vulkan_device_new(physical_device:PGstVulkanPhysicalDevice):PGstVulkanDevice;cdecl;external;
function gst_vulkan_device_new_with_index(instance:PGstVulkanInstance; device_index:Tguint):PGstVulkanDevice;cdecl;external;
function gst_vulkan_device_get_instance(device:PGstVulkanDevice):PGstVulkanInstance;cdecl;external;
function gst_vulkan_device_open(device:PGstVulkanDevice; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_vulkan_device_enable_extension(device:PGstVulkanDevice; name:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_vulkan_device_disable_extension(device:PGstVulkanDevice; name:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_vulkan_device_is_extension_enabled(device:PGstVulkanDevice; name:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_vulkan_device_enable_layer(device:PGstVulkanDevice; name:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_vulkan_device_is_layer_enabled(device:PGstVulkanDevice; name:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_vulkan_device_get_proc_address(device:PGstVulkanDevice; name:Pgchar):Tgpointer;cdecl;external;
procedure gst_vulkan_device_foreach_queue(device:PGstVulkanDevice; func:TGstVulkanDeviceForEachQueueFunc; user_data:Tgpointer);cdecl;external;
function gst_vulkan_device_get_queue(device:PGstVulkanDevice; queue_family:Tguint32; queue_i:Tguint32):PGstVulkanQueue;cdecl;external;
function gst_vulkan_device_queue_family_indices(device:PGstVulkanDevice):PGArray;cdecl;external;
function gst_vulkan_device_get_physical_device(device:PGstVulkanDevice):TVkPhysicalDevice;cdecl;external;
procedure gst_context_set_vulkan_device(context:PGstContext; device:PGstVulkanDevice);cdecl;external;
function gst_context_get_vulkan_device(context:PGstContext; device:PPGstVulkanDevice):Tgboolean;cdecl;external;
function gst_vulkan_device_handle_context_query(element:PGstElement; query:PGstQuery; device:PGstVulkanDevice):Tgboolean;cdecl;external;
function gst_vulkan_device_run_context_query(element:PGstElement; device:PPGstVulkanDevice):Tgboolean;cdecl;external;
function gst_vulkan_device_create_fence(device:PGstVulkanDevice; error:PPGError):PGstVulkanFence;cdecl;external;
function gst_vulkan_device_select_queue(device:PGstVulkanDevice; expected_flags:TVkQueueFlagBits):PGstVulkanQueue;cdecl;external;
{$endif}
{ __GST_VULKAN_DEVICE_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VULKAN_DEVICE : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_DEVICE:=gst_vulkan_device_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DEVICE(o : longint) : longint;
begin
  GST_VULKAN_DEVICE:=G_TYPE_CHECK_INSTANCE_CAST(o,GST_TYPE_VULKAN_DEVICE,GstVulkanDevice);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DEVICE_CLASS(k : longint) : longint;
begin
  GST_VULKAN_DEVICE_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,GST_TYPE_VULKAN_DEVICE,GstVulkanDeviceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DEVICE(o : longint) : longint;
begin
  GST_IS_VULKAN_DEVICE:=G_TYPE_CHECK_INSTANCE_TYPE(o,GST_TYPE_VULKAN_DEVICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_DEVICE_CLASS(k : longint) : longint;
begin
  GST_IS_VULKAN_DEVICE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,GST_TYPE_VULKAN_DEVICE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_DEVICE_GET_CLASS(o : longint) : longint;
begin
  GST_VULKAN_DEVICE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GST_TYPE_VULKAN_DEVICE,GstVulkanDeviceClass);
end;


end.
