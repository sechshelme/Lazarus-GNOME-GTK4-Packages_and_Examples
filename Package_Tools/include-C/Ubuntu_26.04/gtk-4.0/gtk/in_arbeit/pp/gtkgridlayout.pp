
unit gtkgridlayout;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkgridlayout.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkgridlayout.h
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
PGtkGridLayout  = ^GtkGridLayout;
PGtkGridLayoutChild  = ^GtkGridLayoutChild;
PGtkLayoutManager  = ^GtkLayoutManager;
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
function GTK_TYPE_GRID_LAYOUT : longint; { return type might be wrong }

{ was #define dname def_expr }
function GTK_TYPE_GRID_LAYOUT_CHILD : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkGridLayout, gtk_grid_layout, GTK, GRID_LAYOUT, GtkLayoutManager) }
function gtk_grid_layout_new:PGtkLayoutManager;cdecl;external;
procedure gtk_grid_layout_set_row_homogeneous(grid:PGtkGridLayout; homogeneous:Tgboolean);cdecl;external;
function gtk_grid_layout_get_row_homogeneous(grid:PGtkGridLayout):Tgboolean;cdecl;external;
procedure gtk_grid_layout_set_row_spacing(grid:PGtkGridLayout; spacing:Tguint);cdecl;external;
function gtk_grid_layout_get_row_spacing(grid:PGtkGridLayout):Tguint;cdecl;external;
procedure gtk_grid_layout_set_column_homogeneous(grid:PGtkGridLayout; homogeneous:Tgboolean);cdecl;external;
function gtk_grid_layout_get_column_homogeneous(grid:PGtkGridLayout):Tgboolean;cdecl;external;
procedure gtk_grid_layout_set_column_spacing(grid:PGtkGridLayout; spacing:Tguint);cdecl;external;
function gtk_grid_layout_get_column_spacing(grid:PGtkGridLayout):Tguint;cdecl;external;
procedure gtk_grid_layout_set_row_baseline_position(grid:PGtkGridLayout; row:longint; pos:TGtkBaselinePosition);cdecl;external;
function gtk_grid_layout_get_row_baseline_position(grid:PGtkGridLayout; row:longint):TGtkBaselinePosition;cdecl;external;
procedure gtk_grid_layout_set_baseline_row(grid:PGtkGridLayout; row:longint);cdecl;external;
function gtk_grid_layout_get_baseline_row(grid:PGtkGridLayout):longint;cdecl;external;
{G_DECLARE_FINAL_TYPE (GtkGridLayoutChild, gtk_grid_layout_child, GTK, GRID_LAYOUT_CHILD, GtkLayoutChild) }
procedure gtk_grid_layout_child_set_row(child:PGtkGridLayoutChild; row:longint);cdecl;external;
function gtk_grid_layout_child_get_row(child:PGtkGridLayoutChild):longint;cdecl;external;
procedure gtk_grid_layout_child_set_column(child:PGtkGridLayoutChild; column:longint);cdecl;external;
function gtk_grid_layout_child_get_column(child:PGtkGridLayoutChild):longint;cdecl;external;
procedure gtk_grid_layout_child_set_column_span(child:PGtkGridLayoutChild; span:longint);cdecl;external;
function gtk_grid_layout_child_get_column_span(child:PGtkGridLayoutChild):longint;cdecl;external;
procedure gtk_grid_layout_child_set_row_span(child:PGtkGridLayoutChild; span:longint);cdecl;external;
function gtk_grid_layout_child_get_row_span(child:PGtkGridLayoutChild):longint;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_GRID_LAYOUT : longint; { return type might be wrong }
  begin
    GTK_TYPE_GRID_LAYOUT:=gtk_grid_layout_get_type;
  end;

{ was #define dname def_expr }
function GTK_TYPE_GRID_LAYOUT_CHILD : longint; { return type might be wrong }
  begin
    GTK_TYPE_GRID_LAYOUT_CHILD:=gtk_grid_layout_child_get_type;
  end;


end.
