
unit gdkmonitor;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdkmonitor.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdkmonitor.h
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
PGdkDisplay  = ^GdkDisplay;
PGdkMonitor  = ^GdkMonitor;
PGdkRectangle  = ^GdkRectangle;
PGdkSubpixelLayout  = ^GdkSubpixelLayout;
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

{ was #define dname def_expr }
function GDK_TYPE_MONITOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_MONITOR(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_MONITOR(object : longint) : longint;

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

function gdk_monitor_get_type:TGType;cdecl;external;
function gdk_monitor_get_display(monitor:PGdkMonitor):PGdkDisplay;cdecl;external;
procedure gdk_monitor_get_geometry(monitor:PGdkMonitor; geometry:PGdkRectangle);cdecl;external;
function gdk_monitor_get_width_mm(monitor:PGdkMonitor):longint;cdecl;external;
function gdk_monitor_get_height_mm(monitor:PGdkMonitor):longint;cdecl;external;
(* Const before type ignored *)
function gdk_monitor_get_manufacturer(monitor:PGdkMonitor):Pchar;cdecl;external;
(* Const before type ignored *)
function gdk_monitor_get_model(monitor:PGdkMonitor):Pchar;cdecl;external;
(* Const before type ignored *)
function gdk_monitor_get_connector(monitor:PGdkMonitor):Pchar;cdecl;external;
function gdk_monitor_get_scale_factor(monitor:PGdkMonitor):longint;cdecl;external;
function gdk_monitor_get_scale(monitor:PGdkMonitor):Tdouble;cdecl;external;
function gdk_monitor_get_refresh_rate(monitor:PGdkMonitor):longint;cdecl;external;
function gdk_monitor_get_subpixel_layout(monitor:PGdkMonitor):TGdkSubpixelLayout;cdecl;external;
function gdk_monitor_is_valid(monitor:PGdkMonitor):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gdk_monitor_get_description(monitor:PGdkMonitor):Pchar;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GdkMonitor, g_object_unref) }

implementation

{ was #define dname def_expr }
function GDK_TYPE_MONITOR : longint; { return type might be wrong }
  begin
    GDK_TYPE_MONITOR:=gdk_monitor_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_MONITOR(object : longint) : longint;
begin
  GDK_MONITOR:=G_TYPE_CHECK_INSTANCE_CAST(object,GDK_TYPE_MONITOR,GdkMonitor);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_MONITOR(object : longint) : longint;
begin
  GDK_IS_MONITOR:=G_TYPE_CHECK_INSTANCE_TYPE(object,GDK_TYPE_MONITOR);
end;


end.
