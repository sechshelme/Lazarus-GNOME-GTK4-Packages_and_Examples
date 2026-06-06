unit vulkan_directfb;

interface

uses
  fp_vulkan;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef VULKAN_DIRECTFB_H_}

const
  VULKAN_DIRECTFB_H_ = 1;  
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
{ VK_EXT_directfb_surface is a preprocessor guard. Do not pass it to API calls. }
  VK_EXT_directfb_surface = 1;  
  VK_EXT_DIRECTFB_SURFACE_SPEC_VERSION = 1;  
  VK_EXT_DIRECTFB_SURFACE_EXTENSION_NAME = 'VK_EXT_directfb_surface';  
type
  PVkDirectFBSurfaceCreateFlagsEXT = ^TVkDirectFBSurfaceCreateFlagsEXT;
  TVkDirectFBSurfaceCreateFlagsEXT = TVkFlags;

  PVkDirectFBSurfaceCreateInfoEXT = ^TVkDirectFBSurfaceCreateInfoEXT;
  TVkDirectFBSurfaceCreateInfoEXT = record
      sType : TVkStructureType;
      pNext : pointer;
      flags : TVkDirectFBSurfaceCreateFlagsEXT;
      dfb : PIDirectFB;
      surface : PIDirectFBSurface;
    end;

  TPFN_vkCreateDirectFBSurfaceEXT = function (instance:TVkInstance; pCreateInfo:PVkDirectFBSurfaceCreateInfoEXT; pAllocator:PVkAllocationCallbacks; pSurface:PVkSurfaceKHR):TVkResult;cdecl;

  TPFN_vkGetPhysicalDeviceDirectFBPresentationSupportEXT = function (physicalDevice:TVkPhysicalDevice; queueFamilyIndex:Tuint32_t; dfb:PIDirectFB):TVkBool32;cdecl;
{$ifndef VK_NO_PROTOTYPES}

function vkCreateDirectFBSurfaceEXT(instance:TVkInstance; pCreateInfo:PVkDirectFBSurfaceCreateInfoEXT; pAllocator:PVkAllocationCallbacks; pSurface:PVkSurfaceKHR):TVkResult;cdecl;external libvulkan;
function vkGetPhysicalDeviceDirectFBPresentationSupportEXT(physicalDevice:TVkPhysicalDevice; queueFamilyIndex:Tuint32_t; dfb:PIDirectFB):TVkBool32;cdecl;external libvulkan;
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 6-6-26 15:45:55 ===


implementation



end.
