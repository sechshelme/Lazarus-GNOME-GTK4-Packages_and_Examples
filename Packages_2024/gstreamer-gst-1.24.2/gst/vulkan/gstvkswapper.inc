
{$IFDEF read_interface}

function gst_vulkan_swapper_get_type: TGType; cdecl; external libgstvulkan;

const
  GST_VULKAN_SWAPPER_VIDEO_FORMATS = ' { RGBA, BGRA, RGB, BGR } ';

type
  TGstVulkanSwapper = record
    parent: TGstObject;
    device: PGstVulkanDevice;
    window: PGstVulkanWindow;
    queue: PGstVulkanQueue;
    cmd_pool: PGstVulkanCommandPool;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstVulkanSwapper = ^TGstVulkanSwapper;

  TGstVulkanSwapperClass = record
    parent_class: TGstObjectClass;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstVulkanSwapperClass = ^TGstVulkanSwapperClass;

function gst_vulkan_swapper_new(device: PGstVulkanDevice; window: PGstVulkanWindow): PGstVulkanSwapper; cdecl; external libgstvulkan;
function gst_vulkan_swapper_choose_queue(swapper: PGstVulkanSwapper; available_queue: PGstVulkanQueue; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_swapper_get_supported_caps(swapper: PGstVulkanSwapper; error: PPGError): PGstCaps; cdecl; external libgstvulkan;
function gst_vulkan_swapper_set_caps(swapper: PGstVulkanSwapper; caps: PGstCaps; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_swapper_render_buffer(swapper: PGstVulkanSwapper; buffer: PGstBuffer; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
procedure gst_vulkan_swapper_get_surface_rectangles(swapper: PGstVulkanSwapper; input_image: PGstVideoRectangle; surface_location: PGstVideoRectangle; display_rect: PGstVideoRectangle); cdecl; external libgstvulkan;

// === Konventiert am: 10-10-24 17:10:41 ===

function GST_TYPE_VULKAN_SWAPPER: TGType;
function GST_VULKAN_SWAPPER(obj: Pointer): PGstVulkanSwapper;
function GST_VULKAN_SWAPPER_CLASS(klass: Pointer): PGstVulkanSwapperClass;
function GST_IS_VULKAN_SWAPPER(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_SWAPPER_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_SWAPPER_GET_CLASS(obj: Pointer): PGstVulkanSwapperClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_SWAPPER: TGType;
begin
  GST_TYPE_VULKAN_SWAPPER := gst_vulkan_swapper_get_type;
end;

function GST_VULKAN_SWAPPER(obj: Pointer): PGstVulkanSwapper;
begin
  Result := PGstVulkanSwapper(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_SWAPPER));
end;

function GST_VULKAN_SWAPPER_CLASS(klass: Pointer): PGstVulkanSwapperClass;
begin
  Result := PGstVulkanSwapperClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_SWAPPER));
end;

function GST_IS_VULKAN_SWAPPER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_SWAPPER);
end;

function GST_IS_VULKAN_SWAPPER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VULKAN_SWAPPER);
end;

function GST_VULKAN_SWAPPER_GET_CLASS(obj: Pointer): PGstVulkanSwapperClass;
begin
  Result := PGstVulkanSwapperClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
