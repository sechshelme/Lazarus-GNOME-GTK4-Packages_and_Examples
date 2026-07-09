unit gtkfontchooserdialog;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2011      Alberto Ruiz <aruiz@gnome.org>
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
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/deprecated/gtkdialog.h>}

type

function gtk_font_chooser_dialog_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_font_chooser_dialog_new(title:Pchar; parent:PGtkWindow):PGtkWidget;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkFontChooserDialog, g_object_unref) }

// === Konventiert am: 9-7-26 19:45:22 ===

function GTK_TYPE_FONT_CHOOSER_DIALOG : TGType;
function GTK_FONT_CHOOSER_DIALOG(obj : Pointer) : PGtkFontChooserDialog;
function GTK_IS_FONT_CHOOSER_DIALOG(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_FONT_CHOOSER_DIALOG : TGType;
  begin
    GTK_TYPE_FONT_CHOOSER_DIALOG:=gtk_font_chooser_dialog_get_type;
  end;

function GTK_FONT_CHOOSER_DIALOG(obj : Pointer) : PGtkFontChooserDialog;
begin
  Result := PGtkFontChooserDialog(g_type_check_instance_cast(obj, GTK_TYPE_FONT_CHOOSER_DIALOG));
end;

function GTK_IS_FONT_CHOOSER_DIALOG(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_FONT_CHOOSER_DIALOG);
end;



end.
