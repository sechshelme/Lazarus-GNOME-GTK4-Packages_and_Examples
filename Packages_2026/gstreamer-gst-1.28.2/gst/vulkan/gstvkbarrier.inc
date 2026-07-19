

  {$IFDEF read_enum}
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
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstVulkanBarrierMemoryInfo = ^TGstVulkanBarrierMemoryInfo;
  TGstVulkanBarrierMemoryInfo = record
    _type: TGstVulkanBarrierType;
    flags: TGstVulkanBarrierFlags;
    queue: PGstVulkanQueue;
    pipeline_stages: Tguint64;
    access_flags: Tguint64;
    semaphore: TVkSemaphore;
    semaphore_value: Tguint64;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}


  // === Konventiert am: 17-7-26 15:38:01 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
