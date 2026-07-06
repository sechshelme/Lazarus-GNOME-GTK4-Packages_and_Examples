
unit gtkeditablelabel;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkeditablelabel.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkeditablelabel.h
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
PGtkEditableLabel  = ^GtkEditableLabel;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2020 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
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
{$include <gtk/gtkwidget.h>}

{ was #define dname def_expr }
function GTK_TYPE_EDITABLE_LABEL : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkEditableLabel, gtk_editable_label, GTK, EDITABLE_LABEL, GtkWidget) }
(* Const before type ignored *)
function gtk_editable_label_new(str:Pchar):PGtkWidget;cdecl;external;
function gtk_editable_label_get_editing(self:PGtkEditableLabel):Tgboolean;cdecl;external;
procedure gtk_editable_label_start_editing(self:PGtkEditableLabel);cdecl;external;
procedure gtk_editable_label_stop_editing(self:PGtkEditableLabel; commit:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_EDITABLE_LABEL : longint; { return type might be wrong }
  begin
    GTK_TYPE_EDITABLE_LABEL:=gtk_editable_label_get_type;
  end;


end.
