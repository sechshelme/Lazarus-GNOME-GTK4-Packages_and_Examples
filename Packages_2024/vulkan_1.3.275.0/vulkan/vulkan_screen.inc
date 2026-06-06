{$IFDEF read_interface}


const
  VULKAN_SCREEN_H_ = 1;
  VK_QNX_screen_surface = 1;
  VK_QNX_SCREEN_SURFACE_SPEC_VERSION = 1;
  VK_QNX_SCREEN_SURFACE_EXTENSION_NAME = 'VK_QNX_screen_surface';

type
  PVkScreenSurfaceCreateFlagsQNX = ^TVkScreenSurfaceCreateFlagsQNX;
  TVkScreenSurfaceCreateFlagsQNX = TVkFlags;

  TVkScreenSurfaceCreateInfoQNX = record
    sType: TVkStructureType;
    pNext: pointer;
    flags: TVkScreenSurfaceCreateFlagsQNX;
    context: Pscreen_context;
    window: Pscreen_window;
  end;
  PVkScreenSurfaceCreateInfoQNX = ^TVkScreenSurfaceCreateInfoQNX;

  TPFN_vkCreateScreenSurfaceQNX = function(instance: TVkInstance; pCreateInfo: PVkScreenSurfaceCreateInfoQNX; pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): TVkResult; cdecl;
  TPFN_vkGetPhysicalDeviceScreenPresentationSupportQNX = function(physicalDevice: TVkPhysicalDevice; queueFamilyIndex: Tuint32_t; window: Pscreen_window): TVkBool32; cdecl;

function vkCreateScreenSurfaceQNX(instance: TVkInstance; pCreateInfo: PVkScreenSurfaceCreateInfoQNX; pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): TVkResult; cdecl; external libvulkan;
function vkGetPhysicalDeviceScreenPresentationSupportQNX(physicalDevice: TVkPhysicalDevice; queueFamilyIndex: Tuint32_t; window: Pscreen_window): TVkBool32; cdecl; external libvulkan;

const
  VK_QNX_external_memory_screen_buffer = 1;
  VK_QNX_EXTERNAL_MEMORY_SCREEN_BUFFER_SPEC_VERSION = 1;
  VK_QNX_EXTERNAL_MEMORY_SCREEN_BUFFER_EXTENSION_NAME = 'VK_QNX_external_memory_screen_buffer';

type
  TVkScreenBufferPropertiesQNX = record
    sType: TVkStructureType;
    pNext: pointer;
    allocationSize: TVkDeviceSize;
    memoryTypeBits: Tuint32_t;
  end;
  PVkScreenBufferPropertiesQNX = ^TVkScreenBufferPropertiesQNX;

  TVkScreenBufferFormatPropertiesQNX = record
    sType: TVkStructureType;
    pNext: pointer;
    format: TVkFormat;
    externalFormat: Tuint64_t;
    screenUsage: Tuint64_t;
    formatFeatures: TVkFormatFeatureFlags;
    samplerYcbcrConversionComponents: TVkComponentMapping;
    suggestedYcbcrModel: TVkSamplerYcbcrModelConversion;
    suggestedYcbcrRange: TVkSamplerYcbcrRange;
    suggestedXChromaOffset: TVkChromaLocation;
    suggestedYChromaOffset: TVkChromaLocation;
  end;
  PVkScreenBufferFormatPropertiesQNX = ^TVkScreenBufferFormatPropertiesQNX;

  TVkImportScreenBufferInfoQNX = record
    sType: TVkStructureType;
    pNext: pointer;
    buffer: Pscreen_buffer;
  end;
  PVkImportScreenBufferInfoQNX = ^TVkImportScreenBufferInfoQNX;

  TVkExternalFormatQNX = record
    sType: TVkStructureType;
    pNext: pointer;
    externalFormat: Tuint64_t;
  end;
  PVkExternalFormatQNX = ^TVkExternalFormatQNX;

  TVkPhysicalDeviceExternalMemoryScreenBufferFeaturesQNX = record
    sType: TVkStructureType;
    pNext: pointer;
    screenBufferImport: TVkBool32;
  end;
  PVkPhysicalDeviceExternalMemoryScreenBufferFeaturesQNX = ^TVkPhysicalDeviceExternalMemoryScreenBufferFeaturesQNX;

  TPFN_vkGetScreenBufferPropertiesQNX = function(device: TVkDevice; buffer: Pscreen_buffer; pProperties: PVkScreenBufferPropertiesQNX): TVkResult; cdecl;

function vkGetScreenBufferPropertiesQNX(device: TVkDevice; buffer: Pscreen_buffer; pProperties: PVkScreenBufferPropertiesQNX): TVkResult; cdecl; external libvulkan;

// === Konventiert am: 6-6-26 15:45:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
