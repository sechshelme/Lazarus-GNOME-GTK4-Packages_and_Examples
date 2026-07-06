unit gtkfontdialogbutton;

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
{$include <gtk/gtkfontdialog.h>}

{G_DECLARE_FINAL_TYPE (GtkFontDialogButton, gtk_font_dialog_button, GTK, FONT_DIALOG_BUTTON, GtkWidget) }
function gtk_font_dialog_button_new(dialog:PGtkFontDialog):PGtkWidget;cdecl;external libgtk4;
function gtk_font_dialog_button_get_dialog(self:PGtkFontDialogButton):PGtkFontDialog;cdecl;external libgtk4;
procedure gtk_font_dialog_button_set_dialog(self:PGtkFontDialogButton; dialog:PGtkFontDialog);cdecl;external libgtk4;
{*
 * GtkFontLevel:
 * @GTK_FONT_LEVEL_FAMILY: Select a font family
 * @GTK_FONT_LEVEL_FACE: Select a font face (i.e. a family and a style)
 * @GTK_FONT_LEVEL_FONT: Select a font (i.e. a face with a size, and possibly font variations)
 * @GTK_FONT_LEVEL_FEATURES: Select a font and font features
 *
 * The level of granularity for the font selection.
 *
 * Depending on this value, the `PangoFontDescription` that
 * is returned by [method@Gtk.FontDialogButton.get_font_desc]
 * will have more or less fields set.
 *
 * Since: 4.10
  }
type
  PGtkFontLevel = ^TGtkFontLevel;
  TGtkFontLevel =  Longint;
  Const
    GTK_FONT_LEVEL_FAMILY = 0;
    GTK_FONT_LEVEL_FACE = 1;
    GTK_FONT_LEVEL_FONT = 2;
    GTK_FONT_LEVEL_FEATURES = 3;
;

function gtk_font_dialog_button_get_level(self:PGtkFontDialogButton):TGtkFontLevel;cdecl;external libgtk4;
procedure gtk_font_dialog_button_set_level(self:PGtkFontDialogButton; level:TGtkFontLevel);cdecl;external libgtk4;
function gtk_font_dialog_button_get_font_desc(self:PGtkFontDialogButton):PPangoFontDescription;cdecl;external libgtk4;
procedure gtk_font_dialog_button_set_font_desc(self:PGtkFontDialogButton; font_desc:PPangoFontDescription);cdecl;external libgtk4;
function gtk_font_dialog_button_get_font_features(self:PGtkFontDialogButton):Pchar;cdecl;external libgtk4;
procedure gtk_font_dialog_button_set_font_features(self:PGtkFontDialogButton; font_features:Pchar);cdecl;external libgtk4;
function gtk_font_dialog_button_get_language(self:PGtkFontDialogButton):PPangoLanguage;cdecl;external libgtk4;
procedure gtk_font_dialog_button_set_language(self:PGtkFontDialogButton; language:PPangoLanguage);cdecl;external libgtk4;
function gtk_font_dialog_button_get_use_font(self:PGtkFontDialogButton):Tgboolean;cdecl;external libgtk4;
procedure gtk_font_dialog_button_set_use_font(self:PGtkFontDialogButton; use_font:Tgboolean);cdecl;external libgtk4;
function gtk_font_dialog_button_get_use_size(self:PGtkFontDialogButton):Tgboolean;cdecl;external libgtk4;
procedure gtk_font_dialog_button_set_use_size(self:PGtkFontDialogButton; use_size:Tgboolean);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:29:22 ===

function GTK_TYPE_FONT_DIALOG_BUTTON: TGType;
function GTK_FONT_DIALOG_BUTTON(obj: Pointer): PGtkFontDialogButton;
function GTK_IS_FONT_DIALOG_BUTTON(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_FONT_DIALOG_BUTTON: TGType;
begin
  Result := gtk_font_dialog_button_get_type;
end;

function GTK_FONT_DIALOG_BUTTON(obj: Pointer): PGtkFontDialogButton;
begin
  Result := PGtkFontDialogButton(g_type_check_instance_cast(obj, GTK_TYPE_FONT_DIALOG_BUTTON));
end;

function GTK_IS_FONT_DIALOG_BUTTON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FONT_DIALOG_BUTTON);
end;

type 
  PGtkFontDialogButton = type Pointer;

  TGtkFontDialogButtonClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkFontDialogButtonClass = ^TGtkFontDialogButtonClass;

function gtk_font_dialog_button_get_type: TGType; cdecl; external libgxxxxxxx;



end.
