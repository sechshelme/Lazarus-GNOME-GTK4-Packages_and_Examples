  {$IFDEF read_interface}

type
  PGstVulkanVideoOperation = ^TGstVulkanVideoOperation;
  TGstVulkanVideoOperation = longint;

const
  GST_VULKAN_VIDEO_OPERATION_DECODE = 0;
  GST_VULKAN_VIDEO_OPERATION_ENCODE = (0) + 1;
  GST_VULKAN_VIDEO_OPERATION_UNKNOWN = (0) + 2;

function gst_vulkan_video_profile_to_caps(profile: PGstVulkanVideoProfile): PGstCaps; cdecl; external libgstvulkan;
function gst_vulkan_video_profile_from_caps(profile: PGstVulkanVideoProfile; caps: PGstCaps; video_operation: TGstVulkanVideoOperation): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_video_profile_is_valid(profile: PGstVulkanVideoProfile; codec: Tguint): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_video_profile_is_equal(a: PGstVulkanVideoProfile; b: PGstVulkanVideoProfile): Tgboolean; cdecl; external libgstvulkan;

// === Konventiert am: 10-10-24 15:48:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
