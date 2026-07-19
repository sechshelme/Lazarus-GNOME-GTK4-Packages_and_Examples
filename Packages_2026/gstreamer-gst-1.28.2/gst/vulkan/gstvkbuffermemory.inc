

  {$IFDEF read_enum}
const
  GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_NAME = 'VulkanBuffer';
  GST_CAPS_FEATURE_MEMORY_VULKAN_BUFFER = 'memory:VulkanBuffer';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstVulkanBarrierBufferInfo = ^TGstVulkanBarrierBufferInfo;
  TGstVulkanBarrierBufferInfo = record
    parent: TGstVulkanBarrierMemoryInfo;
    offset: TVkDeviceSize;
    size: TVkDeviceSize;
  end;

  PGstVulkanBufferMemory = type Pointer;

  PGstVulkanBufferMemoryAllocator = type Pointer;

  PGstVulkanBufferMemoryAllocatorClass = ^TGstVulkanBufferMemoryAllocatorClass;
  TGstVulkanBufferMemoryAllocatorClass = record
    parent_class: TGstAllocatorClass;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_vulkan_buffer_memory_allocator_get_type: TGType; cdecl; external libgstvulkan;
procedure gst_vulkan_buffer_memory_init_once; cdecl; external libgstvulkan;
function gst_is_vulkan_buffer_memory(mem: PGstMemory): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_buffer_memory_alloc(device: PGstVulkanDevice; size: Tgsize; usage: TVkBufferUsageFlags; mem_prop_flags: TVkMemoryPropertyFlags): PGstMemory; cdecl; external libgstvulkan;
function gst_vulkan_buffer_memory_alloc_with_buffer_info(device: PGstVulkanDevice; buffer_info: PVkBufferCreateInfo; mem_prop_flags: TVkMemoryPropertyFlags): PGstMemory; cdecl; external libgstvulkan;
function gst_vulkan_buffer_memory_wrapped(device: PGstVulkanDevice; buffer: TVkBuffer; usage: TVkBufferUsageFlags; user_data: Tgpointer; notify: TGDestroyNotify): PGstMemory; cdecl; external libgstvulkan;

// === Konventiert am: 17-7-26 15:37:57 ===

function GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_CAST(obj: Pointer): PGstVulkanBufferMemoryAllocator;
function GST_TYPE_VULKAN_BUFFER_MEMORY_ALLOCATOR: TGType;
function GST_VULKAN_BUFFER_MEMORY_ALLOCATOR(obj: Pointer): PGstVulkanBufferMemoryAllocator;
function GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_CLASS(klass: Pointer): PGstVulkanBufferMemoryAllocatorClass;
function GST_IS_VULKAN_BUFFER_MEMORY_ALLOCATOR(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_BUFFER_MEMORY_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_GET_CLASS(obj: Pointer): PGstVulkanBufferMemoryAllocatorClass;
{$ENDIF read_function}



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


function GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_CAST(obj: Pointer): PGstVulkanBufferMemoryAllocator;
begin
  GST_VULKAN_BUFFER_MEMORY_ALLOCATOR_CAST := PGstVulkanBufferMemoryAllocator(obj);
end;

{$ENDIF read_implementation}
