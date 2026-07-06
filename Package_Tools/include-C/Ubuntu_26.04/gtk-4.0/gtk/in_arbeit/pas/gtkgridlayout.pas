unit gtkgridlayout;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkgridlayout.h: Layout manager for grid-like widgets
 * Copyright 2019  GNOME Foundation
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
  }
(** unsupported pragma#pragma once*)
{$include <gtk/gtklayoutmanager.h>}

{ was #define dname def_expr }
function GTK_TYPE_GRID_LAYOUT_CHILD : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkGridLayout, gtk_grid_layout, GTK, GRID_LAYOUT, GtkLayoutManager) }
function gtk_grid_layout_new:PGtkLayoutManager;cdecl;external libgtk4;
procedure gtk_grid_layout_set_row_homogeneous(grid:PGtkGridLayout; homogeneous:Tgboolean);cdecl;external libgtk4;
function gtk_grid_layout_get_row_homogeneous(grid:PGtkGridLayout):Tgboolean;cdecl;external libgtk4;
procedure gtk_grid_layout_set_row_spacing(grid:PGtkGridLayout; spacing:Tguint);cdecl;external libgtk4;
function gtk_grid_layout_get_row_spacing(grid:PGtkGridLayout):Tguint;cdecl;external libgtk4;
procedure gtk_grid_layout_set_column_homogeneous(grid:PGtkGridLayout; homogeneous:Tgboolean);cdecl;external libgtk4;
function gtk_grid_layout_get_column_homogeneous(grid:PGtkGridLayout):Tgboolean;cdecl;external libgtk4;
procedure gtk_grid_layout_set_column_spacing(grid:PGtkGridLayout; spacing:Tguint);cdecl;external libgtk4;
function gtk_grid_layout_get_column_spacing(grid:PGtkGridLayout):Tguint;cdecl;external libgtk4;
procedure gtk_grid_layout_set_row_baseline_position(grid:PGtkGridLayout; row:longint; pos:TGtkBaselinePosition);cdecl;external libgtk4;
function gtk_grid_layout_get_row_baseline_position(grid:PGtkGridLayout; row:longint):TGtkBaselinePosition;cdecl;external libgtk4;
procedure gtk_grid_layout_set_baseline_row(grid:PGtkGridLayout; row:longint);cdecl;external libgtk4;
function gtk_grid_layout_get_baseline_row(grid:PGtkGridLayout):longint;cdecl;external libgtk4;
{G_DECLARE_FINAL_TYPE (GtkGridLayoutChild, gtk_grid_layout_child, GTK, GRID_LAYOUT_CHILD, GtkLayoutChild) }
procedure gtk_grid_layout_child_set_row(child:PGtkGridLayoutChild; row:longint);cdecl;external libgtk4;
function gtk_grid_layout_child_get_row(child:PGtkGridLayoutChild):longint;cdecl;external libgtk4;
procedure gtk_grid_layout_child_set_column(child:PGtkGridLayoutChild; column:longint);cdecl;external libgtk4;
function gtk_grid_layout_child_get_column(child:PGtkGridLayoutChild):longint;cdecl;external libgtk4;
procedure gtk_grid_layout_child_set_column_span(child:PGtkGridLayoutChild; span:longint);cdecl;external libgtk4;
function gtk_grid_layout_child_get_column_span(child:PGtkGridLayoutChild):longint;cdecl;external libgtk4;
procedure gtk_grid_layout_child_set_row_span(child:PGtkGridLayoutChild; span:longint);cdecl;external libgtk4;
function gtk_grid_layout_child_get_row_span(child:PGtkGridLayoutChild):longint;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:20:51 ===

function GTK_TYPE_GRID_LAYOUT: TGType;
function GTK_GRID_LAYOUT(obj: Pointer): PGtkGridLayout;
function GTK_IS_GRID_LAYOUT(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_GRID_LAYOUT: TGType;
begin
  Result := gtk_grid_layout_get_type;
end;

function GTK_GRID_LAYOUT(obj: Pointer): PGtkGridLayout;
begin
  Result := PGtkGridLayout(g_type_check_instance_cast(obj, GTK_TYPE_GRID_LAYOUT));
end;

function GTK_IS_GRID_LAYOUT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_GRID_LAYOUT);
end;

type 
  PGtkGridLayout = type Pointer;

  TGtkGridLayoutClass = record
    parent_class: TGtkLayoutManagerClass;
  end;
  PGtkGridLayoutClass = ^TGtkGridLayoutClass;

function gtk_grid_layout_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname def_expr }
function GTK_TYPE_GRID_LAYOUT_CHILD : longint; { return type might be wrong }
  begin
    GTK_TYPE_GRID_LAYOUT_CHILD:=gtk_grid_layout_child_get_type;
  end;


end.
