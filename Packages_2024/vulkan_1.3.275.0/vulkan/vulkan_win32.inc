{$IFDEF read_interface}


const
  VULKAN_WIN32_H_ = 1;
  VK_KHR_win32_surface = 1;
  VK_KHR_WIN32_SURFACE_SPEC_VERSION = 6;
  VK_KHR_WIN32_SURFACE_EXTENSION_NAME = 'VK_KHR_win32_surface';

type
  PVkWin32SurfaceCreateFlagsKHR = ^TVkWin32SurfaceCreateFlagsKHR;
  TVkWin32SurfaceCreateFlagsKHR = TVkFlags;

  TVkWin32SurfaceCreateInfoKHR = record
    sType: TVkStructureType;
    pNext: pointer;
    flags: TVkWin32SurfaceCreateFlagsKHR;
    hinstance: THINSTANCE;
    hwnd: THWND;
  end;
  PVkWin32SurfaceCreateInfoKHR = ^TVkWin32SurfaceCreateInfoKHR;

  TPFN_vkCreateWin32SurfaceKHR = function(instance: TVkInstance; pCreateInfo: PVkWin32SurfaceCreateInfoKHR; pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): TVkResult; cdecl;
  TPFN_vkGetPhysicalDeviceWin32PresentationSupportKHR = function(physicalDevice: TVkPhysicalDevice; queueFamilyIndex: Tuint32_t): TVkBool32; cdecl;

function vkCreateWin32SurfaceKHR(instance: TVkInstance; pCreateInfo: PVkWin32SurfaceCreateInfoKHR; pAllocator: PVkAllocationCallbacks; pSurface: PVkSurfaceKHR): TVkResult; cdecl; external libvulkan;
function vkGetPhysicalDeviceWin32PresentationSupportKHR(physicalDevice: TVkPhysicalDevice; queueFamilyIndex: Tuint32_t): TVkBool32; cdecl; external libvulkan;

const
  VK_KHR_external_memory_win32 = 1;
  VK_KHR_EXTERNAL_MEMORY_WIN32_SPEC_VERSION = 1;
  VK_KHR_EXTERNAL_MEMORY_WIN32_EXTENSION_NAME = 'VK_KHR_external_memory_win32';

type
  TVkImportMemoryWin32HandleInfoKHR = record
    sType: TVkStructureType;
    pNext: pointer;
    handleType: TVkExternalMemoryHandleTypeFlagBits;
    handle: THANDLE;
    name: TLPCWSTR;
  end;
  PVkImportMemoryWin32HandleInfoKHR = ^TVkImportMemoryWin32HandleInfoKHR;

  TVkExportMemoryWin32HandleInfoKHR = record
    sType: TVkStructureType;
    pNext: pointer;
    pAttributes: PSECURITY_ATTRIBUTES;
    dwAccess: TDWORD;
    name: TLPCWSTR;
  end;
  PVkExportMemoryWin32HandleInfoKHR = ^TVkExportMemoryWin32HandleInfoKHR;

  TVkMemoryWin32HandlePropertiesKHR = record
    sType: TVkStructureType;
    pNext: pointer;
    memoryTypeBits: Tuint32_t;
  end;
  PVkMemoryWin32HandlePropertiesKHR = ^TVkMemoryWin32HandlePropertiesKHR;

  TVkMemoryGetWin32HandleInfoKHR = record
    sType: TVkStructureType;
    pNext: pointer;
    memory: TVkDeviceMemory;
    handleType: TVkExternalMemoryHandleTypeFlagBits;
  end;
  PVkMemoryGetWin32HandleInfoKHR = ^TVkMemoryGetWin32HandleInfoKHR;

  TPFN_vkGetMemoryWin32HandleKHR = function(device: TVkDevice; pGetWin32HandleInfo: PVkMemoryGetWin32HandleInfoKHR; pHandle: PHANDLE): TVkResult; cdecl;
  TPFN_vkGetMemoryWin32HandlePropertiesKHR = function(device: TVkDevice; handleType: TVkExternalMemoryHandleTypeFlagBits; handle: THANDLE; pMemoryWin32HandleProperties: PVkMemoryWin32HandlePropertiesKHR): TVkResult; cdecl;

function vkGetMemoryWin32HandleKHR(device: TVkDevice; pGetWin32HandleInfo: PVkMemoryGetWin32HandleInfoKHR; pHandle: PHANDLE): TVkResult; cdecl; external libvulkan;
function vkGetMemoryWin32HandlePropertiesKHR(device: TVkDevice; handleType: TVkExternalMemoryHandleTypeFlagBits; handle: THANDLE; pMemoryWin32HandleProperties: PVkMemoryWin32HandlePropertiesKHR): TVkResult; cdecl; external libvulkan;

