
unit gsthiputils;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsthiputils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsthiputils.h
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
PGstContext  = ^GstContext;
PGstDebugCategory  = ^GstDebugCategory;
PGstElement  = ^GstElement;
PGstHipDevice  = ^GstHipDevice;
PGstQuery  = ^GstQuery;
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
{$include <gmodule.h>}
{$include <gst/gst.h>}
{$include <gst/hip/hip-prelude.h>}
{$include <gst/hip/gsthip_fwd.h>}
{$include <gst/hip/gsthip-enums.h>}
(* Const before type ignored *)
(* Const before type ignored *)

function _gst_hip_result(result:ThipError_t; vendor:TGstHipVendor; cat:PGstDebugCategory; file:Pgchar; _function:Pgchar; 
           line:Tgint):Tgboolean;cdecl;external;
{*
 * gst_hip_result:
 * @result: HIP device API return code `hipError_t`
 * @vendor: a #GstHipVendor
 *
 * Returns: %TRUE if HIP device API call result is hipSuccess
 *
 * Since: 1.28
  }
{$ifndef GST_DISABLE_GST_DEBUG}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function gst_hip_result(result,vendor : longint) : longint;

{$else}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function gst_hip_result(result,vendor : longint) : longint;

{$endif}
{ GST_DISABLE_GST_DEBUG  }

function gst_hip_ensure_element_data(element:PGstElement; vendor:TGstHipVendor; device_id:Tgint; device:PPGstHipDevice):Tgboolean;cdecl;external;
function gst_hip_handle_set_context(element:PGstElement; context:PGstContext; vendor:TGstHipVendor; device_id:Tgint; device:PPGstHipDevice):Tgboolean;cdecl;external;
function gst_hip_handle_context_query(element:PGstElement; query:PGstQuery; device:PGstHipDevice):Tgboolean;cdecl;external;
function gst_context_new_hip_device(device:PGstHipDevice):PGstContext;cdecl;external;

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_hip_result(result,vendor : longint) : longint;
begin
  gst_hip_result:=_gst_hip_result(result,vendor,GST_CAT_DEFAULT,__FILE__,GST_FUNCTION,__LINE__);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_hip_result(result,vendor : longint) : longint;
begin
  gst_hip_result:=_gst_hip_result(result,vendor,NULL,__FILE__,GST_FUNCTION,__LINE__);
end;


end.
