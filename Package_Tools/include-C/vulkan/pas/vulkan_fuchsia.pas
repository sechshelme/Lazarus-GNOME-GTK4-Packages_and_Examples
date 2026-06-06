unit vulkan_fuchsia;

interface

uses
  fp_vulkan;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef VULKAN_FUCHSIA_H_}

const
  VULKAN_FUCHSIA_H_ = 1;  
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
{ VK_FUCHSIA_imagepipe_surface is a preprocessor guard. Do not pass it to API calls. }
  VK_FUCHSIA_imagepipe_surface = 1;  
  VK_FUCHSIA_IMAGEPIPE_SURFACE_SPEC_VERSION = 1;  
  VK_FUCHSIA_IMAGEPIPE_SURFACE_EXTENSION_NAME = 'VK_FUCHSIA_imagepipe_surface';  
type
  PVkImagePipeSurfaceCreateFlagsFUCHSIA = ^TVkImagePipeSurfaceCreateFlagsFUCHSIA;
  TVkImagePipeSurfaceCreateFlagsFUCHSIA = TVkFlags;

  PVkImagePipeSurfaceCreateInfoFUCHSIA = ^TVkImagePipeSurfaceCreateInfoFUCHSIA;
  TVkImagePipeSurfaceCreateInfoFUCHSIA = record
      sType : TVkStructureType;
      pNext : pointer;
      flags : TVkImagePipeSurfaceCreateFlagsFUCHSIA;
      imagePipeHandle : Tzx_handle_t;
    end;

  TPFN_vkCreateImagePipeSurfaceFUCHSIA = function (instance:TVkInstance; pCreateInfo:PVkImagePipeSurfaceCreateInfoFUCHSIA; pAllocator:PVkAllocationCallbacks; pSurface:PVkSurfaceKHR):TVkResult;cdecl;
{$ifndef VK_NO_PROTOTYPES}

function vkCreateImagePipeSurfaceFUCHSIA(instance:TVkInstance; pCreateInfo:PVkImagePipeSurfaceCreateInfoFUCHSIA; pAllocator:PVkAllocationCallbacks; pSurface:PVkSurfaceKHR):TVkResult;cdecl;external libvulkan;
{$endif}
{ VK_FUCHSIA_external_memory is a preprocessor guard. Do not pass it to API calls. }

const
  VK_FUCHSIA_external_memory = 1;  
  VK_FUCHSIA_EXTERNAL_MEMORY_SPEC_VERSION = 1;  
  VK_FUCHSIA_EXTERNAL_MEMORY_EXTENSION_NAME = 'VK_FUCHSIA_external_memory';  
type
  PVkImportMemoryZirconHandleInfoFUCHSIA = ^TVkImportMemoryZirconHandleInfoFUCHSIA;
  TVkImportMemoryZirconHandleInfoFUCHSIA = record
      sType : TVkStructureType;
      pNext : pointer;
      handleType : TVkExternalMemoryHandleTypeFlagBits;
      handle : Tzx_handle_t;
    end;

  PVkMemoryZirconHandlePropertiesFUCHSIA = ^TVkMemoryZirconHandlePropertiesFUCHSIA;
  TVkMemoryZirconHandlePropertiesFUCHSIA = record
      sType : TVkStructureType;
      pNext : pointer;
      memoryTypeBits : Tuint32_t;
    end;

  PVkMemoryGetZirconHandleInfoFUCHSIA = ^TVkMemoryGetZirconHandleInfoFUCHSIA;
  TVkMemoryGetZirconHandleInfoFUCHSIA = record
      sType : TVkStructureType;
      pNext : pointer;
      memory : TVkDeviceMemory;
      handleType : TVkExternalMemoryHandleTypeFlagBits;
    end;

  TPFN_vkGetMemoryZirconHandleFUCHSIA = function (device:TVkDevice; pGetZirconHandleInfo:PVkMemoryGetZirconHandleInfoFUCHSIA; pZirconHandle:Pzx_handle_t):TVkResult;cdecl;

  TPFN_vkGetMemoryZirconHandlePropertiesFUCHSIA = function (device:TVkDevice; handleType:TVkExternalMemoryHandleTypeFlagBits; zirconHandle:Tzx_handle_t; pMemoryZirconHandleProperties:PVkMemoryZirconHandlePropertiesFUCHSIA):TVkResult;cdecl;
{$ifndef VK_NO_PROTOTYPES}

