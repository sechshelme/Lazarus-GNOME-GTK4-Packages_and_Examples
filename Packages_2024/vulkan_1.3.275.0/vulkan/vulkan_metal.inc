{$IFDEF read_interface}


const
  VULKAN_METAL_H_ = 1;
  VK_EXT_metal_surface = 1;

const
  VK_EXT_METAL_SURFACE_SPEC_VERSION = 1;
  VK_EXT_METAL_SURFACE_EXTENSION_NAME = 'VK_EXT_metal_surface';

type
  PVkMetalSurfaceCreateFlagsEXT = ^TVkMetalSurfaceCreateFlagsEXT;
  TVkMetalSurfaceCreateFlagsEXT = TVkFlags;

  TVkMetalSurfaceCreateInfoEXT = record
    sType: TVkStructureType;
    pNext: pointer;
    flags: TVkMetalSurfaceCreateFlagsEXT;
    pLayer: PCAMetalLayer;
  end;
  PVkMetalSurfaceCreateInfoEXT = ^TVkMetalSurfaceCreateInfoEXT;

  TPFN_vkCreateMetalSurfaceEXT = function(instance: TVkInstance; pCreateInfo: PVkMetalSurfaceCreateInfoEXT; pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): TVkResult; cdecl;

function vkCreateMetalSurfaceEXT(instance: TVkInstance; pCreateInfo: PVkMetalSurfaceCreateInfoEXT; pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): TVkResult; cdecl; external libvulkan;

const
  VK_EXT_metal_objects = 1;

type
  PMTLDevice_id = ^TMTLDevice_id;
  TMTLDevice_id = pointer;

  PMTLCommandQueue_id = ^TMTLCommandQueue_id;
  TMTLCommandQueue_id = pointer;

  PMTLBuffer_id = ^TMTLBuffer_id;
  TMTLBuffer_id = pointer;

  PMTLTexture_id = ^TMTLTexture_id;
  TMTLTexture_id = pointer;

  PIOSurfaceRef = ^TIOSurfaceRef;
  TIOSurfaceRef = P_IOSurface;

  PMTLSharedEvent_id = ^TMTLSharedEvent_id;
  TMTLSharedEvent_id = pointer;

const
  VK_EXT_METAL_OBJECTS_SPEC_VERSION = 1;
  VK_EXT_METAL_OBJECTS_EXTENSION_NAME = 'VK_EXT_metal_objects';

type
  PVkExportMetalObjectTypeFlagBitsEXT = ^TVkExportMetalObjectTypeFlagBitsEXT;
  TVkExportMetalObjectTypeFlagBitsEXT = longint;

const
  VK_EXPORT_METAL_OBJECT_TYPE_METAL_DEVICE_BIT_EXT = $00000001;
  VK_EXPORT_METAL_OBJECT_TYPE_METAL_COMMAND_QUEUE_BIT_EXT = $00000002;
  VK_EXPORT_METAL_OBJECT_TYPE_METAL_BUFFER_BIT_EXT = $00000004;
  VK_EXPORT_METAL_OBJECT_TYPE_METAL_TEXTURE_BIT_EXT = $00000008;
  VK_EXPORT_METAL_OBJECT_TYPE_METAL_IOSURFACE_BIT_EXT = $00000010;
  VK_EXPORT_METAL_OBJECT_TYPE_METAL_SHARED_EVENT_BIT_EXT = $00000020;
  VK_EXPORT_METAL_OBJECT_TYPE_FLAG_BITS_MAX_ENUM_EXT = $7FFFFFFF;