const
  VK_KHR_win32_keyed_mutex = 1;
  VK_KHR_WIN32_KEYED_MUTEX_SPEC_VERSION = 1;
  VK_KHR_WIN32_KEYED_MUTEX_EXTENSION_NAME = 'VK_KHR_win32_keyed_mutex';

type
  TVkWin32KeyedMutexAcquireReleaseInfoKHR = record
    sType: TVkStructureType;
    pNext: pointer;
    acquireCount: Tuint32_t;
    pAcquireSyncs: PVkDeviceMemory;
    pAcquireKeys: Puint64_t;
    pAcquireTimeouts: Puint32_t;
    releaseCount: Tuint32_t;
    pReleaseSyncs: PVkDeviceMemory;
    pReleaseKeys: Puint64_t;
  end;
  PVkWin32KeyedMutexAcquireReleaseInfoKHR = ^TVkWin32KeyedMutexAcquireReleaseInfoKHR;

const
  VK_KHR_external_semaphore_win32 = 1;
  VK_KHR_EXTERNAL_SEMAPHORE_WIN32_SPEC_VERSION = 1;
  VK_KHR_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME = 'VK_KHR_external_semaphore_win32';

type
  TVkImportSemaphoreWin32HandleInfoKHR = record
    sType: TVkStructureType;
    pNext: pointer;
    semaphore: TVkSemaphore;
    flags: TVkSemaphoreImportFlags;
    handleType: TVkExternalSemaphoreHandleTypeFlagBits;
    handle: THANDLE;
    name: TLPCWSTR;
  end;
  PVkImportSemaphoreWin32HandleInfoKHR = ^TVkImportSemaphoreWin32HandleInfoKHR;

  TVkExportSemaphoreWin32HandleInfoKHR = record
    sType: TVkStructureType;
    pNext: pointer;
    pAttributes: PSECURITY_ATTRIBUTES;
    dwAccess: TDWORD;
    name: TLPCWSTR;
  end;
  PVkExportSemaphoreWin32HandleInfoKHR = ^TVkExportSemaphoreWin32HandleInfoKHR;

  TVkD3D12FenceSubmitInfoKHR = record
    sType: TVkStructureType;
    pNext: pointer;
    waitSemaphoreValuesCount: Tuint32_t;
    pWaitSemaphoreValues: Puint64_t;
    signalSemaphoreValuesCount: Tuint32_t;
    pSignalSemaphoreValues: Puint64_t;
  end;
  PVkD3D12FenceSubmitInfoKHR = ^TVkD3D12FenceSubmitInfoKHR;

  TVkSemaphoreGetWin32HandleInfoKHR = record
    sType: TVkStructureType;
    pNext: pointer;
    semaphore: TVkSemaphore;
    handleType: TVkExternalSemaphoreHandleTypeFlagBits;
  end;
  PVkSemaphoreGetWin32HandleInfoKHR = ^TVkSemaphoreGetWin32HandleInfoKHR;

  TPFN_vkImportSemaphoreWin32HandleKHR = function(device: TVkDevice; pImportSemaphoreWin32HandleInfo: PVkImportSemaphoreWin32HandleInfoKHR): TVkResult; cdecl;
  TPFN_vkGetSemaphoreWin32HandleKHR = function(device: TVkDevice; pGetWin32HandleInfo: PVkSemaphoreGetWin32HandleInfoKHR; pHandle: PHANDLE): TVkResult; cdecl;

function vkImportSemaphoreWin32HandleKHR(device: TVkDevice; pImportSemaphoreWin32HandleInfo: PVkImportSemaphoreWin32HandleInfoKHR): TVkResult; cdecl; external libvulkan;
function vkGetSemaphoreWin32HandleKHR(device: TVkDevice; pGetWin32HandleInfo: PVkSemaphoreGetWin32HandleInfoKHR; pHandle: PHANDLE): TVkResult; cdecl; external libvulkan;

const
  VK_KHR_external_fence_win32 = 1;
  VK_KHR_EXTERNAL_FENCE_WIN32_SPEC_VERSION = 1;
  VK_KHR_EXTERNAL_FENCE_WIN32_EXTENSION_NAME = 'VK_KHR_external_fence_win32';

