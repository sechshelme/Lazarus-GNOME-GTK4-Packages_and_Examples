unit gdkmonitor;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * gdkmonitor.h
 *
 * Copyright 2016 Red Hat, Inc.
 *
 * Matthias Clasen <mclasen@redhat.com>
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
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}

type
{*
 * GdkSubpixelLayout:
 * @GDK_SUBPIXEL_LAYOUT_UNKNOWN: The layout is not known
 * @GDK_SUBPIXEL_LAYOUT_NONE: Not organized in this way
 * @GDK_SUBPIXEL_LAYOUT_HORIZONTAL_RGB: The layout is horizontal, the order is RGB
 * @GDK_SUBPIXEL_LAYOUT_HORIZONTAL_BGR: The layout is horizontal, the order is BGR
 * @GDK_SUBPIXEL_LAYOUT_VERTICAL_RGB: The layout is vertical, the order is RGB
 * @GDK_SUBPIXEL_LAYOUT_VERTICAL_BGR: The layout is vertical, the order is BGR
 *
 * This enumeration describes how the red, green and blue components
 * of physical pixels on an output device are laid out.
  }

  PGdkSubpixelLayout = ^TGdkSubpixelLayout;
  TGdkSubpixelLayout =  Longint;
  Const
    GDK_SUBPIXEL_LAYOUT_UNKNOWN = 0;
    GDK_SUBPIXEL_LAYOUT_NONE = 1;
    GDK_SUBPIXEL_LAYOUT_HORIZONTAL_RGB = 2;
    GDK_SUBPIXEL_LAYOUT_HORIZONTAL_BGR = 3;
    GDK_SUBPIXEL_LAYOUT_VERTICAL_RGB = 4;
    GDK_SUBPIXEL_LAYOUT_VERTICAL_BGR = 5;
;

function gdk_monitor_get_type:TGType;cdecl;external libgtk4;
function gdk_monitor_get_display(monitor:PGdkMonitor):PGdkDisplay;cdecl;external libgtk4;
procedure gdk_monitor_get_geometry(monitor:PGdkMonitor; geometry:PGdkRectangle);cdecl;external libgtk4;
function gdk_monitor_get_width_mm(monitor:PGdkMonitor):longint;cdecl;external libgtk4;
function gdk_monitor_get_height_mm(monitor:PGdkMonitor):longint;cdecl;external libgtk4;
function gdk_monitor_get_manufacturer(monitor:PGdkMonitor):Pchar;cdecl;external libgtk4;
function gdk_monitor_get_model(monitor:PGdkMonitor):Pchar;cdecl;external libgtk4;
function gdk_monitor_get_connector(monitor:PGdkMonitor):Pchar;cdecl;external libgtk4;
function gdk_monitor_get_scale_factor(monitor:PGdkMonitor):longint;cdecl;external libgtk4;
function gdk_monitor_get_scale(monitor:PGdkMonitor):Tdouble;cdecl;external libgtk4;
function gdk_monitor_get_refresh_rate(monitor:PGdkMonitor):longint;cdecl;external libgtk4;
function gdk_monitor_get_subpixel_layout(monitor:PGdkMonitor):TGdkSubpixelLayout;cdecl;external libgtk4;
function gdk_monitor_is_valid(monitor:PGdkMonitor):Tgboolean;cdecl;external libgtk4;
function gdk_monitor_get_description(monitor:PGdkMonitor):Pchar;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GdkMonitor, g_object_unref) }

// === Konventiert am: 2-7-26 19:23:48 ===

function GDK_TYPE_MONITOR : TGType;
function GDK_MONITOR(obj : Pointer) : PGdkMonitor;
function GDK_IS_MONITOR(obj : Pointer) : Tgboolean;

implementation

function GDK_TYPE_MONITOR : TGType;
  begin
    GDK_TYPE_MONITOR:=gdk_monitor_get_type;
  end;

function GDK_MONITOR(obj : Pointer) : PGdkMonitor;
begin
  Result := PGdkMonitor(g_type_check_instance_cast(obj, GDK_TYPE_MONITOR));
end;

function GDK_IS_MONITOR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GDK_TYPE_MONITOR);
end;



end.
