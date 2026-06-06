{$IFDEF read_interface}


const
  CURRENT_LOADER_ICD_INTERFACE_VERSION = 7;
  MIN_SUPPORTED_LOADER_ICD_INTERFACE_VERSION = 0;
  MIN_PHYS_DEV_EXTENSION_ICD_INTERFACE_VERSION = 4;

type
  TPFN_vkNegotiateLoaderICDInterfaceVersion = function(pVersion: Puint32_t): TVkResult; cdecl;
  TPFN_GetPhysicalDeviceProcAddr = function(instance: TVkInstance; pName: pchar): TPFN_vkVoidFunction; cdecl;
  TPFN_vk_icdNegotiateLoaderICDInterfaceVersion = function(pVersion: Puint32_t): TVkResult; cdecl;
  TPFN_vk_icdGetInstanceProcAddr = function(instance: TVkInstance; pName: pchar): TPFN_vkVoidFunction; cdecl;
  TPFN_vk_icdGetPhysicalDeviceProcAddr = function(instance: TVkInstance; pName: pchar): TPFN_vkVoidFunction; cdecl;
  TPFN_vk_icdEnumerateAdapterPhysicalDevices = function(instance: TVkInstance; adapterLUID: TLUID; pPhysicalDeviceCount: Puint32_t; pPhysicalDevices: PVkPhysicalDevice): TVkResult; cdecl;

function vk_icdNegotiateLoaderICDInterfaceVersion(pVersion: Puint32_t): TVkResult; cdecl; external libvulkan;
function vk_icdGetInstanceProcAddr(instance: TVkInstance; pName: pchar): TPFN_vkVoidFunction; cdecl; external libvulkan;
function vk_icdGetPhysicalDeviceProcAddr(instance: TVkInstance; pName: pchar): TPFN_vkVoidFunction; cdecl; external libvulkan;
function vk_icdEnumerateAdapterPhysicalDevices(instance: TVkInstance; adapterLUID: TLUID; pPhysicalDeviceCount: Puint32_t; pPhysicalDevices: PVkPhysicalDevice): TVkResult; cdecl; external libvulkan;

const
  ICD_LOADER_MAGIC = $01CDC0DE;

type
  PVK_LOADER_DATA = ^TVK_LOADER_DATA;
  TVK_LOADER_DATA = record
    case longint of
      0: (loaderMagic: Tuintptr_t);
      1: (loaderData: pointer);
  end;

procedure set_loader_magic_value(pNewObject: Pointer);
function valid_loader_magic_value(pNewObject: Pointer): boolean;

type
  PVkIcdWsiPlatform = ^TVkIcdWsiPlatform;
  TVkIcdWsiPlatform = longint;

const
  VK_ICD_WSI_PLATFORM_MIR = 0;
  VK_ICD_WSI_PLATFORM_WAYLAND = 1;
  VK_ICD_WSI_PLATFORM_WIN32 = 2;
  VK_ICD_WSI_PLATFORM_XCB = 3;
  VK_ICD_WSI_PLATFORM_XLIB = 4;
  VK_ICD_WSI_PLATFORM_ANDROID = 5;
  VK_ICD_WSI_PLATFORM_MACOS = 6;
  VK_ICD_WSI_PLATFORM_IOS = 7;
  VK_ICD_WSI_PLATFORM_DISPLAY = 8;
  VK_ICD_WSI_PLATFORM_HEADLESS = 9;
  VK_ICD_WSI_PLATFORM_METAL = 10;
  VK_ICD_WSI_PLATFORM_DIRECTFB = 11;
  VK_ICD_WSI_PLATFORM_VI = 12;
  VK_ICD_WSI_PLATFORM_GGP = 13;
  VK_ICD_WSI_PLATFORM_SCREEN = 14;
  VK_ICD_WSI_PLATFORM_FUCHSIA = 15;

type
  TVkIcdSurfaceBase = record
    platform: TVkIcdWsiPlatform;
  end;
  PVkIcdSurfaceBase = ^TVkIcdSurfaceBase;

  TVkIcdSurfaceMir = record
    base: TVkIcdSurfaceBase;
    connection: PMirConnection;
    mirSurface: PMirSurface;
  end;
  PVkIcdSurfaceMir = ^TVkIcdSurfaceMir;

type
  TVkIcdSurfaceWayland = record
    base: TVkIcdSurfaceBase;
    display: Pwl_display;
    surface: Pwl_surface;
  end;
  PVkIcdSurfaceWayland = ^TVkIcdSurfaceWayland;

