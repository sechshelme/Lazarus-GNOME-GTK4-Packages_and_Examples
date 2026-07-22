
unit gsthip_enums;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsthip_enums.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsthip_enums.h
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
PGstHipVendor  = ^GstHipVendor;
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
{*
 * GstHipVendor:
 *
 * Since: 1.28
  }
type
  PGstHipVendor = ^TGstHipVendor;
  TGstHipVendor =  Longint;
  Const
    GST_HIP_VENDOR_UNKNOWN = 0;
    GST_HIP_VENDOR_AMD = 1;
    GST_HIP_VENDOR_NVIDIA = 2;
;

{ was #define dname def_expr }
function GST_TYPE_HIP_VENDOR : longint; { return type might be wrong }

function gst_hip_vendor_get_type:TGType;cdecl;external;

implementation

{ was #define dname def_expr }
function GST_TYPE_HIP_VENDOR : longint; { return type might be wrong }
  begin
    GST_TYPE_HIP_VENDOR:=gst_hip_vendor_get_type;
  end;


end.
