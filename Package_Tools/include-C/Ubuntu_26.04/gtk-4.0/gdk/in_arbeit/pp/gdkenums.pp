
unit gdkenums;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdkenums.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdkenums.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PGdkAxisFlags  = ^GdkAxisFlags;
PGdkAxisUse  = ^GdkAxisUse;
PGdkColorChannel  = ^GdkColorChannel;
PGdkDmabufError  = ^GdkDmabufError;
PGdkDragAction  = ^GdkDragAction;
PGdkGLAPI  = ^GdkGLAPI;
PGdkGLError  = ^GdkGLError;
PGdkGravity  = ^GdkGravity;
PGdkMemoryFormat  = ^GdkMemoryFormat;
PGdkModifierType  = ^GdkModifierType;
PGdkScrollRelativeDirection  = ^GdkScrollRelativeDirection;
PGdkVulkanError  = ^GdkVulkanError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDK - The GIMP Drawing Kit
 * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <glib.h>}
{$include <gdk/version/gdkversionmacros.h>}
{*
 * GdkColorChannel:
 * @GDK_COLOR_CHANNEL_RED: The red color channel, aka 0
 * @GDK_COLOR_CHANNEL_GREEN: The green color channel, aka 1
 * @GDK_COLOR_CHANNEL_BLUE: The blue color channel, aka 2
 * @GDK_COLOR_CHANNEL_ALPHA: The alpha color channel, aka 3
 *
 * Enumerates the color channels of RGBA values as used in
 * `GdkColor` and OpenGL/Vulkan shaders.
 *
 * Note that this is not the order of pixel values in Cairo
 * and `GdkMemoryFormat` can have many different orders.
 *
 * Since: 4.22
  }
type
  PGdkColorChannel = ^TGdkColorChannel;
  TGdkColorChannel =  Longint;
  Const
    GDK_COLOR_CHANNEL_RED = 0;
    GDK_COLOR_CHANNEL_GREEN = 1;
    GDK_COLOR_CHANNEL_BLUE = 2;
    GDK_COLOR_CHANNEL_ALPHA = 3;
;
{*
 * GdkGLAPI:
 * @GDK_GL_API_GL: The OpenGL API
 * @GDK_GL_API_GLES: The OpenGL ES API
 *
 * The list of the different APIs that GdkGLContext can potentially support.
 *
 * Since: 4.6
  }
{< underscore_name=GDK_GL_API > }
type
  PGdkGLAPI = ^TGdkGLAPI;
  TGdkGLAPI =  Longint;
  Const
    GDK_GL_API_GL = 1 shl 0;
    GDK_GL_API_GLES = 1 shl 1;
;
{ Currently, these are the same values numerically as in the
 * X protocol. If you change that, gdksurface-x11.c/gdk_surface_set_geometry_hints()
 * will need fixing.
  }
{*
 * GdkGravity:
 * @GDK_GRAVITY_NORTH_WEST: the reference point is at the top left corner.
 * @GDK_GRAVITY_NORTH: the reference point is in the middle of the top edge.
 * @GDK_GRAVITY_NORTH_EAST: the reference point is at the top right corner.
 * @GDK_GRAVITY_WEST: the reference point is at the middle of the left edge.
 * @GDK_GRAVITY_CENTER: the reference point is at the center of the surface.
 * @GDK_GRAVITY_EAST: the reference point is at the middle of the right edge.
 * @GDK_GRAVITY_SOUTH_WEST: the reference point is at the lower left corner.
 * @GDK_GRAVITY_SOUTH: the reference point is at the middle of the lower edge.
 * @GDK_GRAVITY_SOUTH_EAST: the reference point is at the lower right corner.
 * @GDK_GRAVITY_STATIC: the reference point is at the top left corner of the
 *  surface itself, ignoring window manager decorations.
 *
 * Defines the reference point of a surface and is used in `GdkPopupLayout`.
  }
type
  PGdkGravity = ^TGdkGravity;
  TGdkGravity =  Longint;
  Const
    GDK_GRAVITY_NORTH_WEST = 1;
    GDK_GRAVITY_NORTH = 2;
    GDK_GRAVITY_NORTH_EAST = 3;
    GDK_GRAVITY_WEST = 4;
    GDK_GRAVITY_CENTER = 5;
    GDK_GRAVITY_EAST = 6;
    GDK_GRAVITY_SOUTH_WEST = 7;
    GDK_GRAVITY_SOUTH = 8;
    GDK_GRAVITY_SOUTH_EAST = 9;
    GDK_GRAVITY_STATIC = 10;
;
{ Types of modifiers.
  }
{*
 * GdkModifierType:
 * @GDK_SHIFT_MASK: the Shift key.
 * @GDK_LOCK_MASK: a Lock key (depending on the Windowing System configuration,
 *    this may either be <kbd>CapsLock</kbd> or <kbd>ShiftLock</kbd>).
 * @GDK_CONTROL_MASK: the Control key.
 * @GDK_ALT_MASK: the fourth modifier key (it depends on the Windowing System
 *    configuration which key is interpreted as this modifier, but normally it
 *    is the <kbd>Alt</kbd> key).
 * @GDK_BUTTON1_MASK: the first mouse button.
 * @GDK_BUTTON2_MASK: the second mouse button.
 * @GDK_BUTTON3_MASK: the third mouse button.
 * @GDK_BUTTON4_MASK: the fourth mouse button.
 * @GDK_BUTTON5_MASK: the fifth mouse button.
 * @GDK_SUPER_MASK: the Super modifier.
 * @GDK_HYPER_MASK: the Hyper modifier.
 * @GDK_META_MASK: the Meta modifier. Maps to Command on macOS.
 *
 * Flags to indicate the state of modifier keys and mouse buttons
 * in events.
 *
 * Typical modifier keys are Shift, Control, Meta, Super, Hyper, Alt, Compose,
 * Apple, CapsLock or ShiftLock.
 *
 * Note that GDK may add internal values to events which include values outside
 * of this enumeration. Your code should preserve and ignore them. You can use
 * %GDK_MODIFIER_MASK to remove all private values.
  }
{*
   * GDK_NO_MODIFIER_MASK:
   *
   * No modifier.
   *
   * Since: 4.14
    }