type
  TVkImportFenceWin32HandleInfoKHR = record
    sType: TVkStructureType;
    pNext: pointer;
    fence: TVkFence;
    flags: TVkFenceImportFlags;
    handleType: TVkExternalFenceHandleTypeFlagBits;
    handle: THANDLE;
    name: TLPCWSTR;
  end;
  PVkImportFenceWin32HandleInfoKHR = ^TVkImportFenceWin32HandleInfoKHR;

  TVkExportFenceWin32HandleInfoKHR = record
    sType: TVkStructureType;
    pNext: pointer;
    pAttributes: PSECURITY_ATTRIBUTES;
    dwAccess: TDWORD;
    name: TLPCWSTR;
  end;
  PVkExportFenceWin32HandleInfoKHR = ^TVkExportFenceWin32HandleInfoKHR;

  TVkFenceGetWin32HandleInfoKHR = record
    sType: TVkStructureType;
    pNext: pointer;
    fence: TVkFence;
    handleType: TVkExternalFenceHandleTypeFlagBits;
  end;
  PVkFenceGetWin32HandleInfoKHR = ^TVkFenceGetWin32HandleInfoKHR;

  TPFN_vkImportFenceWin32HandleKHR = function(device: TVkDevice; pImportFenceWin32HandleInfo: PVkImportFenceWin32HandleInfoKHR): TVkResult; cdecl;
  TPFN_vkGetFenceWin32HandleKHR = function(device: TVkDevice; pGetWin32HandleInfo: PVkFenceGetWin32HandleInfoKHR; pHandle: PHANDLE): TVkResult; cdecl;

function vkImportFenceWin32HandleKHR(device: TVkDevice; pImportFenceWin32HandleInfo: PVkImportFenceWin32HandleInfoKHR): TVkResult; cdecl; external libvulkan;
function vkGetFenceWin32HandleKHR(device: TVkDevice; pGetWin32HandleInfo: PVkFenceGetWin32HandleInfoKHR; pHandle: PHANDLE): TVkResult; cdecl; external libvulkan;

const
  VK_NV_external_memory_win32 = 1;
  VK_NV_EXTERNAL_MEMORY_WIN32_SPEC_VERSION = 1;
  VK_NV_EXTERNAL_MEMORY_WIN32_EXTENSION_NAME = 'VK_NV_external_memory_win32';

type
  TVkImportMemoryWin32HandleInfoNV = record
    sType: TVkStructureType;
    pNext: pointer;
    handleType: TVkExternalMemoryHandleTypeFlagsNV;
    handle: THANDLE;
  end;
  PVkImportMemoryWin32HandleInfoNV = ^TVkImportMemoryWin32HandleInfoNV;

  TVkExportMemoryWin32HandleInfoNV = record
    sType: TVkStructureType;
    pNext: pointer;
    pAttributes: PSECURITY_ATTRIBUTES;
    dwAccess: TDWORD;
  end;
  PVkExportMemoryWin32HandleInfoNV = ^TVkExportMemoryWin32HandleInfoNV;

  TPFN_vkGetMemoryWin32HandleNV = function(device: TVkDevice; memory: TVkDeviceMemory; handleType: TVkExternalMemoryHandleTypeFlagsNV; pHandle: PHANDLE): TVkResult; cdecl;

function vkGetMemoryWin32HandleNV(device: TVkDevice; memory: TVkDeviceMemory; handleType: TVkExternalMemoryHandleTypeFlagsNV; pHandle: PHANDLE): TVkResult; cdecl; external libvulkan;

const
  VK_NV_win32_keyed_mutex = 1;
  VK_NV_WIN32_KEYED_MUTEX_SPEC_VERSION = 2;
  VK_NV_WIN32_KEYED_MUTEX_EXTENSION_NAME = 'VK_NV_win32_keyed_mutex';

type
  TVkWin32KeyedMutexAcquireReleaseInfoNV = record
    sType: TVkStructureType;
    pNext: pointer;
    acquireCount: Tuint32_t;
    pAcquireSyncs: PVkDeviceMemory;
    pAcquireKeys: Puint64_t;
    pAcquireTimeoutMilliseconds: Puint32_t;
    releaseCount: Tuint32_t;
    pReleaseSyncs: PVkDeviceMemory;
    pReleaseKeys: Puint64_t;
  end;
  PVkWin32KeyedMutexAcquireReleaseInfoNV = ^TVkWin32KeyedMutexAcquireReleaseInfoNV;

const
  VK_EXT_full_screen_exclusive = 1;
  VK_EXT_FULL_SCREEN_EXCLUSIVE_SPEC_VERSION = 4;
  VK_EXT_FULL_SCREEN_EXCLUSIVE_EXTENSION_NAME = 'VK_EXT_full_screen_exclusive';

type
  PVkFullScreenExclusiveEXT = ^TVkFullScreenExclusiveEXT;
  TVkFullScreenExclusiveEXT = longint;

