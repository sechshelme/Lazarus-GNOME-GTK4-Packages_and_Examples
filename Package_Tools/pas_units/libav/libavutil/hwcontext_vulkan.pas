unit hwcontext_vulkan;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  }
{$ifndef AVUTIL_HWCONTEXT_VULKAN_H}
{$define AVUTIL_HWCONTEXT_VULKAN_H}
{$if defined(_WIN32) && !defined(VK_USE_PLATFORM_WIN32_KHR)}
{$define VK_USE_PLATFORM_WIN32_KHR}
{$endif}
{$include <vulkan/vulkan.h>}
{$include "pixfmt.h"}
{$include "frame.h"}
type
{*
 * @file
 * API-specific header for AV_HWDEVICE_TYPE_VULKAN.
 *
 * For user-allocated pools, AVHWFramesContext.pool must return AVBufferRefs
 * with the data pointer set to an AVVkFrame.
  }
{*
 * Main Vulkan context, allocated as AVHWDeviceContext.hwctx.
 * All of these can be set before init to change what the context uses
  }
{*
     * Custom memory allocator, else NULL
      }
{*
     * Pointer to the instance-provided vkGetInstanceProcAddr loading function.
     * If NULL, will pick either libvulkan or libvolk, depending on libavutil's
     * compilation settings, and set this field.
      }
{*
     * Vulkan instance. Must be at least version 1.3.
      }
{*
     * Physical device
      }
{*
     * Active device
      }
{*
     * This structure should be set to the set of features that present and enabled
     * during device creation. When a device is created by FFmpeg, it will default to
     * enabling all that are present of the shaderImageGatherExtended,
     * fragmentStoresAndAtomics, shaderInt64 and vertexPipelineStoresAndAtomics features.
      }
{*
     * Enabled instance extensions.
     * If supplying your own device context, set this to an array of strings, with
     * each entry containing the specified Vulkan extension string to enable.
     * Duplicates are possible and accepted.
     * If no extensions are enabled, set these fields to NULL, and 0 respectively.
      }
{*
     * Enabled device extensions. By default, VK_KHR_external_memory_fd,
     * VK_EXT_external_memory_dma_buf, VK_EXT_image_drm_format_modifier,
     * VK_KHR_external_semaphore_fd and VK_EXT_external_memory_host are enabled if found.
     * If supplying your own device context, these fields takes the same format as
     * the above fields, with the same conditions that duplicates are possible
     * and accepted, and that NULL and 0 respectively means no extensions are enabled.
      }
{*
     * Queue family index for graphics operations, and the number of queues
     * enabled for it. If unavaiable, will be set to -1. Not required.
     * av_hwdevice_create() will attempt to find a dedicated queue for each
     * queue family, or pick the one with the least unrelated flags set.
     * Queue indices here may overlap if a queue has to share capabilities.
      }
{*
     * Queue family index for transfer operations and the number of queues
     * enabled. Required.
      }
{*
     * Queue family index for compute operations and the number of queues
     * enabled. Required.
      }
{*
     * Queue family index for video encode ops, and the amount of queues enabled.
     * If the device doesn't support such, queue_family_encode_index will be -1.
     * Not required.
      }
{*
     * Queue family index for video decode ops, and the amount of queues enabled.
     * If the device doesn't support such, queue_family_decode_index will be -1.
     * Not required.
      }
{*
     * Locks a queue, preventing other threads from submitting any command
     * buffers to this queue.
     * If set to NULL, will be set to lavu-internal functions that utilize a
     * mutex.
      }
{*
     * Similar to lock_queue(), unlocks a queue. Must only be called after locking.
      }

  PAVVulkanDeviceContext = ^TAVVulkanDeviceContext;
  TAVVulkanDeviceContext = record
      alloc : PVkAllocationCallbacks;
      get_proc_addr : TPFN_vkGetInstanceProcAddr;
      inst : TVkInstance;
      phys_dev : TVkPhysicalDevice;
      act_dev : TVkDevice;
      device_features : TVkPhysicalDeviceFeatures2;
      enabled_inst_extensions : ^Pchar;
      nb_enabled_inst_extensions : longint;
      enabled_dev_extensions : ^Pchar;
      nb_enabled_dev_extensions : longint;
      queue_family_index : longint;
      nb_graphics_queues : longint;
      queue_family_tx_index : longint;
      nb_tx_queues : longint;
      queue_family_comp_index : longint;
      nb_comp_queues : longint;
      queue_family_encode_index : longint;
      nb_encode_queues : longint;
      queue_family_decode_index : longint;
      nb_decode_queues : longint;
      lock_queue : procedure (ctx:PAVHWDeviceContext; queue_family:Tuint32_t; index:Tuint32_t);cdecl;
      unlock_queue : procedure (ctx:PAVHWDeviceContext; queue_family:Tuint32_t; index:Tuint32_t);cdecl;
    end;
{*
 * Defines the behaviour of frame allocation.
  }
{ Unless this flag is set, autodetected flags will be OR'd based on the
     * device and tiling during av_hwframe_ctx_init().  }
{$if FF_API_VULKAN_CONTIGUOUS_MEMORY}
{ DEPRECATED: does nothing. Replaced by multiplane images.  }
{$endif}
{ Disables multiplane images.
     * This is required to export/import images from CUDA.  }
