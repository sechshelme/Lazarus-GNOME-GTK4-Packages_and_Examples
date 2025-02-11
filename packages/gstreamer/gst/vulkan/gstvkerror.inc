
{$IFDEF read_interface}

function gst_vulkan_error_quark: TGQuark; cdecl; external libgstvulkan;
function gst_vulkan_result_to_string(Result: TVkResult): pansichar; cdecl; external libgstvulkan;

type
  PGstVulkanError = ^TGstVulkanError;
  TGstVulkanError = longint;

const
  GST_VULKAN_FAILED = 0;

function gst_vulkan_error_to_g_error(Result: TVkResult; error: PPGError; format: pansichar): TVkResult; varargs; cdecl; external libgstvulkan;

function GST_VULKAN_ERROR : TGQuark;

// === Konventiert am: 10-10-24 16:11:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_VULKAN_ERROR: TGQuark;
  begin
    GST_VULKAN_ERROR:=gst_vulkan_error_quark;
  end;


{$ENDIF read_implementation}
