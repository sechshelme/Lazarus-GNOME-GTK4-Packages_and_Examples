/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 10-10-2024   19:37                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_vulkan_physical_device_get_type: TGType; cdecl; external libgstvulkan;

type
  TGstVulkanQueueFamilyOps = record
    video: Tguint32;
    query: Tgboolean;
  end;
  PGstVulkanQueueFamilyOps = ^TGstVulkanQueueFamilyOps;

  TGstVulkanPhysicalDeviceClass = record
    parent_class: TGstObjectClass;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstVulkanPhysicalDeviceClass = ^TGstVulkanPhysicalDeviceClass;

function gst_vulkan_physical_device_new(instance: PGstVulkanInstance; device_index: Tguint): PGstVulkanPhysicalDevice; cdecl; external libgstvulkan;
function gst_vulkan_physical_device_get_instance(device: PGstVulkanPhysicalDevice): PGstVulkanInstance; cdecl; external libgstvulkan;
function gst_vulkan_physical_device_get_handle(device: PGstVulkanPhysicalDevice): TVkPhysicalDevice; cdecl; external libgstvulkan;
function gst_vulkan_physical_device_get_extension_info(device: PGstVulkanPhysicalDevice; Name: Pgchar; spec_version: Pguint32): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_physical_device_get_layer_info(device: PGstVulkanPhysicalDevice; Name: Pgchar; description: PPgchar; spec_version: Pguint32; implementation_version: Pguint32): Tgboolean; cdecl; external libgstvulkan;

// === Konventiert am: 10-10-24 14:46:43 ===

function GST_TYPE_VULKAN_PHYSICAL_DEVICE: TGType;
function GST_VULKAN_PHYSICAL_DEVICE(obj: Pointer): PGstVulkanPhysicalDevice;
function GST_VULKAN_PHYSICAL_DEVICE_CLASS(klass: Pointer): PGstVulkanPhysicalDeviceClass;
function GST_IS_VULKAN_PHYSICAL_DEVICE(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_PHYSICAL_DEVICE_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_PHYSICAL_DEVICE_GET_CLASS(obj: Pointer): PGstVulkanPhysicalDeviceClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_PHYSICAL_DEVICE: TGType;
begin
  GST_TYPE_VULKAN_PHYSICAL_DEVICE := gst_vulkan_physical_device_get_type;
end;

function GST_VULKAN_PHYSICAL_DEVICE(obj: Pointer): PGstVulkanPhysicalDevice;
begin
  Result := PGstVulkanPhysicalDevice(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_PHYSICAL_DEVICE));
end;

function GST_VULKAN_PHYSICAL_DEVICE_CLASS(klass: Pointer): PGstVulkanPhysicalDeviceClass;
begin
  Result := PGstVulkanPhysicalDeviceClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_PHYSICAL_DEVICE));
end;

function GST_IS_VULKAN_PHYSICAL_DEVICE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_PHYSICAL_DEVICE);
end;

function GST_IS_VULKAN_PHYSICAL_DEVICE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VULKAN_PHYSICAL_DEVICE);
end;

function GST_VULKAN_PHYSICAL_DEVICE_GET_CLASS(obj: Pointer): PGstVulkanPhysicalDeviceClass;
begin
  Result := PGstVulkanPhysicalDeviceClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
