unit gtkcolordialogbutton;

interface

uses
  fp_glib2, fp_gtk4;

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

{G_DECLARE_FINAL_TYPE (GtkColorDialogButton, gtk_color_dialog_button, GTK, COLOR_DIALOG_BUTTON, GtkWidget) }
function gtk_color_dialog_button_new(dialog:PGtkColorDialog):PGtkWidget;cdecl;external libgtk4;
function gtk_color_dialog_button_get_dialog(self:PGtkColorDialogButton):PGtkColorDialog;cdecl;external libgtk4;
procedure gtk_color_dialog_button_set_dialog(self:PGtkColorDialogButton; dialog:PGtkColorDialog);cdecl;external libgtk4;
function gtk_color_dialog_button_get_rgba(self:PGtkColorDialogButton):PGdkRGBA;cdecl;external libgtk4;
procedure gtk_color_dialog_button_set_rgba(self:PGtkColorDialogButton; color:PGdkRGBA);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 14:02:49 ===

function GTK_TYPE_COLOR_DIALOG_BUTTON: TGType;
function GTK_COLOR_DIALOG_BUTTON(obj: Pointer): PGtkColorDialogButton;
function GTK_IS_COLOR_DIALOG_BUTTON(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_COLOR_DIALOG_BUTTON: TGType;
begin
  Result := gtk_color_dialog_button_get_type;
end;

function GTK_COLOR_DIALOG_BUTTON(obj: Pointer): PGtkColorDialogButton;
begin
  Result := PGtkColorDialogButton(g_type_check_instance_cast(obj, GTK_TYPE_COLOR_DIALOG_BUTTON));
end;

function GTK_IS_COLOR_DIALOG_BUTTON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_COLOR_DIALOG_BUTTON);
end;

type 
  PGtkColorDialogButton = type Pointer;

  TGtkColorDialogButtonClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkColorDialogButtonClass = ^TGtkColorDialogButtonClass;

function gtk_color_dialog_button_get_type: TGType; cdecl; external libgxxxxxxx;



end.