type
  PGdkModifierType = ^TGdkModifierType;
  TGdkModifierType =  Longint;
  Const
    GDK_NO_MODIFIER_MASK = 0;
    GDK_SHIFT_MASK = 1 shl 0;
    GDK_LOCK_MASK = 1 shl 1;
    GDK_CONTROL_MASK = 1 shl 2;
    GDK_ALT_MASK = 1 shl 3;
    GDK_BUTTON1_MASK = 1 shl 8;
    GDK_BUTTON2_MASK = 1 shl 9;
    GDK_BUTTON3_MASK = 1 shl 10;
    GDK_BUTTON4_MASK = 1 shl 11;
    GDK_BUTTON5_MASK = 1 shl 12;
    GDK_SUPER_MASK = 1 shl 26;
    GDK_HYPER_MASK = 1 shl 27;
    GDK_META_MASK = 1 shl 28;
;
{*
 * GDK_MODIFIER_MASK:
 *
 * A mask covering all entries in `GdkModifierType`.
  }
  GDK_MODIFIER_MASK = ((((((((((GDK_SHIFT_MASK or GDK_LOCK_MASK) or GDK_CONTROL_MASK) or GDK_ALT_MASK) or GDK_SUPER_MASK) or GDK_HYPER_MASK) or GDK_META_MASK) or GDK_BUTTON1_MASK) or GDK_BUTTON2_MASK) or GDK_BUTTON3_MASK) or GDK_BUTTON4_MASK) or GDK_BUTTON5_MASK;  
{*
 * GdkDmabufError:
 * @GDK_DMABUF_ERROR_NOT_AVAILABLE: Dmabuf support is not available, because the OS
 *   is not Linux, or it was explicitly disabled at compile- or runtime
 * @GDK_DMABUF_ERROR_UNSUPPORTED_FORMAT: The requested format is not supported
 * @GDK_DMABUF_ERROR_CREATION_FAILED: GTK failed to create the resource for other
 *   reasons
 *
 * Error enumeration for `GdkDmabufTexture`.
 *
 * Since: 4.14
  }
type
  PGdkDmabufError = ^TGdkDmabufError;
  TGdkDmabufError =  Longint;
  Const
    GDK_DMABUF_ERROR_NOT_AVAILABLE = 0;
    GDK_DMABUF_ERROR_UNSUPPORTED_FORMAT = 1;
    GDK_DMABUF_ERROR_CREATION_FAILED = 2;
;
{*
 * GdkGLError:
 * @GDK_GL_ERROR_NOT_AVAILABLE: OpenGL support is not available
 * @GDK_GL_ERROR_UNSUPPORTED_FORMAT: The requested visual format is not supported
 * @GDK_GL_ERROR_UNSUPPORTED_PROFILE: The requested profile is not supported
 * @GDK_GL_ERROR_COMPILATION_FAILED: The shader compilation failed
 * @GDK_GL_ERROR_LINK_FAILED: The shader linking failed
 *
 * Error enumeration for `GdkGLContext`.
  }
type
  PGdkGLError = ^TGdkGLError;
  TGdkGLError =  Longint;
  Const
    GDK_GL_ERROR_NOT_AVAILABLE = 0;
    GDK_GL_ERROR_UNSUPPORTED_FORMAT = 1;
    GDK_GL_ERROR_UNSUPPORTED_PROFILE = 2;
    GDK_GL_ERROR_COMPILATION_FAILED = 3;
    GDK_GL_ERROR_LINK_FAILED = 4;
;
{*
 * GdkVulkanError:
 * @GDK_VULKAN_ERROR_UNSUPPORTED: Vulkan is not supported on this backend or has not been
 *   compiled in.
 * @GDK_VULKAN_ERROR_NOT_AVAILABLE: Vulkan support is not available on this Surface
 *
 * Error enumeration for `GdkVulkanContext`.
  }
type
  PGdkVulkanError = ^TGdkVulkanError;
  TGdkVulkanError =  Longint;
  Const
    GDK_VULKAN_ERROR_UNSUPPORTED = 0;
    GDK_VULKAN_ERROR_NOT_AVAILABLE = 1;
