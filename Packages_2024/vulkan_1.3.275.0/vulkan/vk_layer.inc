{$IFDEF read_interface}


const
  MAX_NUM_UNKNOWN_EXTS = 250;
  CURRENT_LOADER_LAYER_INTERFACE_VERSION = 2;
  MIN_SUPPORTED_LOADER_LAYER_INTERFACE_VERSION = 1;
  VK_CURRENT_CHAIN_VERSION = 1;

type
  PVkNegotiateLayerStructType = ^TVkNegotiateLayerStructType;
  TVkNegotiateLayerStructType = longint;

const
  LAYER_NEGOTIATE_UNINTIALIZED = 0;
  LAYER_NEGOTIATE_INTERFACE_STRUCT = 1;

type
  TVkNegotiateLayerInterface = record
    sType: TVkNegotiateLayerStructType;
    pNext: pointer;
    loaderLayerInterfaceVersion: Tuint32_t;
    pfnGetInstanceProcAddr: TPFN_vkGetInstanceProcAddr;
    pfnGetDeviceProcAddr: TPFN_vkGetDeviceProcAddr;
    pfnGetPhysicalDeviceProcAddr: TPFN_GetPhysicalDeviceProcAddr;
  end;
  PVkNegotiateLayerInterface = ^TVkNegotiateLayerInterface;

  TPFN_vkNegotiateLoaderLayerInterfaceVersion = function(pVersionStruct: PVkNegotiateLayerInterface): TVkResult; cdecl;
  TPFN_PhysDevExt = function(phys_device: TVkPhysicalDevice): TVkResult; cdecl;

type
  PVkLayerFunction_ = ^TVkLayerFunction_;
  TVkLayerFunction_ = longint;

const
  VK_LAYER_LINK_INFO = 0;
  VK_LOADER_DATA_CALLBACK = 1;
  VK_LOADER_LAYER_CREATE_DEVICE_CALLBACK = 2;
  VK_LOADER_FEATURES = 3;

type
  TVkLayerFunction = TVkLayerFunction_;
  PVkLayerFunction = ^TVkLayerFunction;

type
  PVkLayerInstanceLink_ = ^TVkLayerInstanceLink_;

  TVkLayerInstanceLink_ = record
    pNext: PVkLayerInstanceLink_;
    pfnNextGetInstanceProcAddr: TPFN_vkGetInstanceProcAddr;
    pfnNextGetPhysicalDeviceProcAddr: TPFN_GetPhysicalDeviceProcAddr;
  end;

  TVkLayerInstanceLink = TVkLayerInstanceLink_;
  PVkLayerInstanceLink = ^TVkLayerInstanceLink;

  TVkLayerDeviceInfo_ = record
    device_info: pointer;
    pfnNextGetInstanceProcAddr: TPFN_vkGetInstanceProcAddr;
  end;
  PVkLayerDeviceInfo_ = ^TVkLayerDeviceInfo_;

  TVkLayerDeviceInfo = TVkLayerDeviceInfo_;
  PVkLayerDeviceInfo = ^TVkLayerDeviceInfo;

  TPFN_vkSetInstanceLoaderData = function(instance: TVkInstance; obj: pointer): TVkResult; cdecl;
  TPFN_vkSetDeviceLoaderData = function(device: TVkDevice; obj: pointer): TVkResult; cdecl;
  TPFN_vkLayerCreateDevice = function(instance: TVkInstance; physicalDevice: TVkPhysicalDevice; pCreateInfo: PVkDeviceCreateInfo; pAllocator: PVkAllocationCallbacks; pDevice: PVkDevice; layerGIPA: TPFN_vkGetInstanceProcAddr; nextGDPA: PPFN_vkGetDeviceProcAddr): TVkResult; cdecl;
  TPFN_vkLayerDestroyDevice = procedure(physicalDevice: TVkDevice; pAllocator: PVkAllocationCallbacks; destroyFunction: TPFN_vkDestroyDevice); cdecl;

type
  PVkLoaderFeastureFlagBits = ^TVkLoaderFeastureFlagBits;
  TVkLoaderFeastureFlagBits = longint;

const
  VK_LOADER_FEATURE_PHYSICAL_DEVICE_SORTING = $00000001;

