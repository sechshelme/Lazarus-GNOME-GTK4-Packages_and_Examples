{$IFDEF read_interface}


type
  PVkInstance = ^TVkInstance;
  TVkInstance = type Pointer;

type
  PVkSurfaceKHR = ^TVkSurfaceKHR;
  TVkSurfaceKHR = type Pointer;

type
  PVkAllocationCallbacks = type Pointer;

  TsfVulkanFunctionPointer = procedure(para1: pointer); cdecl;

function sfVulkan_isAvailable(requireGraphics: TsfBool): TsfBool; cdecl; external libcsfml_window;
function sfVulkan_getFunction(name: pchar): TsfVulkanFunctionPointer; cdecl; external libcsfml_window;
function sfVulkan_getGraphicsRequiredInstanceExtensions: Ppchar; cdecl; external libcsfml_window;

// === Konventiert am: 24-9-25 16:58:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
