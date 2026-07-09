
unit gtkcomboboxtext;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkcomboboxtext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkcomboboxtext.h
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
PGtkComboBoxText  = ^GtkComboBoxText;
PGtkWidget  = ^GtkWidget;
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

{ was #define dname def_expr }
function GTK_TYPE_COMBO_BOX_TEXT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_COMBO_BOX_TEXT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_COMBO_BOX_TEXT(obj : longint) : longint;

type

function gtk_combo_box_text_get_type:TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown and GtkStringList) }
function gtk_combo_box_text_new:PGtkWidget;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown and GtkStringList) }
function gtk_combo_box_text_new_with_entry:PGtkWidget;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown and GtkStringList) }
(* Const before type ignored *)
procedure gtk_combo_box_text_append_text(combo_box:PGtkComboBoxText; text:Pchar);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown and GtkStringList) }
(* Const before type ignored *)
procedure gtk_combo_box_text_insert_text(combo_box:PGtkComboBoxText; position:longint; text:Pchar);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown and GtkStringList) }
(* Const before type ignored *)
procedure gtk_combo_box_text_prepend_text(combo_box:PGtkComboBoxText; text:Pchar);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown and GtkStringList) }
procedure gtk_combo_box_text_remove(combo_box:PGtkComboBoxText; position:longint);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown and GtkStringList) }
procedure gtk_combo_box_text_remove_all(combo_box:PGtkComboBoxText);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown and GtkStringList) }
function gtk_combo_box_text_get_active_text(combo_box:PGtkComboBoxText):Pchar;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown and GtkStringList) }
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_combo_box_text_insert(combo_box:PGtkComboBoxText; position:longint; id:Pchar; text:Pchar);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown and GtkStringList) }
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_combo_box_text_append(combo_box:PGtkComboBoxText; id:Pchar; text:Pchar);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkDropDown and GtkStringList) }
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_combo_box_text_prepend(combo_box:PGtkComboBoxText; id:Pchar; text:Pchar);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkComboBoxText, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_COMBO_BOX_TEXT : longint; { return type might be wrong }
  begin
    GTK_TYPE_COMBO_BOX_TEXT:=gtk_combo_box_text_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_COMBO_BOX_TEXT(obj : longint) : longint;
begin
  GTK_COMBO_BOX_TEXT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_COMBO_BOX_TEXT,GtkComboBoxText);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_COMBO_BOX_TEXT(obj : longint) : longint;
begin
  GTK_IS_COMBO_BOX_TEXT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_COMBO_BOX_TEXT);
end;


end.
