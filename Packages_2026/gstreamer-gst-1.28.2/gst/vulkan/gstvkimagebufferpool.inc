

  {$IFDEF read_struct}
type
  PGstVulkanImageBufferPool = type Pointer;

  PGstVulkanImageBufferPoolClass = ^TGstVulkanImageBufferPoolClass;
  TGstVulkanImageBufferPoolClass = record
    parent_class: TGstBufferPoolClass;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_vulkan_image_buffer_pool_get_type: TGType; cdecl; external libgstvulkan;
function gst_vulkan_image_buffer_pool_new(device: PGstVulkanDevice): PGstBufferPool; cdecl; external libgstvulkan;
procedure gst_vulkan_image_buffer_pool_config_set_allocation_params(config: PGstStructure; usage: TVkImageUsageFlags; mem_properties: TVkMemoryPropertyFlags; initial_layout: TVkImageLayout; initial_access: Tguint64); cdecl; external libgstvulkan;
procedure gst_vulkan_image_buffer_pool_config_get_allocation_params(config: PGstStructure; usage: PVkImageUsageFlags; mem_props: PVkMemoryPropertyFlags; initial_layout: PVkImageLayout; initial_access: Pguint64); cdecl; external libgstvulkan;
procedure gst_vulkan_image_buffer_pool_config_set_decode_caps(config: PGstStructure; caps: PGstCaps); cdecl; external libgstvulkan;
procedure gst_vulkan_image_buffer_pool_config_set_encode_caps(config: PGstStructure; caps: PGstCaps); cdecl; external libgstvulkan;

// === Konventiert am: 17-7-26 15:42:15 ===

function GST_VULKAN_IMAGE_BUFFER_POOL_CAST(obj: Pointer): PGstVulkanImageBufferPool;
function GST_TYPE_VULKAN_IMAGE_BUFFER_POOL: TGType;
function GST_VULKAN_IMAGE_BUFFER_POOL(obj: Pointer): PGstVulkanImageBufferPool;
function GST_IS_VULKAN_IMAGE_BUFFER_POOL(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_IMAGE_BUFFER_POOL: TGType;
begin
  GST_TYPE_VULKAN_IMAGE_BUFFER_POOL := gst_vulkan_image_buffer_pool_get_type;
end;

function GST_VULKAN_IMAGE_BUFFER_POOL(obj: Pointer): PGstVulkanImageBufferPool;
begin
  Result := PGstVulkanImageBufferPool(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_IMAGE_BUFFER_POOL));
end;

function GST_IS_VULKAN_IMAGE_BUFFER_POOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_IMAGE_BUFFER_POOL);
end;

function GST_VULKAN_IMAGE_BUFFER_POOL_CAST(obj: Pointer): PGstVulkanImageBufferPool;
begin
  GST_VULKAN_IMAGE_BUFFER_POOL_CAST := PGstVulkanImageBufferPool(obj);
end;

{$ENDIF read_implementation}
