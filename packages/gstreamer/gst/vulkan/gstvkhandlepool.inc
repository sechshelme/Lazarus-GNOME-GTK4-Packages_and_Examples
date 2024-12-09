
{$IFDEF read_interface}

function gst_vulkan_handle_pool_get_type: TGType; cdecl; external libgstvulkan;

type
  TGstVulkanHandlePoolClass = record
    parent: TGstObjectClass;
    alloc: function(pool: PGstVulkanHandlePool; error: PPGError): Tgpointer; cdecl;
    acquire: function(pool: PGstVulkanHandlePool; error: PPGError): Tgpointer; cdecl;
    Release: procedure(pool: PGstVulkanHandlePool; handle: Tgpointer); cdecl;
    Free: procedure(pool: PGstVulkanHandlePool; handle: Tgpointer); cdecl;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstVulkanHandlePoolClass = ^TGstVulkanHandlePoolClass;

function gst_vulkan_handle_pool_alloc(pool: PGstVulkanHandlePool; error: PPGError): Tgpointer; cdecl; external libgstvulkan;
function gst_vulkan_handle_pool_acquire(pool: PGstVulkanHandlePool; error: PPGError): Tgpointer; cdecl; external libgstvulkan;
procedure gst_vulkan_handle_pool_release(pool: PGstVulkanHandlePool; handle: Tgpointer); cdecl; external libgstvulkan;

function GST_VULKAN_HANDLE_POOL_CAST(obj: Pointer): PGstVulkanHandlePool;

// === Konventiert am: 10-10-24 14:34:46 ===

function GST_TYPE_VULKAN_HANDLE_POOL: TGType;
function GST_VULKAN_HANDLE_POOL(obj: Pointer): PGstVulkanHandlePool;
function GST_VULKAN_HANDLE_POOL_CLASS(klass: Pointer): PGstVulkanHandlePoolClass;
function GST_IS_VULKAN_HANDLE_POOL(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_HANDLE_POOL_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_HANDLE_POOL_GET_CLASS(obj: Pointer): PGstVulkanHandlePoolClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_HANDLE_POOL: TGType;
begin
  GST_TYPE_VULKAN_HANDLE_POOL := gst_vulkan_handle_pool_get_type;
end;

function GST_VULKAN_HANDLE_POOL(obj: Pointer): PGstVulkanHandlePool;
begin
  Result := PGstVulkanHandlePool(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_HANDLE_POOL));
end;

function GST_VULKAN_HANDLE_POOL_CLASS(klass: Pointer): PGstVulkanHandlePoolClass;
begin
  Result := PGstVulkanHandlePoolClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_HANDLE_POOL));
end;

function GST_IS_VULKAN_HANDLE_POOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_HANDLE_POOL);
end;

function GST_IS_VULKAN_HANDLE_POOL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VULKAN_HANDLE_POOL);
end;

function GST_VULKAN_HANDLE_POOL_GET_CLASS(obj: Pointer): PGstVulkanHandlePoolClass;
begin
  Result := PGstVulkanHandlePoolClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_VULKAN_HANDLE_POOL_CAST(obj: Pointer): PGstVulkanHandlePool;
begin
  Result := PGstVulkanHandlePool(obj);
end;

{$ENDIF read_implementation}
