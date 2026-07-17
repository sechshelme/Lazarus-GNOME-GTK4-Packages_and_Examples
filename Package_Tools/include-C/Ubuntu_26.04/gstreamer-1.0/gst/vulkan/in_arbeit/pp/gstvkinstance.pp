
unit gstvkinstance;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvkinstance.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkinstance.h
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
Pgchar  = ^gchar;
PGError  = ^GError;
PGstContext  = ^GstContext;
PGstElement  = ^GstElement;
PGstQuery  = ^GstQuery;
PGstVulkanDevice  = ^GstVulkanDevice;
PGstVulkanInstance  = ^GstVulkanInstance;
PGstVulkanInstanceClass  = ^GstVulkanInstanceClass;
Pguint  = ^guint;
Pguint32  = ^guint32;
PVkPhysicalDevice  = ^VkPhysicalDevice;
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
{$ifndef __GST_VULKAN_INSTANCE_H__}
{$define __GST_VULKAN_INSTANCE_H__}
{$include <gst/vulkan/vulkan.h>}

{ was #define dname def_expr }
function GST_TYPE_VULKAN_INSTANCE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_INSTANCE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_INSTANCE_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_INSTANCE(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_INSTANCE_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_INSTANCE_GET_CLASS(o : longint) : longint;

function gst_vulkan_instance_get_type:TGType;cdecl;external;
{*
 * GST_VULKAN_INSTANCE_CONTEXT_TYPE_STR:
 *
 * Since: 1.18
  }
const
  GST_VULKAN_INSTANCE_CONTEXT_TYPE_STR = 'gst.vulkan.instance';  
{*
 * GstVulkanInstance:
 * @parent: parent #GstObject
 * @instance: the Vulkan instance handle
 * @physical_devices: list of vulkan physical device handles
 * @n_physical_device: number of entries in @physical_devices
 *
 * Since: 1.18
  }
{ hides a pointer  }
{ hides a pointer  }
{ <private>  }
type
  PGstVulkanInstance = ^TGstVulkanInstance;
  TGstVulkanInstance = record
      parent : TGstObject;
      instance : TVkInstance;
      physical_devices : PVkPhysicalDevice;
      n_physical_devices : Tguint32;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstVulkanInstanceClass:
 * @parent_class: parent #GstObjectClass
 *
 * Since: 1.18
  }
{ <private>  }
  PGstVulkanInstanceClass = ^TGstVulkanInstanceClass;
  TGstVulkanInstanceClass = record
      parent_class : TGstObjectClass;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC          (GstVulkanInstance, gst_object_unref) }

function gst_vulkan_instance_new:PGstVulkanInstance;cdecl;external;
function gst_vulkan_instance_fill_info(instance:PGstVulkanInstance; error:PPGError):Tgboolean;cdecl;external;
function gst_vulkan_instance_open(instance:PGstVulkanInstance; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_vulkan_instance_get_proc_address(instance:PGstVulkanInstance; name:Pgchar):Tgpointer;cdecl;external;
function gst_vulkan_instance_create_device(instance:PGstVulkanInstance; error:PPGError):PGstVulkanDevice;cdecl;external;
function gst_vulkan_instance_create_device_with_index(instance:PGstVulkanInstance; device_index:Tguint; error:PPGError):PGstVulkanDevice;cdecl;external;
procedure gst_context_set_vulkan_instance(context:PGstContext; instance:PGstVulkanInstance);cdecl;external;
function gst_context_get_vulkan_instance(context:PGstContext; instance:PPGstVulkanInstance):Tgboolean;cdecl;external;
function gst_vulkan_instance_handle_context_query(element:PGstElement; query:PGstQuery; instance:PGstVulkanInstance):Tgboolean;cdecl;external;
function gst_vulkan_instance_run_context_query(element:PGstElement; instance:PPGstVulkanInstance):Tgboolean;cdecl;external;
function gst_vulkan_instance_check_version(instance:PGstVulkanInstance; major:Tguint; minor:Tguint; patch:Tguint):Tgboolean;cdecl;external;
procedure gst_vulkan_instance_get_version(instance:PGstVulkanInstance; major:Pguint; minor:Pguint; patch:Pguint);cdecl;external;
(* Const before type ignored *)
function gst_vulkan_instance_get_extension_info(instance:PGstVulkanInstance; name:Pgchar; spec_version:Pguint32):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_vulkan_instance_enable_extension(instance:PGstVulkanInstance; name:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_vulkan_instance_disable_extension(instance:PGstVulkanInstance; name:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_vulkan_instance_is_extension_enabled(instance:PGstVulkanInstance; name:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_vulkan_instance_get_layer_info(instance:PGstVulkanInstance; name:Pgchar; description:PPgchar; spec_version:Pguint32; implementation_version:Pguint32):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_vulkan_instance_enable_layer(instance:PGstVulkanInstance; name:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_vulkan_instance_is_layer_enabled(instance:PGstVulkanInstance; name:Pgchar):Tgboolean;cdecl;external;
procedure gst_vulkan_instance_get_api_version(instance:PGstVulkanInstance; major:Pguint; minor:Pguint; patch:Pguint);cdecl;external;
function gst_vulkan_instance_check_api_version(instance:PGstVulkanInstance; major:Tguint; minor:Tguint; patch:Tguint):Tgboolean;cdecl;external;
{$endif}
{ __GST_VULKAN_INSTANCE_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VULKAN_INSTANCE : longint; { return type might be wrong }
  begin
    GST_TYPE_VULKAN_INSTANCE:=gst_vulkan_instance_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_INSTANCE(o : longint) : longint;
begin
  GST_VULKAN_INSTANCE:=G_TYPE_CHECK_INSTANCE_CAST(o,GST_TYPE_VULKAN_INSTANCE,GstVulkanInstance);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_INSTANCE_CLASS(k : longint) : longint;
begin
  GST_VULKAN_INSTANCE_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,GST_TYPE_VULKAN_INSTANCE,GstVulkanInstanceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_INSTANCE(o : longint) : longint;
begin
  GST_IS_VULKAN_INSTANCE:=G_TYPE_CHECK_INSTANCE_TYPE(o,GST_TYPE_VULKAN_INSTANCE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VULKAN_INSTANCE_CLASS(k : longint) : longint;
begin
  GST_IS_VULKAN_INSTANCE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,GST_TYPE_VULKAN_INSTANCE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VULKAN_INSTANCE_GET_CLASS(o : longint) : longint;
begin
  GST_VULKAN_INSTANCE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GST_TYPE_VULKAN_INSTANCE,GstVulkanInstanceClass);
end;


end.
