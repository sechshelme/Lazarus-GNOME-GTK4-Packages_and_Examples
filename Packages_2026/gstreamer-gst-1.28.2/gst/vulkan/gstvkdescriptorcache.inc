

{$IFDEF read_struct}
type
  PGstVulkanDescriptorCache = type Pointer;

  PGstVulkanDescriptorCacheClass = ^TGstVulkanDescriptorCacheClass;
  TGstVulkanDescriptorCacheClass = record
    parent_class: TGstVulkanHandlePoolClass;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_vulkan_descriptor_cache_get_type: TGType; cdecl; external libgstvulkan;
function gst_vulkan_descriptor_cache_new(pool: PGstVulkanDescriptorPool; n_layouts: Tguint; layouts: PPGstVulkanHandle): PGstVulkanDescriptorCache; cdecl; external libgstvulkan;
function gst_vulkan_descriptor_cache_acquire(cache: PGstVulkanDescriptorCache; error: PPGError): PGstVulkanDescriptorSet; cdecl; external libgstvulkan;

// === Konventiert am: 17-7-26 15:36:52 ===

function GST_TYPE_VULKAN_DESCRIPTOR_CACHE: TGType;
function GST_VULKAN_DESCRIPTOR_CACHE(obj: Pointer): PGstVulkanDescriptorCache;
function GST_VULKAN_DESCRIPTOR_CACHE_CLASS(klass: Pointer): PGstVulkanDescriptorCacheClass;
function GST_IS_VULKAN_DESCRIPTOR_CACHE(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_DESCRIPTOR_CACHE_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_DESCRIPTOR_CACHE_GET_CLASS(obj: Pointer): PGstVulkanDescriptorCacheClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_DESCRIPTOR_CACHE: TGType;
begin
  GST_TYPE_VULKAN_DESCRIPTOR_CACHE := gst_vulkan_descriptor_cache_get_type;
end;

function GST_VULKAN_DESCRIPTOR_CACHE(obj: Pointer): PGstVulkanDescriptorCache;
begin
  Result := PGstVulkanDescriptorCache(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_DESCRIPTOR_CACHE));
end;

function GST_VULKAN_DESCRIPTOR_CACHE_CLASS(klass: Pointer): PGstVulkanDescriptorCacheClass;
begin
  Result := PGstVulkanDescriptorCacheClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_DESCRIPTOR_CACHE));
end;

function GST_IS_VULKAN_DESCRIPTOR_CACHE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_DESCRIPTOR_CACHE);
end;

function GST_IS_VULKAN_DESCRIPTOR_CACHE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VULKAN_DESCRIPTOR_CACHE);
end;

function GST_VULKAN_DESCRIPTOR_CACHE_GET_CLASS(obj: Pointer): PGstVulkanDescriptorCacheClass;
begin
  Result := PGstVulkanDescriptorCacheClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
