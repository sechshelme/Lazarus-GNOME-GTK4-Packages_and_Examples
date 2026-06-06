{$IFDEF read_interface}


const
  VULKAN_DIRECTFB_H_ = 1;
  VK_EXT_directfb_surface = 1;
  VK_EXT_DIRECTFB_SURFACE_SPEC_VERSION = 1;
  VK_EXT_DIRECTFB_SURFACE_EXTENSION_NAME = 'VK_EXT_directfb_surface';

type
  PVkDirectFBSurfaceCreateFlagsEXT = ^TVkDirectFBSurfaceCreateFlagsEXT;
  TVkDirectFBSurfaceCreateFlagsEXT = TVkFlags;

  TVkDirectFBSurfaceCreateInfoEXT = record
    sType: TVkStructureType;
    pNext: pointer;
    flags: TVkDirectFBSurfaceCreateFlagsEXT;
    dfb: PIDirectFB;
    surface: PIDirectFBSurface;
  end;
  PVkDirectFBSurfaceCreateInfoEXT = ^TVkDirectFBSurfaceCreateInfoEXT;

  TPFN_vkCreateDirectFBSurfaceEXT = function(instance: TVkInstance; pCreateInfo: PVkDirectFBSurfaceCreateInfoEXT; pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): TVkResult; cdecl;
  TPFN_vkGetPhysicalDeviceDirectFBPresentationSupportEXT = function(physicalDevice: TVkPhysicalDevice; queueFamilyIndex: Tuint32_t; dfb: PIDirectFB): TVkBool32; cdecl;

function vkCreateDirectFBSurfaceEXT(instance: TVkInstance; pCreateInfo: PVkDirectFBSurfaceCreateInfoEXT; pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): TVkResult; cdecl; external libvulkan;
function vkGetPhysicalDeviceDirectFBPresentationSupportEXT(physicalDevice: TVkPhysicalDevice; queueFamilyIndex: Tuint32_t; dfb: PIDirectFB): TVkBool32; cdecl; external libvulkan;

// === Konventiert am: 6-6-26 15:45:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
