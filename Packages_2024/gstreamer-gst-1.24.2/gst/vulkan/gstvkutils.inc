
{$IFDEF read_interface}

function gst_vulkan_ensure_element_data(element: PGstElement; display_ptr: PPGstVulkanDisplay; instance_ptr: PPGstVulkanInstance): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_handle_set_context(element: PGstElement; context: PGstContext; display: PPGstVulkanDisplay; instance: PPGstVulkanInstance): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_handle_context_query(element: PGstElement; query: PGstQuery; display: PGstVulkanDisplay; instance: PGstVulkanInstance; device: PGstVulkanDevice): Tgboolean; cdecl; external libgstvulkan;
procedure gst_vulkan_global_context_query(element: PGstElement; context_type: Pgchar); cdecl; external libgstvulkan;
function gst_vulkan_local_context_query(element: PGstElement; context_type: Pgchar): PGstQuery; cdecl; external libgstvulkan;
function gst_vulkan_run_query(element: PGstElement; query: PGstQuery; direction: TGstPadDirection): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_get_or_create_image_view(image: PGstVulkanImageMemory): PGstVulkanImageView; cdecl; external libgstvulkan;
function gst_vulkan_get_or_create_image_view_with_info(image: PGstVulkanImageMemory; create_info: PVkImageViewCreateInfo): PGstVulkanImageView; cdecl; external libgstvulkan;
function gst_vulkan_create_shader(device: PGstVulkanDevice; code: Pgchar; size: Tgsize; error: PPGError): PGstVulkanHandle; cdecl; external libgstvulkan;

// === Konventiert am: 10-10-24 17:09:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
