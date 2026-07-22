
unit gsthip_interop;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsthip_interop.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsthip_interop
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
PGstHipGraphicsResource  = ^GstHipGraphicsResource;
Psize_t  = ^size_t;
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
{$include <gst/hip/gsthip_fwd.h>}

function gst_hip_graphics_resource_get_type:TGType;cdecl;external;
function gst_hip_graphics_resource_map(resource:PGstHipGraphicsResource; stream:ThipStream_t):ThipError_t;cdecl;external;
function gst_hip_graphics_resource_unmap(resource:PGstHipGraphicsResource; stream:ThipStream_t):ThipError_t;cdecl;external;
function gst_hip_graphics_resource_get_mapped_pointer(resource:PGstHipGraphicsResource; dev_ptr:Ppointer; size:Psize_t):ThipError_t;cdecl;external;
function gst_hip_graphics_resource_ref(resource:PGstHipGraphicsResource):PGstHipGraphicsResource;cdecl;external;
procedure gst_hip_graphics_resource_unref(resource:PGstHipGraphicsResource);cdecl;external;
procedure gst_clear_hip_graphics_resource(resource:PPGstHipGraphicsResource);cdecl;external;

implementation


end.