type
  PVkExportMetalObjectTypeFlagsEXT = ^TVkExportMetalObjectTypeFlagsEXT;
  TVkExportMetalObjectTypeFlagsEXT = TVkFlags;

  TVkExportMetalObjectCreateInfoEXT = record
    sType: TVkStructureType;
    pNext: pointer;
    exportObjectType: TVkExportMetalObjectTypeFlagBitsEXT;
  end;
  PVkExportMetalObjectCreateInfoEXT = ^TVkExportMetalObjectCreateInfoEXT;

  TVkExportMetalObjectsInfoEXT = record
    sType: TVkStructureType;
    pNext: pointer;
  end;
  PVkExportMetalObjectsInfoEXT = ^TVkExportMetalObjectsInfoEXT;

  TVkExportMetalDeviceInfoEXT = record
    sType: TVkStructureType;
    pNext: pointer;
    mtlDevice: TMTLDevice_id;
  end;
  PVkExportMetalDeviceInfoEXT = ^TVkExportMetalDeviceInfoEXT;

  TVkExportMetalCommandQueueInfoEXT = record
    sType: TVkStructureType;
    pNext: pointer;
    queue: TVkQueue;
    mtlCommandQueue: TMTLCommandQueue_id;
  end;
  PVkExportMetalCommandQueueInfoEXT = ^TVkExportMetalCommandQueueInfoEXT;

  TVkExportMetalBufferInfoEXT = record
    sType: TVkStructureType;
    pNext: pointer;
    memory: TVkDeviceMemory;
    mtlBuffer: TMTLBuffer_id;
  end;
  PVkExportMetalBufferInfoEXT = ^TVkExportMetalBufferInfoEXT;

  TVkImportMetalBufferInfoEXT = record
    sType: TVkStructureType;
    pNext: pointer;
    mtlBuffer: TMTLBuffer_id;
  end;
  PVkImportMetalBufferInfoEXT = ^TVkImportMetalBufferInfoEXT;

  TVkExportMetalTextureInfoEXT = record
    sType: TVkStructureType;
    pNext: pointer;
    image: TVkImage;
    imageView: TVkImageView;
    bufferView: TVkBufferView;
    plane: TVkImageAspectFlagBits;
    mtlTexture: TMTLTexture_id;
  end;
  PVkExportMetalTextureInfoEXT = ^TVkExportMetalTextureInfoEXT;

  TVkImportMetalTextureInfoEXT = record
    sType: TVkStructureType;
    pNext: pointer;
    plane: TVkImageAspectFlagBits;
    mtlTexture: TMTLTexture_id;
  end;
  PVkImportMetalTextureInfoEXT = ^TVkImportMetalTextureInfoEXT;

  TVkExportMetalIOSurfaceInfoEXT = record
    sType: TVkStructureType;
    pNext: pointer;
    image: TVkImage;
    ioSurface: TIOSurfaceRef;
  end;
  PVkExportMetalIOSurfaceInfoEXT = ^TVkExportMetalIOSurfaceInfoEXT;

  TVkImportMetalIOSurfaceInfoEXT = record
    sType: TVkStructureType;
    pNext: pointer;
    ioSurface: TIOSurfaceRef;
  end;
  PVkImportMetalIOSurfaceInfoEXT = ^TVkImportMetalIOSurfaceInfoEXT;

  TVkExportMetalSharedEventInfoEXT = record
    sType: TVkStructureType;
    pNext: pointer;
    semaphore: TVkSemaphore;
    event: TVkEvent;
    mtlSharedEvent: TMTLSharedEvent_id;
  end;
  PVkExportMetalSharedEventInfoEXT = ^TVkExportMetalSharedEventInfoEXT;

  TVkImportMetalSharedEventInfoEXT = record
    sType: TVkStructureType;
    pNext: pointer;
    mtlSharedEvent: TMTLSharedEvent_id;
  end;
  PVkImportMetalSharedEventInfoEXT = ^TVkImportMetalSharedEventInfoEXT;

  TPFN_vkExportMetalObjectsEXT = procedure(device: TVkDevice; pMetalObjectsInfo: PVkExportMetalObjectsInfoEXT); cdecl;

procedure vkExportMetalObjectsEXT(device: TVkDevice; pMetalObjectsInfo: PVkExportMetalObjectsInfoEXT); cdecl; external libvulkan;

// === Konventiert am: 6-6-26 15:45:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
