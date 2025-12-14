
unit hwcontext_vdpau;
interface

{
  Automatically converted by H2Pas 1.0.0 from hwcontext_vdpau.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hwcontext_vdpau.h
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
PAVVDPAUDeviceContext  = ^AVVDPAUDeviceContext;
PVdpGetProcAddress  = ^VdpGetProcAddress;
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
{$ifndef AVUTIL_HWCONTEXT_VDPAU_H}
{$define AVUTIL_HWCONTEXT_VDPAU_H}
{$include <vdpau/vdpau.h>}
{*
 * @file
 * An API-specific header for AV_HWDEVICE_TYPE_VDPAU.
 *
 * This API supports dynamic frame pools. AVHWFramesContext.pool must return
 * AVBufferRefs whose data pointer is a VdpVideoSurface.
  }
{*
 * This struct is allocated as AVHWDeviceContext.hwctx
  }
type
  PAVVDPAUDeviceContext = ^TAVVDPAUDeviceContext;
  TAVVDPAUDeviceContext = record
      device : TVdpDevice;
      get_proc_address : PVdpGetProcAddress;
    end;
{*
 * AVHWFramesContext.hwctx is currently not used
  }
{$endif}
{ AVUTIL_HWCONTEXT_VDPAU_H  }

implementation


end.
