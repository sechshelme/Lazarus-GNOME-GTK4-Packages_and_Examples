/*
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
 */

#ifndef __GST_VULKAN_DESCRIPTOR_SET_H__
#define __GST_VULKAN_DESCRIPTOR_SET_H__

#include <gst/gst.h>

#include <gst/vulkan/vulkan_fwd.h>
#include <gst/vulkan/gstvkapi.h>



/**
 * gst_vulkan_descriptor_set_get_type:
 *
 * Since: 1.18
 */
extern
GType gst_vulkan_descriptor_set_get_type (void);
/**
 * GST_TYPE_VULKAN_DESCRIPTOR_SET:
 *
 * Since: 1.18
 */
#define GST_TYPE_VULKAN_DESCRIPTOR_SET (gst_vulkan_descriptor_set_get_type ())

typedef struct _GstVulkanDescriptorSet GstVulkanDescriptorSet;

/**
 * GstVulkanDescriptorSet:
 * @parent: the parent #GstMiniObject
 * @set: the vulkan descriptor set handle
 * @pool: the parent #GstVulkanDescriptorPool for pooling
 * @cache: the parent #GstVulkanDescriptorCache for reuse
 * @n_layouts: number of layouts applied to this descriptor set
 * @layouts: layouts applied to this descriptor set
 *
 * Since: 1.18
 */
struct _GstVulkanDescriptorSet
{
  GstMiniObject             parent;

  VkDescriptorSet           set;

  /* <protected> */
  GstVulkanDescriptorPool  *pool;
  GstVulkanDescriptorCache *cache;

  guint                     n_layouts;
  GstVulkanHandle         **layouts;

  /* <private> */
  gpointer _reserved        [GST_PADDING];
};

/** xxxxxxx
static inline GstVulkanDescriptorSet* gst_vulkan_descriptor_set_ref(GstVulkanDescriptorSet* set);
static inline GstVulkanDescriptorSet *
gst_vulkan_descriptor_set_ref (GstVulkanDescriptorSet * set)
{
  return (GstVulkanDescriptorSet *) gst_mini_object_ref (GST_MINI_OBJECT_CAST (set));
}

static inline void gst_vulkan_descriptor_set_unref(GstVulkanDescriptorSet* set);
static inline void
gst_vulkan_descriptor_set_unref (GstVulkanDescriptorSet * set)
{
  gst_mini_object_unref (GST_MINI_OBJECT_CAST (set));
}

static inline void
gst_clear_vulkan_descriptor_set (GstVulkanDescriptorSet ** set_ptr)
{
  gst_clear_mini_object ((GstMiniObject **) set_ptr);
}
 */

extern
GstVulkanDescriptorSet *    gst_vulkan_descriptor_set_new_wrapped       (GstVulkanDescriptorPool * pool,
                                                                         VkDescriptorSet set,
                                                                         guint n_layouts,
                                                                         GstVulkanHandle ** layouts) ;

//////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC         (GstVulkanDescriptorSet, gst_vulkan_descriptor_set_unref);



#endif /* _GST_VULKAN_DESCRIPTOR_SET_H_ */
