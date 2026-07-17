
unit gstvkutils;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvkutils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkutils.h
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
PGstVulkanDisplay  = ^GstVulkanDisplay;
PGstVulkanHandle  = ^GstVulkanHandle;
PGstVulkanImageMemory  = ^GstVulkanImageMemory;
PGstVulkanImageView  = ^GstVulkanImageView;
PGstVulkanInstance  = ^GstVulkanInstance;
PVkImageViewCreateInfo  = ^VkImageViewCreateInfo;
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
{$ifndef _VK_UTILS_H_}
{$define _VK_UTILS_H_}
{$include <gst/gst.h>}
{$include <gst/vulkan/vulkan.h>}

function gst_vulkan_ensure_element_data(element:PGstElement; display_ptr:PPGstVulkanDisplay; instance_ptr:PPGstVulkanInstance):Tgboolean;cdecl;external;
function gst_vulkan_ensure_element_device(element:PGstElement; instance:PGstVulkanInstance; device_ptr:PPGstVulkanDevice; device_id:Tguint):Tgboolean;cdecl;external;
function gst_vulkan_handle_set_context(element:PGstElement; context:PGstContext; display:PPGstVulkanDisplay; instance:PPGstVulkanInstance):Tgboolean;cdecl;external;
function gst_vulkan_handle_context_query(element:PGstElement; query:PGstQuery; display:PGstVulkanDisplay; instance:PGstVulkanInstance; device:PGstVulkanDevice):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure gst_vulkan_global_context_query(element:PGstElement; context_type:Pgchar);cdecl;external;
(* Const before type ignored *)
function gst_vulkan_local_context_query(element:PGstElement; context_type:Pgchar):PGstQuery;cdecl;external;
function gst_vulkan_run_query(element:PGstElement; query:PGstQuery; direction:TGstPadDirection):Tgboolean;cdecl;external;
function gst_vulkan_get_or_create_image_view(image:PGstVulkanImageMemory):PGstVulkanImageView;cdecl;external;
(* Const before type ignored *)
function gst_vulkan_get_or_create_image_view_with_info(image:PGstVulkanImageMemory; create_info:PVkImageViewCreateInfo):PGstVulkanImageView;cdecl;external;
(* Const before type ignored *)
function gst_vulkan_create_shader(device:PGstVulkanDevice; code:Pgchar; size:Tgsize; error:PPGError):PGstVulkanHandle;cdecl;external;
{$endif}
{_VK_UTILS_H_  }

implementation


end.
