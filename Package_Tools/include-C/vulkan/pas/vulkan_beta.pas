unit vulkan_beta;

interface

uses
  fp_vulkan;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef VULKAN_BETA_H_}

const
  VULKAN_BETA_H_ = 1;  
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
{ VK_KHR_portability_subset is a preprocessor guard. Do not pass it to API calls. }
  VK_KHR_portability_subset = 1;  
  VK_KHR_PORTABILITY_SUBSET_SPEC_VERSION = 1;  
  VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME = 'VK_KHR_portability_subset';  
type
  PVkPhysicalDevicePortabilitySubsetFeaturesKHR = ^TVkPhysicalDevicePortabilitySubsetFeaturesKHR;
  TVkPhysicalDevicePortabilitySubsetFeaturesKHR = record
      sType : TVkStructureType;
      pNext : pointer;
      constantAlphaColorBlendFactors : TVkBool32;
      events : TVkBool32;
      imageViewFormatReinterpretation : TVkBool32;
      imageViewFormatSwizzle : TVkBool32;
      imageView2DOn3DImage : TVkBool32;
      multisampleArrayImage : TVkBool32;
      mutableComparisonSamplers : TVkBool32;
      pointPolygons : TVkBool32;
      samplerMipLodBias : TVkBool32;
      separateStencilMaskRef : TVkBool32;
      shaderSampleRateInterpolationFunctions : TVkBool32;
      tessellationIsolines : TVkBool32;
      tessellationPointMode : TVkBool32;
      triangleFans : TVkBool32;
      vertexAttributeAccessBeyondStride : TVkBool32;
    end;

  PVkPhysicalDevicePortabilitySubsetPropertiesKHR = ^TVkPhysicalDevicePortabilitySubsetPropertiesKHR;
  TVkPhysicalDevicePortabilitySubsetPropertiesKHR = record
      sType : TVkStructureType;
      pNext : pointer;
      minVertexInputBindingStrideAlignment : Tuint32_t;
    end;
{ VK_AMDX_shader_enqueue is a preprocessor guard. Do not pass it to API calls. }

const
  VK_AMDX_shader_enqueue = 1;  
  VK_AMDX_SHADER_ENQUEUE_SPEC_VERSION = 1;  
  VK_AMDX_SHADER_ENQUEUE_EXTENSION_NAME = 'VK_AMDX_shader_enqueue';  
  VK_SHADER_INDEX_UNUSED_AMDX =  not (0);  
