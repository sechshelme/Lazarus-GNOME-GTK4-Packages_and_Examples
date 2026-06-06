unit vulkan_vi;

interface

uses
  fp_vulkan;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef VULKAN_VI_H_}

const
  VULKAN_VI_H_ = 1;  
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
{ VK_NN_vi_surface is a preprocessor guard. Do not pass it to API calls. }
  VK_NN_vi_surface = 1;  
  VK_NN_VI_SURFACE_SPEC_VERSION = 1;  
  VK_NN_VI_SURFACE_EXTENSION_NAME = 'VK_NN_vi_surface';  
type
  PVkViSurfaceCreateFlagsNN = ^TVkViSurfaceCreateFlagsNN;
  TVkViSurfaceCreateFlagsNN = TVkFlags;

  PVkViSurfaceCreateInfoNN = ^TVkViSurfaceCreateInfoNN;
  TVkViSurfaceCreateInfoNN = record
      sType : TVkStructureType;
      pNext : pointer;
      flags : TVkViSurfaceCreateFlagsNN;
      window : pointer;
    end;

  TPFN_vkCreateViSurfaceNN = function (instance:TVkInstance; pCreateInfo:PVkViSurfaceCreateInfoNN; pAllocator:PVkAllocationCallbacks; pSurface:PVkSurfaceKHR):TVkResult;cdecl;
{$ifndef VK_NO_PROTOTYPES}

function vkCreateViSurfaceNN(instance:TVkInstance; pCreateInfo:PVkViSurfaceCreateInfoNN; pAllocator:PVkAllocationCallbacks; pSurface:PVkSurfaceKHR):TVkResult;cdecl;external libvulkan;
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 6-6-26 15:45:36 ===


implementation



end.
