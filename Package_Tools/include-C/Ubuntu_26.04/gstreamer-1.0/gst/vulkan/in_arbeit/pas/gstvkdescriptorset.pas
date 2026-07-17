unit gstvkdescriptorset;

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
{$ifndef __GST_VULKAN_DESCRIPTOR_SET_H__}
{$define __GST_VULKAN_DESCRIPTOR_SET_H__}
{$include <gst/gst.h>}
{$include <gst/vulkan/vulkan_fwd.h>}
{$include <gst/vulkan/gstvkapi.h>}
{*
 * gst_vulkan_descriptor_set_get_type:
 *
 * Since: 1.18
  }

function gst_vulkan_descriptor_set_get_type:TGType;cdecl;external libgstvulkan;
{*
 * GST_TYPE_VULKAN_DESCRIPTOR_SET:
 *
 * Since: 1.18
  }
type
{*
 * GstVulkanDescriptorSet:
 * @parent: the parent #GstMiniObject
 * @set: the vulkan descriptor set handle
 * @pool: the parent #GstVulkanDescriptorPool for pooling
 * @cache: the parent #GstVulkanDescriptorCache for reuse
 * @n_layouts: number of layouts applied to this descriptor set
 * @layouts: layouts applied to this descriptor set
 *
 * Since: 1.18
  }
{ <protected>  }
{ <private>  }
  PGstVulkanDescriptorSet = ^TGstVulkanDescriptorSet;
  TGstVulkanDescriptorSet = record
      parent : TGstMiniObject;
      set : TVkDescriptorSet;
      pool : PGstVulkanDescriptorPool;
      cache : PGstVulkanDescriptorCache;
      n_layouts : Tguint;
      layouts : ^PGstVulkanHandle;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{* xxxxxxx
static inline GstVulkanDescriptorSet* gst_vulkan_descriptor_set_ref(GstVulkanDescriptorSet* set);
static inline GstVulkanDescriptorSet *
gst_vulkan_descriptor_set_ref (GstVulkanDescriptorSet * set)

  return (GstVulkanDescriptorSet *) gst_mini_object_ref (GST_MINI_OBJECT_CAST (set));


static inline void gst_vulkan_descriptor_set_unref(GstVulkanDescriptorSet* set);
static inline void
gst_vulkan_descriptor_set_unref (GstVulkanDescriptorSet * set)

  gst_mini_object_unref (GST_MINI_OBJECT_CAST (set));


static inline void
gst_clear_vulkan_descriptor_set (GstVulkanDescriptorSet ** set_ptr)

  gst_clear_mini_object ((GstMiniObject **) set_ptr);

  }

function gst_vulkan_descriptor_set_new_wrapped(pool:PGstVulkanDescriptorPool; set:TVkDescriptorSet; n_layouts:Tguint; layouts:PPGstVulkanHandle):PGstVulkanDescriptorSet;cdecl;external libgstvulkan;
{////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC         (GstVulkanDescriptorSet, gst_vulkan_descriptor_set_unref); }
{$endif}
{ _GST_VULKAN_DESCRIPTOR_SET_H_  }

// === Konventiert am: 17-7-26 15:36:32 ===

function GST_TYPE_VULKAN_DESCRIPTOR_SET : TGType;

implementation

function GST_TYPE_VULKAN_DESCRIPTOR_SET : TGType;
  begin
    GST_TYPE_VULKAN_DESCRIPTOR_SET:=gst_vulkan_descriptor_set_get_type;
  end;



end.
