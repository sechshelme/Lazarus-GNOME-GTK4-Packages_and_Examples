
unit gtkcombobox;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkcombobox.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkcombobox
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
Pchar  = ^char;
PGdkDevice  = ^GdkDevice;
PGtkComboBox  = ^GtkComboBox;
PGtkComboBoxClass  = ^GtkComboBoxClass;
PGtkTreeIter  = ^GtkTreeIter;
PGtkTreeModel  = ^GtkTreeModel;
PGtkWidget  = ^GtkWidget;
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

{ was #define dname def_expr }
function GTK_TYPE_COMBO_BOX : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_COMBO_BOX(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_COMBO_BOX_CLASS(vtable : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_COMBO_BOX(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_COMBO_BOX_CLASS(vtable : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_COMBO_BOX_GET_CLASS(inst : longint) : longint;

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
(* Const before type ignored *)
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

function gtk_combo_box_get_type:TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_new:PGtkWidget;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_new_with_entry:PGtkWidget;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_new_with_model(model:PGtkTreeModel):PGtkWidget;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_new_with_model_and_entry(model:PGtkTreeModel):PGtkWidget;cdecl;external;
{ get/set active item  }
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_get_active(combo_box:PGtkComboBox):longint;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
procedure gtk_combo_box_set_active(combo_box:PGtkComboBox; index_:longint);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_get_active_iter(combo_box:PGtkComboBox; iter:PGtkTreeIter):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
procedure gtk_combo_box_set_active_iter(combo_box:PGtkComboBox; iter:PGtkTreeIter);cdecl;external;
{ getters and setters  }
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
procedure gtk_combo_box_set_model(combo_box:PGtkComboBox; model:PGtkTreeModel);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_get_model(combo_box:PGtkComboBox):PGtkTreeModel;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_get_row_separator_func(combo_box:PGtkComboBox):TGtkTreeViewRowSeparatorFunc;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
procedure gtk_combo_box_set_row_separator_func(combo_box:PGtkComboBox; func:TGtkTreeViewRowSeparatorFunc; data:Tgpointer; destroy:TGDestroyNotify);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
procedure gtk_combo_box_set_button_sensitivity(combo_box:PGtkComboBox; sensitivity:TGtkSensitivityType);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_get_button_sensitivity(combo_box:PGtkComboBox):TGtkSensitivityType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_get_has_entry(combo_box:PGtkComboBox):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
procedure gtk_combo_box_set_entry_text_column(combo_box:PGtkComboBox; text_column:longint);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_get_entry_text_column(combo_box:PGtkComboBox):longint;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
procedure gtk_combo_box_set_popup_fixed_width(combo_box:PGtkComboBox; fixed:Tgboolean);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_get_popup_fixed_width(combo_box:PGtkComboBox):Tgboolean;cdecl;external;
{ programmatic control  }
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
procedure gtk_combo_box_popup(combo_box:PGtkComboBox);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
procedure gtk_combo_box_popup_for_device(combo_box:PGtkComboBox; device:PGdkDevice);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
procedure gtk_combo_box_popdown(combo_box:PGtkComboBox);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_get_id_column(combo_box:PGtkComboBox):longint;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
procedure gtk_combo_box_set_id_column(combo_box:PGtkComboBox; id_column:longint);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
(* Const before type ignored *)
function gtk_combo_box_get_active_id(combo_box:PGtkComboBox):Pchar;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
(* Const before type ignored *)
function gtk_combo_box_set_active_id(combo_box:PGtkComboBox; active_id:Pchar):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
procedure gtk_combo_box_set_child(combo_box:PGtkComboBox; child:PGtkWidget);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown) }
function gtk_combo_box_get_child(combo_box:PGtkComboBox):PGtkWidget;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkComboBox, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_COMBO_BOX : longint; { return type might be wrong }
  begin
    GTK_TYPE_COMBO_BOX:=gtk_combo_box_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_COMBO_BOX(obj : longint) : longint;
begin
  GTK_COMBO_BOX:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_COMBO_BOX,GtkComboBox);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_COMBO_BOX_CLASS(vtable : longint) : longint;
begin
  GTK_COMBO_BOX_CLASS:=G_TYPE_CHECK_CLASS_CAST(vtable,GTK_TYPE_COMBO_BOX,GtkComboBoxClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_COMBO_BOX(obj : longint) : longint;
begin
  GTK_IS_COMBO_BOX:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_COMBO_BOX);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_COMBO_BOX_CLASS(vtable : longint) : longint;
begin
  GTK_IS_COMBO_BOX_CLASS:=G_TYPE_CHECK_CLASS_TYPE(vtable,GTK_TYPE_COMBO_BOX);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_COMBO_BOX_GET_CLASS(inst : longint) : longint;
begin
  GTK_COMBO_BOX_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(inst,GTK_TYPE_COMBO_BOX,GtkComboBoxClass);
end;


end.
