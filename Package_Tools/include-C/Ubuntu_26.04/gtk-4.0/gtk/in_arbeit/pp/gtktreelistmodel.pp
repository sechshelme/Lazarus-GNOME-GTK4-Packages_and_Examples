
unit gtktreelistmodel;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtktreelistmodel.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtktreelistmodel.h
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
PGtkTreeListModel  = ^GtkTreeListModel;
PGtkTreeListModelCreateModelFunc  = ^GtkTreeListModelCreateModelFunc;
PGtkTreeListRow  = ^GtkTreeListRow;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2018 Benjamin Otte
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
{$include <gio/gio.h>}
{$include <gtk/gtkwidget.h>}

{ was #define dname def_expr }
function GTK_TYPE_TREE_LIST_MODEL : longint; { return type might be wrong }

{ was #define dname def_expr }
function GTK_TYPE_TREE_LIST_ROW : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkTreeListModel, gtk_tree_list_model, GTK, TREE_LIST_MODEL, GObject) }
{G_DECLARE_FINAL_TYPE (GtkTreeListRow, gtk_tree_list_row, GTK, TREE_LIST_ROW, GObject) }
{*
 * GtkTreeListModelCreateModelFunc:
 * @item: (type GObject): The item that is being expanded
 * @user_data: User data passed when registering the function
 *
 * Prototype of the function called to create new child models when
 * gtk_tree_list_row_set_expanded() is called.
 *
 * This function can return %NULL to indicate that @item is guaranteed to be
 * a leaf node and will never have children. If it does not have children but
 * may get children later, it should return an empty model that is filled once
 * children arrive.
 *
 * Returns: (nullable) (transfer full): The model tracking the children of
 *   @item or %NULL if @item can never have children
  }
type
  PGtkTreeListModelCreateModelFunc = ^TGtkTreeListModelCreateModelFunc;
  TGtkTreeListModelCreateModelFunc = function (item:Tgpointer; user_data:Tgpointer):PGListModel;cdecl;

function gtk_tree_list_model_new(root:PGListModel; passthrough:Tgboolean; autoexpand:Tgboolean; create_func:TGtkTreeListModelCreateModelFunc; user_data:Tgpointer; 
           user_destroy:TGDestroyNotify):PGtkTreeListModel;cdecl;external;
function gtk_tree_list_model_get_model(self:PGtkTreeListModel):PGListModel;cdecl;external;
function gtk_tree_list_model_get_passthrough(self:PGtkTreeListModel):Tgboolean;cdecl;external;
procedure gtk_tree_list_model_set_autoexpand(self:PGtkTreeListModel; autoexpand:Tgboolean);cdecl;external;
function gtk_tree_list_model_get_autoexpand(self:PGtkTreeListModel):Tgboolean;cdecl;external;
function gtk_tree_list_model_get_child_row(self:PGtkTreeListModel; position:Tguint):PGtkTreeListRow;cdecl;external;
function gtk_tree_list_model_get_row(self:PGtkTreeListModel; position:Tguint):PGtkTreeListRow;cdecl;external;
function gtk_tree_list_row_get_item(self:PGtkTreeListRow):Tgpointer;cdecl;external;
procedure gtk_tree_list_row_set_expanded(self:PGtkTreeListRow; expanded:Tgboolean);cdecl;external;
function gtk_tree_list_row_get_expanded(self:PGtkTreeListRow):Tgboolean;cdecl;external;
function gtk_tree_list_row_is_expandable(self:PGtkTreeListRow):Tgboolean;cdecl;external;
function gtk_tree_list_row_get_position(self:PGtkTreeListRow):Tguint;cdecl;external;
function gtk_tree_list_row_get_depth(self:PGtkTreeListRow):Tguint;cdecl;external;
function gtk_tree_list_row_get_children(self:PGtkTreeListRow):PGListModel;cdecl;external;
function gtk_tree_list_row_get_parent(self:PGtkTreeListRow):PGtkTreeListRow;cdecl;external;
function gtk_tree_list_row_get_child_row(self:PGtkTreeListRow; position:Tguint):PGtkTreeListRow;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_TREE_LIST_MODEL : longint; { return type might be wrong }
  begin
    GTK_TYPE_TREE_LIST_MODEL:=gtk_tree_list_model_get_type;
  end;

{ was #define dname def_expr }
function GTK_TYPE_TREE_LIST_ROW : longint; { return type might be wrong }
  begin
    GTK_TYPE_TREE_LIST_ROW:=gtk_tree_list_row_get_type;
  end;


end.
