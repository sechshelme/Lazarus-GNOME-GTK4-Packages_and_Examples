
unit gtkappchooserdialog;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkappchooserdialog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkappchooserdialog.h
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
PGFile  = ^GFile;
PGtkAppChooserDialog  = ^GtkAppChooserDialog;
PGtkWidget  = ^GtkWidget;
PGtkWindow  = ^GtkWindow;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * gtkappchooserdialog.h: an app-chooser dialog
 *
 * Copyright (C) 2004 Novell, Inc.
 * Copyright (C) 2007, 2010 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Dave Camp <dave@novell.com>
 *          Alexander Larsson <alexl@redhat.com>
 *          Cosimo Cecchi <ccecchi@redhat.com>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/deprecated/gtkdialog.h>}
{$include <gio/gio.h>}

{ was #define dname def_expr }
function GTK_TYPE_APP_CHOOSER_DIALOG : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_APP_CHOOSER_DIALOG(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_APP_CHOOSER_DIALOG(obj : longint) : longint;

type

function gtk_app_chooser_dialog_get_type:TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_app_chooser_dialog_new(parent:PGtkWindow; flags:TGtkDialogFlags; file:PGFile):PGtkWidget;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
(* Const before type ignored *)
function gtk_app_chooser_dialog_new_for_content_type(parent:PGtkWindow; flags:TGtkDialogFlags; content_type:Pchar):PGtkWidget;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_app_chooser_dialog_get_widget(self:PGtkAppChooserDialog):PGtkWidget;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
(* Const before type ignored *)
procedure gtk_app_chooser_dialog_set_heading(self:PGtkAppChooserDialog; heading:Pchar);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
(* Const before type ignored *)
function gtk_app_chooser_dialog_get_heading(self:PGtkAppChooserDialog):Pchar;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkAppChooserDialog, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_APP_CHOOSER_DIALOG : longint; { return type might be wrong }
  begin
    GTK_TYPE_APP_CHOOSER_DIALOG:=gtk_app_chooser_dialog_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_APP_CHOOSER_DIALOG(obj : longint) : longint;
begin
  GTK_APP_CHOOSER_DIALOG:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_APP_CHOOSER_DIALOG,GtkAppChooserDialog);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_APP_CHOOSER_DIALOG(obj : longint) : longint;
begin
  GTK_IS_APP_CHOOSER_DIALOG:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_APP_CHOOSER_DIALOG);
end;


end.
