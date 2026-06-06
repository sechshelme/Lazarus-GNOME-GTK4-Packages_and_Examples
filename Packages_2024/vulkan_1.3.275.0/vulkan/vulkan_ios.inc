{$IFDEF read_interface}


const
  VULKAN_IOS_H_ = 1;
  VK_MVK_ios_surface = 1;
  VK_MVK_IOS_SURFACE_SPEC_VERSION = 3;
  VK_MVK_IOS_SURFACE_EXTENSION_NAME = 'VK_MVK_ios_surface';

type
  PVkIOSSurfaceCreateFlagsMVK = ^TVkIOSSurfaceCreateFlagsMVK;
  TVkIOSSurfaceCreateFlagsMVK = TVkFlags;

  TVkIOSSurfaceCreateInfoMVK = record
    sType: TVkStructureType;
    pNext: pointer;
    flags: TVkIOSSurfaceCreateFlagsMVK;
    pView: pointer;
  end;
  PVkIOSSurfaceCreateInfoMVK = ^TVkIOSSurfaceCreateInfoMVK;

  TPFN_vkCreateIOSSurfaceMVK = function(instance: TVkInstance; pCreateInfo: PVkIOSSurfaceCreateInfoMVK; pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): TVkResult; cdecl;

function vkCreateIOSSurfaceMVK(instance: TVkInstance; pCreateInfo: PVkIOSSurfaceCreateInfoMVK; pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): TVkResult; cdecl; external libvulkan;

// === Konventiert am: 6-6-26 15:45:47 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
