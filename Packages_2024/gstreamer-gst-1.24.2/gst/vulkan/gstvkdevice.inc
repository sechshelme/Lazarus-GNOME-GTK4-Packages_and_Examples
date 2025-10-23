
{$IFDEF read_interface}

function gst_vulkan_device_get_type: TGType; cdecl; external libgstvulkan;

const
  GST_VULKAN_DEVICE_CONTEXT_TYPE_STR = 'gst.vulkan.device';

type
  PGstVulkanDisplayType = ^TGstVulkanDisplayType;
  TGstVulkanDisplayType = longint;

const
  GST_VULKAN_DISPLAY_TYPE_NONE = 0;
  GST_VULKAN_DISPLAY_TYPE_XCB = 1 shl 0;
  GST_VULKAN_DISPLAY_TYPE_WAYLAND = 1 shl 1;
  GST_VULKAN_DISPLAY_TYPE_COCOA = 1 shl 2;
  GST_VULKAN_DISPLAY_TYPE_IOS = 1 shl 3;
  GST_VULKAN_DISPLAY_TYPE_WIN32 = 1 shl 4;
  GST_VULKAN_DISPLAY_TYPE_ANDROID = 1 shl 5;
  GST_VULKAN_DISPLAY_TYPE_ANY = G_MAXUINT32;

type
  TGstVulkanDeviceForEachQueueFunc = function(device: PGstVulkanDevice; queue: PGstVulkanQueue; user_data: Tgpointer): Tgboolean; cdecl;

function gst_vulkan_device_new(physical_device: PGstVulkanPhysicalDevice): PGstVulkanDevice; cdecl; external libgstvulkan;
function gst_vulkan_device_new_with_index(instance: PGstVulkanInstance; device_index: Tguint): PGstVulkanDevice; cdecl; external libgstvulkan;
function gst_vulkan_device_get_instance(device: PGstVulkanDevice): PGstVulkanInstance; cdecl; external libgstvulkan;
function gst_vulkan_device_open(device: PGstVulkanDevice; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_device_enable_extension(device: PGstVulkanDevice; Name: Pgchar): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_device_disable_extension(device: PGstVulkanDevice; Name: Pgchar): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_device_is_extension_enabled(device: PGstVulkanDevice; Name: Pgchar): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_device_enable_layer(device: PGstVulkanDevice; Name: Pgchar): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_device_is_layer_enabled(device: PGstVulkanDevice; Name: Pgchar): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_device_get_proc_address(device: PGstVulkanDevice; Name: Pgchar): Tgpointer; cdecl; external libgstvulkan;
procedure gst_vulkan_device_foreach_queue(device: PGstVulkanDevice; func: TGstVulkanDeviceForEachQueueFunc; user_data: Tgpointer); cdecl; external libgstvulkan;
function gst_vulkan_device_get_queue(device: PGstVulkanDevice; queue_family: Tguint32; queue_i: Tguint32): PGstVulkanQueue; cdecl; external libgstvulkan;
function gst_vulkan_device_queue_family_indices(device: PGstVulkanDevice): PGArray; cdecl; external libgstvulkan;
function gst_vulkan_device_get_physical_device(device: PGstVulkanDevice): PVkPhysicalDevice; cdecl; external libgstvulkan;
procedure gst_context_set_vulkan_device(context: PGstContext; device: PGstVulkanDevice); cdecl; external libgstvulkan;
function gst_context_get_vulkan_device(context: PGstContext; device: PPGstVulkanDevice): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_device_handle_context_query(element: PGstElement; query: PGstQuery; device: PGstVulkanDevice): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_device_run_context_query(element: PGstElement; device: PPGstVulkanDevice): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_device_create_fence(device: PGstVulkanDevice; error: PPGError): PGstVulkanFence; cdecl; external libgstvulkan;
function gst_vulkan_device_select_queue(device: PGstVulkanDevice; expected_flags: TVkQueueFlagBits): PGstVulkanQueue; cdecl; external libgstvulkan;

// === Konventiert am: 10-10-24 14:37:34 ===

function GST_TYPE_VULKAN_DEVICE: TGType;
function GST_VULKAN_DEVICE(obj: Pointer): PGstVulkanDevice;
function GST_VULKAN_DEVICE_CLASS(klass: Pointer): PGstVulkanDeviceClass;
function GST_IS_VULKAN_DEVICE(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_DEVICE_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_DEVICE_GET_CLASS(obj: Pointer): PGstVulkanDeviceClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_DEVICE: TGType;
begin
  GST_TYPE_VULKAN_DEVICE := gst_vulkan_device_get_type;
end;

function GST_VULKAN_DEVICE(obj: Pointer): PGstVulkanDevice;
begin
  Result := PGstVulkanDevice(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_DEVICE));
end;

function GST_VULKAN_DEVICE_CLASS(klass: Pointer): PGstVulkanDeviceClass;
begin
  Result := PGstVulkanDeviceClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_DEVICE));
end;

function GST_IS_VULKAN_DEVICE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_DEVICE);
end;

function GST_IS_VULKAN_DEVICE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VULKAN_DEVICE);
end;

function GST_VULKAN_DEVICE_GET_CLASS(obj: Pointer): PGstVulkanDeviceClass;
begin
  Result := PGstVulkanDeviceClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
