unit fp_gst_vulkan;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_video,
  fp_gst_base;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // ==== Vulkan
  // /usr/include/vulkan/vulkan_core.h
type
  TVkDeviceSize = uint64;
  TVkSemaphore = uint64;
  TVkBuffer = uint64;
  TVkDescriptorPool = uint64;
  TVkDescriptorSet = uint64;
  TVkSurfaceKHR = uint64;
  TVkImage = uint64;

  TVkFlags = uint32;

  TVkMemoryPropertyFlags = TVkFlags;
  PVkMemoryPropertyFlags = ^TVkMemoryPropertyFlags;

  TVkBufferUsageFlags = TVkFlags;
  TVkMemoryHeapFlags = TVkFlags;
  TVkQueueFlags = TVkFlags;
  TVkSampleCountFlags = TVkFlags;
  TVkImageAspectFlags = TVkFlags;

  TVkImageUsageFlags = TVkFlags;
  PVkImageUsageFlags = ^TVkImageUsageFlags;

  TVkCommandBufferLevel = longint;
  TVkFormat = longint;
  PVkFormat = ^TVkFormat;
  TVkImageTiling = longint;
  TVkSamplerYcbcrRange = longint;
  TVkChromaLocation = longint;
  TVkResult = longint;
  TVkBlendOp = longint;
  TVkBlendFactor = longint;
  TVkPhysicalDeviceType = longint;
  TVkPresentModeKHR = longint;
  TVkQueryType = longint;
  TVkQueueFlagBits = longint;
  TVkImageLayout = longint;
  PVkImageLayout = ^TVkImageLayout;

  PVkSemaphore = type Pointer;
  PVkCommandBuffer = type Pointer;
  PVkImage = type Pointer;
  PVkBuffer = type Pointer;
  PVkSurfaceKHR = type Pointer;
  PVkDescriptorPool = type Pointer;
  PVkDescriptorSet = type Pointer;
  PVkMemoryRequirements = type Pointer;
  PVkImageCreateInfo = type Pointer;
  PVkImageViewCreateInfo = type Pointer;
  PVkVideoFormatPropertiesKHR = type Pointer;
  PVkBufferCreateInfo = type Pointer;
  PVkBaseInStructure = type Pointer;
  PVkPhysicalDevice = type Pointer;
  PPVkPhysicalDevice = ^PVkPhysicalDevice;

  TVkCommandBuffer = type Pointer;
  TVkPhysicalDevice = type Pointer;


  {$DEFINE read_enum}
  {$include fp_gst_vulkan_includes.inc}
  {$UNDEF read_enum}

  {$DEFINE read_struct}
  {$include fp_gst_vulkan_includes.inc}
  {$UNDEF read_struct}

  {$DEFINE read_function}
  {$include fp_gst_vulkan_includes.inc}
  {$UNDEF read_function}

implementation

{$DEFINE read_implementation}
{$include fp_gst_vulkan_includes.inc}
{$UNDEF read_implementation}

end.
