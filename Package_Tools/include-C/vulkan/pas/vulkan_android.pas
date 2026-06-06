unit vulkan_android;

interface

uses
  fp_vulkan;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef VULKAN_ANDROID_H_}

const
  VULKAN_ANDROID_H_ = 1;  
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
{ VK_KHR_android_surface is a preprocessor guard. Do not pass it to API calls. }
  VK_KHR_android_surface = 1;  
type
  PANativeWindow = ^TANativeWindow;
  TANativeWindow = record
      {undefined structure}
    end;


const
  VK_KHR_ANDROID_SURFACE_SPEC_VERSION = 6;  
  VK_KHR_ANDROID_SURFACE_EXTENSION_NAME = 'VK_KHR_android_surface';  
type
  PVkAndroidSurfaceCreateFlagsKHR = ^TVkAndroidSurfaceCreateFlagsKHR;
  TVkAndroidSurfaceCreateFlagsKHR = TVkFlags;

  PVkAndroidSurfaceCreateInfoKHR = ^TVkAndroidSurfaceCreateInfoKHR;
  TVkAndroidSurfaceCreateInfoKHR = record
      sType : TVkStructureType;
      pNext : pointer;
      flags : TVkAndroidSurfaceCreateFlagsKHR;
      window : PANativeWindow;
    end;

  TPFN_vkCreateAndroidSurfaceKHR = function (instance:TVkInstance; pCreateInfo:PVkAndroidSurfaceCreateInfoKHR; pAllocator:PVkAllocationCallbacks; pSurface:PVkSurfaceKHR):TVkResult;cdecl;
{$ifndef VK_NO_PROTOTYPES}

function vkCreateAndroidSurfaceKHR(instance:TVkInstance; pCreateInfo:PVkAndroidSurfaceCreateInfoKHR; pAllocator:PVkAllocationCallbacks; pSurface:PVkSurfaceKHR):TVkResult;cdecl;external libvulkan;
{$endif}
{ VK_ANDROID_external_memory_android_hardware_buffer is a preprocessor guard. Do not pass it to API calls. }

const
  VK_ANDROID_external_memory_android_hardware_buffer = 1;  
type
  PAHardwareBuffer = ^TAHardwareBuffer;
  TAHardwareBuffer = record
      {undefined structure}
    end;


const
  VK_ANDROID_EXTERNAL_MEMORY_ANDROID_HARDWARE_BUFFER_SPEC_VERSION = 5;  
  VK_ANDROID_EXTERNAL_MEMORY_ANDROID_HARDWARE_BUFFER_EXTENSION_NAME = 'VK_ANDROID_external_memory_android_hardware_buffer';  
