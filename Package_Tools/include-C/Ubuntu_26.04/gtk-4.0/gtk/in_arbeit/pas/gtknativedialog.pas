unit gtknativedialog;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * gtknativedialog.h: Native dialog
 * Copyright (C) 2015, Red Hat, Inc.
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
{$include <gtk/gtkwindow.h>}

{G_DECLARE_DERIVABLE_TYPE (GtkNativeDialog, gtk_native_dialog, GTK, NATIVE_DIALOG, GObject) }
{*
 * GtkNativeDialogClass:
 * @response: class handler for the `GtkNativeDialog::response` signal
 *
 * Class structure for `GtkNativeDialog`.
  }
{< private > }
{< public > }
{ <private>  }
{ Padding for future expansion  }
type
  PGtkNativeDialogClass = ^TGtkNativeDialogClass;
  TGtkNativeDialogClass = record
      parent_class : TGObjectClass;
      response : procedure (self:PGtkNativeDialog; response_id:longint);cdecl;
      show : procedure (self:PGtkNativeDialog);cdecl;
      hide : procedure (self:PGtkNativeDialog);cdecl;
      _gtk_reserved1 : procedure ;cdecl;
      _gtk_reserved2 : procedure ;cdecl;
      _gtk_reserved3 : procedure ;cdecl;
      _gtk_reserved4 : procedure ;cdecl;
    end;


procedure gtk_native_dialog_show(self:PGtkNativeDialog);cdecl;external libgtk4;
procedure gtk_native_dialog_hide(self:PGtkNativeDialog);cdecl;external libgtk4;
procedure gtk_native_dialog_destroy(self:PGtkNativeDialog);cdecl;external libgtk4;
function gtk_native_dialog_get_visible(self:PGtkNativeDialog):Tgboolean;cdecl;external libgtk4;
procedure gtk_native_dialog_set_modal(self:PGtkNativeDialog; modal:Tgboolean);cdecl;external libgtk4;
function gtk_native_dialog_get_modal(self:PGtkNativeDialog):Tgboolean;cdecl;external libgtk4;
procedure gtk_native_dialog_set_title(self:PGtkNativeDialog; title:Pchar);cdecl;external libgtk4;
function gtk_native_dialog_get_title(self:PGtkNativeDialog):Pchar;cdecl;external libgtk4;
procedure gtk_native_dialog_set_transient_for(self:PGtkNativeDialog; parent:PGtkWindow);cdecl;external libgtk4;
function gtk_native_dialog_get_transient_for(self:PGtkNativeDialog):PGtkWindow;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:55:37 ===

function GTK_TYPE_NATIVE_DIALOG: TGType;
function GTK_NATIVE_DIALOG(obj: Pointer): PGtkNativeDialog;
function GTK_IS_NATIVE_DIALOG(obj: Pointer): Tgboolean;
function GTK_NATIVE_DIALOG_CLASS(klass: Pointer): PGtkNativeDialogClass;
function GTK_IS_NATIVE_DIALOG_CLASS(klass: Pointer): Tgboolean;
function GTK_NATIVE_DIALOG_GET_CLASS(obj: Pointer): PGtkNativeDialogClass;

implementation

function GTK_TYPE_NATIVE_DIALOG: TGType;
begin
  Result := gtk_native_dialog_get_type;
end;

function GTK_NATIVE_DIALOG(obj: Pointer): PGtkNativeDialog;
begin
  Result := PGtkNativeDialog(g_type_check_instance_cast(obj, GTK_TYPE_NATIVE_DIALOG));
end;

function GTK_IS_NATIVE_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_NATIVE_DIALOG);
end;

function GTK_NATIVE_DIALOG_CLASS(klass: Pointer): PGtkNativeDialogClass;
begin
  Result := PGtkNativeDialogClass(g_type_check_class_cast(klass, GTK_TYPE_NATIVE_DIALOG));
end;

function GTK_IS_NATIVE_DIALOG_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_NATIVE_DIALOG);
end;

function GTK_NATIVE_DIALOG_GET_CLASS(obj: Pointer): PGtkNativeDialogClass;
begin
  Result := PGtkNativeDialogClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TGtkNativeDialog = record
    parent_instance: TGObject;
  end;
  PGtkNativeDialog = ^TGtkNativeDialog;

  PGtkNativeDialogClass = type Pointer;

function gtk_native_dialog_get_type: TGType; cdecl; external libgxxxxxxx;



end.
