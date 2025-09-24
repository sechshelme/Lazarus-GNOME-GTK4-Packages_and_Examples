unit Vulkan;

interface

uses
  fp_sfml;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{////////////////////////////////////////////////////////// }
{ }
{ SFML - Simple and Fast Multimedia Library }
{ Copyright (C) 2007-2023 Laurent Gomila (laurent@sfml-dev.org) }
{ }
{ This software is provided 'as-is', without any express or implied warranty. }
{ In no event will the authors be held liable for any damages arising from the use of this software. }
{ }
{ Permission is granted to anyone to use this software for any purpose, }
{ including commercial applications, and to alter it and redistribute it freely, }
{ subject to the following restrictions: }
{ }
{ 1. The origin of this software must not be misrepresented; }
{    you must not claim that you wrote the original software. }
{    If you use this software in a product, an acknowledgment }
{    in the product documentation would be appreciated but is not required. }
{ }
{ 2. Altered source versions must be plainly marked as such, }
{    and must not be misrepresented as being the original software. }
{ }
{ 3. This notice may not be removed or altered from any source distribution. }
{ }
{////////////////////////////////////////////////////////// }
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Window/Export.h>}
type
  PVkInstance = ^TVkInstance;
  TVkInstance = PVkInstance_T;
{$if defined(__LP64__) || defined(_WIN64) || (defined(__x86_64__) && !defined(__ILP32__) ) || defined(_M_X64) || defined(__ia64) || defined (_M_IA64) || defined(__aarch64__) || defined(__powerpc64__)}
type
  PVkSurfaceKHR = ^TVkSurfaceKHR;
  TVkSurfaceKHR = PVkSurfaceKHR_T;
{$else}
type
  PVkSurfaceKHR = ^TVkSurfaceKHR;
  TVkSurfaceKHR = TsfUint64;
{$endif}
type

  TsfVulkanFunctionPointer = procedure (para1:pointer);cdecl;
{////////////////////////////////////////////////////////// }
{/ \brief Tell whether or not the system supports Vulkan }
{/ }
{/ This function should always be called before using }
{/ the Vulkan features. If it returns false, then }
{/ any attempt to use Vulkan will fail. }
{/ }
{/ If only compute is required, set \a requireGraphics }
{/ to false to skip checking for the extensions necessary }
{/ for graphics rendering. }
{/ }
{/ \param requireGraphics }
{/ }
{/ \return True if Vulkan is supported, false otherwise }
{/ }
{////////////////////////////////////////////////////////// }

function sfVulkan_isAvailable(requireGraphics:TsfBool):TsfBool;cdecl;external libsfml_window;
{////////////////////////////////////////////////////////// }
{/ \brief Get the address of a Vulkan function }
{/ }
{/ \param name Name of the function to get the address of }
{/ }
{/ \return Address of the Vulkan function, 0 on failure }
{/ }
{////////////////////////////////////////////////////////// }
function sfVulkan_getFunction(name:Pchar):TsfVulkanFunctionPointer;cdecl;external libsfml_window;
{////////////////////////////////////////////////////////// }
{/ \brief Get Vulkan instance extensions required for graphics }
{/ }
{/ \return Vulkan instance extensions required for graphics }
{/ }
{////////////////////////////////////////////////////////// }
function sfVulkan_getGraphicsRequiredInstanceExtensions:^Pchar;cdecl;external libsfml_window;

// === Konventiert am: 24-9-25 16:58:01 ===


implementation



end.
