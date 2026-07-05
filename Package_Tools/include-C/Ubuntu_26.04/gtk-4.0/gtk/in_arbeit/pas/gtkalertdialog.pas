unit gtkalertdialog;

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

{ G_DECLARE_FINAL_TYPE (GtkAlertDialog, gtk_alert_dialog, GTK, ALERT_DIALOG, GObject) }
function gtk_alert_dialog_new(format:Pchar; args:array of const):PGtkAlertDialog;cdecl;external libgtk4;
function gtk_alert_dialog_new(format:Pchar):PGtkAlertDialog;cdecl;external libgtk4;
{ (1, 2); }
function gtk_alert_dialog_get_modal(self:PGtkAlertDialog):Tgboolean;cdecl;external libgtk4;
procedure gtk_alert_dialog_set_modal(self:PGtkAlertDialog; modal:Tgboolean);cdecl;external libgtk4;
function gtk_alert_dialog_get_message(self:PGtkAlertDialog):Pchar;cdecl;external libgtk4;
procedure gtk_alert_dialog_set_message(self:PGtkAlertDialog; message:Pchar);cdecl;external libgtk4;
function gtk_alert_dialog_get_detail(self:PGtkAlertDialog):Pchar;cdecl;external libgtk4;
procedure gtk_alert_dialog_set_detail(self:PGtkAlertDialog; detail:Pchar);cdecl;external libgtk4;
function gtk_alert_dialog_get_buttons(self:PGtkAlertDialog):^Pchar;cdecl;external libgtk4;
procedure gtk_alert_dialog_set_buttons(self:PGtkAlertDialog; labels:PPchar);cdecl;external libgtk4;
function gtk_alert_dialog_get_cancel_button(self:PGtkAlertDialog):longint;cdecl;external libgtk4;
procedure gtk_alert_dialog_set_cancel_button(self:PGtkAlertDialog; button:longint);cdecl;external libgtk4;
function gtk_alert_dialog_get_default_button(self:PGtkAlertDialog):longint;cdecl;external libgtk4;
procedure gtk_alert_dialog_set_default_button(self:PGtkAlertDialog; button:longint);cdecl;external libgtk4;
procedure gtk_alert_dialog_choose(self:PGtkAlertDialog; parent:PGtkWindow; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgtk4;
function gtk_alert_dialog_choose_finish(self:PGtkAlertDialog; result:PGAsyncResult; error:PPGError):longint;cdecl;external libgtk4;
procedure gtk_alert_dialog_show(self:PGtkAlertDialog; parent:PGtkWindow);cdecl;external libgtk4;

// === Konventiert am: 5-7-26 16:27:51 ===

function GTK_TYPE_ALERT_DIALOG: TGType;
function GTK_ALERT_DIALOG(obj: Pointer): PGtkAlertDialog;
function GTK_IS_ALERT_DIALOG(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_ALERT_DIALOG: TGType;
begin
  Result := gtk_alert_dialog_get_type;
end;

function GTK_ALERT_DIALOG(obj: Pointer): PGtkAlertDialog;
begin
  Result := PGtkAlertDialog(g_type_check_instance_cast(obj, GTK_TYPE_ALERT_DIALOG));
end;

function GTK_IS_ALERT_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_ALERT_DIALOG);
end;

type 
  PGtkAlertDialog = type Pointer;

  TGtkAlertDialogClass = record
    parent_class: TGObjectClass;
  end;
  PGtkAlertDialogClass = ^TGtkAlertDialogClass;

function gtk_alert_dialog_get_type: TGType; cdecl; external libgxxxxxxx;



end.
