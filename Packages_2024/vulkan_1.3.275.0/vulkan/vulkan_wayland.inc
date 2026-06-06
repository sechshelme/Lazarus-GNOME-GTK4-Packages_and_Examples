{$IFDEF read_interface}


const
  VULKAN_WAYLAND_H_ = 1;
  VK_KHR_wayland_surface = 1;
  VK_KHR_WAYLAND_SURFACE_SPEC_VERSION = 6;
  VK_KHR_WAYLAND_SURFACE_EXTENSION_NAME = 'VK_KHR_wayland_surface';

type
  PVkWaylandSurfaceCreateFlagsKHR = ^TVkWaylandSurfaceCreateFlagsKHR;
  TVkWaylandSurfaceCreateFlagsKHR = TVkFlags;

  TVkWaylandSurfaceCreateInfoKHR = record
    sType: TVkStructureType;
    pNext: pointer;
    flags: TVkWaylandSurfaceCreateFlagsKHR;
    display: Pwl_display;
    surface: Pwl_surface;
  end;
  PVkWaylandSurfaceCreateInfoKHR = ^TVkWaylandSurfaceCreateInfoKHR;

  TPFN_vkCreateWaylandSurfaceKHR = function(instance: TVkInstance; pCreateInfo: PVkWaylandSurfaceCreateInfoKHR; pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): TVkResult; cdecl;
  TPFN_vkGetPhysicalDeviceWaylandPresentationSupportKHR = function(physicalDevice: TVkPhysicalDevice; queueFamilyIndex: Tuint32_t; display: Pwl_display): TVkBool32; cdecl;

function vkCreateWaylandSurfaceKHR(instance: TVkInstance; pCreateInfo: PVkWaylandSurfaceCreateInfoKHR; pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): TVkResult; cdecl; external libvulkan;
function vkGetPhysicalDeviceWaylandPresentationSupportKHR(physicalDevice: TVkPhysicalDevice; queueFamilyIndex: Tuint32_t; display: Pwl_display): TVkBool32; cdecl; external libvulkan;

// === Konventiert am: 6-6-26 15:45:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
