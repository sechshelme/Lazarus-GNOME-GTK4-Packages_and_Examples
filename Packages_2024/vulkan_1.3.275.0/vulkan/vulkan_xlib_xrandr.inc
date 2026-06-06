{$IFDEF read_interface}


const
  VULKAN_XLIB_XRANDR_H_ = 1;
  VK_EXT_acquire_xlib_display = 1;
  VK_EXT_ACQUIRE_XLIB_DISPLAY_SPEC_VERSION = 1;
  VK_EXT_ACQUIRE_XLIB_DISPLAY_EXTENSION_NAME = 'VK_EXT_acquire_xlib_display';

type
  TPFN_vkAcquireXlibDisplayEXT = function(physicalDevice: TVkPhysicalDevice; dpy: PDisplay; display: TVkDisplayKHR): TVkResult; cdecl;
  TPFN_vkGetRandROutputDisplayEXT = function(physicalDevice: TVkPhysicalDevice; dpy: PDisplay; rrOutput: TRROutput; pDisplay: PVkDisplayKHR): TVkResult; cdecl;

function vkAcquireXlibDisplayEXT(physicalDevice: TVkPhysicalDevice; dpy: PDisplay; display: TVkDisplayKHR): TVkResult; cdecl; external libvulkan;
function vkGetRandROutputDisplayEXT(physicalDevice: TVkPhysicalDevice; dpy: PDisplay; rrOutput: TRROutput; pDisplay: PVkDisplayKHR): TVkResult; cdecl; external libvulkan;

// === Konventiert am: 6-6-26 15:45:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
