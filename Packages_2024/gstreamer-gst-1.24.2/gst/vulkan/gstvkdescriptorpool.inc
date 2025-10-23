
{$IFDEF read_interface}

function gst_vulkan_descriptor_pool_get_type: TGType; cdecl; external libgstvulkan;
function gst_vulkan_descriptor_pool_new_wrapped(device: PGstVulkanDevice; pool: PVkDescriptorPool; max_sets: Tgsize): PGstVulkanDescriptorPool; cdecl; external libgstvulkan;
function gst_vulkan_descriptor_pool_get_device(pool: PGstVulkanDescriptorPool): PGstVulkanDevice; cdecl; external libgstvulkan;
function gst_vulkan_descriptor_pool_create(pool: PGstVulkanDescriptorPool; n_layouts: Tguint; layouts: PPGstVulkanHandle; error: PPGError): PGstVulkanDescriptorSet; cdecl; external libgstvulkan;
function gst_vulkan_descriptor_pool_get_max_sets(pool: PGstVulkanDescriptorPool): Tgsize; cdecl; external libgstvulkan;

// === Konventiert am: 10-10-24 16:30:45 ===

function GST_TYPE_VULKAN_DESCRIPTOR_POOL: TGType;
function GST_VULKAN_DESCRIPTOR_POOL(obj: Pointer): PGstVulkanDescriptorPool;
function GST_VULKAN_DESCRIPTOR_POOL_CLASS(klass: Pointer): PGstVulkanDescriptorPoolClass;
function GST_IS_VULKAN_DESCRIPTOR_POOL(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_DESCRIPTOR_POOL_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_DESCRIPTOR_POOL_GET_CLASS(obj: Pointer): PGstVulkanDescriptorPoolClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_DESCRIPTOR_POOL: TGType;
begin
  GST_TYPE_VULKAN_DESCRIPTOR_POOL := gst_vulkan_descriptor_pool_get_type;
end;

function GST_VULKAN_DESCRIPTOR_POOL(obj: Pointer): PGstVulkanDescriptorPool;
begin
  Result := PGstVulkanDescriptorPool(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_DESCRIPTOR_POOL));
end;

function GST_VULKAN_DESCRIPTOR_POOL_CLASS(klass: Pointer): PGstVulkanDescriptorPoolClass;
begin
  Result := PGstVulkanDescriptorPoolClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_DESCRIPTOR_POOL));
end;

function GST_IS_VULKAN_DESCRIPTOR_POOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_DESCRIPTOR_POOL);
end;

function GST_IS_VULKAN_DESCRIPTOR_POOL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VULKAN_DESCRIPTOR_POOL);
end;

function GST_VULKAN_DESCRIPTOR_POOL_GET_CLASS(obj: Pointer): PGstVulkanDescriptorPoolClass;
begin
  Result := PGstVulkanDescriptorPoolClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
