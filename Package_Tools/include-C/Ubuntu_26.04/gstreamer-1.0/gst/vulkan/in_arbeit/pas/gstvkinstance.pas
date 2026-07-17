unit gstvkinstance;

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gst_vulkan_instance_get_type: TGType; cdecl; external libgstvulkan;

const
  GST_VULKAN_INSTANCE_CONTEXT_TYPE_STR = 'gst.vulkan.instance';

type
  PPGstVulkanInstance = ^PGstVulkanInstance;
  PGstVulkanInstance = ^TGstVulkanInstance;
  TGstVulkanInstance = record
    parent: TGstObject;
    instance: TVkInstance;
    physical_devices: PVkPhysicalDevice;
    n_physical_devices: Tguint32;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstVulkanInstanceClass = ^TGstVulkanInstanceClass;
  TGstVulkanInstanceClass = record
    parent_class: TGstObjectClass;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

function gst_vulkan_instance_new: PGstVulkanInstance; cdecl; external libgstvulkan;
function gst_vulkan_instance_fill_info(instance: PGstVulkanInstance; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_instance_open(instance: PGstVulkanInstance; error: PPGError): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_instance_get_proc_address(instance: PGstVulkanInstance; name: Pgchar): Tgpointer; cdecl; external libgstvulkan;
function gst_vulkan_instance_create_device(instance: PGstVulkanInstance; error: PPGError): PGstVulkanDevice; cdecl; external libgstvulkan;
function gst_vulkan_instance_create_device_with_index(instance: PGstVulkanInstance; device_index: Tguint; error: PPGError): PGstVulkanDevice; cdecl; external libgstvulkan;
procedure gst_context_set_vulkan_instance(context: PGstContext; instance: PGstVulkanInstance); cdecl; external libgstvulkan;
function gst_context_get_vulkan_instance(context: PGstContext; instance: PPGstVulkanInstance): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_instance_handle_context_query(element: PGstElement; query: PGstQuery; instance: PGstVulkanInstance): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_instance_run_context_query(element: PGstElement; instance: PPGstVulkanInstance): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_instance_check_version(instance: PGstVulkanInstance; major: Tguint; minor: Tguint; patch: Tguint): Tgboolean; cdecl; external libgstvulkan;
procedure gst_vulkan_instance_get_version(instance: PGstVulkanInstance; major: Pguint; minor: Pguint; patch: Pguint); cdecl; external libgstvulkan;
function gst_vulkan_instance_get_extension_info(instance: PGstVulkanInstance; name: Pgchar; spec_version: Pguint32): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_instance_enable_extension(instance: PGstVulkanInstance; name: Pgchar): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_instance_disable_extension(instance: PGstVulkanInstance; name: Pgchar): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_instance_is_extension_enabled(instance: PGstVulkanInstance; name: Pgchar): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_instance_get_layer_info(instance: PGstVulkanInstance; name: Pgchar; description: PPgchar; spec_version: Pguint32; implementation_version: Pguint32): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_instance_enable_layer(instance: PGstVulkanInstance; name: Pgchar): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_instance_is_layer_enabled(instance: PGstVulkanInstance; name: Pgchar): Tgboolean; cdecl; external libgstvulkan;
procedure gst_vulkan_instance_get_api_version(instance: PGstVulkanInstance; major: Pguint; minor: Pguint; patch: Pguint); cdecl; external libgstvulkan;
function gst_vulkan_instance_check_api_version(instance: PGstVulkanInstance; major: Tguint; minor: Tguint; patch: Tguint): Tgboolean; cdecl; external libgstvulkan;

// === Konventiert am: 17-7-26 15:47:05 ===

function GST_TYPE_VULKAN_INSTANCE: TGType;
function GST_VULKAN_INSTANCE(obj: Pointer): PGstVulkanInstance;
function GST_VULKAN_INSTANCE_CLASS(klass: Pointer): PGstVulkanInstanceClass;
function GST_IS_VULKAN_INSTANCE(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_INSTANCE_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_INSTANCE_GET_CLASS(obj: Pointer): PGstVulkanInstanceClass;

implementation

function GST_TYPE_VULKAN_INSTANCE: TGType;
begin
  GST_TYPE_VULKAN_INSTANCE := gst_vulkan_instance_get_type;
end;

function GST_VULKAN_INSTANCE(obj: Pointer): PGstVulkanInstance;
begin
  Result := PGstVulkanInstance(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_INSTANCE));
end;

function GST_VULKAN_INSTANCE_CLASS(klass: Pointer): PGstVulkanInstanceClass;
begin
  Result := PGstVulkanInstanceClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_INSTANCE));
end;

function GST_IS_VULKAN_INSTANCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_INSTANCE);
end;

function GST_IS_VULKAN_INSTANCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VULKAN_INSTANCE);
end;

function GST_VULKAN_INSTANCE_GET_CLASS(obj: Pointer): PGstVulkanInstanceClass;
begin
  Result := PGstVulkanInstanceClass(PGTypeInstance(obj)^.g_class);
end;



end.
