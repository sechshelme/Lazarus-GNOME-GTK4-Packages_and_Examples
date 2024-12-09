
{$IFDEF read_interface}

const
  GST_VULKAN_MAX_COMPONENTS = 4;

type
  PGstVulkanFormatScaling = ^TGstVulkanFormatScaling;
  TGstVulkanFormatScaling = longint;

const
  GST_VULKAN_FORMAT_SCALING_UNORM = 1;
  GST_VULKAN_FORMAT_SCALING_SNORM = 2;
  GST_VULKAN_FORMAT_SCALING_USCALED = 3;
  GST_VULKAN_FORMAT_SCALING_SSCALED = 4;
  GST_VULKAN_FORMAT_SCALING_UINT = 5;
  GST_VULKAN_FORMAT_SCALING_SINT = 6;
  GST_VULKAN_FORMAT_SCALING_SRGB = 7;

type
  PGstVulkanFormatFlags = ^TGstVulkanFormatFlags;
  TGstVulkanFormatFlags = longint;

const
  GST_VULKAN_FORMAT_FLAG_YUV = 1 shl 0;
  GST_VULKAN_FORMAT_FLAG_RGB = 1 shl 1;
  GST_VULKAN_FORMAT_FLAG_ALPHA = 1 shl 2;
  GST_VULKAN_FORMAT_FLAG_LE = 1 shl 3;
  GST_VULKAN_FORMAT_FLAG_COMPLEX = 1 shl 4;

type
  TGstVulkanFormatInfo = record
    format: TVkFormat;
    Name: Pgchar;
    scaling: TGstVulkanFormatScaling;
    flags: TGstVulkanFormatFlags;
    bits: Tguint;
    n_components: Tguint;
    shift: array[0..(GST_VULKAN_MAX_COMPONENTS) - 1] of Tguint8;
    depth: array[0..(GST_VULKAN_MAX_COMPONENTS) - 1] of Tguint8;
    pixel_stride: array[0..(GST_VULKAN_MAX_COMPONENTS) - 1] of Tgint8;
    n_planes: Tguint;
    plane: array[0..(GST_VULKAN_MAX_COMPONENTS) - 1] of Tguint8;
    poffset: array[0..(GST_VULKAN_MAX_COMPONENTS) - 1] of Tguint8;
    w_sub: array[0..(GST_VULKAN_MAX_COMPONENTS) - 1] of Tguint8;
    h_sub: array[0..(GST_VULKAN_MAX_COMPONENTS) - 1] of Tguint8;
    aspect: TVkImageAspectFlags;
  end;
  PGstVulkanFormatInfo = ^TGstVulkanFormatInfo;

function gst_vulkan_format_get_info(format: TVkFormat): PGstVulkanFormatInfo; cdecl; external libgstvulkan;
function gst_vulkan_format_get_aspect(format: TVkFormat): Tguint; cdecl; external libgstvulkan;
function gst_vulkan_format_from_video_info(v_info: PGstVideoInfo; plane: Tguint): TVkFormat; cdecl; external libgstvulkan;
function gst_vulkan_format_from_video_info_2(physical_device: PGstVulkanPhysicalDevice; info: PGstVideoInfo; tiling: TVkImageTiling; no_multiplane: Tgboolean; requested_usage: TVkImageUsageFlags;
  fmts: Tplanes_TVKFormat_arr; n_imgs: Plongint; usage: PVkImageUsageFlags): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_format_to_video_format(vk_format: TVkFormat): TGstVideoFormat; cdecl; external libgstvulkan;

// === Konventiert am: 10-10-24 17:10:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
