
unit gtktreeexpander;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtktreeexpander.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtktreeexpander.h
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
PGtkTreeExpander  = ^GtkTreeExpander;
PGtkTreeListRow  = ^GtkTreeListRow;
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
{$include <gtk/gtktreelistmodel.h>}
{$include <gtk/gtkwidget.h>}

{ was #define dname def_expr }
function GTK_TYPE_TREE_EXPANDER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkTreeExpander, gtk_tree_expander, GTK, TREE_EXPANDER, GtkWidget) }
function gtk_tree_expander_new:PGtkWidget;cdecl;external;
function gtk_tree_expander_get_child(self:PGtkTreeExpander):PGtkWidget;cdecl;external;
procedure gtk_tree_expander_set_child(self:PGtkTreeExpander; child:PGtkWidget);cdecl;external;
function gtk_tree_expander_get_item(self:PGtkTreeExpander):Tgpointer;cdecl;external;
function gtk_tree_expander_get_list_row(self:PGtkTreeExpander):PGtkTreeListRow;cdecl;external;
procedure gtk_tree_expander_set_list_row(self:PGtkTreeExpander; list_row:PGtkTreeListRow);cdecl;external;
function gtk_tree_expander_get_indent_for_depth(self:PGtkTreeExpander):Tgboolean;cdecl;external;
procedure gtk_tree_expander_set_indent_for_depth(self:PGtkTreeExpander; indent_for_depth:Tgboolean);cdecl;external;
function gtk_tree_expander_get_indent_for_icon(self:PGtkTreeExpander):Tgboolean;cdecl;external;
procedure gtk_tree_expander_set_indent_for_icon(self:PGtkTreeExpander; indent_for_icon:Tgboolean);cdecl;external;
function gtk_tree_expander_get_hide_expander(self:PGtkTreeExpander):Tgboolean;cdecl;external;
procedure gtk_tree_expander_set_hide_expander(self:PGtkTreeExpander; hide_expander:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_TREE_EXPANDER : longint; { return type might be wrong }
  begin
    GTK_TYPE_TREE_EXPANDER:=gtk_tree_expander_get_type;
  end;


end.
