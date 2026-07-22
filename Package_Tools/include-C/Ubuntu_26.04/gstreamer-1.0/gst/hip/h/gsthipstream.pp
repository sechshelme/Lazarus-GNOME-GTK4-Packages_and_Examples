
unit gsthipstream;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsthipstream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsthipstream.h
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
PGstHipEvent  = ^GstHipEvent;
PGstHipStream  = ^GstHipStream;
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
{$include <gst/hip/gsthip-enums.h>}

function gst_hip_stream_get_type:TGType;cdecl;external;
function gst_hip_stream_new(vendor:TGstHipVendor; device_id:Tguint):PGstHipStream;cdecl;external;
function gst_hip_stream_get_vendor(stream:PGstHipStream):TGstHipVendor;cdecl;external;
function gst_hip_stream_get_device_id(stream:PGstHipStream):Tguint;cdecl;external;
function gst_hip_stream_get_handle(stream:PGstHipStream):ThipStream_t;cdecl;external;
function gst_hip_stream_record_event(stream:PGstHipStream; event:PPGstHipEvent):Tgboolean;cdecl;external;
function gst_hip_stream_ref(stream:PGstHipStream):PGstHipStream;cdecl;external;
procedure gst_hip_stream_unref(stream:PGstHipStream);cdecl;external;
procedure gst_clear_hip_stream(stream:PPGstHipStream);cdecl;external;

implementation


end.
