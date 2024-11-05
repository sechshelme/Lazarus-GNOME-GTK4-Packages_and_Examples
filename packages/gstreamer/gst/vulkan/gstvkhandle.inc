/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 10-10-2024   19:37                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_vulkan_handle_get_type: TGType; cdecl; external libgstvulkan;

type
  PGstVulkanHandleType = ^TGstVulkanHandleType;
  TGstVulkanHandleType = longint;

const
  GST_VULKAN_HANDLE_TYPE_DESCRIPTOR_SET_LAYOUT = 1;
  GST_VULKAN_HANDLE_TYPE_PIPELINE_LAYOUT = 2;
  GST_VULKAN_HANDLE_TYPE_PIPELINE = 3;
  GST_VULKAN_HANDLE_TYPE_RENDER_PASS = 4;
  GST_VULKAN_HANDLE_TYPE_SAMPLER = 5;
  GST_VULKAN_HANDLE_TYPE_FRAMEBUFFER = 6;
  GST_VULKAN_HANDLE_TYPE_SHADER = 7;
  GST_VULKAN_HANDLE_TYPE_VIDEO_SESSION = 8;
  GST_VULKAN_HANDLE_TYPE_VIDEO_SESSION_PARAMETERS = 9;
  GST_VULKAN_HANDLE_TYPE_SAMPLER_YCBCR_CONVERSION = 10;

type
  TGstVulkanHandleTypedef = record
  end; // ??????????

  PGstVulkanHandle = ^TGstVulkanHandle;
  PPGstVulkanHandle = ^PGstVulkanHandle;
  TGstVulkanHandleDestroyNotify = procedure(handle: PGstVulkanHandle; user_data: Tgpointer); cdecl;

  TGstVulkanHandle = record
    parent: TGstMiniObject;
    device: PGstVulkanDevice;
    _type: TGstVulkanHandleType;
    handle: TGstVulkanHandleTypedef;
    notify: TGstVulkanHandleDestroyNotify;
    user_data: Tgpointer;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

function gst_vulkan_handle_new_wrapped(device: PGstVulkanDevice; _type: TGstVulkanHandleType; handle: TGstVulkanHandleTypedef; notify: TGstVulkanHandleDestroyNotify; user_data: Tgpointer): PGstVulkanHandle; cdecl; external libgstvulkan;
procedure gst_vulkan_handle_free_descriptor_set_layout(handle: PGstVulkanHandle; user_data: Tgpointer); cdecl; external libgstvulkan;
procedure gst_vulkan_handle_free_pipeline_layout(handle: PGstVulkanHandle; user_data: Tgpointer); cdecl; external libgstvulkan;
procedure gst_vulkan_handle_free_pipeline(handle: PGstVulkanHandle; user_data: Tgpointer); cdecl; external libgstvulkan;
procedure gst_vulkan_handle_free_render_pass(handle: PGstVulkanHandle; user_data: Tgpointer); cdecl; external libgstvulkan;
procedure gst_vulkan_handle_free_sampler(handle: PGstVulkanHandle; user_data: Tgpointer); cdecl; external libgstvulkan;
procedure gst_vulkan_handle_free_framebuffer(handle: PGstVulkanHandle; user_data: Tgpointer); cdecl; external libgstvulkan;
procedure gst_vulkan_handle_free_shader(handle: PGstVulkanHandle; user_data: Tgpointer); cdecl; external libgstvulkan;

// === Konventiert am: 10-10-24 15:59:43 ===

function GST_TYPE_VULKAN_HANDLE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_HANDLE: TGType;
begin
  GST_TYPE_VULKAN_HANDLE := gst_vulkan_handle_get_type;
end;



{$ENDIF read_implementation}
