unit gtkgrid;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2010 Red Hat, Inc.
 * Author: Matthias Clasen
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
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}

type
{< private > }
  PGtkGrid = ^TGtkGrid;
  TGtkGrid = record
      parent_instance : TGtkWidget;
    end;

{*
 * GtkGridClass:
 * @parent_class: The parent class.
  }
{< private > }
  PGtkGridClass = ^TGtkGridClass;
  TGtkGridClass = record
      parent_class : TGtkWidgetClass;
      padding : array[0..7] of Tgpointer;
    end;


function gtk_grid_get_type:TGType;cdecl;external libgtk4;
function gtk_grid_new:PGtkWidget;cdecl;external libgtk4;
procedure gtk_grid_attach(grid:PGtkGrid; child:PGtkWidget; column:longint; row:longint; width:longint; 
            height:longint);cdecl;external libgtk4;
procedure gtk_grid_attach_next_to(grid:PGtkGrid; child:PGtkWidget; sibling:PGtkWidget; side:TGtkPositionType; width:longint; 
            height:longint);cdecl;external libgtk4;
function gtk_grid_get_child_at(grid:PGtkGrid; column:longint; row:longint):PGtkWidget;cdecl;external libgtk4;
procedure gtk_grid_remove(grid:PGtkGrid; child:PGtkWidget);cdecl;external libgtk4;
procedure gtk_grid_insert_row(grid:PGtkGrid; position:longint);cdecl;external libgtk4;
procedure gtk_grid_insert_column(grid:PGtkGrid; position:longint);cdecl;external libgtk4;
procedure gtk_grid_remove_row(grid:PGtkGrid; position:longint);cdecl;external libgtk4;
procedure gtk_grid_remove_column(grid:PGtkGrid; position:longint);cdecl;external libgtk4;
procedure gtk_grid_insert_next_to(grid:PGtkGrid; sibling:PGtkWidget; side:TGtkPositionType);cdecl;external libgtk4;
procedure gtk_grid_set_row_homogeneous(grid:PGtkGrid; homogeneous:Tgboolean);cdecl;external libgtk4;
function gtk_grid_get_row_homogeneous(grid:PGtkGrid):Tgboolean;cdecl;external libgtk4;
procedure gtk_grid_set_row_spacing(grid:PGtkGrid; spacing:Tguint);cdecl;external libgtk4;
function gtk_grid_get_row_spacing(grid:PGtkGrid):Tguint;cdecl;external libgtk4;
procedure gtk_grid_set_column_homogeneous(grid:PGtkGrid; homogeneous:Tgboolean);cdecl;external libgtk4;
function gtk_grid_get_column_homogeneous(grid:PGtkGrid):Tgboolean;cdecl;external libgtk4;
procedure gtk_grid_set_column_spacing(grid:PGtkGrid; spacing:Tguint);cdecl;external libgtk4;
function gtk_grid_get_column_spacing(grid:PGtkGrid):Tguint;cdecl;external libgtk4;
procedure gtk_grid_set_row_baseline_position(grid:PGtkGrid; row:longint; pos:TGtkBaselinePosition);cdecl;external libgtk4;
function gtk_grid_get_row_baseline_position(grid:PGtkGrid; row:longint):TGtkBaselinePosition;cdecl;external libgtk4;
procedure gtk_grid_set_baseline_row(grid:PGtkGrid; row:longint);cdecl;external libgtk4;
function gtk_grid_get_baseline_row(grid:PGtkGrid):longint;cdecl;external libgtk4;
procedure gtk_grid_query_child(grid:PGtkGrid; child:PGtkWidget; column:Plongint; row:Plongint; width:Plongint; 
            height:Plongint);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkGrid, g_object_unref) }

// === Konventiert am: 6-7-26 16:14:55 ===

function GTK_TYPE_GRID : TGType;
function GTK_GRID(obj : Pointer) : PGtkGrid;
function GTK_GRID_CLASS(klass : Pointer) : PGtkGridClass;
function GTK_IS_GRID(obj : Pointer) : Tgboolean;
function GTK_IS_GRID_CLASS(klass : Pointer) : Tgboolean;
function GTK_GRID_GET_CLASS(obj : Pointer) : PGtkGridClass;

implementation

function GTK_TYPE_GRID : TGType;
  begin
    GTK_TYPE_GRID:=gtk_grid_get_type;
  end;

function GTK_GRID(obj : Pointer) : PGtkGrid;
begin
  Result := PGtkGrid(g_type_check_instance_cast(obj, GTK_TYPE_GRID));
end;

function GTK_GRID_CLASS(klass : Pointer) : PGtkGridClass;
begin
  Result := PGtkGridClass(g_type_check_class_cast(klass, GTK_TYPE_GRID));
end;

function GTK_IS_GRID(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_GRID);
end;

function GTK_IS_GRID_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_GRID);
end;

function GTK_GRID_GET_CLASS(obj : Pointer) : PGtkGridClass;
begin
  Result := PGtkGridClass(PGTypeInstance(obj)^.g_class);
end;



end.
