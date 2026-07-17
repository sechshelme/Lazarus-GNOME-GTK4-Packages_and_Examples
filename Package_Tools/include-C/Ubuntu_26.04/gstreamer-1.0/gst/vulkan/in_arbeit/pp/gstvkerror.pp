
unit gstvkerror;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvkerror.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkerror.h
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
Pchar  = ^char;
PGError  = ^GError;
PGstVulkanError  = ^GstVulkanError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2015 Matthew Waters <matthew@centricular.com>
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
{$ifndef __GST_VULKAN_ERROR_H__}
{$define __GST_VULKAN_ERROR_H__}
{$include <gst/gst.h>}
{$include <vulkan/vulkan.h>}
{$include <gst/vulkan/vulkan-prelude.h>}
{*
 * GST_VULKAN_ERROR:
 *
 * Since: 1.18
  }

{ was #define dname def_expr }
function GST_VULKAN_ERROR : longint; { return type might be wrong }

{*
 * gst_vulkan_error_quark:
 *
 * Since: 1.18
  }
function gst_vulkan_error_quark:TGQuark;cdecl;external;
(* Const before type ignored *)
function gst_vulkan_result_to_string(result:TVkResult):Pchar;cdecl;external;
{*
 * GstVulkanError:
 * @GST_VULKAN_FAILED: undetermined error
 *
 * Since: 1.18
  }
{ custom error values  }
type
  PGstVulkanError = ^TGstVulkanError;
  TGstVulkanError =  Longint;
  Const
    GST_VULKAN_FAILED = 0;
;
{ only fills error iff error != NULL and result < 0  }
(* Const before type ignored *)

function gst_vulkan_error_to_g_error(result:TVkResult; error:PPGError; format:Pchar; args:array of const):TVkResult;cdecl;external;
function gst_vulkan_error_to_g_error(result:TVkResult; error:PPGError; format:Pchar):TVkResult;cdecl;external;
{ (3, 4); }
{$endif}
{ __GST_VULKAN_ERROR_H__  }

implementation

{ was #define dname def_expr }
function GST_VULKAN_ERROR : longint; { return type might be wrong }
  begin
    GST_VULKAN_ERROR:=gst_vulkan_error_quark;
  end;


end.
