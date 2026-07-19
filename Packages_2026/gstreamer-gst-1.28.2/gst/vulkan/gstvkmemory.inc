

  {$IFDEF read_enum}
const
  GST_VULKAN_MEMORY_ALLOCATOR_NAME = 'Vulkan';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstVulkanMemory = type Pointer;

  PGstVulkanMemoryAllocator = type Pointer;

  PGstVulkanMemoryAllocatorClass = ^TGstVulkanMemoryAllocatorClass;
  TGstVulkanMemoryAllocatorClass = record
    parent_class: TGstAllocatorClass;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_vulkan_memory_allocator_get_type: TGType; cdecl; external libgstvulkan;
procedure gst_vulkan_memory_init_once; cdecl; external libgstvulkan;
function gst_is_vulkan_memory(mem: PGstMemory): Tgboolean; cdecl; external libgstvulkan;
function gst_vulkan_memory_alloc(device: PGstVulkanDevice; memory_type_index: Tguint32; params: PGstAllocationParams; size: Tgsize; mem_prop_flags: TVkMemoryPropertyFlags): PGstMemory; cdecl; external libgstvulkan;
function gst_vulkan_memory_find_memory_type_index_with_requirements(device: PGstVulkanDevice; req: PVkMemoryRequirements; properties: TVkMemoryPropertyFlags; type_index: Pguint32): Tgboolean; cdecl; external libgstvulkan;

// === Konventiert am: 17-7-26 15:46:58 ===

function GST_VULKAN_MEMORY_ALLOCATOR_CAST(obj: Pointer): PGstVulkanMemoryAllocator;
function GST_TYPE_VULKAN_MEMORY_ALLOCATOR: TGType;
function GST_VULKAN_MEMORY_ALLOCATOR(obj: Pointer): PGstVulkanMemoryAllocator;
function GST_VULKAN_MEMORY_ALLOCATOR_CLASS(klass: Pointer): PGstVulkanMemoryAllocatorClass;
function GST_IS_VULKAN_MEMORY_ALLOCATOR(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_MEMORY_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_MEMORY_ALLOCATOR_GET_CLASS(obj: Pointer): PGstVulkanMemoryAllocatorClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_VULKAN_MEMORY_ALLOCATOR: TGType;
begin
  GST_TYPE_VULKAN_MEMORY_ALLOCATOR := gst_vulkan_memory_allocator_get_type;
end;

function GST_VULKAN_MEMORY_ALLOCATOR(obj: Pointer): PGstVulkanMemoryAllocator;
begin
  Result := PGstVulkanMemoryAllocator(g_type_check_instance_cast(obj, GST_TYPE_VULKAN_MEMORY_ALLOCATOR));
end;

function GST_VULKAN_MEMORY_ALLOCATOR_CLASS(klass: Pointer): PGstVulkanMemoryAllocatorClass;
begin
  Result := PGstVulkanMemoryAllocatorClass(g_type_check_class_cast(klass, GST_TYPE_VULKAN_MEMORY_ALLOCATOR));
end;

function GST_IS_VULKAN_MEMORY_ALLOCATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VULKAN_MEMORY_ALLOCATOR);
end;

function GST_IS_VULKAN_MEMORY_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VULKAN_MEMORY_ALLOCATOR);
end;

function GST_VULKAN_MEMORY_ALLOCATOR_GET_CLASS(obj: Pointer): PGstVulkanMemoryAllocatorClass;
begin
  Result := PGstVulkanMemoryAllocatorClass(PGTypeInstance(obj)^.g_class);
end;

function GST_VULKAN_MEMORY_ALLOCATOR_CAST(obj: Pointer): PGstVulkanMemoryAllocator;
begin
  GST_VULKAN_MEMORY_ALLOCATOR_CAST := PGstVulkanMemoryAllocator(obj);
end;

{$ENDIF read_implementation}
