

  {$IFDEF read_enum}
type
  PGstVulkanError = ^TGstVulkanError;
  TGstVulkanError = longint;
const
  GST_VULKAN_FAILED = 0;
  {$ENDIF read_enum}

{$IFDEF read_function}
function gst_vulkan_error_quark: TGQuark; cdecl; external libgstvulkan;
function gst_vulkan_result_to_string(result: TVkResult): pchar; cdecl; external libgstvulkan;
function gst_vulkan_error_to_g_error(result: TVkResult; error: PPGError; format: pchar; args: array of const): TVkResult; cdecl; external libgstvulkan;
function gst_vulkan_error_to_g_error(result: TVkResult; error: PPGError; format: pchar): TVkResult; cdecl; external libgstvulkan;

// === Konventiert am: 17-7-26 15:43:10 ===

function GST_VULKAN_ERROR: TGQuark;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_VULKAN_ERROR: TGQuark;
begin
  GST_VULKAN_ERROR := gst_vulkan_error_quark;
end;

{$ENDIF read_implementation}
