unit gstvkformat;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2016 Matthew Waters <matthew@centricular.com>
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
{$ifndef __GST_VULKAN_FORMAT_H__}
{$define __GST_VULKAN_FORMAT_H__}
{$include <gst/vulkan/vulkan.h>}
{$include <gst/video/video.h>}
type
{*
 * GST_VULKAN_MAX_COMPONENTS:
 *
 * Since: 1.18
  }

const
  GST_VULKAN_MAX_COMPONENTS = 4;  
{*
 * GstVulkanFormatScaling:
 * @GST_VULKAN_FORMAT_SCALING_UNORM: [0, 2^n - 1] -> [0.0, 1.0]
 * @GST_VULKAN_FORMAT_SCALING_SNORM: [-2^(n-1), 2^(n-1) - 1] -> [-1.0, 1.0]
 * @GST_VULKAN_FORMAT_SCALING_USCALED: [0, 2^n - 1] -> [0.0, float(2^n - 1)]
 * @GST_VULKAN_FORMAT_SCALING_SSCALED: [-2^(n-1), 2^(n-1) - 1] -> [float(-2^(n-1)), float(2^(n-1) - 1)]
 * @GST_VULKAN_FORMAT_SCALING_UINT: [0, 2^n - 1] -> [0, 2^n - 1]
 * @GST_VULKAN_FORMAT_SCALING_SINT: [-2^(n-1), 2^(n-1) - 1] -> [-2^(n-1), 2^(n-1) - 1]
 * @GST_VULKAN_FORMAT_SCALING_SRGB: @GST_VULKAN_FORMAT_SCALING_UNORM but the first three components are gamma corrected for the sRGB colour space.
 *
 * Since: 1.18
  }
type
  PGstVulkanFormatScaling = ^TGstVulkanFormatScaling;
  TGstVulkanFormatScaling =  Longint;
  Const
    GST_VULKAN_FORMAT_SCALING_UNORM = 1;
    GST_VULKAN_FORMAT_SCALING_SNORM = 2;
    GST_VULKAN_FORMAT_SCALING_USCALED = 3;
    GST_VULKAN_FORMAT_SCALING_SSCALED = 4;
    GST_VULKAN_FORMAT_SCALING_UINT = 5;
    GST_VULKAN_FORMAT_SCALING_SINT = 6;
    GST_VULKAN_FORMAT_SCALING_SRGB = 7;
;
{*
 * GstVulkanFormatFlags:
 * @GST_VULKAN_FORMAT_FLAG_YUV: is a YUV format
 * @GST_VULKAN_FORMAT_FLAG_RGB: is a RGB format
 * @GST_VULKAN_FORMAT_FLAG_ALPHA: has an alpha channel
 * @GST_VULKAN_FORMAT_FLAG_LE: data is stored in little-endiate byte order
 * @GST_VULKAN_FORMAT_FLAG_COMPLEX: data is stored complex and cannot be read/write only using the information in the #GstVulkanFormatInfo
 *
 * Since: 1.18
  }
type
  PGstVulkanFormatFlags = ^TGstVulkanFormatFlags;
  TGstVulkanFormatFlags =  Longint;
  Const
    GST_VULKAN_FORMAT_FLAG_YUV = 1 shl 0;
    GST_VULKAN_FORMAT_FLAG_RGB = 1 shl 1;
    GST_VULKAN_FORMAT_FLAG_ALPHA = 1 shl 2;
    GST_VULKAN_FORMAT_FLAG_LE = 1 shl 3;
    GST_VULKAN_FORMAT_FLAG_COMPLEX = 1 shl 4;
