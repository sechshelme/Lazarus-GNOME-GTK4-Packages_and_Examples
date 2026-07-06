unit gtkdropdown;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2018 Red Hat, Inc.
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
 * Authors: Matthias Clasen
  }
(** unsupported pragma#pragma once*)
{$include <gtk/gtkwidget.h>}
{$include <gtk/gtkexpression.h>}
{$include "gtk/gtkstringfilter.h"}

{G_DECLARE_FINAL_TYPE (GtkDropDown, gtk_drop_down, GTK, DROP_DOWN, GtkWidget) }
function gtk_drop_down_new(model:PGListModel; expression:PGtkExpression):PGtkWidget;cdecl;external libgtk4;
function gtk_drop_down_new_from_strings(strings:PPchar):PGtkWidget;cdecl;external libgtk4;
procedure gtk_drop_down_set_model(self:PGtkDropDown; model:PGListModel);cdecl;external libgtk4;
function gtk_drop_down_get_model(self:PGtkDropDown):PGListModel;cdecl;external libgtk4;
procedure gtk_drop_down_set_selected(self:PGtkDropDown; position:Tguint);cdecl;external libgtk4;
function gtk_drop_down_get_selected(self:PGtkDropDown):Tguint;cdecl;external libgtk4;
function gtk_drop_down_get_selected_item(self:PGtkDropDown):Tgpointer;cdecl;external libgtk4;
procedure gtk_drop_down_set_factory(self:PGtkDropDown; factory:PGtkListItemFactory);cdecl;external libgtk4;
function gtk_drop_down_get_factory(self:PGtkDropDown):PGtkListItemFactory;cdecl;external libgtk4;
procedure gtk_drop_down_set_list_factory(self:PGtkDropDown; factory:PGtkListItemFactory);cdecl;external libgtk4;
function gtk_drop_down_get_list_factory(self:PGtkDropDown):PGtkListItemFactory;cdecl;external libgtk4;
procedure gtk_drop_down_set_header_factory(self:PGtkDropDown; factory:PGtkListItemFactory);cdecl;external libgtk4;
function gtk_drop_down_get_header_factory(self:PGtkDropDown):PGtkListItemFactory;cdecl;external libgtk4;
procedure gtk_drop_down_set_expression(self:PGtkDropDown; expression:PGtkExpression);cdecl;external libgtk4;
function gtk_drop_down_get_expression(self:PGtkDropDown):PGtkExpression;cdecl;external libgtk4;
procedure gtk_drop_down_set_enable_search(self:PGtkDropDown; enable_search:Tgboolean);cdecl;external libgtk4;
function gtk_drop_down_get_enable_search(self:PGtkDropDown):Tgboolean;cdecl;external libgtk4;
procedure gtk_drop_down_set_show_arrow(self:PGtkDropDown; show_arrow:Tgboolean);cdecl;external libgtk4;
function gtk_drop_down_get_show_arrow(self:PGtkDropDown):Tgboolean;cdecl;external libgtk4;
procedure gtk_drop_down_set_search_match_mode(self:PGtkDropDown; search_match_mode:TGtkStringFilterMatchMode);cdecl;external libgtk4;
function gtk_drop_down_get_search_match_mode(self:PGtkDropDown):TGtkStringFilterMatchMode;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:29:44 ===

function GTK_TYPE_DROP_DOWN: TGType;
function GTK_DROP_DOWN(obj: Pointer): PGtkDropDown;
function GTK_IS_DROP_DOWN(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_DROP_DOWN: TGType;
begin
  Result := gtk_drop_down_get_type;
end;

function GTK_DROP_DOWN(obj: Pointer): PGtkDropDown;
begin
  Result := PGtkDropDown(g_type_check_instance_cast(obj, GTK_TYPE_DROP_DOWN));
end;

function GTK_IS_DROP_DOWN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_DROP_DOWN);
end;

type 
  PGtkDropDown = type Pointer;

  TGtkDropDownClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkDropDownClass = ^TGtkDropDownClass;

function gtk_drop_down_get_type: TGType; cdecl; external libgxxxxxxx;



end.
