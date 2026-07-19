unit gstvkhandle;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  GST_VULKAN_NON_DISPATCHABLE_HANDLE_FORMAT = G_GUINT64_FORMAT;

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
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TGstVulkanHandleTypedef = uint64;

  PGstVulkanHandle = type Pointer;
  PPGstVulkanHandle = ^PGstVulkanHandle;

  TGstVulkanHandleDestroyNotify = procedure(handle: PGstVulkanHandle; user_data: Tgpointer); cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_vulkan_handle_get_type: TGType; cdecl; external libgstvulkan;
function gst_vulkan_handle_new_wrapped(device: PGstVulkanDevice; _type: TGstVulkanHandleType; handle: TGstVulkanHandleTypedef; notify: TGstVulkanHandleDestroyNotify; user_data: Tgpointer): PGstVulkanHandle; cdecl; external libgstvulkan;
procedure gst_vulkan_handle_free_descriptor_set_layout(handle: PGstVulkanHandle; user_data: Tgpointer); cdecl; external libgstvulkan;
procedure gst_vulkan_handle_free_pipeline_layout(handle: PGstVulkanHandle; user_data: Tgpointer); cdecl; external libgstvulkan;
procedure gst_vulkan_handle_free_pipeline(handle: PGstVulkanHandle; user_data: Tgpointer); cdecl; external libgstvulkan;
procedure gst_vulkan_handle_free_render_pass(handle: PGstVulkanHandle; user_data: Tgpointer); cdecl; external libgstvulkan;
procedure gst_vulkan_handle_free_sampler(handle: PGstVulkanHandle; user_data: Tgpointer); cdecl; external libgstvulkan;
procedure gst_vulkan_handle_free_framebuffer(handle: PGstVulkanHandle; user_data: Tgpointer); cdecl; external libgstvulkan;
procedure gst_vulkan_handle_free_shader(handle: PGstVulkanHandle; user_data: Tgpointer); cdecl; external libgstvulkan;

// === Konventiert am: 17-7-26 15:42:34 ===

function gst_vulkan_handle_ref(handle: PGstVulkanHandle): PGstVulkanHandle; inline;
procedure gst_vulkan_handle_unref(handle: PGstVulkanHandle); inline;
procedure gst_clear_vulkan_handle(var handle_ptr: PGstVulkanHandle); inline;


function GST_TYPE_VULKAN_HANDLE: TGType;
{$ENDIF read_function}

implementation

function GST_TYPE_VULKAN_HANDLE: TGType;
begin
  GST_TYPE_VULKAN_HANDLE := gst_vulkan_handle_get_type;
end;

function gst_vulkan_handle_ref(handle: PGstVulkanHandle): PGstVulkanHandle;
begin
  Result := PGstVulkanHandle(gst_mini_object_ref(PGstMiniObject(handle)));
end;

procedure gst_vulkan_handle_unref(handle: PGstVulkanHandle);
begin
  gst_mini_object_unref(PGstMiniObject(handle));
end;

procedure gst_clear_vulkan_handle(var handle_ptr: PGstVulkanHandle);
begin
  gst_clear_mini_object(PPGstMiniObject(@handle_ptr));
end;

end.
