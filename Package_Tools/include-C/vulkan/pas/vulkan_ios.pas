unit vulkan_ios;

interface

uses
  fp_vulkan;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef VULKAN_IOS_H_}

const
  VULKAN_IOS_H_ = 1;  
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
{ VK_MVK_ios_surface is a preprocessor guard. Do not pass it to API calls. }
  VK_MVK_ios_surface = 1;  
  VK_MVK_IOS_SURFACE_SPEC_VERSION = 3;  
  VK_MVK_IOS_SURFACE_EXTENSION_NAME = 'VK_MVK_ios_surface';  
type
  PVkIOSSurfaceCreateFlagsMVK = ^TVkIOSSurfaceCreateFlagsMVK;
  TVkIOSSurfaceCreateFlagsMVK = TVkFlags;

  PVkIOSSurfaceCreateInfoMVK = ^TVkIOSSurfaceCreateInfoMVK;
  TVkIOSSurfaceCreateInfoMVK = record
      sType : TVkStructureType;
      pNext : pointer;
      flags : TVkIOSSurfaceCreateFlagsMVK;
      pView : pointer;
    end;

  TPFN_vkCreateIOSSurfaceMVK = function (instance:TVkInstance; pCreateInfo:PVkIOSSurfaceCreateInfoMVK; pAllocator:PVkAllocationCallbacks; pSurface:PVkSurfaceKHR):TVkResult;cdecl;
{$ifndef VK_NO_PROTOTYPES}

function vkCreateIOSSurfaceMVK(instance:TVkInstance; pCreateInfo:PVkIOSSurfaceCreateInfoMVK; pAllocator:PVkAllocationCallbacks; pSurface:PVkSurfaceKHR):TVkResult;cdecl;external libvulkan;
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 6-6-26 15:45:47 ===


implementation



end.
