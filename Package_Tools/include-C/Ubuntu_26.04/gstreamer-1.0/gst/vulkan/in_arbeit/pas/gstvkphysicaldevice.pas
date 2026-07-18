unit gstvkphysicaldevice;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstvkinstance;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstVulkanPhysicalDevice = type Pointer;

  PGstVulkanPhysicalDeviceClass = ^TGstVulkanPhysicalDeviceClass;
  TGstVulkanPhysicalDeviceClass = record
    parent_class: TGstObjectClass;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_vulkan_physical_device_get_type: TGType; cdecl; external libgstvulkan;
function gst_vulkan_physical_device_new(instance: PGstVulkanInstance; device_index: Tguint): PGstVulkanPhysicalDevice; cdecl; external libgstvulkan;
function gst_vulkan_physical_device_get_instance(device: PGstVulkanPhysicalDevice): PGstVulkanInstance; cdecl; external libgstvulkan;
function gst_vulkan_physical_device_get_handle(device: PGstVulkanPhysicalDevice): TVkPhysicalDevice; cdecl; external libgstvulkan;
function gst_vulkan_physical_device_get_extension_info(device: PGstVulkanPhysicalDevice; name: Pgchar; spec_version: Pguint32): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_physical_device_get_layer_info(device: PGstVulkanPhysicalDevice; name: Pgchar; description: PPgchar; spec_version: Pguint32; implementation_version: Pguint32): Tgboolean; cdecl; external libgstvulkan;
procedure gst_vulkan_physical_device_get_api_version(device: PGstVulkanPhysicalDevice; major: Pguint; minor: Pguint; patch: Pguint); cdecl; external libgstvulkan;
function gst_vulkan_physical_device_check_api_version(device: PGstVulkanPhysicalDevice; major: Tguint; minor: Tguint; patch: Tguint): Tgboolean; cdecl; external libgstvulkan;

// === Konventiert am: 17-7-26 15:46:44 ===

function GST_TYPE_VULKAN_PHYSICAL_DEVICE: TGType;
function GST_VULKAN_PHYSICAL_DEVICE(obj: Pointer): PGstVulkanPhysicalDevice;
function GST_VULKAN_PHYSICAL_DEVICE_CLASS(klass: Pointer): PGstVulkanPhysicalDeviceClass;
function GST_IS_VULKAN_PHYSICAL_DEVICE(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_PHYSICAL_DEVICE_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_PHYSICAL_DEVICE_GET_CLASS(obj: Pointer): PGstVulkanPhysicalDeviceClass;
{$ENDIF read_struct}

implementation

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



end.
