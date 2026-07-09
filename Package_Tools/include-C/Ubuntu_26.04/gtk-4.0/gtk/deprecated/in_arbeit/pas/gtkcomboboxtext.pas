unit gtkcomboboxtext;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 *
 * Copyright (C) 2010 Christian Dywan
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
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/deprecated/gtkcombobox.h>}

type

function gtk_combo_box_text_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown and GtkStringList) }
function gtk_combo_box_text_new:PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown and GtkStringList) }
function gtk_combo_box_text_new_with_entry:PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown and GtkStringList) }
procedure gtk_combo_box_text_append_text(combo_box:PGtkComboBoxText; text:Pchar);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown and GtkStringList) }
procedure gtk_combo_box_text_insert_text(combo_box:PGtkComboBoxText; position:longint; text:Pchar);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown and GtkStringList) }
procedure gtk_combo_box_text_prepend_text(combo_box:PGtkComboBoxText; text:Pchar);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown and GtkStringList) }
procedure gtk_combo_box_text_remove(combo_box:PGtkComboBoxText; position:longint);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown and GtkStringList) }
procedure gtk_combo_box_text_remove_all(combo_box:PGtkComboBoxText);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown and GtkStringList) }
function gtk_combo_box_text_get_active_text(combo_box:PGtkComboBoxText):Pchar;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown and GtkStringList) }
procedure gtk_combo_box_text_insert(combo_box:PGtkComboBoxText; position:longint; id:Pchar; text:Pchar);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown and GtkStringList) }
procedure gtk_combo_box_text_append(combo_box:PGtkComboBoxText; id:Pchar; text:Pchar);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown and GtkStringList) }
procedure gtk_combo_box_text_prepend(combo_box:PGtkComboBoxText; id:Pchar; text:Pchar);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkComboBoxText, g_object_unref) }

// === Konventiert am: 9-7-26 19:42:24 ===

function GTK_TYPE_COMBO_BOX_TEXT : TGType;
function GTK_COMBO_BOX_TEXT(obj : Pointer) : PGtkComboBoxText;
function GTK_IS_COMBO_BOX_TEXT(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_COMBO_BOX_TEXT : TGType;
  begin
    GTK_TYPE_COMBO_BOX_TEXT:=gtk_combo_box_text_get_type;
  end;

function GTK_COMBO_BOX_TEXT(obj : Pointer) : PGtkComboBoxText;
begin
  Result := PGtkComboBoxText(g_type_check_instance_cast(obj, GTK_TYPE_COMBO_BOX_TEXT));
end;

function GTK_IS_COMBO_BOX_TEXT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_COMBO_BOX_TEXT);
end;



end.