type
  TVkIcdSurfaceWin32 = record
    base: TVkIcdSurfaceBase;
    hinstance: THINSTANCE;
    hwnd: THWND;
  end;
  PVkIcdSurfaceWin32 = ^TVkIcdSurfaceWin32;

type
  TVkIcdSurfaceXcb = record
    base: TVkIcdSurfaceBase;
    connection: Pxcb_connection_t;
    window: Txcb_window_t;
  end;
  PVkIcdSurfaceXcb = ^TVkIcdSurfaceXcb;

type
  TVkIcdSurfaceXlib = record
    base: TVkIcdSurfaceBase;
    dpy: PDisplay;
    window: TWindow;
  end;
  PVkIcdSurfaceXlib = ^TVkIcdSurfaceXlib;

type
  TVkIcdSurfaceDirectFB = record
    base: TVkIcdSurfaceBase;
    dfb: PIDirectFB;
    surface: PIDirectFBSurface;
  end;
  PVkIcdSurfaceDirectFB = ^TVkIcdSurfaceDirectFB;

type
  TVkIcdSurfaceAndroid = record
    base: TVkIcdSurfaceBase;
    window: PANativeWindow;
  end;
  PVkIcdSurfaceAndroid = ^TVkIcdSurfaceAndroid;

type
  TVkIcdSurfaceMacOS = record
    base: TVkIcdSurfaceBase;
    pView: pointer;
  end;
  PVkIcdSurfaceMacOS = ^TVkIcdSurfaceMacOS;

type
  TVkIcdSurfaceIOS = record
    base: TVkIcdSurfaceBase;
    pView: pointer;
  end;
  PVkIcdSurfaceIOS = ^TVkIcdSurfaceIOS;

type
  TVkIcdSurfaceGgp = record
    base: TVkIcdSurfaceBase;
    streamDescriptor: TGgpStreamDescriptor;
  end;
  PVkIcdSurfaceGgp = ^TVkIcdSurfaceGgp;

type
  TVkIcdSurfaceDisplay = record
    base: TVkIcdSurfaceBase;
    displayMode: TVkDisplayModeKHR;
    planeIndex: Tuint32_t;
    planeStackIndex: Tuint32_t;
    transform: TVkSurfaceTransformFlagBitsKHR;
    globalAlpha: single;
    alphaMode: TVkDisplayPlaneAlphaFlagBitsKHR;
    imageExtent: TVkExtent2D;
  end;
  PVkIcdSurfaceDisplay = ^TVkIcdSurfaceDisplay;

  TVkIcdSurfaceHeadless = record
    base: TVkIcdSurfaceBase;
  end;
  PVkIcdSurfaceHeadless = ^TVkIcdSurfaceHeadless;

  TVkIcdSurfaceMetal = record
    base: TVkIcdSurfaceBase;
    pLayer: PCAMetalLayer;
  end;
  PVkIcdSurfaceMetal = ^TVkIcdSurfaceMetal;

type
  TVkIcdSurfaceVi = record
    base: TVkIcdSurfaceBase;
    window: pointer;
  end;
  PVkIcdSurfaceVi = ^TVkIcdSurfaceVi;

type
  TVkIcdSurfaceScreen = record
    base: TVkIcdSurfaceBase;
    context: Pscreen_context;
    window: Pscreen_window;
  end;
  PVkIcdSurfaceScreen = ^TVkIcdSurfaceScreen;

type
  TVkIcdSurfaceImagePipe = record
    base: TVkIcdSurfaceBase;
  end;
  PVkIcdSurfaceImagePipe = ^TVkIcdSurfaceImagePipe;

  // === Konventiert am: 6-6-26 15:46:06 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

procedure set_loader_magic_value(pNewObject: Pointer);
var
  loader_info: PVK_LOADER_DATA;
begin
  loader_info := PVK_LOADER_DATA(pNewObject);
  loader_info^.loaderMagic := ICD_LOADER_MAGIC;
end;

function valid_loader_magic_value(pNewObject: Pointer): boolean;
var
  loader_info: PVK_LOADER_DATA;
begin
  loader_info := PVK_LOADER_DATA(pNewObject);
  Result := (loader_info^.loaderMagic and $FFFFFFFF) = ICD_LOADER_MAGIC;
end;




{$ENDIF read_implementation}
