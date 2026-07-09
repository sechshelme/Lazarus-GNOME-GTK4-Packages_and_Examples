unit gtkfontbutton;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 1998 David Abilleira Freijeiro <odaf@nexo.es>
 * All rights reserved
 * Based on gnome-color-picker by Federico Mena <federico@nuclecu.unam.mx>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GTK+ Team and others 2003.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkbutton.h>}

type

function gtk_font_button_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_font_button_new:PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_font_button_new_with_font(fontname:Pchar):PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_font_button_get_title(font_button:PGtkFontButton):Pchar;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_font_button_set_title(font_button:PGtkFontButton; title:Pchar);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_font_button_get_modal(font_button:PGtkFontButton):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_font_button_set_modal(font_button:PGtkFontButton; modal:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_font_button_get_use_font(font_button:PGtkFontButton):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_font_button_set_use_font(font_button:PGtkFontButton; use_font:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_font_button_get_use_size(font_button:PGtkFontButton):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_font_button_set_use_size(font_button:PGtkFontButton; use_size:Tgboolean);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkFontButton, g_object_unref) }

// === Konventiert am: 9-7-26 19:45:32 ===

function GTK_TYPE_FONT_BUTTON : TGType;
function GTK_FONT_BUTTON(obj : Pointer) : PGtkFontButton;
function GTK_IS_FONT_BUTTON(obj : Pointer) : Tgboolean;

implementation

function GTK_TYPE_FONT_BUTTON : TGType;
  begin
    GTK_TYPE_FONT_BUTTON:=gtk_font_button_get_type;
  end;

function GTK_FONT_BUTTON(obj : Pointer) : PGtkFontButton;
begin
  Result := PGtkFontButton(g_type_check_instance_cast(obj, GTK_TYPE_FONT_BUTTON));
end;

function GTK_IS_FONT_BUTTON(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_FONT_BUTTON);
end;



end.