type
  PAVVkFrameFlags = ^TAVVkFrameFlags;
  TAVVkFrameFlags =  Longint;
  Const
    AV_VK_FRAME_FLAG_NONE = 1 shl 0;
    AV_VK_FRAME_FLAG_CONTIGUOUS_MEMORY = 1 shl 1;
    AV_VK_FRAME_FLAG_DISABLE_MULTIPLANE = 1 shl 2;
;
{*
 * Allocated as AVHWFramesContext.hwctx, used to set pool-specific options
  }
{*
     * Controls the tiling of allocated frames.
     * If left as VK_IMAGE_TILING_OPTIMAL (0), will use optimal tiling.
     * Can be set to VK_IMAGE_TILING_LINEAR to force linear images,
     * or VK_IMAGE_TILING_DRM_FORMAT_MODIFIER_EXT to force DMABUF-backed
     * images.
     * @note Imported frames from other APIs ignore this.
      }
{*
     * Defines extra usage of output frames. If non-zero, all flags MUST be
     * supported by the VkFormat. Otherwise, will use supported flags amongst:
     * - VK_IMAGE_USAGE_SAMPLED_BIT
     * - VK_IMAGE_USAGE_STORAGE_BIT
     * - VK_IMAGE_USAGE_TRANSFER_SRC_BIT
     * - VK_IMAGE_USAGE_TRANSFER_DST_BIT
      }
{*
     * Extension data for image creation.
     * If DRM tiling is used, a VkImageDrmFormatModifierListCreateInfoEXT structure
     * can be added to specify the exact modifier to use.
     *
     * Additional structures may be added at av_hwframe_ctx_init() time,
     * which will be freed automatically on uninit(), so users must only free
     * any structures they've allocated themselves.
      }
{*
     * Extension data for memory allocation. Must have as many entries as
     * the number of planes of the sw_format.
     * This will be chained to VkExportMemoryAllocateInfo, which is used
     * to make all pool images exportable to other APIs if the necessary
     * extensions are present in enabled_dev_extensions.
      }
{*
     * A combination of AVVkFrameFlags. Unless AV_VK_FRAME_FLAG_NONE is set,
     * autodetected flags will be OR'd based on the device and tiling during
     * av_hwframe_ctx_init().
      }
{*
     * Flags to set during image creation. If unset, defaults to
     * VK_IMAGE_CREATE_ALIAS_BIT.
      }
{*
     * Vulkan format for each image. MUST be compatible with the pixel format.
     * If unset, will be automatically set.
     * There are at most two compatible formats for a frame - a multiplane
     * format, and a single-plane multi-image format.
      }
{*
     * Number of layers each image will have.
      }
{*
     * Locks a frame, preventing other threads from changing frame properties.
     * Users SHOULD only ever lock just before command submission in order
     * to get accurate frame properties, and unlock immediately after command
     * submission without waiting for it to finish.
     *
     * If unset, will be set to lavu-internal functions that utilize a mutex.
      }
{*
     * Similar to lock_frame(), unlocks a frame. Must only be called after locking.
      }
