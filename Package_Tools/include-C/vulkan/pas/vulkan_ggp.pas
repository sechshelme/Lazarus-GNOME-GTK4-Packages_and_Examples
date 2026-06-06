unit vulkan_ggp;

interface

uses
  fp_vulkan;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef VULKAN_GGP_H_}

const
  VULKAN_GGP_H_ = 1;  
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
{ VK_GGP_stream_descriptor_surface is a preprocessor guard. Do not pass it to API calls. }
  VK_GGP_stream_descriptor_surface = 1;  
  VK_GGP_STREAM_DESCRIPTOR_SURFACE_SPEC_VERSION = 1;  
  VK_GGP_STREAM_DESCRIPTOR_SURFACE_EXTENSION_NAME = 'VK_GGP_stream_descriptor_surface';  
type
  PVkStreamDescriptorSurfaceCreateFlagsGGP = ^TVkStreamDescriptorSurfaceCreateFlagsGGP;
  TVkStreamDescriptorSurfaceCreateFlagsGGP = TVkFlags;

  PVkStreamDescriptorSurfaceCreateInfoGGP = ^TVkStreamDescriptorSurfaceCreateInfoGGP;
  TVkStreamDescriptorSurfaceCreateInfoGGP = record
      sType : TVkStructureType;
      pNext : pointer;
      flags : TVkStreamDescriptorSurfaceCreateFlagsGGP;
      streamDescriptor : TGgpStreamDescriptor;
    end;

  TPFN_vkCreateStreamDescriptorSurfaceGGP = function (instance:TVkInstance; pCreateInfo:PVkStreamDescriptorSurfaceCreateInfoGGP; pAllocator:PVkAllocationCallbacks; pSurface:PVkSurfaceKHR):TVkResult;cdecl;
{$ifndef VK_NO_PROTOTYPES}

function vkCreateStreamDescriptorSurfaceGGP(instance:TVkInstance; pCreateInfo:PVkStreamDescriptorSurfaceCreateInfoGGP; pAllocator:PVkAllocationCallbacks; pSurface:PVkSurfaceKHR):TVkResult;cdecl;external libvulkan;
{$endif}
{ VK_GGP_frame_token is a preprocessor guard. Do not pass it to API calls. }

const
  VK_GGP_frame_token = 1;  
  VK_GGP_FRAME_TOKEN_SPEC_VERSION = 1;  
  VK_GGP_FRAME_TOKEN_EXTENSION_NAME = 'VK_GGP_frame_token';  
type
  PVkPresentFrameTokenGGP = ^TVkPresentFrameTokenGGP;
  TVkPresentFrameTokenGGP = record
      sType : TVkStructureType;
      pNext : pointer;
      frameToken : TGgpFrameToken;
    end;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 6-6-26 15:45:51 ===


implementation



end.
