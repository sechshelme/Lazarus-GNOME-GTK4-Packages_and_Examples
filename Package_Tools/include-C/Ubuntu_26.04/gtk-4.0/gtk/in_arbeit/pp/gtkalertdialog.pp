
unit gtkalertdialog;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkalertdialog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkalertdialog.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGtkAlertDialog  = ^GtkAlertDialog;
PGtkWindow  = ^GtkWindow;
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

{ was #define dname def_expr }
function GTK_TYPE_ALERT_DIALOG : longint; { return type might be wrong }

{ G_DECLARE_FINAL_TYPE (GtkAlertDialog, gtk_alert_dialog, GTK, ALERT_DIALOG, GObject) }
(* Const before type ignored *)
function gtk_alert_dialog_new(format:Pchar; args:array of const):PGtkAlertDialog;cdecl;external;
function gtk_alert_dialog_new(format:Pchar):PGtkAlertDialog;cdecl;external;
{ (1, 2); }
function gtk_alert_dialog_get_modal(self:PGtkAlertDialog):Tgboolean;cdecl;external;
procedure gtk_alert_dialog_set_modal(self:PGtkAlertDialog; modal:Tgboolean);cdecl;external;
(* Const before type ignored *)
function gtk_alert_dialog_get_message(self:PGtkAlertDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_alert_dialog_set_message(self:PGtkAlertDialog; message:Pchar);cdecl;external;
(* Const before type ignored *)
function gtk_alert_dialog_get_detail(self:PGtkAlertDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_alert_dialog_set_detail(self:PGtkAlertDialog; detail:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function gtk_alert_dialog_get_buttons(self:PGtkAlertDialog):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
procedure gtk_alert_dialog_set_buttons(self:PGtkAlertDialog; labels:PPchar);cdecl;external;
function gtk_alert_dialog_get_cancel_button(self:PGtkAlertDialog):longint;cdecl;external;
procedure gtk_alert_dialog_set_cancel_button(self:PGtkAlertDialog; button:longint);cdecl;external;
function gtk_alert_dialog_get_default_button(self:PGtkAlertDialog):longint;cdecl;external;
procedure gtk_alert_dialog_set_default_button(self:PGtkAlertDialog; button:longint);cdecl;external;
procedure gtk_alert_dialog_choose(self:PGtkAlertDialog; parent:PGtkWindow; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gtk_alert_dialog_choose_finish(self:PGtkAlertDialog; result:PGAsyncResult; error:PPGError):longint;cdecl;external;
procedure gtk_alert_dialog_show(self:PGtkAlertDialog; parent:PGtkWindow);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_ALERT_DIALOG : longint; { return type might be wrong }
  begin
    GTK_TYPE_ALERT_DIALOG:=gtk_alert_dialog_get_type;
  end;


end.