;
{*
 * GdkAxisUse:
 * @GDK_AXIS_IGNORE: the axis is ignored.
 * @GDK_AXIS_X: the axis is used as the x axis.
 * @GDK_AXIS_Y: the axis is used as the y axis.
 * @GDK_AXIS_DELTA_X: the axis is used as the scroll x delta
 * @GDK_AXIS_DELTA_Y: the axis is used as the scroll y delta
 * @GDK_AXIS_PRESSURE: the axis is used for pressure information.
 * @GDK_AXIS_XTILT: the axis is used for x tilt information.
 * @GDK_AXIS_YTILT: the axis is used for y tilt information.
 * @GDK_AXIS_WHEEL: the axis is used for wheel information.
 * @GDK_AXIS_DISTANCE: the axis is used for pen/tablet distance information
 * @GDK_AXIS_ROTATION: the axis is used for pen rotation information
 * @GDK_AXIS_SLIDER: the axis is used for pen slider information
 * @GDK_AXIS_LAST: a constant equal to the numerically highest axis value.
 *
 * Defines how device axes are interpreted by GTK.
 *
 * Note that the X and Y axes are not really needed; pointer devices
 * report their location via the x/y members of events regardless. Whether
 * X and Y are present as axes depends on the GDK backend.
  }
type
  PGdkAxisUse = ^TGdkAxisUse;
  TGdkAxisUse =  Longint;
  Const
    GDK_AXIS_IGNORE = 0;
    GDK_AXIS_X = 1;
    GDK_AXIS_Y = 2;
    GDK_AXIS_DELTA_X = 3;
    GDK_AXIS_DELTA_Y = 4;
    GDK_AXIS_PRESSURE = 5;
    GDK_AXIS_XTILT = 6;
    GDK_AXIS_YTILT = 7;
    GDK_AXIS_WHEEL = 8;
    GDK_AXIS_DISTANCE = 9;
    GDK_AXIS_ROTATION = 10;
    GDK_AXIS_SLIDER = 11;
    GDK_AXIS_LAST = 12;
;
{*
 * GdkAxisFlags:
 * @GDK_AXIS_FLAG_X: X axis is present
 * @GDK_AXIS_FLAG_Y: Y axis is present
 * @GDK_AXIS_FLAG_DELTA_X: Scroll X delta axis is present
 * @GDK_AXIS_FLAG_DELTA_Y: Scroll Y delta axis is present
 * @GDK_AXIS_FLAG_PRESSURE: Pressure axis is present
 * @GDK_AXIS_FLAG_XTILT: X tilt axis is present
 * @GDK_AXIS_FLAG_YTILT: Y tilt axis is present
 * @GDK_AXIS_FLAG_WHEEL: Wheel axis is present
 * @GDK_AXIS_FLAG_DISTANCE: Distance axis is present
 * @GDK_AXIS_FLAG_ROTATION: Z-axis rotation is present
 * @GDK_AXIS_FLAG_SLIDER: Slider axis is present
 *
 * Flags describing the current capabilities of a device/tool.
  }
type
  PGdkAxisFlags = ^TGdkAxisFlags;
  TGdkAxisFlags =  Longint;
  Const
    GDK_AXIS_FLAG_X = 1 shl GDK_AXIS_X;
    GDK_AXIS_FLAG_Y = 1 shl GDK_AXIS_Y;
    GDK_AXIS_FLAG_DELTA_X = 1 shl GDK_AXIS_DELTA_X;
    GDK_AXIS_FLAG_DELTA_Y = 1 shl GDK_AXIS_DELTA_Y;
    GDK_AXIS_FLAG_PRESSURE = 1 shl GDK_AXIS_PRESSURE;
    GDK_AXIS_FLAG_XTILT = 1 shl GDK_AXIS_XTILT;
    GDK_AXIS_FLAG_YTILT = 1 shl GDK_AXIS_YTILT;
    GDK_AXIS_FLAG_WHEEL = 1 shl GDK_AXIS_WHEEL;
    GDK_AXIS_FLAG_DISTANCE = 1 shl GDK_AXIS_DISTANCE;
    GDK_AXIS_FLAG_ROTATION = 1 shl GDK_AXIS_ROTATION;
    GDK_AXIS_FLAG_SLIDER = 1 shl GDK_AXIS_SLIDER;
;
{*
 * GdkDragAction:
 * @GDK_ACTION_COPY: Copy the data.
 * @GDK_ACTION_MOVE: Move the data, i.e. first copy it, then delete
 *   it from the source using the DELETE target of the X selection protocol.
 * @GDK_ACTION_LINK: Add a link to the data. Note that this is only
 *   useful if source and destination agree on what it means, and is not
 *   supported on all platforms.
 * @GDK_ACTION_ASK: Ask the user what to do with the data.
 *
 * Used in `GdkDrop` and `GdkDrag` to indicate the actions that the
 * destination can and should do with the dropped data.
  }
{*
   * GDK_ACTION_NONE:
   *
   * No action.
   *
   * Since: 4.20
    }
type
  PGdkDragAction = ^TGdkDragAction;
  TGdkDragAction =  Longint;
  Const
    GDK_ACTION_NONE = 0;
    GDK_ACTION_COPY = 1 shl 0;
    GDK_ACTION_MOVE = 1 shl 1;
    GDK_ACTION_LINK = 1 shl 2;
    GDK_ACTION_ASK = 1 shl 3;
;
{*
 * GdkScrollRelativeDirection:
 * @GDK_SCROLL_RELATIVE_DIRECTION_IDENTICAL: Physical motion and event motion are the same
 * @GDK_SCROLL_RELATIVE_DIRECTION_INVERTED: Physical motion is inverted relative to event motion
 * @GDK_SCROLL_RELATIVE_DIRECTION_UNKNOWN: Relative motion is unknown on this device or backend
 *
 * Used in scroll events, to announce the direction relative
 * to physical motion.
 *
 * Since: 4.20
  }
