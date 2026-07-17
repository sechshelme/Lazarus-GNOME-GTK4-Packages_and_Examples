
unit gstvkdebug;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvkdebug.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkdebug.h
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
{$ifndef __GST_VULKAN_DEBUG_H__}
{$define __GST_VULKAN_DEBUG_H__}
{$include <gst/gst.h>}
{$include <vulkan/vulkan.h>}
{$include <gst/vulkan/vulkan-prelude.h>}
{*
 * GST_VULKAN_EXTENT3D_FORMAT:
 *
 * Since: 1.18
  }
{*
 * GST_VULKAN_EXTENT2D_ARGS:
 *
 * Since: 1.18
  }
(* Const before type ignored *)

function gst_vulkan_physical_device_type_to_string(_type:TVkPhysicalDeviceType):Pgchar;cdecl;external;
function gst_vulkan_memory_property_flags_to_string(prop_bits:TVkMemoryPropertyFlags):Pgchar;cdecl;external;
function gst_vulkan_memory_heap_flags_to_string(prop_bits:TVkMemoryHeapFlags):Pgchar;cdecl;external;
function gst_vulkan_queue_flags_to_string(queue_bits:TVkQueueFlags):Pgchar;cdecl;external;
function gst_vulkan_sample_count_flags_to_string(sample_count_bits:TVkSampleCountFlags):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_vulkan_present_mode_to_string(present_mode:TVkPresentModeKHR):Pgchar;cdecl;external;
{$endif}
{ __GST_VULKAN_DEBUG_H__  }

implementation


end.