type
  PAVVulkanFramesContext = ^TAVVulkanFramesContext;
  TAVVulkanFramesContext = record
      tiling : TVkImageTiling;
      usage : TVkImageUsageFlagBits;
      create_pnext : pointer;
      alloc_pnext : array[0..(AV_NUM_DATA_POINTERS)-1] of pointer;
      flags : TAVVkFrameFlags;
      img_flags : TVkImageCreateFlags;
      format : array[0..(AV_NUM_DATA_POINTERS)-1] of TVkFormat;
      nb_layers : longint;
      lock_frame : procedure (fc:PAVHWFramesContext; vkf:PAVVkFrame);cdecl;
      unlock_frame : procedure (fc:PAVHWFramesContext; vkf:PAVVkFrame);cdecl;
    end;
{
 * Frame structure.
 *
 * @note the size of this structure is not part of the ABI, to allocate
 * you must use @av_vk_frame_alloc().
  }
{*
     * Vulkan images to which the memory is bound to.
     * May be one for multiplane formats, or multiple.
      }
{*
     * Tiling for the frame.
      }
{*
     * Memory backing the images. Either one, or as many as there are planes
     * in the sw_format.
     * In case of having multiple VkImages, but one memory, the offset field
     * will indicate the bound offset for each image.
      }
{*
     * OR'd flags for all memory allocated
      }
{*
     * Updated after every barrier. One per VkImage.
      }
{*
     * Synchronization timeline semaphores, one for each VkImage.
     * Must not be freed manually. Must be waited on at every submission using
     * the value in sem_value, and must be signalled at every submission,
     * using an incremented value.
      }
{*
     * Up to date semaphore value at which each image becomes accessible.
     * One per VkImage.
     * Clients must wait on this value when submitting a command queue,
     * and increment it when signalling.
      }
{*
     * Internal data.
      }
{*
     * Describes the binding offset of each image to the VkDeviceMemory.
     * One per VkImage.
      }
{*
     * Queue family of the images. Must be VK_QUEUE_FAMILY_IGNORED if
     * the image was allocated with the CONCURRENT concurrency option.
     * One per VkImage.
      }
  PAVVkFrame = ^TAVVkFrame;
  TAVVkFrame = record
      img : array[0..(AV_NUM_DATA_POINTERS)-1] of TVkImage;
      tiling : TVkImageTiling;
      mem : array[0..(AV_NUM_DATA_POINTERS)-1] of TVkDeviceMemory;
      size : array[0..(AV_NUM_DATA_POINTERS)-1] of Tsize_t;
      flags : TVkMemoryPropertyFlagBits;
      access : array[0..(AV_NUM_DATA_POINTERS)-1] of TVkAccessFlagBits;
      layout : array[0..(AV_NUM_DATA_POINTERS)-1] of TVkImageLayout;
      sem : array[0..(AV_NUM_DATA_POINTERS)-1] of TVkSemaphore;
      sem_value : array[0..(AV_NUM_DATA_POINTERS)-1] of Tuint64_t;
      internal : PAVVkFrameInternal;
      offset : array[0..(AV_NUM_DATA_POINTERS)-1] of Tptrdiff_t;
      queue_family : array[0..(AV_NUM_DATA_POINTERS)-1] of Tuint32_t;
    end;

{*
 * Allocates a single AVVkFrame and initializes everything as 0.
 * @note Must be freed via av_free()
  }

function av_vk_frame_alloc:PAVVkFrame;cdecl;external libavutil;
{*
 * Returns the optimal per-plane Vulkan format for a given sw_format,
 * one for each plane.
 * Returns NULL on unsupported formats.
  }
function av_vkfmt_from_pixfmt(p:TAVPixelFormat):PVkFormat;cdecl;external libavutil;
{$endif}
{ AVUTIL_HWCONTEXT_VULKAN_H  }

// === Konventiert am: 14-12-25 17:14:44 ===


implementation



end.
