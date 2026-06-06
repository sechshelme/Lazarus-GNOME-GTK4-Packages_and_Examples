unit vulkan_wayland;

interface

uses
  fp_vulkan;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef VULKAN_WAYLAND_H_}

const
  VULKAN_WAYLAND_H_ = 1;  
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
{ VK_KHR_wayland_surface is a preprocessor guard. Do not pass it to API calls. }
  VK_KHR_wayland_surface = 1;  
  VK_KHR_WAYLAND_SURFACE_SPEC_VERSION = 6;  
  VK_KHR_WAYLAND_SURFACE_EXTENSION_NAME = 'VK_KHR_wayland_surface';  
type
  PVkWaylandSurfaceCreateFlagsKHR = ^TVkWaylandSurfaceCreateFlagsKHR;
  TVkWaylandSurfaceCreateFlagsKHR = TVkFlags;

  PVkWaylandSurfaceCreateInfoKHR = ^TVkWaylandSurfaceCreateInfoKHR;
  TVkWaylandSurfaceCreateInfoKHR = record
      sType : TVkStructureType;
      pNext : pointer;
      flags : TVkWaylandSurfaceCreateFlagsKHR;
      display : Pwl_display;
      surface : Pwl_surface;
    end;

  TPFN_vkCreateWaylandSurfaceKHR = function (instance:TVkInstance; pCreateInfo:PVkWaylandSurfaceCreateInfoKHR; pAllocator:PVkAllocationCallbacks; pSurface:PVkSurfaceKHR):TVkResult;cdecl;

  TPFN_vkGetPhysicalDeviceWaylandPresentationSupportKHR = function (physicalDevice:TVkPhysicalDevice; queueFamilyIndex:Tuint32_t; display:Pwl_display):TVkBool32;cdecl;
{$ifndef VK_NO_PROTOTYPES}

function vkCreateWaylandSurfaceKHR(instance:TVkInstance; pCreateInfo:PVkWaylandSurfaceCreateInfoKHR; pAllocator:PVkAllocationCallbacks; pSurface:PVkSurfaceKHR):TVkResult;cdecl;external libvulkan;
function vkGetPhysicalDeviceWaylandPresentationSupportKHR(physicalDevice:TVkPhysicalDevice; queueFamilyIndex:Tuint32_t; display:Pwl_display):TVkBool32;cdecl;external libvulkan;
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 6-6-26 15:45:33 ===


implementation



end.
