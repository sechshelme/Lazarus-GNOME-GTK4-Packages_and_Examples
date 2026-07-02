unit gdktoplevel;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2020 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Matthias Clasen <mclasen@redhat.com>
  }
(** unsupported pragma#pragma once*)
{$if !defined(__GDK_H_INSIDE__) && !defined(GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdkseat.h>}
{$include <gdk/gdksurface.h>}
{$include <gdk/gdktoplevellayout.h>}
{*
 * GdkSurfaceEdge:
 * @GDK_SURFACE_EDGE_NORTH_WEST: the top left corner.
 * @GDK_SURFACE_EDGE_NORTH: the top edge.
 * @GDK_SURFACE_EDGE_NORTH_EAST: the top right corner.
 * @GDK_SURFACE_EDGE_WEST: the left edge.
 * @GDK_SURFACE_EDGE_EAST: the right edge.
 * @GDK_SURFACE_EDGE_SOUTH_WEST: the lower left corner.
 * @GDK_SURFACE_EDGE_SOUTH: the lower edge.
 * @GDK_SURFACE_EDGE_SOUTH_EAST: the lower right corner.
 *
 * Determines a surface edge or corner.
  }
type
  PGdkSurfaceEdge = ^TGdkSurfaceEdge;
  TGdkSurfaceEdge =  Longint;
  Const
    GDK_SURFACE_EDGE_NORTH_WEST = 0;
    GDK_SURFACE_EDGE_NORTH = 1;
    GDK_SURFACE_EDGE_NORTH_EAST = 2;
    GDK_SURFACE_EDGE_WEST = 3;
    GDK_SURFACE_EDGE_EAST = 4;
    GDK_SURFACE_EDGE_SOUTH_WEST = 5;
    GDK_SURFACE_EDGE_SOUTH = 6;
    GDK_SURFACE_EDGE_SOUTH_EAST = 7;
;
{*
 * GdkFullscreenMode:
 * @GDK_FULLSCREEN_ON_CURRENT_MONITOR: Fullscreen on current monitor only.
 * @GDK_FULLSCREEN_ON_ALL_MONITORS: Span across all monitors when fullscreen.
 *
 * Indicates which monitor a surface should span over when in fullscreen mode.
  }
{< prefix=GDK_FULLSCREEN > }
type
  PGdkFullscreenMode = ^TGdkFullscreenMode;
  TGdkFullscreenMode =  Longint;
  Const
    GDK_FULLSCREEN_ON_CURRENT_MONITOR = 0;
    GDK_FULLSCREEN_ON_ALL_MONITORS = 1;
;
{*
 * GdkToplevelState:
 * @GDK_TOPLEVEL_STATE_MINIMIZED: the surface is minimized
 * @GDK_TOPLEVEL_STATE_MAXIMIZED: the surface is maximized
 * @GDK_TOPLEVEL_STATE_STICKY: the surface is sticky
 * @GDK_TOPLEVEL_STATE_FULLSCREEN: the surface is maximized without decorations
 * @GDK_TOPLEVEL_STATE_ABOVE: the surface is kept above other surfaces
 * @GDK_TOPLEVEL_STATE_BELOW: the surface is kept below other surfaces
 * @GDK_TOPLEVEL_STATE_FOCUSED: the surface is presented as focused (with active decorations)
 * @GDK_TOPLEVEL_STATE_TILED: the surface is in a tiled state
 * @GDK_TOPLEVEL_STATE_TOP_TILED: whether the top edge is tiled
 * @GDK_TOPLEVEL_STATE_TOP_RESIZABLE: whether the top edge is resizable
 * @GDK_TOPLEVEL_STATE_RIGHT_TILED: whether the right edge is tiled
 * @GDK_TOPLEVEL_STATE_RIGHT_RESIZABLE: whether the right edge is resizable
 * @GDK_TOPLEVEL_STATE_BOTTOM_TILED: whether the bottom edge is tiled
 * @GDK_TOPLEVEL_STATE_BOTTOM_RESIZABLE: whether the bottom edge is resizable
 * @GDK_TOPLEVEL_STATE_LEFT_TILED: whether the left edge is tiled
 * @GDK_TOPLEVEL_STATE_LEFT_RESIZABLE: whether the left edge is resizable
 *
 * Specifies the state of a toplevel surface.
 *
 * On platforms that support information about individual edges, the
 * %GDK_TOPLEVEL_STATE_TILED state will be set whenever any of the individual
 * tiled states is set. On platforms that lack that support, the tiled state
 * will give an indication of tiledness without any of the per-edge states
 * being set.
  }
{*
 * GDK_TOPLEVEL_STATE_SUSPENDED:
 *
 * The surface is not visible to the user.
 *
 * Since: 4.12
  }
type
  PGdkToplevelState = ^TGdkToplevelState;
  TGdkToplevelState =  Longint;
  Const
    GDK_TOPLEVEL_STATE_MINIMIZED = 1 shl 0;
    GDK_TOPLEVEL_STATE_MAXIMIZED = 1 shl 1;
    GDK_TOPLEVEL_STATE_STICKY = 1 shl 2;
    GDK_TOPLEVEL_STATE_FULLSCREEN = 1 shl 3;
    GDK_TOPLEVEL_STATE_ABOVE = 1 shl 4;
    GDK_TOPLEVEL_STATE_BELOW = 1 shl 5;
    GDK_TOPLEVEL_STATE_FOCUSED = 1 shl 6;
    GDK_TOPLEVEL_STATE_TILED = 1 shl 7;
    GDK_TOPLEVEL_STATE_TOP_TILED = 1 shl 8;
    GDK_TOPLEVEL_STATE_TOP_RESIZABLE = 1 shl 9;
    GDK_TOPLEVEL_STATE_RIGHT_TILED = 1 shl 10;
    GDK_TOPLEVEL_STATE_RIGHT_RESIZABLE = 1 shl 11;
    GDK_TOPLEVEL_STATE_BOTTOM_TILED = 1 shl 12;
    GDK_TOPLEVEL_STATE_BOTTOM_RESIZABLE = 1 shl 13;
    GDK_TOPLEVEL_STATE_LEFT_TILED = 1 shl 14;
    GDK_TOPLEVEL_STATE_LEFT_RESIZABLE = 1 shl 15;
    GDK_TOPLEVEL_STATE_SUSPENDED = 1 shl 16;
;
{*
 * GdkTitlebarGesture:
 * @GDK_TITLEBAR_GESTURE_DOUBLE_CLICK: double click gesture
 * @GDK_TITLEBAR_GESTURE_RIGHT_CLICK: right click gesture
 * @GDK_TITLEBAR_GESTURE_MIDDLE_CLICK: middle click gesture
 *
 * The kind of title bar gesture to emit with
 * [method@Gdk.Toplevel.titlebar_gesture].
 *
 * Since: 4.4
  }
type
  PGdkTitlebarGesture = ^TGdkTitlebarGesture;
  TGdkTitlebarGesture =  Longint;
  Const
    GDK_TITLEBAR_GESTURE_DOUBLE_CLICK = 1;
    GDK_TITLEBAR_GESTURE_RIGHT_CLICK = 2;
    GDK_TITLEBAR_GESTURE_MIDDLE_CLICK = 3;
;

{G_DECLARE_INTERFACE (GdkToplevel, gdk_toplevel, GDK, TOPLEVEL, GObject) }
procedure gdk_toplevel_present(toplevel:PGdkToplevel; layout:PGdkToplevelLayout);cdecl;external libgtk4;
function gdk_toplevel_minimize(toplevel:PGdkToplevel):Tgboolean;cdecl;external libgtk4;
function gdk_toplevel_lower(toplevel:PGdkToplevel):Tgboolean;cdecl;external libgtk4;
procedure gdk_toplevel_focus(toplevel:PGdkToplevel; timestamp:Tguint32);cdecl;external libgtk4;
function gdk_toplevel_get_state(toplevel:PGdkToplevel):TGdkToplevelState;cdecl;external libgtk4;
procedure gdk_toplevel_set_title(toplevel:PGdkToplevel; title:Pchar);cdecl;external libgtk4;
procedure gdk_toplevel_set_startup_id(toplevel:PGdkToplevel; startup_id:Pchar);cdecl;external libgtk4;
procedure gdk_toplevel_set_transient_for(toplevel:PGdkToplevel; parent:PGdkSurface);cdecl;external libgtk4;
procedure gdk_toplevel_set_modal(toplevel:PGdkToplevel; modal:Tgboolean);cdecl;external libgtk4;
procedure gdk_toplevel_set_icon_list(toplevel:PGdkToplevel; surfaces:PGList);cdecl;external libgtk4;
function gdk_toplevel_show_window_menu(toplevel:PGdkToplevel; event:PGdkEvent):Tgboolean;cdecl;external libgtk4;
procedure gdk_toplevel_set_decorated(toplevel:PGdkToplevel; decorated:Tgboolean);cdecl;external libgtk4;
procedure gdk_toplevel_set_deletable(toplevel:PGdkToplevel; deletable:Tgboolean);cdecl;external libgtk4;
function gdk_toplevel_supports_edge_constraints(toplevel:PGdkToplevel):Tgboolean;cdecl;external libgtk4;
procedure gdk_toplevel_inhibit_system_shortcuts(toplevel:PGdkToplevel; event:PGdkEvent);cdecl;external libgtk4;
procedure gdk_toplevel_restore_system_shortcuts(toplevel:PGdkToplevel);cdecl;external libgtk4;
procedure gdk_toplevel_begin_resize(toplevel:PGdkToplevel; edge:TGdkSurfaceEdge; device:PGdkDevice; button:longint; x:Tdouble; 
            y:Tdouble; timestamp:Tguint32);cdecl;external libgtk4;
procedure gdk_toplevel_begin_move(toplevel:PGdkToplevel; device:PGdkDevice; button:longint; x:Tdouble; y:Tdouble; 
            timestamp:Tguint32);cdecl;external libgtk4;
function gdk_toplevel_titlebar_gesture(toplevel:PGdkToplevel; gesture:TGdkTitlebarGesture):Tgboolean;cdecl;external libgtk4;
{*
 * GdkToplevelCapabilities:
 *
 * Reflects what features a `GdkToplevel` supports.
 *
 * Since: 4.20
  }
{*
 * GDK_TOPLEVEL_CAPABILITIES_EDGE_CONSTRAINTS:
 *
 * Whether tiled window states are supported.
 *
 * Since: 4.20
  }
{*
 * GDK_TOPLEVEL_CAPABILITIES_INHIBIT_SHORTCUTS:
 *
 * Whether inhibiting system shortcuts is supported.
 * See [method@Gdk.Toplevel.inhibit_system_shortcuts].
 *
 * Since: 4.20
  }
{*
 * GDK_TOPLEVEL_CAPABILITIES_TITLEBAR_GESTURES:
 *
 * Whether titlebar gestures are supported.
 * See [method@Gdk.Toplevel.titlebar_gesture].
 *
 * Since: 4.20
  }
{*
 * GDK_TOPLEVEL_CAPABILITIES_WINDOW_MENU:
 *
 * Whether showing the window menu is supported.
 * See [method@Gdk.Toplevel.show_window_menu].
 *
 * Since: 4.20
  }
{*
 * GDK_TOPLEVEL_CAPABILITIES_MAXIMIZE:
 *
 * Whether the toplevel can be maximized.
 *
 * Since: 4.20
  }
{*
 * GDK_TOPLEVEL_CAPABILITIES_FULLSCREEN:
 *
 * Whether the toplevel can be made fullscreen.
 *
 * Since: 4.20
  }
{*
 * GDK_TOPLEVEL_CAPABILITIES_MINIMIZE:
 *
 * Whether the toplevel can be minimized.
 * See [method@Gdk.Toplevel.minimize].
 *
 * Since: 4.20
  }
{*
 * GDK_TOPLEVEL_CAPABILITIES_LOWER:
 *
 * Whether the toplevel can be lowered.
 * See [method@Gdk.Toplevel.lower].
 *
 * Since: 4.20
  }
type
  PGdkToplevelCapabilities = ^TGdkToplevelCapabilities;
  TGdkToplevelCapabilities =  Longint;
  Const
    GDK_TOPLEVEL_CAPABILITIES_EDGE_CONSTRAINTS = 1 shl 0;
    GDK_TOPLEVEL_CAPABILITIES_INHIBIT_SHORTCUTS = 1 shl 1;
    GDK_TOPLEVEL_CAPABILITIES_TITLEBAR_GESTURES = 1 shl 2;
    GDK_TOPLEVEL_CAPABILITIES_WINDOW_MENU = 1 shl 3;
    GDK_TOPLEVEL_CAPABILITIES_MAXIMIZE = 1 shl 4;
    GDK_TOPLEVEL_CAPABILITIES_FULLSCREEN = 1 shl 5;
    GDK_TOPLEVEL_CAPABILITIES_MINIMIZE = 1 shl 6;
    GDK_TOPLEVEL_CAPABILITIES_LOWER = 1 shl 7;
;

function gdk_toplevel_get_capabilities(toplevel:PGdkToplevel):TGdkToplevelCapabilities;cdecl;external libgtk4;
function gdk_toplevel_get_gravity(toplevel:PGdkToplevel):TGdkGravity;cdecl;external libgtk4;
procedure gdk_toplevel_set_gravity(toplevel:PGdkToplevel; gravity:TGdkGravity);cdecl;external libgtk4;

// === Konventiert am: 2-7-26 19:29:33 ===

function GDK_TYPE_TOPLEVEL: TGType;
function GDK_TOPLEVEL(obj: Pointer): PGdkToplevel;
function GDK_IS_TOPLEVEL(obj: Pointer): Tgboolean;
function GDK_TOPLEVEL_GET_IFACE(obj: Pointer): PGdkToplevelInterface;

implementation

function GDK_TYPE_TOPLEVEL: TGType;
begin
  Result := gdk_toplevel_get_type;
end;

function GDK_TOPLEVEL(obj: Pointer): PGdkToplevel;
begin
  Result := PGdkToplevel(g_type_check_instance_cast(obj, GDK_TYPE_TOPLEVEL));
end;

function GDK_IS_TOPLEVEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_TOPLEVEL);
end;

function GDK_TOPLEVEL_GET_IFACE(obj: Pointer): PGdkToplevelInterface;
begin
  Result := g_type_interface_peek(obj, GDK_TYPE_TOPLEVEL);
end;

type 
  TGdkToplevel = record
  end;
  PGdkToplevel = ^TGdkToplevel;

  TGdkToplevelInterface = record
  end;
  PGdkToplevelInterface = ^TGdkToplevelInterface;

function gdk_toplevel_get_type: TGType; cdecl; external libgxxxxxxx;



end.
