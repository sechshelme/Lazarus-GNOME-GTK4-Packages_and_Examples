
{$IFDEF read_interface}

function gst_vulkan_image_memory_allocator_get_type: TGType; cdecl; external libgstvulkan;

const
  GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_NAME = 'VulkanImage';
  GST_CAPS_FEATURE_MEMORY_VULKAN_IMAGE = 'memory:VulkanImage';

type
  TGstVulkanImageMemoryFindViewFunc = function(view: PGstVulkanImageView; user_data: Tgpointer): Tgboolean; cdecl;

procedure gst_vulkan_image_memory_init_once; cdecl; external libgstvulkan;
function gst_is_vulkan_image_memory(mem: PGstMemory): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_image_memory_init(mem: PGstVulkanImageMemory; allocator: PGstAllocator; parent: PGstMemory; device: PGstVulkanDevice; format: TVkFormat;
  usage: TVkImageUsageFlags; initial_layout: TVkImageLayout; params: PGstAllocationParams; size: Tgsize; user_data: Tgpointer;
  notify: TGDestroyNotify): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_image_memory_alloc_with_image_info(device: PGstVulkanDevice; image_info: PVkImageCreateInfo; mem_prop_flags: TVkMemoryPropertyFlags): PGstMemory; cdecl; external libgstvulkan;
function gst_vulkan_image_memory_alloc(device: PGstVulkanDevice; format: TVkFormat; Width: Tgsize; Height: Tgsize; tiling: TVkImageTiling;
  usage: TVkImageUsageFlags; mem_prop_flags: TVkMemoryPropertyFlags): PGstMemory; cdecl; external libgstvulkan;
function gst_vulkan_image_memory_wrapped(device: PGstVulkanDevice; image: PVkImage; format: TVkFormat; Width: Tgsize; Height: Tgsize;
  tiling: TVkImageTiling; usage: TVkImageUsageFlags; user_data: Tgpointer; notify: TGDestroyNotify): PGstMemory; cdecl; external libgstvulkan;
function gst_vulkan_image_memory_get_width(image: PGstVulkanImageMemory): Tguint32; cdecl; external libgstvulkan;
function gst_vulkan_image_memory_get_height(image: PGstVulkanImageMemory): Tguint32; cdecl; external libgstvulkan;
function gst_vulkan_image_memory_find_view(image: PGstVulkanImageMemory; find_func: TGstVulkanImageMemoryFindViewFunc; user_data: Tgpointer): PGstVulkanImageView; cdecl; external libgstvulkan;
procedure gst_vulkan_image_memory_add_view(image: PGstVulkanImageMemory; view: PGstVulkanImageView); cdecl; external libgstvulkan;

function GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_CAST(obj: Pointer): PGstVulkanImageMemoryAllocator;

// === Konventiert am: 10-10-24 15:24:22 ===

function GST_TYPE_VULKAN_IMAGE_MEMORY_ALLOCATOR: TGType;
function GST_VULKAN_IMAGE_MEMORY_ALLOCATOR(obj: Pointer): PGstVulkanImageMemoryAllocator;
function GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_CLASS(klass: Pointer): PGstVulkanImageMemoryAllocatorClass;
function GST_IS_VULKAN_IMAGE_MEMORY_ALLOCATOR(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_IMAGE_MEMORY_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_GET_CLASS(obj: Pointer): PGstVulkanImageMemoryAllocatorClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_IMAGE_MEMORY_ALLOCATOR: TGType;
begin
  GST_TYPE_VULKAN_IMAGE_MEMORY_ALLOCATOR := gst_vulkan_image_memory_allocator_get_type;
end;

function GST_VULKAN_IMAGE_MEMORY_ALLOCATOR(obj: Pointer): PGstVulkanImageMemoryAllocator;
begin
  Result := PGstVulkanImageMemoryAllocator(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_IMAGE_MEMORY_ALLOCATOR));
end;

function GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_CLASS(klass: Pointer): PGstVulkanImageMemoryAllocatorClass;
begin
  Result := PGstVulkanImageMemoryAllocatorClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_IMAGE_MEMORY_ALLOCATOR));
end;

function GST_IS_VULKAN_IMAGE_MEMORY_ALLOCATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_IMAGE_MEMORY_ALLOCATOR);
end;

function GST_IS_VULKAN_IMAGE_MEMORY_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VULKAN_IMAGE_MEMORY_ALLOCATOR);
end;

function GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_GET_CLASS(obj: Pointer): PGstVulkanImageMemoryAllocatorClass;
begin
  Result := PGstVulkanImageMemoryAllocatorClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_CAST(obj: Pointer): PGstVulkanImageMemoryAllocator;
begin
  GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_CAST := PGstVulkanImageMemoryAllocator(obj);
end;


{$ENDIF read_implementation}
