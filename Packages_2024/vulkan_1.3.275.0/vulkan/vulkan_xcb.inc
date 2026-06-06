{$IFDEF read_interface}


const
  VULKAN_XCB_H_ = 1;
  VK_KHR_xcb_surface = 1;
  VK_KHR_XCB_SURFACE_SPEC_VERSION = 6;
  VK_KHR_XCB_SURFACE_EXTENSION_NAME = 'VK_KHR_xcb_surface';

type
  PVkXcbSurfaceCreateFlagsKHR = ^TVkXcbSurfaceCreateFlagsKHR;
  TVkXcbSurfaceCreateFlagsKHR = TVkFlags;

  TVkXcbSurfaceCreateInfoKHR = record
    sType: TVkStructureType;
    pNext: pointer;
    flags: TVkXcbSurfaceCreateFlagsKHR;
    connection: Pxcb_connection_t;
    window: Txcb_window_t;
  end;
  PVkXcbSurfaceCreateInfoKHR = ^TVkXcbSurfaceCreateInfoKHR;

  TPFN_vkCreateXcbSurfaceKHR = function(instance: TVkInstance; pCreateInfo: PVkXcbSurfaceCreateInfoKHR; pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): TVkResult; cdecl;
  TPFN_vkGetPhysicalDeviceXcbPresentationSupportKHR = function(physicalDevice: TVkPhysicalDevice; queueFamilyIndex: Tuint32_t; connection: Pxcb_connection_t; visual_id: Txcb_visualid_t): TVkBool32; cdecl;

function vkCreateXcbSurfaceKHR(instance: TVkInstance; pCreateInfo: PVkXcbSurfaceCreateInfoKHR; pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): TVkResult; cdecl; external libvulkan;
function vkGetPhysicalDeviceXcbPresentationSupportKHR(physicalDevice: TVkPhysicalDevice; queueFamilyIndex: Tuint32_t; connection: Pxcb_connection_t; visual_id: Txcb_visualid_t): TVkBool32; cdecl; external libvulkan;

// === Konventiert am: 6-6-26 15:45:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
