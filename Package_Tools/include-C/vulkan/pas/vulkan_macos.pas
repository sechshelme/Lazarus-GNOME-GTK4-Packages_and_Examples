unit vulkan_macos;

interface

uses
  fp_vulkan;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef VULKAN_MACOS_H_}

const
  VULKAN_MACOS_H_ = 1;  
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
{ VK_MVK_macos_surface is a preprocessor guard. Do not pass it to API calls. }
  VK_MVK_macos_surface = 1;  
  VK_MVK_MACOS_SURFACE_SPEC_VERSION = 3;  
  VK_MVK_MACOS_SURFACE_EXTENSION_NAME = 'VK_MVK_macos_surface';  
type
  PVkMacOSSurfaceCreateFlagsMVK = ^TVkMacOSSurfaceCreateFlagsMVK;
  TVkMacOSSurfaceCreateFlagsMVK = TVkFlags;

  PVkMacOSSurfaceCreateInfoMVK = ^TVkMacOSSurfaceCreateInfoMVK;
  TVkMacOSSurfaceCreateInfoMVK = record
      sType : TVkStructureType;
      pNext : pointer;
      flags : TVkMacOSSurfaceCreateFlagsMVK;
      pView : pointer;
    end;

  TPFN_vkCreateMacOSSurfaceMVK = function (instance:TVkInstance; pCreateInfo:PVkMacOSSurfaceCreateInfoMVK; pAllocator:PVkAllocationCallbacks; pSurface:PVkSurfaceKHR):TVkResult;cdecl;
{$ifndef VK_NO_PROTOTYPES}

function vkCreateMacOSSurfaceMVK(instance:TVkInstance; pCreateInfo:PVkMacOSSurfaceCreateInfoMVK; pAllocator:PVkAllocationCallbacks; pSurface:PVkSurfaceKHR):TVkResult;cdecl;external libvulkan;
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 6-6-26 15:45:44 ===


implementation



end.
