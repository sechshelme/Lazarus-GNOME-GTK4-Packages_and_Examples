unit vulkan_xcb;

interface

uses
  fp_vulkan;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef VULKAN_XCB_H_}

const
  VULKAN_XCB_H_ = 1;  
{
** Copyright 2015-2024 The Khronos Group Inc.
**
** SPDX-License-Identifier: Apache-2.0
 }
{
** This header is generated from the Khronos Vulkan XML API Registry.
**
 }
{ C++ extern C conditionnal removed }
{ VK_KHR_xcb_surface is a preprocessor guard. Do not pass it to API calls. }
  VK_KHR_xcb_surface = 1;  
  VK_KHR_XCB_SURFACE_SPEC_VERSION = 6;  
  VK_KHR_XCB_SURFACE_EXTENSION_NAME = 'VK_KHR_xcb_surface';  
type
  PVkXcbSurfaceCreateFlagsKHR = ^TVkXcbSurfaceCreateFlagsKHR;
  TVkXcbSurfaceCreateFlagsKHR = TVkFlags;

  PVkXcbSurfaceCreateInfoKHR = ^TVkXcbSurfaceCreateInfoKHR;
  TVkXcbSurfaceCreateInfoKHR = record
      sType : TVkStructureType;
      pNext : pointer;
      flags : TVkXcbSurfaceCreateFlagsKHR;
      connection : Pxcb_connection_t;
      window : Txcb_window_t;
    end;

  TPFN_vkCreateXcbSurfaceKHR = function (instance:TVkInstance; pCreateInfo:PVkXcbSurfaceCreateInfoKHR; pAllocator:PVkAllocationCallbacks; pSurface:PVkSurfaceKHR):TVkResult;cdecl;

  TPFN_vkGetPhysicalDeviceXcbPresentationSupportKHR = function (physicalDevice:TVkPhysicalDevice; queueFamilyIndex:Tuint32_t; connection:Pxcb_connection_t; visual_id:Txcb_visualid_t):TVkBool32;cdecl;
{$ifndef VK_NO_PROTOTYPES}

function vkCreateXcbSurfaceKHR(instance:TVkInstance; pCreateInfo:PVkXcbSurfaceCreateInfoKHR; pAllocator:PVkAllocationCallbacks; pSurface:PVkSurfaceKHR):TVkResult;cdecl;external libvulkan;
function vkGetPhysicalDeviceXcbPresentationSupportKHR(physicalDevice:TVkPhysicalDevice; queueFamilyIndex:Tuint32_t; connection:Pxcb_connection_t; visual_id:Txcb_visualid_t):TVkBool32;cdecl;external libvulkan;
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 6-6-26 15:45:28 ===


implementation



end.
