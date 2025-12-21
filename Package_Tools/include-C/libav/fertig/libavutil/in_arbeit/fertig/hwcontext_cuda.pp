
unit hwcontext_cuda;
interface

{
  Automatically converted by H2Pas 1.0.0 from hwcontext_cuda.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hwcontext_cuda.h
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
PAVCUDADeviceContext  = ^AVCUDADeviceContext;
PAVCUDADeviceContextInternal  = ^AVCUDADeviceContextInternal;
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
{$ifndef AVUTIL_HWCONTEXT_CUDA_H}
{$define AVUTIL_HWCONTEXT_CUDA_H}
{$ifndef CUDA_VERSION}
{$include <cuda.h>}
{$endif}
{$include "pixfmt.h"}
{*
 * @file
 * An API-specific header for AV_HWDEVICE_TYPE_CUDA.
 *
 * This API supports dynamic frame pools. AVHWFramesContext.pool must return
 * AVBufferRefs whose data pointer is a CUdeviceptr.
  }
type
{*
 * This struct is allocated as AVHWDeviceContext.hwctx
  }

  PAVCUDADeviceContext = ^TAVCUDADeviceContext;
  TAVCUDADeviceContext = record
      cuda_ctx : TCUcontext;
      stream : TCUstream;
      internal : PAVCUDADeviceContextInternal;
    end;
{*
 * AVHWFramesContext.hwctx is currently not used
  }
{*
 * @defgroup hwcontext_cuda Device context creation flags
 *
 * Flags for av_hwdevice_ctx_create.
 *
 * @
  }
{*
 * Use primary device context instead of creating a new one.
  }

const
  AV_CUDA_USE_PRIMARY_CONTEXT = 1 shl 0;  
{*
 * Use current device context instead of creating a new one.
  }
  AV_CUDA_USE_CURRENT_CONTEXT = 1 shl 1;  
{*
 * @
  }
{$endif}
{ AVUTIL_HWCONTEXT_CUDA_H  }

implementation


end.
