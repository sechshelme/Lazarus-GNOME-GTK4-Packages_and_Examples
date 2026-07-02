unit gdkdragsurface;

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
{$include <gdk/gdksurface.h>}

{G_DECLARE_INTERFACE (GdkDragSurface, gdk_drag_surface, GDK, DRAG_SURFACE, GObject) }
function gdk_drag_surface_present(drag_surface:PGdkDragSurface; width:longint; height:longint):Tgboolean;cdecl;external libgtk4;

// === Konventiert am: 2-7-26 19:17:30 ===

function GDK_TYPE_DRAG_SURFACE: TGType;
function GDK_DRAG_SURFACE(obj: Pointer): PGdkDragSurface;
function GDK_IS_DRAG_SURFACE(obj: Pointer): Tgboolean;
function GDK_DRAG_SURFACE_GET_IFACE(obj: Pointer): PGdkDragSurfaceInterface;

implementation

function GDK_TYPE_DRAG_SURFACE: TGType;
begin
  Result := gdk_drag_surface_get_type;
end;

function GDK_DRAG_SURFACE(obj: Pointer): PGdkDragSurface;
begin
  Result := PGdkDragSurface(g_type_check_instance_cast(obj, GDK_TYPE_DRAG_SURFACE));
end;

function GDK_IS_DRAG_SURFACE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_DRAG_SURFACE);
end;

function GDK_DRAG_SURFACE_GET_IFACE(obj: Pointer): PGdkDragSurfaceInterface;
begin
  Result := g_type_interface_peek(obj, GDK_TYPE_DRAG_SURFACE);
end;

type 
  TGdkDragSurface = record
  end;
  PGdkDragSurface = ^TGdkDragSurface;

  TGdkDragSurfaceInterface = record
  end;
  PGdkDragSurfaceInterface = ^TGdkDragSurfaceInterface;

function gdk_drag_surface_get_type: TGType; cdecl; external libgxxxxxxx;



end.
