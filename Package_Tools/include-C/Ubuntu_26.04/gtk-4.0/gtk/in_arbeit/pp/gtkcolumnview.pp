
unit gtkcolumnview;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkcolumnview.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkcolumnview.h
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
PGListModel  = ^GListModel;
PGtkColumnView  = ^GtkColumnView;
PGtkColumnViewColumn  = ^GtkColumnViewColumn;
PGtkListItemFactory  = ^GtkListItemFactory;
PGtkScrollInfo  = ^GtkScrollInfo;
PGtkSelectionModel  = ^GtkSelectionModel;
PGtkSorter  = ^GtkSorter;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2019 Benjamin Otte
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
 * Authors: Benjamin Otte <otte@gnome.org>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtktypes.h>}
{$include <gtk/gtksortlistmodel.h>}
{$include <gtk/gtkselectionmodel.h>}
{$include <gtk/gtksorter.h>}

{ was #define dname def_expr }
function GTK_TYPE_COLUMN_VIEW : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_COLUMN_VIEW(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_COLUMN_VIEW_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_COLUMN_VIEW(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_COLUMN_VIEW_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_COLUMN_VIEW_GET_CLASS(o : longint) : longint;

type
{ forward declaration  }

function gtk_column_view_get_type:TGType;cdecl;external;
function gtk_column_view_new(model:PGtkSelectionModel):PGtkWidget;cdecl;external;
function gtk_column_view_get_columns(self:PGtkColumnView):PGListModel;cdecl;external;
procedure gtk_column_view_append_column(self:PGtkColumnView; column:PGtkColumnViewColumn);cdecl;external;
procedure gtk_column_view_remove_column(self:PGtkColumnView; column:PGtkColumnViewColumn);cdecl;external;
procedure gtk_column_view_insert_column(self:PGtkColumnView; position:Tguint; column:PGtkColumnViewColumn);cdecl;external;
function gtk_column_view_get_model(self:PGtkColumnView):PGtkSelectionModel;cdecl;external;
procedure gtk_column_view_set_model(self:PGtkColumnView; model:PGtkSelectionModel);cdecl;external;
function gtk_column_view_get_show_row_separators(self:PGtkColumnView):Tgboolean;cdecl;external;
procedure gtk_column_view_set_show_row_separators(self:PGtkColumnView; show_row_separators:Tgboolean);cdecl;external;
function gtk_column_view_get_show_column_separators(self:PGtkColumnView):Tgboolean;cdecl;external;
procedure gtk_column_view_set_show_column_separators(self:PGtkColumnView; show_column_separators:Tgboolean);cdecl;external;
function gtk_column_view_get_sorter(self:PGtkColumnView):PGtkSorter;cdecl;external;
procedure gtk_column_view_sort_by_column(self:PGtkColumnView; column:PGtkColumnViewColumn; direction:TGtkSortType);cdecl;external;
procedure gtk_column_view_set_single_click_activate(self:PGtkColumnView; single_click_activate:Tgboolean);cdecl;external;
function gtk_column_view_get_single_click_activate(self:PGtkColumnView):Tgboolean;cdecl;external;
procedure gtk_column_view_set_reorderable(self:PGtkColumnView; reorderable:Tgboolean);cdecl;external;
function gtk_column_view_get_reorderable(self:PGtkColumnView):Tgboolean;cdecl;external;
procedure gtk_column_view_set_enable_rubberband(self:PGtkColumnView; enable_rubberband:Tgboolean);cdecl;external;
function gtk_column_view_get_enable_rubberband(self:PGtkColumnView):Tgboolean;cdecl;external;
procedure gtk_column_view_set_tab_behavior(self:PGtkColumnView; tab_behavior:TGtkListTabBehavior);cdecl;external;
function gtk_column_view_get_tab_behavior(self:PGtkColumnView):TGtkListTabBehavior;cdecl;external;
procedure gtk_column_view_set_row_factory(self:PGtkColumnView; factory:PGtkListItemFactory);cdecl;external;
function gtk_column_view_get_row_factory(self:PGtkColumnView):PGtkListItemFactory;cdecl;external;
procedure gtk_column_view_set_header_factory(self:PGtkColumnView; factory:PGtkListItemFactory);cdecl;external;
function gtk_column_view_get_header_factory(self:PGtkColumnView):PGtkListItemFactory;cdecl;external;
procedure gtk_column_view_scroll_to(self:PGtkColumnView; pos:Tguint; column:PGtkColumnViewColumn; flags:TGtkListScrollFlags; scroll:PGtkScrollInfo);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_COLUMN_VIEW : longint; { return type might be wrong }
  begin
    GTK_TYPE_COLUMN_VIEW:=gtk_column_view_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_COLUMN_VIEW(o : longint) : longint;
begin
  GTK_COLUMN_VIEW:=G_TYPE_CHECK_INSTANCE_CAST(o,GTK_TYPE_COLUMN_VIEW,GtkColumnView);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_COLUMN_VIEW_CLASS(k : longint) : longint;
begin
  GTK_COLUMN_VIEW_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,GTK_TYPE_COLUMN_VIEW,GtkColumnViewClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_COLUMN_VIEW(o : longint) : longint;
begin
  GTK_IS_COLUMN_VIEW:=G_TYPE_CHECK_INSTANCE_TYPE(o,GTK_TYPE_COLUMN_VIEW);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_COLUMN_VIEW_CLASS(k : longint) : longint;
begin
  GTK_IS_COLUMN_VIEW_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,GTK_TYPE_COLUMN_VIEW);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_COLUMN_VIEW_GET_CLASS(o : longint) : longint;
begin
  GTK_COLUMN_VIEW_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,GTK_TYPE_COLUMN_VIEW,GtkColumnViewClass);
end;


end.
