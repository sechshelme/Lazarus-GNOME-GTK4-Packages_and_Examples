
unit gtkselectionmodel;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkselectionmodel.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkselectionmodel.h
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
PGtkBitset  = ^GtkBitset;
PGtkSelectionModel  = ^GtkSelectionModel;
PGtkSelectionModelInterface  = ^GtkSelectionModelInterface;
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
{$include <gtk/gtktypes.h>}

{ was #define dname def_expr }
function GTK_TYPE_SELECTION_MODEL : longint; { return type might be wrong }

{ G_DECLARE_INTERFACE (GtkSelectionModel, gtk_selection_model, GTK, SELECTION_MODEL, GListModel) }
{*
 * GtkSelectionModelInterface:
 * @is_selected: Return if the item at the given position is selected.
 * @get_selection_in_range: Return a bitset with all currently selected
 *   items in the given range. By default, this function will call
 *   `GtkSelectionModel::is_selected()` on all items in the given range.
 * @select_item: Select the item in the given position. If the operation
 *   is known to fail, return %FALSE.
 * @unselect_item: Unselect the item in the given position. If the
 *   operation is known to fail, return %FALSE.
 * @select_range: Select all items in the given range. If the operation
 *   is unsupported or known to fail for all items, return %FALSE.
 * @unselect_range: Unselect all items in the given range. If the
 *   operation is unsupported or known to fail for all items, return
 *   %FALSE.
 * @select_all: Select all items in the model. If the operation is
 *   unsupported or known to fail for all items, return %FALSE.
 * @unselect_all: Unselect all items in the model. If the operation is
 *   unsupported or known to fail for all items, return %FALSE.
 * @set_selection: Set selection state of all items in mask to selected.
 *   See gtk_selection_model_set_selection() for a detailed explanation
 *   of this function.
 *
 * The list of virtual functions for the `GtkSelectionModel` interface.
 * No function must be implemented, but unless `GtkSelectionModel::is_selected()`
 * is implemented, it will not be possible to select items in the set.
 * 
 * The model does not need to implement any functions to support either
 * selecting or unselecting items. Of course, if the model does not do that,
 * it means that users cannot select or unselect items in a list widget
 * using the model.
 *
 * All selection functions fall back to `GtkSelectionModel::set_selection()`
 * so it is sufficient to implement just that function for full selection
 * support.
  }
{< private > }
{< public > }
type
  PGtkSelectionModelInterface = ^TGtkSelectionModelInterface;
  TGtkSelectionModelInterface = record
      g_iface : TGTypeInterface;
      is_selected : function (model:PGtkSelectionModel; position:Tguint):Tgboolean;cdecl;
      get_selection_in_range : function (model:PGtkSelectionModel; position:Tguint; n_items:Tguint):PGtkBitset;cdecl;
      select_item : function (model:PGtkSelectionModel; position:Tguint; unselect_rest:Tgboolean):Tgboolean;cdecl;
      unselect_item : function (model:PGtkSelectionModel; position:Tguint):Tgboolean;cdecl;
      select_range : function (model:PGtkSelectionModel; position:Tguint; n_items:Tguint; unselect_rest:Tgboolean):Tgboolean;cdecl;
      unselect_range : function (model:PGtkSelectionModel; position:Tguint; n_items:Tguint):Tgboolean;cdecl;
      select_all : function (model:PGtkSelectionModel):Tgboolean;cdecl;
      unselect_all : function (model:PGtkSelectionModel):Tgboolean;cdecl;
      set_selection : function (model:PGtkSelectionModel; selected:PGtkBitset; mask:PGtkBitset):Tgboolean;cdecl;
    end;


function gtk_selection_model_is_selected(model:PGtkSelectionModel; position:Tguint):Tgboolean;cdecl;external;
function gtk_selection_model_get_selection(model:PGtkSelectionModel):PGtkBitset;cdecl;external;
function gtk_selection_model_get_selection_in_range(model:PGtkSelectionModel; position:Tguint; n_items:Tguint):PGtkBitset;cdecl;external;
function gtk_selection_model_select_item(model:PGtkSelectionModel; position:Tguint; unselect_rest:Tgboolean):Tgboolean;cdecl;external;
function gtk_selection_model_unselect_item(model:PGtkSelectionModel; position:Tguint):Tgboolean;cdecl;external;
function gtk_selection_model_select_range(model:PGtkSelectionModel; position:Tguint; n_items:Tguint; unselect_rest:Tgboolean):Tgboolean;cdecl;external;
function gtk_selection_model_unselect_range(model:PGtkSelectionModel; position:Tguint; n_items:Tguint):Tgboolean;cdecl;external;
function gtk_selection_model_select_all(model:PGtkSelectionModel):Tgboolean;cdecl;external;
function gtk_selection_model_unselect_all(model:PGtkSelectionModel):Tgboolean;cdecl;external;
function gtk_selection_model_set_selection(model:PGtkSelectionModel; selected:PGtkBitset; mask:PGtkBitset):Tgboolean;cdecl;external;
{ for implementations only  }
procedure gtk_selection_model_selection_changed(model:PGtkSelectionModel; position:Tguint; n_items:Tguint);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_SELECTION_MODEL : longint; { return type might be wrong }
  begin
    GTK_TYPE_SELECTION_MODEL:=gtk_selection_model_get_type;
  end;


end.
