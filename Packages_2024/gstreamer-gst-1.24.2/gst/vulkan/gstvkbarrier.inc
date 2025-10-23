
{$IFDEF read_interface}

type
  PGstVulkanBarrierType = ^TGstVulkanBarrierType;
  TGstVulkanBarrierType = longint;

const
  GST_VULKAN_BARRIER_NONE = 0;
  GST_VULKAN_BARRIER_TYPE_MEMORY = 1;
  GST_VULKAN_BARRIER_TYPE_BUFFER = 2;
  GST_VULKAN_BARRIER_TYPE_IMAGE = 3;

type
  PGstVulkanBarrierFlags = ^TGstVulkanBarrierFlags;
  TGstVulkanBarrierFlags = longint;

const
  GST_VULKAN_BARRIER_FLAG_NONE = 0;

  // === Konventiert am: 10-10-24 15:27:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
