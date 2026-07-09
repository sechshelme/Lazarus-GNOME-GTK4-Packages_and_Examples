unit gtkfilechoosernative;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * gtkfilechoosernative.h: Native File selector dialog
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
{$include <gtk/deprecated/gtkfilechooser.h>}
{$include <gtk/gtknativedialog.h>}

{G_DECLARE_FINAL_TYPE (GtkFileChooserNative, gtk_file_chooser_native, GTK, FILE_CHOOSER_NATIVE, GtkNativeDialog) }
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_file_chooser_native_new(title:Pchar; parent:PGtkWindow; action:TGtkFileChooserAction; accept_label:Pchar; cancel_label:Pchar):PGtkFileChooserNative;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_file_chooser_native_get_accept_label(self:PGtkFileChooserNative):Pchar;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_file_chooser_native_set_accept_label(self:PGtkFileChooserNative; accept_label:Pchar);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_file_chooser_native_get_cancel_label(self:PGtkFileChooserNative):Pchar;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_file_chooser_native_set_cancel_label(self:PGtkFileChooserNative; cancel_label:Pchar);cdecl;external libgtk4;

// === Konventiert am: 9-7-26 19:45:41 ===

function GTK_TYPE_FILE_CHOOSER_NATIVE: TGType;
function GTK_FILE_CHOOSER_NATIVE(obj: Pointer): PGtkFileChooserNative;
function GTK_IS_FILE_CHOOSER_NATIVE(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_FILE_CHOOSER_NATIVE: TGType;
begin
  Result := gtk_file_chooser_native_get_type;
end;

function GTK_FILE_CHOOSER_NATIVE(obj: Pointer): PGtkFileChooserNative;
begin
  Result := PGtkFileChooserNative(g_type_check_instance_cast(obj, GTK_TYPE_FILE_CHOOSER_NATIVE));
end;

function GTK_IS_FILE_CHOOSER_NATIVE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FILE_CHOOSER_NATIVE);
end;

type 
  PGtkFileChooserNative = type Pointer;

  TGtkFileChooserNativeClass = record
    parent_class: TGtkNativeDialogClass;
  end;
  PGtkFileChooserNativeClass = ^TGtkFileChooserNativeClass;

function gtk_file_chooser_native_get_type: TGType; cdecl; external libgxxxxxxx;



end.
