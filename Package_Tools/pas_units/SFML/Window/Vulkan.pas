unit Vulkan;

interface

uses
  fp_sfml, Config;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PVkInstance = ^TVkInstance;
  TVkInstance = type Pointer;

type
  PVkSurfaceKHR = ^TVkSurfaceKHR;
  TVkSurfaceKHR = type Pointer;

type
  TsfVulkanFunctionPointer = procedure(para1: pointer); cdecl;

function sfVulkan_isAvailable(requireGraphics: TsfBool): TsfBool; cdecl; external libsfml_window;
function sfVulkan_getFunction(name: pchar): TsfVulkanFunctionPointer; cdecl; external libsfml_window;
function sfVulkan_getGraphicsRequiredInstanceExtensions: Ppchar; cdecl; external libsfml_window;

// === Konventiert am: 24-9-25 16:58:01 ===


implementation



end.
