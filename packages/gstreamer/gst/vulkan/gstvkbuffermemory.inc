
{$IFDEF read_interface}

function gst_vulkan_buffer_memory_allocator_get_type: TGType; cdecl; external libgstvulkan;

const
  GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_NAME = 'VulkanBuffer';
  GST_CAPS_FEATURE_MEMORY_VULKAN_BUFFER = 'memory:VulkanBuffer';

type
  PGstVulkanBarrierBufferInfo = type Pointer;
  PGstVulkanBufferMemory = type Pointer;
  PGstVulkanBufferMemoryAllocator = type Pointer;
  PGstVulkanBufferMemoryAllocatorClass = type Pointer;

procedure gst_vulkan_buffer_memory_init_once; cdecl; external libgstvulkan;
function gst_is_vulkan_buffer_memory(mem: PGstMemory): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_buffer_memory_alloc(device: PGstVulkanDevice; size: Tgsize; usage: TVkBufferUsageFlags; mem_prop_flags: TVkMemoryPropertyFlags): PGstMemory; cdecl; external libgstvulkan;
function gst_vulkan_buffer_memory_alloc_with_buffer_info(device: PGstVulkanDevice; buffer_info: PVkBufferCreateInfo; mem_prop_flags: TVkMemoryPropertyFlags): PGstMemory; cdecl; external libgstvulkan;
function gst_vulkan_buffer_memory_wrapped(device: PGstVulkanDevice; buffer: TVkBuffer; usage: TVkBufferUsageFlags; user_data: Tgpointer; notify: TGDestroyNotify): PGstMemory; cdecl; external libgstvulkan;

function GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_CAST(obj: Pointer): PGstVulkanBufferMemoryAllocator;

// === Konventiert am: 10-10-24 15:56:02 ===

function GST_TYPE_VULKAN_BUFFER_MEMORY_ALLOCATOR: TGType;
function GST_VULKAN_BUFFER_MEMORY_ALLOCATOR(obj: Pointer): PGstVulkanBufferMemoryAllocator;
function GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_CLASS(klass: Pointer): PGstVulkanBufferMemoryAllocatorClass;
function GST_IS_VULKAN_BUFFER_MEMORY_ALLOCATOR(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_BUFFER_MEMORY_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_GET_CLASS(obj: Pointer): PGstVulkanBufferMemoryAllocatorClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_BUFFER_MEMORY_ALLOCATOR: TGType;
begin
  GST_TYPE_VULKAN_BUFFER_MEMORY_ALLOCATOR := gst_vulkan_buffer_memory_allocator_get_type;
end;

function GST_VULKAN_BUFFER_MEMORY_ALLOCATOR(obj: Pointer): PGstVulkanBufferMemoryAllocator;
begin
  Result := PGstVulkanBufferMemoryAllocator(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_BUFFER_MEMORY_ALLOCATOR));
end;

function GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_CLASS(klass: Pointer): PGstVulkanBufferMemoryAllocatorClass;
begin
  Result := PGstVulkanBufferMemoryAllocatorClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_BUFFER_MEMORY_ALLOCATOR));
end;

function GST_IS_VULKAN_BUFFER_MEMORY_ALLOCATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_BUFFER_MEMORY_ALLOCATOR);
end;

function GST_IS_VULKAN_BUFFER_MEMORY_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VULKAN_BUFFER_MEMORY_ALLOCATOR);
end;

function GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_GET_CLASS(obj: Pointer): PGstVulkanBufferMemoryAllocatorClass;
begin
  Result := PGstVulkanBufferMemoryAllocatorClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_CAST(obj: Pointer
  ): PGstVulkanBufferMemoryAllocator;
begin
  GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_CAST := PGstVulkanBufferMemoryAllocator(obj);
end;


{$ENDIF read_implementation}
