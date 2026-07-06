unit gtkcolumnviewcolumn;

interface

uses
  fp_glib2, fp_gtk4;

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
{$include <gtk/gtkcolumnview.h>}
{$include <gtk/gtksorter.h>}

{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkColumnViewColumn, g_object_unref) }
type

function gtk_column_view_column_get_type:TGType;cdecl;external libgtk4;
function gtk_column_view_column_new(title:Pchar; factory:PGtkListItemFactory):PGtkColumnViewColumn;cdecl;external libgtk4;
function gtk_column_view_column_get_column_view(self:PGtkColumnViewColumn):PGtkColumnView;cdecl;external libgtk4;
procedure gtk_column_view_column_set_factory(self:PGtkColumnViewColumn; factory:PGtkListItemFactory);cdecl;external libgtk4;
function gtk_column_view_column_get_factory(self:PGtkColumnViewColumn):PGtkListItemFactory;cdecl;external libgtk4;
procedure gtk_column_view_column_set_title(self:PGtkColumnViewColumn; title:Pchar);cdecl;external libgtk4;
function gtk_column_view_column_get_title(self:PGtkColumnViewColumn):Pchar;cdecl;external libgtk4;
procedure gtk_column_view_column_set_sorter(self:PGtkColumnViewColumn; sorter:PGtkSorter);cdecl;external libgtk4;
function gtk_column_view_column_get_sorter(self:PGtkColumnViewColumn):PGtkSorter;cdecl;external libgtk4;
procedure gtk_column_view_column_set_visible(self:PGtkColumnViewColumn; visible:Tgboolean);cdecl;external libgtk4;
function gtk_column_view_column_get_visible(self:PGtkColumnViewColumn):Tgboolean;cdecl;external libgtk4;
procedure gtk_column_view_column_set_header_menu(self:PGtkColumnViewColumn; menu:PGMenuModel);cdecl;external libgtk4;
function gtk_column_view_column_get_header_menu(self:PGtkColumnViewColumn):PGMenuModel;cdecl;external libgtk4;
procedure gtk_column_view_column_set_fixed_width(self:PGtkColumnViewColumn; fixed_width:longint);cdecl;external libgtk4;
function gtk_column_view_column_get_fixed_width(self:PGtkColumnViewColumn):longint;cdecl;external libgtk4;
procedure gtk_column_view_column_set_resizable(self:PGtkColumnViewColumn; resizable:Tgboolean);cdecl;external libgtk4;
function gtk_column_view_column_get_resizable(self:PGtkColumnViewColumn):Tgboolean;cdecl;external libgtk4;
procedure gtk_column_view_column_set_expand(self:PGtkColumnViewColumn; expand:Tgboolean);cdecl;external libgtk4;
function gtk_column_view_column_get_expand(self:PGtkColumnViewColumn):Tgboolean;cdecl;external libgtk4;
procedure gtk_column_view_column_set_id(self:PGtkColumnViewColumn; id:Pchar);cdecl;external libgtk4;
function gtk_column_view_column_get_id(self:PGtkColumnViewColumn):Pchar;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 14:02:13 ===

function GTK_TYPE_COLUMN_VIEW_COLUMN : TGType;
function GTK_COLUMN_VIEW_COLUMN(obj : Pointer) : PGtkColumnViewColumn;
function GTK_COLUMN_VIEW_COLUMN_CLASS(klass : Pointer) : PGtkColumnViewColumnClass;
function GTK_IS_COLUMN_VIEW_COLUMN(obj : Pointer) : Tgboolean;
function GTK_IS_COLUMN_VIEW_COLUMN_CLASS(klass : Pointer) : Tgboolean;
function GTK_COLUMN_VIEW_COLUMN_GET_CLASS(obj : Pointer) : PGtkColumnViewColumnClass;

implementation

function GTK_TYPE_COLUMN_VIEW_COLUMN : TGType;
  begin
    GTK_TYPE_COLUMN_VIEW_COLUMN:=gtk_column_view_column_get_type;
  end;

function GTK_COLUMN_VIEW_COLUMN(obj : Pointer) : PGtkColumnViewColumn;
begin
  Result := PGtkColumnViewColumn(g_type_check_instance_cast(obj, GTK_TYPE_COLUMN_VIEW_COLUMN));
end;

function GTK_COLUMN_VIEW_COLUMN_CLASS(klass : Pointer) : PGtkColumnViewColumnClass;
begin
  Result := PGtkColumnViewColumnClass(g_type_check_class_cast(klass, GTK_TYPE_COLUMN_VIEW_COLUMN));
end;

function GTK_IS_COLUMN_VIEW_COLUMN(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_COLUMN_VIEW_COLUMN);
end;

function GTK_IS_COLUMN_VIEW_COLUMN_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_COLUMN_VIEW_COLUMN);
end;

function GTK_COLUMN_VIEW_COLUMN_GET_CLASS(obj : Pointer) : PGtkColumnViewColumnClass;
begin
  Result := PGtkColumnViewColumnClass(PGTypeInstance(obj)^.g_class);
end;



end.
