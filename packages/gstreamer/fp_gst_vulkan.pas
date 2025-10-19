unit fp_gst_vulkan;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_video,
  fp_gst_base,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // ==== Vulkan
  // /usr/include/vulkan/vulkan_core.h
type
  TVkDeviceSize = uint64;

  TVkFlags = uint32;
  TVkMemoryPropertyFlags = TVkFlags;
  TVkBufferUsageFlags = TVkFlags;
  TVkMemoryHeapFlags = TVkFlags;
  TVkQueueFlags = TVkFlags;
  TVkSampleCountFlags = TVkFlags;
  TVkImageAspectFlags = TVkFlags;
  TVkImageUsageFlags = TVkFlags;
  PVkImageUsageFlags = ^TVkImageUsageFlags;

  TVkCommandBufferLevel = longint;           // enum
  TVkImageLayout = longint;                  // enum
  TVkFormat = longint;                       // enum
  PVkFormat = ^TVkFormat;
  TVkImageTiling = longint;                  // enum
  TVkSamplerYcbcrRange = longint;            // enum
  TVkChromaLocation = longint;               // enum
  TVkResult = longint;                       // enum
  TVkBlendOp = longint;                      // enum
  TVkBlendFactor = longint;                  // enum
  TVkPhysicalDeviceType = longint;           // enum
  TVkPresentModeKHR = longint;               // enum
  TVkQueryType = longint;                    // enum
  TVkQueueFlagBits = longint;                // enum

  PVkSemaphore = type Pointer;
  PVkCommandBuffer = type Pointer;
  PVkImage = type Pointer;
  PVkBuffer = type Pointer;
  PVkSurfaceKHR = type Pointer;
  PVkDescriptorPool = type Pointer;
  PVkDescriptorSet = type Pointer;
  PVkPhysicalDevice = type Pointer;
  PPVkPhysicalDevice = ^PVkPhysicalDevice;

  PVkMemoryRequirements = type Pointer;
  PVkImageCreateInfo = type Pointer;
  PVkImageViewCreateInfo = type Pointer;
  PVkVideoFormatPropertiesKHR = type Pointer;
  PVkBufferCreateInfo = type Pointer;

  {$DEFINE read_interface}
  {$include fp_gst_vulkan_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_gst_vulkan_includes.inc}
{$UNDEF read_implementation}

end.
