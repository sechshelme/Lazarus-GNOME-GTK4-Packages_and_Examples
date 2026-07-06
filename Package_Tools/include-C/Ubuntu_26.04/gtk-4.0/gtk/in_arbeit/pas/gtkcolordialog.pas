unit gtkcolordialog;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 *
 * Copyright (C) 2022 Red Hat, Inc.
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
{$include <gdk/gdk.h>}
{$include <gtk/gtkwindow.h>}

{G_DECLARE_FINAL_TYPE (GtkColorDialog, gtk_color_dialog, GTK, COLOR_DIALOG, GObject) }
function gtk_color_dialog_new:PGtkColorDialog;cdecl;external libgtk4;
function gtk_color_dialog_get_title(self:PGtkColorDialog):Pchar;cdecl;external libgtk4;
procedure gtk_color_dialog_set_title(self:PGtkColorDialog; title:Pchar);cdecl;external libgtk4;
function gtk_color_dialog_get_modal(self:PGtkColorDialog):Tgboolean;cdecl;external libgtk4;
procedure gtk_color_dialog_set_modal(self:PGtkColorDialog; modal:Tgboolean);cdecl;external libgtk4;
function gtk_color_dialog_get_with_alpha(self:PGtkColorDialog):Tgboolean;cdecl;external libgtk4;
procedure gtk_color_dialog_set_with_alpha(self:PGtkColorDialog; with_alpha:Tgboolean);cdecl;external libgtk4;
procedure gtk_color_dialog_choose_rgba(self:PGtkColorDialog; parent:PGtkWindow; initial_color:PGdkRGBA; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libgtk4;
function gtk_color_dialog_choose_rgba_finish(self:PGtkColorDialog; result:PGAsyncResult; error:PPGError):PGdkRGBA;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 14:03:09 ===

function GTK_TYPE_COLOR_DIALOG: TGType;
function GTK_COLOR_DIALOG(obj: Pointer): PGtkColorDialog;
function GTK_IS_COLOR_DIALOG(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_COLOR_DIALOG: TGType;
begin
  Result := gtk_color_dialog_get_type;
end;

function GTK_COLOR_DIALOG(obj: Pointer): PGtkColorDialog;
begin
  Result := PGtkColorDialog(g_type_check_instance_cast(obj, GTK_TYPE_COLOR_DIALOG));
end;

function GTK_IS_COLOR_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_COLOR_DIALOG);
end;

type 
  PGtkColorDialog = type Pointer;

  TGtkColorDialogClass = record
    parent_class: TGObjectClass;
  end;
  PGtkColorDialogClass = ^TGtkColorDialogClass;

function gtk_color_dialog_get_type: TGType; cdecl; external libgxxxxxxx;



end.
