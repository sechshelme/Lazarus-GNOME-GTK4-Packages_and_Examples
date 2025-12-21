
unit hwcontext_opencl;
interface

{
  Automatically converted by H2Pas 1.0.0 from hwcontext_opencl.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hwcontext_opencl.h
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
PAVOpenCLDeviceContext  = ^AVOpenCLDeviceContext;
PAVOpenCLFrameDescriptor  = ^AVOpenCLFrameDescriptor;
PAVOpenCLFramesContext  = ^AVOpenCLFramesContext;
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
{$ifndef AVUTIL_HWCONTEXT_OPENCL_H}
{$define AVUTIL_HWCONTEXT_OPENCL_H}
{$ifdef __APPLE__}
{$include <OpenCL/cl.h>}
{$else}
{$include <CL/cl.h>}
{$endif}
{$include "frame.h"}
{*
 * @file
 * API-specific header for AV_HWDEVICE_TYPE_OPENCL.
 *
 * Pools allocated internally are always dynamic, and are primarily intended
 * to be used in OpenCL-only cases.  If interoperation is required, it is
 * typically required to allocate frames in the other API and then map the
 * frames context to OpenCL with av_hwframe_ctx_create_derived().
  }
{*
 * OpenCL frame descriptor for pool allocation.
 *
 * In user-allocated pools, AVHWFramesContext.pool must return AVBufferRefs
 * with the data pointer pointing at an object of this type describing the
 * planes of the frame.
  }
{*
     * Number of planes in the frame.
      }
{*
     * OpenCL image2d objects for each plane of the frame.
      }
type
  PAVOpenCLFrameDescriptor = ^TAVOpenCLFrameDescriptor;
  TAVOpenCLFrameDescriptor = record
      nb_planes : longint;
      planes : array[0..(AV_NUM_DATA_POINTERS)-1] of Tcl_mem;
    end;
{*
 * OpenCL device details.
 *
 * Allocated as AVHWDeviceContext.hwctx
  }
{*
     * The primary device ID of the device.  If multiple OpenCL devices
     * are associated with the context then this is the one which will
     * be used for all operations internal to FFmpeg.
      }
{*
     * The OpenCL context which will contain all operations and frames on
     * this device.
      }
{*
     * The default command queue for this device, which will be used by all
     * frames contexts which do not have their own command queue.  If not
     * intialised by the user, a default queue will be created on the
     * primary device.
      }

  PAVOpenCLDeviceContext = ^TAVOpenCLDeviceContext;
  TAVOpenCLDeviceContext = record
      device_id : Tcl_device_id;
      context : Tcl_context;
      command_queue : Tcl_command_queue;
    end;
{*
 * OpenCL-specific data associated with a frame pool.
 *
 * Allocated as AVHWFramesContext.hwctx.
  }
{*
     * The command queue used for internal asynchronous operations on this
     * device (av_hwframe_transfer_data(), av_hwframe_map()).
     *
     * If this is not set, the command queue from the associated device is
     * used instead.
      }

  PAVOpenCLFramesContext = ^TAVOpenCLFramesContext;
  TAVOpenCLFramesContext = record
      command_queue : Tcl_command_queue;
    end;
{$endif}
{ AVUTIL_HWCONTEXT_OPENCL_H  }

implementation


end.
