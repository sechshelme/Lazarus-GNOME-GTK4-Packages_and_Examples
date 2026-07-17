unit gstvkimageview;

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
{$ifndef __GST_VULKAN_IMAGE_VIEW_H__}
{$define __GST_VULKAN_IMAGE_VIEW_H__}
{$include <gst/vulkan/gstvkbarrier.h>}
{*
 * GST_TYPE_VULKAN_IMAGE_VIEW:
 *
 * Since: 1.18
  }

{*
 * gst_vulkan_image_view_get_type:
 *
 * Since: 1.18
  }
function gst_vulkan_image_view_get_type:TGType;cdecl;external libgstvulkan;
{*
 * GstVulkanImageView:
 * @parent: the parent #GstMiniObject
 * @device: the #GstVulkanDevice
 * @image: the associated #GstVulkanImageMemory for this view
 * @view: the vulkan image view handle
 * @create_info: the creation information for this view
 *
 * Since: 1.18
  }
{ <private>  }
type
  PGstVulkanImageView = ^TGstVulkanImageView;
  TGstVulkanImageView = record
      parent : TGstMiniObject;
      device : PGstVulkanDevice;
      image : PGstVulkanImageMemory;
      view : TVkImageView;
      create_info : TVkImageViewCreateInfo;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
static inline GstVulkanImageView* gst_vulkan_image_view_ref(GstVulkanImageView* trash);
static inline GstVulkanImageView *
gst_vulkan_image_view_ref (GstVulkanImageView * trash)

  return (GstVulkanImageView *) gst_mini_object_ref (GST_MINI_OBJECT_CAST (trash));


static inline void gst_vulkan_image_view_unref(GstVulkanImageView* trash);
static inline void
gst_vulkan_image_view_unref (GstVulkanImageView * trash)

  gst_mini_object_unref (GST_MINI_OBJECT_CAST (trash));


static inline void
gst_clear_vulkan_image_view (GstVulkanImageView ** view_ptr)

  gst_clear_mini_object ((GstMiniObject **) view_ptr);

 }
{////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC         (GstVulkanImageView, gst_vulkan_image_view_unref) }

function gst_vulkan_image_view_new(image:PGstVulkanImageMemory; create_info:PVkImageViewCreateInfo):PGstVulkanImageView;cdecl;external libgstvulkan;
{$endif}
{ __GST_VULKAN_IMAGE_MEMORY_H__  }

// === Konventiert am: 17-7-26 15:47:15 ===

function GST_TYPE_VULKAN_IMAGE_VIEW : TGType;

implementation

function GST_TYPE_VULKAN_IMAGE_VIEW : TGType;
  begin
    GST_TYPE_VULKAN_IMAGE_VIEW:=gst_vulkan_image_view_get_type;
  end;



end.
