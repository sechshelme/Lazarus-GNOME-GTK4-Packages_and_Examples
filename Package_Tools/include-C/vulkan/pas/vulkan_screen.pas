unit vulkan_screen;

interface

uses
  fp_vulkan;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef VULKAN_SCREEN_H_}

const
  VULKAN_SCREEN_H_ = 1;  
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
{ VK_QNX_screen_surface is a preprocessor guard. Do not pass it to API calls. }
  VK_QNX_screen_surface = 1;  
  VK_QNX_SCREEN_SURFACE_SPEC_VERSION = 1;  
  VK_QNX_SCREEN_SURFACE_EXTENSION_NAME = 'VK_QNX_screen_surface';  
type
  PVkScreenSurfaceCreateFlagsQNX = ^TVkScreenSurfaceCreateFlagsQNX;
  TVkScreenSurfaceCreateFlagsQNX = TVkFlags;

  PVkScreenSurfaceCreateInfoQNX = ^TVkScreenSurfaceCreateInfoQNX;
  TVkScreenSurfaceCreateInfoQNX = record
      sType : TVkStructureType;
      pNext : pointer;
      flags : TVkScreenSurfaceCreateFlagsQNX;
      context : Pscreen_context;
      window : Pscreen_window;
    end;

  TPFN_vkCreateScreenSurfaceQNX = function (instance:TVkInstance; pCreateInfo:PVkScreenSurfaceCreateInfoQNX; pAllocator:PVkAllocationCallbacks; pSurface:PVkSurfaceKHR):TVkResult;cdecl;

  TPFN_vkGetPhysicalDeviceScreenPresentationSupportQNX = function (physicalDevice:TVkPhysicalDevice; queueFamilyIndex:Tuint32_t; window:Pscreen_window):TVkBool32;cdecl;
{$ifndef VK_NO_PROTOTYPES}

function vkCreateScreenSurfaceQNX(instance:TVkInstance; pCreateInfo:PVkScreenSurfaceCreateInfoQNX; pAllocator:PVkAllocationCallbacks; pSurface:PVkSurfaceKHR):TVkResult;cdecl;external libvulkan;
function vkGetPhysicalDeviceScreenPresentationSupportQNX(physicalDevice:TVkPhysicalDevice; queueFamilyIndex:Tuint32_t; window:Pscreen_window):TVkBool32;cdecl;external libvulkan;
{$endif}
{ VK_QNX_external_memory_screen_buffer is a preprocessor guard. Do not pass it to API calls. }

const
  VK_QNX_external_memory_screen_buffer = 1;  
  VK_QNX_EXTERNAL_MEMORY_SCREEN_BUFFER_SPEC_VERSION = 1;  
  VK_QNX_EXTERNAL_MEMORY_SCREEN_BUFFER_EXTENSION_NAME = 'VK_QNX_external_memory_screen_buffer';  
type
  PVkScreenBufferPropertiesQNX = ^TVkScreenBufferPropertiesQNX;
  TVkScreenBufferPropertiesQNX = record
      sType : TVkStructureType;
      pNext : pointer;
      allocationSize : TVkDeviceSize;
      memoryTypeBits : Tuint32_t;
    end;

  PVkScreenBufferFormatPropertiesQNX = ^TVkScreenBufferFormatPropertiesQNX;
  TVkScreenBufferFormatPropertiesQNX = record
      sType : TVkStructureType;
      pNext : pointer;
      format : TVkFormat;
      externalFormat : Tuint64_t;
      screenUsage : Tuint64_t;
      formatFeatures : TVkFormatFeatureFlags;
      samplerYcbcrConversionComponents : TVkComponentMapping;
      suggestedYcbcrModel : TVkSamplerYcbcrModelConversion;
      suggestedYcbcrRange : TVkSamplerYcbcrRange;
      suggestedXChromaOffset : TVkChromaLocation;
      suggestedYChromaOffset : TVkChromaLocation;
    end;

  PVkImportScreenBufferInfoQNX = ^TVkImportScreenBufferInfoQNX;
  TVkImportScreenBufferInfoQNX = record
      sType : TVkStructureType;
      pNext : pointer;
      buffer : Pscreen_buffer;
    end;

  PVkExternalFormatQNX = ^TVkExternalFormatQNX;
  TVkExternalFormatQNX = record
      sType : TVkStructureType;
      pNext : pointer;
      externalFormat : Tuint64_t;
    end;

  PVkPhysicalDeviceExternalMemoryScreenBufferFeaturesQNX = ^TVkPhysicalDeviceExternalMemoryScreenBufferFeaturesQNX;
  TVkPhysicalDeviceExternalMemoryScreenBufferFeaturesQNX = record
      sType : TVkStructureType;
      pNext : pointer;
      screenBufferImport : TVkBool32;
    end;

  TPFN_vkGetScreenBufferPropertiesQNX = function (device:TVkDevice; buffer:Pscreen_buffer; pProperties:PVkScreenBufferPropertiesQNX):TVkResult;cdecl;
{$ifndef VK_NO_PROTOTYPES}

function vkGetScreenBufferPropertiesQNX(device:TVkDevice; buffer:Pscreen_buffer; pProperties:PVkScreenBufferPropertiesQNX):TVkResult;cdecl;external libvulkan;
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 6-6-26 15:45:38 ===


implementation



end.
