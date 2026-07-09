unit gtkcombobox;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkcombobox.h
 * Copyright (C) 2002, 2003  Kristian Rietveld <kris@gtk.org>
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
{$include <gtk/gtkwidget.h>}
{$include <gtk/deprecated/gtktreemodel.h>}
{$include <gtk/deprecated/gtktreeview.h>}

type
  PGtkComboBox = ^TGtkComboBox;
  TGtkComboBox = record
      parent_instance : TGtkWidget;
    end;

{*
 * GtkComboBoxClass:
 * @parent_class: The parent class.
 * @changed: Signal is emitted when the active item is changed.
 * @format_entry_text: Signal which allows you to change how the text
 *    displayed in a combo box’s entry is displayed.
  }
{< public > }
{ signals  }
{< private > }
  PGtkComboBoxClass = ^TGtkComboBoxClass;
  TGtkComboBoxClass = record
      parent_class : TGtkWidgetClass;
      changed : procedure (combo_box:PGtkComboBox);cdecl;
      format_entry_text : function (combo_box:PGtkComboBox; path:Pchar):Pchar;cdecl;
      activate : procedure (combo_box:PGtkComboBox);cdecl;
      padding : array[0..6] of Tgpointer;
    end;

{ construction  }

function gtk_combo_box_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_new:PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_new_with_entry:PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_new_with_model(model:PGtkTreeModel):PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_new_with_model_and_entry(model:PGtkTreeModel):PGtkWidget;cdecl;external libgtk4;
{ get/set active item  }
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_get_active(combo_box:PGtkComboBox):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
procedure gtk_combo_box_set_active(combo_box:PGtkComboBox; index_:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_get_active_iter(combo_box:PGtkComboBox; iter:PGtkTreeIter):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
procedure gtk_combo_box_set_active_iter(combo_box:PGtkComboBox; iter:PGtkTreeIter);cdecl;external libgtk4;
{ getters and setters  }
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
procedure gtk_combo_box_set_model(combo_box:PGtkComboBox; model:PGtkTreeModel);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_get_model(combo_box:PGtkComboBox):PGtkTreeModel;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_get_row_separator_func(combo_box:PGtkComboBox):TGtkTreeViewRowSeparatorFunc;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
procedure gtk_combo_box_set_row_separator_func(combo_box:PGtkComboBox; func:TGtkTreeViewRowSeparatorFunc; data:Tgpointer; destroy:TGDestroyNotify);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
procedure gtk_combo_box_set_button_sensitivity(combo_box:PGtkComboBox; sensitivity:TGtkSensitivityType);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_get_button_sensitivity(combo_box:PGtkComboBox):TGtkSensitivityType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_get_has_entry(combo_box:PGtkComboBox):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
procedure gtk_combo_box_set_entry_text_column(combo_box:PGtkComboBox; text_column:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_get_entry_text_column(combo_box:PGtkComboBox):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
procedure gtk_combo_box_set_popup_fixed_width(combo_box:PGtkComboBox; fixed:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_get_popup_fixed_width(combo_box:PGtkComboBox):Tgboolean;cdecl;external libgtk4;
{ programmatic control  }
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
procedure gtk_combo_box_popup(combo_box:PGtkComboBox);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
procedure gtk_combo_box_popup_for_device(combo_box:PGtkComboBox; device:PGdkDevice);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
procedure gtk_combo_box_popdown(combo_box:PGtkComboBox);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_get_id_column(combo_box:PGtkComboBox):longint;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
procedure gtk_combo_box_set_id_column(combo_box:PGtkComboBox; id_column:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_get_active_id(combo_box:PGtkComboBox):Pchar;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_set_active_id(combo_box:PGtkComboBox; active_id:Pchar):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
procedure gtk_combo_box_set_child(combo_box:PGtkComboBox; child:PGtkWidget);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_get_child(combo_box:PGtkComboBox):PGtkWidget;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkComboBox, g_object_unref) }

// === Konventiert am: 9-7-26 19:42:29 ===

function GTK_TYPE_COMBO_BOX : TGType;
function GTK_COMBO_BOX(obj : Pointer) : PGtkComboBox;
function GTK_COMBO_BOX_CLASS(klass : Pointer) : PGtkComboBoxClass;
function GTK_IS_COMBO_BOX(obj : Pointer) : Tgboolean;
function GTK_IS_COMBO_BOX_CLASS(klass : Pointer) : Tgboolean;
function GTK_COMBO_BOX_GET_CLASS(obj : Pointer) : PGtkComboBoxClass;

implementation

function GTK_TYPE_COMBO_BOX : TGType;
  begin
    GTK_TYPE_COMBO_BOX:=gtk_combo_box_get_type;
  end;

function GTK_COMBO_BOX(obj : Pointer) : PGtkComboBox;
begin
  Result := PGtkComboBox(g_type_check_instance_cast(obj, GTK_TYPE_COMBO_BOX));
end;

function GTK_COMBO_BOX_CLASS(klass : Pointer) : PGtkComboBoxClass;
begin
  Result := PGtkComboBoxClass(g_type_check_class_cast(klass, GTK_TYPE_COMBO_BOX));
end;

function GTK_IS_COMBO_BOX(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_COMBO_BOX);
end;

function GTK_IS_COMBO_BOX_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_COMBO_BOX);
end;

function GTK_COMBO_BOX_GET_CLASS(obj : Pointer) : PGtkComboBoxClass;
begin
  Result := PGtkComboBoxClass(PGTypeInstance(obj)^.g_class);
end;



end.