const
  VK_FULL_SCREEN_EXCLUSIVE_DEFAULT_EXT = 0;
  VK_FULL_SCREEN_EXCLUSIVE_ALLOWED_EXT = 1;
  VK_FULL_SCREEN_EXCLUSIVE_DISALLOWED_EXT = 2;
  VK_FULL_SCREEN_EXCLUSIVE_APPLICATION_CONTROLLED_EXT = 3;
  VK_FULL_SCREEN_EXCLUSIVE_MAX_ENUM_EXT = $7FFFFFFF;

type
  TVkSurfaceFullScreenExclusiveInfoEXT = record
    sType: TVkStructureType;
    pNext: pointer;
    fullScreenExclusive: TVkFullScreenExclusiveEXT;
  end;
  PVkSurfaceFullScreenExclusiveInfoEXT = ^TVkSurfaceFullScreenExclusiveInfoEXT;

  TVkSurfaceCapabilitiesFullScreenExclusiveEXT = record
    sType: TVkStructureType;
    pNext: pointer;
    fullScreenExclusiveSupported: TVkBool32;
  end;
  PVkSurfaceCapabilitiesFullScreenExclusiveEXT = ^TVkSurfaceCapabilitiesFullScreenExclusiveEXT;

  TVkSurfaceFullScreenExclusiveWin32InfoEXT = record
    sType: TVkStructureType;
    pNext: pointer;
    hmonitor: THMONITOR;
  end;
  PVkSurfaceFullScreenExclusiveWin32InfoEXT = ^TVkSurfaceFullScreenExclusiveWin32InfoEXT;

  TPFN_vkGetPhysicalDeviceSurfacePresentModes2EXT = function(physicalDevice: TVkPhysicalDevice; pSurfaceInfo: PVkPhysicalDeviceSurfaceInfo2KHR; pPresentModeCount: Puint32_t; pPresentModes: PVkPresentModeKHR): TVkResult; cdecl;
  TPFN_vkAcquireFullScreenExclusiveModeEXT = function(device: TVkDevice; swapchain: TVkSwapchainKHR): TVkResult; cdecl;
  TPFN_vkReleaseFullScreenExclusiveModeEXT = function(device: TVkDevice; swapchain: TVkSwapchainKHR): TVkResult; cdecl;
  TPFN_vkGetDeviceGroupSurfacePresentModes2EXT = function(device: TVkDevice; pSurfaceInfo: PVkPhysicalDeviceSurfaceInfo2KHR; pModes: PVkDeviceGroupPresentModeFlagsKHR): TVkResult; cdecl;

function vkGetPhysicalDeviceSurfacePresentModes2EXT(physicalDevice: TVkPhysicalDevice; pSurfaceInfo: PVkPhysicalDeviceSurfaceInfo2KHR; pPresentModeCount: Puint32_t; pPresentModes: PVkPresentModeKHR): TVkResult; cdecl; external libvulkan;
function vkAcquireFullScreenExclusiveModeEXT(device: TVkDevice; swapchain: TVkSwapchainKHR): TVkResult; cdecl; external libvulkan;
function vkReleaseFullScreenExclusiveModeEXT(device: TVkDevice; swapchain: TVkSwapchainKHR): TVkResult; cdecl; external libvulkan;
function vkGetDeviceGroupSurfacePresentModes2EXT(device: TVkDevice; pSurfaceInfo: PVkPhysicalDeviceSurfaceInfo2KHR; pModes: PVkDeviceGroupPresentModeFlagsKHR): TVkResult; cdecl; external libvulkan;

const
  VK_NV_acquire_winrt_display = 1;
  VK_NV_ACQUIRE_WINRT_DISPLAY_SPEC_VERSION = 1;
  VK_NV_ACQUIRE_WINRT_DISPLAY_EXTENSION_NAME = 'VK_NV_acquire_winrt_display';

type
  TPFN_vkAcquireWinrtDisplayNV = function(physicalDevice: TVkPhysicalDevice; display: TVkDisplayKHR): TVkResult; cdecl;
  TPFN_vkGetWinrtDisplayNV = function(physicalDevice: TVkPhysicalDevice; deviceRelativeId: Tuint32_t; pDisplay: PVkDisplayKHR): TVkResult; cdecl;

function vkAcquireWinrtDisplayNV(physicalDevice: TVkPhysicalDevice; display: TVkDisplayKHR): TVkResult; cdecl; external libvulkan;
function vkGetWinrtDisplayNV(physicalDevice: TVkPhysicalDevice; deviceRelativeId: Tuint32_t; pDisplay: PVkDisplayKHR): TVkResult; cdecl; external libvulkan;

// === Konventiert am: 6-6-26 15:45:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
