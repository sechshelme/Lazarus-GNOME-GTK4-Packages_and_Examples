unit gdkdevicetool;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDK - The GIMP Drawing Kit
 * Copyright (C) 2009 Carlos Garnacho <carlosg@gnome.org>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}

type
{*
 * GdkDeviceToolType:
 * @GDK_DEVICE_TOOL_TYPE_UNKNOWN: Tool is of an unknown type.
 * @GDK_DEVICE_TOOL_TYPE_PEN: Tool is a standard tablet stylus.
 * @GDK_DEVICE_TOOL_TYPE_ERASER: Tool is standard tablet eraser.
 * @GDK_DEVICE_TOOL_TYPE_BRUSH: Tool is a brush stylus.
 * @GDK_DEVICE_TOOL_TYPE_PENCIL: Tool is a pencil stylus.
 * @GDK_DEVICE_TOOL_TYPE_AIRBRUSH: Tool is an airbrush stylus.
 * @GDK_DEVICE_TOOL_TYPE_MOUSE: Tool is a mouse.
 * @GDK_DEVICE_TOOL_TYPE_LENS: Tool is a lens cursor.
 *
 * Indicates the specific type of tool being used being a tablet. Such as an
 * airbrush, pencil, etc.
  }

  PGdkDeviceToolType = ^TGdkDeviceToolType;
  TGdkDeviceToolType =  Longint;
  Const
    GDK_DEVICE_TOOL_TYPE_UNKNOWN = 0;
    GDK_DEVICE_TOOL_TYPE_PEN = 1;
    GDK_DEVICE_TOOL_TYPE_ERASER = 2;
    GDK_DEVICE_TOOL_TYPE_BRUSH = 3;
    GDK_DEVICE_TOOL_TYPE_PENCIL = 4;
    GDK_DEVICE_TOOL_TYPE_AIRBRUSH = 5;
    GDK_DEVICE_TOOL_TYPE_MOUSE = 6;
    GDK_DEVICE_TOOL_TYPE_LENS = 7;
;

function gdk_device_tool_get_type:TGType;cdecl;external libgtk4;
function gdk_device_tool_get_serial(tool:PGdkDeviceTool):Tguint64;cdecl;external libgtk4;
function gdk_device_tool_get_hardware_id(tool:PGdkDeviceTool):Tguint64;cdecl;external libgtk4;
function gdk_device_tool_get_tool_type(tool:PGdkDeviceTool):TGdkDeviceToolType;cdecl;external libgtk4;
function gdk_device_tool_get_axes(tool:PGdkDeviceTool):TGdkAxisFlags;cdecl;external libgtk4;

// === Konventiert am: 2-7-26 19:13:24 ===

function GDK_TYPE_DEVICE_TOOL : TGType;
function GDK_DEVICE_TOOL(obj : Pointer) : PGdkDeviceTool;
function GDK_IS_DEVICE_TOOL(obj : Pointer) : Tgboolean;

implementation

function GDK_TYPE_DEVICE_TOOL : TGType;
  begin
    GDK_TYPE_DEVICE_TOOL:=gdk_device_tool_get_type;
  end;

function GDK_DEVICE_TOOL(obj : Pointer) : PGdkDeviceTool;
begin
  Result := PGdkDeviceTool(g_type_check_instance_cast(obj, GDK_TYPE_DEVICE_TOOL));
end;

function GDK_IS_DEVICE_TOOL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GDK_TYPE_DEVICE_TOOL);
end;



end.
