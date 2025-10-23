
{$IFDEF read_interface}

function gst_vulkan_fence_cache_get_type: TGType; cdecl; external libgstvulkan;
function gst_vulkan_fence_get_type: TGType; cdecl; external libgstvulkan;

function gst_vulkan_fence_new(device: PGstVulkanDevice; error: PPGError): PGstVulkanFence; cdecl; external libgstvulkan;
procedure gst_vulkan_fence_reset(fence: PGstVulkanFence); cdecl; external libgstvulkan;
function gst_vulkan_fence_new_always_signalled(device: PGstVulkanDevice): PGstVulkanFence; cdecl; external libgstvulkan;
function gst_vulkan_fence_is_signaled(fence: PGstVulkanFence): Tgboolean; cdecl; external libgstvulkan;

function gst_vulkan_fence_cache_new(device: PGstVulkanDevice): PGstVulkanFenceCache; cdecl; external libgstvulkan;

function GST_TYPE_VULKAN_FENCE: TGType;
function GST_VULKAN_FENCE_CAST(f: Pointer): PGstVulkanFence;

// === Konventiert am: 10-10-24 15:00:46 ===

function GST_TYPE_VULKAN_FENCE_CACHE: TGType;
function GST_VULKAN_FENCE_CACHE(obj: Pointer): PGstVulkanFenceCache;
function GST_VULKAN_FENCE_CACHE_CLASS(klass: Pointer): PGstVulkanFenceCacheClass;
function GST_IS_VULKAN_FENCE_CACHE(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_FENCE_CACHE_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_FENCE_CACHE_GET_CLASS(obj: Pointer): PGstVulkanFenceCacheClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_FENCE_CACHE: TGType;
begin
  GST_TYPE_VULKAN_FENCE_CACHE := gst_vulkan_fence_cache_get_type;
end;

function GST_VULKAN_FENCE_CACHE(obj: Pointer): PGstVulkanFenceCache;
begin
  Result := PGstVulkanFenceCache(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_FENCE_CACHE));
end;

function GST_VULKAN_FENCE_CACHE_CLASS(klass: Pointer): PGstVulkanFenceCacheClass;
begin
  Result := PGstVulkanFenceCacheClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_FENCE_CACHE));
end;

function GST_IS_VULKAN_FENCE_CACHE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_FENCE_CACHE);
end;

function GST_IS_VULKAN_FENCE_CACHE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VULKAN_FENCE_CACHE);
end;

function GST_VULKAN_FENCE_CACHE_GET_CLASS(obj: Pointer): PGstVulkanFenceCacheClass;
begin
  Result := PGstVulkanFenceCacheClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_TYPE_VULKAN_FENCE: TGType;
begin
  GST_TYPE_VULKAN_FENCE := gst_vulkan_fence_get_type;
end;

function GST_VULKAN_FENCE_CAST(f: Pointer): PGstVulkanFence;
begin
  GST_VULKAN_FENCE_CAST := PGstVulkanFence(f);
end;

{$ENDIF read_implementation}
