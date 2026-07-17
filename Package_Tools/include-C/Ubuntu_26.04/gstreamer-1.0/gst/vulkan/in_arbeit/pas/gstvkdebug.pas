unit gstvkdebug;

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

function gst_vulkan_physical_device_type_to_string(_type:TVkPhysicalDeviceType):Pgchar;cdecl;external libgstvulkan;
function gst_vulkan_memory_property_flags_to_string(prop_bits:TVkMemoryPropertyFlags):Pgchar;cdecl;external libgstvulkan;
function gst_vulkan_memory_heap_flags_to_string(prop_bits:TVkMemoryHeapFlags):Pgchar;cdecl;external libgstvulkan;
function gst_vulkan_queue_flags_to_string(queue_bits:TVkQueueFlags):Pgchar;cdecl;external libgstvulkan;
function gst_vulkan_sample_count_flags_to_string(sample_count_bits:TVkSampleCountFlags):Pgchar;cdecl;external libgstvulkan;
function gst_vulkan_present_mode_to_string(present_mode:TVkPresentModeKHR):Pgchar;cdecl;external libgstvulkan;
{$endif}
{ __GST_VULKAN_DEBUG_H__  }

// === Konventiert am: 17-7-26 15:37:02 ===


implementation



end.
