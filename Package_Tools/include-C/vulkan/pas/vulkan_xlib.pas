unit vulkan_xlib;

interface

uses
  fp_vulkan;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef VULKAN_XLIB_H_}

const
  VULKAN_XLIB_H_ = 1;  
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
{ VK_KHR_xlib_surface is a preprocessor guard. Do not pass it to API calls. }
  VK_KHR_xlib_surface = 1;  
  VK_KHR_XLIB_SURFACE_SPEC_VERSION = 6;  
  VK_KHR_XLIB_SURFACE_EXTENSION_NAME = 'VK_KHR_xlib_surface';  
type
  PVkXlibSurfaceCreateFlagsKHR = ^TVkXlibSurfaceCreateFlagsKHR;
  TVkXlibSurfaceCreateFlagsKHR = TVkFlags;

  PVkXlibSurfaceCreateInfoKHR = ^TVkXlibSurfaceCreateInfoKHR;
  TVkXlibSurfaceCreateInfoKHR = record
      sType : TVkStructureType;
      pNext : pointer;
      flags : TVkXlibSurfaceCreateFlagsKHR;
      dpy : PDisplay;
      window : TWindow;
    end;

  TPFN_vkCreateXlibSurfaceKHR = function (instance:TVkInstance; pCreateInfo:PVkXlibSurfaceCreateInfoKHR; pAllocator:PVkAllocationCallbacks; pSurface:PVkSurfaceKHR):TVkResult;cdecl;

  TPFN_vkGetPhysicalDeviceXlibPresentationSupportKHR = function (physicalDevice:TVkPhysicalDevice; queueFamilyIndex:Tuint32_t; dpy:PDisplay; visualID:TVisualID):TVkBool32;cdecl;
{$ifndef VK_NO_PROTOTYPES}

function vkCreateXlibSurfaceKHR(instance:TVkInstance; pCreateInfo:PVkXlibSurfaceCreateInfoKHR; pAllocator:PVkAllocationCallbacks; pSurface:PVkSurfaceKHR):TVkResult;cdecl;external libvulkan;
function vkGetPhysicalDeviceXlibPresentationSupportKHR(physicalDevice:TVkPhysicalDevice; queueFamilyIndex:Tuint32_t; dpy:PDisplay; visualID:TVisualID):TVkBool32;cdecl;external libvulkan;
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 6-6-26 15:45:26 ===


implementation



end.