type
  PGdkScrollRelativeDirection = ^TGdkScrollRelativeDirection;
  TGdkScrollRelativeDirection =  Longint;
  Const
    GDK_SCROLL_RELATIVE_DIRECTION_IDENTICAL = 0;
    GDK_SCROLL_RELATIVE_DIRECTION_INVERTED = 1;
    GDK_SCROLL_RELATIVE_DIRECTION_UNKNOWN = 2;
;
{*
 * GDK_ACTION_ALL:
 *
 * Defines all possible DND actions.
 *
 * This can be used in [method@Gdk.Drop.status] messages when any drop
 * can be accepted or a more specific drop method is not yet known.
  }
  GDK_ACTION_ALL = (GDK_ACTION_COPY or GDK_ACTION_MOVE) or GDK_ACTION_LINK;  
{*
 * GdkMemoryFormat:
 * @GDK_MEMORY_B8G8R8A8_PREMULTIPLIED: 4 bytes; for blue, green, red, alpha.
 *   The color values are premultiplied with the alpha value.
 * @GDK_MEMORY_A8R8G8B8_PREMULTIPLIED: 4 bytes; for alpha, red, green, blue.
 *   The color values are premultiplied with the alpha value.
 * @GDK_MEMORY_R8G8B8A8_PREMULTIPLIED: 4 bytes; for red, green, blue, alpha
 *   The color values are premultiplied with the alpha value.
 * @GDK_MEMORY_B8G8R8A8: 4 bytes; for blue, green, red, alpha.
 * @GDK_MEMORY_A8R8G8B8: 4 bytes; for alpha, red, green, blue.
 * @GDK_MEMORY_R8G8B8A8: 4 bytes; for red, green, blue, alpha.
 * @GDK_MEMORY_A8B8G8R8: 4 bytes; for alpha, blue, green, red.
 * @GDK_MEMORY_R8G8B8: 3 bytes; for red, green, blue. The data is opaque.
 * @GDK_MEMORY_B8G8R8: 3 bytes; for blue, green, red. The data is opaque.
 * @GDK_MEMORY_N_FORMATS: The number of formats. This value will change as
 *   more formats get added, so do not rely on its concrete integer.
 * @GDK_MEMORY_R32G32B32_FLOAT: 3 float values; for red, green, blue.
 *
 * Describes formats that image data can have in memory.
 *
 * It describes formats by listing the contents of the memory passed to it.
 * So `GDK_MEMORY_A8R8G8B8` will be 1 byte (8 bits) of alpha, followed by a
 * byte each of red, green and blue. It is not endian-dependent, so
 * `CAIRO_FORMAT_ARGB32` is represented by different `GdkMemoryFormats`
 * on architectures with different endiannesses.
 *
 * Its naming is modelled after
 * [VkFormat](https://www.khronos.org/registry/vulkan/specs/1.0/html/vkspec.html#VkFormat)
 * for details).
  }
{*
 * GDK_MEMORY_A8B8G8R8_PREMULTIPLIED:
 *
 * 4 bytes; for alpha, blue, green, red, The color values are premultiplied with
 * the alpha value.
 *
 * Since: 4.14
  }
{*
 * GDK_MEMORY_B8G8R8X8:
 *
 * 4 bytes; for blue, green, red, unused.
 *
 * Since: 4.14
  }
{*
 * GDK_MEMORY_X8R8G8B8:
 *
 * 4 bytes; for unused, red, green, blue.
 *
 * Since: 4.14
  }
{*
 * GDK_MEMORY_R8G8B8X8:
 *
 * 4 bytes; for red, green, blue, unused.
 *
 * Since: 4.14
  }
{*
 * GDK_MEMORY_X8B8G8R8:
 *
 * 4 bytes; for unused, blue, green, red.
 *
 * Since: 4.14
  }
{*
 * GDK_MEMORY_R16G16B16:
 *
 * 3 guint16 values; for red, green, blue.
 *
 * Since: 4.6
  }
{*
 * GDK_MEMORY_R16G16B16A16_PREMULTIPLIED:
 *
 * 4 guint16 values; for red, green, blue, alpha. The color values are
 * premultiplied with the alpha value.
 *
 * Since: 4.6
  }
{*
 * GDK_MEMORY_R16G16B16A16:
 *
 * 4 guint16 values; for red, green, blue, alpha.
 *
 * Since: 4.6
  }
{*
 * GDK_MEMORY_R16G16B16_FLOAT:
 *
 * 3 half-float values; for red, green, blue. The data is opaque.
 *
 * Since: 4.6
  }
{*
 * GDK_MEMORY_R16G16B16A16_FLOAT_PREMULTIPLIED:
 *
 * 4 half-float values; for red, green, blue and alpha. The color values are
 * premultiplied with the alpha value.
 *
 * Since: 4.6
  }
{*
 * GDK_MEMORY_R16G16B16A16_FLOAT:
 *
 * 4 half-float values; for red, green, blue and alpha.
 *
 * Since: 4.6
  }
{*
 * GDK_MEMORY_B32G32R32_FLOAT:
 *
 * 3 float values; for blue, green, red. The data is opaque.
 *
 * Since: 4.6
  }
{*
 * GDK_MEMORY_R32G32B32A32_FLOAT_PREMULTIPLIED:
 *
 * 4 float values; for red, green, blue and alpha. The color values are
 * premultiplied with the alpha value.
 *
 * Since: 4.6
  }
{*
 * GDK_MEMORY_R32G32B32A32_FLOAT:
 *
 * 4 float values; for red, green, blue and alpha.
 *
 * Since: 4.6
  }
{*
 * GDK_MEMORY_G8A8_PREMULTIPLIED:
 *
 * 2 bytes; for grayscale, alpha. The color values are premultiplied with the
 * alpha value.
 *
 * Since: 4.12
  }
{*
 * GDK_MEMORY_G8A8:
 *
 * 2 bytes; for grayscale, alpha.
 *
 * Since: 4.12
  }
{*
 * GDK_MEMORY_G8:
 *
 * One byte; for grayscale. The data is opaque.
 *
 * Since: 4.12
  }
{*
 * GDK_MEMORY_G16A16_PREMULTIPLIED:
 *
 * 2 guint16 values; for grayscale, alpha. The color values are premultiplied
 * with the alpha value.
 *
 * Since: 4.12
  }
{*
 * GDK_MEMORY_G16A16:
 *
 * 2 guint16 values; for grayscale, alpha.
 *
 * Since: 4.12
  }
{*
 * GDK_MEMORY_G16:
 *
 * One guint16 value; for grayscale. The data is opaque.
 *
 * Since: 4.12
  }
{*
 * GDK_MEMORY_A8:
 *
 * One byte; for alpha.
 *
 * Since: 4.12
  }
{*
 * GDK_MEMORY_A16:
 *
 * One guint16 value; for alpha.
 *
 * Since: 4.12
  }
{*
 * GDK_MEMORY_A16_FLOAT:
 *
 * One half-float value; for alpha.
 *
 * Since: 4.12
  }
{*
 * GDK_MEMORY_A32_FLOAT:
 *
 * One float value; for alpha.
 *
 * Since: 4.12
  }
{*
 * GDK_MEMORY_G8_B8R8_420:
 *
 * Multiplane format with 2 planes.
 *
 * The first plane contains the first channel, usually containing
 * luma values.
 * The second plane with interleaved chroma values, Cb followed by Cr.
 * Subsampled in both the X and Y direction.
 *
 * Commonly known by the fourcc "NV12".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_G8_R8B8_420:
 *
 * Multiplane format with 2 planes.
 *
 * The first plane contains the first channel, usually containing
 * luma values.
 * The second plane with interleaved chroma values, Cr followed by Cb.
 * Subsampled in both the X and Y direction.
 *
 * Commonly known by the fourcc "NV21".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_G8_B8R8_422:
 *
 * Multiplane format with 2 planes.
 *
 * The first plane contains the first channel, usually containing
 * luma values.
 * The second plane with interleaved chroma values, Cb followed by Cr.
 * Subsampled in the X direction.
 *
 * Commonly known by the fourcc "NV16".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_G8_R8B8_422:
 *
 * Multiplane format with 2 planes.
 *
 * The first plane contains the first channel, usually containing
 * luma values.
 * The second plane with interleaved chroma values, Cr followed by Cb.
 * Subsampled in the X direction.
 *
 * Commonly known by the fourcc "NV61".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_G8_B8R8_444:
 *
 * Multiplane format with 2 planes.
 *
 * The first plane contains the first channel, usually containing
 * luma values.
 * The second plane with interleaved chroma values, Cb followed by Cr.
 * This format is not subsampled.
 *
 * Commonly known by the fourcc "NV24".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_G8_R8B8_444:
 *
 * Multiplane format with 2 planes.
 *
 * The first plane contains the first channel, usually containing
 * luma values.
 * The second plane with interleaved chroma values, Cr followed by Cb.
 * This format is not subsampled.
 *
 * Commonly known by the fourcc "NV42".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_G10X6_B10X6R10X6_420:
 *
 * Multiplane format with 2 planes.
 *
 * Each channel is a 16 bit integer, but only the highest 10 bits are used.
 *
 * The first plane contains the first channel, usually containing
 * luma values.
 * The second plane with interleaved chroma values, Cr followed by Cb.
 * This format is not subsampled.
 *
 * Commonly known by the fourcc "P010".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_G12X4_B12X4R12X4_420:
 *
 * Multiplane format with 2 planes.
 *
 * Each channel is a 16 bit integer, but only the highest 10 bits are used.
 *
 * The first plane contains the first channel, usually containing
 * luma values.
 * The second plane with interleaved chroma values, Cr followed by Cb.
 * This format is not subsampled.
 *
 * Commonly known by the fourcc "P012".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_G16_B16R16_420:
 *
 * Multiplane format with 2 planes.
 *
 * Each channel is a 16 bit integer.
 *
 * The first plane contains the first channel, usually containing
 * luma values.
 * The second plane with interleaved chroma values, Cr followed by Cb.
 * This format is not subsampled.
 *
 * Commonly known by the fourcc "P016".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_G8_B8_R8_410:
 *
 * Multiplane format with 3 planes.
 *
 * Each channel is a 8 bit integer.
 *
 * The first plane usually contains the luma channel. It is mapped
 * into the 2nd channel.
 *
 * The second plane usually contains the first chroma chanel.
 * Subsampled in both the X and Y direction with 4:1 ratio. It is
 * mapped into the 3rd channel.
 *
 * The third plane usually contains the second chroma channel.
 * Subsampled in both the X and Y direction with 4:1 ratio. It is
 * mapped into the 1st channel.
 *
 * Commonly known by the fourcc "YUV410".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_G8_R8_B8_410:
 *
 * Multiplane format with 3 planes.
 *
 * Each channel is a 8 bit integer.
 *
 * The first plane usually contains the luma channel. It is mapped
 * into the 2nd channel.
 *
 * The second plane usually contains the second chroma chanel.
 * Subsampled in both the X and Y direction with 4:1 ratio. It is
 * mapped into the 1st channel.
 *
 * The third plane usually contains the first chroma channel.
 * Subsampled in both the X and Y direction with 4:1 ratio. It is
 * mapped into the 3rd channel.
 *
 * Commonly known by the fourcc "YVU410".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_G8_B8_R8_411:
 *
 * Multiplane format with 3 planes.
 *
 * Each channel is a 8 bit integer.
 *
 * The first plane usually contains the luma channel. It is mapped
 * into the 2nd channel.
 *
 * The second plane usually contains the first chroma chanel.
 * Subsampled in the X direction with 4:1 ratio. It is
 * mapped into the 3rd channel.
 *
 * The third plane usually contains the second chroma channel.
 * Subsampled in the X direction with 4:1 ratio. It is
 * mapped into the 1st channel.
 *
 * Commonly known by the fourcc "YUV411".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_G8_R8_B8_411:
 *
 * Multiplane format with 3 planes.
 *
 * Each channel is a 8 bit integer.
 *
 * The first plane usually contains the luma channel. It is mapped
 * into the 2nd channel.
 *
 * The second plane usually contains the second chroma chanel.
 * Subsampled in the X direction with 4:1 ratio. It is
 * mapped into the 1st channel.
 *
 * The third plane usually contains the first chroma channel.
 * Subsampled in the X direction with 4:1 ratio. It is
 * mapped into the 3rd channel.
 *
 * Commonly known by the fourcc "YVU411".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_G8_B8_R8_420:
 *
 * Multiplane format with 3 planes.
 *
 * Each channel is a 8 bit integer.
 *
 * The first plane usually contains the luma channel. It is mapped
 * into the 2nd channel.
 *
 * The second plane usually contains the first chroma chanel.
 * Subsampled in both the X and Y direction. It is mapped into the
 * 3rd channel.
 *
 * The third plane usually contains the second chroma channel.
 * Subsampled in both the X and Y direction. It is mapped into the
 * 1st channel.
 *
 * Commonly known by the fourcc "YUV420".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_G8_R8_B8_420:
 *
 * Multiplane format with 3 planes.
 *
 * Each channel is a 8 bit integer.
 *
 * The first plane usually contains the luma channel. It is mapped
 * into the 2nd channel.
 *
 * The second plane usually contains the second chroma chanel.
 * Subsampled in both the X and Y direction. It is mapped into the
 * 1st channel.
 *
 * The third plane usually contains the first chroma channel.
 * Subsampled in both the X and Y direction. It is mapped into the
 * 3rd channel.
 *
 * Commonly known by the fourcc "YVU420".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_G8_B8_R8_422:
 *
 * Multiplane format with 3 planes.
 *
 * Each channel is a 8 bit integer.
 *
 * The first plane usually contains the luma channel. It is mapped
 * into the 2nd channel.
 *
 * The second plane usually contains the first chroma chanel.
 * Subsampled in the X direction. It is mapped into the 3rd channel.
 *
 * The third plane usually contains the second chroma channel.
 * Subsampled in the X direction. It is mapped into the 1st channel.
 *
 * Commonly known by the fourcc "YUV422".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_G8_R8_B8_422:
 *
 * Multiplane format with 3 planes.
 *
 * Each channel is a 8 bit integer.
 *
 * The first plane usually contains the luma channel. It is mapped
 * into the 2nd channel.
 *
 * The second plane usually contains the second chroma chanel.
 * Subsampled in the X direction. It is mapped into the 1st channel.
 *
 * The third plane usually contains the first chroma channel.
 * Subsampled in the X direction. It is mapped into the 3rd channel.
 *
 * Commonly known by the fourcc "YVU422".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_G8_B8_R8_444:
 *
 * Multiplane format with 3 planes.
 *
 * Each channel is a 8 bit integer.
 *
 * The first plane usually contains the luma channel. It is mapped
 * into the 2nd channel.
 *
 * The second plane usually contains the first chroma chanel. It is
 * mapped into the 3rd channel.
 *
 * The third plane usually contains the second chroma channel. It is
 * mapped into the 1st channel.
 *
 * Commonly known by the fourcc "YUV444".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_G8_R8_B8_444:
 *
 * Multiplane format with 3 planes.
 *
 * Each channel is a 8 bit integer.
 *
 * The first plane usually contains the luma channel. It is mapped
 * into the 2nd channel.
 *
 * The second plane usually contains the second chroma chanel.
 * Subsampled in the X direction. It is mapped into the 1st channel.
 *
 * The third plane usually contains the first chroma channel.
 * Subsampled in the X direction. It is mapped into the 3rd channel.
 *
 * Commonly known by the fourcc "YVU444".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_G8B8G8R8_422:
 *
 * Packed format with subsampled channels.
 *
 * Each channel is a 8 bit integer. The red and blue/chroma channels
 * are subsampled and interleaved with the green/luma channel.
 *
 * Each block contains 2 pixels, so the width must be a multiple of
 * 2.
 *
 * Commonly known by the fourcc "YUYV".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_G8R8G8B8_422:
 *
 * Packed format with subsampled channels.
 *
 * Each channel is a 8 bit integer. The red and blue/chroma channels
 * are subsampled and interleaved with the green/luma channel.
 *
 * Each block contains 2 pixels, so the width must be a multiple of
 * 2.
 *
 * Commonly known by the fourcc "YVYU".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_R8G8B8G8_422:
 *
 * Packed format with subsampled channels.
 *
 * Each channel is a 8 bit integer. The red and blue/chroma channels
 * are subsampled and interleaved with the green/luma channel.
 *
 * Each block contains 2 pixels, so the width must be a multiple of
 * 2.
 *
 * Commonly known by the fourcc "VYUY".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_B8G8R8G8_422:
 *
 * Packed format with subsampled channels.
 *
 * Each channel is a 8 bit integer. The red and blue/chroma channels
 * are subsampled and interleaved with the green/luma channel.
 *
 * Each block contains 2 pixels, so the width must be a multiple of
 * 2.
 *
 * Commonly known by the fourcc "UYVY".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_X6G10_X6B10_X6R10_420:
 *
 * Multiplane format with 3 planes.
 *
 * Each channel is a 16 bit integer.
 *
 * Only the 10 lower bits are used. The remaining ones must be set to 0 by the
 * producer.
 *
 * The first plane usually contains the luma channel. It is mapped
 * into the 2nd channel.
 *
 * The second plane usually contains the first chroma chanel.
 * Subsampled in both the X and Y direction. It is mapped into the
 * 3rd channel.
 *
 * The third plane usually contains the second chroma channel.
 * Subsampled in both the X and Y direction. It is mapped into the
 * 1st channel.
 *
 * Commonly known by the fourcc "S010".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_X6G10_X6B10_X6R10_422:
 *
 * Multiplane format with 3 planes.
 *
 * Each channel is a 16 bit integer.
 *
 * Only the 10 lower bits are used. The remaining ones must be set to 0 by the
 * producer.
 *
 * The first plane usually contains the luma channel. It is mapped
 * into the 2nd channel.
 *
 * The second plane usually contains the first chroma chanel.
 * Subsampled in the X direction. It is mapped into the 3rd channel.
 *
 * The third plane usually contains the second chroma channel.
 * Subsampled in the X direction. It is mapped into the 1st channel.
 *
 * Commonly known by the fourcc "S210".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_X6G10_X6B10_X6R10_444:
 *
 * Multiplane format with 3 planes.
 *
 * Each channel is a 16 bit integer.
 *
 * Only the 10 lower bits are used. The remaining ones must be set to 0 by the
 * producer.
 *
 * The first plane usually contains the luma channel. It is mapped
 * into the 2nd channel.
 *
 * The second plane usually contains the first chroma chanel. It is
 * mapped into the 3rd channel.
 *
 * The third plane usually contains the second chroma channel. It is
 * mapped into the 1st channel.
 *
 * Commonly known by the fourcc "S410".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_X4G12_X4B12_X4R12_420:
 *
 * Multiplane format with 3 planes.
 *
 * Each channel is a 16 bit integer.
 *
 * Only the 12 lower bits are used. The remaining ones must be set to 0 by the
 * producer.
 *
 * The first plane usually contains the luma channel. It is mapped
 * into the 2nd channel.
 *
 * The second plane usually contains the first chroma chanel.
 * Subsampled in both the X and Y direction. It is mapped into the
 * 3rd channel.
 *
 * The third plane usually contains the second chroma channel.
 * Subsampled in both the X and Y direction. It is mapped into the
 * 1st channel.
 *
 * Commonly known by the fourcc "S012".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_X4G12_X4B12_X4R12_422:
 *
 * Multiplane format with 3 planes.
 *
 * Each channel is a 16 bit integer.
 *
 * Only the 12 lower bits are used. The remaining ones must be set to 0 by the
 * producer.
 *
 * The first plane usually contains the luma channel. It is mapped
 * into the 2nd channel.
 *
 * The second plane usually contains the first chroma chanel.
 * Subsampled in the X direction. It is mapped into the 3rd channel.
 *
 * The third plane usually contains the second chroma channel.
 * Subsampled in the X direction. It is mapped into the 1st channel.
 *
 * Commonly known by the fourcc "S212".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_X4G12_X4B12_X4R12_444:
 *
 * Multiplane format with 3 planes.
 *
 * Each channel is a 16 bit integer.
 *
 * Only the 12 lower bits are used. The remaining ones must be set to 0 by the
 * producer.
 *
 * The first plane usually contains the luma channel. It is mapped
 * into the 2nd channel.
 *
 * The second plane usually contains the first chroma chanel. It is
 * mapped into the 3rd channel.
 *
 * The third plane usually contains the second chroma channel. It is
 * mapped into the 1st channel.
 *
 * Commonly known by the fourcc "S412".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_G16_B16_R16_420:
 *
 * Multiplane format with 3 planes.
 *
 * Each channel is a 16 bit integer.
 *
 * The first plane usually contains the luma channel. It is mapped
 * into the 2nd channel.
 *
 * The second plane usually contains the first chroma chanel.
 * Subsampled in both the X and Y direction. It is mapped into the
 * 3rd channel.
 *
 * The third plane usually contains the second chroma channel.
 * Subsampled in both the X and Y direction. It is mapped into the
 * 1st channel.
 *
 * Commonly known by the fourcc "S016".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_G16_B16_R16_422:
 *
 * Multiplane format with 3 planes.
 *
 * Each channel is a 16 bit integer.
 *
 * The first plane usually contains the luma channel. It is mapped
 * into the 2nd channel.
 *
 * The second plane usually contains the first chroma chanel.
 * Subsampled in the X direction. It is mapped into the 3rd channel.
 *
 * The third plane usually contains the second chroma channel.
 * Subsampled in the X direction. It is mapped into the 1st channel.
 *
 * Commonly known by the fourcc "S216".
 *
 * Since: 4.20
  }
{*
 * GDK_MEMORY_G16_B16_R16_444:
 *
 * Multiplane format with 3 planes.
 *
 * Each channel is a 16 bit integer.
 *
 * The first plane usually contains the luma channel. It is mapped
 * into the 2nd channel.
 *
 * The second plane usually contains the first chroma chanel. It is
 * mapped into the 3rd channel.
 *
 * The third plane usually contains the second chroma channel. It is
 * mapped into the 1st channel.
 *
 * Commonly known by the fourcc "S416".
 *
 * Since: 4.20
  }
