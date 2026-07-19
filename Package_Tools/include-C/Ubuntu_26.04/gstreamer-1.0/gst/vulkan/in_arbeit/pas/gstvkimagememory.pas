unit gstvkimagememory;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstvkbarrier, gstvkmemory;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$IFDEF read_enum}
const
  GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_NAME = 'VulkanImage';  
  GST_CAPS_FEATURE_MEMORY_VULKAN_IMAGE = 'memory:VulkanImage';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstVulkanBarrierImageInfo = ^TGstVulkanBarrierImageInfo;
  TGstVulkanBarrierImageInfo = record
      parent : TGstVulkanBarrierMemoryInfo;
      image_layout : TVkImageLayout;
      subresource_range : array[0..19] of Byte; // TVkImageSubresourceRange;
    end;

  PGstVulkanImageMemory = ^TGstVulkanImageMemory;
  TGstVulkanImageMemory = record
      parent : TGstMemory;
      device : PGstVulkanDevice;
      image : TVkImage;
      vk_mem : PGstVulkanMemory;
      create_info       : array[0..87] of Byte;    // TVkImageCreateInfo
      requirements      : array[0..23] of Byte;    // TVkMemoryRequirements
      format_properties : array[0..35] of Byte;    // TVkImageFormatProperties
      usage : TVkImageUsageFlags;
      barrier : TGstVulkanBarrierImageInfo;
      lock : TGMutex;
      wrapped : Tgboolean;
      notify : TGDestroyNotify;
      user_data : Tgpointer;
      views : PGPtrArray;
      outstanding_views : PGPtrArray;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

  TGstVulkanImageMemoryFindViewFunc = function (view:PGstVulkanImageView; user_data:Tgpointer):Tgboolean;cdecl;

  PGstVulkanImageMemoryAllocator = type Pointer;

  PGstVulkanImageMemoryAllocatorClass = ^TGstVulkanImageMemoryAllocatorClass;
  TGstVulkanImageMemoryAllocatorClass = record
      parent_class : TGstAllocatorClass;
      _reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;
  {$ENDIF read_struct}

  {$IFDEF read_function}
  function gst_vulkan_image_memory_allocator_get_type:TGType;cdecl;external libgstvulkan;
procedure gst_vulkan_image_memory_init_once;cdecl;external libgstvulkan;
function gst_is_vulkan_image_memory(mem:PGstMemory):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_image_memory_init(mem:PGstVulkanImageMemory; allocator:PGstAllocator; parent:PGstMemory; device:PGstVulkanDevice; format:TVkFormat; 
           usage:TVkImageUsageFlags; initial_layout:TVkImageLayout; params:PGstAllocationParams; size:Tgsize; user_data:Tgpointer; 
           notify:TGDestroyNotify):Tgboolean;cdecl;external libgstvulkan;
function gst_vulkan_image_memory_alloc_with_image_info(device:PGstVulkanDevice; image_info:PVkImageCreateInfo; mem_prop_flags:TVkMemoryPropertyFlags):PGstMemory;cdecl;external libgstvulkan;
function gst_vulkan_image_memory_alloc(device:PGstVulkanDevice; format:TVkFormat; width:Tgsize; height:Tgsize; tiling:TVkImageTiling; 
           usage:TVkImageUsageFlags; mem_prop_flags:TVkMemoryPropertyFlags):PGstMemory;cdecl;external libgstvulkan;
function gst_vulkan_image_memory_wrapped(device:PGstVulkanDevice; image:TVkImage; format:TVkFormat; width:Tgsize; height:Tgsize; 
           tiling:TVkImageTiling; usage:TVkImageUsageFlags; user_data:Tgpointer; notify:TGDestroyNotify):PGstMemory;cdecl;external libgstvulkan;
function gst_vulkan_image_memory_get_width(image:PGstVulkanImageMemory):Tguint32;cdecl;external libgstvulkan;
function gst_vulkan_image_memory_get_height(image:PGstVulkanImageMemory):Tguint32;cdecl;external libgstvulkan;
function gst_vulkan_image_memory_find_view(image:PGstVulkanImageMemory; find_func:TGstVulkanImageMemoryFindViewFunc; user_data:Tgpointer):PGstVulkanImageView;cdecl;external libgstvulkan;
procedure gst_vulkan_image_memory_add_view(image:PGstVulkanImageMemory; view:PGstVulkanImageView);cdecl;external libgstvulkan;

// === Konventiert am: 17-7-26 15:42:11 ===

function GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_CAST(obj: Pointer): PGstVulkanImageMemoryAllocator;
function GST_TYPE_VULKAN_IMAGE_MEMORY_ALLOCATOR: TGType;
function GST_VULKAN_IMAGE_MEMORY_ALLOCATOR(obj: Pointer): PGstVulkanImageMemoryAllocator;
function GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_CLASS(klass: Pointer): PGstVulkanImageMemoryAllocatorClass;
function GST_IS_VULKAN_IMAGE_MEMORY_ALLOCATOR(obj: Pointer): Tgboolean;
function GST_IS_VULKAN_IMAGE_MEMORY_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
function GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_GET_CLASS(obj: Pointer): PGstVulkanImageMemoryAllocatorClass;
{$ENDIF read_function}

implementation

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

function GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_CAST(obj: Pointer): PGstVulkanImageMemoryAllocator;
begin
  GST_VULKAN_IMAGE_MEMORY_ALLOCATOR_CAST := PGstVulkanImageMemoryAllocator(obj);
end;

end.