type
  TVkLoaderFlagBits = TVkLoaderFeastureFlagBits;
  PVkLoaderFlagBits = ^TVkLoaderFlagBits;

type
  PVkLoaderFeatureFlags = ^TVkLoaderFeatureFlags;
  TVkLoaderFeatureFlags = TVkFlags;

  TVkLayerInstanceCreateInfo = record
    sType: TVkStructureType;
    pNext: pointer;
    _function: TVkLayerFunction;
    u: record
      case longint of
        0: (pLayerInfo: PVkLayerInstanceLink);
        1: (pfnSetInstanceLoaderData: TPFN_vkSetInstanceLoaderData);
        2: (layerDevice: record
            pfnLayerCreateDevice: TPFN_vkLayerCreateDevice;
            pfnLayerDestroyDevice: TPFN_vkLayerDestroyDevice;
            end);
        3: (loaderFeatures: TVkLoaderFeatureFlags);
      end;
  end;
  PVkLayerInstanceCreateInfo = ^TVkLayerInstanceCreateInfo;

  PVkLayerDeviceLink_ = ^TVkLayerDeviceLink_;
  TVkLayerDeviceLink_ = record
    pNext: PVkLayerDeviceLink_;
    pfnNextGetInstanceProcAddr: TPFN_vkGetInstanceProcAddr;
    pfnNextGetDeviceProcAddr: TPFN_vkGetDeviceProcAddr;
  end;
  TVkLayerDeviceLink = TVkLayerDeviceLink_;
  PVkLayerDeviceLink = ^TVkLayerDeviceLink;

  TVkLayerDeviceCreateInfo = record
    sType: TVkStructureType;
    pNext: pointer;
    _function: TVkLayerFunction;
    u: record
      case longint of
        0: (pLayerInfo: PVkLayerDeviceLink);
        1: (pfnSetDeviceLoaderData: TPFN_vkSetDeviceLoaderData);
      end;
  end;
  PVkLayerDeviceCreateInfo = ^TVkLayerDeviceCreateInfo;

function vkNegotiateLoaderLayerInterfaceVersion(pVersionStruct: PVkNegotiateLayerInterface): TVkResult; cdecl; external libvulkan;

type
  PVkChainType = ^TVkChainType;
  TVkChainType = longint;

const
  VK_CHAIN_TYPE_UNKNOWN = 0;
  VK_CHAIN_TYPE_ENUMERATE_INSTANCE_EXTENSION_PROPERTIES = 1;
  VK_CHAIN_TYPE_ENUMERATE_INSTANCE_LAYER_PROPERTIES = 2;
  VK_CHAIN_TYPE_ENUMERATE_INSTANCE_VERSION = 3;

type
  TVkChainHeader = record
    _type: TVkChainType;
    version: Tuint32_t;
    size: Tuint32_t;
  end;
  PVkChainHeader = ^TVkChainHeader;

  PVkEnumerateInstanceExtensionPropertiesChain = ^TVkEnumerateInstanceExtensionPropertiesChain;
  TVkEnumerateInstanceExtensionPropertiesChain = record
    header: TVkChainHeader;
    pfnNextLayer: function(para1: PVkEnumerateInstanceExtensionPropertiesChain; para2: pchar; para3: Puint32_t; para4: PVkExtensionProperties): TVkResult; cdecl;
    pNextLink: PVkEnumerateInstanceExtensionPropertiesChain;
  end;

  PVkEnumerateInstanceLayerPropertiesChain = ^TVkEnumerateInstanceLayerPropertiesChain;
  TVkEnumerateInstanceLayerPropertiesChain = record
    header: TVkChainHeader;
    pfnNextLayer: function(para1: PVkEnumerateInstanceLayerPropertiesChain; para2: Puint32_t; para3: PVkLayerProperties): TVkResult; cdecl;
    pNextLink: PVkEnumerateInstanceLayerPropertiesChain;
  end;

  PVkEnumerateInstanceVersionChain = ^TVkEnumerateInstanceVersionChain;
  TVkEnumerateInstanceVersionChain = record
    header: TVkChainHeader;
    pfnNextLayer: function(para1: PVkEnumerateInstanceVersionChain; para2: Puint32_t): TVkResult; cdecl;
    pNextLink: PVkEnumerateInstanceVersionChain;
  end;

  // === Konventiert am: 6-6-26 15:46:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