type
  PVkPhysicalDeviceShaderEnqueueFeaturesAMDX = ^TVkPhysicalDeviceShaderEnqueueFeaturesAMDX;
  TVkPhysicalDeviceShaderEnqueueFeaturesAMDX = record
      sType : TVkStructureType;
      pNext : pointer;
      shaderEnqueue : TVkBool32;
    end;

  PVkPhysicalDeviceShaderEnqueuePropertiesAMDX = ^TVkPhysicalDeviceShaderEnqueuePropertiesAMDX;
  TVkPhysicalDeviceShaderEnqueuePropertiesAMDX = record
      sType : TVkStructureType;
      pNext : pointer;
      maxExecutionGraphDepth : Tuint32_t;
      maxExecutionGraphShaderOutputNodes : Tuint32_t;
      maxExecutionGraphShaderPayloadSize : Tuint32_t;
      maxExecutionGraphShaderPayloadCount : Tuint32_t;
      executionGraphDispatchAddressAlignment : Tuint32_t;
    end;

  PVkExecutionGraphPipelineScratchSizeAMDX = ^TVkExecutionGraphPipelineScratchSizeAMDX;
  TVkExecutionGraphPipelineScratchSizeAMDX = record
      sType : TVkStructureType;
      pNext : pointer;
      size : TVkDeviceSize;
    end;

  PVkExecutionGraphPipelineCreateInfoAMDX = ^TVkExecutionGraphPipelineCreateInfoAMDX;
  TVkExecutionGraphPipelineCreateInfoAMDX = record
      sType : TVkStructureType;
      pNext : pointer;
      flags : TVkPipelineCreateFlags;
      stageCount : Tuint32_t;
      pStages : PVkPipelineShaderStageCreateInfo;
      pLibraryInfo : PVkPipelineLibraryCreateInfoKHR;
      layout : TVkPipelineLayout;
      basePipelineHandle : TVkPipeline;
      basePipelineIndex : Tint32_t;
    end;

  PVkDeviceOrHostAddressConstAMDX = ^TVkDeviceOrHostAddressConstAMDX;
  TVkDeviceOrHostAddressConstAMDX = record
      case longint of
        0 : ( deviceAddress : TVkDeviceAddress );
        1 : ( hostAddress : pointer );
      end;

  PVkDispatchGraphInfoAMDX = ^TVkDispatchGraphInfoAMDX;
  TVkDispatchGraphInfoAMDX = record
      nodeIndex : Tuint32_t;
      payloadCount : Tuint32_t;
      payloads : TVkDeviceOrHostAddressConstAMDX;
      payloadStride : Tuint64_t;
    end;

  PVkDispatchGraphCountInfoAMDX = ^TVkDispatchGraphCountInfoAMDX;
  TVkDispatchGraphCountInfoAMDX = record
      count : Tuint32_t;
      infos : TVkDeviceOrHostAddressConstAMDX;
      stride : Tuint64_t;
    end;

  PVkPipelineShaderStageNodeCreateInfoAMDX = ^TVkPipelineShaderStageNodeCreateInfoAMDX;
  TVkPipelineShaderStageNodeCreateInfoAMDX = record
      sType : TVkStructureType;
      pNext : pointer;
      pName : Pchar;
      index : Tuint32_t;
    end;

  TPFN_vkCreateExecutionGraphPipelinesAMDX = function (device:TVkDevice; pipelineCache:TVkPipelineCache; createInfoCount:Tuint32_t; pCreateInfos:PVkExecutionGraphPipelineCreateInfoAMDX; pAllocator:PVkAllocationCallbacks; 
               pPipelines:PVkPipeline):TVkResult;cdecl;

  TPFN_vkGetExecutionGraphPipelineScratchSizeAMDX = function (device:TVkDevice; executionGraph:TVkPipeline; pSizeInfo:PVkExecutionGraphPipelineScratchSizeAMDX):TVkResult;cdecl;

  TPFN_vkGetExecutionGraphPipelineNodeIndexAMDX = function (device:TVkDevice; executionGraph:TVkPipeline; pNodeInfo:PVkPipelineShaderStageNodeCreateInfoAMDX; pNodeIndex:Puint32_t):TVkResult;cdecl;

  TPFN_vkCmdInitializeGraphScratchMemoryAMDX = procedure (commandBuffer:TVkCommandBuffer; scratch:TVkDeviceAddress);cdecl;

  TPFN_vkCmdDispatchGraphAMDX = procedure (commandBuffer:TVkCommandBuffer; scratch:TVkDeviceAddress; pCountInfo:PVkDispatchGraphCountInfoAMDX);cdecl;

  TPFN_vkCmdDispatchGraphIndirectAMDX = procedure (commandBuffer:TVkCommandBuffer; scratch:TVkDeviceAddress; pCountInfo:PVkDispatchGraphCountInfoAMDX);cdecl;

  TPFN_vkCmdDispatchGraphIndirectCountAMDX = procedure (commandBuffer:TVkCommandBuffer; scratch:TVkDeviceAddress; countInfo:TVkDeviceAddress);cdecl;
{$ifndef VK_NO_PROTOTYPES}

function vkCreateExecutionGraphPipelinesAMDX(device:TVkDevice; pipelineCache:TVkPipelineCache; createInfoCount:Tuint32_t; pCreateInfos:PVkExecutionGraphPipelineCreateInfoAMDX; pAllocator:PVkAllocationCallbacks; 
           pPipelines:PVkPipeline):TVkResult;cdecl;external libvulkan;
