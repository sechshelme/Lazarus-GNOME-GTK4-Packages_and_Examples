
unit gtkgrid;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkgrid.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkgrid.h
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
PGtkGrid  = ^GtkGrid;
PGtkGridClass  = ^GtkGridClass;
PGtkWidget  = ^GtkWidget;
Plongint  = ^longint;
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

{ was #define dname def_expr }
function GTK_TYPE_GRID : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_GRID(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_GRID_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_GRID(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_GRID_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_GRID_GET_CLASS(obj : longint) : longint;

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


function gtk_grid_get_type:TGType;cdecl;external;
function gtk_grid_new:PGtkWidget;cdecl;external;
procedure gtk_grid_attach(grid:PGtkGrid; child:PGtkWidget; column:longint; row:longint; width:longint; 
            height:longint);cdecl;external;
procedure gtk_grid_attach_next_to(grid:PGtkGrid; child:PGtkWidget; sibling:PGtkWidget; side:TGtkPositionType; width:longint; 
            height:longint);cdecl;external;
function gtk_grid_get_child_at(grid:PGtkGrid; column:longint; row:longint):PGtkWidget;cdecl;external;
procedure gtk_grid_remove(grid:PGtkGrid; child:PGtkWidget);cdecl;external;
procedure gtk_grid_insert_row(grid:PGtkGrid; position:longint);cdecl;external;
procedure gtk_grid_insert_column(grid:PGtkGrid; position:longint);cdecl;external;
procedure gtk_grid_remove_row(grid:PGtkGrid; position:longint);cdecl;external;
procedure gtk_grid_remove_column(grid:PGtkGrid; position:longint);cdecl;external;
procedure gtk_grid_insert_next_to(grid:PGtkGrid; sibling:PGtkWidget; side:TGtkPositionType);cdecl;external;
procedure gtk_grid_set_row_homogeneous(grid:PGtkGrid; homogeneous:Tgboolean);cdecl;external;
function gtk_grid_get_row_homogeneous(grid:PGtkGrid):Tgboolean;cdecl;external;
procedure gtk_grid_set_row_spacing(grid:PGtkGrid; spacing:Tguint);cdecl;external;
function gtk_grid_get_row_spacing(grid:PGtkGrid):Tguint;cdecl;external;
procedure gtk_grid_set_column_homogeneous(grid:PGtkGrid; homogeneous:Tgboolean);cdecl;external;
function gtk_grid_get_column_homogeneous(grid:PGtkGrid):Tgboolean;cdecl;external;
procedure gtk_grid_set_column_spacing(grid:PGtkGrid; spacing:Tguint);cdecl;external;
function gtk_grid_get_column_spacing(grid:PGtkGrid):Tguint;cdecl;external;
procedure gtk_grid_set_row_baseline_position(grid:PGtkGrid; row:longint; pos:TGtkBaselinePosition);cdecl;external;
function gtk_grid_get_row_baseline_position(grid:PGtkGrid; row:longint):TGtkBaselinePosition;cdecl;external;
procedure gtk_grid_set_baseline_row(grid:PGtkGrid; row:longint);cdecl;external;
function gtk_grid_get_baseline_row(grid:PGtkGrid):longint;cdecl;external;
procedure gtk_grid_query_child(grid:PGtkGrid; child:PGtkWidget; column:Plongint; row:Plongint; width:Plongint; 
            height:Plongint);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkGrid, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_GRID : longint; { return type might be wrong }
  begin
    GTK_TYPE_GRID:=gtk_grid_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_GRID(obj : longint) : longint;
begin
  GTK_GRID:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_GRID,GtkGrid);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_GRID_CLASS(klass : longint) : longint;
begin
  GTK_GRID_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GTK_TYPE_GRID,GtkGridClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_GRID(obj : longint) : longint;
begin
  GTK_IS_GRID:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_GRID);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_GRID_CLASS(klass : longint) : longint;
begin
  GTK_IS_GRID_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GTK_TYPE_GRID);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_GRID_GET_CLASS(obj : longint) : longint;
begin
  GTK_GRID_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GTK_TYPE_GRID,GtkGridClass);
end;


end.
