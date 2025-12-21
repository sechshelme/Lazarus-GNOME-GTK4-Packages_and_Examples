
unit hwcontext_d3d11va;
interface

{
  Automatically converted by H2Pas 1.0.0 from hwcontext_d3d11va.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hwcontext_d3d11va.h
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
PAVD3D11FrameDescriptor  = ^AVD3D11FrameDescriptor;
PAVD3D11VADeviceContext  = ^AVD3D11VADeviceContext;
PAVD3D11VAFramesContext  = ^AVD3D11VAFramesContext;
PID3D11Device  = ^ID3D11Device;
PID3D11DeviceContext  = ^ID3D11DeviceContext;
PID3D11Texture2D  = ^ID3D11Texture2D;
PID3D11VideoContext  = ^ID3D11VideoContext;
PID3D11VideoDevice  = ^ID3D11VideoDevice;
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
{$ifndef AVUTIL_HWCONTEXT_D3D11VA_H}
{$define AVUTIL_HWCONTEXT_D3D11VA_H}
{*
 * @file
 * An API-specific header for AV_HWDEVICE_TYPE_D3D11VA.
 *
 * The default pool implementation will be fixed-size if initial_pool_size is
 * set (and allocate elements from an array texture). Otherwise it will allocate
 * individual textures. Be aware that decoding requires a single array texture.
 *
 * Using sw_format==AV_PIX_FMT_YUV420P has special semantics, and maps to
 * DXGI_FORMAT_420_OPAQUE. av_hwframe_transfer_data() is not supported for
 * this format. Refer to MSDN for details.
 *
 * av_hwdevice_ctx_create() for this device type supports a key named "debug"
 * for the AVDictionary entry. If this is set to any value, the device creation
 * code will try to load various supported D3D debugging layers.
  }
{$include <d3d11.h>}
{$include <stdint.h>}
{*
 * This struct is allocated as AVHWDeviceContext.hwctx
  }
{*
     * Device used for texture creation and access. This can also be used to
     * set the libavcodec decoding device.
     *
     * Must be set by the user. This is the only mandatory field - the other
     * device context fields are set from this and are available for convenience.
     *
     * Deallocating the AVHWDeviceContext will always release this interface,
     * and it does not matter whether it was user-allocated.
      }
{*
     * If unset, this will be set from the device field on init.
     *
     * Deallocating the AVHWDeviceContext will always release this interface,
     * and it does not matter whether it was user-allocated.
      }
{*
     * If unset, this will be set from the device field on init.
     *
     * Deallocating the AVHWDeviceContext will always release this interface,
     * and it does not matter whether it was user-allocated.
      }
{*
     * If unset, this will be set from the device_context field on init.
     *
     * Deallocating the AVHWDeviceContext will always release this interface,
     * and it does not matter whether it was user-allocated.
      }
{*
     * Callbacks for locking. They protect accesses to device_context and
     * video_context calls. They also protect access to the internal staging
     * texture (for av_hwframe_transfer_data() calls). They do NOT protect
     * access to hwcontext or decoder state in general.
     *
     * If unset on init, the hwcontext implementation will set them to use an
     * internal mutex.
     *
     * The underlying lock must be recursive. lock_ctx is for free use by the
     * locking implementation.
      }
type
  PAVD3D11VADeviceContext = ^TAVD3D11VADeviceContext;
  TAVD3D11VADeviceContext = record
      device : PID3D11Device;
      device_context : PID3D11DeviceContext;
      video_device : PID3D11VideoDevice;
      video_context : PID3D11VideoContext;
      lock : procedure (lock_ctx:pointer);cdecl;
      unlock : procedure (lock_ctx:pointer);cdecl;
      lock_ctx : pointer;
    end;
{*
 * D3D11 frame descriptor for pool allocation.
 *
 * In user-allocated pools, AVHWFramesContext.pool must return AVBufferRefs
 * with the data pointer pointing at an object of this type describing the
 * planes of the frame.
 *
 * This has no use outside of custom allocation, and AVFrame AVBufferRef do not
 * necessarily point to an instance of this struct.
  }
{*
     * The texture in which the frame is located. The reference count is
     * managed by the AVBufferRef, and destroying the reference will release
     * the interface.
     *
     * Normally stored in AVFrame.data[0].
      }
{*
     * The index into the array texture element representing the frame, or 0
     * if the texture is not an array texture.
     *
     * Normally stored in AVFrame.data[1] (cast from intptr_t).
      }

  PAVD3D11FrameDescriptor = ^TAVD3D11FrameDescriptor;
  TAVD3D11FrameDescriptor = record
      texture : PID3D11Texture2D;
      index : Tintptr_t;
    end;
{*
 * This struct is allocated as AVHWFramesContext.hwctx
  }
{*
     * The canonical texture used for pool allocation. If this is set to NULL
     * on init, the hwframes implementation will allocate and set an array
     * texture if initial_pool_size > 0.
     *
     * The only situation when the API user should set this is:
     * - the user wants to do manual pool allocation (setting
     *   AVHWFramesContext.pool), instead of letting AVHWFramesContext
     *   allocate the pool
     * - of an array texture
     * - and wants it to use it for decoding
     * - this has to be done before calling av_hwframe_ctx_init()
     *
     * Deallocating the AVHWFramesContext will always release this interface,
     * and it does not matter whether it was user-allocated.
     *
     * This is in particular used by the libavcodec D3D11VA hwaccel, which
     * requires a single array texture. It will create ID3D11VideoDecoderOutputView
     * objects for each array texture element on decoder initialization.
      }
{*
     * D3D11_TEXTURE2D_DESC.BindFlags used for texture creation. The user must
     * at least set D3D11_BIND_DECODER if the frames context is to be used for
     * video decoding.
     * This field is ignored/invalid if a user-allocated texture is provided.
      }
{*
     * D3D11_TEXTURE2D_DESC.MiscFlags used for texture creation.
     * This field is ignored/invalid if a user-allocated texture is provided.
      }
{*
     * In case if texture structure member above is not NULL contains the same texture
     * pointer for all elements and different indexes into the array texture.
     * In case if texture structure member above is NULL, all elements contains
     * pointers to separate non-array textures and 0 indexes.
     * This field is ignored/invalid if a user-allocated texture is provided.
     }

  PAVD3D11VAFramesContext = ^TAVD3D11VAFramesContext;
  TAVD3D11VAFramesContext = record
      texture : PID3D11Texture2D;
      BindFlags : TUINT;
      MiscFlags : TUINT;
      texture_infos : PAVD3D11FrameDescriptor;
    end;
{$endif}
{ AVUTIL_HWCONTEXT_D3D11VA_H  }

implementation


end.
