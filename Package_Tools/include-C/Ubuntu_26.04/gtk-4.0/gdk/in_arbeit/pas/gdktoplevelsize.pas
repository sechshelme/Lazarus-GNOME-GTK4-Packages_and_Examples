unit gdktoplevelsize;

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
type

function gdk_toplevel_size_get_type:TGType;cdecl;external libgtk4;
procedure gdk_toplevel_size_get_bounds(size:PGdkToplevelSize; bounds_width:Plongint; bounds_height:Plongint);cdecl;external libgtk4;
procedure gdk_toplevel_size_set_size(size:PGdkToplevelSize; width:longint; height:longint);cdecl;external libgtk4;
procedure gdk_toplevel_size_set_min_size(size:PGdkToplevelSize; min_width:longint; min_height:longint);cdecl;external libgtk4;
procedure gdk_toplevel_size_set_shadow_width(size:PGdkToplevelSize; left:longint; right:longint; top:longint; bottom:longint);cdecl;external libgtk4;

// === Konventiert am: 2-7-26 19:29:24 ===

function GDK_TYPE_TOPLEVEL_SIZE : TGType;

implementation

function GDK_TYPE_TOPLEVEL_SIZE : TGType;
  begin
    GDK_TYPE_TOPLEVEL_SIZE:=gdk_toplevel_size_get_type;
  end;



end.
