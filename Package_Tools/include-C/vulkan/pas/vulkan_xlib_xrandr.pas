unit vulkan_xlib_xrandr;

interface

uses
  fp_vulkan;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef VULKAN_XLIB_XRANDR_H_}

const
  VULKAN_XLIB_XRANDR_H_ = 1;  
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
{ VK_EXT_acquire_xlib_display is a preprocessor guard. Do not pass it to API calls. }
  VK_EXT_acquire_xlib_display = 1;  
  VK_EXT_ACQUIRE_XLIB_DISPLAY_SPEC_VERSION = 1;  
  VK_EXT_ACQUIRE_XLIB_DISPLAY_EXTENSION_NAME = 'VK_EXT_acquire_xlib_display';  
type

  TPFN_vkAcquireXlibDisplayEXT = function (physicalDevice:TVkPhysicalDevice; dpy:PDisplay; display:TVkDisplayKHR):TVkResult;cdecl;

  TPFN_vkGetRandROutputDisplayEXT = function (physicalDevice:TVkPhysicalDevice; dpy:PDisplay; rrOutput:TRROutput; pDisplay:PVkDisplayKHR):TVkResult;cdecl;
{$ifndef VK_NO_PROTOTYPES}

function vkAcquireXlibDisplayEXT(physicalDevice:TVkPhysicalDevice; dpy:PDisplay; display:TVkDisplayKHR):TVkResult;cdecl;external libvulkan;
function vkGetRandROutputDisplayEXT(physicalDevice:TVkPhysicalDevice; dpy:PDisplay; rrOutput:TRROutput; pDisplay:PVkDisplayKHR):TVkResult;cdecl;external libvulkan;
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 6-6-26 15:45:24 ===


implementation



end.
