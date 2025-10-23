
{$IFDEF read_interface}


type
  PGstVulkanInstance = type Pointer;
  PPGstVulkanInstance = ^PGstVulkanInstance;
  PGstVulkanInstanceClass = type Pointer;
  PGstVulkanInstancePrivate = type Pointer;

  PGstVulkanDevice = type Pointer;
  PPGstVulkanDevice = ^PGstVulkanDevice;
  PGstVulkanDeviceClass = type Pointer;
  PGstVulkanDevicePrivate = type Pointer;

  PGstVulkanPhysicalDevice = type Pointer;
  PGstVulkanPhysicalDeviceClass = type Pointer;
  PGstVulkanPhysicalDevicePrivate = type Pointer;

  PGstVulkanQueue = type Pointer;
  PPGstVulkanQueue = ^PGstVulkanQueue;
  PGstVulkanQueueClass = type Pointer;
  PGstVulkanQueuePrivate = type Pointer;

  PGstVulkanCommandPool = type Pointer;
  PGstVulkanCommandPoolClass = type Pointer;
  PGstVulkanCommandPoolPrivate = type Pointer;

  PGstVulkanCommandBuffer = type Pointer;

  PGstVulkanDescriptorSet = type Pointer;

  PGstVulkanDescriptorPool = type Pointer;
  PGstVulkanDescriptorPoolClass = type Pointer;
  PGstVulkanDescriptorPoolPrivate = type Pointer;

  PGstVulkanDescriptorCache = type Pointer;
  PGstVulkanDescriptorCacheClass = type Pointer;
  PGstVulkanDescriptorCachePrivate = type Pointer;

  PGstVulkanDisplay = type Pointer;
  PPGstVulkanDisplay = ^PGstVulkanDisplay;
  PGstVulkanDisplayClass = type Pointer;
  PGstVulkanDisplayPrivate = type Pointer;

  PGstVulkanWindow = type Pointer;
  PGstVulkanWindowClass = type Pointer;
  PGstVulkanWindowPrivate = type Pointer;

  PGstVulkanFence = type Pointer;

  PGstVulkanFenceCache = type Pointer;
  PGstVulkanFenceCacheClass = type Pointer;

  PGstVulkanMemory = type Pointer;
  PGstVulkanMemoryAllocator = type Pointer;
  PGstVulkanMemoryAllocatorClass = type Pointer;

  PGstVulkanBufferMemory = type Pointer;
  PGstVulkanBufferMemoryAllocator = type Pointer;
  PGstVulkanBufferMemoryAllocatorClass = type Pointer;

  PGstVulkanBufferPool = type Pointer;
  PPGstVulkanHandlePool = ^PGstVulkanHandlePool;
  PGstVulkanBufferPoolClass = type Pointer;
  PGstVulkanBufferPoolPrivate = type Pointer;

  PGstVulkanHandle = type Pointer;
  PPGstVulkanHandle = ^PGstVulkanHandle;

  PGstVulkanHandlePool = type Pointer;
  PGstVulkanHandlePoolClass = type Pointer;

  PGstVulkanImageMemory = type Pointer;
  PGstVulkanImageMemoryAllocator = type Pointer;
  PGstVulkanImageMemoryAllocatorClass = type Pointer;

  PGstVulkanImageBufferPool = type Pointer;
  PGstVulkanImageBufferPoolClass = type Pointer;
  PGstVulkanImageBufferPoolPrivate = type Pointer;

  PGstVulkanImageView = type Pointer;

  PGstVulkanBarrierMemoryInfo = type Pointer;
  PGstVulkanBarrierBufferInfo = type Pointer;
  PGstVulkanBarrierImageInfo = type Pointer;

  PGstVulkanTrashList = type Pointer;
  PGstVulkanTrashListClass = type Pointer;

  PGstVulkanTrash = type Pointer;

  PGstVulkanFullScreenQuad = type Pointer;
  PGstVulkanFullScreenQuadClass = type Pointer;
  PGstVulkanFullScreenQuadPrivate = type Pointer;

  PGstVulkanQueueFamilyOps = type Pointer;
  PGstVulkanVideoProfile = type Pointer;
  PGstVulkanVideoCapabilities = type Pointer;

  PGstVulkanOperation = type Pointer;
  PGstVulkanOperationClass = type Pointer;
  PGstVulkanOperationPrivate = type Pointer;

  PGstVulkanDecoder = type Pointer;
  PGstVulkanDecoderClass = type Pointer;
  PGstVulkanDecoderPrivate = type Pointer;
  PGstVulkanDecoderParameters = type Pointer;
  PGstVulkanDecoderPicture = type Pointer;


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
