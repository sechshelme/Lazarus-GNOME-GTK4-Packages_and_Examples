
unit hwcontext_drm;
interface

{
  Automatically converted by H2Pas 1.0.0 from hwcontext_drm.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hwcontext_drm.h
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
PAVDRMDeviceContext  = ^AVDRMDeviceContext;
PAVDRMFrameDescriptor  = ^AVDRMFrameDescriptor;
PAVDRMLayerDescriptor  = ^AVDRMLayerDescriptor;
PAVDRMObjectDescriptor  = ^AVDRMObjectDescriptor;
PAVDRMPlaneDescriptor  = ^AVDRMPlaneDescriptor;
Pxxxxx  = ^xxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  }
{$ifndef AVUTIL_HWCONTEXT_DRM_H}
{$define AVUTIL_HWCONTEXT_DRM_H}
{$include <stddef.h>}
{$include <stdint.h>}
{*
 * @file
 * API-specific header for AV_HWDEVICE_TYPE_DRM.
 *
 * Internal frame allocation is not currently supported - all frames
 * must be allocated by the user.  Thus AVHWFramesContext is always
 * NULL, though this may change if support for frame allocation is
 * added in future.
  }
{*
     * The maximum number of layers/planes in a DRM frame.
      }
type
  Txxxxx =  Longint;
  Const
    AV_DRM_MAX_PLANES = 4;

{*
 * DRM object descriptor.
 *
 * Describes a single DRM object, addressing it as a PRIME file
 * descriptor.
  }
{*
     * DRM PRIME fd for the object.
      }
{*
     * Total size of the object.
     *
     * (This includes any parts not which do not contain image data.)
      }
{*
     * Format modifier applied to the object (DRM_FORMAT_MOD_*).
     *
     * If the format modifier is unknown then this should be set to
     * DRM_FORMAT_MOD_INVALID.
      }
type
  PAVDRMObjectDescriptor = ^TAVDRMObjectDescriptor;
  TAVDRMObjectDescriptor = record
      fd : longint;
      size : Tsize_t;
      format_modifier : Tuint64_t;
    end;
{*
 * DRM plane descriptor.
 *
 * Describes a single plane of a layer, which is contained within
 * a single object.
  }
{*
     * Index of the object containing this plane in the objects
     * array of the enclosing frame descriptor.
      }
{*
     * Offset within that object of this plane.
      }
{*
     * Pitch (linesize) of this plane.
      }

  PAVDRMPlaneDescriptor = ^TAVDRMPlaneDescriptor;
  TAVDRMPlaneDescriptor = record
      object_index : longint;
      offset : Tptrdiff_t;
      pitch : Tptrdiff_t;
    end;
{*
 * DRM layer descriptor.
 *
 * Describes a single layer within a frame.  This has the structure
 * defined by its format, and will contain one or more planes.
  }
{*
     * Format of the layer (DRM_FORMAT_*).
      }
{*
     * Number of planes in the layer.
     *
     * This must match the number of planes required by format.
      }
{*
     * Array of planes in this layer.
      }

  PAVDRMLayerDescriptor = ^TAVDRMLayerDescriptor;
  TAVDRMLayerDescriptor = record
      format : Tuint32_t;
      nb_planes : longint;
      planes : array[0..(AV_DRM_MAX_PLANES)-1] of TAVDRMPlaneDescriptor;
    end;
{*
 * DRM frame descriptor.
 *
 * This is used as the data pointer for AV_PIX_FMT_DRM_PRIME frames.
 * It is also used by user-allocated frame pools - allocating in
 * AVHWFramesContext.pool must return AVBufferRefs which contain
 * an object of this type.
 *
 * The fields of this structure should be set such it can be
 * imported directly by EGL using the EGL_EXT_image_dma_buf_import
 * and EGL_EXT_image_dma_buf_import_modifiers extensions.
 * (Note that the exact layout of a particular format may vary between
 * platforms - we only specify that the same platform should be able
 * to import it.)
 *
 * The total number of planes must not exceed AV_DRM_MAX_PLANES, and
 * the order of the planes by increasing layer index followed by
 * increasing plane index must be the same as the order which would
 * be used for the data pointers in the equivalent software format.
  }
{*
     * Number of DRM objects making up this frame.
      }
{*
     * Array of objects making up the frame.
      }
{*
     * Number of layers in the frame.
      }
{*
     * Array of layers in the frame.
      }

  PAVDRMFrameDescriptor = ^TAVDRMFrameDescriptor;
  TAVDRMFrameDescriptor = record
      nb_objects : longint;
      objects : array[0..(AV_DRM_MAX_PLANES)-1] of TAVDRMObjectDescriptor;
      nb_layers : longint;
      layers : array[0..(AV_DRM_MAX_PLANES)-1] of TAVDRMLayerDescriptor;
    end;
{*
 * DRM device.
 *
 * Allocated as AVHWDeviceContext.hwctx.
  }
{*
     * File descriptor of DRM device.
     *
     * This is used as the device to create frames on, and may also be
     * used in some derivation and mapping operations.
     *
     * If no device is required, set to -1.
      }

  PAVDRMDeviceContext = ^TAVDRMDeviceContext;
  TAVDRMDeviceContext = record
      fd : longint;
    end;
{$endif}
{ AVUTIL_HWCONTEXT_DRM_H  }

implementation


end.
