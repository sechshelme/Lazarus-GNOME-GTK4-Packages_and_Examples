/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 10-10-2024   19:37                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_vulkan_error_quark:TGQuark;cdecl;external libgstvulkan;
function gst_vulkan_result_to_string(result:TVkResult):Pansichar;cdecl;external libgstvulkan;
type
  PGstVulkanError = ^TGstVulkanError;
  TGstVulkanError =  Longint;
  Const
    GST_VULKAN_FAILED = 0;

function gst_vulkan_error_to_g_error(result:TVkResult; error:PPGError; format:Pansichar; args:array of const):TVkResult;cdecl;external libgstvulkan;
function gst_vulkan_error_to_g_error(result:TVkResult; error:PPGError; format:Pansichar):TVkResult;cdecl;external libgstvulkan;

function GST_VULKAN_ERROR : TGQuark;

// === Konventiert am: 10-10-24 16:11:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_VULKAN_ERROR: TGQuark;
  begin
    GST_VULKAN_ERROR:=gst_vulkan_error_quark;
  end;


{$ENDIF read_implementation}
