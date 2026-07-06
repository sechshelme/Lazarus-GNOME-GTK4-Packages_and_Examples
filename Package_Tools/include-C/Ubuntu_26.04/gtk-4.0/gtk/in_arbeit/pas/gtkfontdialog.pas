unit gtkfontdialog;

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
{$include <gtk/gtkfilter.h>}

{G_DECLARE_FINAL_TYPE (GtkFontDialog, gtk_font_dialog, GTK, FONT_DIALOG, GObject) }
function gtk_font_dialog_new:PGtkFontDialog;cdecl;external libgtk4;
function gtk_font_dialog_get_title(self:PGtkFontDialog):Pchar;cdecl;external libgtk4;
procedure gtk_font_dialog_set_title(self:PGtkFontDialog; title:Pchar);cdecl;external libgtk4;
function gtk_font_dialog_get_modal(self:PGtkFontDialog):Tgboolean;cdecl;external libgtk4;
procedure gtk_font_dialog_set_modal(self:PGtkFontDialog; modal:Tgboolean);cdecl;external libgtk4;
function gtk_font_dialog_get_language(self:PGtkFontDialog):PPangoLanguage;cdecl;external libgtk4;
procedure gtk_font_dialog_set_language(self:PGtkFontDialog; language:PPangoLanguage);cdecl;external libgtk4;
function gtk_font_dialog_get_font_map(self:PGtkFontDialog):PPangoFontMap;cdecl;external libgtk4;
procedure gtk_font_dialog_set_font_map(self:PGtkFontDialog; fontmap:PPangoFontMap);cdecl;external libgtk4;
function gtk_font_dialog_get_filter(self:PGtkFontDialog):PGtkFilter;cdecl;external libgtk4;
procedure gtk_font_dialog_set_filter(self:PGtkFontDialog; filter:PGtkFilter);cdecl;external libgtk4;
procedure gtk_font_dialog_choose_family(self:PGtkFontDialog; parent:PGtkWindow; initial_value:PPangoFontFamily; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libgtk4;
function gtk_font_dialog_choose_family_finish(self:PGtkFontDialog; result:PGAsyncResult; error:PPGError):PPangoFontFamily;cdecl;external libgtk4;
procedure gtk_font_dialog_choose_face(self:PGtkFontDialog; parent:PGtkWindow; initial_value:PPangoFontFace; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libgtk4;
function gtk_font_dialog_choose_face_finish(self:PGtkFontDialog; result:PGAsyncResult; error:PPGError):PPangoFontFace;cdecl;external libgtk4;
procedure gtk_font_dialog_choose_font(self:PGtkFontDialog; parent:PGtkWindow; initial_value:PPangoFontDescription; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libgtk4;
function gtk_font_dialog_choose_font_finish(self:PGtkFontDialog; result:PGAsyncResult; error:PPGError):PPangoFontDescription;cdecl;external libgtk4;
procedure gtk_font_dialog_choose_font_and_features(self:PGtkFontDialog; parent:PGtkWindow; initial_value:PPangoFontDescription; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libgtk4;
function gtk_font_dialog_choose_font_and_features_finish(self:PGtkFontDialog; result:PGAsyncResult; font_desc:PPPangoFontDescription; font_features:PPchar; language:PPPangoLanguage; 
           error:PPGError):Tgboolean;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:15:03 ===

function GTK_TYPE_FONT_DIALOG: TGType;
function GTK_FONT_DIALOG(obj: Pointer): PGtkFontDialog;
function GTK_IS_FONT_DIALOG(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_FONT_DIALOG: TGType;
begin
  Result := gtk_font_dialog_get_type;
end;

function GTK_FONT_DIALOG(obj: Pointer): PGtkFontDialog;
begin
  Result := PGtkFontDialog(g_type_check_instance_cast(obj, GTK_TYPE_FONT_DIALOG));
end;

function GTK_IS_FONT_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FONT_DIALOG);
end;

type 
  PGtkFontDialog = type Pointer;

  TGtkFontDialogClass = record
    parent_class: TGObjectClass;
  end;
  PGtkFontDialogClass = ^TGtkFontDialogClass;

function gtk_font_dialog_get_type: TGType; cdecl; external libgxxxxxxx;



end.
