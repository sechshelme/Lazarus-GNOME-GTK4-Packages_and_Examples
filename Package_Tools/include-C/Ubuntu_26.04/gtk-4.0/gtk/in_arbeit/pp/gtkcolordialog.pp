
unit gtkcolordialog;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkcolordialog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkcolordialog.h
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
PGdkRGBA  = ^GdkRGBA;
PGError  = ^GError;
PGtkColorDialog  = ^GtkColorDialog;
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
function GTK_TYPE_COLOR_DIALOG : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkColorDialog, gtk_color_dialog, GTK, COLOR_DIALOG, GObject) }
function gtk_color_dialog_new:PGtkColorDialog;cdecl;external;
(* Const before type ignored *)
function gtk_color_dialog_get_title(self:PGtkColorDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_color_dialog_set_title(self:PGtkColorDialog; title:Pchar);cdecl;external;
function gtk_color_dialog_get_modal(self:PGtkColorDialog):Tgboolean;cdecl;external;
procedure gtk_color_dialog_set_modal(self:PGtkColorDialog; modal:Tgboolean);cdecl;external;
function gtk_color_dialog_get_with_alpha(self:PGtkColorDialog):Tgboolean;cdecl;external;
procedure gtk_color_dialog_set_with_alpha(self:PGtkColorDialog; with_alpha:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure gtk_color_dialog_choose_rgba(self:PGtkColorDialog; parent:PGtkWindow; initial_color:PGdkRGBA; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function gtk_color_dialog_choose_rgba_finish(self:PGtkColorDialog; result:PGAsyncResult; error:PPGError):PGdkRGBA;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_COLOR_DIALOG : longint; { return type might be wrong }
  begin
    GTK_TYPE_COLOR_DIALOG:=gtk_color_dialog_get_type;
  end;


end.
