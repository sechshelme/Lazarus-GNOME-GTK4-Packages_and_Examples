{$IFDEF read_interface}


const
  VULKAN_MACOS_H_ = 1;
  VK_MVK_macos_surface = 1;
  VK_MVK_MACOS_SURFACE_SPEC_VERSION = 3;
  VK_MVK_MACOS_SURFACE_EXTENSION_NAME = 'VK_MVK_macos_surface';

type
  PVkMacOSSurfaceCreateFlagsMVK = ^TVkMacOSSurfaceCreateFlagsMVK;
  TVkMacOSSurfaceCreateFlagsMVK = TVkFlags;

  TVkMacOSSurfaceCreateInfoMVK = record
    sType: TVkStructureType;
    pNext: pointer;
    flags: TVkMacOSSurfaceCreateFlagsMVK;
    pView: pointer;
  end;
  PVkMacOSSurfaceCreateInfoMVK = ^TVkMacOSSurfaceCreateInfoMVK;

  TPFN_vkCreateMacOSSurfaceMVK = function(instance: TVkInstance; pCreateInfo: PVkMacOSSurfaceCreateInfoMVK; pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): TVkResult; cdecl;

function vkCreateMacOSSurfaceMVK(instance: TVkInstance; pCreateInfo: PVkMacOSSurfaceCreateInfoMVK; pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): TVkResult; cdecl; external libvulkan;

// === Konventiert am: 6-6-26 15:45:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