;
{*
 * GstVulkanFormatInfo:
 * @format: the Vulkan format being described
 * @name: name of this format
 * @scaling: how raw data is interpreted and scaled
 * @flags: flags that apply to this format
 * @bits: The number of bits used to pack data items. This can be less than
 *        8 when multiple pixels are stored in a byte. for values > 8 multiple
 *        bytes should be read according to the endianness flag before
 *        applying the shift and mask.
 * @n_components; number of components in this format
 * @shift: the number of bits to shift away to get the component data
 * @depth: the depth in bits for each component
 * @n_planes: the number of planes for this format. The number of planes can
 *            be less than the amount of components when multiple components
 *            are packed into one plane.
 * @plane: the plane number where a component can be found
 * @poffset: the offset in the plane where the first pixel of the components
 *           can be found.
 * @w_sub: subsampling factor of the width for the component.
 *         Use GST_VIDEO_SUB_SCALE to scale a width.
 * @h_sub: subsampling factor of the height for the component.
 *         Use GST_VIDEO_SUB_SCALE to scale a height.
 *
 * Since: 1.18
  }
{*
   * GstVulkanFormatInfo.aspect:
   *
   * image aspect of this format
   *
   * Since: 1.24
    }
type
  PGstVulkanFormatInfo = ^TGstVulkanFormatInfo;
  TGstVulkanFormatInfo = record
      format : TVkFormat;
      name : Pgchar;
      scaling : TGstVulkanFormatScaling;
      flags : TGstVulkanFormatFlags;
      bits : Tguint;
      n_components : Tguint;
      shift : array[0..(GST_VULKAN_MAX_COMPONENTS)-1] of Tguint8;
      depth : array[0..(GST_VULKAN_MAX_COMPONENTS)-1] of Tguint8;
      pixel_stride : array[0..(GST_VULKAN_MAX_COMPONENTS)-1] of Tgint8;
      n_planes : Tguint;
      plane : array[0..(GST_VULKAN_MAX_COMPONENTS)-1] of Tguint8;
      poffset : array[0..(GST_VULKAN_MAX_COMPONENTS)-1] of Tguint8;
      w_sub : array[0..(GST_VULKAN_MAX_COMPONENTS)-1] of Tguint8;
      h_sub : array[0..(GST_VULKAN_MAX_COMPONENTS)-1] of Tguint8;
      aspect : TVkImageAspectFlags;
    end;

{*
 * GstVulkanFormatMap:
 * @format: the GStreamer video format
 * @vkfrmt: the Vulkan format with a single memory
 * @vkfrmts: Vulkan formats for multiple memories
 *
 * Since: 1.26
  }
  PGstVulkanFormatMap = ^TGstVulkanFormatMap;
  TGstVulkanFormatMap = record
      format : TGstVideoFormat;
      vkfrmt : TVkFormat;
      vkfrmts : array[0..(GST_VIDEO_MAX_PLANES)-1] of TVkFormat;
    end;


function gst_vulkan_format_get_info(format:TVkFormat):PGstVulkanFormatInfo;cdecl;external libgstvulkan;
function gst_vulkan_format_get_map(format:TGstVideoFormat):PGstVulkanFormatMap;cdecl;external libgstvulkan;
function gst_vulkan_format_get_aspect(format:TVkFormat):Tguint;cdecl;external libgstvulkan;
function gst_vulkan_format_from_video_info(v_info:PGstVideoInfo; plane:Tguint):TVkFormat;cdecl;external libgstvulkan;
function gst_vulkan_format_from_video_info_2(device:PGstVulkanDevice; info:PGstVideoInfo; tiling:TVkImageTiling; no_multiplane:Tgboolean; requested_usage:TVkImageUsageFlags; 
           fmts:array[0..(GST_VIDEO_MAX_PLANES)-1] of TVkFormat; n_imgs:Plongint; usage:PVkImageUsageFlags):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_format_to_video_format(vk_format:TVkFormat):TGstVideoFormat;cdecl;external libgstvulkan;
{$endif}
{ __GST_VULKAN_FORMAT_H__  }

// === Konventiert am: 17-7-26 15:42:50 ===


implementation



end.
