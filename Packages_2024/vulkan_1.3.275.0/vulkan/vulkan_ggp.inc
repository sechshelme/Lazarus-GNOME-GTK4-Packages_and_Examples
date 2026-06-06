{$IFDEF read_interface}


const
  VULKAN_GGP_H_ = 1;
  VK_GGP_stream_descriptor_surface = 1;
  VK_GGP_STREAM_DESCRIPTOR_SURFACE_SPEC_VERSION = 1;
  VK_GGP_STREAM_DESCRIPTOR_SURFACE_EXTENSION_NAME = 'VK_GGP_stream_descriptor_surface';

type
  PVkStreamDescriptorSurfaceCreateFlagsGGP = ^TVkStreamDescriptorSurfaceCreateFlagsGGP;
  TVkStreamDescriptorSurfaceCreateFlagsGGP = TVkFlags;

  TVkStreamDescriptorSurfaceCreateInfoGGP = record
    sType: TVkStructureType;
    pNext: pointer;
    flags: TVkStreamDescriptorSurfaceCreateFlagsGGP;
    streamDescriptor: TGgpStreamDescriptor;
  end;
  PVkStreamDescriptorSurfaceCreateInfoGGP = ^TVkStreamDescriptorSurfaceCreateInfoGGP;

  TPFN_vkCreateStreamDescriptorSurfaceGGP = function(instance: TVkInstance; pCreateInfo: PVkStreamDescriptorSurfaceCreateInfoGGP; pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): TVkResult; cdecl;

function vkCreateStreamDescriptorSurfaceGGP(instance: TVkInstance; pCreateInfo: PVkStreamDescriptorSurfaceCreateInfoGGP; pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): TVkResult; cdecl; external libvulkan;

const
  VK_GGP_frame_token = 1;
  VK_GGP_FRAME_TOKEN_SPEC_VERSION = 1;
  VK_GGP_FRAME_TOKEN_EXTENSION_NAME = 'VK_GGP_frame_token';

type
  TVkPresentFrameTokenGGP = record
    sType: TVkStructureType;
    pNext: pointer;
    frameToken: TGgpFrameToken;
  end;
  PVkPresentFrameTokenGGP = ^TVkPresentFrameTokenGGP;

  // === Konventiert am: 6-6-26 15:45:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
