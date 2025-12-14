unit hwcontext_vaapi;

interface

uses
  fp_ffmpeg;

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
{$ifndef AVUTIL_HWCONTEXT_VAAPI_H}
{$define AVUTIL_HWCONTEXT_VAAPI_H}
{$include <va/va.h>}
{*
 * @file
 * API-specific header for AV_HWDEVICE_TYPE_VAAPI.
 *
 * Dynamic frame pools are supported, but note that any pool used as a render
 * target is required to be of fixed size in order to be be usable as an
 * argument to vaCreateContext().
 *
 * For user-allocated pools, AVHWFramesContext.pool must return AVBufferRefs
 * with the data pointer set to a VASurfaceID.
  }
{*
     * The quirks field has been set by the user and should not be detected
     * automatically by av_hwdevice_ctx_init().
      }
{*
     * The driver does not destroy parameter buffers when they are used by
     * vaRenderPicture().  Additional code will be required to destroy them
     * separately afterwards.
      }
{*
     * The driver does not support the VASurfaceAttribMemoryType attribute,
     * so the surface allocation code will not try to use it.
      }
{*
     * The driver does not support surface attributes at all.
     * The surface allocation code will never pass them to surface allocation,
     * and the results of the vaQuerySurfaceAttributes() call will be faked.
      }
type
  Txxxxxxxxx =  Longint;
  Const
    AV_VAAPI_DRIVER_QUIRK_USER_SET = 1 shl 0;
    AV_VAAPI_DRIVER_QUIRK_RENDER_PARAM_BUFFERS = 1 shl 1;
    AV_VAAPI_DRIVER_QUIRK_ATTRIB_MEMTYPE = 1 shl 2;
    AV_VAAPI_DRIVER_QUIRK_SURFACE_ATTRIBUTES = 1 shl 3;

{*
 * VAAPI connection details.
 *
 * Allocated as AVHWDeviceContext.hwctx
  }
{*
     * The VADisplay handle, to be filled by the user.
      }
{*
     * Driver quirks to apply - this is filled by av_hwdevice_ctx_init(),
     * with reference to a table of known drivers, unless the
     * AV_VAAPI_DRIVER_QUIRK_USER_SET bit is already present.  The user
     * may need to refer to this field when performing any later
     * operations using VAAPI with the same VADisplay.
      }
type
  PAVVAAPIDeviceContext = ^TAVVAAPIDeviceContext;
  TAVVAAPIDeviceContext = record
      display : TVADisplay;
      driver_quirks : dword;
    end;
{*
 * VAAPI-specific data associated with a frame pool.
 *
 * Allocated as AVHWFramesContext.hwctx.
  }
{*
     * Set by the user to apply surface attributes to all surfaces in
     * the frame pool.  If null, default settings are used.
      }
{*
     * The surfaces IDs of all surfaces in the pool after creation.
     * Only valid if AVHWFramesContext.initial_pool_size was positive.
     * These are intended to be used as the render_targets arguments to
     * vaCreateContext().
      }

  PAVVAAPIFramesContext = ^TAVVAAPIFramesContext;
  TAVVAAPIFramesContext = record
      attributes : PVASurfaceAttrib;
      nb_attributes : longint;
      surface_ids : PVASurfaceID;
      nb_surfaces : longint;
    end;
{*
 * VAAPI hardware pipeline configuration details.
 *
 * Allocated with av_hwdevice_hwconfig_alloc().
  }
{*
     * ID of a VAAPI pipeline configuration.
      }

  PAVVAAPIHWConfig = ^TAVVAAPIHWConfig;
  TAVVAAPIHWConfig = record
      config_id : TVAConfigID;
    end;
{$endif}
{ AVUTIL_HWCONTEXT_VAAPI_H  }

// === Konventiert am: 14-12-25 17:14:54 ===


implementation



end.
