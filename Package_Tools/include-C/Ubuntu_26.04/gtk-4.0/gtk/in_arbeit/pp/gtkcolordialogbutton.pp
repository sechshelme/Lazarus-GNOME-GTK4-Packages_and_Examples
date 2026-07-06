
unit gtkcolordialogbutton;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkcolordialogbutton.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkcolordialogbutton.h
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
PGdkRGBA  = ^GdkRGBA;
PGtkColorDialog  = ^GtkColorDialog;
PGtkColorDialogButton  = ^GtkColorDialogButton;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GTK - The GIMP Toolkit
 * Copyright (C) 2022 Red Hat, Inc.
 * All rights reserved.
 *
 * This Library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * This Library is distributed in the hope that it will be useful,
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
{$include <gtk/gtkbutton.h>}
{$include <gtk/gtkcolordialog.h>}

{ was #define dname def_expr }
function GTK_TYPE_COLOR_DIALOG_BUTTON : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkColorDialogButton, gtk_color_dialog_button, GTK, COLOR_DIALOG_BUTTON, GtkWidget) }
function gtk_color_dialog_button_new(dialog:PGtkColorDialog):PGtkWidget;cdecl;external;
function gtk_color_dialog_button_get_dialog(self:PGtkColorDialogButton):PGtkColorDialog;cdecl;external;
procedure gtk_color_dialog_button_set_dialog(self:PGtkColorDialogButton; dialog:PGtkColorDialog);cdecl;external;
(* Const before type ignored *)
function gtk_color_dialog_button_get_rgba(self:PGtkColorDialogButton):PGdkRGBA;cdecl;external;
(* Const before type ignored *)
procedure gtk_color_dialog_button_set_rgba(self:PGtkColorDialogButton; color:PGdkRGBA);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_COLOR_DIALOG_BUTTON : longint; { return type might be wrong }
  begin
    GTK_TYPE_COLOR_DIALOG_BUTTON:=gtk_color_dialog_button_get_type;
  end;


end.