function vkGetMemoryZirconHandleFUCHSIA(device:TVkDevice; pGetZirconHandleInfo:PVkMemoryGetZirconHandleInfoFUCHSIA; pZirconHandle:Pzx_handle_t):TVkResult;cdecl;external libvulkan;
function vkGetMemoryZirconHandlePropertiesFUCHSIA(device:TVkDevice; handleType:TVkExternalMemoryHandleTypeFlagBits; zirconHandle:Tzx_handle_t; pMemoryZirconHandleProperties:PVkMemoryZirconHandlePropertiesFUCHSIA):TVkResult;cdecl;external libvulkan;
{$endif}
{ VK_FUCHSIA_external_semaphore is a preprocessor guard. Do not pass it to API calls. }

const
  VK_FUCHSIA_external_semaphore = 1;  
  VK_FUCHSIA_EXTERNAL_SEMAPHORE_SPEC_VERSION = 1;  
  VK_FUCHSIA_EXTERNAL_SEMAPHORE_EXTENSION_NAME = 'VK_FUCHSIA_external_semaphore';  
type
  PVkImportSemaphoreZirconHandleInfoFUCHSIA = ^TVkImportSemaphoreZirconHandleInfoFUCHSIA;
  TVkImportSemaphoreZirconHandleInfoFUCHSIA = record
      sType : TVkStructureType;
      pNext : pointer;
      semaphore : TVkSemaphore;
      flags : TVkSemaphoreImportFlags;
      handleType : TVkExternalSemaphoreHandleTypeFlagBits;
      zirconHandle : Tzx_handle_t;
    end;

  PVkSemaphoreGetZirconHandleInfoFUCHSIA = ^TVkSemaphoreGetZirconHandleInfoFUCHSIA;
  TVkSemaphoreGetZirconHandleInfoFUCHSIA = record
      sType : TVkStructureType;
      pNext : pointer;
      semaphore : TVkSemaphore;
      handleType : TVkExternalSemaphoreHandleTypeFlagBits;
    end;

  TPFN_vkImportSemaphoreZirconHandleFUCHSIA = function (device:TVkDevice; pImportSemaphoreZirconHandleInfo:PVkImportSemaphoreZirconHandleInfoFUCHSIA):TVkResult;cdecl;

  TPFN_vkGetSemaphoreZirconHandleFUCHSIA = function (device:TVkDevice; pGetZirconHandleInfo:PVkSemaphoreGetZirconHandleInfoFUCHSIA; pZirconHandle:Pzx_handle_t):TVkResult;cdecl;
{$ifndef VK_NO_PROTOTYPES}

function vkImportSemaphoreZirconHandleFUCHSIA(device:TVkDevice; pImportSemaphoreZirconHandleInfo:PVkImportSemaphoreZirconHandleInfoFUCHSIA):TVkResult;cdecl;external libvulkan;
function vkGetSemaphoreZirconHandleFUCHSIA(device:TVkDevice; pGetZirconHandleInfo:PVkSemaphoreGetZirconHandleInfoFUCHSIA; pZirconHandle:Pzx_handle_t):TVkResult;cdecl;external libvulkan;
{$endif}
{ VK_FUCHSIA_buffer_collection is a preprocessor guard. Do not pass it to API calls. }

const
  VK_FUCHSIA_buffer_collection = 1;  
{xxxxxxxxxxx VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkBufferCollectionFUCHSIA) }
  VK_FUCHSIA_BUFFER_COLLECTION_SPEC_VERSION = 2;  
  VK_FUCHSIA_BUFFER_COLLECTION_EXTENSION_NAME = 'VK_FUCHSIA_buffer_collection';  
