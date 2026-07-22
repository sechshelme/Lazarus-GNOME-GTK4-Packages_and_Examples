
unit hip_gst_gl;
interface

{
  Automatically converted by H2Pas 1.0.0 from hip_gst_gl.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hip_gst_gl.h
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
Pdword  = ^dword;
PhipGraphicsResource  = ^hipGraphicsResource;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2025 Seungha Yang <seungha@centricular.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
(** unsupported pragma#pragma once*)
{$include <gst/gst.h>}
{$include <gst/hip/hip-prelude.h>}
{$include <gst/hip/gsthip-enums.h>}
{$include <hip/hip_runtime.h>}
{$include <hip/hip_gl_interop.h>}

function HipGLGetDevices(vendor:TGstHipVendor; pHipDeviceCount:Pdword; pHipDevices:Plongint; hipDeviceCount:dword; deviceList:ThipGLDeviceList):ThipError_t;cdecl;external;
function HipGraphicsGLRegisterBuffer(vendor:TGstHipVendor; resource:PPhipGraphicsResource; buffer:dword; flags:dword):ThipError_t;cdecl;external;

implementation


end.
