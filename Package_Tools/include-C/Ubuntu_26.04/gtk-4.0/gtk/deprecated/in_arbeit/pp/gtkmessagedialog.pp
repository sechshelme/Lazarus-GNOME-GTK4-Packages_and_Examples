
unit gtkmessagedialog;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkmessagedialog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkmessagedialog.h
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
PGtkButtonsType  = ^GtkButtonsType;
PGtkMessageDialog  = ^GtkMessageDialog;
PGtkWidget  = ^GtkWidget;
PGtkWindow  = ^GtkWindow;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2000 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GTK+ Team and others 1997-2003.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/deprecated/gtkdialog.h>}
{$include <gtk/gtkenums.h>}

{ was #define dname def_expr }
function GTK_TYPE_MESSAGE_DIALOG : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_MESSAGE_DIALOG(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_MESSAGE_DIALOG(obj : longint) : longint;

type
  PGtkMessageDialog = ^TGtkMessageDialog;
  TGtkMessageDialog = record
      parent_instance : TGtkDialog;
    end;

{*
 * GtkButtonsType:
 * @GTK_BUTTONS_NONE: no buttons at all
 * @GTK_BUTTONS_OK: an OK button
 * @GTK_BUTTONS_CLOSE: a Close button
 * @GTK_BUTTONS_CANCEL: a Cancel button
 * @GTK_BUTTONS_YES_NO: Yes and No buttons
 * @GTK_BUTTONS_OK_CANCEL: OK and Cancel buttons
 *
 * Prebuilt sets of buttons for `GtkDialog`.
 *
 * If none of these choices are appropriate, simply use
 * %GTK_BUTTONS_NONE and call [method@Gtk.Dialog.add_buttons].
 *
 * > Please note that %GTK_BUTTONS_OK, %GTK_BUTTONS_YES_NO
 * > and %GTK_BUTTONS_OK_CANCEL are discouraged by the
 * > [GNOME Human Interface Guidelines](https://developer.gnome.org/hig/).
  }

  PGtkButtonsType = ^TGtkButtonsType;
  TGtkButtonsType =  Longint;
  Const
    GTK_BUTTONS_NONE = 0;
    GTK_BUTTONS_OK = 1;
    GTK_BUTTONS_CLOSE = 2;
    GTK_BUTTONS_CANCEL = 3;
    GTK_BUTTONS_YES_NO = 4;
    GTK_BUTTONS_OK_CANCEL = 5;
;

function gtk_message_dialog_get_type:TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
(* Const before type ignored *)
function gtk_message_dialog_new(parent:PGtkWindow; flags:TGtkDialogFlags; _type:TGtkMessageType; buttons:TGtkButtonsType; message_format:Pchar; 
           args:array of const):PGtkWidget;cdecl;external;
function gtk_message_dialog_new(parent:PGtkWindow; flags:TGtkDialogFlags; _type:TGtkMessageType; buttons:TGtkButtonsType; message_format:Pchar):PGtkWidget;cdecl;external;
{ (5, 6); }
{xxxxxGLIB_DEPRECATED_IN_4_10 }
(* Const before type ignored *)
function gtk_message_dialog_new_with_markup(parent:PGtkWindow; flags:TGtkDialogFlags; _type:TGtkMessageType; buttons:TGtkButtonsType; message_format:Pchar; 
           args:array of const):PGtkWidget;cdecl;external;
function gtk_message_dialog_new_with_markup(parent:PGtkWindow; flags:TGtkDialogFlags; _type:TGtkMessageType; buttons:TGtkButtonsType; message_format:Pchar):PGtkWidget;cdecl;external;
{ (5, 6); }
{xxxxxGLIB_DEPRECATED_IN_4_10 }
(* Const before type ignored *)
procedure gtk_message_dialog_set_markup(message_dialog:PGtkMessageDialog; str:Pchar);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
(* Const before type ignored *)
procedure gtk_message_dialog_format_secondary_text(message_dialog:PGtkMessageDialog; message_format:Pchar; args:array of const);cdecl;external;
procedure gtk_message_dialog_format_secondary_text(message_dialog:PGtkMessageDialog; message_format:Pchar);cdecl;external;
{ (2, 3); }
{xxxxxGLIB_DEPRECATED_IN_4_10 }
(* Const before type ignored *)
procedure gtk_message_dialog_format_secondary_markup(message_dialog:PGtkMessageDialog; message_format:Pchar; args:array of const);cdecl;external;
procedure gtk_message_dialog_format_secondary_markup(message_dialog:PGtkMessageDialog; message_format:Pchar);cdecl;external;
{ (2, 3); }
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_message_dialog_get_message_area(message_dialog:PGtkMessageDialog):PGtkWidget;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkMessageDialog, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_MESSAGE_DIALOG : longint; { return type might be wrong }
  begin
    GTK_TYPE_MESSAGE_DIALOG:=gtk_message_dialog_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_MESSAGE_DIALOG(obj : longint) : longint;
begin
  GTK_MESSAGE_DIALOG:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_MESSAGE_DIALOG,GtkMessageDialog);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_MESSAGE_DIALOG(obj : longint) : longint;
begin
  GTK_IS_MESSAGE_DIALOG:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_MESSAGE_DIALOG);
end;


end.
