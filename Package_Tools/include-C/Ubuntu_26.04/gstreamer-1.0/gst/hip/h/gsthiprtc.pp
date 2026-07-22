
unit gsthiprtc;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsthiprtc.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsthiprtc.h
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
Pgchar  = ^gchar;
PGstHipDevice  = ^GstHipDevice;
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
{$include <gst/hip/gsthip_fwd.h>}
{$include <gst/hip/gsthip-enums.h>}

function gst_hip_rtc_load_library(vendor:TGstHipVendor):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_hip_rtc_compile(device:PGstHipDevice; source:Pgchar; options:PPgchar; num_options:Tguint):Pgchar;cdecl;external;

implementation


end.
