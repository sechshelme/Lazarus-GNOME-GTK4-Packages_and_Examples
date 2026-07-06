
unit gtkprintdialog;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkprintdialog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkprintdialog.h
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
PGFile  = ^GFile;
PGOutputStream  = ^GOutputStream;
PGtkPageSetup  = ^GtkPageSetup;
PGtkPrintDialog  = ^GtkPrintDialog;
PGtkPrintSettings  = ^GtkPrintSettings;
PGtkPrintSetup  = ^GtkPrintSetup;
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
{$include <gtk/print/gtkprintsettings.h>}
{$include <gtk/print/gtkpagesetup.h>}
type

{ was #define dname def_expr }
function GTK_TYPE_PRINT_SETUP : longint; { return type might be wrong }

function gtk_print_setup_get_type:TGType;cdecl;external;
function gtk_print_setup_ref(setup:PGtkPrintSetup):PGtkPrintSetup;cdecl;external;
procedure gtk_print_setup_unref(setup:PGtkPrintSetup);cdecl;external;
function gtk_print_setup_get_print_settings(setup:PGtkPrintSetup):PGtkPrintSettings;cdecl;external;
function gtk_print_setup_get_page_setup(setup:PGtkPrintSetup):PGtkPageSetup;cdecl;external;
{ was #define dname def_expr }
function GTK_TYPE_PRINT_DIALOG : longint; { return type might be wrong }

{ G_DECLARE_FINAL_TYPE (GtkPrintDialog, gtk_print_dialog, GTK, PRINT_DIALOG, GObject) }
function gtk_print_dialog_new:PGtkPrintDialog;cdecl;external;
(* Const before type ignored *)
function gtk_print_dialog_get_title(self:PGtkPrintDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_print_dialog_set_title(self:PGtkPrintDialog; title:Pchar);cdecl;external;
(* Const before type ignored *)
function gtk_print_dialog_get_accept_label(self:PGtkPrintDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_print_dialog_set_accept_label(self:PGtkPrintDialog; accept_label:Pchar);cdecl;external;
function gtk_print_dialog_get_modal(self:PGtkPrintDialog):Tgboolean;cdecl;external;
procedure gtk_print_dialog_set_modal(self:PGtkPrintDialog; modal:Tgboolean);cdecl;external;
function gtk_print_dialog_get_page_setup(self:PGtkPrintDialog):PGtkPageSetup;cdecl;external;
procedure gtk_print_dialog_set_page_setup(self:PGtkPrintDialog; page_setup:PGtkPageSetup);cdecl;external;
function gtk_print_dialog_get_print_settings(self:PGtkPrintDialog):PGtkPrintSettings;cdecl;external;
procedure gtk_print_dialog_set_print_settings(self:PGtkPrintDialog; print_settings:PGtkPrintSettings);cdecl;external;
procedure gtk_print_dialog_setup(self:PGtkPrintDialog; parent:PGtkWindow; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gtk_print_dialog_setup_finish(self:PGtkPrintDialog; result:PGAsyncResult; error:PPGError):PGtkPrintSetup;cdecl;external;
procedure gtk_print_dialog_print(self:PGtkPrintDialog; parent:PGtkWindow; setup:PGtkPrintSetup; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function gtk_print_dialog_print_finish(self:PGtkPrintDialog; result:PGAsyncResult; error:PPGError):PGOutputStream;cdecl;external;
procedure gtk_print_dialog_print_file(self:PGtkPrintDialog; parent:PGtkWindow; setup:PGtkPrintSetup; file:PGFile; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gtk_print_dialog_print_file_finish(self:PGtkPrintDialog; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_PRINT_SETUP : longint; { return type might be wrong }
  begin
    GTK_TYPE_PRINT_SETUP:=gtk_print_setup_get_type;
  end;

{ was #define dname def_expr }
function GTK_TYPE_PRINT_DIALOG : longint; { return type might be wrong }
  begin
    GTK_TYPE_PRINT_DIALOG:=gtk_print_dialog_get_type;
  end;


end.
