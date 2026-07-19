unit gstvkfence;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstvkhandlepool;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_struct}
type
  PGstVulkanFenceCache = type Pointer;

  PGstVulkanFenceCacheClass = ^TGstVulkanFenceCacheClass;
  TGstVulkanFenceCacheClass = record
    parent_class: TGstVulkanHandlePoolClass;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstVulkanFence = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_vulkan_fence_get_type: TGType; cdecl; external libgstvulkan;
function gst_vulkan_fence_new(device: PGstVulkanDevice; error: PPGError): PGstVulkanFence; cdecl; external libgstvulkan;
procedure gst_vulkan_fence_reset(fence: PGstVulkanFence); cdecl; external libgstvulkan;
function gst_vulkan_fence_new_always_signalled(device: PGstVulkanDevice): PGstVulkanFence; cdecl; external libgstvulkan;
function gst_vulkan_fence_is_signaled(fence: PGstVulkanFence): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_fence_cache_get_type: TGType; cdecl; external libgstvulkan;

function gst_vulkan_fence_cache_new(device: PGstVulkanDevice): PGstVulkanFenceCache; cdecl; external libgstvulkan;

function gst_vulkan_fence_cache_acquire(o: PGstVulkanFenceCache; e: PPGError): PGstVulkanFence; inline;
function gst_vulkan_fence_ref(fence: PGstVulkanFence): PGstVulkanFence;
procedure gst_vulkan_fence_unref(fence: PGstVulkanFence);

// === Konventiert am: 17-7-26 15:43:05 ===

function GST_TYPE_VULKAN_FENCE: TGType;
function GST_VULKAN_FENCE_CAST(f: Pointer): PGstVulkanFence;
function GST_TYPE_VULKAN_FENCE_CACHE: TGType;
function GST_VULKAN_FENCE_CACHE(obj: Pointer): PGstVulkanFenceCache;
function GST_VULKAN_FENCE_CACHE_CLASS(klass: Pointer): PGstVulkanFenceCacheClass;
function GST_IS_VULKAN_FENCE_CACHE(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_FENCE_CACHE_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_FENCE_CACHE_GET_CLASS(obj: Pointer): PGstVulkanFenceCacheClass;
{$ENDIF read_function}

implementation

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

function GST_TYPE_VULKAN_FENCE: TGType;
begin
  GST_TYPE_VULKAN_FENCE := gst_vulkan_fence_get_type;
end;

function GST_VULKAN_FENCE_CAST(f: Pointer): PGstVulkanFence;
begin
  GST_VULKAN_FENCE_CAST := PGstVulkanFence(f);
end;


function gst_vulkan_fence_ref(fence: PGstVulkanFence): PGstVulkanFence;
begin
  Result := GST_VULKAN_FENCE_CAST(gst_mini_object_ref(PGstMiniObject(fence)));
end;

procedure gst_vulkan_fence_unref(fence: PGstVulkanFence);
begin
  gst_mini_object_unref(PGstMiniObject(fence));
end;

function gst_vulkan_fence_cache_acquire(o: PGstVulkanFenceCache; e: PPGError): PGstVulkanFence;
begin
  Result := PGstVulkanFence(gst_vulkan_handle_pool_acquire(GST_VULKAN_HANDLE_POOL(o), e));
end;

end.
