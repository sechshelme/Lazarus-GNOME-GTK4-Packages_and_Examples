{$IFDEF read_interface}


const
  VULKAN_ANDROID_H_ = 1;
  VK_KHR_android_surface = 1;

const
  VK_KHR_ANDROID_SURFACE_SPEC_VERSION = 6;
  VK_KHR_ANDROID_SURFACE_EXTENSION_NAME = 'VK_KHR_android_surface';

type
  PVkAndroidSurfaceCreateFlagsKHR = ^TVkAndroidSurfaceCreateFlagsKHR;
  TVkAndroidSurfaceCreateFlagsKHR = TVkFlags;

  TVkAndroidSurfaceCreateInfoKHR = record
    sType: TVkStructureType;
    pNext: pointer;
    flags: TVkAndroidSurfaceCreateFlagsKHR;
    window: PANativeWindow;
  end;
  PVkAndroidSurfaceCreateInfoKHR = ^TVkAndroidSurfaceCreateInfoKHR;

  TPFN_vkCreateAndroidSurfaceKHR = function(instance: TVkInstance; pCreateInfo: PVkAndroidSurfaceCreateInfoKHR; pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): TVkResult; cdecl;

function vkCreateAndroidSurfaceKHR(instance: TVkInstance; pCreateInfo: PVkAndroidSurfaceCreateInfoKHR; pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): TVkResult; cdecl; external libvulkan;

const
  VK_ANDROID_external_memory_android_hardware_buffer = 1;

type
  PAHardwareBuffer = type Pointer;
  PPAHardwareBuffer = ^PAHardwareBuffer;

const
  VK_ANDROID_EXTERNAL_MEMORY_ANDROID_HARDWARE_BUFFER_SPEC_VERSION = 5;
  VK_ANDROID_EXTERNAL_MEMORY_ANDROID_HARDWARE_BUFFER_EXTENSION_NAME = 'VK_ANDROID_external_memory_android_hardware_buffer';

type
  TVkAndroidHardwareBufferUsageANDROID = record
    sType: TVkStructureType;
    pNext: pointer;
    androidHardwareBufferUsage: Tuint64_t;
  end;
  PVkAndroidHardwareBufferUsageANDROID = ^TVkAndroidHardwareBufferUsageANDROID;

  TVkAndroidHardwareBufferPropertiesANDROID = record
    sType: TVkStructureType;
    pNext: pointer;
    allocationSize: TVkDeviceSize;
    memoryTypeBits: Tuint32_t;
  end;
  PVkAndroidHardwareBufferPropertiesANDROID = ^TVkAndroidHardwareBufferPropertiesANDROID;

  TVkAndroidHardwareBufferFormatPropertiesANDROID = record
    sType: TVkStructureType;
    pNext: pointer;
    format: TVkFormat;
    externalFormat: Tuint64_t;
    formatFeatures: TVkFormatFeatureFlags;
    samplerYcbcrConversionComponents: TVkComponentMapping;
    suggestedYcbcrModel: TVkSamplerYcbcrModelConversion;
    suggestedYcbcrRange: TVkSamplerYcbcrRange;
    suggestedXChromaOffset: TVkChromaLocation;
    suggestedYChromaOffset: TVkChromaLocation;
  end;
  PVkAndroidHardwareBufferFormatPropertiesANDROID = ^TVkAndroidHardwareBufferFormatPropertiesANDROID;

  TVkImportAndroidHardwareBufferInfoANDROID = record
    sType: TVkStructureType;
    pNext: pointer;
    buffer: PAHardwareBuffer;
  end;
  PVkImportAndroidHardwareBufferInfoANDROID = ^TVkImportAndroidHardwareBufferInfoANDROID;

  TVkMemoryGetAndroidHardwareBufferInfoANDROID = record
    sType: TVkStructureType;
    pNext: pointer;
    memory: TVkDeviceMemory;
  end;
  PVkMemoryGetAndroidHardwareBufferInfoANDROID = ^TVkMemoryGetAndroidHardwareBufferInfoANDROID;

  TVkExternalFormatANDROID = record
    sType: TVkStructureType;
    pNext: pointer;
    externalFormat: Tuint64_t;
  end;
  PVkExternalFormatANDROID = ^TVkExternalFormatANDROID;

  TVkAndroidHardwareBufferFormatProperties2ANDROID = record
    sType: TVkStructureType;
    pNext: pointer;
    format: TVkFormat;
    externalFormat: Tuint64_t;
    formatFeatures: TVkFormatFeatureFlags2;
    samplerYcbcrConversionComponents: TVkComponentMapping;
    suggestedYcbcrModel: TVkSamplerYcbcrModelConversion;
    suggestedYcbcrRange: TVkSamplerYcbcrRange;
    suggestedXChromaOffset: TVkChromaLocation;
    suggestedYChromaOffset: TVkChromaLocation;
  end;
  PVkAndroidHardwareBufferFormatProperties2ANDROID = ^TVkAndroidHardwareBufferFormatProperties2ANDROID;

  TPFN_vkGetAndroidHardwareBufferPropertiesANDROID = function(device: TVkDevice; buffer: PAHardwareBuffer; pProperties: PVkAndroidHardwareBufferPropertiesANDROID): TVkResult; cdecl;
  TPFN_vkGetMemoryAndroidHardwareBufferANDROID = function(device: TVkDevice; pInfo: PVkMemoryGetAndroidHardwareBufferInfoANDROID; pBuffer: PPAHardwareBuffer): TVkResult; cdecl;

function vkGetAndroidHardwareBufferPropertiesANDROID(device: TVkDevice; buffer: PAHardwareBuffer; pProperties: PVkAndroidHardwareBufferPropertiesANDROID): TVkResult; cdecl; external libvulkan;
function vkGetMemoryAndroidHardwareBufferANDROID(device: TVkDevice; pInfo: PVkMemoryGetAndroidHardwareBufferInfoANDROID; pBuffer: PPAHardwareBuffer): TVkResult; cdecl; external libvulkan;

const
  VK_ANDROID_external_format_resolve = 1;
  VK_ANDROID_EXTERNAL_FORMAT_RESOLVE_SPEC_VERSION = 1;
  VK_ANDROID_EXTERNAL_FORMAT_RESOLVE_EXTENSION_NAME = 'VK_ANDROID_external_format_resolve';

type
  TVkPhysicalDeviceExternalFormatResolveFeaturesANDROID = record
    sType: TVkStructureType;
    pNext: pointer;
    externalFormatResolve: TVkBool32;
  end;
  PVkPhysicalDeviceExternalFormatResolveFeaturesANDROID = ^TVkPhysicalDeviceExternalFormatResolveFeaturesANDROID;

  TVkPhysicalDeviceExternalFormatResolvePropertiesANDROID = record
    sType: TVkStructureType;
    pNext: pointer;
    nullColorAttachmentWithExternalFormatResolve: TVkBool32;
    externalFormatResolveChromaOffsetX: TVkChromaLocation;
    externalFormatResolveChromaOffsetY: TVkChromaLocation;
  end;
  PVkPhysicalDeviceExternalFormatResolvePropertiesANDROID = ^TVkPhysicalDeviceExternalFormatResolvePropertiesANDROID;

  TVkAndroidHardwareBufferFormatResolvePropertiesANDROID = record
    sType: TVkStructureType;
    pNext: pointer;
    colorAttachmentFormat: TVkFormat;
  end;
  PVkAndroidHardwareBufferFormatResolvePropertiesANDROID = ^TVkAndroidHardwareBufferFormatResolvePropertiesANDROID;

  // === Konventiert am: 6-6-26 15:46:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
