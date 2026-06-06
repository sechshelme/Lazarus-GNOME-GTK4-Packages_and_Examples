{$IFDEF read_interface}


const
  VULKAN_XLIB_H_ = 1;
  VK_KHR_xlib_surface = 1;
  VK_KHR_XLIB_SURFACE_SPEC_VERSION = 6;
  VK_KHR_XLIB_SURFACE_EXTENSION_NAME = 'VK_KHR_xlib_surface';

type
  PVkXlibSurfaceCreateFlagsKHR = ^TVkXlibSurfaceCreateFlagsKHR;
  TVkXlibSurfaceCreateFlagsKHR = TVkFlags;

  TVkXlibSurfaceCreateInfoKHR = record
    sType: TVkStructureType;
    pNext: pointer;
    flags: TVkXlibSurfaceCreateFlagsKHR;
    dpy: PDisplay;
    window: TWindow;
  end;
  PVkXlibSurfaceCreateInfoKHR = ^TVkXlibSurfaceCreateInfoKHR;

  TPFN_vkCreateXlibSurfaceKHR = function(instance: TVkInstance; pCreateInfo: PVkXlibSurfaceCreateInfoKHR; pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): TVkResult; cdecl;
  TPFN_vkGetPhysicalDeviceXlibPresentationSupportKHR = function(physicalDevice: TVkPhysicalDevice; queueFamilyIndex: Tuint32_t; dpy: PDisplay; visualID: TVisualID): TVkBool32; cdecl;

function vkCreateXlibSurfaceKHR(instance: TVkInstance; pCreateInfo: PVkXlibSurfaceCreateInfoKHR; pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): TVkResult; cdecl; external libvulkan;
function vkGetPhysicalDeviceXlibPresentationSupportKHR(physicalDevice: TVkPhysicalDevice; queueFamilyIndex: Tuint32_t; dpy: PDisplay; visualID: TVisualID): TVkBool32; cdecl; external libvulkan;

// === Konventiert am: 6-6-26 15:45:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