type
  PVkAndroidHardwareBufferUsageANDROID = ^TVkAndroidHardwareBufferUsageANDROID;
  TVkAndroidHardwareBufferUsageANDROID = record
      sType : TVkStructureType;
      pNext : pointer;
      androidHardwareBufferUsage : Tuint64_t;
    end;

  PVkAndroidHardwareBufferPropertiesANDROID = ^TVkAndroidHardwareBufferPropertiesANDROID;
  TVkAndroidHardwareBufferPropertiesANDROID = record
      sType : TVkStructureType;
      pNext : pointer;
      allocationSize : TVkDeviceSize;
      memoryTypeBits : Tuint32_t;
    end;

  PVkAndroidHardwareBufferFormatPropertiesANDROID = ^TVkAndroidHardwareBufferFormatPropertiesANDROID;
  TVkAndroidHardwareBufferFormatPropertiesANDROID = record
      sType : TVkStructureType;
      pNext : pointer;
      format : TVkFormat;
      externalFormat : Tuint64_t;
      formatFeatures : TVkFormatFeatureFlags;
      samplerYcbcrConversionComponents : TVkComponentMapping;
      suggestedYcbcrModel : TVkSamplerYcbcrModelConversion;
      suggestedYcbcrRange : TVkSamplerYcbcrRange;
      suggestedXChromaOffset : TVkChromaLocation;
      suggestedYChromaOffset : TVkChromaLocation;
    end;

  PVkImportAndroidHardwareBufferInfoANDROID = ^TVkImportAndroidHardwareBufferInfoANDROID;
  TVkImportAndroidHardwareBufferInfoANDROID = record
      sType : TVkStructureType;
      pNext : pointer;
      buffer : PAHardwareBuffer;
    end;

  PVkMemoryGetAndroidHardwareBufferInfoANDROID = ^TVkMemoryGetAndroidHardwareBufferInfoANDROID;
  TVkMemoryGetAndroidHardwareBufferInfoANDROID = record
      sType : TVkStructureType;
      pNext : pointer;
      memory : TVkDeviceMemory;
    end;

  PVkExternalFormatANDROID = ^TVkExternalFormatANDROID;
  TVkExternalFormatANDROID = record
      sType : TVkStructureType;
      pNext : pointer;
      externalFormat : Tuint64_t;
    end;

  PVkAndroidHardwareBufferFormatProperties2ANDROID = ^TVkAndroidHardwareBufferFormatProperties2ANDROID;
  TVkAndroidHardwareBufferFormatProperties2ANDROID = record
      sType : TVkStructureType;
      pNext : pointer;
      format : TVkFormat;
      externalFormat : Tuint64_t;
      formatFeatures : TVkFormatFeatureFlags2;
      samplerYcbcrConversionComponents : TVkComponentMapping;
      suggestedYcbcrModel : TVkSamplerYcbcrModelConversion;
      suggestedYcbcrRange : TVkSamplerYcbcrRange;
      suggestedXChromaOffset : TVkChromaLocation;
      suggestedYChromaOffset : TVkChromaLocation;
    end;

  TPFN_vkGetAndroidHardwareBufferPropertiesANDROID = function (device:TVkDevice; buffer:PAHardwareBuffer; pProperties:PVkAndroidHardwareBufferPropertiesANDROID):TVkResult;cdecl;

  TPFN_vkGetMemoryAndroidHardwareBufferANDROID = function (device:TVkDevice; pInfo:PVkMemoryGetAndroidHardwareBufferInfoANDROID; pBuffer:PPAHardwareBuffer):TVkResult;cdecl;
{$ifndef VK_NO_PROTOTYPES}

function vkGetAndroidHardwareBufferPropertiesANDROID(device:TVkDevice; buffer:PAHardwareBuffer; pProperties:PVkAndroidHardwareBufferPropertiesANDROID):TVkResult;cdecl;external libvulkan;
function vkGetMemoryAndroidHardwareBufferANDROID(device:TVkDevice; pInfo:PVkMemoryGetAndroidHardwareBufferInfoANDROID; pBuffer:PPAHardwareBuffer):TVkResult;cdecl;external libvulkan;
{$endif}
{ VK_ANDROID_external_format_resolve is a preprocessor guard. Do not pass it to API calls. }

const
  VK_ANDROID_external_format_resolve = 1;  
  VK_ANDROID_EXTERNAL_FORMAT_RESOLVE_SPEC_VERSION = 1;  
  VK_ANDROID_EXTERNAL_FORMAT_RESOLVE_EXTENSION_NAME = 'VK_ANDROID_external_format_resolve';  
type
  PVkPhysicalDeviceExternalFormatResolveFeaturesANDROID = ^TVkPhysicalDeviceExternalFormatResolveFeaturesANDROID;
  TVkPhysicalDeviceExternalFormatResolveFeaturesANDROID = record
      sType : TVkStructureType;
      pNext : pointer;
      externalFormatResolve : TVkBool32;
    end;

  PVkPhysicalDeviceExternalFormatResolvePropertiesANDROID = ^TVkPhysicalDeviceExternalFormatResolvePropertiesANDROID;
  TVkPhysicalDeviceExternalFormatResolvePropertiesANDROID = record
      sType : TVkStructureType;
      pNext : pointer;
      nullColorAttachmentWithExternalFormatResolve : TVkBool32;
      externalFormatResolveChromaOffsetX : TVkChromaLocation;
      externalFormatResolveChromaOffsetY : TVkChromaLocation;
    end;

  PVkAndroidHardwareBufferFormatResolvePropertiesANDROID = ^TVkAndroidHardwareBufferFormatResolvePropertiesANDROID;
  TVkAndroidHardwareBufferFormatResolvePropertiesANDROID = record
      sType : TVkStructureType;
      pNext : pointer;
      colorAttachmentFormat : TVkFormat;
    end;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 6-6-26 15:46:01 ===


implementation



end.