type
  PVkImageFormatConstraintsFlagsFUCHSIA = ^TVkImageFormatConstraintsFlagsFUCHSIA;
  TVkImageFormatConstraintsFlagsFUCHSIA = TVkFlags;

  PVkImageConstraintsInfoFlagBitsFUCHSIA = ^TVkImageConstraintsInfoFlagBitsFUCHSIA;
  TVkImageConstraintsInfoFlagBitsFUCHSIA =  Longint;
  Const
    VK_IMAGE_CONSTRAINTS_INFO_CPU_READ_RARELY_FUCHSIA = $00000001;
    VK_IMAGE_CONSTRAINTS_INFO_CPU_READ_OFTEN_FUCHSIA = $00000002;
    VK_IMAGE_CONSTRAINTS_INFO_CPU_WRITE_RARELY_FUCHSIA = $00000004;
    VK_IMAGE_CONSTRAINTS_INFO_CPU_WRITE_OFTEN_FUCHSIA = $00000008;
    VK_IMAGE_CONSTRAINTS_INFO_PROTECTED_OPTIONAL_FUCHSIA = $00000010;
    VK_IMAGE_CONSTRAINTS_INFO_FLAG_BITS_MAX_ENUM_FUCHSIA = $7FFFFFFF;
;
type
  PVkImageConstraintsInfoFlagsFUCHSIA = ^TVkImageConstraintsInfoFlagsFUCHSIA;
  TVkImageConstraintsInfoFlagsFUCHSIA = TVkFlags;

  PVkBufferCollectionCreateInfoFUCHSIA = ^TVkBufferCollectionCreateInfoFUCHSIA;
  TVkBufferCollectionCreateInfoFUCHSIA = record
      sType : TVkStructureType;
      pNext : pointer;
      collectionToken : Tzx_handle_t;
    end;

  PVkImportMemoryBufferCollectionFUCHSIA = ^TVkImportMemoryBufferCollectionFUCHSIA;
  TVkImportMemoryBufferCollectionFUCHSIA = record
      sType : TVkStructureType;
      pNext : pointer;
      collection : TVkBufferCollectionFUCHSIA;
      index : Tuint32_t;
    end;

  PVkBufferCollectionImageCreateInfoFUCHSIA = ^TVkBufferCollectionImageCreateInfoFUCHSIA;
  TVkBufferCollectionImageCreateInfoFUCHSIA = record
      sType : TVkStructureType;
      pNext : pointer;
      collection : TVkBufferCollectionFUCHSIA;
      index : Tuint32_t;
    end;

  PVkBufferCollectionConstraintsInfoFUCHSIA = ^TVkBufferCollectionConstraintsInfoFUCHSIA;
  TVkBufferCollectionConstraintsInfoFUCHSIA = record
      sType : TVkStructureType;
      pNext : pointer;
      minBufferCount : Tuint32_t;
      maxBufferCount : Tuint32_t;
      minBufferCountForCamping : Tuint32_t;
      minBufferCountForDedicatedSlack : Tuint32_t;
      minBufferCountForSharedSlack : Tuint32_t;
    end;

  PVkBufferConstraintsInfoFUCHSIA = ^TVkBufferConstraintsInfoFUCHSIA;
  TVkBufferConstraintsInfoFUCHSIA = record
      sType : TVkStructureType;
      pNext : pointer;
      createInfo : TVkBufferCreateInfo;
      requiredFormatFeatures : TVkFormatFeatureFlags;
      bufferCollectionConstraints : TVkBufferCollectionConstraintsInfoFUCHSIA;
    end;

  PVkBufferCollectionBufferCreateInfoFUCHSIA = ^TVkBufferCollectionBufferCreateInfoFUCHSIA;
  TVkBufferCollectionBufferCreateInfoFUCHSIA = record
      sType : TVkStructureType;
      pNext : pointer;
      collection : TVkBufferCollectionFUCHSIA;
      index : Tuint32_t;
    end;

  PVkSysmemColorSpaceFUCHSIA = ^TVkSysmemColorSpaceFUCHSIA;
  TVkSysmemColorSpaceFUCHSIA = record
      sType : TVkStructureType;
      pNext : pointer;
      colorSpace : Tuint32_t;
    end;

  PVkBufferCollectionPropertiesFUCHSIA = ^TVkBufferCollectionPropertiesFUCHSIA;
  TVkBufferCollectionPropertiesFUCHSIA = record
      sType : TVkStructureType;
      pNext : pointer;
      memoryTypeBits : Tuint32_t;
      bufferCount : Tuint32_t;
      createInfoIndex : Tuint32_t;
      sysmemPixelFormat : Tuint64_t;
      formatFeatures : TVkFormatFeatureFlags;
      sysmemColorSpaceIndex : TVkSysmemColorSpaceFUCHSIA;
      samplerYcbcrConversionComponents : TVkComponentMapping;
      suggestedYcbcrModel : TVkSamplerYcbcrModelConversion;
      suggestedYcbcrRange : TVkSamplerYcbcrRange;
      suggestedXChromaOffset : TVkChromaLocation;
      suggestedYChromaOffset : TVkChromaLocation;
    end;

  PVkImageFormatConstraintsInfoFUCHSIA = ^TVkImageFormatConstraintsInfoFUCHSIA;
  TVkImageFormatConstraintsInfoFUCHSIA = record
      sType : TVkStructureType;
      pNext : pointer;
      imageCreateInfo : TVkImageCreateInfo;
      requiredFormatFeatures : TVkFormatFeatureFlags;
      flags : TVkImageFormatConstraintsFlagsFUCHSIA;
      sysmemPixelFormat : Tuint64_t;
      colorSpaceCount : Tuint32_t;
      pColorSpaces : PVkSysmemColorSpaceFUCHSIA;
    end;

  PVkImageConstraintsInfoFUCHSIA = ^TVkImageConstraintsInfoFUCHSIA;
  TVkImageConstraintsInfoFUCHSIA = record
      sType : TVkStructureType;
      pNext : pointer;
      formatConstraintsCount : Tuint32_t;
      pFormatConstraints : PVkImageFormatConstraintsInfoFUCHSIA;
      bufferCollectionConstraints : TVkBufferCollectionConstraintsInfoFUCHSIA;
      flags : TVkImageConstraintsInfoFlagsFUCHSIA;
    end;

  TPFN_vkCreateBufferCollectionFUCHSIA = function (device:TVkDevice; pCreateInfo:PVkBufferCollectionCreateInfoFUCHSIA; pAllocator:PVkAllocationCallbacks; pCollection:PVkBufferCollectionFUCHSIA):TVkResult;cdecl;

  TPFN_vkSetBufferCollectionImageConstraintsFUCHSIA = function (device:TVkDevice; collection:TVkBufferCollectionFUCHSIA; pImageConstraintsInfo:PVkImageConstraintsInfoFUCHSIA):TVkResult;cdecl;

  TPFN_vkSetBufferCollectionBufferConstraintsFUCHSIA = function (device:TVkDevice; collection:TVkBufferCollectionFUCHSIA; pBufferConstraintsInfo:PVkBufferConstraintsInfoFUCHSIA):TVkResult;cdecl;

  TPFN_vkDestroyBufferCollectionFUCHSIA = procedure (device:TVkDevice; collection:TVkBufferCollectionFUCHSIA; pAllocator:PVkAllocationCallbacks);cdecl;

  TPFN_vkGetBufferCollectionPropertiesFUCHSIA = function (device:TVkDevice; collection:TVkBufferCollectionFUCHSIA; pProperties:PVkBufferCollectionPropertiesFUCHSIA):TVkResult;cdecl;
{$ifndef VK_NO_PROTOTYPES}

