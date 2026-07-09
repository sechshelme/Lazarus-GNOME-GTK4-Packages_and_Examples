
unit gtktreeselection;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtktreeselection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtktreeselection.h
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
PGList  = ^GList;
PGtkTreeIter  = ^GtkTreeIter;
PGtkTreeModel  = ^GtkTreeModel;
PGtkTreePath  = ^GtkTreePath;
PGtkTreeSelection  = ^GtkTreeSelection;
PGtkTreeView  = ^GtkTreeView;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtktreeselection.h
 * Copyright (C) 2000  Red Hat, Inc.,  Jonathan Blandford <jrb@redhat.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/deprecated/gtktreeview.h>}

{ was #define dname def_expr }
function GTK_TYPE_TREE_SELECTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TREE_SELECTION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_TREE_SELECTION(obj : longint) : longint;

{*
 * GtkTreeSelectionFunc:
 * @selection: A `GtkTreeSelection`
 * @model: A `GtkTreeModel` being viewed
 * @path: The `GtkTreePath` of the row in question
 * @path_currently_selected: %TRUE, if the path is currently selected
 * @data: (closure): user data
 *
 * A function used by gtk_tree_selection_set_select_function() to filter
 * whether or not a row may be selected. It is called whenever a row's
 * state might change.
 *
 * A return value of %TRUE indicates to @selection that it is okay to
 * change the selection.
 *
 * Returns: %TRUE, if the selection state of the row can be toggled
 *
 * Deprecated: 4.20: There is no replacement
  }
type

  TGtkTreeSelectionFunc = function (selection:PGtkTreeSelection; model:PGtkTreeModel; path:PGtkTreePath; path_currently_selected:Tgboolean; data:Tgpointer):Tgboolean;cdecl;
{*
 * GtkTreeSelectionForeachFunc:
 * @model: The `GtkTreeModel` being viewed
 * @path: The `GtkTreePath` of a selected row
 * @iter: A `GtkTreeIter` pointing to a selected row
 * @data: (closure): user data
 *
 * A function used by gtk_tree_selection_selected_foreach() to map all
 * selected rows.  It will be called on every selected row in the view.
 *
 * Deprecated: 4.20: There is no replacement
  }

  TGtkTreeSelectionForeachFunc = procedure (model:PGtkTreeModel; path:PGtkTreePath; iter:PGtkTreeIter; data:Tgpointer);cdecl;

function gtk_tree_selection_get_type:TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_tree_selection_set_mode(selection:PGtkTreeSelection; _type:TGtkSelectionMode);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_tree_selection_get_mode(selection:PGtkTreeSelection):TGtkSelectionMode;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_tree_selection_set_select_function(selection:PGtkTreeSelection; func:TGtkTreeSelectionFunc; data:Tgpointer; destroy:TGDestroyNotify);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_tree_selection_get_user_data(selection:PGtkTreeSelection):Tgpointer;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_tree_selection_get_tree_view(selection:PGtkTreeSelection):PGtkTreeView;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_tree_selection_get_select_function(selection:PGtkTreeSelection):TGtkTreeSelectionFunc;cdecl;external;
{ Only meaningful if GTK_SELECTION_SINGLE or GTK_SELECTION_BROWSE is set  }
{ Use selected_foreach or get_selected_rows for GTK_SELECTION_MULTIPLE  }
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_tree_selection_get_selected(selection:PGtkTreeSelection; model:PPGtkTreeModel; iter:PGtkTreeIter):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_tree_selection_get_selected_rows(selection:PGtkTreeSelection; model:PPGtkTreeModel):PGList;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_tree_selection_count_selected_rows(selection:PGtkTreeSelection):longint;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_tree_selection_selected_foreach(selection:PGtkTreeSelection; func:TGtkTreeSelectionForeachFunc; data:Tgpointer);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_tree_selection_select_path(selection:PGtkTreeSelection; path:PGtkTreePath);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_tree_selection_unselect_path(selection:PGtkTreeSelection; path:PGtkTreePath);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_tree_selection_select_iter(selection:PGtkTreeSelection; iter:PGtkTreeIter);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_tree_selection_unselect_iter(selection:PGtkTreeSelection; iter:PGtkTreeIter);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_tree_selection_path_is_selected(selection:PGtkTreeSelection; path:PGtkTreePath):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_tree_selection_iter_is_selected(selection:PGtkTreeSelection; iter:PGtkTreeIter):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_tree_selection_select_all(selection:PGtkTreeSelection);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_tree_selection_unselect_all(selection:PGtkTreeSelection);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_tree_selection_select_range(selection:PGtkTreeSelection; start_path:PGtkTreePath; end_path:PGtkTreePath);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_tree_selection_unselect_range(selection:PGtkTreeSelection; start_path:PGtkTreePath; end_path:PGtkTreePath);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkTreeSelection, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_TREE_SELECTION : longint; { return type might be wrong }
  begin
    GTK_TYPE_TREE_SELECTION:=gtk_tree_selection_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_TREE_SELECTION(obj : longint) : longint;
begin
  GTK_TREE_SELECTION:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_TREE_SELECTION,GtkTreeSelection);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_TREE_SELECTION(obj : longint) : longint;
begin
  GTK_IS_TREE_SELECTION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_TREE_SELECTION);
end;


end.
