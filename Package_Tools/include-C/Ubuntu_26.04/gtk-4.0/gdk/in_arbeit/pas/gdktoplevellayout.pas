unit gdktoplevellayout;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDK - The GIMP Drawing Kit
 * Copyright (C) 2020 Red Hat
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
 *
  }
(** unsupported pragma#pragma once*)
{$if !defined(__GDK_H_INSIDE__) && !defined(GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}
{$include <gdk/gdkmonitor.h>}
type

function gdk_toplevel_layout_get_type:TGType;cdecl;external libgtk4;
function gdk_toplevel_layout_new:PGdkToplevelLayout;cdecl;external libgtk4;
function gdk_toplevel_layout_ref(layout:PGdkToplevelLayout):PGdkToplevelLayout;cdecl;external libgtk4;
procedure gdk_toplevel_layout_unref(layout:PGdkToplevelLayout);cdecl;external libgtk4;
function gdk_toplevel_layout_copy(layout:PGdkToplevelLayout):PGdkToplevelLayout;cdecl;external libgtk4;
function gdk_toplevel_layout_equal(layout:PGdkToplevelLayout; other:PGdkToplevelLayout):Tgboolean;cdecl;external libgtk4;
procedure gdk_toplevel_layout_set_maximized(layout:PGdkToplevelLayout; maximized:Tgboolean);cdecl;external libgtk4;
procedure gdk_toplevel_layout_set_fullscreen(layout:PGdkToplevelLayout; fullscreen:Tgboolean; monitor:PGdkMonitor);cdecl;external libgtk4;
function gdk_toplevel_layout_get_maximized(layout:PGdkToplevelLayout; maximized:Pgboolean):Tgboolean;cdecl;external libgtk4;
function gdk_toplevel_layout_get_fullscreen(layout:PGdkToplevelLayout; fullscreen:Pgboolean):Tgboolean;cdecl;external libgtk4;
function gdk_toplevel_layout_get_fullscreen_monitor(layout:PGdkToplevelLayout):PGdkMonitor;cdecl;external libgtk4;
procedure gdk_toplevel_layout_set_resizable(layout:PGdkToplevelLayout; resizable:Tgboolean);cdecl;external libgtk4;
function gdk_toplevel_layout_get_resizable(layout:PGdkToplevelLayout):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GdkToplevelLayout, gdk_toplevel_layout_unref) }

// === Konventiert am: 2-7-26 19:29:29 ===

function GDK_TYPE_TOPLEVEL_LAYOUT : TGType;

implementation

function GDK_TYPE_TOPLEVEL_LAYOUT : TGType;
  begin
    GDK_TYPE_TOPLEVEL_LAYOUT:=gdk_toplevel_layout_get_type;
  end;



end.