function vkGetExecutionGraphPipelineScratchSizeAMDX(device:TVkDevice; executionGraph:TVkPipeline; pSizeInfo:PVkExecutionGraphPipelineScratchSizeAMDX):TVkResult;cdecl;external libvulkan;
function vkGetExecutionGraphPipelineNodeIndexAMDX(device:TVkDevice; executionGraph:TVkPipeline; pNodeInfo:PVkPipelineShaderStageNodeCreateInfoAMDX; pNodeIndex:Puint32_t):TVkResult;cdecl;external libvulkan;
procedure vkCmdInitializeGraphScratchMemoryAMDX(commandBuffer:TVkCommandBuffer; scratch:TVkDeviceAddress);cdecl;external libvulkan;
procedure vkCmdDispatchGraphAMDX(commandBuffer:TVkCommandBuffer; scratch:TVkDeviceAddress; pCountInfo:PVkDispatchGraphCountInfoAMDX);cdecl;external libvulkan;
procedure vkCmdDispatchGraphIndirectAMDX(commandBuffer:TVkCommandBuffer; scratch:TVkDeviceAddress; pCountInfo:PVkDispatchGraphCountInfoAMDX);cdecl;external libvulkan;
procedure vkCmdDispatchGraphIndirectCountAMDX(commandBuffer:TVkCommandBuffer; scratch:TVkDeviceAddress; countInfo:TVkDeviceAddress);cdecl;external libvulkan;
{$endif}
{ VK_NV_displacement_micromap is a preprocessor guard. Do not pass it to API calls. }

const
  VK_NV_displacement_micromap = 1;  
  VK_NV_DISPLACEMENT_MICROMAP_SPEC_VERSION = 2;  
  VK_NV_DISPLACEMENT_MICROMAP_EXTENSION_NAME = 'VK_NV_displacement_micromap';  
type
  PVkDisplacementMicromapFormatNV = ^TVkDisplacementMicromapFormatNV;
  TVkDisplacementMicromapFormatNV =  Longint;
  Const
    VK_DISPLACEMENT_MICROMAP_FORMAT_64_TRIANGLES_64_BYTES_NV = 1;
    VK_DISPLACEMENT_MICROMAP_FORMAT_256_TRIANGLES_128_BYTES_NV = 2;
    VK_DISPLACEMENT_MICROMAP_FORMAT_1024_TRIANGLES_128_BYTES_NV = 3;
    VK_DISPLACEMENT_MICROMAP_FORMAT_MAX_ENUM_NV = $7FFFFFFF;
;
type
  PVkPhysicalDeviceDisplacementMicromapFeaturesNV = ^TVkPhysicalDeviceDisplacementMicromapFeaturesNV;
  TVkPhysicalDeviceDisplacementMicromapFeaturesNV = record
      sType : TVkStructureType;
      pNext : pointer;
      displacementMicromap : TVkBool32;
    end;

  PVkPhysicalDeviceDisplacementMicromapPropertiesNV = ^TVkPhysicalDeviceDisplacementMicromapPropertiesNV;
  TVkPhysicalDeviceDisplacementMicromapPropertiesNV = record
      sType : TVkStructureType;
      pNext : pointer;
      maxDisplacementMicromapSubdivisionLevel : Tuint32_t;
    end;

  PVkAccelerationStructureTrianglesDisplacementMicromapNV = ^TVkAccelerationStructureTrianglesDisplacementMicromapNV;
  TVkAccelerationStructureTrianglesDisplacementMicromapNV = record
      sType : TVkStructureType;
      pNext : pointer;
      displacementBiasAndScaleFormat : TVkFormat;
      displacementVectorFormat : TVkFormat;
      displacementBiasAndScaleBuffer : TVkDeviceOrHostAddressConstKHR;
      displacementBiasAndScaleStride : TVkDeviceSize;
      displacementVectorBuffer : TVkDeviceOrHostAddressConstKHR;
      displacementVectorStride : TVkDeviceSize;
      displacedMicromapPrimitiveFlags : TVkDeviceOrHostAddressConstKHR;
      displacedMicromapPrimitiveFlagsStride : TVkDeviceSize;
      indexType : TVkIndexType;
      indexBuffer : TVkDeviceOrHostAddressConstKHR;
      indexStride : TVkDeviceSize;
      baseTriangle : Tuint32_t;
      usageCountsCount : Tuint32_t;
      pUsageCounts : PVkMicromapUsageEXT;
      ppUsageCounts : ^PVkMicromapUsageEXT;
      micromap : TVkMicromapEXT;
    end;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 6-6-26 15:45:58 ===


implementation



end.
