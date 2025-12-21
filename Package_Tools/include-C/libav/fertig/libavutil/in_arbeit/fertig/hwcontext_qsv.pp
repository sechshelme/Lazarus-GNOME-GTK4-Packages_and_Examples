
unit hwcontext_qsv;
interface

{
  Automatically converted by H2Pas 1.0.0 from hwcontext_qsv.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hwcontext_qsv.h
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
PAVQSVDeviceContext  = ^AVQSVDeviceContext;
PAVQSVFramesContext  = ^AVQSVFramesContext;
PmfxFrameSurface1  = ^mfxFrameSurface1;
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
{$ifndef AVUTIL_HWCONTEXT_QSV_H}
{$define AVUTIL_HWCONTEXT_QSV_H}
{$include <mfxvideo.h>}
{*
 * @file
 * An API-specific header for AV_HWDEVICE_TYPE_QSV.
 *
 * This API does not support dynamic frame pools. AVHWFramesContext.pool must
 * contain AVBufferRefs whose data pointer points to an mfxFrameSurface1 struct.
  }
{*
 * This struct is allocated as AVHWDeviceContext.hwctx
  }
{*
     * The mfxLoader handle used for mfxSession creation
     *
     * This field is only available for oneVPL user. For non-oneVPL user, this
     * field must be set to NULL.
     *
     * Filled by the user before calling av_hwdevice_ctx_init() and should be
     * cast to mfxLoader handle. Deallocating the AVHWDeviceContext will always
     * release this interface.
      }
type
  PAVQSVDeviceContext = ^TAVQSVDeviceContext;
  TAVQSVDeviceContext = record
      session : TmfxSession;
      loader : pointer;
    end;
{*
 * This struct is allocated as AVHWFramesContext.hwctx
  }
{*
     * A combination of MFX_MEMTYPE_* describing the frame pool.
      }

  PAVQSVFramesContext = ^TAVQSVFramesContext;
  TAVQSVFramesContext = record
      surfaces : PmfxFrameSurface1;
      nb_surfaces : longint;
      frame_type : longint;
    end;
{$endif}
{ AVUTIL_HWCONTEXT_QSV_H  }

implementation


end.
