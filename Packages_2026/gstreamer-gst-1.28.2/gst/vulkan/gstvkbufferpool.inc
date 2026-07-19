

  {$IFDEF read_struct}
type
  PGstVulkanBufferPool = type Pointer;

  PGstVulkanBufferPoolClass = ^TGstVulkanBufferPoolClass;
  TGstVulkanBufferPoolClass = record
    parent_class: TGstBufferPoolClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_vulkan_buffer_pool_get_type: TGType; cdecl; external libgstvulkan;
function gst_vulkan_buffer_pool_new(device: PGstVulkanDevice): PGstBufferPool; cdecl; external libgstvulkan;
procedure gst_vulkan_buffer_pool_config_set_allocation_params(config: PGstStructure; usage: TVkBufferUsageFlags; mem_properties: TVkMemoryPropertyFlags); cdecl; external libgstvulkan;

// === Konventiert am: 17-7-26 15:37:40 ===

function GST_VULKAN_BUFFER_POOL_CAST(obj: Pointer): PGstVulkanBufferPool;
function GST_TYPE_VULKAN_BUFFER_POOL: TGType;
function GST_VULKAN_BUFFER_POOL(obj: Pointer): PGstVulkanBufferPool;
function GST_IS_VULKAN_BUFFER_POOL(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_BUFFER_POOL: TGType;
begin
  GST_TYPE_VULKAN_BUFFER_POOL := gst_vulkan_buffer_pool_get_type;
end;

function GST_VULKAN_BUFFER_POOL(obj: Pointer): PGstVulkanBufferPool;
begin
  Result := PGstVulkanBufferPool(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_BUFFER_POOL));
end;

function GST_IS_VULKAN_BUFFER_POOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_BUFFER_POOL);
end;

function GST_VULKAN_BUFFER_POOL_CAST(obj: Pointer): PGstVulkanBufferPool;
begin
  GST_VULKAN_BUFFER_POOL_CAST := PGstVulkanBufferPool(obj);
end;

{$ENDIF read_implementation}
