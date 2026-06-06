{$IFDEF read_interface}


const
  VULKAN_VI_H_ = 1;
  VK_NN_vi_surface = 1;
  VK_NN_VI_SURFACE_SPEC_VERSION = 1;
  VK_NN_VI_SURFACE_EXTENSION_NAME = 'VK_NN_vi_surface';

type
  PVkViSurfaceCreateFlagsNN = ^TVkViSurfaceCreateFlagsNN;
  TVkViSurfaceCreateFlagsNN = TVkFlags;

  TVkViSurfaceCreateInfoNN = record
    sType: TVkStructureType;
    pNext: pointer;
    flags: TVkViSurfaceCreateFlagsNN;
    window: pointer;
  end;
  PVkViSurfaceCreateInfoNN = ^TVkViSurfaceCreateInfoNN;

  TPFN_vkCreateViSurfaceNN = function(instance: TVkInstance; pCreateInfo: PVkViSurfaceCreateInfoNN; pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): TVkResult; cdecl;

function vkCreateViSurfaceNN(instance: TVkInstance; pCreateInfo: PVkViSurfaceCreateInfoNN; pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): TVkResult; cdecl; external libvulkan;

// === Konventiert am: 6-6-26 15:45:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