function vkCreateBufferCollectionFUCHSIA(device:TVkDevice; pCreateInfo:PVkBufferCollectionCreateInfoFUCHSIA; pAllocator:PVkAllocationCallbacks; pCollection:PVkBufferCollectionFUCHSIA):TVkResult;cdecl;external libvulkan;
function vkSetBufferCollectionImageConstraintsFUCHSIA(device:TVkDevice; collection:TVkBufferCollectionFUCHSIA; pImageConstraintsInfo:PVkImageConstraintsInfoFUCHSIA):TVkResult;cdecl;external libvulkan;
function vkSetBufferCollectionBufferConstraintsFUCHSIA(device:TVkDevice; collection:TVkBufferCollectionFUCHSIA; pBufferConstraintsInfo:PVkBufferConstraintsInfoFUCHSIA):TVkResult;cdecl;external libvulkan;
procedure vkDestroyBufferCollectionFUCHSIA(device:TVkDevice; collection:TVkBufferCollectionFUCHSIA; pAllocator:PVkAllocationCallbacks);cdecl;external libvulkan;
function vkGetBufferCollectionPropertiesFUCHSIA(device:TVkDevice; collection:TVkBufferCollectionFUCHSIA; pProperties:PVkBufferCollectionPropertiesFUCHSIA):TVkResult;cdecl;external libvulkan;
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 6-6-26 15:45:53 ===


implementation



end.