type
  PGdkMemoryFormat = ^TGdkMemoryFormat;
  TGdkMemoryFormat =  Longint;
  Const
    GDK_MEMORY_B8G8R8A8_PREMULTIPLIED = 0;
    GDK_MEMORY_A8R8G8B8_PREMULTIPLIED = 1;
    GDK_MEMORY_R8G8B8A8_PREMULTIPLIED = 2;
    GDK_MEMORY_B8G8R8A8 = 3;
    GDK_MEMORY_A8R8G8B8 = 4;
    GDK_MEMORY_R8G8B8A8 = 5;
    GDK_MEMORY_A8B8G8R8 = 6;
    GDK_MEMORY_R8G8B8 = 7;
    GDK_MEMORY_B8G8R8 = 8;
    GDK_MEMORY_R16G16B16 = 9;
    GDK_MEMORY_R16G16B16A16_PREMULTIPLIED = 10;
    GDK_MEMORY_R16G16B16A16 = 11;
    GDK_MEMORY_R16G16B16_FLOAT = 12;
    GDK_MEMORY_R16G16B16A16_FLOAT_PREMULTIPLIED = 13;
    GDK_MEMORY_R16G16B16A16_FLOAT = 14;
    GDK_MEMORY_R32G32B32_FLOAT = 15;
    GDK_MEMORY_R32G32B32A32_FLOAT_PREMULTIPLIED = 16;
    GDK_MEMORY_R32G32B32A32_FLOAT = 17;
    GDK_MEMORY_G8A8_PREMULTIPLIED = 18;
    GDK_MEMORY_G8A8 = 19;
    GDK_MEMORY_G8 = 20;
    GDK_MEMORY_G16A16_PREMULTIPLIED = 21;
    GDK_MEMORY_G16A16 = 22;
    GDK_MEMORY_G16 = 23;
    GDK_MEMORY_A8 = 24;
    GDK_MEMORY_A16 = 25;
    GDK_MEMORY_A16_FLOAT = 26;
    GDK_MEMORY_A32_FLOAT = 27;
    GDK_MEMORY_A8B8G8R8_PREMULTIPLIED = 28;
    GDK_MEMORY_B8G8R8X8 = 29;
    GDK_MEMORY_X8R8G8B8 = 30;
    GDK_MEMORY_R8G8B8X8 = 31;
    GDK_MEMORY_X8B8G8R8 = 32;
    GDK_MEMORY_G8_B8R8_420 = 33;
    GDK_MEMORY_G8_R8B8_420 = 34;
    GDK_MEMORY_G8_B8R8_422 = 35;
    GDK_MEMORY_G8_R8B8_422 = 36;
    GDK_MEMORY_G8_B8R8_444 = 37;
    GDK_MEMORY_G8_R8B8_444 = 38;
    GDK_MEMORY_G10X6_B10X6R10X6_420 = 39;
    GDK_MEMORY_G12X4_B12X4R12X4_420 = 40;
    GDK_MEMORY_G16_B16R16_420 = 41;
    GDK_MEMORY_G8_B8_R8_410 = 42;
    GDK_MEMORY_G8_R8_B8_410 = 43;
    GDK_MEMORY_G8_B8_R8_411 = 44;
    GDK_MEMORY_G8_R8_B8_411 = 45;
    GDK_MEMORY_G8_B8_R8_420 = 46;
    GDK_MEMORY_G8_R8_B8_420 = 47;
    GDK_MEMORY_G8_B8_R8_422 = 48;
    GDK_MEMORY_G8_R8_B8_422 = 49;
    GDK_MEMORY_G8_B8_R8_444 = 50;
    GDK_MEMORY_G8_R8_B8_444 = 51;
    GDK_MEMORY_G8B8G8R8_422 = 52;
    GDK_MEMORY_G8R8G8B8_422 = 53;
    GDK_MEMORY_R8G8B8G8_422 = 54;
    GDK_MEMORY_B8G8R8G8_422 = 55;
    GDK_MEMORY_X6G10_X6B10_X6R10_420 = 56;
    GDK_MEMORY_X6G10_X6B10_X6R10_422 = 57;
    GDK_MEMORY_X6G10_X6B10_X6R10_444 = 58;
    GDK_MEMORY_X4G12_X4B12_X4R12_420 = 59;
    GDK_MEMORY_X4G12_X4B12_X4R12_422 = 60;
    GDK_MEMORY_X4G12_X4B12_X4R12_444 = 61;
    GDK_MEMORY_G16_B16_R16_420 = 62;
    GDK_MEMORY_G16_B16_R16_422 = 63;
    GDK_MEMORY_G16_B16_R16_444 = 64;
    GDK_MEMORY_N_FORMATS = 65;
;

implementation


end.
