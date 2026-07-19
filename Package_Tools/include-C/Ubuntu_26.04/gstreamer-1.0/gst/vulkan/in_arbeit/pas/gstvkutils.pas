unit gstvkutils;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstvkdisplay, gstvkinstance, gstvkimageview, gstvkhandle;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
function gst_vulkan_ensure_element_data(element: PGstElement; display_ptr: PPGstVulkanDisplay; instance_ptr: PPGstVulkanInstance): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_ensure_element_device(element: PGstElement; instance: PGstVulkanInstance; device_ptr: PPGstVulkanDevice; device_id: Tguint): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_handle_set_context(element: PGstElement; context: PGstContext; display: PPGstVulkanDisplay; instance: PPGstVulkanInstance): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_handle_context_query(element: PGstElement; query: PGstQuery; display: PGstVulkanDisplay; instance: PGstVulkanInstance; device: PGstVulkanDevice): Tgboolean; cdecl; external libgstvulkan;
procedure gst_vulkan_global_context_query(element: PGstElement; context_type: Pgchar); cdecl; external libgstvulkan;
function gst_vulkan_local_context_query(element: PGstElement; context_type: Pgchar): PGstQuery; cdecl; external libgstvulkan;
function gst_vulkan_run_query(element: PGstElement; query: PGstQuery; direction: TGstPadDirection): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_get_or_create_image_view(image: PGstVulkanImageMemory): PGstVulkanImageView; cdecl; external libgstvulkan;
function gst_vulkan_get_or_create_image_view_with_info(image: PGstVulkanImageMemory; create_info: PVkImageViewCreateInfo): PGstVulkanImageView; cdecl; external libgstvulkan;
function gst_vulkan_create_shader(device: PGstVulkanDevice; code: Pgchar; size: Tgsize; error: PPGError): PGstVulkanHandle; cdecl; external libgstvulkan;
{$ENDIF read_function}

// === Konventiert am: 17-7-26 15:49:35 ===


implementation



end.
