unit gtkfiledialog;

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
{$include <gtk/gtkfilefilter.h>}

{G_DECLARE_FINAL_TYPE (GtkFileDialog, gtk_file_dialog, GTK, FILE_DIALOG, GObject) }
function gtk_file_dialog_new:PGtkFileDialog;cdecl;external libgtk4;
function gtk_file_dialog_get_title(self:PGtkFileDialog):Pchar;cdecl;external libgtk4;
procedure gtk_file_dialog_set_title(self:PGtkFileDialog; title:Pchar);cdecl;external libgtk4;
function gtk_file_dialog_get_modal(self:PGtkFileDialog):Tgboolean;cdecl;external libgtk4;
procedure gtk_file_dialog_set_modal(self:PGtkFileDialog; modal:Tgboolean);cdecl;external libgtk4;
function gtk_file_dialog_get_filters(self:PGtkFileDialog):PGListModel;cdecl;external libgtk4;
procedure gtk_file_dialog_set_filters(self:PGtkFileDialog; filters:PGListModel);cdecl;external libgtk4;
function gtk_file_dialog_get_default_filter(self:PGtkFileDialog):PGtkFileFilter;cdecl;external libgtk4;
procedure gtk_file_dialog_set_default_filter(self:PGtkFileDialog; filter:PGtkFileFilter);cdecl;external libgtk4;
function gtk_file_dialog_get_initial_folder(self:PGtkFileDialog):PGFile;cdecl;external libgtk4;
procedure gtk_file_dialog_set_initial_folder(self:PGtkFileDialog; folder:PGFile);cdecl;external libgtk4;
function gtk_file_dialog_get_initial_name(self:PGtkFileDialog):Pchar;cdecl;external libgtk4;
procedure gtk_file_dialog_set_initial_name(self:PGtkFileDialog; name:Pchar);cdecl;external libgtk4;
function gtk_file_dialog_get_initial_file(self:PGtkFileDialog):PGFile;cdecl;external libgtk4;
procedure gtk_file_dialog_set_initial_file(self:PGtkFileDialog; file:PGFile);cdecl;external libgtk4;
function gtk_file_dialog_get_accept_label(self:PGtkFileDialog):Pchar;cdecl;external libgtk4;
procedure gtk_file_dialog_set_accept_label(self:PGtkFileDialog; accept_label:Pchar);cdecl;external libgtk4;
procedure gtk_file_dialog_open(self:PGtkFileDialog; parent:PGtkWindow; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgtk4;
function gtk_file_dialog_open_finish(self:PGtkFileDialog; result:PGAsyncResult; error:PPGError):PGFile;cdecl;external libgtk4;
procedure gtk_file_dialog_select_folder(self:PGtkFileDialog; parent:PGtkWindow; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgtk4;
function gtk_file_dialog_select_folder_finish(self:PGtkFileDialog; result:PGAsyncResult; error:PPGError):PGFile;cdecl;external libgtk4;
procedure gtk_file_dialog_save(self:PGtkFileDialog; parent:PGtkWindow; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgtk4;
function gtk_file_dialog_save_finish(self:PGtkFileDialog; result:PGAsyncResult; error:PPGError):PGFile;cdecl;external libgtk4;
procedure gtk_file_dialog_open_multiple(self:PGtkFileDialog; parent:PGtkWindow; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgtk4;
function gtk_file_dialog_open_multiple_finish(self:PGtkFileDialog; result:PGAsyncResult; error:PPGError):PGListModel;cdecl;external libgtk4;
procedure gtk_file_dialog_select_multiple_folders(self:PGtkFileDialog; parent:PGtkWindow; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgtk4;
function gtk_file_dialog_select_multiple_folders_finish(self:PGtkFileDialog; result:PGAsyncResult; error:PPGError):PGListModel;cdecl;external libgtk4;
procedure gtk_file_dialog_open_text_file(self:PGtkFileDialog; parent:PGtkWindow; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgtk4;
function gtk_file_dialog_open_text_file_finish(self:PGtkFileDialog; result:PGAsyncResult; encoding:PPchar; error:PPGError):PGFile;cdecl;external libgtk4;
procedure gtk_file_dialog_open_multiple_text_files(self:PGtkFileDialog; parent:PGtkWindow; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgtk4;
function gtk_file_dialog_open_multiple_text_files_finish(self:PGtkFileDialog; result:PGAsyncResult; encoding:PPchar; error:PPGError):PGListModel;cdecl;external libgtk4;
procedure gtk_file_dialog_save_text_file(self:PGtkFileDialog; parent:PGtkWindow; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgtk4;
function gtk_file_dialog_save_text_file_finish(self:PGtkFileDialog; result:PGAsyncResult; encoding:PPchar; line_ending:PPchar; error:PPGError):PGFile;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:08:36 ===

function GTK_TYPE_FILE_DIALOG: TGType;
function GTK_FILE_DIALOG(obj: Pointer): PGtkFileDialog;
function GTK_IS_FILE_DIALOG(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_FILE_DIALOG: TGType;
begin
  Result := gtk_file_dialog_get_type;
end;

function GTK_FILE_DIALOG(obj: Pointer): PGtkFileDialog;
begin
  Result := PGtkFileDialog(g_type_check_instance_cast(obj, GTK_TYPE_FILE_DIALOG));
end;

function GTK_IS_FILE_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FILE_DIALOG);
end;

type 
  PGtkFileDialog = type Pointer;

  TGtkFileDialogClass = record
    parent_class: TGObjectClass;
  end;
  PGtkFileDialogClass = ^TGtkFileDialogClass;

function gtk_file_dialog_get_type: TGType; cdecl; external libgxxxxxxx;



end.
