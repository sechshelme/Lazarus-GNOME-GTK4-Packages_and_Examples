unit gtktreeexpander;

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
{$include <gtk/gtktreelistmodel.h>}
{$include <gtk/gtkwidget.h>}

{G_DECLARE_FINAL_TYPE (GtkTreeExpander, gtk_tree_expander, GTK, TREE_EXPANDER, GtkWidget) }
function gtk_tree_expander_new:PGtkWidget;cdecl;external libgtk4;
function gtk_tree_expander_get_child(self:PGtkTreeExpander):PGtkWidget;cdecl;external libgtk4;
procedure gtk_tree_expander_set_child(self:PGtkTreeExpander; child:PGtkWidget);cdecl;external libgtk4;
function gtk_tree_expander_get_item(self:PGtkTreeExpander):Tgpointer;cdecl;external libgtk4;
function gtk_tree_expander_get_list_row(self:PGtkTreeExpander):PGtkTreeListRow;cdecl;external libgtk4;
procedure gtk_tree_expander_set_list_row(self:PGtkTreeExpander; list_row:PGtkTreeListRow);cdecl;external libgtk4;
function gtk_tree_expander_get_indent_for_depth(self:PGtkTreeExpander):Tgboolean;cdecl;external libgtk4;
procedure gtk_tree_expander_set_indent_for_depth(self:PGtkTreeExpander; indent_for_depth:Tgboolean);cdecl;external libgtk4;
function gtk_tree_expander_get_indent_for_icon(self:PGtkTreeExpander):Tgboolean;cdecl;external libgtk4;
procedure gtk_tree_expander_set_indent_for_icon(self:PGtkTreeExpander; indent_for_icon:Tgboolean);cdecl;external libgtk4;
function gtk_tree_expander_get_hide_expander(self:PGtkTreeExpander):Tgboolean;cdecl;external libgtk4;
procedure gtk_tree_expander_set_hide_expander(self:PGtkTreeExpander; hide_expander:Tgboolean);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:45:12 ===

function GTK_TYPE_TREE_EXPANDER: TGType;
function GTK_TREE_EXPANDER(obj: Pointer): PGtkTreeExpander;
function GTK_IS_TREE_EXPANDER(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_TREE_EXPANDER: TGType;
begin
  Result := gtk_tree_expander_get_type;
end;

function GTK_TREE_EXPANDER(obj: Pointer): PGtkTreeExpander;
begin
  Result := PGtkTreeExpander(g_type_check_instance_cast(obj, GTK_TYPE_TREE_EXPANDER));
end;

function GTK_IS_TREE_EXPANDER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_TREE_EXPANDER);
end;

type 
  PGtkTreeExpander = type Pointer;

  TGtkTreeExpanderClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkTreeExpanderClass = ^TGtkTreeExpanderClass;

function gtk_tree_expander_get_type: TGType; cdecl; external libgxxxxxxx;



end.
